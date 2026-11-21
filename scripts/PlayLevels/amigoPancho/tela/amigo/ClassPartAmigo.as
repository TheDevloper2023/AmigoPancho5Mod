package PlayLevels.amigoPancho.tela.amigo
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.tela.ClassPartHero;
   import PlayLevels.amigoPancho.tela.levelElements.ClassGrad;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKoluchFire;
   import PlayLevels.amigoPancho.tela.levelElements.ClassVerevka;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassPartAmigo extends ClassPartHero
   {
      
      public function ClassPartAmigo(param1:String)
      {
         super(param1);
         arrPhysicParam = [1,0.3,0.2];
         isTestInFire = true;
         isCalculateForseContact = true;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.SetAngularVelocity(0.5);
         addEventListener(Event.ENTER_FRAME,this.setFrame);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         var _loc4_:Boolean = true;
         if(param1 is ClassPartAmigo)
         {
            _loc4_ = false;
         }
         if(param1 is ClassBalloonAmigo)
         {
            _loc4_ = false;
         }
         if(param1 is ClassVerevka)
         {
            _loc4_ = false;
         }
         if(_loc4_ && forseContact > 1 || param1 is ClassKoluchFire || param1 is ClassGrad)
         {
            amigo5.mainStage.dispatchEvent(new Event("PART_AMIGO_CONTACT"));
         }
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassKoluchFire)
         {
            param1.isLive = false;
            amigo5.mainStage.dispatchEvent(new Event("PART_AMIGO_CONTACT"));
            return false;
         }
         return true;
      }
      
      override public function setInFan() : void
      {
         ControlSounds.stopSound("mHeroFall");
         ControlSounds.playSound("mHeroDieFan",1.5);
      }
      
      private function setFrame(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.setFrame);
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.setFrame);
         super.destroy();
      }
   }
}

