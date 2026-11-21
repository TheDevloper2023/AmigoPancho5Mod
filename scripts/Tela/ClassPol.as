package Tela
{
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class ClassPol extends ClassLevelObject
   {
      
      public static var qq:int;
      
      public static var arrPols:Array = [];
      
      public function ClassPol(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForPol);
         arrPols.push(this);
      }
      
      public static function setTextureWithMask() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:Bitmap = null;
         var _loc3_:MovieClip = null;
         var _loc4_:ClassPol = null;
         if(arrPols.length)
         {
            _loc1_ = new Sprite();
            _loc2_ = ClassMath.getBitmapFromSprite(ClassLayers.spriteForPol);
            _loc1_.addChild(_loc2_);
            _loc3_ = ClassMath.getCopyMovie(amigo5.swfMoviesZ,"derevo");
            if(ClassBaseLevel.numLevel != 32)
            {
               _loc3_.gotoAndStop(1);
               if(ClassBaseLevel.numLevel > 15)
               {
                  _loc3_.gotoAndStop(2);
               }
            }
            else
            {
               _loc3_.gotoAndStop(int(ClassSetDataGame.getLastFon()));
            }
            ClassLayers.spriteForPol.addChild(_loc3_);
            ClassLayers.spriteForPol.addChild(_loc1_);
            _loc3_.cacheAsBitmap = true;
            _loc1_.cacheAsBitmap = true;
            _loc3_.mask = _loc1_;
            for each(_loc4_ in arrPols)
            {
               _loc4_.setObvodka();
            }
         }
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
         if(width < 6 || height < 6)
         {
            visible = false;
         }
      }
      
      override public function createPhysicShape() : void
      {
         if(!(this is ClassCircle))
         {
            setShapeBox(width + 5,height + 5);
         }
         setPhysicParametr();
         SetAngularDampingZero();
      }
      
      public function setObvodka() : void
      {
         setShad();
         setLight(6,3612706,6,1);
         getSpriteForLight().filters = [myGlow];
      }
      
      override public function destroy() : void
      {
         ClassMath.removeObjectFromArray(arrPols,this);
         super.destroy();
      }
   }
}

