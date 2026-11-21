package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassBaseSwitch;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassDragBySwitch extends ClassPrizmJointPerfom
   {
      
      private var lastPos:Point;
      
      private var startX:Number;
      
      private var startY:Number;
      
      public function ClassDragBySwitch(param1:String)
      {
         super(param1);
         setMouseReactOff();
         isCalculateForseContact = true;
         setParentSprite(ClassLayers.spriteForStatPic);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         prismaticJoint.EnableLimit(true);
         prismaticJoint.SetLimits(limit1.x,limit1.y);
         this.startX = x;
         this.startY = y;
         this.setOn(0);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
      }
      
      override public function setOn(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(isAction == false)
         {
            body.SetActive(true);
         }
         super.setOn(param1);
         if(Math.abs(param1) < 200)
         {
            prismaticJoint.EnableMotor(true);
            prismaticJoint.SetMotorSpeed(-this.getActionForse(param1 * 2.5));
            prismaticJoint.SetMaxMotorForce(700);
            _loc2_ = (this.startX - x) / scalePhysic;
            if(isVertical)
            {
               _loc2_ = (this.startY - y) / scalePhysic;
            }
            if(Math.abs(Math.abs(_loc2_) - Math.abs(limit1.x)) <= 0.01 || Math.abs(Math.abs(_loc2_) - Math.abs(limit1.y)) <= 0.01)
            {
               isOnLimit = true;
               return;
            }
            isOnLimit = false;
         }
      }
      
      public function getActionForse(param1:int) : Number
      {
         return param1 / 15;
      }
      
      override public function setOff() : void
      {
         super.setOff();
         this.setOn(0);
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         this.lastPos = getPosition();
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassBoxDestroy)
         {
            return true;
         }
         if(param1.body.GetType() == b2Body.b2_staticBody)
         {
            return false;
         }
         return super.shouldCollide(param1);
      }
      
      override public function setObjectSwitch(param1:ClassBaseSwitch) : void
      {
         super.setObjectSwitch(param1);
      }
   }
}

