package PlayLevels.amigoPancho.tela
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   
   public class ClassStena extends ClassLevelObject
   {
      
      public function ClassStena(param1:String)
      {
         super(param1);
         setDestroy(true,1000,200,true,2,false);
         arrPhysicParam = [0,0.4,0.2];
      }
   }
}

