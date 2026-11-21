package PlayLevels.amigoPancho.tela.levelElements
{
   import flash.display.MovieClip;
   
   public class ClassBalloonBad3 extends ClassBalloonBad
   {
      
      public function ClassBalloonBad3(param1:String)
      {
         super(param1);
         trace("ClassBalloonBad3");
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         startForseFly = -0.9 * body.GetMass();
      }
   }
}

