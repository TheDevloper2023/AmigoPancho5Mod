package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   
   public class ClassKletka extends ClassLevelObject
   {
      
      public function ClassKletka(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForDynamic);
      }
   }
}

