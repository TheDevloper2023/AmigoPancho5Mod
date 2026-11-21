package com.spilgames.bs
{
   import com.spilgames.api.SpilGamesServices;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class BrandingManager extends EventDispatcher
   {
      
      private static var _instance:BrandingManager;
      
      public static const BRANDING_READY:String = "brandingReady";
      
      public static const DEFAULT_MORE_GAMES_LINK:String = "http://www.agame.com";
      
      private var _brandingSystem:*;
      
      private var _componentsReady:Boolean = false;
      
      public function BrandingManager(param1:Private = null)
      {
         super();
         this.initConstructor(param1);
      }
      
      public static function getInstance() : BrandingManager
      {
         if(!_instance)
         {
            _instance = new BrandingManager(new Private());
         }
         return _instance;
      }
      
      public function createComponent(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = null;
         if(Boolean(param1) && param1 != "")
         {
            if(this._componentsReady)
            {
               try
               {
                  _loc2_ = this._brandingSystem.createComponent(param1);
               }
               catch(e:Error)
               {
               }
            }
         }
         return _loc2_;
      }
      
      public function isAvailable() : Boolean
      {
         return this.isReady();
      }
      
      public function isReady() : Boolean
      {
         return this._componentsReady;
      }
      
      public function getAddToSiteLink() : String
      {
         return this._brandingSystem.getAddToSiteLink();
      }
      
      public function getMoreGamesLink() : String
      {
         var _loc1_:String = DEFAULT_MORE_GAMES_LINK;
         if(this.isReady() && Boolean(this._brandingSystem))
         {
            _loc1_ = this._brandingSystem.getMoreGamesLink();
         }
         return _loc1_;
      }
      
      public function getGameLink(param1:String) : String
      {
         var _loc2_:String = DEFAULT_MORE_GAMES_LINK;
         if(this.isReady() && Boolean(this._brandingSystem))
         {
            _loc2_ = this._brandingSystem.getGameLink(param1);
         }
         return _loc2_;
      }
      
      public function isSplashscreenAllowed() : Boolean
      {
         var _loc1_:Boolean = true;
         if(this.isReady() && Boolean(this._brandingSystem))
         {
            _loc1_ = Boolean(this._brandingSystem.isSplashscreenAllowed());
         }
         return _loc1_;
      }
      
      public function isSplashscreenClickable() : Boolean
      {
         var _loc1_:Boolean = true;
         if(this.isReady() && Boolean(this._brandingSystem))
         {
            _loc1_ = Boolean(this._brandingSystem.isSplashscreenClickable());
         }
         return _loc1_;
      }
      
      public function getTrackedLink(param1:String, param2:String) : String
      {
         var _loc3_:String = null;
         if(this.isReady() && Boolean(this._brandingSystem))
         {
            _loc3_ = this._brandingSystem.getTrackedLink(param1,param2);
         }
         return _loc3_;
      }
      
      public function getLocalizedString(param1:String, param2:String = "SpilGames_Game") : String
      {
         var _loc3_:Object = this._brandingSystem.getString(param1,param2);
         return _loc3_.value;
      }
      
      public function getLocalizedObject(param1:String, param2:String = "SpilGames_Game") : Object
      {
         return this._brandingSystem.getString(param1,param2);
      }
      
      public function showBrandingBar() : Boolean
      {
         return this._brandingSystem.showBrandingBar();
      }
      
      public function hideBrandingBar() : Boolean
      {
         return this._brandingSystem.hideBrandingBar();
      }
      
      public function getCurrentLanguage() : String
      {
         return this._brandingSystem.getCurrentLanguage();
      }
      
      public function setLanguage(param1:String) : void
      {
         this._brandingSystem.setLanguage(param1);
      }
      
      public function getPortalGroup() : uint
      {
         var _loc1_:uint = 1;
         if(this.isReady() && Boolean(this._brandingSystem))
         {
            _loc1_ = uint(this._brandingSystem.portalGroup);
         }
         return _loc1_;
      }
      
      public function requestOnGameAd(param1:Function) : void
      {
         if(SpilGamesServices.getInstance().isReady())
         {
            this._brandingSystem.requestOnGameAd(SpilGamesServices.getInstance().parent,param1);
         }
         else
         {
            param1();
         }
      }
      
      public function confirmPause() : void
      {
         if(SpilGamesServices.getInstance().isReady())
         {
            this._brandingSystem.confirmPause();
         }
      }
      
      public function trackEvent(param1:String, param2:String, param3:Object, param4:Boolean = false) : void
      {
         if(SpilGamesServices.getInstance().isReady() && !SpilGamesServices.getInstance().isDebugMode())
         {
            this._brandingSystem.trackEvent(SpilGamesServices.getInstance().parent,param1,param2,param3,param4);
         }
      }
      
      private function initConstructor(param1:Private) : void
      {
         if(!param1)
         {
            throw new Error("Cannot instantiate this class directly. Use BrandingManager.getInstance() instead.");
         }
         SpilGamesServices.getInstance().addEventListener(SpilGamesServices.COMPONENTS_READY,this.onComponentsReady);
      }
      
      private function onComponentsReady(param1:Event) : void
      {
         try
         {
            this._brandingSystem = SpilGamesServices.getInstance().connection.getComponentSystem(BrandingComponentTypes.BRAND_SYSTEM);
            this._brandingSystem.flashVars = SpilGamesServices.getInstance().flashVars;
            if(!this._brandingSystem)
            {
               return;
            }
            this._brandingSystem.addEventListener(BRANDING_READY,this.brandingReady);
            if(SpilGamesServices.getInstance().flashVars.siteID > 0)
            {
               this._brandingSystem.useGoogleAnalytics = false;
            }
            SpilGamesServices.getInstance().connection.addEventListener(SpilGamesServices.LOCALE_CHANGED,this.onLocaleChanged);
            this._componentsReady = true;
            dispatchEvent(new Event(SpilGamesServices.COMPONENTS_READY,true));
         }
         catch(e:Error)
         {
         }
      }
      
      private function brandingReady(param1:Event) : void
      {
         dispatchEvent(new Event(BRANDING_READY));
      }
      
      private function onLocaleChanged(param1:Event) : void
      {
         if(hasEventListener(SpilGamesServices.LOCALE_CHANGED))
         {
            dispatchEvent(new Event(SpilGamesServices.LOCALE_CHANGED));
         }
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
