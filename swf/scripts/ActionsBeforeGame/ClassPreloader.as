package ActionsBeforeGame
{
   import com.spilgames.api.SpilGamesServices;
   import com.spilgames.bs.BrandingManager;
   import com.spilgames.bs.comps.Logo;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.utils.getDefinitionByName;
   import mochi.as3.*;
   
   [SWF(width="690", height="460", backgroundColor="#fffffa", frameRate="40")]
   public dynamic class ClassPreloader extends MovieClip
   {
      
      public static var _mochiads_game_id:String;
      
      public static var slSites:Array = ["qaibo.com","narod.ru","ropbox","Adobe","gametrax.eu","fgl.com","flashgamelicense.com"];
      
      internal static var adBox:MovieClip = new MovieClip();
      
      public static var logo:Logo = new Logo();
      
      private static var spilGamesServices:SpilGamesServices = SpilGamesServices.getInstance();
      
      private static var brandingManager:BrandingManager = BrandingManager.getInstance();
      
      private var objectAssets:ApplicationAssetsPreload;
      
      private var movie:MovieClip;
      
      private var movieProgress:MovieClip;
      
      private var fieldTextPercent:TextField;
      
      private var isAds:Boolean = false;
      
      private var adBox:MovieClip = new MovieClip();
      
      private var percent:Number;
      
      private var urlStr:String;
      
      private var ad:DisplayObject;
      
      private var sp:Sprite;
      
      private var p:Number = 0;
      
      public function ClassPreloader()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
      }
      
      public static function requestOnGameAd(param1:Function) : void
      {
         brandingManager.requestOnGameAd(param1);
      }
      
      public static function getMoreGamesLink() : String
      {
         return brandingManager.getMoreGamesLink();
      }
      
      public static function getAddToSiteLink() : String
      {
         return brandingManager.getAddToSiteLink();
      }
      
      public static function getGameLink(param1:String) : String
      {
         return brandingManager.getGameLink(param1);
      }
      
      public static function getTrackedLink() : String
      {
         return brandingManager.getTrackedLink("https://www.facebook.com/A10com","A10Facebook");
      }
      
      public static function showLogo(param1:Sprite, param2:Number = -45, param3:Number = 2) : void
      {
         param1.addChild(logo);
         logo.x = param2;
         logo.y = param3;
         logo.alpha = 0;
         logo.addEventListener(Event.ENTER_FRAME,updateLogoUp);
      }
      
      public static function hideLogo() : void
      {
         logo.alpha = 1;
         logo.addEventListener(Event.ENTER_FRAME,updateLogoDown);
      }
      
      private static function updateLogoUp(param1:Event) : void
      {
         logo.alpha += 0.05;
         if(logo.alpha >= 1)
         {
            logo.removeEventListener(Event.ENTER_FRAME,updateLogoUp);
         }
      }
      
      private static function updateLogoDown(param1:Event) : void
      {
         logo.alpha -= 0.12;
         if(logo.alpha <= 0)
         {
            logo.removeEventListener(Event.ENTER_FRAME,updateLogoDown);
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         stop();
         removeEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         this.objectAssets = new ApplicationAssetsPreload();
         this.objectAssets.addEventListener(Event.INIT,this.preloading);
         this.objectAssets.init();
         spilGamesServices.connect(this,"1c7b4a63140e60558ae6d9f7e9a5aa5b",false);
         spilGamesServices.addEventListener(SpilGamesServices.SERVICES_READY,this.onServicesReady);
         brandingManager.addEventListener(SpilGamesServices.COMPONENTS_READY,this.onBrandingComponentsReady);
      }
      
      private function onBrandingComponentsReady(param1:Event) : void
      {
         brandingManager.removeEventListener(SpilGamesServices.COMPONENTS_READY,this.onBrandingComponentsReady);
         this.sp = new Sprite();
         var _loc2_:Loader = new Loader();
         var _loc3_:String = "http://spil.com/A10GenericBanner";
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         _loc2_.load(_loc4_);
         this.sp.addChild(_loc2_);
         this.sp.x = 202;
         this.sp.y = 100;
         this.sp.buttonMode = true;
         addChild(this.sp);
         this.sp.addEventListener(MouseEvent.CLICK,this.clickLogo);
      }
      
      private function clickLogo(param1:MouseEvent) : void
      {
         ClassLinks.goToGameLink("bannera10");
      }
      
      private function onServicesReady(param1:Event) : void
      {
         spilGamesServices.removeEventListener(SpilGamesServices.SERVICES_READY,this.onServicesReady);
      }
      
      private function preloading(param1:Event) : void
      {
         this.objectAssets.removeEventListener(Event.INIT,this.preloading);
         this.movie = new (this.objectAssets.getAssetClass("preLoader"))() as MovieClip;
         this.movie.gotoAndStop(1);
         addChild(this.movie);
         this.movie.version.text = ClassFlags.version;
         this.addListeners();
         this.movieProgress = this.movie.pr;
         this.movieProgress.stop();
         this.movieProgress.visible = true;
         this.fieldTextPercent = this.movie.percentText;
         this.fieldTextPercent.visible = true;
         this.movie.but_play.visible = false;
         this.urlStr = root.loaderInfo.loaderURL;
         if(this.search())
         {
            addEventListener(Event.ENTER_FRAME,this.update);
         }
         else
         {
            this.movie.gotoAndStop(2);
         }
      }
      
      private function update(param1:Event) : void
      {
         var _loc2_:int = this.movieProgress.currentFrame;
         var _loc3_:int = this.movieProgress.totalFrames;
         var _loc4_:Number = root.loaderInfo.bytesLoaded;
         var _loc5_:Number = root.loaderInfo.bytesTotal;
         var _loc6_:int = _loc4_ * 100 / _loc5_;
         var _loc7_:int = _loc4_ / _loc5_ * _loc3_;
         this.movieProgress.gotoAndStop(_loc7_);
         var _loc8_:String = String(_loc6_) + "%";
         this.fieldTextPercent.text = _loc8_;
         if(_loc2_ >= _loc3_)
         {
            removeEventListener(Event.ENTER_FRAME,this.update);
            if(ClassFlags.isStartFirstLevel == false)
            {
               this.movie.but_play.visible = true;
               this.movie.but_play.addEventListener(MouseEvent.CLICK,this.init);
            }
            else
            {
               this.init();
            }
         }
      }
      
      private function search() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < slSites.length)
         {
            if(this.checkDomain(slSites[_loc2_]))
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         var _loc3_:String = stage.loaderInfo.url.toString();
         if(_loc3_.indexOf("kaisergames.de") > -1 || _loc3_.indexOf("gamezhero.com") > -1 || _loc3_.indexOf("agame.com") > -1 || _loc3_.indexOf("xiaoyouxi.com") > -1 || _loc3_.indexOf("game.com.cn") > -1 || _loc3_.indexOf("game.asia") > -1 || _loc3_.indexOf("kongregate.com") > -1 || _loc3_.indexOf("armorgames.com") > -1 || _loc3_.indexOf("andkon.com") > -1 || _loc3_.indexOf("kit.com") > -1 || _loc3_.indexOf("addictinggames.com") > -1)
         {
            this.isAds = false;
         }
         if(_loc3_.indexOf("hoodamath.com") > -1 || _loc3_.indexOf("spele.nl") > -1 || _loc3_.indexOf("notdoppler.com") > -1 || _loc3_.indexOf("playhub") > -1 || _loc3_.indexOf("freeonlinegames.com") > -1 || _loc3_.indexOf("xiaoyouxi.cn") > -1)
         {
            this.isAds = false;
         }
         if(_loc3_.indexOf("gamezhero.com") > -1 || _loc3_.indexOf("cdn.kaisergames.de") > -1 || _loc3_.indexOf("box10.com") > -1 || _loc3_.indexOf("flashgames247.com") > -1)
         {
            this.isAds = false;
         }
         if(ClassFlags.isGameLocked == true)
         {
            return _loc1_;
         }
         return true;
      }
      
      private function checkDomain(param1:String) : Boolean
      {
         var _loc2_:String = stage.loaderInfo.url;
         if(_loc2_.indexOf(param1) > -1)
         {
            return true;
         }
         return false;
      }
      
      private function init(param1:Event = null) : void
      {
         this.movie.but_play.removeEventListener(MouseEvent.CLICK,this.init);
         if(this.sp)
         {
            this.sp.removeEventListener(MouseEvent.CLICK,this.clickLogo);
         }
         if(this.isAds)
         {
            if(ClassFlags.isCPM)
            {
               this.adBox.visible = false;
               this.ad.parent.removeChild(this.ad);
               this.ad = null;
               this.adBox.parent.removeChild(this.adBox);
               this.adBox = null;
            }
         }
         if(this.search() == false)
         {
            if(ClassFlags.isGameLocked)
            {
               this.movie.but_User.visible = true;
               this.movie.but_Admin.visible = true;
               this.movie.gotoAndStop(2);
            }
            else
            {
               this.movie.gotoAndStop(3);
            }
            return;
         }
         stage.quality = StageQuality.MEDIUM;
         this.destroy();
         var _loc2_:Class = Class(getDefinitionByName("amigo5"));
         var _loc3_:Object = new _loc2_();
         stage.addChild(_loc3_ as DisplayObject);
      }
      
      private function addListeners() : void
      {
      }
      
      private function removeListeners() : void
      {
         spilGamesServices.addEventListener(SpilGamesServices.SERVICES_READY,this.onServicesReady);
         brandingManager.addEventListener(SpilGamesServices.COMPONENTS_READY,this.onBrandingComponentsReady);
      }
      
      private function destroy() : void
      {
         this.removeListeners();
         removeChild(this.movie);
         this.objectAssets.destroy();
         this.fieldTextPercent = null;
         this.objectAssets = null;
         this.movieProgress = null;
         this.movie = null;
         logo.removeEventListener(Event.ENTER_FRAME,updateLogoUp);
         logo.removeEventListener(Event.ENTER_FRAME,updateLogoDown);
         while(numChildren)
         {
            removeChild(getChildAt(0));
         }
         nextFrame();
      }
      
      private function goSponsor(param1:MouseEvent) : void
      {
      }
   }
}

