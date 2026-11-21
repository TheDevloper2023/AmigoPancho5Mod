package PlayLevels.BaseLevels
{
   import Box2D.Dynamics.b2ContactFilter;
   import Box2D.Dynamics.b2Fixture;
   import Tela.ClassBaseBody;
   
   public class ClassContactFilter extends b2ContactFilter
   {
      
      public function ClassContactFilter()
      {
         super();
      }
      
      override public function ShouldCollide(param1:b2Fixture, param2:b2Fixture) : Boolean
      {
         var _loc3_:ClassBaseBody = null;
         var _loc4_:ClassBaseBody = null;
         if(param1.GetBody().GetUserData() is ClassBaseBody && param2.GetBody().GetUserData() is ClassBaseBody)
         {
            _loc3_ = param1.GetBody().GetUserData();
            _loc4_ = param2.GetBody().GetUserData();
            return this.ShouldCollide2(_loc3_,_loc4_) && this.ShouldCollide2(_loc4_,_loc3_);
         }
         return true;
      }
      
      public function ShouldCollide2(param1:ClassBaseBody, param2:ClassBaseBody) : Boolean
      {
         if(!param1 || !param2)
         {
            return false;
         }
         if(!param1.shouldCollide(param2) || !param2.shouldCollide(param1))
         {
            return false;
         }
         return true;
      }
   }
}

