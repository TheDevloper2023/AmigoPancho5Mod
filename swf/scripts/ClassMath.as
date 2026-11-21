package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class ClassMath
   {
      
      public function ClassMath()
      {
         super();
      }
      
      public static function getDistansFromToPoints(param1:Point, param2:Point) : int
      {
         if(param1 == null || param2 == null)
         {
            return null;
         }
         return Math.sqrt((param1.x - param2.x) * (param1.x - param2.x) + (param1.y - param2.y) * (param1.y - param2.y));
      }
      
      public static function isPointsEqual(param1:Point, param2:Point) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param2 == null)
         {
            return false;
         }
         return param1.x == param2.x && param1.y == param2.y;
      }
      
      public static function getPointOnSegment(param1:Point, param2:Point, param3:Number) : Point
      {
         var _loc5_:Number = NaN;
         var _loc4_:Point = new Point();
         if(param3 == 0)
         {
            _loc4_ = param1;
         }
         else
         {
            _loc5_ = Math.sqrt((param1.x - param2.x) * (param1.x - param2.x) + (param1.y - param2.y) * (param1.y - param2.y));
            if(_loc5_ == 0)
            {
               _loc4_ = param1;
            }
            else
            {
               _loc5_ = param3 / _loc5_;
               _loc4_.x = param1.x + _loc5_ * (param2.x - param1.x);
               _loc4_.y = param1.y + _loc5_ * (param2.y - param1.y);
            }
         }
         return _loc4_;
      }
      
      public static function getArrPointsOnSegment(param1:Point, param2:Point, param3:int = 1) : Array
      {
         var _loc7_:Point = null;
         var _loc4_:Array = [];
         var _loc5_:int = getDistansFromToPoints(param1,param2);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = getPointOnSegment(param1,param2,_loc6_);
            _loc4_.push(_loc7_);
            _loc6_ += param3;
         }
         return _loc4_;
      }
      
      public static function rotationToPoint(param1:int, param2:int, param3:int, param4:int) : Number
      {
         var _loc6_:Number = NaN;
         var _loc5_:int = ClassMath.getAngleFrom2Points(new Point(param1,param2),new Point(param3,param4));
         if(param3 > param1)
         {
            _loc6_ = -43 - (43 + _loc5_);
         }
         else
         {
            _loc6_ = 43 + (43 - _loc5_);
         }
         return _loc6_;
      }
      
      public static function getAngleFrom2Points(param1:Point, param2:Point) : Number
      {
         var _loc5_:Number = NaN;
         var _loc3_:Number = param1.x - param2.x;
         var _loc4_:Number = -(param1.y - param2.y);
         return Math.atan(_loc4_ / _loc3_) / (Math.PI / 180);
      }
      
      public static function getAngleFrom2Points2(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = param2.x - param1.x;
         var _loc4_:Number = -(param2.y - param1.y);
         var _loc5_:Number = Math.atan(_loc4_ / _loc3_) / (Math.PI / 180);
         if(_loc3_ < 0)
         {
            _loc5_ += 180;
         }
         if(_loc3_ >= 0 && _loc4_ < 0)
         {
            _loc5_ += 360;
         }
         return -_loc5_;
      }
      
      public static function getGragusFromRadian(param1:Number) : Number
      {
         return param1 * (180 / Math.PI);
      }
      
      public static function getRadianFromGradus(param1:Number) : Number
      {
         return param1 * (Math.PI / 180);
      }
      
      public static function getNumberOnOtherSistemOtscheta(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Number = param5 - param1;
         var _loc7_:Number = param2 - param1;
         var _loc8_:Number = _loc6_ * 100 / _loc7_;
         var _loc9_:Number = (param4 - param3) * _loc8_ / 100;
         return param3 + _loc9_;
      }
      
      public static function getVector(param1:Point, param2:Point) : Point
      {
         return new Point(param2.x - param1.x,param2.y - param1.y);
      }
      
      public static function getIsIntersection2Segment(param1:Point, param2:Point, param3:Point, param4:Point) : Boolean
      {
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc5_:int = Math.round(param1.x);
         var _loc6_:int = Math.round(param1.y);
         var _loc7_:int = Math.round(param2.x);
         var _loc8_:int = Math.round(param2.y);
         var _loc9_:int = Math.round(param3.x);
         var _loc10_:int = Math.round(param3.y);
         var _loc11_:int = Math.round(param4.x);
         var _loc12_:int = Math.round(param4.y);
         var _loc13_:int = Math.max(_loc5_,_loc7_);
         var _loc14_:int = Math.max(_loc6_,_loc8_);
         var _loc15_:int = Math.min(_loc5_,_loc7_);
         var _loc16_:int = Math.min(_loc6_,_loc8_);
         var _loc17_:int = Math.max(_loc9_,_loc11_);
         var _loc18_:int = Math.max(_loc10_,_loc12_);
         var _loc19_:int = Math.min(_loc9_,_loc11_);
         var _loc20_:int = Math.min(_loc10_,_loc12_);
         if(_loc15_ > _loc17_ || _loc13_ < _loc19_ || _loc16_ > _loc18_ || _loc14_ < _loc20_)
         {
            return false;
         }
         var _loc21_:int = _loc7_ - _loc5_;
         var _loc22_:int = _loc8_ - _loc6_;
         var _loc23_:int = _loc11_ - _loc9_;
         var _loc24_:int = _loc12_ - _loc10_;
         var _loc25_:int = _loc5_ - _loc9_;
         var _loc26_:int = _loc6_ - _loc10_;
         _loc27_ = int(Number(_loc24_ * _loc21_) - Number(_loc23_ * _loc22_));
         if(_loc27_ == 0)
         {
            return false;
         }
         if(_loc27_ > 0)
         {
            _loc28_ = int(Number(_loc21_ * _loc26_) - Number(_loc22_ * _loc25_));
            if(_loc28_ < 0 || _loc28_ > _loc27_)
            {
               return false;
            }
            _loc28_ = int(Number(_loc23_ * _loc26_) - Number(_loc24_ * _loc25_));
            if(_loc28_ < 0 || _loc28_ > _loc27_)
            {
               return false;
            }
         }
         _loc28_ = -int(Number(_loc21_ * _loc26_) - Number(_loc22_ * _loc25_));
         if(_loc28_ < 0 || _loc28_ > -_loc27_)
         {
            return false;
         }
         _loc28_ = -int(Number(_loc23_ * _loc26_) - Number(_loc24_ * _loc25_));
         if(_loc28_ < 0 || _loc28_ > -_loc27_)
         {
            return false;
         }
         return true;
      }
      
      public static function removeObjectFromArray(param1:Array, param2:Sprite) : void
      {
         var _loc4_:Sprite = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_] as Sprite;
            if(_loc4_ == param2)
            {
               param1.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
      }
      
      public static function getBitmapFromSprite(param1:Sprite, param2:Number = 0, param3:Number = 0) : Bitmap
      {
         if(param2 == 0)
         {
            param2 = param1.width;
         }
         if(param3 == 0)
         {
            param3 = param1.height;
         }
         var _loc4_:Sprite = new Sprite();
         var _loc5_:BitmapData = new BitmapData(param2,param3,true,16777215);
         var _loc6_:Bitmap = new Bitmap(_loc5_);
         _loc5_.draw(param1);
         return _loc6_;
      }
      
      private static function pos(param1:Point, param2:Point, param3:Point) : Number
      {
         var _temp_1:* = param3.x - param2.x;
         param1.y;
         return _temp_1 * param2.y - (param3.y - param2.y) * (param1.x - param2.x);
      }
      
      public static function getPointsCircle(param1:Number, param2:Point, param3:Number) : Array
      {
         var _loc4_:Number = 2 * Math.PI / param1;
         var _loc5_:Array = new Array();
         var _loc6_:Number = 0;
         while(_loc6_ < param1)
         {
            _loc5_.push(new Point(param2.x + param3 * Math.cos(_loc4_ * _loc6_),param2.y + param3 * Math.sin(_loc4_ * _loc6_)));
            _loc6_++;
         }
         return _loc5_;
      }
      
      public static function getCopyMovie(param1:*, param2:String) : MovieClip
      {
         var _loc3_:Class = param1.getAssetClass(param2);
         return new _loc3_() as MovieClip;
      }
   }
}

