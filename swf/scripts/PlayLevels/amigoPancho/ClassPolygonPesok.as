package PlayLevels.amigoPancho
{
   import Box2D.Common.Math.b2Vec2;
   import Box2DSeparator.b2Separator;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.Hints.ClassHint;
   import com.logicom.geom.ClipType;
   import com.logicom.geom.Clipper;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class ClassPolygonPesok extends ClassLevelObject
   {
      
      private static var spriteForPolygon:Sprite;
      
      private static var worldScale:Number;
      
      private static var maskaPols:Sprite;
      
      private static var moviePicTextura:MovieClip;
      
      private static var movieKont1:ClassKontSfer;
      
      private static var isStart:Boolean;
      
      private static var lastCenter:Point;
      
      private static var isActive:Boolean;
      
      private static var objectLastik:ClassLastik;
      
      private static var isWasNextHint:Boolean;
      
      public static var arrPolygons:Array = [];
      
      public static var arrNewPolygons:Array = [];
      
      public static var radius:Number = 20;
      
      private var isNew:Boolean;
      
      public var arrVertex:Array;
      
      public function ClassPolygonPesok(param1:String = "")
      {
         super(param1);
         arrPolygons.push(this);
         isPhysic = false;
         this.arrVertex = [];
      }
      
      public static function create() : void
      {
         isWasNextHint = false;
         if(arrPolygons.length)
         {
            movieKont1 = new ClassKontSfer();
            ClassLayers.spriteForPesok.addChild(movieKont1);
            spriteForPolygon = new Sprite();
            lastCenter = null;
            isStart = false;
            isActive = true;
            worldScale = ClassBasePhysicLevel.m_physScale;
            moviePicTextura = ClassMath.getCopyMovie(amigo5.swfMoviesZ,"derevo");
            moviePicTextura.gotoAndStop(4);
            ClassLayers.spriteForPesok.addChild(spriteForPolygon);
            objectLastik = new ClassLastik();
            objectLastik.setScale(0.95,0.95);
            ClassLayers.spriteForPol.addChild(objectLastik);
            objectLastik.init();
            objectLastik.visible = false;
            arrNewPolygons = arrPolygons;
            createPolygons();
            ClassLayers.spriteForMouse.addEventListener(MouseEvent.MOUSE_DOWN,md);
            amigo5.mainStage.addEventListener(MouseEvent.MOUSE_UP,mu);
            ClassHoleInPesok.setHolls();
         }
      }
      
      private static function md(param1:MouseEvent) : void
      {
         if(arrPolygons.length > 1)
         {
            isStart = true;
            objectLastik.visible = true;
         }
      }
      
      private static function mu(param1:MouseEvent = null) : void
      {
         isStart = false;
         lastCenter = null;
         arrNewPolygons = [];
         objectLastik.visible = false;
      }
      
      public static function update() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         if(isStart)
         {
            if(arrPolygons.length > 1)
            {
               _loc1_ = new Point(Math.round(amigo5.mainStage.mouseX) as int,Math.round(amigo5.mainStage.mouseY) as int);
               objectLastik.setPosition(_loc1_.x,_loc1_.y);
               _loc2_ = ClassMath.getPointsCircle(10,_loc1_,radius);
               if(lastCenter)
               {
                  _loc3_ = ClassMath.getDistansFromToPoints(_loc1_,lastCenter);
                  if(_loc3_ > 10)
                  {
                     movieKont1.setPosition(_loc1_.x,_loc1_.y);
                     movieKont1.rotation = ClassMath.getAngleFrom2Points2(_loc1_,lastCenter);
                     _loc4_ = movieKont1.getPointsMark();
                     movieKont1.setPosition(lastCenter.x,lastCenter.y);
                     movieKont1.rotation = ClassMath.getAngleFrom2Points2(lastCenter,_loc1_);
                     _loc5_ = movieKont1.getPointsMark();
                     _loc2_ = _loc4_.concat(_loc5_);
                  }
               }
               action(_loc2_,true);
               lastCenter = _loc1_;
            }
            else
            {
               objectLastik.visible = false;
            }
         }
      }
      
      public static function action(param1:Array, param2:Boolean = false) : void
      {
         var _loc6_:ClassPolygonPesok = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:ClassPolygonPesok = null;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:* = int(arrPolygons.length - 1);
         while(_loc5_ >= 0)
         {
            _loc6_ = arrPolygons[_loc5_];
            _loc7_ = Clipper.clipPolygon(_loc6_.arrVertex,param1,ClipType.DIFFERENCE);
            if(_loc7_.length != 1 || getIsSamePoints(_loc6_.arrVertex,_loc7_[0]) == false)
            {
               _loc6_.destroy();
               _loc8_ = 0;
               while(_loc8_ < _loc7_.length)
               {
                  _loc9_ = _loc7_[_loc8_];
                  if(getPerim(_loc9_) > 15)
                  {
                     _loc10_ = new ClassPolygonPesok();
                     _loc10_.arrVertex = _loc9_;
                     arrNewPolygons.push(_loc10_);
                  }
                  _loc8_++;
               }
               if(_loc7_.length != 1)
               {
                  _loc4_ = true;
               }
               _loc3_ = true;
            }
            _loc5_--;
         }
         if(_loc3_)
         {
            createPolygons();
            arrNewPolygons = [];
            ClassBasePhysicLevel.world.ClearForces();
            if(param2 && isWasNextHint == false && _loc4_)
            {
               ClassHint.hideCur(false);
               isWasNextHint = true;
            }
            ControlSounds.playSound("mErase",1,1,false);
         }
      }
      
      private static function getPerim(param1:Array) : Number
      {
         var _loc2_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Boolean = false;
         var _loc3_:Number = 0;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc4_ = param1[_loc6_] as Point;
            if(_loc2_ != null)
            {
               _loc3_ += ClassMath.getDistansFromToPoints(_loc2_,_loc4_);
            }
            _loc2_ = _loc4_;
            _loc6_++;
         }
         return _loc3_ + ClassMath.getDistansFromToPoints(_loc4_,param1[0] as Point);
      }
      
      private static function getIsSamePoints(param1:Array, param2:Array) : Boolean
      {
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         if(param1.length != param2.length)
         {
            return false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = param2[_loc3_];
            if(ClassMath.isPointsEqual(_loc4_,_loc5_) == false)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      private static function createPhysicPolygon(param1:ClassPolygonPesok) : void
      {
         var _loc2_:b2Separator = new b2Separator();
         param1.createBodyWithFixture();
         var _loc3_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         var _loc4_:Number = 0;
         while(_loc4_ < param1.arrVertex.length)
         {
            _loc3_.push(new b2Vec2(param1.arrVertex[_loc4_].x / worldScale,param1.arrVertex[_loc4_].y / worldScale));
            _loc4_++;
         }
         _loc2_.Separate(param1.body,param1.fixture,_loc3_,30);
      }
      
      private static function createPolygons() : void
      {
         var _loc1_:ClassPolygonPesok = null;
         var _loc2_:ClassPolygonPesok = null;
         spriteForPolygon.graphics.clear();
         for each(_loc1_ in arrPolygons)
         {
            drawPolygon(_loc1_,255);
         }
         for each(_loc2_ in arrNewPolygons)
         {
            createPhysicPolygon(_loc2_);
         }
         if(Boolean(maskaPols) && Boolean(maskaPols.parent))
         {
            maskaPols.parent.removeChild(maskaPols);
         }
         maskaPols = new Sprite();
         var _loc3_:Bitmap = ClassMath.getBitmapFromSprite(spriteForPolygon);
         maskaPols.addChild(_loc3_);
         ClassLayers.spriteForPesok.addChild(moviePicTextura);
         ClassLayers.spriteForPesok.addChild(maskaPols);
         moviePicTextura.cacheAsBitmap = true;
         maskaPols.cacheAsBitmap = true;
         moviePicTextura.mask = maskaPols;
         setObvodka();
         arrNewPolygons = [];
      }
      
      public static function setObvodka() : void
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 9918976;
         _loc1_.blurX = 6;
         _loc1_.blurY = 6;
         _loc1_.alpha = 1;
         _loc1_.strength = 6;
         ClassLayers.spriteForPesok.filters = [_loc1_];
      }
      
      private static function drawPolygon(param1:ClassPolygonPesok, param2:Number) : void
      {
         var _loc4_:Point = null;
         var _loc5_:int = 0;
         spriteForPolygon.graphics.beginFill(param2);
         var _loc3_:int = int(param1.arrVertex.length);
         if(_loc3_ > 2)
         {
            _loc4_ = param1.arrVertex[0];
            spriteForPolygon.graphics.moveTo(_loc4_.x,_loc4_.y);
            _loc5_ = 1;
            while(_loc5_ <= _loc3_)
            {
               _loc4_ = param1.arrVertex[_loc5_ % _loc3_];
               spriteForPolygon.graphics.lineTo(_loc4_.x,_loc4_.y);
               _loc5_++;
            }
         }
      }
      
      public static function destroyAll() : void
      {
         var _loc1_:* = 0;
         var _loc2_:ClassPolygonPesok = null;
         if(isActive)
         {
            ClassLayers.spriteForMouse.removeEventListener(MouseEvent.MOUSE_DOWN,md);
            amigo5.mainStage.removeEventListener(MouseEvent.MOUSE_UP,mu);
            _loc1_ = int(arrPolygons.length - 1);
            while(_loc1_ >= 0)
            {
               _loc2_ = arrPolygons[_loc1_];
               _loc2_.destroy();
               _loc1_--;
            }
            if(maskaPols)
            {
               maskaPols.parent.removeChild(maskaPols);
            }
            if(moviePicTextura)
            {
               moviePicTextura.parent.removeChild(moviePicTextura);
            }
            spriteForPolygon.parent.removeChild(spriteForPolygon);
            arrNewPolygons = [];
            lastCenter = null;
            isStart = false;
            movieKont1.parent.removeChild(movieKont1);
            objectLastik.destroy();
            objectLastik.parent.removeChild(objectLastik);
            isActive = false;
         }
      }
      
      override public function init(param1:Array = null) : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:Point = null;
         super.init(param1);
         var _loc2_:int = 1;
         while(_loc2_ < 5)
         {
            _loc3_ = movie["m" + _loc2_];
            _loc4_ = new Point(_loc3_.x,_loc3_.y);
            _loc4_ = localToGlobal(_loc4_);
            _loc4_.x = Math.round(_loc4_.x) as int;
            _loc4_.y = Math.round(_loc4_.y) as int;
            this.arrVertex.push(_loc4_);
            _loc2_++;
         }
         this.arrVertex.unshift(this.arrVertex.pop());
         movie.visible = false;
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrPolygons);
         this.arrVertex = [];
         this.arrVertex = null;
         super.destroy();
      }
   }
}

