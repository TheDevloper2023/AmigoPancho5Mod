package
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.system.ApplicationDomain;
   
   public class ApplicationAssetsGame extends EventDispatcher
   {
      
      private var Asset:Class = ApplicationAssetsGame_Asset;
      
      private var appDomain:ApplicationDomain;
      
      public function ApplicationAssetsGame()
      {
         super();
      }
      
      public function init() : void
      {
         var _loc1_:Loader = new Loader();
         _loc1_.contentLoaderInfo.addEventListener(Event.INIT,this.assetsInitHandler);
         _loc1_.loadBytes(new this.Asset());
      }
      
      private function assetsInitHandler(param1:Event) : void
      {
         this.appDomain = param1.target.content.loaderInfo.applicationDomain;
         dispatchEvent(new Event(Event.INIT));
      }
      
      public function getAssetClass(param1:String) : Class
      {
         if(!this.appDomain.hasDefinition(param1))
         {
            trace("*Error*: There is no definition of class \'" + param1 + "\'");
            return null;
         }
         return this.appDomain.getDefinition(param1) as Class;
      }
   }
}

