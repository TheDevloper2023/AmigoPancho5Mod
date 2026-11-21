package PlayLevels.amigoPancho
{
   import PlayLevels.amigoPancho.tela.amigo.ClassHeadAmigo;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.ClassBaseBody;
   import Tela.ClassBaseGameObject;
   import Tela.Hints.ClassHint;
   import flash.events.Event;
   
   public class ClassAreaNextHint extends ClassLevelObject
   {
      
      private var head:ClassHeadAmigo;
      
      private var isWasShowNext:Boolean;
      
      public function ClassAreaNextHint(param1:String)
      {
         super(param1);
         isPhysic = false;
         this.isWasShowNext = false;
         addEventListener(Event.ENTER_FRAME,this.findHead);
         visible = false;
      }
      
      public function findHead(param1:Event) : void
      {
         var _loc2_:ClassBaseGameObject = null;
         removeEventListener(Event.ENTER_FRAME,this.findHead);
         for each(_loc2_ in ClassBaseBody.arrObject)
         {
            if(_loc2_ is ClassHeadAmigo)
            {
               this.head = _loc2_ as ClassHeadAmigo;
            }
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.isWasShowNext == false)
         {
            if(this.head.y < y)
            {
               this.isWasShowNext = true;
               ClassHint.showNextHint();
               isLive = false;
            }
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findHead);
         this.head = null;
         super.destroy();
      }
   }
}

