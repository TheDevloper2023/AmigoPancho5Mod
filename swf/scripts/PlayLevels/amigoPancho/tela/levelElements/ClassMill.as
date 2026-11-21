package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   
   public class ClassMill extends ClassLevelObject
   {
      
      public function ClassMill(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForDynamic);
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:String = param1.attribute("a_damp");
      }
   }
}

