package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import PlayLevels.amigoPancho.tela.levelElements.ClassSledFan;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassFan extends ClassResendEventsPerform
   {
      
      private var startPos:Point;
      
      private var pDown:Point;
      
      private var pDelta:Point;
      
      private var cours:int = 1;
      
      public var direct:int;
      
      private var firstBobyHit:b2Body;
      
      private var distToBody:Number;
      
      private var pImp:b2Vec2 = new b2Vec2();
      
      private var p1:b2Vec2;
      
      public var isBlock:Boolean;
      
      public var kLR:int = 1;
      
      public var kf:Number = 1;
      
      public var kFor:Number;
      
      public function ClassFan(param1:String)
      {
         super(param1);
         this.startSettings();
         this.pImp.x = 0;
         this.pImp.y = 0;
      }
      
      public function startSettings() : void
      {
         this.startPos = new Point(movie.s.x,movie.s.y);
         this.setOff();
         this.kFor = 17;
      }
      
      override public function getSpriteForLight() : Sprite
      {
         return movie.s;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.setCustomGravity(new b2Vec2(0,0));
         this.kLR = movie.scaleX;
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:Number = Number(param1.attribute("l_damp"));
         if(_loc2_ != -0.1)
         {
            this.kf = _loc2_;
         }
      }
      
      override public function mover(param1:MouseEvent) : void
      {
         if(this.isBlock == false)
         {
            super.mover(param1);
            if(isAction == false)
            {
               setMOverResend();
            }
         }
      }
      
      override public function mout(param1:MouseEvent = null) : void
      {
         if(this.isBlock == false)
         {
            super.mout(param1);
            if(isAction == false)
            {
               setMouseOutResend();
            }
         }
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         super.mDown(param1);
         this.isBlock = false;
         isMouseUp = false;
         if(isAction == false)
         {
            setMouseDownResend();
         }
         this.pDown = new Point(stage.mouseX,stage.mouseY);
         this.pDelta = new Point(stage.mouseX - movie.s.x,stage.mouseY - movie.s.y);
         this.startPos = new Point(movie.s.x,movie.s.y);
      }
      
      override public function mUp(param1:MouseEvent = null) : void
      {
         super.mUp(param1);
         isMouseUp = true;
      }
      
      override public function mUpGlobal(param1:MouseEvent = null) : void
      {
         super.mUpGlobal(param1);
         this.isBlock = false;
         isAction = false;
         setMouseOnResend();
         setMouseUpGlobalResend();
         this.setOff();
         if(isMouseUp == true)
         {
            this.mover(param1);
            isMouseUp = false;
         }
      }
      
      public function setBlock() : void
      {
         clearLight();
         this.setOff();
         this.isBlock = true;
         ClassMouseCursor.createMouseCursorButton();
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.isBlock == false)
         {
            this.setWork();
         }
      }
      
      public function setWork() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(speedBody > 0.3)
         {
            this.setBlock();
            return;
         }
         if(isTouchBegin)
         {
            this.cours = 0;
            _loc1_ = 0;
            if(isVertical == false)
            {
               _loc2_ = this.pDown.x + (stage.mouseX - this.pDown.x) * this.kLR - this.pDelta.x;
               if(this.startPos.x - _loc2_ > 0)
               {
                  this.cours = -1;
               }
               if(this.startPos.x - _loc2_ < 0)
               {
                  this.cours = 1;
               }
               _loc1_ = Math.abs(this.startPos.x - _loc2_);
               if(_loc1_ < 10)
               {
                  movie.s.x = _loc2_;
               }
               else
               {
                  movie.s.x = this.startPos.x + 10 * this.cours;
               }
            }
            else
            {
               _loc3_ = this.pDown.y + (stage.mouseY - this.pDown.y) * this.kLR - this.pDelta.y;
               if(this.startPos.y - _loc3_ > 0)
               {
                  this.cours = -1;
               }
               if(this.startPos.y - _loc3_ < 0)
               {
                  this.cours = 1;
               }
               _loc1_ = Math.abs(this.startPos.y - _loc3_);
               if(_loc1_ < 10)
               {
                  movie.s.x = _loc3_ + 13;
               }
               else
               {
                  if(this.cours == -1)
                  {
                     movie.s.x = this.startPos.y;
                  }
                  if(this.cours == 1)
                  {
                     movie.s.x = 27;
                  }
               }
            }
            if(_loc1_ < 5)
            {
               this.cours = 0;
            }
            this.setOn(this.cours);
         }
      }
      
      override public function setOn(param1:Number) : void
      {
         if(param1 != 0)
         {
            if(isAction == false)
            {
               setMouseOutResend();
               setMouseUpGlobalResend();
               setMouseOffResend();
               ClassMouseCursor.createMouseCursorButton();
            }
            super.setOn(param1);
            if(this.direct != param1)
            {
               movie.lopast.play();
               ControlSounds.loadAndPlay("mClick04",1,1,true);
               ControlSounds.playSound("mFan",0.7,0);
            }
            this.direct = param1;
            this.setWind();
         }
      }
      
      public function setWind() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:b2Vec2 = null;
         var _loc10_:Point = null;
         var _loc11_:Point = null;
         var _loc12_:b2Vec2 = null;
         var _loc13_:b2Vec2 = null;
         var _loc14_:Point = null;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         if(isVertical == false)
         {
            _loc1_ = getPosition();
            _loc2_ = new Point(_loc1_.x,_loc1_.y - height / 2 + 12);
            _loc3_ = 690 / scalePhysic;
            _loc4_ = 5;
            _loc5_ = (height - 12) / _loc4_;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               this.pImp.x = 0;
               this.pImp.y = 0;
               _loc7_ = _loc6_ * _loc4_;
               _loc8_ = _loc2_.y + _loc7_;
               this.p1 = new b2Vec2(_loc2_.x / scalePhysic,_loc8_ / scalePhysic);
               _loc9_ = new b2Vec2(this.p1.x - _loc3_ * this.kLR,this.p1.y);
               this.distToBody = 9999;
               this.firstBobyHit = null;
               body.GetWorld().RayCast(this.setRay,this.p1,_loc9_);
               if(this.firstBobyHit)
               {
                  if(this.getIsApply(this.firstBobyHit))
                  {
                     _loc12_ = new b2Vec2(this.pImp.x - this.p1.x,this.pImp.y - this.p1.y);
                     if(this.direct > 0)
                     {
                        _loc12_ = new b2Vec2(this.p1.x - this.pImp.x,this.p1.y - this.pImp.y);
                     }
                     _loc13_ = new b2Vec2(_loc12_.x / _loc12_.Length(),_loc12_.y / _loc12_.Length());
                     _loc13_.x /= this.kFor;
                     _loc13_.y /= this.kFor;
                     _loc13_.x *= this.kf;
                     _loc13_.y *= this.kf;
                     this.firstBobyHit.ApplyImpulse(_loc13_,this.pImp);
                  }
               }
               _loc10_ = new Point(x - width / 2 * this.kLR,_loc8_);
               if(this.firstBobyHit)
               {
                  _loc11_ = new Point(this.pImp.x * scalePhysic,this.pImp.y * scalePhysic);
               }
               else
               {
                  _loc11_ = new Point(_loc9_.x * scalePhysic,_loc9_.y * scalePhysic);
               }
               if(this.direct < 0)
               {
                  _loc14_ = _loc10_;
                  _loc10_ = _loc11_;
                  _loc11_ = _loc14_;
               }
               this.createSled(_loc11_,_loc10_);
               _loc6_++;
            }
         }
         else
         {
            _loc1_ = getPosition();
            _loc2_ = new Point(_loc1_.x - width / 2 * this.kLR + 12,_loc1_.y);
            _loc3_ = 690 / scalePhysic;
            _loc15_ = 5;
            _loc5_ = (width - 12) / _loc15_;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               this.pImp.x = 0;
               this.pImp.y = 0;
               _loc16_ = _loc6_ * _loc15_;
               _loc17_ = _loc2_.x + _loc16_;
               this.p1 = new b2Vec2(_loc17_ / scalePhysic,_loc2_.y / scalePhysic);
               _loc9_ = new b2Vec2(this.p1.x,this.p1.y - _loc3_ * this.kLR);
               this.distToBody = 9999;
               this.firstBobyHit = null;
               body.GetWorld().RayCast(this.setRay,this.p1,_loc9_);
               if(this.firstBobyHit)
               {
                  if(this.getIsApply(this.firstBobyHit) == true)
                  {
                     _loc12_ = new b2Vec2(this.pImp.x - this.p1.x,this.pImp.y - this.p1.y);
                     if(this.direct > 0)
                     {
                        _loc12_ = new b2Vec2(this.p1.x - this.pImp.x,this.p1.y - this.pImp.y);
                     }
                     _loc13_ = new b2Vec2(_loc12_.x / _loc12_.Length(),_loc12_.y / _loc12_.Length());
                     _loc13_.x /= this.kFor;
                     _loc13_.y /= this.kFor;
                     _loc13_.x *= this.kf;
                     _loc13_.y *= this.kf;
                     this.firstBobyHit.ApplyImpulse(_loc13_,this.pImp);
                  }
               }
               _loc10_ = new Point(_loc17_,y - height / 2 * this.kLR);
               if(this.firstBobyHit)
               {
                  _loc11_ = new Point(this.pImp.x * scalePhysic,this.pImp.y * scalePhysic);
               }
               else
               {
                  _loc11_ = new Point(_loc9_.x * scalePhysic,0);
               }
               if(this.direct < 0)
               {
                  _loc14_ = _loc10_;
                  _loc10_ = _loc11_;
                  _loc11_ = _loc14_;
               }
               this.createSled(_loc11_,_loc10_);
               _loc6_++;
            }
         }
      }
      
      public function createSled(param1:Point, param2:Point) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:ClassSledFan = null;
         if(Math.random() > 0.96)
         {
            _loc3_ = Math.round(Math.random() * 2) + 1;
            _loc4_ = new ClassSledFan("bDust0" + _loc3_);
            _loc4_.setPosition(param1.x,param1.y);
            _loc4_.init();
            _loc4_.alpha = 0.5;
            _loc4_.startMove(param2,Math.random() * 10 + 15);
            ClassBaseLevel.arrNewObjectGame.push(_loc4_);
         }
      }
      
      private function getIsApply(param1:b2Body) : Boolean
      {
         var _loc2_:Boolean = true;
         var _loc3_:ClassLevelObject = param1.GetUserData() as ClassLevelObject;
         if(Boolean(_loc3_) && _loc3_ is ClassRotateBySwitch)
         {
            _loc2_ = false;
         }
         if(Boolean(_loc3_) && _loc3_ is ClassRocket)
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      private function setRay(param1:b2Fixture, param2:b2Vec2, param3:b2Vec2, param4:Number) : Number
      {
         var _loc5_:Number = ClassMath.getDistansFromToPoints(new Point(this.p1.x,this.p1.y),new Point(param2.x,param2.y));
         var _loc6_:Boolean = true;
         if(param1.GetBody().GetUserData() is ClassFan)
         {
            _loc6_ = false;
         }
         if(_loc6_)
         {
            if(_loc5_ < this.distToBody)
            {
               this.firstBobyHit = param1.GetBody();
               this.pImp = param2;
               this.distToBody = _loc5_;
            }
         }
         return 1;
      }
      
      override public function setOff() : void
      {
         super.setOff();
         movie.s.x = this.startPos.x;
         movie.s.y = this.startPos.y;
         movie.lopast.gotoAndStop(1);
         this.direct = 0;
         ControlSounds.stopSound("mFan");
      }
      
      override public function destroy() : void
      {
         this.firstBobyHit = null;
         super.destroy();
      }
   }
}

