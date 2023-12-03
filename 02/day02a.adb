with Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Containers.Doubly_Linked_Lists;
with Text_Io;
with Gnat; use Gnat;
with Gnat.String_Split;


with Filehandling;

procedure Day02a is
  List : Filehandling.Content.List;
  Tot  : Natural := 0;

  type Color_Type is (Red, Green, Blue);
  subtype Gameid_Type is Positive range 1 ..100;

  package Samples is new Ada.Containers.Doubly_Linked_Lists(Color_Type );

  type Game_Record is record
    Gameid      : Gameid_Type;
    Sample_List : Samples.List;
  end record;

  package Games is new Ada.Containers.Doubly_Linked_Lists(Game_Record);
  Game_List : Games.List;


  function Parse(Line : String) return Game_Record is
    G : Game_Record;
  begin
    declare
      use Gnat;
      Subs : Gnat.String_Split.Slice_Set;
      Seps : constant String := ":";
    begin
      Text_Io.Put_Line( "Line '" & Line & "'");
      --check for multi-fields
      String_Split.Create (S          => Subs,
                           From       => Line,
                           Separators => Seps,
                           Mode       => String_Split.Multiple);
      for J in 1 .. String_Split.Slice_Count(Subs) loop
        declare
          Value : String := String_Split.Slice(Subs, J);
          Id    : Unbounded_String;
        begin
          case J is
            when 1 => -- the id
              for C of Value loop
                case C is
                  when '0' .. '9' => Append(Id,c);
                  when others => null;
                end case;
              end loop;
              G.Gameid := Gameid_Type'Value(To_String(Id));

              -------------------

            when 2 => -- the samples
              --++--++--++--++--
              declare
                use Gnat;
                Subs : Gnat.String_Split.Slice_Set;
                Seps : constant String := ";";
              begin
                Text_Io.Put_Line( "games '" & Value & "'");
                --check for multi-fields
                String_Split.Create (S          => Subs,
                                     From       => Value,
                                     Separators => Seps,
                                     Mode       => String_Split.Multiple);
                for K in 1 .. String_Split.Slice_Count(Subs) loop
                  declare
                    Turn  : String := String_Split.Slice(Subs, K);
                    Idxs  : array (Color_Type'Range) of Natural := (others => 0);
                  begin
                    Idxs(Red) := Ada.Strings.Fixed.Index (Turn, "red");
                    Idxs(Green) := Ada.Strings.Fixed.Index (Turn, "green");
                    Idxs(Blue) := Ada.Strings.Fixed.Index (Turn, "blue");

                    if Idxs(Red) > 0 then
                      Text_Io.Put_Line("idx red" & Idxs(Red)'Img);
                    end if;
                    if Idxs(Green) > 0 then
                      Text_Io.Put_Line("idx green" & Idxs(Green)'Img);
                    end if;
                    if Idxs(Blue) > 0 then
                      Text_Io.Put_Line("idx blue" & Idxs(Blue)'Img);
                    end if;

                  end;
                end loop;
              end;

              --++--++--++--++--
            when others =>
              raise Constraint_Error with "J=" & J'Img;
          end case;


        end;
      end loop;
    end;

    return G;

  end Parse;



begin
  Filehandling.Read("input_02a.dat", List);
  for Unbounded_Line of List loop
    declare
      Line : String := To_String(Unbounded_Line);
      Game : Game_Record;
    begin
      Game := Parse(Line);
      Game_List.Append(Game);
 --     Tot := Tot + Natural'Value(Num);
      Text_Io.Put_Line("G " & Game'Image);
    end;

  end loop;
  Text_Io.Put_Line ("tot=" & Tot'Img);
end Day02a;
