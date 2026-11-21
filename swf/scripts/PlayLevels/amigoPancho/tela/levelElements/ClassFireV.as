package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import flash.geom.Point;
   
   public class ClassFireV extends ClassFire
   {
      
      private var tempHeight:Number;
      
      public function ClassFireV(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.tempHeight = height;
      }
      
      override public function testHitObjects() : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:b2Vec2 = null;
         var _loc12_:Number = NaN;
         var _loc1_:Number = movie.scaleY;
         var _loc2_:Point = getPosition();
         var _loc3_:Number = ClassBasePhysicLevel.m_physScale;
         var _loc4_:Point = new Point(_loc2_.x - width / 2,_loc2_.y);
         var _loc5_:Number = height / _loc3_;
         var _loc6_:int = 5;
         var _loc7_:int = width / _loc6_;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = _loc8_ * _loc6_;
            _loc10_ = _loc4_.x + _loc9_;
            p1 = new b2Vec2(_loc10_ / _loc3_,_loc4_.y / _loc3_);
            _loc11_ = new b2Vec2(p1.x,p1.y + _loc5_ * _loc1_);
            distToBody = 9999;
            firstBobyHit = null;
            ClassBasePhysicLevel.world.RayCast(setRay,p1,_loc11_);
            if(firstBobyHit)
            {
               _loc12_ = Math.abs(pImp.y * _loc3_ - y);
               height = _loc12_ + 15;
               if(height > this.tempHeight)
               {
                  height = this.tempHeight;
               }
            }
            else
            {
               height = this.tempHeight;
            }
            _loc8_++;
         }
      }
   }
}

