
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
package Filehandling is


  package Content is new Ada.Containers.
    Doubly_Linked_Lists(Unbounded_String);

  procedure Read(Filename : in String; List : in out Content.List);

end Filehandling;

