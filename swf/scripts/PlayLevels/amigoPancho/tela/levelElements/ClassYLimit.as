package PlayLevels.amigoPancho.tela.levelElements
{
   import Tela.ClassBaseGameObject;
   
   public class ClassYLimit extends ClassBaseGameObject
   {
      
      public static var instance:ClassYLimit;
      
      public function ClassYLimit(param1:String)
      {
         super(param1);
         instance = this;
         visible = false;
      }
   }
}

