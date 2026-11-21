package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassMetalShip extends ClassLevelObject
   {
      
      private var pauseSound:int = 20;
      
      public function ClassMetalShip(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForKaktus);
         isCalculateForseContact = true;
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(forseContact > 20 && this.pauseSound < 0)
         {
            this.pauseSound = 20;
            ControlSounds.playSound("mMetalWood");
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         --this.pauseSound;
      }
   }
}

