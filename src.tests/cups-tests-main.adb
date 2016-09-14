with Cairo.PDF;
with Cairo.Surface;
with Ada.Command_Line;
with Ada.Text_IO;
with GNAT.OS_Lib;
with CUPS.CUPS;
procedure Cups.Tests.Main is
   Tmpfilename : constant String := "MUPP.ps";
   WIDTH       : constant := 595.0;
   HEIGHT      : constant := 842.0;
   Surface     : Cairo.Cairo_Surface := Cairo.PDF.Create
     (Filename         => Tmpfilename,
      Width_In_Points  => WIDTH,
      Height_In_Points => HEIGHT);

   Context   : Cairo.Cairo_Context := Cairo.Create (Surface);

begin
   -- Draw Some Text
   Cairo.Select_Font_Face (Cr => Context,
                           Family => "Arial Black",
                           Slant => Cairo.Cairo_Font_Slant_Normal,
                           Weight => Cairo.Cairo_Font_Weight_Normal);
   Cairo.Set_Font_Size (Cr => Context, Size => 30.0);
   Cairo.Show_Text (Cr => Context, Utf8 => Ada.Command_Line.Argument (1));


   -- finish up
   Cairo.Show_Page (Context);
   Cairo.Destroy (Context);
   Cairo.Surface.Flush (Surface);
   Cairo.Surface_Destroy (Surface);
   Ada.Text_IO.Put_Line (CUPS.GetDefault);
   Ada.Text_IO.Put_Line (CUPS.PrintFile (CUPS.GetDefault, Tmpfilename, "cairo PS")'Img);
end Cups.Tests.Main;
