package StructureGame
{
   import StructureGame.InterfaceGame.ClassButtonSound;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassOptions extends ClassBaseGameObject
   {
      
      private var buttonSound:ClassButtonSound;
      
      public function ClassOptions()
      {
         super("sOptions");
         movie.play();
         movie.b.close.addEventListener(MouseEvent.CLICK,this.setClose);
         this.buttonSound = new ClassButtonSound();
         this.buttonSound.setPosition(new Point(82.6,60),new Point(-35.7,60));
         movie.b.addChild(this.buttonSound);
      }
      
      private function setClose(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         movie.gotoAndPlay("close");
         addEventListener(Event.ENTER_FRAME,this.waitClose);
      }
      
      private function setCredits(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         var _loc2_:ClassSocial = new ClassSocial();
         addChild(_loc2_);
      }
      
      public function waitClose(param1:Event) : void
      {
         if(movie.currentFrameLabel == "s")
         {
            removeEventListener(Event.ENTER_FRAME,this.waitClose);
            this.destroy();
            parent.removeChild(this);
         }
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesStructur,param1);
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.waitClose);
         movie.b.close.removeEventListener(MouseEvent.CLICK,this.setClose);
         this.buttonSound.destroy();
         this.buttonSound.parent.removeChild(this.buttonSound);
         this.buttonSound = null;
         super.destroy();
      }
   }
}

