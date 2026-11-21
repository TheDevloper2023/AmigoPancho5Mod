package com.spilgames.bs.track
{
   public class UserTracker extends ATracker
   {
      
      private static var _instance:UserTracker;
      
      public function UserTracker(param1:Private)
      {
         super();
         eventType = "user";
      }
      
      public static function getInstance() : UserTracker
      {
         if(!_instance)
         {
            _instance = new UserTracker(new Private());
         }
         return _instance;
      }
      
      public function id(param1:String) : void
      {
         call(SpilTrackEvent.USER_ID,{"userID":param1});
      }
      
      public function name(param1:String) : void
      {
         call(SpilTrackEvent.USER_NAME,{"value":param1});
      }
      
      public function firstName(param1:String) : void
      {
         call(SpilTrackEvent.USER_FIRST_NAME,{"firstname":param1});
      }
      
      public function middleName(param1:String) : void
      {
         call(SpilTrackEvent.USER_MIDDLE_NAME,{"value":param1});
      }
      
      public function lastName(param1:String) : void
      {
         call(SpilTrackEvent.USER_LAST_NAME,{"value":param1});
      }
      
      public function gender(param1:String) : void
      {
         call(SpilTrackEvent.USER_GENDER,{"value":param1});
      }
      
      public function locale(param1:String) : void
      {
         call(SpilTrackEvent.USER_LOCALE,{"value":param1});
      }
      
      public function __custom(param1:Object) : void
      {
         call(SpilTrackEvent.USER_CUSTOM,param1);
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
