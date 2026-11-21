package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassStone extends ClassLevelObject
   {
      
      private var pauseSound:int = 20;
      
      private var countSount:int;
      
      public function ClassStone(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForDynamic);
         isCalculateForseContact = true;
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(forseContact > 25 && this.pauseSound < 0 && this.countSount < 2)
         {
            this.pauseSound = 20;
            ++this.countSount;
            ControlSounds.playSound("mStoneWood");
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         --this.pauseSound;
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         startBlow("sBlowUp01",1.5,false);
         setLowAlpha(true,0.1);
         isDestroyBody = true;
         return true;
      }
   }
}

