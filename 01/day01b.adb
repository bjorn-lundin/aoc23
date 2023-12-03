with Filehandling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Text_Io;
with Ada.Strings ; use Ada.Strings ;
with Ada.Strings.Fixed;

procedure Day01b is
  List        : Filehandling.Content.List;
  Tot         : Natural := 0;

  procedure Written_Digit_Index(L     : String;
                                Dir   : Direction;
                                Index : out Natural ;
                                Value : out Natural)  is
    type Info_Record is record
      Idx : Natural := 0;
      Val : Natural := 0;
    end record;

    Index_Array           : array(1..9) of Info_Record := (others => ( 0,0));
    Least_Index_In_Line   : Natural := Natural'Last;
    Largest_Index_In_Line : Natural := Natural'First;
    Best_Index            : Natural := 0;
  begin
    for I in Index_Array'Range loop
      Index_Array(I).Val := I;

      case I is
        when 1 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "one",  Going => Dir);
        when 2 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "two",  Going => Dir);
        when 3 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "three", Going => Dir);
        when 4 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "four", Going => Dir);
        when 5 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "five", Going => Dir);
        when 6 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "six", Going => Dir);
        when 7 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "seven", Going => Dir);
        when 8 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "eight", Going => Dir);
        when 9 => Index_Array(I).Idx := Ada.Strings.Fixed.Index (L, "nine", Going => Dir);
      end case;
    end loop;

    case Dir is
      when Forward =>
        for I in Index_Array'Range loop
          if Index_Array(I).Idx < Least_Index_In_Line
            and then Index_Array(I).Idx > 0
          then
            Least_Index_In_Line := Index_Array(I).Idx;
            Best_Index := I;
          end if;
        end loop;

        if Least_Index_In_Line < Natural'Last
          and then Least_Index_In_Line > 0
        then
          Index := Index_Array(Best_Index).Idx;
          Value := Index_Array(Best_Index).Val;
        else
          Index := 0;
          Value := 0;
        end if;

      when Backward =>
        for I in Index_Array'Range loop
          if Index_Array(I).Idx > Largest_Index_In_Line
            and then Index_Array(I).Idx > 0
          then
            Largest_Index_In_Line := Index_Array(I).Idx;
            Best_Index := I;
          end if;
        end loop;

        if Largest_Index_In_Line >  0
        then
          Index := Index_Array(Best_Index).Idx;
          Value := Index_Array(Best_Index).Val;
        else
          Index := 0;
          Value := 0;
        end if;
    end case;

  end Written_Digit_Index;
  -----------------------------------------------

  Cnt         : Natural := 0;
begin
  Filehandling.Read("input_01a.dat", List);
  for Unbounded_Line of List loop
    Cnt := Cnt +1;
    declare
      Idx_Char_Array   : array(1..2) of Natural := (others => 0);
      Idx_Number_Array : array(1..2) of Natural := (others => 0);
      Num              : String(1..2);
      Line             : String := To_String(Unbounded_Line);
      Value            : Natural := 0;
    begin
      Text_Io.Put_Line("-----------------------------------------");
      Text_Io.Put_Line(Line);

      for I in Line'Range loop
        Num := (others => ' ');
        case Line(I) is
          when '0' .. '9' =>
            Idx_Number_Array(1) := I;
            Num(1) := Line(I);
            exit;
            when others => null;
        end case;
      end loop;

      Text_Io.Put_Line("first numeral forward digit '" & Num(1) & "' at idx " & Idx_Number_Array(1)'Img);

      Written_Digit_Index(Line, Forward, Idx_Char_Array(1), Value);

      Text_Io.Put_Line("first alfa forward digit '" & Value'Img & "' at idx " & Idx_Char_Array(1)'Img);

      if Idx_Char_Array(1) < Idx_Number_Array(1)
        and then Idx_Char_Array(1) > 0
      then
        Num(1) := Value'Img(2);
      end if;

      for I in reverse Line'Range loop
        case Line(I) is
          when '0' .. '9' =>
            Idx_Number_Array(2) := I;
            Num(2) := Line(I);
            exit;
            when others => null;
        end case;
      end loop;
      Text_Io.Put_Line("second numeral backward digit '" & Num(2) & "' at idx " & Idx_Number_Array(2)'Img);

      Written_Digit_Index(Line, Backward, Idx_Char_Array(2), Value);
      Text_Io.Put_Line("second alfa backward digit '" & Value'Img & "' at idx " & Idx_Char_Array(2)'Img);

      if Idx_Char_Array(2) > Idx_Number_Array(2)
        and then Idx_Char_Array(2) > 0
      then
        Num(2) := Value'Img(2);
      end if;
      Text_Io.Put_Line (Num);
      Tot := Tot + Natural'Value(Num);
    end;
  end loop;
  Text_Io.Put_Line ("tot=" & Tot'Img);
end Day01b;
