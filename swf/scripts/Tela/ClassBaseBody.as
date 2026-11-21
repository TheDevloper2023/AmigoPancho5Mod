package Tela
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.Shapes.b2Shape;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class ClassBaseBody extends ClassBaseGameObject
   {
      
      public static var arrObject:Array = [];
      
      public var body:b2Body;
      
      public var isDynamic:Boolean;
      
      public var isOffMakeAngle:Boolean;
      
      public var isBodyCreated:Boolean;
      
      public var arrShapes:Array = [];
      
      public var scalePhysic:Number = ClassBasePhysicLevel.m_physScale;
      
      public var isCrash:Boolean;
      
      public var circleShape:b2CircleShape;
      
      public var isFindPointContact:Boolean;
      
      public var pointContact:b2Vec2;
      
      public var fixture:b2FixtureDef;
      
      private var countElasticJoint:int;
      
      public var countFixedJoint:int;
      
      public var countRevoluteJoint:int;
      
      public var isJointExists:Boolean;
      
      public var radius:Number;
      
      public var arrPhysicParam:Array = [0,0,0,0,0];
      
      public var categoryBits:uint = 0;
      
      public var maskBits:uint = 0;
      
      private var En:Number = 0;
      
      private var en_Old:Number = 0;
      
      public var forseContact:Number = 0;
      
      public var isCalculateForseContact:Boolean;
      
      public var contactObject:ClassBaseBody;
      
      public var contactResult:b2Contact;
      
      public var arrKonturMovieShapes:Array = [];
      
      public var bodyDef:b2BodyDef;
      
      public var isDestroyBody:Boolean;
      
      public var isContactExist:Boolean;
      
      public var isSensor:Boolean = false;
      
      public var countContact:int;
      
      public var isPhysic:Boolean;
      
      public var isEndContact:Boolean;
      
      public var isContactHeppen:Boolean;
      
      public var isNotUpdatePositionAsBody:Boolean;
      
      public var speedBody:Number = 0;
      
      public function ClassBaseBody(param1:String)
      {
         super(param1);
         arrObject.push(this);
         this.isPhysic = true;
      }
      
      public function setCalculateForse(param1:Boolean) : void
      {
         this.isCalculateForseContact = param1;
      }
      
      public function SetAngularDampingZero() : void
      {
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
         if(this.isPhysic)
         {
            angle = rotation;
            rotation = 0;
            this.bodyDef = this.getBodyPosition();
            this.setBody(this.bodyDef);
            this.createPhysicShape();
         }
      }
      
      public function createPhysicShape() : void
      {
         if(this.isPhysic)
         {
            this.setPhysicParametr();
         }
      }
      
      public function setBeginContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
      }
      
      public function setPreSolveContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
      }
      
      public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         var _loc4_:b2WorldManifold = null;
         this.contactObject = param1;
         this.contactResult = param2;
         this.isContactExist = true;
         this.isContactHeppen = true;
         if(this.isCalculateForseContact == true)
         {
            this.En = param2.GetManifold().m_points[0].m_normalImpulse;
            this.forseContact = param3.normalImpulses[0];
            this.en_Old = this.En;
         }
         if(this.isFindPointContact)
         {
            _loc4_ = new b2WorldManifold();
            param2.GetWorldManifold(_loc4_);
            this.pointContact = _loc4_.m_points[0];
            this.countContact = _loc4_.m_points.length;
         }
      }
      
      public function setEndContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
         this.contactObject = param1;
         this.contactResult = param2;
         this.isEndContact = true;
         this.isContactHeppen = false;
      }
      
      public function setShapeBox(param1:Number, param2:Number) : void
      {
         var _loc3_:b2PolygonShape = new b2PolygonShape();
         _loc3_.SetAsBox(param1 / ClassBasePhysicLevel.m_physScale / 2,param2 / ClassBasePhysicLevel.m_physScale / 2);
         this.arrShapes.push(_loc3_);
      }
      
      public function setShapeCircle(param1:Number, param2:Number = 0, param3:Number = 0) : b2CircleShape
      {
         this.radius = param1 / 2;
         this.circleShape = new b2CircleShape(this.radius / ClassBasePhysicLevel.m_physScale);
         this.circleShape.SetLocalPosition(new b2Vec2(param2 / this.scalePhysic,param3 / this.scalePhysic));
         this.arrShapes.push(this.circleShape);
         return this.circleShape;
      }
      
      public function setShapeTriangle(param1:Sprite) : void
      {
         var _loc2_:b2PolygonShape = new b2PolygonShape();
         var _loc3_:Array = [];
         _loc3_.push(new b2Vec2(0,-(param1.height / 2 / ClassBasePhysicLevel.m_physScale)));
         _loc3_.push(new b2Vec2(param1.width / 2 / ClassBasePhysicLevel.m_physScale,param1.height / 2 / ClassBasePhysicLevel.m_physScale));
         _loc3_.push(new b2Vec2(-param1.width / 2 / ClassBasePhysicLevel.m_physScale,param1.height / 2 / ClassBasePhysicLevel.m_physScale));
         _loc2_.SetAsArray(_loc3_,3);
         this.arrShapes.push(_loc2_);
      }
      
      public function setShapeMulti() : void
      {
         this.setShapeVertex();
         this.setShapeKontur();
      }
      
      private function setShapeVertex() : void
      {
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc6_:MovieClip = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:b2PolygonShape = null;
         var _loc10_:MovieClip = null;
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:Boolean = true;
         _loc4_ = 0;
         while(_loc4_ < movie.numChildren)
         {
            _loc6_ = movie.getChildAt(_loc4_) as MovieClip;
            if((Boolean(_loc6_)) && _loc6_.name.substr(0,1) == "m")
            {
               _loc1_.push(_loc6_);
               _loc7_ = int(_loc6_.name.substr(1,1));
               if(_loc2_ < _loc7_)
               {
                  _loc2_ = _loc7_;
               }
            }
            _loc4_++;
         }
         while(_loc2_ > 0)
         {
            _loc3_ = 1;
            _loc5_ = true;
            _loc8_ = [];
            while(_loc5_ == true)
            {
               _loc5_ = false;
               for each(_loc10_ in _loc1_)
               {
                  if(_loc10_.name == "m" + _loc2_.toString() + "_" + _loc3_.toString())
                  {
                     _loc8_.push(new b2Vec2(_loc10_.x * scaleX / this.scalePhysic,_loc10_.y * scaleY / this.scalePhysic));
                     _loc10_.visible = false;
                     _loc5_ = true;
                     _loc3_++;
                     break;
                  }
               }
            }
            _loc9_ = new b2PolygonShape();
            _loc9_.SetAsArray(_loc8_,_loc8_.length);
            this.arrShapes.push(_loc9_);
            _loc2_--;
         }
      }
      
      public function setShapeKontur() : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:b2PolygonShape = null;
         var _loc10_:b2Vec2 = null;
         var _loc1_:int = 0;
         while(_loc1_ < numChildren)
         {
            _loc2_ = getChildAt(_loc1_) as MovieClip;
            if(_loc2_)
            {
               _loc3_ = 0;
               while(_loc3_ < movie.numChildren)
               {
                  _loc4_ = movie.getChildAt(_loc3_) as MovieClip;
                  if(_loc4_)
                  {
                     _loc5_ = _loc4_.toString();
                     if(_loc5_.indexOf("kontur") > -1)
                     {
                        this.arrKonturMovieShapes.push(_loc4_);
                        _loc6_ = 0 * (Math.PI / 180);
                        _loc7_ = _loc4_.width * scaleX / 2 / this.scalePhysic;
                        _loc8_ = _loc4_.height * scaleY / 2 / this.scalePhysic;
                        if(_loc5_.indexOf("konturB") > -1)
                        {
                           _loc9_ = new b2PolygonShape();
                           _loc10_ = new b2Vec2(_loc4_.x * scaleX / this.scalePhysic,_loc4_.y * scaleY / this.scalePhysic);
                           _loc9_.SetAsOrientedBox(_loc7_,_loc8_,_loc10_,_loc6_);
                           this.arrShapes.push(_loc9_);
                        }
                        if(_loc5_.indexOf("konturC") > -1)
                        {
                           this.createCircleShapeBasedKonturC(_loc4_);
                        }
                        if(_loc5_.indexOf("konturT") > -1)
                        {
                           this.setShapeTriangle(_loc4_);
                        }
                        _loc4_.visible = false;
                        _loc9_ = null;
                     }
                  }
                  _loc3_++;
               }
            }
            _loc1_++;
         }
      }
      
      public function setUnvisibleKontur() : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:String = null;
         var _loc1_:int = 0;
         while(_loc1_ < movie.numChildren)
         {
            _loc2_ = movie.getChildAt(_loc1_) as MovieClip;
            if(_loc2_)
            {
               _loc3_ = _loc2_.toString();
               if(_loc3_.indexOf("kontur") > -1)
               {
                  _loc2_.visible = false;
               }
               if(_loc3_.indexOf("pic_mark") > -1)
               {
                  _loc2_.visible = false;
               }
            }
            _loc1_++;
         }
      }
      
      public function createCircleShapeBasedKonturC(param1:MovieClip) : void
      {
         var _loc2_:b2CircleShape = this.setShapeCircle(param1.width * scaleX,param1.x * scaleX,param1.y * scaleX);
      }
      
      public function getBodyPosition() : b2BodyDef
      {
         var _loc1_:b2BodyDef = new b2BodyDef();
         _loc1_.position.Set(x / ClassBasePhysicLevel.m_physScale,y / ClassBasePhysicLevel.m_physScale);
         _loc1_.angle = angle * (Math.PI / 180);
         return _loc1_;
      }
      
      public function setOwnPhysicParam(param1:Array) : void
      {
         this.arrPhysicParam = param1;
      }
      
      public function setPhysicParametr() : void
      {
         var _loc1_:b2Shape = null;
         var _loc2_:b2FixtureDef = null;
         if(this.isPhysic)
         {
            for each(_loc1_ in this.arrShapes)
            {
               _loc2_ = new b2FixtureDef();
               _loc2_.shape = _loc1_;
               _loc2_.density = this.arrPhysicParam[0];
               _loc2_.friction = this.arrPhysicParam[1];
               _loc2_.restitution = this.arrPhysicParam[2];
               _loc2_.isSensor = this.isSensor;
               this.body.CreateFixture(_loc2_);
            }
            if(this.arrPhysicParam[3] != undefined)
            {
               this.body.SetLinearDamping(this.arrPhysicParam[3]);
            }
            if(this.arrPhysicParam[4] != undefined)
            {
               this.body.SetAngularDamping(this.arrPhysicParam[4]);
            }
            rotation = angle;
         }
      }
      
      public function createBodyWithFixture() : void
      {
         this.bodyDef = new b2BodyDef();
         this.bodyDef.position.Set(0,0);
         this.body = ClassBasePhysicLevel.world.CreateBody(this.bodyDef);
         this.fixture = new b2FixtureDef();
         this.fixture.restitution = 0.3;
         this.fixture.friction = 0.5;
         this.body.SetUserData(this);
         this.isBodyCreated = true;
      }
      
      public function setBody(param1:b2BodyDef) : void
      {
         if(this.arrPhysicParam[0] > 0)
         {
            this.isDynamic = true;
            param1.type = b2Body.b2_dynamicBody;
         }
         else if(this.arrPhysicParam[0] == 0)
         {
            param1.type = b2Body.b2_staticBody;
         }
         else if(this.arrPhysicParam[0] == -1)
         {
            param1.type = b2Body.b2_kinematicBody;
            this.arrPhysicParam[0] = 0;
         }
         this.body = ClassBasePhysicLevel.world.CreateBody(param1);
         this.body.SetBullet(true);
         this.body.SetUserData(this);
         this.isBodyCreated = true;
      }
      
      override public function update(param1:Event = null) : void
      {
         if(this.isBodyCreated)
         {
            if(this.isNotUpdatePositionAsBody == false)
            {
               x = this.body.GetPosition().x * ClassBasePhysicLevel.m_physScale;
               y = this.body.GetPosition().y * ClassBasePhysicLevel.m_physScale;
               this.speedBody = this.body.GetLinearVelocity().Length();
               if(this.isOffMakeAngle == false)
               {
                  rotation = this.body.GetAngle() * (180 / Math.PI);
               }
            }
            if(this.isDestroyBody)
            {
               this.destroyBody();
            }
         }
         super.update(param1);
         this.isContactExist = false;
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:String = param1.attribute("l_damp");
         var _loc3_:String = param1.attribute("a_damp");
         if(Number(param1.attribute("density") >= 0))
         {
            this.arrPhysicParam[0] = Number(param1.attribute("density"));
         }
         if(Number(param1.attribute("friction") >= 0))
         {
            this.arrPhysicParam[1] = Number(param1.attribute("friction"));
         }
         if(Number(param1.attribute("restitution") >= 0))
         {
            this.arrPhysicParam[2] = Number(param1.attribute("restitution"));
         }
         if(_loc2_ != "undefined" && _loc2_.length > 0 && _loc2_ != "-0.1")
         {
            this.arrPhysicParam[3] = Number(param1.attribute("l_damp"));
         }
         if(_loc3_ != "undefined" && _loc3_.length > 0 && _loc3_ != "-0.1")
         {
            this.arrPhysicParam[4] = Number(param1.attribute("a_damp"));
         }
      }
      
      override public function setPosition(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         super.setPosition(param1,param2,param3,param4,param5);
         if(this.isBodyCreated)
         {
            this.body.SetPosition(new b2Vec2(param1 / this.scalePhysic,param2 / this.scalePhysic));
            this.body.SetAngle(param3);
         }
      }
      
      public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         return true;
      }
      
      public function setCountElasticJoint(param1:int) : void
      {
         this.countElasticJoint += param1;
         if(this.countElasticJoint > 0)
         {
            this.isJointExists = true;
         }
         else
         {
            this.isJointExists = false;
         }
      }
      
      public function getCountElasticJoint() : int
      {
         return this.countElasticJoint;
      }
      
      public function createStatic() : void
      {
         this.body.SetType(b2Body.b2_staticBody);
      }
      
      public function createDynamic() : void
      {
         this.body.SetType(b2Body.b2_dynamicBody);
      }
      
      public function destroyBody() : void
      {
         if(this.body)
         {
            this.body.GetWorld().DestroyBody(this.body);
            this.body.SetUserData(null);
            this.body = null;
            this.isBodyCreated = false;
            this.arrShapes = [];
            this.arrKonturMovieShapes = [];
            this.speedBody = 0;
         }
      }
      
      override public function destroy() : void
      {
         ClassMath.removeObjectFromArray(arrObject,this);
         isLive = false;
         this.arrKonturMovieShapes = null;
         this.contactObject = null;
         this.contactResult = null;
         this.circleShape = null;
         this.isCrash = true;
         this.arrShapes = null;
         myGlow = null;
         this.arrPhysicParam = null;
         this.isBodyCreated = false;
         this.destroyBody();
         super.destroy();
      }
   }
}

