package PlayLevels.amigoPancho
{
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import flash.display.Sprite;
   
   public class ClassLayers extends ClassBasePhysicLevel
   {
      
      public static var spriteForKaktGorsh:Sprite;
      
      public static var spriteForBee:Sprite;
      
      public static var spriteForRocket:Sprite;
      
      public static var spriteForPerformers:Sprite;
      
      public static var spriteForDynamic:Sprite;
      
      public static var spriteForPol:Sprite;
      
      public static var spriteForSwitch:Sprite;
      
      public static var spriteForBgRocket:Sprite;
      
      public static var spriteForStatPic:Sprite;
      
      public static var spriteForSuperStat:Sprite;
      
      public static var spriteForCloud:Sprite;
      
      public static var spriteForKaktus:Sprite;
      
      public static var spriteForAmigo:Sprite;
      
      public static var spriteForStatic:Sprite;
      
      public static var spriteForFire:Sprite;
      
      public static var spriteForBoom:Sprite;
      
      public static var spriteForBlockElement:Sprite;
      
      public static var spriteForMouse:Sprite;
      
      public static var spriteLevel:Sprite;
      
      public static var spriteForHint:Sprite;
      
      public static var spriteForPesok:Sprite;
      
      public static var spriteForVeter:Sprite;
      
      public var isShowLevelHint:Boolean;
      
      private var isUnvisPer:Boolean;
      
      public function ClassLayers()
      {
         this.createLayers();
         super();
         this.addLayers();
      }
      
      private function createLayers() : void
      {
         spriteForPol = new Sprite();
         spriteForKaktGorsh = new Sprite();
         spriteForBee = new Sprite();
         spriteForKaktus = new Sprite();
         spriteForStatPic = new Sprite();
         spriteForDynamic = new Sprite();
         spriteForDynamic.mouseEnabled = false;
         spriteForDynamic.mouseChildren = false;
         spriteForCloud = new Sprite();
         spriteForRocket = new Sprite();
         spriteForBgRocket = new Sprite();
         spriteForSwitch = new Sprite();
         spriteForPerformers = new Sprite();
         spriteForAmigo = new Sprite();
         spriteForStatic = new Sprite();
         spriteForFire = new Sprite();
         spriteForBoom = new Sprite();
         spriteForHint = new Sprite();
         spriteForPesok = new Sprite();
         spriteForVeter = new Sprite();
         spriteLevel = this;
         spriteForMouse = new Sprite();
         spriteForMouse.graphics.beginFill(0);
         spriteForMouse.graphics.drawRect(0,0,690,460);
         spriteForMouse.graphics.endFill();
         spriteForMouse.alpha = 0;
         spriteForMouse.mouseEnabled = true;
         spriteForSuperStat = new Sprite();
         spriteForBlockElement = new Sprite();
         spriteForSuperStat.mouseEnabled = false;
         spriteForSuperStat.mouseChildren = false;
      }
      
      private function addLayers() : void
      {
         addChild(spriteForVeter);
         addChild(spriteForVeter);
         addChild(spriteForPesok);
         addChild(spriteForStatPic);
         addChild(spriteForPol);
         addChild(spriteForBgRocket);
         addChild(spriteForDynamic);
         addChild(spriteForKaktus);
         addChild(spriteForBee);
         addChild(spriteForMouse);
         addChild(spriteForRocket);
         addChild(spriteForPerformers);
         addChild(spriteForStatic);
         addChild(spriteForKaktGorsh);
         addChild(spriteForAmigo);
         addChild(spriteForBlockElement);
         addChild(spriteForFire);
         addChild(spriteForSuperStat);
         addChild(spriteForSwitch);
         addChild(spriteForCloud);
         addChild(spriteForBoom);
         addChild(spriteForHint);
         spriteForHint.mouseEnabled = false;
         spriteForHint.mouseChildren = false;
      }
      
      private function removeLayers() : void
      {
         removeChild(spriteForVeter);
         spriteForVeter = null;
         removeChild(spriteForAmigo);
         spriteForAmigo = null;
         removeChild(spriteForStatic);
         spriteForStatic = null;
         removeChild(spriteForKaktGorsh);
         spriteForKaktGorsh = null;
         removeChild(spriteForRocket);
         spriteForRocket = null;
         removeChild(spriteForBee);
         spriteForBee = null;
         removeChild(spriteForPerformers);
         spriteForPerformers = null;
         removeChild(spriteForPol);
         spriteForPol = null;
         removeChild(spriteForStatPic);
         spriteForStatPic = null;
         removeChild(spriteForDynamic);
         spriteForDynamic = null;
         removeChild(spriteForCloud);
         spriteForCloud = null;
         removeChild(spriteForSwitch);
         spriteForSwitch = null;
         removeChild(spriteForBgRocket);
         spriteForBgRocket = null;
         removeChild(spriteForKaktus);
         spriteForKaktus = null;
         removeChild(spriteForFire);
         spriteForFire = null;
         removeChild(spriteForBoom);
         spriteForBoom = null;
         removeChild(spriteForSuperStat);
         spriteForSuperStat = null;
         removeChild(spriteForBlockElement);
         spriteForBlockElement = null;
         removeChild(spriteForMouse);
         spriteForMouse = null;
         removeChild(spriteForHint);
         spriteForHint = null;
         removeChild(spriteForPesok);
         spriteForPesok = null;
      }
      
      override public function destroy() : void
      {
         ControlSounds.stopAllSounds();
         this.isShowLevelHint = false;
         super.destroy();
         this.removeLayers();
      }
   }
}

