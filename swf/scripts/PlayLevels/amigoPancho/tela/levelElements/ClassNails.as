package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   
   public class ClassNails extends ClassKaktus
   {
      
      public function ClassNails(param1:String)
      {
         super(param1);
         movie.mouseChildren = false;
         movie.mouseEnabled = false;
         mouseChildren = false;
         mouseEnabled = false;
         setParentSprite(ClassLayers.spriteForPerformers);
      }
   }
}

