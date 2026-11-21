package PlayLevels.amigoPancho
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.events.MouseEvent;
   
   public class ClassTableLinks extends ClassLevelObject
   {
      
      public function ClassTableLinks(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSuperStat);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         movie.a1.addEventListener(MouseEvent.CLICK,this.setA1);
         movie.a2.addEventListener(MouseEvent.CLICK,this.setA2);
         movie.a3.addEventListener(MouseEvent.CLICK,this.setA3);
      }
      
      private function setA1(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo1");
      }
      
      private function setA2(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo2");
      }
      
      private function setA3(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo3");
      }
      
      override public function destroy() : void
      {
         movie.a1.removeEventListener(MouseEvent.CLICK,this.setA1);
         movie.a2.removeEventListener(MouseEvent.CLICK,this.setA2);
         movie.a3.removeEventListener(MouseEvent.CLICK,this.setA3);
         super.destroy();
      }
   }
}

