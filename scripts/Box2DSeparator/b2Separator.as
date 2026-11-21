package Box2DSeparator
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2FixtureDef;
   
   public class b2Separator
   {
      
      public function b2Separator()
      {
         super();
      }
      
      public function Separate(param1:b2Body, param2:b2FixtureDef, param3:Vector.<b2Vec2>, param4:Number = 30) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:b2PolygonShape = null;
         var _loc6_:int = int(param3.length);
         var _loc9_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc9_.push(new b2Vec2(param3[_loc5_].x * param4,param3[_loc5_].y * param4));
            _loc5_++;
         }
         _loc10_ = this.calcShapes(_loc9_);
         _loc6_ = int(_loc10_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            param3 = new Vector.<b2Vec2>();
            _loc9_ = _loc10_[_loc5_];
            _loc8_ = int(_loc9_.length);
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               param3.push(new b2Vec2(_loc9_[_loc7_].x / param4,_loc9_[_loc7_].y / param4));
               _loc7_++;
            }
            _loc11_ = new b2PolygonShape();
            _loc11_.SetAsVector(param3);
            param2.shape = _loc11_;
            param1.CreateFixture(param2);
            _loc5_++;
         }
      }
      
      public function Validate(param1:Vector.<b2Vec2>) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc10_:Boolean = false;
         var _loc3_:int = int(param1.length);
         var _loc9_:int = 0;
         var _loc11_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc6_ = _loc2_ < _loc3_ - 1 ? int(_loc2_ + 1) : 0;
            _loc7_ = _loc2_ > 0 ? int(_loc2_ - 1) : int(_loc3_ - 1);
            _loc10_ = false;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(_loc4_ != _loc2_ && _loc4_ != _loc6_)
               {
                  if(!_loc10_)
                  {
                     _loc8_ = this.det(param1[_loc2_].x,param1[_loc2_].y,param1[_loc6_].x,param1[_loc6_].y,param1[_loc4_].x,param1[_loc4_].y);
                     if(_loc8_ > 0)
                     {
                        _loc10_ = true;
                     }
                  }
                  if(_loc4_ != _loc7_)
                  {
                     _loc5_ = _loc4_ < _loc3_ - 1 ? int(_loc4_ + 1) : 0;
                     if(this.hitSegment(param1[_loc2_].x,param1[_loc2_].y,param1[_loc6_].x,param1[_loc6_].y,param1[_loc4_].x,param1[_loc4_].y,param1[_loc5_].x,param1[_loc5_].y))
                     {
                        _loc9_ = 1;
                     }
                  }
               }
               _loc4_++;
            }
            if(!_loc10_)
            {
               _loc11_ = true;
            }
            _loc2_++;
         }
         if(_loc11_)
         {
            if(_loc9_ == 1)
            {
               _loc9_ = 3;
            }
            else
            {
               _loc9_ = 2;
            }
         }
         return _loc9_;
      }
      
      private function calcShapes(param1:Vector.<b2Vec2>) : Array
      {
         var _loc2_:Vector.<b2Vec2> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:b2Vec2 = null;
         var _loc15_:b2Vec2 = null;
         var _loc16_:b2Vec2 = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:b2Vec2 = null;
         var _loc20_:b2Vec2 = null;
         var _loc21_:* = 0;
         var _loc22_:int = 0;
         var _loc23_:Vector.<b2Vec2> = null;
         var _loc24_:Vector.<b2Vec2> = null;
         var _loc25_:b2Vec2 = null;
         var _loc26_:b2Vec2 = null;
         var _loc27_:Boolean = false;
         var _loc28_:Array = [];
         var _loc29_:Array = [];
         _loc29_.push(param1);
         while(_loc29_.length)
         {
            _loc2_ = _loc29_[0];
            _loc4_ = int(_loc2_.length);
            _loc27_ = true;
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc11_ = _loc3_;
               _loc12_ = _loc3_ < _loc4_ - 1 ? int(_loc3_ + 1) : int(_loc3_ + 1 - _loc4_);
               _loc13_ = _loc3_ < _loc4_ - 2 ? int(_loc3_ + 2) : int(_loc3_ + 2 - _loc4_);
               _loc14_ = _loc2_[_loc11_];
               _loc15_ = _loc2_[_loc12_];
               if(_loc2_.length <= _loc13_)
               {
                  return [];
               }
               _loc16_ = _loc2_[_loc13_];
               _loc6_ = this.det(_loc14_.x,_loc14_.y,_loc15_.x,_loc15_.y,_loc16_.x,_loc16_.y);
               if(_loc6_ < 0)
               {
                  _loc27_ = false;
                  _loc10_ = Number.MAX_VALUE;
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_)
                  {
                     if(_loc5_ != _loc11_ && _loc5_ != _loc12_)
                     {
                        _loc17_ = _loc5_;
                        _loc18_ = _loc5_ < _loc4_ - 1 ? int(_loc5_ + 1) : 0;
                        _loc19_ = _loc2_[_loc17_];
                        _loc20_ = _loc2_[_loc18_];
                        _loc25_ = this.hitRay(_loc14_.x,_loc14_.y,_loc15_.x,_loc15_.y,_loc19_.x,_loc19_.y,_loc20_.x,_loc20_.y);
                        if(_loc25_)
                        {
                           _loc8_ = _loc15_.x - _loc25_.x;
                           _loc9_ = _loc15_.y - _loc25_.y;
                           _loc7_ = _loc8_ * _loc8_ + _loc9_ * _loc9_;
                           if(_loc7_ < _loc10_)
                           {
                              _loc22_ = _loc17_;
                              _loc21_ = _loc18_;
                              _loc26_ = _loc25_;
                              _loc10_ = _loc7_;
                           }
                        }
                     }
                     _loc5_++;
                  }
                  if(_loc10_ == Number.MAX_VALUE)
                  {
                     return [];
                  }
                  _loc23_ = new Vector.<b2Vec2>();
                  _loc24_ = new Vector.<b2Vec2>();
                  _loc17_ = _loc22_;
                  _loc18_ = _loc21_;
                  _loc19_ = _loc2_[_loc17_];
                  _loc20_ = _loc2_[_loc18_];
                  if(!this.pointsMatch(_loc26_.x,_loc26_.y,_loc20_.x,_loc20_.y))
                  {
                     _loc23_.push(_loc26_);
                  }
                  if(!this.pointsMatch(_loc26_.x,_loc26_.y,_loc19_.x,_loc19_.y))
                  {
                     _loc24_.push(_loc26_);
                  }
                  _loc22_ = -1;
                  _loc21_ = _loc11_;
                  while(_loc21_ != _loc18_)
                  {
                     _loc23_.push(_loc2_[_loc21_]);
                     _loc22_ = _loc21_;
                     if(_loc21_ - 1 < 0)
                     {
                        _loc21_ = int(_loc4_ - 1);
                     }
                     else
                     {
                        _loc21_--;
                     }
                  }
                  if(_loc22_ < 0 || _loc22_ >= _loc4_)
                  {
                     return [];
                  }
                  if(!this.isOnSegment(_loc20_.x,_loc20_.y,_loc2_[_loc22_].x,_loc2_[_loc22_].y,_loc14_.x,_loc14_.y))
                  {
                     _loc23_.push(_loc2_[_loc21_]);
                  }
                  _loc23_ = _loc23_.reverse();
                  _loc22_ = -1;
                  _loc21_ = _loc12_;
                  while(_loc21_ != _loc17_)
                  {
                     _loc24_.push(_loc2_[_loc21_]);
                     _loc22_ = _loc21_;
                     if(_loc21_ + 1 > _loc4_ - 1)
                     {
                        _loc21_ = 0;
                     }
                     else
                     {
                        _loc21_++;
                     }
                  }
                  if(_loc22_ < 0 || _loc22_ >= _loc4_)
                  {
                     return [];
                  }
                  if(_loc21_ == _loc17_ && !this.isOnSegment(_loc19_.x,_loc19_.y,_loc2_[_loc22_].x,_loc2_[_loc22_].y,_loc15_.x,_loc15_.y))
                  {
                     _loc24_.push(_loc2_[_loc21_]);
                  }
                  _loc29_.push(_loc23_,_loc24_);
                  _loc29_.shift();
                  break;
               }
               _loc3_++;
            }
            if(_loc27_)
            {
               _loc28_.push(_loc29_.shift());
            }
         }
         return _loc28_;
      }
      
      private function hitRay(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : b2Vec2
      {
         var _loc16_:Number = NaN;
         var _loc9_:Number = param5 - param1;
         var _loc10_:Number = param6 - param2;
         var _loc11_:Number = param3 - param1;
         var _loc12_:Number = param4 - param2;
         var _loc13_:Number = param7 - param5;
         var _loc14_:Number = param8 - param6;
         var _loc15_:Number = _loc12_ * _loc13_ - _loc11_ * _loc14_;
         _loc16_ = (_loc13_ * _loc10_ - _loc14_ * _loc9_) / _loc15_;
         var _loc17_:Number = param1 + _loc16_ * _loc11_;
         var _loc18_:Number = param2 + _loc16_ * _loc12_;
         var _loc19_:Boolean = this.isOnSegment(param3,param4,param1,param2,_loc17_,_loc18_);
         var _loc20_:Boolean = this.isOnSegment(_loc17_,_loc18_,param5,param6,param7,param8);
         if(_loc19_ && _loc20_)
         {
            return new b2Vec2(_loc17_,_loc18_);
         }
         return null;
      }
      
      private function hitSegment(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : b2Vec2
      {
         var _loc16_:Number = NaN;
         var _loc9_:Number = param5 - param1;
         var _loc10_:Number = param6 - param2;
         var _loc11_:Number = param3 - param1;
         var _loc12_:Number = param4 - param2;
         var _loc13_:Number = param7 - param5;
         var _loc14_:Number = param8 - param6;
         var _loc15_:Number = _loc12_ * _loc13_ - _loc11_ * _loc14_;
         _loc16_ = (_loc13_ * _loc10_ - _loc14_ * _loc9_) / _loc15_;
         var _loc17_:Number = param1 + _loc16_ * _loc11_;
         var _loc18_:Number = param2 + _loc16_ * _loc12_;
         var _loc19_:Boolean = this.isOnSegment(_loc17_,_loc18_,param1,param2,param3,param4);
         var _loc20_:Boolean = this.isOnSegment(_loc17_,_loc18_,param5,param6,param7,param8);
         if(_loc19_ && _loc20_)
         {
            return new b2Vec2(_loc17_,_loc18_);
         }
         return null;
      }
      
      private function isOnSegment(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Boolean
      {
         var _loc7_:Boolean = param3 + 0.1 >= param1 && param1 >= param5 - 0.1 || param3 - 0.1 <= param1 && param1 <= param5 + 0.1;
         var _loc8_:Boolean = param4 + 0.1 >= param2 && param2 >= param6 - 0.1 || param4 - 0.1 <= param2 && param2 <= param6 + 0.1;
         return _loc7_ && _loc8_ && this.isOnLine(param1,param2,param3,param4,param5,param6);
      }
      
      private function pointsMatch(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Number = param3 >= param1 ? param3 - param1 : param1 - param3;
         var _loc6_:Number = param4 >= param2 ? param4 - param2 : param2 - param4;
         return _loc5_ < 0.1 && _loc6_ < 0.1;
      }
      
      private function isOnLine(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Boolean
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(param5 - param3 > 0.1 || param3 - param5 > 0.1)
         {
            _loc7_ = (param6 - param4) / (param5 - param3);
            _loc8_ = _loc7_ * (param1 - param3) + param4;
            _loc9_ = _loc8_ > param2 ? _loc8_ - param2 : param2 - _loc8_;
            return _loc9_ < 0.1;
         }
         return param1 - param3 < 0.1 || param3 - param1 < 0.1;
      }
      
      private function det(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         return param1 * param4 + param3 * param6 + param5 * param2 - param2 * param3 - param4 * param5 - param6 * param1;
      }
      
      private function err() : void
      {
         throw new Error("A problem has occurred. Use the Validate() method to see where the problem is.");
      }
   }
}

