package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.bees.ClassBee;
   import PlayLevels.amigoPancho.tela.bad.ClassSabla;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragMouseKol;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassBaseBalloon extends ClassLevelObject
   {
      
      public static var arrBaseBalloon:Array = [];
      
      public var yLimit:Number;
      
      public var startForseFly:Number;
      
      public var isBoom:Boolean;
      
      public var isBlast:Boolean;
      
      public var pForForse:Point;
      
      public var objVerevka:ClassVerevka;
      
      private var timeInFire:int;
      
      public var isStart:Boolean;
      
      public var isGoUpWithOutVerevka:Boolean;
      
      public function ClassBaseBalloon(param1:String)
      {
         super(param1);
         arrPhysicParam = [1,0.1,0];
         arrBaseBalloon.push(this);
         this.pForForse = new Point(x,y - height / 2);
         setParentSprite(ClassLayers.spriteForDynamic);
         this.yLimit = -300;
         this.isStart = true;
         this.isGoUpWithOutVerevka = true;
         isTestInFire = true;
         isCalculateForseContact = true;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.startForseFly = -0.5 * body.GetMass();
         addEventListener(Event.ENTER_FRAME,this.findVer);
         if(this.isStart == false)
         {
            this.yLimit = y;
            this.startForseFly /= 1.1;
            body.SetLinearDamping(5);
         }
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:Number = Number(param1.attribute("l_damp"));
         if(_loc2_ == 0)
         {
            this.isStart = false;
         }
      }
      
      public function findVer(param1:Event) : void
      {
         var _loc2_:ClassVerevka = null;
         var _loc3_:b2RevoluteJointDef = null;
         var _loc4_:Point = null;
         var _loc5_:b2Vec2 = null;
         removeEventListener(Event.ENTER_FRAME,this.findVer);
         for each(_loc2_ in ClassVerevka.arrVer)
         {
            if(_loc2_.hitTestObject(this))
            {
               this.objVerevka = _loc2_;
               _loc2_.ballon = this;
               _loc3_ = new b2RevoluteJointDef();
               _loc3_.lowerAngle = -20 / (180 / Math.PI);
               _loc3_.upperAngle = 20 / (180 / Math.PI);
               _loc3_.enableLimit = true;
               _loc4_ = new Point(x,y + height / 2 - 1);
               _loc5_ = new b2Vec2(_loc4_.x / scalePhysic,_loc4_.y / scalePhysic);
               _loc3_.Initialize(body,_loc2_.body,_loc5_);
               body.GetWorld().CreateJoint(_loc3_);
            }
         }
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(param1 is ClassKaktus)
         {
            this.isBoom = true;
         }
         if(param1 is ClassKoluchFire && (param1 as ClassKoluchFire).isContactPack == false)
         {
            this.isBoom = true;
            return;
         }
         if(param1 is ClassDragMouseKol)
         {
            this.isBoom = true;
         }
         if(param1 is ClassBadMouse)
         {
            this.isBoom = true;
         }
         if(param1 is ClassSabla)
         {
            this.isBoom = true;
         }
         if(param1 is ClassKol)
         {
            this.isBoom = true;
         }
         if(param1 is ClassBee)
         {
            this.isBoom = true;
         }
         if(param1 is ClassGrad)
         {
            this.isBoom = true;
         }
         if(param1 is ClassMetalShip)
         {
            this.isBoom = true;
         }
         if(forseContact > 60)
         {
            this.isBoom = true;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.isBoom == false)
         {
            if(this.isGoUpWithOutVerevka == true && (this.objVerevka == null || this.objVerevka.isLive == false))
            {
               this.yLimit = -300;
            }
            this.setGo(new b2Vec2(0,this.startForseFly));
            if(Boolean(this.objVerevka) && this.objVerevka.isLive == false)
            {
               this.isBoom = true;
            }
            if(y < -300)
            {
               isLive = false;
            }
         }
         else
         {
            this.actionBlast();
         }
      }
      
      override public function actionIfInFire() : void
      {
         if(++this.timeInFire > 10)
         {
            this.isBoom = true;
         }
      }
      
      public function actionBlast() : void
      {
         if(this.isBlast == false)
         {
            ControlSounds.playSound("mBurst");
            destroyBody();
            movie.gotoAndPlay("fBurst");
            if(this.objVerevka)
            {
               this.objVerevka.setRemove();
            }
            this.isBlast = true;
            sendEvent("BALLOON_BREAK");
         }
         else if(movie.currentFrame == movie.totalFrames)
         {
            isLive = false;
         }
      }
      
      public function setGo(param1:b2Vec2, param2:Number = 4) : void
      {
         if(y > this.yLimit && isBodyCreated)
         {
            body.ApplyImpulse(param1,this.getVecF());
         }
      }
      
      private function getVecF() : b2Vec2
      {
         var _loc1_:Point = localToGlobal(this.pForForse);
         return new b2Vec2(_loc1_.x / scalePhysic,_loc1_.y / scalePhysic);
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         this.isBoom = true;
         return super.setBlastFromRocket();
      }
      
      override public function destroyAfterOutOfScreen() : void
      {
         var _loc1_:* = x - width / 2;
         var _loc2_:* = x + width / 2;
         var _loc3_:* = y - height / 2;
         var _loc4_:* = y + height / 2;
         if(_loc2_ < -100 || _loc1_ > 800 || _loc3_ > 700 || _loc4_ < -300)
         {
            isLive = false;
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findVer);
         removeThisFromArray(arrBaseBalloon);
         super.destroy();
      }
   }
}

