package PlayLevels.amigoPancho.tela
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ClassZemlya extends ClassLevelObject
   {
      
      public static var hh:int = 1;
      
      public var smesch:Number = 0;
      
      public var nameTexture:String = "chees";
      
      public function ClassZemlya(param1:String)
      {
         super(param1);
         arrPhysicParam = [0,0.5,0.2];
         setParentSprite(ClassLayers.spriteForDynamic);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         var _loc3_:Number = NaN;
         super.init(param1);
         var _loc2_:Number = width;
         _loc3_ = height;
         scaleX = 1;
         scaleY = 1;
         movie.width = _loc2_;
         movie.height = _loc3_;
         var _loc4_:Number = -width / 2;
         var _loc5_:Number = -height / 2;
         var _loc6_:MovieClip = this.getCopyMovie(this.nameTexture);
         _loc6_.gotoAndStop(4);
         var _loc7_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,null);
         _loc7_.draw(_loc6_);
         var _loc8_:Bitmap = this.getSliceImage(_loc7_,width,height,this.smesch);
         _loc8_.x = _loc4_;
         _loc8_.y = _loc5_;
         addChild(_loc8_);
         movie.alpha = 0;
         this.setObvodka();
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
      }
      
      public function setObvodka() : void
      {
         setShad();
         setLight(5,3485743,100,0.5);
         getSpriteForLight().filters = [myGlow,shadow];
      }
      
      private function getSliceImage(param1:BitmapData, param2:Number, param3:Number, param4:Number) : Bitmap
      {
         var _loc5_:BitmapData = new BitmapData(param2,param3,true,2895157);
         _loc5_.copyPixels(param1,new Rectangle(param4,0,param2,param3),new Point(0),null,null,true);
         var _loc6_:Bitmap = new Bitmap(_loc5_);
         _loc6_.smoothing = true;
         _loc6_.cacheAsBitmap = true;
         return _loc6_;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

