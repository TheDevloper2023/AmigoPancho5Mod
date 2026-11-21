package StructureGame
{
   import ActionsBeforeGame.ClassPreloader;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import StructureGame.InterfaceGame.ClassButtonSound;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassPause extends ClassBaseGameObject
   {
      
      private var buttonSound:ClassButtonSound;
      
      public function ClassPause()
      {
         super("sPauseMenu");
         movie.play();
         movie.b.close.addEventListener(MouseEvent.CLICK,this.setClose);
         movie.b.r.addEventListener(MouseEvent.CLICK,this.setR);
         movie.b.n.addEventListener(MouseEvent.CLICK,this.setN);
         movie.b.s.addEventListener(MouseEvent.CLICK,this.setS);
         movie.b.d.addEventListener(MouseEvent.CLICK,this.setD);
         movie.b.but_more.addEventListener(MouseEvent.CLICK,this.goMore);
         movie.b.but_solution.addEventListener(MouseEvent.CLICK,this.goSolution);
         this.buttonSound = new ClassButtonSound();
         this.buttonSound.setPosition(new Point(-129,-17.65),new Point(-127.85,64.1),1);
         movie.b.addChild(this.buttonSound);
         amigo5.mainStage.dispatchEvent(new Event("ALL_SOUND_OFF"));
         ClassPlayLevel.isUpdate = false;
         ClassPreloader.showLogo(this);
      }
      
      private function goMore(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkMore();
      }
      
      private function goSolution(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkSolution();
      }
      
      private function setClose(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassPlayLevel.isUpdate = true;
         amigo5.mainStage.dispatchEvent(new Event("ALL_SOUND_ON"));
         movie.gotoAndPlay("close");
         addEventListener(Event.ENTER_FRAME,this.waitClose);
         ClassPreloader.hideLogo();
      }
      
      private function setR(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         sendEvent("RESET");
      }
      
      private function setN(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         sendEvent("NEXT");
      }
      
      private function setS(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         sendEvent("SELECTOR");
      }
      
      private function setD(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         sendEvent("DRESS");
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
         return ClassMath.getCopyMovie(amigo5.swfMoviesInterface,param1);
      }
      
      override public function destroy() : void
      {
         sendEvent("CLOSE_FINISH");
         amigo5.mainStage.dispatchEvent(new Event("ALL_SOUND_ON"));
         ClassPlayLevel.isUpdate = true;
         removeEventListener(Event.ENTER_FRAME,this.waitClose);
         movie.b.but_more.removeEventListener(MouseEvent.CLICK,this.goMore);
         movie.b.close.removeEventListener(MouseEvent.CLICK,this.setClose);
         movie.b.r.removeEventListener(MouseEvent.CLICK,this.setR);
         movie.b.n.removeEventListener(MouseEvent.CLICK,this.setN);
         movie.b.s.removeEventListener(MouseEvent.CLICK,this.setS);
         movie.b.d.removeEventListener(MouseEvent.CLICK,this.setD);
         movie.b.but_solution.removeEventListener(MouseEvent.CLICK,this.goSolution);
         super.destroy();
      }
   }
}

