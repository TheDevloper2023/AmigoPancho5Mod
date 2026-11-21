package PlayLevels.amigoPancho.tela
{
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassMultiShape;
   
   public class ClassZveno extends ClassMultiShape
   {
      
      public function ClassZveno(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForBlockElement);
      }
   }
}

