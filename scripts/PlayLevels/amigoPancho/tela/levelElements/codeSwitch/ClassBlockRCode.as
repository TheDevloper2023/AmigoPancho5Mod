package PlayLevels.amigoPancho.tela.levelElements.codeSwitch
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassBlockPerfomer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ClassBlockRCode extends ClassBlockPerfomer
   {
      
      public function ClassBlockRCode(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSuperStat);
         this.setClose();
      }
      
      override public function getSpriteForLight() : Sprite
      {
         return movie.but;
      }
      
      public function setClose() : void
      {
         movie.but.gotoAndStop(1);
         setMouseReactOff();
      }
      
      public function setOpen() : void
      {
         movie.but.gotoAndStop(2);
         setMouseReactOn();
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         super.mDown(param1);
         setOn(0);
         movie.but.gotoAndStop(3);
         setMouseReactOff();
         mouseUpGlobal();
         arrPerfCont = [];
      }
   }
}

