package PlayLevels.amigoPancho.tela.interElements.switchs
{
   import PlayLevels.amigoPancho.ClassLayers;
   import flash.events.MouseEvent;
   
   public class ClassSwitchButon extends ClassBaseSwitch
   {
      
      public function ClassSwitchButon(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSwitch);
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         super.mDown(param1);
         if(objectPerfomer)
         {
            objectPerfomer.setOn(0);
            movie.gotoAndStop(3);
         }
         mUpGlobal(param1);
         setMouseReactOff();
      }
   }
}

