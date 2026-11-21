package PlayLevels.amigoPancho.tela
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import PlayLevels.amigoPancho.tela.levelElements.ClassPackage;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassMetal extends ClassLevelObject
   {
      
      private var pauseContact:int = 0;
      
      private var firstContact:Boolean;
      
      public function ClassMetal(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         visible = false;
         amigo5.mainStage.addEventListener("WOOD_BREAK",this.wb);
      }
      
      private function wb(param1:Event) : void
      {
         isLive = false;
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassPackage)
         {
            return true;
         }
         return false;
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.removeEventListener("WOOD_BREAK",this.wb);
         super.destroy();
      }
   }
}

