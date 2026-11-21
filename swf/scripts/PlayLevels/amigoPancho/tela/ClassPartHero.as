package PlayLevels.amigoPancho.tela
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.bees.ClassBee;
   import PlayLevels.amigoPancho.tela.levelElements.ClassGrad;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObjectZ;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   
   public class ClassPartHero extends ClassLevelObjectZ
   {
      
      private var numColor:Number = 1;
      
      public function ClassPartHero(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(param1 is ClassBee)
         {
            sendEvent("HIT_BEE");
         }
         if(param1 is ClassGrad && (param1 as ClassGrad).isGrad == false)
         {
            sendEvent("HIT_KAPLYA");
         }
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         sendEvent("HIT_ROCKET");
         return true;
      }
      
      override public function actionIfInFire() : void
      {
         sendEvent("HIT_FIRE");
      }
      
      public function createBlack() : void
      {
         addEventListener(Event.ENTER_FRAME,this.updateBlack);
      }
      
      public function setInFan() : void
      {
      }
      
      private function updateBlack(param1:Event) : void
      {
         this.numColor -= 0.05;
         transform.colorTransform = new ColorTransform(this.numColor,this.numColor,this.numColor);
         if(this.numColor <= 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.updateBlack);
         }
      }
      
      public function createGreen() : void
      {
         addEventListener(Event.ENTER_FRAME,this.updateGrean);
      }
      
      private function updateGrean(param1:Event) : void
      {
         this.numColor -= 0.05;
         transform.colorTransform = new ColorTransform(this.numColor + 0.1,0.7,this.numColor);
         if(this.numColor <= 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.updateGrean);
         }
      }
      
      override public function destroy() : void
      {
         sendEvent("PART_DIE");
         removeEventListener(Event.ENTER_FRAME,this.updateBlack);
         removeEventListener(Event.ENTER_FRAME,this.updateGrean);
         super.destroy();
      }
   }
}

