package Tela
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassDestroyTelo extends ClassBaseBody
   {
      
      private var isPlaySoundContact:Boolean;
      
      private var maxEnForSound:Number;
      
      private var minEnForSound:Number;
      
      private var isWasSound:Boolean;
      
      private var valueSound:Number;
      
      private var numPauseContactSound:int;
      
      private var timerPauseContactSound:int;
      
      private var nameSoundContact:String;
      
      public var criticEn:Number;
      
      public var tempCriticEn:Number;
      
      public var criticForCrackEn:Number;
      
      internal var arrMovieFragments:Array = [];
      
      private var isPhysicFragments:Boolean;
      
      public var centerBody:b2Vec2 = new b2Vec2();
      
      internal var numCoursOskolok:Number = 1;
      
      public var nameContactTelo:String = "";
      
      public var isReadyToGiveFragments:Boolean;
      
      public var isDestroyAfterGiveOskolok:Boolean = true;
      
      public var arrPointsOsk:Array = [];
      
      public var forseImpulsForOskolok:int;
      
      public var isFire:Boolean;
      
      private var isWaitFirstStartSoundContact:Boolean;
      
      private var timerForStartSoundContact:int = 10;
      
      public var isDestroy:Boolean = false;
      
      public var isFixCrack:Boolean = false;
      
      public var isCrack:Boolean = false;
      
      public var waitSreskEn:int = 40;
      
      public var isMakesCrack:Boolean;
      
      public var isOskolokCollision:Boolean;
      
      private var frameWithOscolok:int;
      
      public var isBreak:Boolean;
      
      private var isWaitBreak:Boolean;
      
      private var pauseBreak:int;
      
      public function ClassDestroyTelo(param1:String)
      {
         super(param1);
      }
      
      public function setDestroy(param1:Boolean, param2:Number = 15, param3:Number = 200, param4:Boolean = false, param5:int = 2, param6:Boolean = false) : void
      {
         if(param1 == true)
         {
            this.isDestroy = true;
            this.isOskolokCollision = param6;
            this.frameWithOscolok = param5;
            setCalculateForse(true);
            this.criticEn = param2;
            this.tempCriticEn = param2;
            this.criticForCrackEn = param2 / 2;
            this.isMakesCrack = param4;
            this.forseImpulsForOskolok = param3;
         }
      }
      
      override public function createPhysicShape() : void
      {
         super.createPhysicShape();
         if(this.isDestroy)
         {
            this.makeOskolok(this.frameWithOscolok);
         }
      }
      
      private function makeOskolok(param1:int) : void
      {
         if(param1 != movie.currentFrame)
         {
            movie.gotoAndStop(param1);
            movie.addEventListener(Event.FRAME_CONSTRUCTED,this.initOskolok);
         }
         else
         {
            this.initOskolok(null);
         }
      }
      
      private function initOskolok(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         movie.removeEventListener(Event.FRAME_CONSTRUCTED,this.initOskolok);
         var _loc2_:Number = movie.numChildren;
         this.arrMovieFragments = [];
         if(_loc2_ > 1)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = movie.getChildAt(_loc3_) as MovieClip;
               if((Boolean(_loc4_)) && _loc4_.visible == true)
               {
                  this.arrMovieFragments.push(_loc4_);
               }
               _loc3_++;
            }
         }
         this.actionAfterInitOskolok();
      }
      
      public function actionAfterInitOskolok() : void
      {
         movie.gotoAndStop(1);
         setUnvisibleKontur();
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         if(this.isBreak == false)
         {
            super.setPostSolveContact(param1,param2,param3);
            if(this.isPlaySoundContact == true)
            {
               this.playSoundContact();
            }
            if(this.isDestroy)
            {
               this.setAnaliseUdar(param1);
            }
         }
      }
      
      public function setAnaliseUdar(param1:ClassBaseBody = null) : void
      {
         if(forseContact > this.criticEn)
         {
            this.setBreak();
            return;
         }
         if(this.isMakesCrack == true && this.isCrack == false && forseContact > this.criticForCrackEn)
         {
            this.setCrack();
         }
      }
      
      public function setCrack() : void
      {
         if(this.isBreak)
         {
            return;
         }
         movie.gotoAndStop(2);
         this.isCrack = true;
         this.criticEn = this.criticForCrackEn;
      }
      
      public function setBreak(param1:int = 0) : void
      {
         if(this.isBreak)
         {
            return;
         }
         this.isBreak = true;
         if(param1 == 0)
         {
            this.isReadyToGiveFragments = true;
            this.waitBreak();
            return;
         }
         if(this.isWaitBreak == false)
         {
            this.pauseBreak = param1;
            this.isWaitBreak = true;
            addEventListener(Event.ENTER_FRAME,this.waitBreak);
         }
      }
      
      private function waitBreak(param1:Event = null) : void
      {
         if(--this.pauseBreak < 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitBreak);
            this.isReadyToGiveFragments = true;
         }
      }
      
      public function setSoundsProperties(param1:String, param2:Number = 9, param3:Number = 0.5, param4:Number = 1, param5:int = 10) : void
      {
         this.isPlaySoundContact = true;
         this.isWasSound = false;
         this.maxEnForSound = param2;
         this.minEnForSound = param3;
         this.valueSound = param4;
         this.numPauseContactSound = param5;
         this.timerPauseContactSound = param5;
         this.nameSoundContact = param1;
      }
      
      public function playSoundContact() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.isWasSound == false && this.isWaitFirstStartSoundContact && forseContact > this.minEnForSound)
         {
            _loc1_ = forseContact;
            if(_loc1_ > this.maxEnForSound)
            {
               _loc1_ = this.maxEnForSound;
            }
            _loc2_ = this.valueSound / this.maxEnForSound;
            ControlSounds.playSound(this.nameSoundContact,_loc2_ * _loc1_,1);
            this.isWasSound = true;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.isCrack == true && this.isFixCrack == false && this.waitSreskEn-- < 0)
         {
            this.isFixCrack = true;
            this.criticEn = this.criticForCrackEn;
            this.tempCriticEn = this.criticEn;
         }
         if(this.isPlaySoundContact)
         {
            if(this.isWasSound)
            {
               if(this.timerPauseContactSound-- < 0)
               {
                  this.timerPauseContactSound = this.numPauseContactSound;
                  this.isWasSound = false;
               }
            }
            if(this.isWaitFirstStartSoundContact == false)
            {
               if(this.timerForStartSoundContact-- == 0)
               {
                  this.isWaitFirstStartSoundContact = true;
               }
            }
         }
      }
      
      private function getArrPointsToImpuls() : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:MovieClip = null;
         var _loc1_:Array = [];
         var _loc2_:Number = Math.PI * 2;
         var _loc3_:int = this.arrMovieFragments.length * 2;
         var _loc8_:Number = 0.5;
         _loc4_ = _loc3_ / 4;
         while(_loc4_ < _loc3_ / 2)
         {
            _loc5_ = 100 * Math.cos(_loc2_ * _loc4_ / _loc3_ + _loc8_);
            _loc6_ = -100 * Math.sin(_loc2_ * _loc4_ / _loc3_ + _loc8_);
            _loc1_.push(new Point(_loc5_,_loc6_));
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_ / 4)
         {
            _loc5_ = 100 * Math.cos(_loc2_ * _loc4_ / _loc3_ + _loc8_);
            _loc6_ = -100 * Math.sin(_loc2_ * _loc4_ / _loc3_ + _loc8_);
            _loc1_.push(new Point(_loc5_,_loc6_));
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function getFragments() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:Point = null;
         var _loc5_:ClassOscolok = null;
         var _loc6_:MovieClip = null;
         this.arrPointsOsk = this.getArrPointsToImpuls();
         this.centerBody = body.GetWorldCenter();
         _loc1_ = [];
         for each(_loc2_ in this.arrMovieFragments)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numChildren)
            {
               _loc6_ = _loc2_.getChildAt(_loc3_) as MovieClip;
               if(_loc6_)
               {
                  _loc6_.stop();
               }
               _loc3_++;
            }
            _loc2_.gotoAndStop(1);
            _loc4_ = localToGlobal(new Point(_loc2_.x,_loc2_.y));
            _loc2_.x = 0;
            _loc2_.y = 0;
            _loc2_.rotation = 0;
            _loc5_ = new ClassOscolok(_loc2_,this.isOskolokCollision);
            _loc5_.x = _loc4_.x - ClassBaseLevel.xL;
            _loc5_.y = _loc4_.y;
            _loc5_.scaleX = scaleX;
            _loc5_.scaleY = scaleY;
            _loc5_.rotation = rotation;
            _loc5_.init();
            parent.addChild(_loc5_);
            this.setImpulsToOskolok(_loc5_.body);
            _loc1_.push(_loc5_);
         }
         this.isPhysicFragments = true;
         this.isReadyToGiveFragments = false;
         isCrash = true;
         isLive = !this.isDestroyAfterGiveOskolok;
         destroyBody();
         return _loc1_;
      }
      
      internal function setImpulsToOskolok(param1:b2Body) : void
      {
         var _loc2_:Number = body.GetLinearVelocity().x / 2;
         var _loc3_:Number = body.GetLinearVelocity().y / 2;
         param1.SetLinearVelocity(new b2Vec2(_loc2_,_loc3_));
         _loc2_ = body.GetAngularVelocity();
         param1.SetAngularVelocity(_loc2_);
         var _loc4_:Point = this.arrPointsOsk[0];
         var _loc5_:Point = ClassMath.getVector(getPosition(),_loc4_);
         var _loc6_:Point = ClassMath.getPointOnSegment(getPosition(),_loc5_,5);
         var _loc7_:Number = param1.GetMass();
         var _loc8_:b2Vec2 = new b2Vec2(_loc4_.x * scaleX * _loc7_ / 10,_loc4_.y * scaleY * _loc7_ / 10);
         param1.ApplyImpulse(_loc8_,this.centerBody);
         this.numCoursOskolok = 1;
         if(Math.random() > 0.5)
         {
            this.numCoursOskolok = -1;
         }
         param1.SetAngularVelocity(10 * this.numCoursOskolok);
         this.numCoursOskolok = -1 * this.numCoursOskolok;
         this.arrPointsOsk.splice(0,1);
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.waitBreak);
         if(movie)
         {
            movie.removeEventListener(Event.FRAME_CONSTRUCTED,this.initOskolok);
         }
         this.nameSoundContact = null;
         this.centerBody = null;
         contactObject = null;
         this.nameContactTelo = null;
         this.arrPointsOsk = [];
         this.arrPointsOsk = null;
         this.arrMovieFragments = [];
         this.arrMovieFragments = null;
         super.destroy();
      }
   }
}

