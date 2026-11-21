package PlayLevels.amigoPancho.tela.bad
{
   public class ClassHeadBad extends ClassPartBad
   {
      
      private static var num:int;
      
      public function ClassHeadBad(param1:String)
      {
         super(param1);
         movie.f.stop();
      }
      
      public function playIspug() : void
      {
         movie.f.gotoAndPlay(2);
         if(++num == 3)
         {
            num = 1;
         }
         ControlSounds.playSound("mBadFall0" + num);
      }
      
      override public function destroy() : void
      {
         ControlSounds.stopSound("mBadFall01");
         ControlSounds.stopSound("mBadFall02");
         super.destroy();
      }
   }
}

