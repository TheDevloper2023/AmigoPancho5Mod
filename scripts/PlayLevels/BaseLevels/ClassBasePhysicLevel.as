package PlayLevels.BaseLevels
{
   import Box2D.Collision.b2AABB;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import Tela.ClassBaseBody;
   import Tela.ClassBaseGameObject;
   import Tela.ClassDestroyTelo;
   import Tela.ClassOscolok;
   import flash.events.Event;
   
   public class ClassBasePhysicLevel extends ClassBaseLevel
   {
      
      public static var world:b2World;
      
      public static var arrPhysicObjects:Array;
      
      public static const m_iterations:int = 10;
      
      public static const m_timeStep:Number = 1 / 30;
      
      public static const m_physScale:Number = 30;
      
      public static var gravity:b2Vec2 = new b2Vec2(0,9.8);
      
      public static var kTimeStep:Number = 1;
      
      public function ClassBasePhysicLevel()
      {
         arrPhysicObjects = [];
         createWorld();
         super();
      }
      
      public static function createWorld() : void
      {
         var _loc1_:b2AABB = new b2AABB();
         _loc1_.lowerBound.Set(-300,-300);
         _loc1_.upperBound.Set(200,200);
         world = new b2World(gravity,false);
         world.SetContactListener(new ClassContactListener());
         world.SetContactFilter(new ClassContactFilter());
      }
      
      override public function update(param1:Event = null) : void
      {
         world.Step(m_timeStep * kTimeStep,10,10);
         super.update();
      }
      
      override public function updateGameObject(param1:ClassMouseEvents) : void
      {
         var _loc2_:ClassDestroyTelo = null;
         super.updateGameObject(param1);
         if(param1 is ClassDestroyTelo)
         {
            _loc2_ = param1 as ClassDestroyTelo;
            if(_loc2_.isReadyToGiveFragments)
            {
               if(!_loc2_.isCrash)
               {
                  this.startDestroyFragmentsGameObject(_loc2_);
               }
            }
         }
      }
      
      public function startDestroyFragmentsGameObject(param1:ClassDestroyTelo) : void
      {
         arrNewObjectGame = arrNewObjectGame.concat(param1.getFragments());
      }
      
      override public function addNewGameObjects() : void
      {
         var _loc1_:ClassMouseEvents = null;
         if(arrNewObjectGame.length)
         {
            for each(_loc1_ in arrNewObjectGame)
            {
               if(_loc1_ is ClassBaseBody && !(_loc1_ is ClassOscolok))
               {
                  arrPhysicObjects = arrPhysicObjects.concat(arrNewObjectGame);
               }
            }
            super.addNewGameObjects();
         }
      }
      
      override internal function parseLevel() : void
      {
         var _loc1_:ClassBaseGameObject = null;
         super.parseLevel();
         for each(_loc1_ in arrGameObjects)
         {
            if(_loc1_ is ClassBaseBody)
            {
               arrPhysicObjects.push(_loc1_ as ClassBaseBody);
            }
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
         world = null;
         arrPhysicObjects = [];
         arrPhysicObjects = null;
      }
   }
}

