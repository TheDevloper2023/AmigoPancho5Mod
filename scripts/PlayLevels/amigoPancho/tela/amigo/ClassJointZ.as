package PlayLevels.amigoPancho.tela.amigo
{
   import Tela.ClassJoint;
   import flash.display.MovieClip;
   
   public class ClassJointZ extends ClassJoint
   {
      
      public function ClassJointZ(param1:String)
      {
         super(param1);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
   }
}

