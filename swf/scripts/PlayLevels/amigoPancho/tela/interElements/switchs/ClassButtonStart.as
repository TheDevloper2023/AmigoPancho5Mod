package PlayLevels.amigoPancho.tela.interElements.switchs
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragTimerKol;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassButtonStart extends ClassLevelObject
   {
      
      private var isContact:Boolean;
      
      private var isActive:Boolean;
      
      public function ClassButtonStart(param1:String)
      {
         super(param1);
         this.isActive = true;
         setParentSprite(ClassLayers.spriteForSuperStat);
         movie.btn.gotoAndStop(1);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(this.isContact == false)
         {
            this.isContact = true;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:ClassDragTimerKol = null;
         super.update(param1);
         if(this.isContact && this.isActive)
         {
            movie.btn.gotoAndPlay(2);
            for each(_loc2_ in ClassDragTimerKol.arrDrag)
            {
               _loc2_.setOn(0);
            }
            this.isActive = false;
         }
      }
   }
}

