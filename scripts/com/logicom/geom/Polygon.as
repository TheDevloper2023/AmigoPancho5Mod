package com.logicom.geom
{
   public class Polygon
   {
      
      private var _points:Vector.<IntPoint> = new Vector.<IntPoint>();
      
      public function Polygon()
      {
         super();
      }
      
      public function addPoint(param1:IntPoint) : void
      {
         this._points.push(param1);
      }
      
      public function getPoint(param1:int) : IntPoint
      {
         return this._points[param1];
      }
      
      public function getPoints() : Vector.<IntPoint>
      {
         return this._points;
      }
      
      public function getSize() : int
      {
         return this._points.length;
      }
      
      public function reverse() : void
      {
         this._points.reverse();
      }
   }
}

