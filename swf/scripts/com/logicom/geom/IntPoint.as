package com.logicom.geom
{
   public class IntPoint
   {
      
      public var X:int;
      
      public var Y:int;
      
      public function IntPoint(param1:int = 0, param2:int = 0)
      {
         super();
         this.X = param1;
         this.Y = param2;
      }
      
      public static function cross(param1:IntPoint, param2:IntPoint) : int
      {
         return param1.X * param2.Y - param2.X * param1.Y;
      }
      
      public function equals(param1:IntPoint) : Boolean
      {
         return this.X == param1.X && this.Y == param1.Y;
      }
   }
}

