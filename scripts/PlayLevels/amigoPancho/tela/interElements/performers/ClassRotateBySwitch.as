package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassBaseSwitch;
   import flash.geom.Point;
   
   public class ClassRotateBySwitch extends ClassBasePerfomer
   {
      
      private var jointRev:b2RevoluteJoint;
      
      private var ang:Number;
      
      private var isLimitCreated:Boolean;
      
      public var kFor:Number;
      
      public function ClassRotateBySwitch(param1:String)
      {
         super(param1);
         this.kFor = 25;
         setMouseReactOff();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.setCustomGravity(new b2Vec2(0,0));
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         var _loc3_:b2Body = body.GetWorld().GetGroundBody();
         var _loc4_:Point = localToGlobal(new Point(movie.cent.x,movie.cent.y));
         var _loc5_:b2Vec2 = new b2Vec2(_loc4_.x / scalePhysic,_loc4_.y / scalePhysic);
         _loc2_.Initialize(body,_loc3_,_loc5_);
         this.jointRev = body.GetWorld().CreateJoint(_loc2_) as b2RevoluteJoint;
         if(limit1.x != limit1.y)
         {
            this.jointRev.EnableLimit(true);
            this.jointRev.SetLimits(limit1.x,limit1.y);
            this.isLimitCreated = true;
         }
         this.ang = ClassMath.getRadianFromGradus(rotation);
         this.afterInit();
      }
      
      public function afterInit() : void
      {
         this.setOff();
      }
      
      override public function setOff() : void
      {
         super.setOff();
         this.setOn(0);
      }
      
      override public function setObjectSwitch(param1:ClassBaseSwitch) : void
      {
         super.setObjectSwitch(param1);
      }
      
      override public function setOn(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         super.setOn(param1);
         if(param1 == 0)
         {
            body.SetAngularDamping(500);
         }
         else
         {
            body.SetAngularDamping(2);
         }
         if(Math.abs(param1) < 200)
         {
            this.jointRev.EnableMotor(true);
            this.jointRev.SetMaxMotorTorque(700);
            this.jointRev.SetMotorSpeed(-param1 / this.kFor);
            _loc2_ = ClassMath.getRadianFromGradus(rotation);
            _loc3_ = this.ang - _loc2_;
            if(this.isLimitCreated && (_loc3_ > limit1.y || _loc3_ < limit1.x))
            {
               isOnLimit = true;
               return;
            }
            isOnLimit = false;
         }
      }
   }
}

