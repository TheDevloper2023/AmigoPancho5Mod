package com.spilgames.bs.track
{
   public class SpilEvent
   {
      
      public static const GAME_PAUSE:String = "spil_gamePause";
      
      public static const GAME_RESUME:String = "spil_gameResume";
      
      public function SpilEvent()
      {
         super();
      }
      
      public static function get gameplay() : GameplayTracker
      {
         return GameplayTracker.getInstance();
      }
      
      public static function get user() : UserTracker
      {
         return UserTracker.getInstance();
      }
      
      public static function get bussiness() : BussinessTracker
      {
         return BussinessTracker.getInstance();
      }
      
      public static function get quality() : QualityTracker
      {
         return QualityTracker.getInstance();
      }
      
      public static function trackCustomEvent() : void
      {
      }
   }
}

