package Tela
{
   import PlayLevels.BaseLevels.ClassMouseEvents;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class ClassBaseGameObject extends ClassMouseEvents
   {
      
      public const STOP_MOVE:String = "STOP_MOVE";
      
      public var movie:MovieClip;
      
      public var angle:Number;
      
      public var nameMovie:String;
      
      public var isUndoPerednik:Boolean;
      
      private var isSetMouseSelected:Boolean;
      
      public var myGlow:GlowFilter = new GlowFilter();
      
      public var isLight:Boolean;
      
      public var colorLight:uint = 16777215;
      
      public var isLightNow:Boolean;
      
      public var isOffLightNow:Boolean;
      
      private var isLowAlpha:Boolean;
      
      private var isDieIfAlpha0:Boolean;
      
      public var parentSprite:Sprite;
      
      private var objeForEvent:ClassBaseGameObject;
      
      public var shadow:DropShadowFilter;
      
      private var isInCreace:Boolean;
      
      private var speed:Number;
      
      public var isMove:Boolean;
      
      private var finishPoint:Point;
      
      private var alphaMovie:Number;
      
      private var kSpeed:Number = 0;
      
      private var acceleration:Number;
      
      private var cours:int;
      
      private var halfDist:Point;
      
      private var jumpUP:Number;
      
      private var isHalfDist:Boolean;
      
      private var stepChangeAlpha:Number;
      
      public function ClassBaseGameObject(param1:String)
      {
         super();
         this.nameMovie = param1;
         if(param1)
         {
            this.movie = this.getCopyMovie(param1);
            this.movie.stop();
            addChild(this.movie);
         }
      }
      
      public function sendObjectForEvent(param1:ClassBaseGameObject) : void
      {
         this.objeForEvent = param1;
      }
      
      public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesGame,param1);
      }
      
      public function setParentSprite(param1:Sprite) : void
      {
         this.parentSprite = param1;
      }
      
      public function init(param1:Array = null) : void
      {
         if(this.parentSprite)
         {
            if(parent)
            {
               parent.removeChild(this);
            }
            this.parentSprite.addChild(this);
            this.parentSprite = null;
         }
      }
      
      public function sendGameObjects(param1:Array = null) : void
      {
      }
      
      public function setShad() : void
      {
         this.shadow = new DropShadowFilter();
         this.shadow.color = 3355443;
         this.shadow.blurX = 3;
         this.shadow.blurY = 3;
         this.shadow.distance = 3;
         this.shadow.angle = 30;
         this.shadow.alpha = 0.6;
         this.getSpriteForLight().filters = [this.shadow];
      }
      
      public function setLight(param1:int = 1, param2:uint = 16777215, param3:int = 10, param4:Number = 1) : void
      {
         if(this.isLight == false && Boolean(this.myGlow))
         {
            this.myGlow.color = param2;
            this.myGlow.blurX = param1;
            this.myGlow.blurY = param1;
            this.myGlow.alpha = param4;
            this.myGlow.strength = param3;
            this.getSpriteForLight().filters = [this.myGlow];
            this.isLight = true;
         }
      }
      
      public function getSpriteForLight() : Sprite
      {
         return this;
      }
      
      public function clearLight() : void
      {
         if(this.isLight == true)
         {
            this.getSpriteForLight().filters = [];
            this.isLight = false;
         }
      }
      
      public function setScale(param1:Number = 1, param2:Number = 1) : void
      {
         scaleX = param1;
         scaleY = param2;
      }
      
      public function clearScale() : void
      {
         scaleX = 1;
         scaleY = 1;
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update();
         if(this.isLowAlpha)
         {
            if((alpha = alpha - this.stepChangeAlpha) < 0)
            {
               isLive = !this.isDieIfAlpha0;
            }
         }
      }
      
      public function addChildWithPosition(param1:DisplayObject, param2:Number = 0, param3:Number = 0, param4:Number = 0) : void
      {
         addChild(param1);
         this.setPosition(param2,param3,param4);
      }
      
      public function setPosition(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         this.x = param1;
         this.y = param2;
         if(param3)
         {
            this.rotation = param3;
         }
         if(param4 != 0)
         {
            scaleX = param4;
         }
         if(param5 != 0)
         {
            scaleY = param5;
         }
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         this.width = param1;
         this.height = param2;
      }
      
      public function getPosition() : Point
      {
         return new Point(x,y);
      }
      
      public function setOptions(param1:XML) : void
      {
         this.setPosition(param1.attribute("x"),param1.attribute("y"));
         this.setSize(param1.attribute("width"),param1.attribute("height"));
         rotation = param1.attribute("rotation");
         if(Number(param1.attribute("mirrorShape")) == 1)
         {
            this.movie.scaleX *= -1;
         }
      }
      
      public function startMove(param1:Point, param2:Number, param3:Boolean = false, param4:Boolean = false) : void
      {
         this.isInCreace = param4;
         this.speed = param2;
         this.finishPoint = param1;
         addEventListener(Event.ENTER_FRAME,this.move);
      }
      
      public function move(param1:Event) : void
      {
         var _loc2_:Point = this.findNextPointLine(new Point(x,y),this.finishPoint,this.speed);
         x = _loc2_.x;
         y = _loc2_.y;
         this.isMove = true;
         if(Math.abs(x - this.finishPoint.x) <= this.speed && Math.abs(y - this.finishPoint.y) <= this.speed)
         {
            this.stopMove();
         }
      }
      
      private function findNextPointLine(param1:Point, param2:Point, param3:Number) : Point
      {
         var _loc5_:Number = NaN;
         var _loc4_:Point = new Point();
         if(param3 == 0)
         {
            _loc4_ = param1;
         }
         else
         {
            _loc5_ = Math.sqrt((param1.x - param2.x) * (param1.x - param2.x) + (param1.y - param2.y) * (param1.y - param2.y));
            if(_loc5_ == 0)
            {
               _loc4_ = param1;
            }
            else
            {
               _loc5_ = param3 / _loc5_;
               _loc4_.x = param1.x + _loc5_ * (param2.x - param1.x);
               _loc4_.y = param1.y + _loc5_ * (param2.y - param1.y);
            }
         }
         return _loc4_;
      }
      
      public function stopMove() : void
      {
         x = this.finishPoint.x;
         y = this.finishPoint.y;
         this.isMove = false;
         dispatchEvent(new Event(this.STOP_MOVE));
         removeEventListener(Event.ENTER_FRAME,this.move);
      }
      
      public function sendEvent(param1:String) : void
      {
         if(this.objeForEvent)
         {
            this.objeForEvent.receiveEvent(this,param1);
         }
      }
      
      public function receiveEvent(param1:ClassBaseGameObject, param2:String) : void
      {
      }
      
      public function removeThisFromArray(param1:Array) : void
      {
         var _loc3_:ClassBaseGameObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as ClassBaseGameObject;
            if(_loc3_ == this)
            {
               param1.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function setLowAlpha(param1:Boolean = false, param2:Number = 0.1) : void
      {
         this.isDieIfAlpha0 = param1;
         this.stepChangeAlpha = param2;
         this.isLowAlpha = true;
      }
      
      override public function destroy() : void
      {
         this.isMove = false;
         removeEventListener(Event.ENTER_FRAME,this.move);
         this.myGlow = null;
         isLive = false;
         if(Boolean(this.movie) && Boolean(this.movie.parent))
         {
            this.movie.parent.removeChild(this.movie);
         }
         this.movie = null;
         while(numChildren)
         {
            removeChildAt(0);
         }
         this.parentSprite = null;
         super.destroy();
      }
   }
}

