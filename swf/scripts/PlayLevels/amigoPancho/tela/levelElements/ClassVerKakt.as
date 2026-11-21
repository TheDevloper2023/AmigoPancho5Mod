package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   
   public class ClassVerKakt extends ClassLevelObject
   {
      
      public function ClassVerKakt(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForKaktus);
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassKoluchFire)
         {
            return false;
         }
         if(param1 is ClassKaktusFire)
         {
            return false;
         }
         return super.shouldCollide(param1);
      }
   }
}

