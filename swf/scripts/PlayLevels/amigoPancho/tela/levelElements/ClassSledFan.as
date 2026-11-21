package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   
   public class ClassSledFan extends ClassLevelObjectZ
   {
      
      public function ClassSledFan(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForVeter);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         destroyBody();
      }
      
      override public function stopMove() : void
      {
         super.stopMove();
         isLive = false;
      }
   }
}

