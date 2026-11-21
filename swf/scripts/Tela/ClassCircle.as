package Tela
{
   public class ClassCircle extends ClassPol
   {
      
      public function ClassCircle(param1:String)
      {
         super(param1);
      }
      
      override public function createPhysicShape() : void
      {
         setShapeCircle(width);
         super.createPhysicShape();
      }
   }
}

