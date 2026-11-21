package Tela
{
   public class ClassMultiShape extends ClassDestroyTelo
   {
      
      public function ClassMultiShape(param1:String)
      {
         super(param1);
         setDestroy(false);
      }
      
      override public function createPhysicShape() : void
      {
         setShapeMulti();
         if(arrShapes.length == 0)
         {
            setShapeBox(width,height);
         }
         super.createPhysicShape();
      }
   }
}

