with Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Containers.Doubly_Linked_Lists;
with Text_Io;
with Gnat; use Gnat;
with Gnat.String_Split;


with Filehandling;

procedure Day03a is
  List : Filehandling.Content.List;
  Tot  : Natural := 0;

  subtype Rowid_Type is Positive range 1 ..140;
  subtype ColId_Type is Positive range 1 ..140;
  subtype Board_Rowid_Type is Natural range 0 ..141;
  subtype Board_ColId_Type is Natural range 0 ..141;

  --let the board be sourranded of extra rows at top/bootm and extra cols at start/end of lines

  Global_Board : array(Board_Rowid_Type'Range, Board_ColId_Type'Range) of Character := (others => (others => ' '));

  type Partno_Record is record
    Row      : Rowid_Type ;
    Startcol : Colid_Type;
    Stopcol  : Colid_Type;
    Valid    : Boolean := False;
    Line     : String(Rowid_Type'Range) := (others => ' ');
  end record;

  package Partnos is new Ada.Containers.Doubly_Linked_Lists(Partno_Record);

  procedure Parse(L : in String ; Row : in Rowid_Type; List : in out Partnos.List) is
    type State_Type is (Start,Inpart);
    State : State_Type := Start;
    Col_Start : ColId_Type;
    Col_Stop : ColId_Type;
  begin
    Text_Io.Put_Line("R:" & Row'Img & " L'first" & L'First'Img & " L'last" & L'Last'Img);
    for I in L'Range loop
      case L(I) is

        when '0'.. '9' =>
          case State is

            when Start =>
              Text_Io.Put_Line("R:" & Row'Img & " I" & I'Img & " '" & L(i) & "'");
              Col_Start := I;
              State := Inpart;

            when Inpart =>
              -- line may end as a number
              if I = L'Last then
              declare
                Part : Partno_Record;
              begin
                Part := (Row      => Row,
                         Startcol => Col_Start,
                         Stopcol  => L'last,
                         Valid    => False,
                         Line     => L
                        );
                List.Append(Part);
              end ;
              end if;


          end case;

        when others =>

          case State is
            when Start =>
              null;

            when Inpart =>
              State := Start;
              Col_Stop := I -1;

              declare
                Part : Partno_Record;
              begin
                Part := (Row      => Row,
                         Startcol => Col_Start,
                         Stopcol  => Col_Stop,
                         Valid    => False,
                         Line     => L
                        );
                List.Append(Part);
              end ;

          end case;

      end case;
    end loop;

  end Parse;

  ----------------------------------------------------------
  function Is_Symbol (C : Character) return Boolean is
  begin
    case C is
    when '!' .. '-' | '/' | ':' .. '~' =>
      return True;

    when others                        =>
      return False;

    end case;
  end Is_Symbol;


  -----------------------------------------------------------
  procedure Check(P : in out Partno_Record) is

  begin
    Text_IO.Put_Line(P.Row'Img & " -> " & P.Line( P.Startcol.. P.Stopcol));
    R_Loop: for R in P.Row-1 .. P.Row +1 loop
      C_Loop: for C in P.Startcol -1 .. P.Stopcol +1 loop
        P.Valid := Is_Symbol(Global_Board(R,C));
        exit R_Loop when P.Valid;
      end loop C_Loop;
    end loop R_Loop;
end Check;



  -----------------------------------------------------------
  Sum_Partno : Natural := 0;
  Line_Counter : Rowid_Type := 1;
  Partno_List :  Partnos.List;
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
    Check(part);
    Text_IO.Put_Line(Part'Image);
    if Part.Valid then
      Sum_Partno := Sum_Partno + Natural'Value(Part.Line(Part.Startcol .. Part.Stopcol));
    end if;
  end loop;
  Text_IO.Put_Line("Sum_Partno:" & Sum_Partno'img);




end Day03a;
