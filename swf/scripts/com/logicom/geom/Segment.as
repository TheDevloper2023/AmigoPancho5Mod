package com.logicom.geom
{
   public class Segment
   {
      
      public var pt1:IntPoint;
      
      public var pt2:IntPoint;
      
      public function Segment(param1:IntPoint, param2:IntPoint)
      {
         super();
         this.pt1 = param1;
         this.pt2 = param2;
      }
      
      public function swapPoints() : void
      {
         var _loc1_:IntPoint = this.pt1;
         this.pt1 = this.pt2;
         this.pt2 = _loc1_;
      }
   }
}

