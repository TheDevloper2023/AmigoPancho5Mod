package com.logicom.geom
{
   public class Polygons
   {
      
      private var _polygons:Vector.<Polygon> = new Vector.<Polygon>();
      
      public function Polygons()
      {
         super();
      }
      
      public function addPolygon(param1:Polygon) : void
      {
         this._polygons.push(param1);
      }
      
      public function clear() : void
      {
         this._polygons.length = 0;
      }
      
      public function getPolygons() : Vector.<Polygon>
      {
         return this._polygons;
      }
   }
}

