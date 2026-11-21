package com.spilgames.bs.track
{
   public class QualityTracker extends ATracker
   {
      
      private static var _instance:QualityTracker;
      
      public function QualityTracker(param1:Private)
      {
         super();
         eventType = "quality";
      }
      
      public static function getInstance() : QualityTracker
      {
         if(!_instance)
         {
            _instance = new QualityTracker(new Private());
         }
         return _instance;
      }
      
      public function performance(param1:String) : void
      {
         call(SpilTrackEvent.QUALITY_PERFORMANCE,{"msg":param1});
      }
      
      public function debug(param1:String) : void
      {
         call(SpilTrackEvent.QUALITY_DEBUG,{"msg":param1});
      }
      
      public function error(param1:String) : void
      {
         call(SpilTrackEvent.QUALITY_ERROR,{"msg":param1});
      }
      
      public function __custom(param1:Object) : void
      {
         call(SpilTrackEvent.QUALITY_CUSTOM,param1);
      }
   }
}

class Private
{
   
   public function Private()
   {
      super();
   }
}
