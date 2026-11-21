package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   
   public class ClassBgRocket extends ClassLevelObject
   {
      
      public function ClassBgRocket(param1:String)
      {
         super(param1);
         arrPhysicParam = [0,0.2,0.2];
         setParentSprite(ClassLayers.spriteForBgRocket);
      }
   }
}

