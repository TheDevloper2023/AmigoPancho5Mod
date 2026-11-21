package Tela
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import flash.geom.Point;
   
   public class ClassRevolute extends ClassJoint
   {
      
      public var posJoint:Point = new Point();
      
      private var the_rev_joint:b2RevoluteJointDef = new b2RevoluteJointDef();
      
      private var qwe:b2Joint;
      
      private var qwe2:b2Joint;
      
      public function ClassRevolute(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSwitch);
      }
      
      override public function init(param1:Array = null) : void
      {
         arrPhysicParam = [0,0.1,0.1];
         super.init();
      }
      
      override public function sendGameObjects(param1:Array = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:ClassBaseGameObject = null;
         var _loc8_:ClassBaseBody = null;
         var _loc9_:b2Body = null;
         var _loc10_:int = 0;
         movie.stop();
         var _loc4_:Array = [];
         var _loc5_:b2RevoluteJointDef = new b2RevoluteJointDef();
         var _loc6_:int = this.parent.numChildren;
         for each(_loc7_ in param1)
         {
            _loc8_ = _loc7_ as ClassBaseBody;
            if((Boolean(_loc8_)) && _loc8_ != this)
            {
               if(_loc8_.hitTestObject(this))
               {
                  _loc9_ = _loc8_.body;
                  this.the_rev_joint.Initialize(body,_loc9_,new b2Vec2(body.GetPosition().x,body.GetPosition().y));
                  _loc9_.GetUserData().movie.jointHere = 1;
                  if(rotation != 0)
                  {
                     this.the_rev_joint.enableMotor = true;
                     this.the_rev_joint.motorSpeed = rotation / 2;
                     this.the_rev_joint.maxMotorTorque = 500;
                  }
                  this.qwe = ClassBasePhysicLevel.world.CreateJoint(this.the_rev_joint);
                  this.qwe.SetUserData(this);
                  _loc10_ = 0;
                  _loc4_.push(_loc8_);
                  ++_loc8_.countRevoluteJoint;
                  ++_loc8_.countFixedJoint;
                  _loc8_.isJointExists = true;
                  _loc8_.body.SetAngularDamping(0);
               }
            }
         }
      }
      
      override public function destroy() : void
      {
         this.the_rev_joint = null;
         this.qwe = null;
         this.qwe2 = null;
         this.posJoint = null;
         super.destroy();
      }
   }
}

