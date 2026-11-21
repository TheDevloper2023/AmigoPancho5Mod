package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2PrismaticJoint;
   import Box2D.Dynamics.Joints.b2PrismaticJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKaktusFire;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.events.Event;
   
   public class ClassPrizmJointPerfom extends ClassBasePerfomer
   {
      
      public var prismaticJoint:b2PrismaticJoint;
      
      public function ClassPrizmJointPerfom(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         var _loc4_:b2BodyDef = null;
         super.init(param1);
         var _loc2_:b2PrismaticJointDef = new b2PrismaticJointDef();
         var _loc3_:b2Vec2 = new b2Vec2(1,0);
         if(isVertical == false)
         {
            isVertical = rotation != 0;
         }
         if(isVertical)
         {
            _loc3_ = new b2Vec2(0,1);
         }
         var _loc5_:b2Body = body.GetWorld().GetGroundBody();
         _loc2_.Initialize(body,_loc5_,body.GetWorldCenter(),_loc3_);
         this.prismaticJoint = body.GetWorld().CreateJoint(_loc2_) as b2PrismaticJoint;
         addEventListener(Event.ENTER_FRAME,this.findHit);
      }
      
      public function findHit(param1:Event) : void
      {
         var _loc2_:ClassLevelObject = null;
         removeEventListener(Event.ENTER_FRAME,this.findHit);
         for each(_loc2_ in ClassLevelObject.arrLevelObjects)
         {
            if(_loc2_.isBodyCreated && _loc2_ is ClassKaktusFire && _loc2_.hitTestObject(this))
            {
               _loc2_.body.setCustomGravity(new b2Vec2(0,0));
            }
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findHit);
         super.destroy();
      }
   }
}

