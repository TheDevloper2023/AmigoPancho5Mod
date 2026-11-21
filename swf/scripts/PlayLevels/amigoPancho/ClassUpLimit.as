package PlayLevels.amigoPancho
{
   import Tela.ClassBaseGameObject;
   
   public class ClassUpLimit extends ClassBaseGameObject
   {
      
      public static var yUpLimit:Number;
      
      public function ClassUpLimit(param1:String)
      {
         super(param1);
         visible = false;
         yUpLimit = y;
      }
   }
}

