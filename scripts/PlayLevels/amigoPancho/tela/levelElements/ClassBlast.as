package PlayLevels.amigoPancho.tela.levelElements
{
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassBlast extends ClassBaseGameObject
   {
      
      public function ClassBlast(param1:String)
      {
         super(param1);
         movie.gotoAndPlay(4);
         movie.mouseChildren = false;
         movie.mouseEnabled = false;
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(movie.totalFrames == movie.currentFrame)
         {
            isLive = false;
         }
      }
   }
}

