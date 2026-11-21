package Tela
{
   public class ClassTriangle extends ClassPol
   {
      
      public function ClassTriangle(param1:String)
      {
         super(param1);
      }
      
      override public function createPhysicShape() : void
      {
         setShapeTriangle(this);
         super.createPhysicShape();
      }
   }
}

