package PlayLevels.amigoPancho.tela.levelElements
{
   import flash.display.MovieClip;
   
   public class ClassBalloonBad2 extends ClassBalloonBad
   {
      
      public function ClassBalloonBad2(param1:String)
      {
         super(param1);
         trace("ClassBalloonBad2");
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         startForseFly = -1.42 * body.GetMass();
      }
   }
}

