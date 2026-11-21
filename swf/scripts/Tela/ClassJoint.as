package Tela
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassJoint extends ClassBaseBody
   {
      
      public static var countAng:int;
      
      private var isCreate:Boolean;
      
      private var arrPoints:Array = [];
      
      private var arrGameObjects:Array;
      
      public var strAngles:String = "";
      
      private var l_a:Number;
      
      private var u_a:Number;
      
      public function ClassJoint(param1:String)
      {
         super(param1);
      }
      
      override public function sendGameObjects(param1:Array = null) : void
      {
         super.sendGameObjects(param1);
         this.arrGameObjects = param1;
         addEventListener(Event.ADDED_TO_STAGE,this.wer);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         if(Boolean(param1) && param1[0] != null)
         {
            this.strAngles = param1[0] as String;
         }
      }
      
      public function wer(param1:Event = null) : void
      {
         var _loc3_:Array = null;
         var _loc4_:ClassBaseGameObject = null;
         var _loc5_:ClassBaseBody = null;
         var _loc6_:b2Body = null;
         var _loc7_:int = 0;
         var _loc8_:b2Body = null;
         var _loc9_:b2Joint = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         this.arrPoints.push(new Point(x - 2,y - 2));
         this.arrPoints.push(new Point(x + 2,y - 2));
         this.arrPoints.push(new Point(x,y - 2));
         this.arrPoints.push(new Point(x - 2,y + 2));
         this.arrPoints.push(new Point(x + 2,y + 2));
         this.arrPoints.push(new Point(x,y + 2));
         this.arrPoints.push(new Point(x,y));
         removeEventListener(Event.ADDED_TO_STAGE,this.wer);
         rotation = angle;
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_ = [];
         for each(_loc4_ in this.arrGameObjects)
         {
            _loc5_ = _loc4_ as ClassBaseBody;
            if((Boolean(_loc5_)) && Boolean(_loc5_.isBodyCreated) && !(_loc5_ is ClassJoint))
            {
               if(this.hitTest(_loc4_) == true)
               {
                  _loc6_ = _loc5_.body;
                  _loc7_ = 0;
                  while(_loc7_ < _loc3_.length)
                  {
                     _loc8_ = _loc3_[_loc7_];
                     if(nameMovie.indexOf("_fixed") > -1)
                     {
                        _loc2_.enableLimit = true;
                        _loc2_.collideConnected = false;
                        ++_loc5_.countFixedJoint;
                     }
                     else
                     {
                        _loc5_.setCountElasticJoint(1);
                     }
                     if(rotation != 0)
                     {
                        _loc2_.enableMotor = true;
                     }
                     if(this.strAngles.indexOf("j_") != -1)
                     {
                        _loc2_.enableLimit = true;
                        _loc10_ = Number(this.strAngles.substr(2,3));
                        _loc11_ = Number(this.strAngles.substr(6,3));
                        _loc2_.lowerAngle = -_loc11_ / (180 / Math.PI);
                        _loc2_.upperAngle = _loc10_ / (180 / Math.PI);
                     }
                     else if(!(Number(this.l_a) == 0 && Number(this.u_a) == 0))
                     {
                        if(Number(this.l_a))
                        {
                           _loc2_.lowerAngle = this.l_a / (180 / Math.PI);
                        }
                        if(Number(this.u_a))
                        {
                           _loc2_.upperAngle = this.u_a / (180 / Math.PI);
                        }
                        _loc2_.enableLimit = true;
                     }
                     _loc2_.Initialize(_loc6_,_loc8_,new b2Vec2(x / ClassBasePhysicLevel.m_physScale,y / ClassBasePhysicLevel.m_physScale));
                     _loc9_ = ClassBasePhysicLevel.world.CreateJoint(_loc2_);
                     _loc5_.isJointExists = true;
                     (_loc8_.GetUserData() as ClassBaseBody).setCountElasticJoint(1);
                     _loc7_++;
                  }
                  _loc3_.push(_loc6_);
               }
            }
         }
         isLive = false;
         this.arrGameObjects = [];
         this.arrGameObjects = null;
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:String = param1.attribute("l_damp");
         var _loc3_:String = param1.attribute("a_damp");
         this.l_a = Number(param1.attribute("l_damp"));
         this.u_a = Number(param1.attribute("a_damp"));
      }
      
      private function hitTest(param1:ClassBaseGameObject) : Boolean
      {
         var _loc2_:Point = null;
         for each(_loc2_ in this.arrPoints)
         {
            if(param1.hitTestPoint(_loc2_.x,_loc2_.y,true))
            {
               return true;
            }
         }
         return false;
      }
      
      override public function destroy() : void
      {
         this.arrGameObjects = [];
         this.arrGameObjects = null;
         this.arrPoints = [];
         this.arrPoints = null;
         removeEventListener(Event.ADDED_TO_STAGE,this.wer);
         super.destroy();
      }
   }
}

