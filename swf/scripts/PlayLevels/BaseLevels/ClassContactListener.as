package PlayLevels.BaseLevels
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2ContactListener;
   import Tela.ClassBaseBody;
   
   public class ClassContactListener extends b2ContactListener
   {
      
      public function ClassContactListener()
      {
         super();
      }
      
      override public function BeginContact(param1:b2Contact) : void
      {
         var _loc2_:ClassBaseBody = null;
         var _loc3_:ClassBaseBody = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is ClassBaseBody && param1.GetFixtureB().GetBody().GetUserData() is ClassBaseBody)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
            if(_loc2_ is ClassBaseBody)
            {
               (_loc2_ as ClassBaseBody).setBeginContact(_loc3_,param1);
            }
            if(_loc3_ is ClassBaseBody)
            {
               (_loc3_ as ClassBaseBody).setBeginContact(_loc2_,param1);
            }
         }
      }
      
      override public function EndContact(param1:b2Contact) : void
      {
         var _loc2_:ClassBaseBody = null;
         var _loc3_:ClassBaseBody = null;
         var _loc4_:b2WorldManifold = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is ClassBaseBody && param1.GetFixtureB().GetBody().GetUserData() is ClassBaseBody)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
            _loc4_ = new b2WorldManifold();
            param1.GetWorldManifold(_loc4_);
            if(_loc2_ is ClassBaseBody)
            {
               (_loc2_ as ClassBaseBody).setEndContact(_loc3_,param1);
            }
            if(_loc3_ is ClassBaseBody)
            {
               (_loc3_ as ClassBaseBody).setEndContact(_loc2_,param1);
            }
         }
      }
      
      override public function PostSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         var _loc3_:ClassBaseBody = null;
         var _loc4_:ClassBaseBody = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is ClassBaseBody && param1.GetFixtureB().GetBody().GetUserData() is ClassBaseBody)
         {
            _loc3_ = param1.GetFixtureA().GetBody().GetUserData();
            _loc4_ = param1.GetFixtureB().GetBody().GetUserData();
            if(_loc3_ is ClassBaseBody)
            {
               (_loc3_ as ClassBaseBody).setPostSolveContact(_loc4_,param1,param2);
            }
            if(_loc4_ is ClassBaseBody)
            {
               (_loc4_ as ClassBaseBody).setPostSolveContact(_loc3_,param1,param2);
            }
         }
      }
      
      override public function PreSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:ClassBaseBody = null;
         var _loc4_:ClassBaseBody = null;
         var _loc5_:b2WorldManifold = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is ClassBaseBody && param1.GetFixtureB().GetBody().GetUserData() is ClassBaseBody)
         {
            _loc3_ = param1.GetFixtureA().GetBody().GetUserData();
            _loc4_ = param1.GetFixtureB().GetBody().GetUserData();
            _loc5_ = new b2WorldManifold();
            param1.GetWorldManifold(_loc5_);
            if(_loc3_ is ClassBaseBody)
            {
               (_loc3_ as ClassBaseBody).setPreSolveContact(_loc4_,param1);
            }
            if(_loc4_ is ClassBaseBody)
            {
               (_loc4_ as ClassBaseBody).setPreSolveContact(_loc3_,param1);
            }
         }
      }
   }
}

