package PlayLevels.amigoPancho.tela.levelElements.codeSwitch
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassSwitchCode extends ClassLevelObject
   {
      
      public var count:int = 0;
      
      public var numCode:int = 0;
      
      public var isTrue:Boolean;
      
      public function ClassSwitchCode(param1:String)
      {
         super(param1);
         movie.up.addEventListener(MouseEvent.MOUSE_DOWN,this.downUp);
         movie.down.addEventListener(MouseEvent.MOUSE_DOWN,this.downDown);
         movie.count.text = this.count.toString();
         movie.ind.gotoAndStop(1);
         mouseChildren = true;
         mouseEnabled = true;
         setParentSprite(ClassLayers.spriteForSwitch);
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:Number = Number(param1.attribute("l_damp"));
         if(_loc2_ != -0.1)
         {
            this.numCode = _loc2_;
         }
      }
      
      private function downUp(param1:MouseEvent) : void
      {
         this.changeCount(1);
      }
      
      private function downDown(param1:MouseEvent) : void
      {
         this.changeCount(-1);
      }
      
      private function changeCount(param1:int) : void
      {
         this.count += param1;
         if(this.count > 9)
         {
            this.count = 0;
         }
         if(this.count < 0)
         {
            this.count = 9;
         }
         movie.count.text = this.count.toString();
         this.isTrue = this.count == this.numCode;
         dispatchEvent(new Event(EVENT));
      }
      
      public function setOpen() : void
      {
         movie.ind.gotoAndStop(2);
      }
      
      public function setClose() : void
      {
         movie.ind.gotoAndStop(1);
      }
      
      override public function destroy() : void
      {
         movie.up.removeEventListener(MouseEvent.MOUSE_DOWN,this.downUp);
         movie.down.removeEventListener(MouseEvent.MOUSE_DOWN,this.downDown);
         super.destroy();
      }
   }
}

