package PlayLevels.amigoPancho.tela.amigo
{
   public class ClassHandAmigo extends ClassPartAmigo
   {
      
      public function ClassHandAmigo(param1:String)
      {
         super(param1);
      }
      
      public function fOpen() : void
      {
         var _loc1_:String = movie.currentFrameLabel;
         _loc1_ += "Open";
         movie.gotoAndStop(_loc1_);
      }
   }
}

