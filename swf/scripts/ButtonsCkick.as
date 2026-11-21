package
{
   public class ButtonsCkick
   {
      
      public function ButtonsCkick()
      {
         super();
      }
      
      public static function play() : void
      {
         ControlSounds.loadAndPlay("mClick01",1,1,true);
      }
   }
}

