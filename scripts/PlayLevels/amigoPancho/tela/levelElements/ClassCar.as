package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   
   public class ClassCar extends ClassLevelObject
   {
      
      public function ClassCar(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForKaktGorsh);
      }
   }
}

