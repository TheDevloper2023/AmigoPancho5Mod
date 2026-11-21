package PlayLevels.amigoPancho.tela
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassSteklo extends ClassLevelObject
   {
      
      private static var numSound:int = 0;
      
      private var waitCrackAfterStart:int = 20;
      
      public function ClassSteklo(param1:String)
      {
         super(param1);
         arrPhysicParam = [1,0.2,0.2];
         setParentSprite(ClassLayers.spriteForKaktus);
         visible = false;
      }
      
      override public function setBeginContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
         super.setBeginContact(param1,param2);
      }
      
      override public function setAnaliseUdar(param1:ClassBaseBody = null) : void
      {
         super.setAnaliseUdar(param1);
      }
      
      override public function setEffectFromBomb(param1:Array = null) : void
      {
         this.setBreak();
      }
      
      override public function setCrack() : void
      {
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         if(Number(param1.attribute("strength") > 0))
         {
            criticEn = Number(param1.attribute("strength"));
            criticForCrackEn = criticEn / 2;
            tempCriticEn = criticEn;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         --this.waitCrackAfterStart;
      }
      
      override public function setBreak(param1:int = 0) : void
      {
         if(isBreak)
         {
            return;
         }
         super.setBreak();
         this.playSoundIfBreak();
      }
      
      public function playSoundIfBreak() : void
      {
         ++numSound;
         if(numSound > 5)
         {
            numSound = 2;
         }
         if(numSound == 1)
         {
            numSound = 2;
         }
         ControlSounds.playSound("steklo_" + numSound,0.6,1);
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

