with Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Containers.Doubly_Linked_Lists;
with Text_Io;
with Gnat; use Gnat;
with Gnat.String_Split;


with Filehandling;

procedure Day03b is
  List : Filehandling.Content.List;
  Tot  : Natural := 0;

  subtype Rowid_Type is Positive range 1 ..140;
  subtype ColId_Type is Positive range 1 ..140;
  subtype Board_Rowid_Type is Natural range 0 ..141;
  subtype Board_ColId_Type is Integer range -2 ..143;

  --let the board be sourranded of extra rows at top/bootm and extra cols at start/end of lines

  Global_Board : array(Board_Rowid_Type'Range, Board_ColId_Type'Range) of Character := (others => (others => ' '));

  type Star_Record is record
    Row        : Rowid_Type ;
    Starpos    : Colid_Type;
    Line       : String(Rowid_Type'Range) := (others => ' ');
  end record;

  package Pkg_Starpos is new Ada.Containers.Doubly_Linked_Lists(Star_Record);

  procedure Parse(L : in String ; Row : in Rowid_Type; List : in out Pkg_Starpos.List) is
  begin
    Text_Io.Put_Line("R:" & Row'Img & " L'first" & L'First'Img & " L'last" & L'Last'Img);

    for I in L'Range loop
      case L(I) is
        when '*' =>
          declare
            Star : Star_Record;
          begin
            Star := (Row      => Row,
                     Starpos  => I,
                     Line     => L
                    );
            List.Append(Star);
          end ;


        when others =>
          null;

      end case;

    end loop;

  end Parse;

  ----------------------------------------------------------
  --  function Is_Symbol (C : Character) return Boolean is
  --  begin
  --    case C is
  --    when '!' .. '-' | '/' | ':' .. '~' =>
  --      return True;
  --
  --    when others                        =>
  --      return False;
  --
  --    end case;
  --  end Is_Symbol;

  function Is_Digit (C : Character) return Boolean is
  begin
    case C is
    when '0' .. '9'  =>
      return True;

    when others      =>
      return False;

    end case;
  end Is_Digit;


  -----------------------------------------------------------
  procedure Check(P : in out Star_Record) is

  begin
      Text_IO.New_Line;
    R_Loop: for R in P.Row -1 .. P.Row +1 loop
      C_Loop: for C in P.Starpos -3 .. P.Starpos +3 loop
        Text_IO.Put (Global_Board(R,C));
      end loop C_Loop;
      Text_IO.New_Line;
    end loop R_Loop;
    Text_IO.Put_Line ("-----------------------------");
  end Check;



  -----------------------------------------------------------
  Sum_Partno   : Natural := 0;
  Line_Counter : Rowid_Type := 1;
  Partno_List  :  Pkg_Starpos.List;
begin
  Filehandling.Read("input_03a.dat", List);
  for Unbounded_Line of List loop
    declare
      Line : String := To_String(Unbounded_Line);
    begin
      for J in ColId_Type'Range loop
        Global_Board(Line_Counter, J) := Line(J);
      end loop;
      Parse(Line,Line_Counter,Partno_List);
      if Line_Counter < Rowid_Type'Last then
        Line_Counter := Line_Counter +1;
      end if;
    end;
  end loop;

  for Partno of Partno_List loop
    Text_IO.Put_Line(Partno'Image);
  end loop;
  Text_IO.Put_Line(Global_Board'Image);

  for Part of Partno_List loop
    Check(Part);
--    Text_IO.Put_Line(Part'Image);

  end loop;
  Text_IO.Put_Line("Sum_Partno:" & Sum_Partno'Img);




end Day03b;
