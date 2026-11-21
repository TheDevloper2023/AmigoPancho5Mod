package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassRotateBySwitch;
   
   public class ClassMillRotate extends ClassRotateBySwitch
   {
      
      public function ClassMillRotate(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForDynamic);
      }
   }
}

