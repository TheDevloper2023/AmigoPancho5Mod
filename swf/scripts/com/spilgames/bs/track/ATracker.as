package com.spilgames.bs.track
{
   import com.spilgames.bs.BrandingManager;
   
   public class ATracker
   {
      
      protected var eventType:String = "custom";
      
      public function ATracker()
      {
         super();
      }
      
      public function custom(param1:String, param2:Object) : void
      {
         this.call(this.eventType + "." + param1,param2);
      }
      
      protected function call(param1:String, param2:Object = null, param3:Boolean = false) : void
      {
         BrandingManager.getInstance().trackEvent(param1,this.eventType,param2,param3);
      }
   }
}

