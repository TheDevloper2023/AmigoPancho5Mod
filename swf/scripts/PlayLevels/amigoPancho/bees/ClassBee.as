package PlayLevels.amigoPancho.bees
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import PlayLevels.amigoPancho.tela.levelElements.ClassFireBall;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.ClassBaseBody;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassBee extends ClassLevelObject
   {
      
      public static var arrBee:Array = [];
      
      private var objectForAtak:ClassBaseGameObject;
      
      public var arrSled:Array;
      
      private var isAtack:Boolean;
      
      private var pauseImpuls:int;
      
      private var isPauseImpulsFinish:Boolean;
      
      private var isImpuls:Boolean;
      
      private var vv:b2Vec2 = new b2Vec2();
      
      private var numAimInArray:int = -1;
      
      private var dopForseAfterFirstContact:Number = 0;
      
      private var isContact:Boolean;
      
      private var contPosX:Number;
      
      private var contPosY:Number;
      
      public var pointHome:Point;
      
      private var density:Number = 1;
      
      private var anger:Number = 3;
      
      private var distToAim:Number;
      
      private var lastDist:Number;
      
      private var isWayHome:Boolean;
      
      public var isInHome:Boolean;
      
      private var timerDontContact:int = 40;
      
      private var isWasFirstContact:Boolean;
      
      private var criticDist:Number = 50;
      
      private var vSlowDown:b2Vec2;
      
      private var vSpeed:b2Vec2;
      
      private var countPointsInAirm:int;
      
      private var numCurAirmPoint:int;
      
      public var isContactWithHand:Boolean;
      
      public var isActive:Boolean;
      
      private var centerObject:Point;
      
      public var isContactAim:Boolean;
      
      private var indCurSled:int;
      
      private var pointCurs:Point;
      
      private var dopImp:Number;
      
      public var isDie:Boolean;
      
      private var waitAngry:int;
      
      private var indCurAim:int = 0;
      
      private var arrAim:Array = [];
      
      private var sound:ClassSoundCompleted;
      
      private var isFirstContact:Boolean;
      
      private var countBok:int;
      
      public function ClassBee()
      {
         super("bBee01");
         isOffMakeAngle = true;
         arrPhysicParam = [0.8,0.1,0.1];
         isFindPointContact = true;
         arrBee.push(this);
         isOskolokCollision = true;
         ClassBaseLevel.arrNewObjectGame.push(this);
         setParentSprite(ClassLayers.spriteForBee);
         amigo5.mainStage.addEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.addEventListener("ALL_SOUND_ON",this.soundPlay);
      }
      
      private function soundStop(param1:Event = null) : void
      {
         if(this.sound)
         {
            this.sound.destroy();
            this.sound = null;
         }
      }
      
      private function soundPlay(param1:Event = null) : void
      {
         if(this.sound == null)
         {
            if(ClassPlayLevel.isUpdate)
            {
               this.sound = ControlSounds.loadAndPlay("mBee",0,0.2,false,Math.random() * 1170);
            }
         }
      }
      
      override public function actionAfterInitOskolok() : void
      {
         super.actionAfterInitOskolok();
         this.setStartWing();
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.pointHome = new Point(345,-100);
         body.setCustomGravity(new b2Vec2(0,0));
         forseImpulsForOskolok = 100 + Math.random() * 150;
         this.isInHome = true;
         this.dopImp = 0.5;
         this.arrSled = param1[0];
         this.arrAim = param1[1];
         if(this.arrSled)
         {
            this.registerNewAim(this.arrSled[this.indCurSled]);
         }
         else
         {
            this.registerNewAim(this.arrAim[this.indCurAim]);
         }
         body.SetLinearDamping(0.8);
         addEventListener(Event.ENTER_FRAME,this.fwaitAngry);
         this.soundPlay();
      }
      
      private function fwaitAngry(param1:Event) : void
      {
         if((this.dopForseAfterFirstContact = this.dopForseAfterFirstContact + 0.05) > 3)
         {
            removeEventListener(Event.ENTER_FRAME,this.fwaitAngry);
            this.dopForseAfterFirstContact = 3;
         }
      }
      
      public function setNewHero() : void
      {
      }
      
      public function setImpuls(param1:int, param2:int) : void
      {
         this.dopForseAfterFirstContact = 20;
         this.setGoPoint(new Point(param1,param2));
         body.ApplyImpulse(this.vv,body.GetWorldCenter());
         this.dopForseAfterFirstContact = 0;
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(this.isAtack)
         {
            if(!(param1 is ClassBee))
            {
               this.isFirstContact = true;
            }
            if(this.isFirstContact)
            {
               this.isContact = true;
            }
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         super.update(param1);
         if(isBodyCreated == false)
         {
            return;
         }
         if(this.isAtack == false)
         {
            return;
         }
         if(this.isDie == true)
         {
            return;
         }
         if(this.isImpuls == true)
         {
            centerBody = body.GetWorldCenter();
            this.centerObject = new Point(x,y);
            this.vSpeed = body.GetLinearVelocity();
            this.pointCurs = this.getPointCours();
            this.setGoPoint(this.pointCurs);
            this.distToAim = ClassMath.getDistansFromToPoints(this.centerObject,this.pointCurs);
            if(this.lastDist > 0 && this.distToAim > this.lastDist)
            {
               if(this.distToAim > this.criticDist)
               {
               }
            }
            this.lastDist = this.distToAim;
            body.ApplyImpulse(this.vv,centerBody);
         }
         else if(this.pauseImpuls-- < 0)
         {
            this.isImpuls = true;
         }
         if(this.isContact == true)
         {
            this.isContact = false;
            ++this.countBok;
            if(this.countBok == 1)
            {
               _loc2_ = 0;
            }
            else if(this.countBok == 2)
            {
               _loc2_ = 0;
            }
            else
            {
               _loc2_ = 0;
               this.countBok = 0;
            }
            _loc3_ = -(pointContact.x - centerBody.x + _loc2_) * this.dopImp;
            _loc4_ = -(pointContact.y - centerBody.y - _loc2_) * this.dopImp;
            body.ApplyImpulse(new b2Vec2(_loc3_,_loc4_),centerBody);
            this.pauseImpuls = 1;
            this.dopForseAfterFirstContact = this.anger;
            if(!this.isWayHome)
            {
               this.isImpuls = false;
            }
         }
         if(this.isWayHome == false && this.objectForAtak.isLive == false)
         {
            if(++this.indCurAim < this.arrAim.length)
            {
               this.registerNewAim(this.arrAim[this.indCurAim]);
            }
         }
         if(this.pointCurs)
         {
            this.calculateRotation();
         }
      }
      
      private function getPointCours() : Point
      {
         var _loc1_:Point = null;
         if(this.isWayHome == true)
         {
            _loc1_ = this.pointHome;
            if(y < -20)
            {
               this.isAtack = false;
               isLive = false;
            }
         }
         else
         {
            _loc1_ = new Point(this.objectForAtak.x,this.objectForAtak.y);
         }
         return _loc1_;
      }
      
      private function setCutSled(param1:ClassSled) : void
      {
         var _loc2_:ClassSled = null;
         for each(_loc2_ in this.arrSled)
         {
            _loc2_.setLowAlpha(false,0.02);
            if(_loc2_ == param1)
            {
               return;
            }
         }
      }
      
      public function registerNewAim(param1:ClassBaseGameObject) : void
      {
         if(this.isWayHome)
         {
            return;
         }
         this.objectForAtak = param1;
         this.setWakeUp();
         this.isAtack = true;
         this.clearDistance();
      }
      
      public function setGoHome(param1:Event = null) : void
      {
         this.dopForseAfterFirstContact = 1;
         this.dopImp = 1;
         this.isWayHome = true;
         this.isImpuls = true;
         this.isContact = false;
         this.isAtack = true;
         body.SetLinearDamping(0);
         this.pointCurs = this.pointHome;
      }
      
      public function setGoPoint(param1:Point) : void
      {
         this.centerObject = new Point(x,y);
         var _loc2_:int = 1;
         var _loc3_:Point = ClassMath.getPointOnSegment(this.centerObject,param1,_loc2_ + this.dopForseAfterFirstContact);
         this.vv = new b2Vec2((_loc3_.x - this.centerObject.x) / 60,(_loc3_.y - this.centerObject.y) / 60);
      }
      
      private function calculateRotation() : void
      {
         this.centerObject = new Point(x,y);
         this.rotationToPoint(this.pointCurs.x,this.pointCurs.y);
      }
      
      public function rotationToPoint(param1:int, param2:int) : void
      {
         var _loc3_:int = ClassMath.getAngleFrom2Points(new Point(param1,param2),new Point(x,y));
         if(x > param1)
         {
            rotation = 43 + (43 - _loc3_);
         }
         else
         {
            rotation = -43 - (43 + _loc3_);
         }
      }
      
      public function setWakeUp() : void
      {
         this.isInHome = false;
         this.isWasFirstContact = false;
         this.isWayHome = false;
         this.isActive = true;
      }
      
      public function setStartWing() : void
      {
      }
      
      public function setStopWing() : void
      {
         movie.fly.wing1.gotoAndStop(1);
         movie.fly.wing2.gotoAndStop(1);
      }
      
      public function setContrImpuls(param1:Number) : void
      {
         this.vSlowDown = new b2Vec2(-this.vSpeed.x * 0.05,-this.vSpeed.y * 0.05);
         body.ApplyImpulse(this.vSlowDown,centerBody);
      }
      
      public function clearDistance() : void
      {
         this.distToAim = 0;
         this.lastDist = 0;
         this.isWayHome = false;
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         var _loc2_:Number = NaN;
         if(this.isWayHome)
         {
            return false;
         }
         if(param1 is ClassFireBall)
         {
            _loc2_ = ClassMath.getDistansFromToPoints(getPosition(),param1.getPosition());
            if(_loc2_ < 40)
            {
               this.setBlastFromRocket();
            }
            return false;
         }
         return true;
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         if(this.isDie == false)
         {
            startBlow("sBlowUp01",0.4,true);
         }
         return true;
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.removeEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.removeEventListener("ALL_SOUND_ON",this.soundPlay);
         removeEventListener(Event.ENTER_FRAME,this.fwaitAngry);
         ClassMath.removeObjectFromArray(arrBee,this);
         this.vv = null;
         this.objectForAtak = null;
         this.arrAim = [];
         this.arrAim = null;
         this.arrSled = [];
         this.arrSled = null;
         this.soundStop();
         super.destroy();
      }
   }
}

