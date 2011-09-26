-------------------------------------------------------------------------------
--                                                                           --
--                            Sierpinski Triangle                            --
--                                                                           --
--                         Sierpinski_Triangle.adb                           --
--                                                                           --
--                                  BODY                                     --
--                                                                           --
--                   Copyright (C) 1996 Ulrik Hørlyk Hjort                   --
--                                                                           --
--  Sierpinski Triangle is free software;  you can  redistribute it          --
--  and/or modify it under terms of the  GNU General Public License          --
--  as published  by the Free Software  Foundation;  either version 2,       --
--  or (at your option) any later version.                                   --
--  Sierpinski Triangle is distributed in the hope that it will be           --
--  useful, but WITHOUT ANY WARRANTY;  without even the  implied warranty    --
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                  --
--  See the GNU General Public License for  more details.                    --
--  You should have  received  a copy of the GNU General                     --
--  Public License  distributed with Yolk.  If not, write  to  the  Free     --
--  Software Foundation,  51  Franklin  Street,  Fifth  Floor, Boston,       --
--  MA 02110 - 1301, USA.                                                    --
--                                                                           --
-------------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Discrete_Random; use Ada.Numerics;


package body Sierpinski_Triangle is

   procedure Generate is

      subtype Random_Interval is Positive range 1..3;
      package Dice is new Discrete_Random(Random_Interval);
      use Dice;

      G                    : Generator;
      DiceVal              : Random_Interval;
      Number_Of_Iterations : constant Positive := 100000;

      Ax                   : constant Float    := 500.0;
      Ay                   : constant Float    := 1000.0;

      Bx                   : constant Float    := 1.0;
      By                   : constant Float    := 1.0;

      Cx                   : constant Float    := 1000.0;
      Cy                   : constant Float    := 1.0;

      Px                   : Float             := 50.0;
      Py                   : Float             := 50.0;

   begin
      for Iterations in 1 .. Number_Of_Iterations loop
         DiceVal := Random(G);

         case DiceVal is
            when 1 =>
               Px := abs((Ax+Px) / 2.0);
               Py := abs((Ay+Py) / 2.0);
            when 2 =>
               Px := abs((Bx+Px) / 2.0);
               Py := abs((By+Py) / 2.0);
            when 3 =>
               Px := abs((Cx+Px) / 2.0);
               Py := abs((Cy+Py) / 2.0);
         end case;

         Put(Item => Px, EXP =>0);
         Put(" ");
         Put(Item => Py, EXP =>0);
         New_Line;

      end loop;
   end Generate;
end Sierpinski_Triangle;
