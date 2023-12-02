with Filehandling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Text_Io;
procedure Day01a is
  List : Filehandling.Content.List;
  Tot  : Natural := 0;
begin
  Filehandling.Read("input_01a.dat", List);
  for Unbounded_Line of List loop
    declare
      Num : String(1..2);
      Line : String := To_String(Unbounded_Line);
    begin

      for C of Line loop
        case C is
          when '0' .. '9' =>
            Num(1) := C;
            exit;
          when others => null;
        end case;
      end loop;

      for C of reverse Line loop
        case C is
          when '0' .. '9' =>
            Num(2) := C;
            exit;
            when others => null;
        end case;
      end loop;

      Tot := Tot + Natural'Value(Num);
    end;

  end loop;
  Text_Io.Put_Line ("tot=" & Tot'Img);
end Day01a;
