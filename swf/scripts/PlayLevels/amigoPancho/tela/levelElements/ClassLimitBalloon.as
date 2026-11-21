package PlayLevels.amigoPancho.tela.levelElements
{
   import Tela.ClassBaseBody;
   
   public class ClassLimitBalloon extends ClassLevelObject
   {
      
      public function ClassLimitBalloon(param1:String)
      {
         super(param1);
         visible = false;
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassBaseBalloon)
         {
            return true;
         }
         return false;
      }
   }
}

