
with Text_Io;
with Ada.Io_Exceptions;

package body Filehandling is

  procedure Read(Filename : in String; List : in out Content.List) is
    F      : Text_Io.File_Type;
    Buffer : String (1.. 1000);
    Len    : Natural := 0;
  begin
    Text_Io.Open(File =>  F,
                 Mode =>  Text_Io.In_File,
                 Name =>  Filename  );
    loop
      Text_Io.Get_Line(F,Buffer,Len);
      List.Append(To_Unbounded_String(Buffer(1..Len)));
    end loop;

  exception
    when Ada.Io_Exceptions.End_Error =>
      Text_Io.Close(F);

  end Read;

end Filehandling;
