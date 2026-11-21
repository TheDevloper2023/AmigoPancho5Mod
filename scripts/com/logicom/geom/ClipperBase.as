package com.logicom.geom
{
   public class ClipperBase
   {
      
      internal static const horizontal:Number = -3.4e+38;
      
      internal static const loRange:int = 1073741823;
      
      internal static const hiRange:int = 1073741823;
      
      internal var m_MinimaList:LocalMinima;
      
      internal var m_CurrentLM:LocalMinima;
      
      internal var m_edges:Vector.<Vector.<TEdge>> = new Vector.<Vector.<TEdge>>();
      
      internal var m_UseFullRange:Boolean;
      
      public function ClipperBase()
      {
         super();
         this.m_MinimaList = null;
         this.m_CurrentLM = null;
         this.m_UseFullRange = false;
      }
      
      public static function abs(param1:int) : int
      {
         return param1 < 0 ? int(-param1) : param1;
      }
      
      public static function xor(param1:Boolean, param2:Boolean) : Boolean
      {
         return !(param1 && param2) && (param1 || param2);
      }
      
      protected static function pointsEqual(param1:IntPoint, param2:IntPoint) : Boolean
      {
         return param1.equals(param2);
      }
      
      internal function pointIsVertex(param1:IntPoint, param2:OutPt) : Boolean
      {
         var _loc3_:OutPt = param2;
         while(!pointsEqual(_loc3_.pt,param1))
         {
            _loc3_ = _loc3_.next;
            if(_loc3_ == param2)
            {
               return false;
            }
         }
         return true;
      }
      
      internal function pointInPolygon(param1:IntPoint, param2:OutPt, param3:Boolean) : Boolean
      {
         var _loc4_:OutPt = param2;
         var _loc5_:Boolean = false;
         do
         {
            if((_loc4_.pt.Y <= param1.Y && param1.Y < _loc4_.prev.pt.Y || _loc4_.prev.pt.Y <= param1.Y && param1.Y < _loc4_.pt.Y) && param1.X - _loc4_.pt.X < (_loc4_.prev.pt.X - _loc4_.pt.X) * (param1.Y - _loc4_.pt.Y) / (_loc4_.prev.pt.Y - _loc4_.pt.Y))
            {
               _loc5_ = !_loc5_;
            }
         }
         while(_loc4_ = _loc4_.next, _loc4_ != param2);
         return _loc5_;
      }
      
      internal function slopesEqual(param1:TEdge, param2:TEdge, param3:Boolean) : Boolean
      {
         return (param1.ytop - param1.ybot) * (param2.xtop - param2.xbot) - (param1.xtop - param1.xbot) * (param2.ytop - param2.ybot) == 0;
      }
      
      protected function slopesEqual3(param1:IntPoint, param2:IntPoint, param3:IntPoint, param4:Boolean) : Boolean
      {
         return (param1.Y - param2.Y) * (param2.X - param3.X) - (param1.X - param2.X) * (param2.Y - param3.Y) == 0;
      }
      
      protected function slopesEqual4(param1:IntPoint, param2:IntPoint, param3:IntPoint, param4:IntPoint, param5:Boolean) : Boolean
      {
         return (param1.Y - param2.Y) * (param3.X - param4.X) - (param1.X - param2.X) * (param3.Y - param4.Y) == 0;
      }
      
      public function clear() : void
      {
         var _loc2_:int = 0;
         this.disposeLocalMinimaList();
         var _loc1_:int = 0;
         while(_loc1_ < this.m_edges.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.m_edges[_loc1_].length)
            {
               this.m_edges[_loc1_][_loc2_] = null;
               _loc2_++;
            }
            this.m_edges[_loc1_].length = 0;
            _loc1_++;
         }
         this.m_edges.length = 0;
         this.m_UseFullRange = false;
      }
      
      private function disposeLocalMinimaList() : void
      {
         var _loc1_:LocalMinima = null;
         while(this.m_MinimaList != null)
         {
            _loc1_ = this.m_MinimaList.next;
            this.m_MinimaList = null;
            this.m_MinimaList = _loc1_;
         }
         this.m_CurrentLM = null;
      }
      
      public function addPolygons(param1:Polygons, param2:int) : Boolean
      {
         var _loc4_:Polygon = null;
         var _loc3_:Boolean = false;
         for each(_loc4_ in param1.getPolygons())
         {
            if(this.addPolygon(_loc4_,param2))
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function addPolygon(param1:Polygon, param2:int) : Boolean
      {
         var _loc13_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Vector.<IntPoint> = param1.getPoints();
         var _loc5_:* = int(_loc4_.length);
         if(_loc5_ < 3)
         {
            return false;
         }
         var _loc6_:Polygon = new Polygon();
         var _loc7_:Vector.<IntPoint> = _loc6_.getPoints();
         _loc7_.push(_loc4_[0]);
         var _loc8_:* = 0;
         var _loc9_:* = 1;
         while(_loc9_ < _loc5_)
         {
            if(this.m_UseFullRange)
            {
               _loc13_ = hiRange;
            }
            else
            {
               _loc13_ = loRange;
            }
            if(abs(_loc4_[_loc9_].X) > _loc13_ || abs(_loc4_[_loc9_].Y) > _loc13_)
            {
               if(abs(_loc4_[_loc9_].X) > hiRange || abs(_loc4_[_loc9_].Y) > hiRange)
               {
                  throw new ClipperException("Coordinate exceeds range bounds");
               }
               _loc13_ = hiRange;
               this.m_UseFullRange = true;
            }
            if(!pointsEqual(_loc7_[_loc8_],_loc4_[_loc9_]))
            {
               if(_loc8_ > 0 && this.slopesEqual3(_loc7_[_loc8_ - 1],_loc7_[_loc8_],_loc4_[_loc9_],this.m_UseFullRange))
               {
                  if(pointsEqual(_loc7_[_loc8_ - 1],_loc4_[_loc9_]))
                  {
                     _loc8_--;
                  }
               }
               else
               {
                  _loc8_++;
               }
               if(_loc8_ < _loc7_.length)
               {
                  _loc7_[_loc8_] = _loc4_[_loc9_];
               }
               else
               {
                  _loc7_.push(_loc4_[_loc9_]);
               }
            }
            _loc9_++;
         }
         if(_loc8_ < 2)
         {
            return false;
         }
         _loc5_ = int(_loc8_ + 1);
         while(_loc5_ > 2)
         {
            if(pointsEqual(_loc7_[_loc8_],_loc7_[0]))
            {
               _loc8_--;
            }
            else if(pointsEqual(_loc7_[0],_loc7_[1]) || this.slopesEqual3(_loc7_[_loc8_],_loc7_[0],_loc7_[1],this.m_UseFullRange))
            {
               _loc7_[0] = _loc7_[_loc8_--];
            }
            else if(this.slopesEqual3(_loc7_[_loc8_ - 1],_loc7_[_loc8_],_loc7_[0],this.m_UseFullRange))
            {
               _loc8_--;
            }
            else
            {
               if(!this.slopesEqual3(_loc7_[0],_loc7_[1],_loc7_[2],this.m_UseFullRange))
               {
                  break;
               }
               _loc9_ = 2;
               while(_loc9_ <= _loc8_)
               {
                  _loc7_[_loc9_ - 1] = _loc7_[_loc9_];
                  _loc9_++;
               }
               _loc8_--;
            }
            _loc5_--;
         }
         if(_loc5_ < 3)
         {
            return false;
         }
         var _loc10_:Vector.<TEdge> = new Vector.<TEdge>(_loc5_);
         _loc9_ = 0;
         while(_loc9_ < _loc5_)
         {
            _loc10_[_loc9_] = new TEdge();
            _loc9_++;
         }
         this.m_edges.push(_loc10_);
         _loc10_[0].xcurr = _loc7_[0].X;
         _loc10_[0].ycurr = _loc7_[0].Y;
         this.initEdge(_loc10_[_loc5_ - 1],_loc10_[0],_loc10_[_loc5_ - 2],_loc7_[_loc5_ - 1],param2);
         _loc9_ = int(_loc5_ - 2);
         while(_loc9_ > 0)
         {
            this.initEdge(_loc10_[_loc9_],_loc10_[_loc9_ + 1],_loc10_[_loc9_ - 1],_loc7_[_loc9_],param2);
            _loc9_--;
         }
         this.initEdge(_loc10_[0],_loc10_[1],_loc10_[_loc5_ - 1],_loc7_[0],param2);
         var _loc11_:TEdge;
         var _loc12_:TEdge = _loc11_ = _loc10_[0];
         do
         {
            _loc11_.xcurr = _loc11_.xbot;
            _loc11_.ycurr = _loc11_.ybot;
            if(_loc11_.ytop < _loc12_.ytop)
            {
               _loc12_ = _loc11_;
            }
         }
         while(_loc11_ = _loc11_.next, _loc11_ != _loc10_[0]);
         if(_loc12_.windDelta > 0)
         {
            _loc12_ = _loc12_.next;
         }
         if(_loc12_.dx == horizontal)
         {
            _loc12_ = _loc12_.next;
         }
         _loc11_ = _loc12_;
         while(true)
         {
            _loc11_ = this.addBoundsToLML(_loc11_);
            if(_loc11_ == _loc12_)
            {
               break;
            }
         }
         return true;
      }
      
      private function initEdge(param1:TEdge, param2:TEdge, param3:TEdge, param4:IntPoint, param5:int) : void
      {
         param1.next = param2;
         param1.prev = param3;
         param1.xcurr = param4.X;
         param1.ycurr = param4.Y;
         if(param1.ycurr >= param1.next.ycurr)
         {
            param1.xbot = param1.xcurr;
            param1.ybot = param1.ycurr;
            param1.xtop = param1.next.xcurr;
            param1.ytop = param1.next.ycurr;
            param1.windDelta = 1;
         }
         else
         {
            param1.xtop = param1.xcurr;
            param1.ytop = param1.ycurr;
            param1.xbot = param1.next.xcurr;
            param1.ybot = param1.next.ycurr;
            param1.windDelta = -1;
         }
         this.setDx(param1);
         param1.polyType = param5;
         param1.outIdx = -1;
      }
      
      private function setDx(param1:TEdge) : void
      {
         if(param1.ybot == param1.ytop)
         {
            param1.dx = horizontal;
         }
         else
         {
            param1.dx = Number(param1.xtop - param1.xbot) / (param1.ytop - param1.ybot);
         }
      }
      
      private function addBoundsToLML(param1:TEdge) : TEdge
      {
         var _loc2_:LocalMinima = null;
         param1.nextInLML = null;
         param1 = param1.next;
         while(true)
         {
            if(param1.dx == horizontal)
            {
               if(param1.next.ytop < param1.ytop && param1.next.xbot > param1.prev.xbot)
               {
                  break;
               }
               if(param1.xtop != param1.prev.xbot)
               {
                  this.swapX(param1);
               }
               param1.nextInLML = param1.prev;
            }
            else
            {
               if(param1.ycurr == param1.prev.ycurr)
               {
                  break;
               }
               param1.nextInLML = param1.prev;
            }
            param1 = param1.next;
         }
         _loc2_ = new LocalMinima();
         _loc2_.next = null;
         _loc2_.Y = param1.prev.ybot;
         if(param1.dx == horizontal)
         {
            if(param1.xbot != param1.prev.xbot)
            {
               this.swapX(param1);
            }
            _loc2_.leftBound = param1.prev;
            _loc2_.rightBound = param1;
         }
         else if(param1.dx < param1.prev.dx)
         {
            _loc2_.leftBound = param1.prev;
            _loc2_.rightBound = param1;
         }
         else
         {
            _loc2_.leftBound = param1;
            _loc2_.rightBound = param1.prev;
         }
         _loc2_.leftBound.side = EdgeSide.LEFT;
         _loc2_.rightBound.side = EdgeSide.RIGHT;
         this.insertLocalMinima(_loc2_);
         while(!(param1.next.ytop == param1.ytop && param1.next.dx != horizontal))
         {
            param1.nextInLML = param1.next;
            param1 = param1.next;
            if(param1.dx == horizontal && param1.xbot != param1.prev.xtop)
            {
               this.swapX(param1);
            }
         }
         return param1.next;
      }
      
      private function insertLocalMinima(param1:LocalMinima) : void
      {
         var _loc2_:LocalMinima = null;
         if(this.m_MinimaList == null)
         {
            this.m_MinimaList = param1;
         }
         else if(param1.Y >= this.m_MinimaList.Y)
         {
            param1.next = this.m_MinimaList;
            this.m_MinimaList = param1;
         }
         else
         {
            _loc2_ = this.m_MinimaList;
            while(_loc2_.next != null && param1.Y < _loc2_.next.Y)
            {
               _loc2_ = _loc2_.next;
            }
            param1.next = _loc2_.next;
            _loc2_.next = param1;
         }
      }
      
      protected function popLocalMinima() : void
      {
         if(this.m_CurrentLM == null)
         {
            return;
         }
         this.m_CurrentLM = this.m_CurrentLM.next;
      }
      
      private function swapX(param1:TEdge) : void
      {
         param1.xcurr = param1.xtop;
         param1.xtop = param1.xbot;
         param1.xbot = param1.xcurr;
      }
      
      protected function reset() : void
      {
         var _loc2_:TEdge = null;
         this.m_CurrentLM = this.m_MinimaList;
         var _loc1_:LocalMinima = this.m_MinimaList;
         while(_loc1_ != null)
         {
            _loc2_ = _loc1_.leftBound;
            while(_loc2_ != null)
            {
               _loc2_.xcurr = _loc2_.xbot;
               _loc2_.ycurr = _loc2_.ybot;
               _loc2_.side = EdgeSide.LEFT;
               _loc2_.outIdx = -1;
               _loc2_ = _loc2_.nextInLML;
            }
            _loc2_ = _loc1_.rightBound;
            while(_loc2_ != null)
            {
               _loc2_.xcurr = _loc2_.xbot;
               _loc2_.ycurr = _loc2_.ybot;
               _loc2_.side = EdgeSide.RIGHT;
               _loc2_.outIdx = -1;
               _loc2_ = _loc2_.nextInLML;
            }
            _loc1_ = _loc1_.next;
         }
      }
      
      public function getBounds() : IntRect
      {
         var _loc3_:TEdge = null;
         var _loc4_:TEdge = null;
         var _loc1_:IntRect = new IntRect(0,0,0,0);
         var _loc2_:LocalMinima = this.m_MinimaList;
         if(_loc2_ == null)
         {
            return _loc1_;
         }
         _loc1_.left = _loc2_.leftBound.xbot;
         _loc1_.top = _loc2_.leftBound.ybot;
         _loc1_.right = _loc2_.leftBound.xbot;
         _loc1_.bottom = _loc2_.leftBound.ybot;
         while(_loc2_ != null)
         {
            if(_loc2_.leftBound.ybot > _loc1_.bottom)
            {
               _loc1_.bottom = _loc2_.leftBound.ybot;
            }
            _loc3_ = _loc2_.leftBound;
            while(true)
            {
               _loc4_ = _loc3_;
               while(_loc3_.nextInLML != null)
               {
                  if(_loc3_.xbot < _loc1_.left)
                  {
                     _loc1_.left = _loc3_.xbot;
                  }
                  if(_loc3_.xbot > _loc1_.right)
                  {
                     _loc1_.right = _loc3_.xbot;
                  }
                  _loc3_ = _loc3_.nextInLML;
               }
               if(_loc3_.xbot < _loc1_.left)
               {
                  _loc1_.left = _loc3_.xbot;
               }
               if(_loc3_.xbot > _loc1_.right)
               {
                  _loc1_.right = _loc3_.xbot;
               }
               if(_loc3_.xtop < _loc1_.left)
               {
                  _loc1_.left = _loc3_.xtop;
               }
               if(_loc3_.xtop > _loc1_.right)
               {
                  _loc1_.right = _loc3_.xtop;
               }
               if(_loc3_.ytop < _loc1_.top)
               {
                  _loc1_.top = _loc3_.ytop;
               }
               if(_loc4_ != _loc2_.leftBound)
               {
                  break;
               }
               _loc3_ = _loc2_.rightBound;
            }
            _loc2_ = _loc2_.next;
         }
         return _loc1_;
      }
   }
}

