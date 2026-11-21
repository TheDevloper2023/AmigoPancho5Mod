package PlayLevels.amigoPancho.tela.levelElements
{
   import Tela.ClassBaseGameObject;
   
   public class ClassYMax extends ClassBaseGameObject
   {
      
      public static var instance:ClassYMax;
      
      public function ClassYMax(param1:String)
      {
         super(param1);
         instance = this;
         visible = false;
      }
   }
}

