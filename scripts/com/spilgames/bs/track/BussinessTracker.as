package com.spilgames.bs.track
{
   public class BussinessTracker extends ATracker
   {
      
      private static var _instance:BussinessTracker;
      
      public function BussinessTracker(param1:Private)
      {
         super();
         eventType = "bussiness";
      }
      
      public static function getInstance() : BussinessTracker
      {
         if(!_instance)
         {
            _instance = new BussinessTracker(new Private());
         }
         return _instance;
      }
      
      public function storeEntered() : void
      {
         call(SpilTrackEvent.BUSSINESS_STORE_ENTERED);
      }
      
      public function storeClosed() : void
      {
         call(SpilTrackEvent.BUSSINESS_STORE_CLOSED);
      }
      
      public function itemSelected(param1:String) : void
      {
         call(SpilTrackEvent.BUSSINESS_ITEM_SELECTED,{"item":param1});
      }
      
      public function itemCancelled(param1:String) : void
      {
         call(SpilTrackEvent.BUSSINESS_ITEM_CANCELLED,{"item":param1});
      }
      
      public function itemSuccessful(param1:String) : void
      {
         call(SpilTrackEvent.BUSSINESS_ITEM_SUCCESSFUL,{"item":param1});
      }
      
      public function itemFailed(param1:String) : void
      {
         call(SpilTrackEvent.BUSSINESS_ITEM_FAILED,{"item":param1});
      }
      
      public function __custom(param1:Object) : void
      {
         call(SpilTrackEvent.BUSSINESS_CUSTOM,param1);
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
