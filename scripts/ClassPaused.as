package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ClassPaused
   {
      
      private static var movie:MovieClip;
      
      public static var isPaused:Boolean;
      
      public function ClassPaused()
      {
         super();
      }
      
      public static function show(param1:Sprite) : void
      {
         var _loc2_:Class = null;
         if(isPaused == false)
         {
            _loc2_ = amigo5.swfMoviesInterface.getAssetClass("game_paused");
            movie = new _loc2_();
            param1.addChild(movie);
            movie.addEventListener(MouseEvent.CLICK,hide);
            isPaused = true;
            ControlSounds.setValumeAllMusicsToZero();
            ControlSounds.stopAllSounds();
         }
      }
      
      public static function hide(param1:MouseEvent) : void
      {
         if(isPaused == true)
         {
            movie.removeEventListener(MouseEvent.CLICK,hide);
            movie.parent.removeChild(movie);
            movie = null;
            isPaused = false;
            ControlSounds.setValumeAllMusicsToBackFromZero();
         }
      }
   }
}

