package StructureGame
{
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassSocial extends ClassBaseGameObject
   {
      
      public function ClassSocial()
      {
         super("sSocial");
         movie.play();
         movie.b.close.addEventListener(MouseEvent.CLICK,this.setClose);
         movie.b.qabo.addEventListener(MouseEvent.CLICK,this.setQ);
         movie.b.a1.addEventListener(MouseEvent.CLICK,this.setA1);
         movie.b.a2.addEventListener(MouseEvent.CLICK,this.setA2);
         movie.b.a3.addEventListener(MouseEvent.CLICK,this.setA3);
         movie.b.a4.addEventListener(MouseEvent.CLICK,this.setA4);
         movie.b.ai.addEventListener(MouseEvent.CLICK,this.setAi);
         movie.b.ai.visible = false;
         movie.b.f.addEventListener(MouseEvent.CLICK,this.setF);
         movie.b.f.visible = false;
         movie.b.t.addEventListener(MouseEvent.CLICK,this.setT);
         movie.b.t.visible = false;
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
      
      private function setA4(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo4");
      }
      
      private function setAi(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLink("https://itunes.apple.com/app/id687695808");
      }
      
      private function setClose(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         movie.gotoAndPlay("close");
         addEventListener(Event.ENTER_FRAME,this.waitClose);
      }
      
      private function setQ(param1:MouseEvent) : void
      {
      }
      
      private function setF(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLink("https://www.facebook.com/QaiboGames");
      }
      
      private function setT(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLink("https://twitter.com/QaiboGames");
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
         movie.b.qabo.removeEventListener(MouseEvent.CLICK,this.setQ);
         movie.b.f.removeEventListener(MouseEvent.CLICK,this.setF);
         movie.b.t.removeEventListener(MouseEvent.CLICK,this.setT);
         movie.b.a1.removeEventListener(MouseEvent.CLICK,this.setA1);
         movie.b.a2.removeEventListener(MouseEvent.CLICK,this.setA2);
         movie.b.a3.removeEventListener(MouseEvent.CLICK,this.setA3);
         movie.b.a4.removeEventListener(MouseEvent.CLICK,this.setA4);
         movie.b.ai.removeEventListener(MouseEvent.CLICK,this.setAi);
         super.destroy();
      }
   }
}

