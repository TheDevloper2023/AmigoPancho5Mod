package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassKaktus extends ClassLevelObject
   {
      
      public var isStopSound:Boolean;
      
      private var isSoundWas:Boolean;
      
      private var pauseSound:int;
      
      private var countSound:int;
      
      public var isColideWithKoluch:Boolean;
      
      public function ClassKaktus(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForKaktus);
         isTestInFire = true;
         isCalculateForseContact = true;
         this.isColideWithKoluch = true;
         if(movie.ver)
         {
            movie.ver.visible = false;
         }
         if(ClassBaseLevel.numLevel > 15)
         {
            movie.gotoAndStop(2);
         }
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         addEventListener(Event.ENTER_FRAME,this.findVer);
      }
      
      private function findVer(param1:Event) : void
      {
         var _loc2_:ClassVerevka = null;
         removeEventListener(Event.ENTER_FRAME,this.findVer);
         for each(_loc2_ in ClassVerevka.arrVer)
         {
            if(_loc2_.hitTestObject(this) && Boolean(movie.ver))
            {
               movie.ver.visible = true;
            }
         }
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(forseContact > 2 && this.isSoundWas == false && this.isStopSound == false)
         {
            ControlSounds.loadAndPlay("mCactus",1,1,true);
            this.isSoundWas = true;
            addEventListener(Event.ENTER_FRAME,this.waitSound);
            if(++this.countSound > 3)
            {
               this.isStopSound = true;
            }
         }
      }
      
      public function waitSound(param1:Event) : void
      {
         if(++this.pauseSound > 20)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitSound);
            this.isSoundWas = false;
            this.pauseSound = 0;
         }
      }
      
      override public function actionIfInFire() : void
      {
         ControlSounds.loadAndPlay("mFireDie",1,1.5,true);
         startBlow("sBlowUp01",0.7,false);
         isLive = false;
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         startBlow("sBlowUp01",1.5);
         isDestroyBody = true;
         return true;
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:String = param1.attribute("l_damp");
         var _loc3_:String = param1.attribute("a_damp");
         if(Number(_loc2_) == -0.2)
         {
            this.isColideWithKoluch = false;
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.waitSound);
         removeEventListener(Event.ENTER_FRAME,this.findVer);
         super.destroy();
      }
   }
}

