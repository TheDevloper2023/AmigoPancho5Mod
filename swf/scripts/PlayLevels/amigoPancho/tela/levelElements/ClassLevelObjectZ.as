package PlayLevels.amigoPancho.tela.levelElements
{
   import flash.display.MovieClip;
   
   public class ClassLevelObjectZ extends ClassLevelObject
   {
      
      public function ClassLevelObjectZ(param1:String)
      {
         super(param1);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
   }
}

