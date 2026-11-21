package PlayLevels.amigoPancho.tela.levelElements
{
   import Tela.ClassBaseBody;
   
   public class ClassStatColide extends ClassLevelObject
   {
      
      public function ClassStatColide(param1:String)
      {
         super(param1);
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         return super.shouldCollide(param1);
      }
   }
}

