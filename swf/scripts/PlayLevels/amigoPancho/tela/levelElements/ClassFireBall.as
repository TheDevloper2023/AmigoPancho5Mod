package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassFireBall extends ClassLevelObjectZ
   {
      
      private var objCannon:ClassCannon;
      
      private var isContact:Boolean;
      
      public function ClassFireBall()
      {
         super("ball");
         arrPhysicParam = [1,0.2,0.05];
         ClassBaseLevel.arrGameObjects.push(this);
         movie.play();
         setParentSprite(ClassLayers.spriteForRocket);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.objCannon = param1[0] as ClassCannon;
         body.SetFixedRotation(true);
         body.setCustomGravity(new b2Vec2(0,1));
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(param1 != this.objCannon && this.isContact == false)
         {
            this.isContact = true;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         super.update(param1);
         if(this.isContact == true)
         {
            _loc2_ = !(contactObject as ClassLevelObject).setBlastFromRocket();
            if(_loc2_)
            {
               startBlow("sBlowUp01",0.9);
               movie.stop();
               ControlSounds.playSound("fireball",0.6);
            }
            isLive = false;
            this.isContact = false;
         }
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 == this.objCannon)
         {
            return false;
         }
         if(param1 is ClassFireBall)
         {
            return false;
         }
         return true;
      }
      
      override public function destroy() : void
      {
         this.objCannon = null;
         super.destroy();
      }
   }
}

