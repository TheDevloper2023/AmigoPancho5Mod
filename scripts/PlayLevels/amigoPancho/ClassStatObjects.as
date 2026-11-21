package PlayLevels.amigoPancho
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   
   public class ClassStatObjects extends ClassLevelObject
   {
      
      public static var arrStatObj:Array = [];
      
      public function ClassStatObjects(param1:String)
      {
         super(param1);
         arrPhysicParam = [0,0,0];
         setParentSprite(ClassLayers.spriteForStatic);
         arrStatObj.push(this);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         createStatic();
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrStatObj);
         super.destroy();
      }
   }
}

