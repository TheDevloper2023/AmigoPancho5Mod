package PlayLevels.amigoPancho
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   
   public class ClassWelcomTable extends ClassLevelObject
   {
      
      public function ClassWelcomTable(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForStatic);
         if(ClassSetDataGame.lastLevel == 15)
         {
            movie.gotoAndStop(1);
         }
         if(ClassSetDataGame.lastLevel == 31)
         {
            movie.gotoAndStop(2);
         }
      }
   }
}

