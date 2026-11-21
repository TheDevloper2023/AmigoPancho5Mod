package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassWheelKoluch extends ClassKaktus
   {
      
      private var pauseSound:int = 10;
      
      public function ClassWheelKoluch(param1:String)
      {
         super(param1);
         isCalculateForseContact = true;
         isStopSound = true;
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(forseContact > 20 && this.pauseSound < 0)
         {
            this.pauseSound = 10;
            ControlSounds.playSound("mStoneWood",0.7);
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         --this.pauseSound;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

