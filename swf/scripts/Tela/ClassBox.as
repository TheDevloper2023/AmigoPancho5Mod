package Tela
{
   public class ClassBox extends ClassBaseBody
   {
      
      public function ClassBox(param1:String)
      {
         super(param1);
      }
      
      override public function createPhysicShape() : void
      {
         setShapeBox(width,height);
         super.createPhysicShape();
      }
   }
}

