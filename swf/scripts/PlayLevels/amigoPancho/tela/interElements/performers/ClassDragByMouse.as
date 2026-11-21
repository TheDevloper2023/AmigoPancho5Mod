package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2MouseJoint;
   import Box2D.Dynamics.Joints.b2MouseJointDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassStatObjects;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassDragByMouse extends ClassPrizmJointPerfom
   {
      
      public var jointMouse:b2MouseJoint;
      
      private var p2:b2Vec2;
      
      private var isContactBegin:Boolean;
      
      public var isMoveWas:Boolean;
      
      private var isSoundWas:Boolean;
      
      private var isSoundBoomWas:Boolean;
      
      private var timerWaitCintact:int;
      
      public function ClassDragByMouse(param1:String)
      {
         super(param1);
         isCalculateForseContact = true;
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         this.isContactBegin = true;
         if(param1 is ClassStatObjects)
         {
            if(this.isSoundBoomWas == false)
            {
               ControlSounds.loadAndPlay("mMetalMetal",1,forseContact / 150,true);
               this.isSoundBoomWas = true;
            }
            this.timerWaitCintact = 0;
            removeEventListener(Event.ENTER_FRAME,this.waitPauseCintact);
            addEventListener(Event.ENTER_FRAME,this.waitPauseCintact);
         }
      }
      
      private function waitPauseCintact(param1:Event) : void
      {
         if(++this.timerWaitCintact > 3)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitPauseCintact);
            this.isSoundBoomWas = false;
         }
      }
      
      override public function setPreSolveContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
         super.setPreSolveContact(param1,param2);
      }
      
      override public function setBeginContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.setCustomGravity(new b2Vec2(0,0));
         body.SetLinearDamping(100);
      }
      
      public function createMouseJoint() : void
      {
         var _loc1_:b2MouseJointDef = null;
         _loc1_ = new b2MouseJointDef();
         _loc1_.bodyA = body.GetWorld().GetGroundBody();
         _loc1_.bodyB = body;
         _loc1_.target.Set(amigo5.mainStage.mouseX / scalePhysic,amigo5.mainStage.mouseY / scalePhysic);
         this.jointMouse = body.GetWorld().CreateJoint(_loc1_) as b2MouseJoint;
         this.jointMouse.SetFrequency(2);
         this.jointMouse.SetMaxForce(150 * body.GetMass());
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         super.mDown(param1);
         if(this.jointMouse == null)
         {
            body.SetLinearDamping(0.5);
            this.createMouseJoint();
         }
      }
      
      override public function setOn(param1:Number) : void
      {
         super.setOn(param1);
         mover(null);
         this.mDown(null);
      }
      
      override public function setOff() : void
      {
         super.setOff();
         this.mUpGlobal();
      }
      
      override public function mUpGlobal(param1:MouseEvent = null) : void
      {
         super.mUpGlobal();
         this.destroyMouse();
         this.isMoveWas = false;
         this.isSoundWas = false;
      }
      
      public function destroyMouse() : void
      {
         if(this.jointMouse)
         {
            body.GetWorld().DestroyJoint(this.jointMouse);
            body.SetLinearDamping(200);
            body.SetAwake(false);
            this.jointMouse = null;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(isTouchBegin)
         {
            this.p2 = new b2Vec2(stage.mouseX / scalePhysic,y / scalePhysic);
            if(isVertical)
            {
               this.p2 = new b2Vec2(x / scalePhysic,stage.mouseY / scalePhysic);
            }
            this.jointMouse.SetTarget(this.p2);
            if(speedBody > 0.5)
            {
               this.isMoveWas = true;
            }
            if(speedBody > 2 && this.isSoundWas == false)
            {
               this.isSoundWas = true;
               ControlSounds.loadAndPlay("mDrag",1,0.8,true);
            }
         }
         this.isContactBegin = false;
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.waitPauseCintact);
         super.destroy();
      }
   }
}

