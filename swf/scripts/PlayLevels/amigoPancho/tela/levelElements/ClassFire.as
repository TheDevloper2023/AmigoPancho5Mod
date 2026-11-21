package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import Tela.ClassBaseGameObject;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassFire extends ClassBaseGameObject
   {
      
      public static var isSoundFire:Boolean;
      
      public static var arrFire:Array = [];
      
      public var firstBobyHit:b2Body;
      
      public var distToBody:Number;
      
      public var p1:b2Vec2;
      
      public var pImp:b2Vec2;
      
      private var tempWidth:Number;
      
      private var sound:ClassSoundCompleted;
      
      public function ClassFire(param1:String)
      {
         super(param1);
         movie.gotoAndPlay(Math.round(Math.random() * movie.totalFrames));
         setParentSprite(ClassLayers.spriteForFire);
         arrFire.push(this);
         if(isSoundFire == false)
         {
            isSoundFire = true;
            this.soundPlay();
            amigo5.mainStage.addEventListener("ALL_SOUND_OFF",this.soundStop);
            amigo5.mainStage.addEventListener("ALL_SOUND_ON",this.soundPlay);
         }
      }
      
      private function soundStop(param1:Event = null) : void
      {
         if(this.sound)
         {
            this.sound.destroy();
            this.sound = null;
         }
      }
      
      private function soundPlay(param1:Event = null) : void
      {
         if(this.sound == null)
         {
            if(ClassPlayLevel.isUpdate)
            {
               this.sound = ControlSounds.loadAndPlay("mFire",0,1);
            }
         }
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.tempWidth = width;
         mouseEnabled = false;
         ClassLayers.spriteForFire.mouseEnabled = false;
      }
      
      public function testHitObjects() : void
      {
         var _loc5_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:b2Vec2 = null;
         var _loc12_:Number = NaN;
         var _loc1_:Number = movie.scaleX;
         var _loc2_:Point = getPosition();
         var _loc3_:Number = ClassBasePhysicLevel.m_physScale;
         var _loc4_:Point = new Point(_loc2_.x,_loc2_.y - height / 2);
         _loc5_ = width / _loc3_;
         var _loc6_:int = 5;
         var _loc7_:int = height / _loc6_;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = _loc8_ * _loc6_;
            _loc10_ = _loc4_.y + _loc9_;
            this.p1 = new b2Vec2(_loc4_.x / _loc3_,_loc10_ / _loc3_);
            _loc11_ = new b2Vec2(this.p1.x + _loc5_ * _loc1_,this.p1.y);
            this.distToBody = 9999;
            this.firstBobyHit = null;
            ClassBasePhysicLevel.world.RayCast(this.setRay,this.p1,_loc11_);
            if(this.firstBobyHit)
            {
               _loc12_ = Math.abs(this.pImp.x * _loc3_ - x);
               width = _loc12_ + 15;
               if(width > this.tempWidth)
               {
                  width = this.tempWidth;
               }
            }
            else
            {
               width = this.tempWidth;
            }
            _loc8_++;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update();
         this.testHitObjects();
      }
      
      public function setRay(param1:b2Fixture, param2:b2Vec2, param3:b2Vec2, param4:Number) : Number
      {
         var _loc5_:Number = ClassMath.getDistansFromToPoints(new Point(this.p1.x,this.p1.y),new Point(param2.x,param2.y));
         if(_loc5_ < this.distToBody)
         {
            this.firstBobyHit = param1.GetBody();
            this.pImp = param2;
            this.distToBody = _loc5_;
         }
         return 1;
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.removeEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.removeEventListener("ALL_SOUND_ON",this.soundPlay);
         this.soundStop();
         isSoundFire = false;
         removeThisFromArray(arrFire);
         this.firstBobyHit = null;
         super.destroy();
      }
   }
}

