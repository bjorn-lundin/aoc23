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

  type Color_Array is array (Color_Type'Range) of Natural ;
  type Sample_Record is record
    Num   : Color_Array := (others => 0);
  end record;

  package Samples is new Ada.Containers.Doubly_Linked_Lists(Sample_Record);

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
                  when '0' .. '9' => Append(Id,C);
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
               -- Text_Io.Put_Line( "games '" & Value & "'");
                --check for multi-fields
                String_Split.Create (S          => Subs,
                                     From       => Value,
                                     Separators => Seps,
                                     Mode       => String_Split.Multiple);
                for K in 1 .. String_Split.Slice_Count(Subs) loop
                  Text_Io.Put_Line(K'Img & " ---------start---------- ");
                  declare
                    Turns  : String := String_Split.Slice(Subs, K);
                    Idxs   : array (Color_Type'Range) of Natural := (others => 0);
                    Start  : Natural := 0;

                    First_Comma  : Natural := 0;
                    Second_Comma : Natural := 0;
                    Sample       : Sample_Record;

                  begin
                    Text_Io.Put_Line(K'Img & " '" & Turns & "'");
                    Idxs(Red) := Ada.Strings.Fixed.Index (Turns, "red");
                    Idxs(Green) := Ada.Strings.Fixed.Index (Turns, "green");
                    Idxs(Blue) := Ada.Strings.Fixed.Index (Turns, "blue");
                    Text_Io.Put_Line(K'Img & " index-on-line R/G/B" & Idxs(Red)'Img & Idxs(Green)'Img & Idxs(Blue)'Img );


                    First_Comma   := Ada.Strings.Fixed.Index (Turns, ",");
                    if First_Comma = 0 then
                      --one color only
                      null;
                    --  Text_Io.Put_Line(K'Img & "turns'first" & Turns'First'Img & " " & "turns'last" & Turns'Last'Img & " " & "first_comma" & First_Comma'Img );
                    else
                      Second_Comma  := Ada.Strings.Fixed.Index (Turns(First_Comma+1 .. Turns'Last), ",");
                    end if;
                    Text_Io.Put_Line(K'Img &  "first_comma" & First_Comma'Img & " second_comma" & Second_Comma'Img );

                    if First_Comma = 0
                      and then Second_Comma = 0
                    then
                      -- one color only
                      Text_Io.Put_Line(K'Img & "parse1 '" & Turns & "'" );
                      for Col in Color_Type'Range loop
                        if Idxs(Col) > 0 then
                          Text_Io.Put_Line(K'Img & "r11 " & Col'Img &  " '" & Turns(Turns'First.. Idxs(col)-1) & "'" );
                          Sample.Num(Col) := Natural'Value(Turns(Turns'First.. Idxs(col)-1));
                        end if;
                      end loop;


                    elsif First_Comma > 0
                      and then Second_Comma = 0
                    then
                      -- two colors

                      Text_Io.Put_Line(K'Img & "parse2 '" & Turns(Turns'First .. First_Comma -1) & "'" );
                      Text_Io.Put_Line(K'Img & "parse2 '" & Turns(First_Comma+1 .. Turns'Last) & "'" );

                      for Col in Color_Type'Range loop
                        if Idxs(Col) > 0
                          and then Idxs(Col) < First_Comma
                        then
                          Text_Io.Put_Line(K'Img & "r21 " & Col'Img &  " '" & Turns(Turns'First.. Idxs(col)-1) & "'" );
                          Sample.Num(Col) := Natural'Value(Turns(Turns'First.. Idxs(col)-1));
                        end if;
                      end loop;

                      --second

                      for Col in Color_Type'Range loop
                        if Idxs(Col) > 0
                          and then Idxs(Col) > First_Comma
                         -- and then Idxs(Col) < Second_Comma
                        then
                          Text_Io.Put_Line(K'Img & "r22 " & Col'Img &  " '" & Turns(First_Comma+1.. Idxs(col)-1) & "'" );
                          Sample.Num(Col) := Natural'Value(Turns(First_Comma+1 .. Idxs(col)-1));
                        end if;
                      end loop;


                    elsif First_Comma >0
                      and then Second_Comma >0 then
                      -- three colors
                      Text_Io.Put_Line(K'Img & "parse3 '" & Turns(Turns'First .. First_Comma -1) & "'" );
                      Text_Io.Put_Line(K'Img & "parse3 '" & Turns(First_Comma+1 .. Second_Comma -1) & "'" );
                      Text_Io.Put_Line(K'Img & "parse3 '" & Turns(Second_Comma+1 .. Turns'Last) & "'" );

                      for Col in Color_Type'Range loop
                        if Idxs(Col) > 0
                          and then Idxs(Col) < First_Comma
                        then
                          Text_Io.Put_Line(K'Img & "r31 " & Col'Img & " '" & Turns(Turns'First.. Idxs(col)-1) & "'");
                          Sample.Num(Col) := Natural'Value(Turns(Turns'First.. Idxs(col)-1));
                          Text_Io.Put_Line(K'Img & "r31 stop " & Col'Img);
                        end if;
                      end loop;

                      for Col in Color_Type'Range loop
                        if Idxs(Col) > 0
                          and then Idxs(Col) > First_Comma
                          and then Idxs(Col) < Second_Comma
                        then
                          Text_Io.Put_Line(K'Img & "r32 " & Col'Img & " '" & Turns(First_Comma+1.. Idxs(col)-1) & "'");
                          Sample.Num(Col) := Natural'Value(Turns(First_Comma+1 .. Idxs(col)-1));
                          Text_Io.Put_Line(K'Img & "r32 stop " & Col'Img);
                        end if;
                      end loop;

                      for Col in Color_Type'Range loop
                        if Idxs(Col) > 0
                          and then Idxs(Col) > Second_Comma
                        then
                          Text_Io.Put_Line(K'Img & "r33 " & Col'Img & " '" & Turns(Second_Comma+1.. Idxs(col)-1) & "'");
                          Sample.Num(Col) := Natural'Value(Turns(Second_Comma+1 .. Idxs(col)-1));
                          Text_Io.Put_Line(K'Img & "r33 stop " & Col'Img);
                        end if;
                      end loop;

                    --
                    else
                      raise Constraint_Error with "first comma" & First_Comma'Img & " second comma" & Second_Comma'Img;
                    end if;
                    G.Sample_List.Append(Sample);
                    --  Text_Io.Put_Line(Sample'Image);
                    --  Text_Io.Put_Line(G'Image);

                  end;
                  Text_Io.Put_Line(K'Img & " ---------stop---------- ");

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

  -----------------------------------------------------------

  Game : Game_Record;
  Ok : Boolean := True;
  Sum : Natural := 0;
begin
  Filehandling.Read("input_02a.dat", List);
  for Unbounded_Line of List loop
    declare
      Line : String := To_String(Unbounded_Line);
    begin
      Game := Parse(Line);
      Game_List.Append(Game);
      --     Tot := Tot + Natural'Value(Num);
    end;
  end loop;



  Text_Io.Put_Line("Game_List " & Game_List'Image);

  for G of Game_List loop
    for S of G.Sample_List loop
      Ok := S.Num(Red) <= 12
        and then S.Num(Green) <=13
        and then S.Num(Blue) <=14;
      exit when not Ok;
    end loop;

    Text_Io.Put_Line("game " & G.Gameid'Img & " is ok " & Ok'Img);
    if Ok then
      Sum := Sum + Natural(G.Gameid);
    end if;
  end loop;
  Text_Io.Put_Line("sum" & Sum'Img);



end Day02a;
