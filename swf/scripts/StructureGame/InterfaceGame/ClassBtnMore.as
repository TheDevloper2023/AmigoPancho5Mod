package StructureGame.InterfaceGame
{
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class ClassBtnMore extends ClassBaseGameObject
   {
      
      public function ClassBtnMore()
      {
         super("btnMore");
         movie.mg.but_more.addEventListener(MouseEvent.CLICK,this.goMore);
         movie.mg.but_walk.addEventListener(MouseEvent.CLICK,this.goWalk);
         movie.ap.ai.addEventListener(MouseEvent.CLICK,this.setAi);
         movie.ap.ai.visible = false;
         movie.mg.like.addEventListener(MouseEvent.CLICK,this.goLike);
      }
      
      private function goLike(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkLike();
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesInterface,param1);
      }
      
      private function setAi(param1:MouseEvent) : void
      {
      }
      
      private function goMore(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkMore();
      }
      
      private function goWalk(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkSolution();
      }
      
      override public function destroy() : void
      {
         movie.mg.like.removeEventListener(MouseEvent.CLICK,this.goLike);
         movie.mg.but_more.removeEventListener(MouseEvent.CLICK,this.goMore);
         movie.mg.but_walk.removeEventListener(MouseEvent.CLICK,this.goWalk);
         movie.ap.ai.removeEventListener(MouseEvent.CLICK,this.setAi);
         super.destroy();
      }
   }
}

