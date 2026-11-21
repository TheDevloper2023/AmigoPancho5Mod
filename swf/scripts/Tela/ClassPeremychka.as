package Tela
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import PlayLevels.amigoPancho.tela.ClassStena;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassPeremychka extends ClassJoint
   {
      
      private var isCreated:Boolean;
      
      private var jointPeremych:b2Joint;
      
      private var isAlphaTo0:Boolean;
      
      public function ClassPeremychka(param1:String)
      {
         super(param1);
      }
      
      override public function sendGameObjects(param1:Array = null) : void
      {
         var _loc5_:ClassBaseGameObject = null;
         var _loc6_:ClassBaseBody = null;
         var _loc7_:b2Body = null;
         var _loc8_:int = 0;
         var _loc9_:b2Body = null;
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         var _loc3_:Array = [];
         var _loc4_:int = this.parent.numChildren;
         for each(_loc5_ in param1)
         {
            _loc6_ = _loc5_ as ClassBaseBody;
            if((Boolean(_loc6_)) && _loc6_ != this)
            {
               if(_loc6_.hitTestObject(this))
               {
                  _loc7_ = _loc6_.body;
                  if(_loc7_)
                  {
                     _loc8_ = 0;
                     while(_loc8_ < _loc3_.length)
                     {
                        _loc9_ = _loc3_[_loc8_];
                        if(_loc9_)
                        {
                           _loc2_.enableLimit = true;
                           _loc2_.collideConnected = false;
                           _loc2_.Initialize(_loc7_,_loc9_,new b2Vec2(x / ClassBasePhysicLevel.m_physScale,y / ClassBasePhysicLevel.m_physScale));
                           this.jointPeremych = ClassBasePhysicLevel.world.CreateJoint(_loc2_);
                           this.isCreated = true;
                           this.setChangeParent();
                           _loc3_ = null;
                           return;
                        }
                        _loc8_++;
                     }
                     _loc3_.push(_loc7_);
                  }
               }
            }
         }
      }
      
      private function setChangeParent() : void
      {
         var _loc1_:ClassBaseBody = null;
         var _loc3_:Point = null;
         _loc1_ = this.jointPeremych.GetBodyA().GetUserData() as ClassBaseBody;
         if(_loc1_ is ClassPol || _loc1_ is ClassStena)
         {
            _loc1_ = this.jointPeremych.GetBodyB().GetUserData() as ClassBaseBody;
         }
         _loc1_.addChild(this);
         var _loc2_:Point = new Point(x,y);
         _loc3_ = _loc1_.globalToLocal(_loc2_);
         x = _loc3_.x;
         y = _loc3_.y;
         if(_loc1_.rotation == 0)
         {
            scaleX /= _loc1_.scaleX;
            scaleY /= _loc1_.scaleY;
         }
         else
         {
            scaleX /= _loc1_.scaleY;
            scaleY /= _loc1_.scaleX;
         }
         rotation = angle + _loc1_.rotation;
      }
      
      override public function update(param1:Event = null) : void
      {
         if(this.isAlphaTo0 == false && this.isCreated && (!this.jointPeremych.GetBodyA().GetUserData() || !this.jointPeremych.GetBodyB().GetUserData()))
         {
            this.setAlpha0();
         }
      }
      
      private function setAlpha0() : void
      {
         this.isAlphaTo0 = true;
         addEventListener(Event.ENTER_FRAME,this.goAlpha);
      }
      
      private function goAlpha(param1:Event) : void
      {
         if((alpha = alpha - 0.08) <= 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.goAlpha);
            isLive = false;
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.goAlpha);
         super.destroy();
      }
   }
}

