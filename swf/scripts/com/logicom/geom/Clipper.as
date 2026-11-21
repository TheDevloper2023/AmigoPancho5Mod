package com.logicom.geom
{
   import flash.geom.Point;
   
   public class Clipper extends ClipperBase
   {
      
      private var m_PolyOuts:Vector.<OutRec>;
      
      private var m_ClipType:int;
      
      private var m_Scanbeam:Scanbeam;
      
      private var m_ActiveEdges:TEdge;
      
      private var m_SortedEdges:TEdge;
      
      private var m_IntersectNodes:IntersectNode;
      
      private var m_ExecuteLocked:Boolean;
      
      private var m_ClipFillType:int;
      
      private var m_SubjFillType:int;
      
      private var m_Joins:Vector.<JoinRec>;
      
      private var m_HorizJoins:Vector.<HorzJoinRec>;
      
      private var m_ReverseOutput:Boolean;
      
      public function Clipper()
      {
         super();
         this.m_Scanbeam = null;
         this.m_ActiveEdges = null;
         this.m_SortedEdges = null;
         this.m_IntersectNodes = null;
         this.m_ExecuteLocked = false;
         this.m_PolyOuts = new Vector.<OutRec>();
         this.m_Joins = new Vector.<JoinRec>();
         this.m_HorizJoins = new Vector.<HorzJoinRec>();
         this.m_ReverseOutput = false;
      }
      
      public static function clipPolygon(param1:Array, param2:Array, param3:int) : Array
      {
         var _loc6_:Point = null;
         var _loc7_:Clipper = null;
         var _loc8_:Polygons = null;
         var _loc9_:Array = null;
         var _loc10_:Polygon = null;
         var _loc11_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:IntPoint = null;
         var _loc4_:Polygon = new Polygon();
         var _loc5_:Polygon = new Polygon();
         for each(_loc6_ in param1)
         {
            _loc4_.addPoint(new IntPoint(Math.round(_loc6_.x) as int,Math.round(_loc6_.y) as int));
         }
         for each(_loc6_ in param2)
         {
            _loc5_.addPoint(new IntPoint(Math.round(_loc6_.x) as int,Math.round(_loc6_.y) as int));
         }
         _loc7_ = new Clipper();
         _loc7_.addPolygon(_loc4_,PolyType.SUBJECT);
         _loc7_.addPolygon(_loc5_,PolyType.CLIP);
         _loc8_ = new Polygons();
         _loc7_.execute(param3,_loc8_,PolyFillType.EVEN_ODD,PolyFillType.EVEN_ODD);
         _loc9_ = [];
         for each(_loc10_ in _loc8_.getPolygons())
         {
            _loc11_ = _loc10_.getSize();
            _loc12_ = new Array(_loc11_);
            _loc13_ = 0;
            while(_loc13_ < _loc11_)
            {
               _loc14_ = _loc10_.getPoint(_loc13_);
               _loc12_[_loc13_] = new Point(_loc14_.X,_loc14_.Y);
               _loc13_++;
            }
            _loc9_.push(_loc12_);
         }
         return _loc9_;
      }
      
      private static function polySort(param1:OutRec, param2:OutRec) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == param2)
         {
            return 0;
         }
         if(param1.pts == null || param2.pts == null)
         {
            if(param1.pts == null != (param2.pts == null))
            {
               return param1.pts == null ? 1 : -1;
            }
            return 0;
         }
         if(param1.isHole)
         {
            _loc3_ = param1.firstLeft.idx;
         }
         else
         {
            _loc3_ = param1.idx;
         }
         if(param2.isHole)
         {
            _loc4_ = param2.firstLeft.idx;
         }
         else
         {
            _loc4_ = param2.idx;
         }
         var _loc5_:int = _loc3_ - _loc4_;
         if(_loc5_ == 0 && param1.isHole != param2.isHole)
         {
            return param1.isHole ? 1 : -1;
         }
         return _loc5_;
      }
      
      private static function swapSides(param1:TEdge, param2:TEdge) : void
      {
         var _loc3_:int = param1.side;
         param1.side = param2.side;
         param2.side = _loc3_;
      }
      
      private static function swapPolyIndexes(param1:TEdge, param2:TEdge) : void
      {
         var _loc3_:int = param1.outIdx;
         param1.outIdx = param2.outIdx;
         param2.outIdx = _loc3_;
      }
      
      private static function getNextInAEL(param1:TEdge, param2:int) : TEdge
      {
         return param2 == Direction.LEFT_TO_RIGHT ? param1.nextInAEL : param1.prevInAEL;
      }
      
      private static function isMinima(param1:TEdge) : Boolean
      {
         return param1 != null && param1.prev.nextInLML != param1 && param1.next.nextInLML != param1;
      }
      
      private static function isMaxima(param1:TEdge, param2:Number) : Boolean
      {
         return param1 != null && param1.ytop == param2 && param1.nextInLML == null;
      }
      
      private static function isIntermediate(param1:TEdge, param2:Number) : Boolean
      {
         return param1.ytop == param2 && param1.nextInLML != null;
      }
      
      private static function getMaximaPair(param1:TEdge) : TEdge
      {
         if(!isMaxima(param1.next,param1.ytop) || param1.next.xtop != param1.xtop)
         {
            return param1.prev;
         }
         return param1.next;
      }
      
      private static function round(param1:Number) : int
      {
         return param1 < 0 ? int(int(param1 - 0.5)) : int(int(param1 + 0.5));
      }
      
      private static function topX(param1:TEdge, param2:int) : int
      {
         if(param2 == param1.ytop)
         {
            return param1.xtop;
         }
         return param1.xbot + round(param1.dx * (param2 - param1.ybot));
      }
      
      public static function reversePolygons(param1:Polygons) : void
      {
         var _loc2_:Polygon = null;
         for each(_loc2_ in param1.getPolygons())
         {
            _loc2_.reverse();
         }
      }
      
      public static function orientation(param1:Polygon) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Vector.<IntPoint> = param1.getPoints();
         var _loc3_:int = _loc2_.length - 1;
         if(_loc3_ < 2)
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ <= _loc3_)
         {
            if(_loc2_[_loc7_].Y >= _loc2_[_loc4_].Y)
            {
               if(_loc2_[_loc7_].Y > _loc2_[_loc4_].Y || _loc2_[_loc7_].X < _loc2_[_loc4_].X)
               {
                  _loc4_ = _loc7_;
               }
            }
            _loc7_++;
         }
         if(_loc4_ == _loc3_)
         {
            _loc5_ = 0;
         }
         else
         {
            _loc5_ = _loc4_ + 1;
         }
         if(_loc4_ == 0)
         {
            _loc6_ = _loc3_;
         }
         else
         {
            _loc6_ = _loc4_ - 1;
         }
         var _loc8_:IntPoint = new IntPoint(_loc2_[_loc4_].X - _loc2_[_loc6_].X,_loc2_[_loc4_].Y - _loc2_[_loc6_].Y);
         var _loc9_:IntPoint = new IntPoint(_loc2_[_loc5_].X - _loc2_[_loc4_].X,_loc2_[_loc5_].Y - _loc2_[_loc4_].Y);
         if(abs(_loc8_.X) > loRange || abs(_loc8_.Y) > loRange || abs(_loc9_.X) > loRange || abs(_loc9_.Y) > loRange)
         {
            if(abs(_loc8_.X) > hiRange || abs(_loc8_.Y) > hiRange || abs(_loc9_.X) > hiRange || abs(_loc9_.Y) > hiRange)
            {
               throw new ClipperException("Coordinate exceeds range bounds.");
            }
            return IntPoint.cross(_loc8_,_loc9_) >= 0;
         }
         return IntPoint.cross(_loc8_,_loc9_) >= 0;
      }
      
      override public function clear() : void
      {
         if(m_edges.length == 0)
         {
            return;
         }
         this.disposeAllPolyPts();
         super.clear();
      }
      
      private function disposeScanbeamList() : void
      {
         var _loc1_:Scanbeam = null;
         while(this.m_Scanbeam != null)
         {
            _loc1_ = this.m_Scanbeam.next;
            this.m_Scanbeam = null;
            this.m_Scanbeam = _loc1_;
         }
      }
      
      override protected function reset() : void
      {
         super.reset();
         this.m_Scanbeam = null;
         this.m_ActiveEdges = null;
         this.m_SortedEdges = null;
         this.disposeAllPolyPts();
         var _loc1_:LocalMinima = m_MinimaList;
         while(_loc1_ != null)
         {
            this.insertScanbeam(_loc1_.Y);
            this.insertScanbeam(_loc1_.leftBound.ytop);
            _loc1_ = _loc1_.next;
         }
      }
      
      public function setReverseSolution(param1:Boolean) : void
      {
         this.m_ReverseOutput = param1;
      }
      
      public function getReverseSolution() : Boolean
      {
         return this.m_ReverseOutput;
      }
      
      private function insertScanbeam(param1:int) : void
      {
         var _loc2_:Scanbeam = null;
         var _loc3_:Scanbeam = null;
         if(this.m_Scanbeam == null)
         {
            this.m_Scanbeam = new Scanbeam();
            this.m_Scanbeam.next = null;
            this.m_Scanbeam.Y = param1;
         }
         else if(param1 > this.m_Scanbeam.Y)
         {
            _loc2_ = new Scanbeam();
            _loc2_.Y = param1;
            _loc2_.next = this.m_Scanbeam;
            this.m_Scanbeam = _loc2_;
         }
         else
         {
            _loc3_ = this.m_Scanbeam;
            while(_loc3_.next != null && param1 <= _loc3_.next.Y)
            {
               _loc3_ = _loc3_.next;
            }
            if(param1 == _loc3_.Y)
            {
               return;
            }
            _loc2_ = new Scanbeam();
            _loc2_.Y = param1;
            _loc2_.next = _loc3_.next;
            _loc3_.next = _loc2_;
         }
      }
      
      public function execute(param1:int, param2:Polygons, param3:int, param4:int) : Boolean
      {
         if(this.m_ExecuteLocked)
         {
            return false;
         }
         this.m_ExecuteLocked = true;
         param2.clear();
         this.m_SubjFillType = param3;
         this.m_ClipFillType = param4;
         this.m_ClipType = param1;
         var _loc5_:Boolean = this.executeInternal(false);
         if(_loc5_)
         {
            this.buildResult(param2);
         }
         this.m_ExecuteLocked = false;
         return _loc5_;
      }
      
      internal function findAppendLinkEnd(param1:OutRec) : OutRec
      {
         while(param1.appendLink != null)
         {
            param1 = param1.appendLink;
         }
         return param1;
      }
      
      internal function fixHoleLinkage(param1:OutRec) : void
      {
         var _loc2_:OutRec = null;
         if(param1.bottomPt != null)
         {
            _loc2_ = this.m_PolyOuts[param1.bottomPt.idx].firstLeft;
         }
         else
         {
            _loc2_ = param1.firstLeft;
         }
         if(param1 == _loc2_)
         {
            throw new ClipperException("HoleLinkage error");
         }
         if(_loc2_ != null)
         {
            if(_loc2_.appendLink != null)
            {
               _loc2_ = this.findAppendLinkEnd(_loc2_);
            }
            if(_loc2_ == param1)
            {
               _loc2_ = null;
            }
            else if(_loc2_.isHole)
            {
               this.fixHoleLinkage(_loc2_);
               _loc2_ = _loc2_.firstLeft;
            }
         }
         param1.firstLeft = _loc2_;
         if(_loc2_ == null)
         {
            param1.isHole = false;
         }
         param1.appendLink = null;
      }
      
      private function executeInternal(param1:Boolean) : Boolean
      {
         var succeeded:Boolean = false;
         var botY:int = 0;
         var topY:int = 0;
         var outRec:OutRec = null;
         var fixHoleLinkages:Boolean = param1;
         try
         {
            this.reset();
            if(m_CurrentLM == null)
            {
               return true;
            }
            botY = this.popScanbeam();
            do
            {
               this.insertLocalMinimaIntoAEL(botY);
               this.m_HorizJoins.length = 0;
               this.processHorizontals();
               topY = this.popScanbeam();
               succeeded = this.processIntersections(botY,topY);
               if(!succeeded)
               {
                  break;
               }
               this.processEdgesAtTopOfScanbeam(topY);
               botY = topY;
            }
            while(this.m_Scanbeam != null);
         }
         catch(e:Error)
         {
            succeeded = false;
         }
         if(succeeded)
         {
            for each(outRec in this.m_PolyOuts)
            {
               if(outRec.pts != null)
               {
                  this.fixupOutPolygon(outRec);
                  if(outRec.pts != null)
                  {
                     if(outRec.isHole && fixHoleLinkages)
                     {
                        this.fixHoleLinkage(outRec);
                     }
                     if(outRec.bottomPt == outRec.bottomFlag && this.orientationOutRec(outRec,m_UseFullRange) != this.areaOutRec(outRec,m_UseFullRange) > 0)
                     {
                        this.disposeBottomPt(outRec);
                     }
                     if(outRec.isHole == xor(this.m_ReverseOutput,this.orientationOutRec(outRec,m_UseFullRange)))
                     {
                        this.reversePolyPtLinks(outRec.pts);
                     }
                  }
               }
            }
            this.joinCommonEdges(fixHoleLinkages);
            if(fixHoleLinkages)
            {
               this.m_PolyOuts.sort(polySort);
            }
         }
         this.m_Joins.length = 0;
         this.m_HorizJoins.length = 0;
         return succeeded;
      }
      
      private function popScanbeam() : int
      {
         var _loc1_:int = this.m_Scanbeam.Y;
         var _loc2_:Scanbeam = this.m_Scanbeam;
         this.m_Scanbeam = this.m_Scanbeam.next;
         _loc2_ = null;
         return _loc1_;
      }
      
      private function disposeAllPolyPts() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_PolyOuts.length)
         {
            this.disposeOutRec(_loc1_);
            _loc1_++;
         }
         this.m_PolyOuts.length = 0;
      }
      
      private function disposeBottomPt(param1:OutRec) : void
      {
         var _loc2_:OutPt = param1.bottomPt.next;
         var _loc3_:OutPt = param1.bottomPt.prev;
         if(param1.pts == param1.bottomPt)
         {
            param1.pts = _loc2_;
         }
         param1.bottomPt = null;
         _loc2_.prev = _loc3_;
         _loc3_.next = _loc2_;
         param1.bottomPt = _loc2_;
         this.fixupOutPolygon(param1);
      }
      
      private function disposeOutRec(param1:int) : void
      {
         var _loc2_:OutRec = this.m_PolyOuts[param1];
         if(_loc2_.pts != null)
         {
            this.disposeOutPts(_loc2_.pts);
         }
         _loc2_ = null;
         this.m_PolyOuts[param1] = null;
      }
      
      private function disposeOutPts(param1:OutPt) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:OutPt = null;
         param1.prev.next = null;
         while(param1 != null)
         {
            _loc2_ = param1;
            param1 = param1.next;
            _loc2_ = null;
         }
      }
      
      private function addJoin(param1:TEdge, param2:TEdge, param3:int, param4:int) : void
      {
         var _loc5_:JoinRec = new JoinRec();
         if(param3 >= 0)
         {
            _loc5_.poly1Idx = param3;
         }
         else
         {
            _loc5_.poly1Idx = param1.outIdx;
         }
         _loc5_.pt1a = new IntPoint(param1.xcurr,param1.ycurr);
         _loc5_.pt1b = new IntPoint(param1.xtop,param1.ytop);
         if(param4 >= 0)
         {
            _loc5_.poly2Idx = param4;
         }
         else
         {
            _loc5_.poly2Idx = param2.outIdx;
         }
         _loc5_.pt2a = new IntPoint(param2.xcurr,param2.ycurr);
         _loc5_.pt2b = new IntPoint(param2.xtop,param2.ytop);
         this.m_Joins.push(_loc5_);
      }
      
      private function addHorzJoin(param1:TEdge, param2:int) : void
      {
         var _loc3_:HorzJoinRec = new HorzJoinRec();
         _loc3_.edge = param1;
         _loc3_.savedIdx = param2;
         this.m_HorizJoins.push(_loc3_);
      }
      
      private function insertLocalMinimaIntoAEL(param1:int) : void
      {
         var _loc2_:TEdge = null;
         var _loc3_:TEdge = null;
         var _loc4_:int = 0;
         var _loc5_:HorzJoinRec = null;
         var _loc6_:IntPoint = null;
         var _loc7_:IntPoint = null;
         var _loc8_:IntPoint = null;
         var _loc9_:IntPoint = null;
         var _loc10_:TEdge = null;
         var _loc11_:IntPoint = null;
         while(m_CurrentLM != null && m_CurrentLM.Y == param1)
         {
            _loc2_ = m_CurrentLM.leftBound;
            _loc3_ = m_CurrentLM.rightBound;
            this.insertEdgeIntoAEL(_loc2_);
            this.insertScanbeam(_loc2_.ytop);
            this.insertEdgeIntoAEL(_loc3_);
            if(this.isEvenOddFillType(_loc2_))
            {
               _loc2_.windDelta = 1;
               _loc3_.windDelta = 1;
            }
            else
            {
               _loc3_.windDelta = -_loc2_.windDelta;
            }
            this.setWindingCount(_loc2_);
            _loc3_.windCnt = _loc2_.windCnt;
            _loc3_.windCnt2 = _loc2_.windCnt2;
            if(_loc3_.dx == horizontal)
            {
               this.addEdgeToSEL(_loc3_);
               this.insertScanbeam(_loc3_.nextInLML.ytop);
            }
            else
            {
               this.insertScanbeam(_loc3_.ytop);
            }
            if(this.isContributing(_loc2_))
            {
               this.addLocalMinPoly(_loc2_,_loc3_,new IntPoint(_loc2_.xcurr,m_CurrentLM.Y));
            }
            if(_loc3_.outIdx >= 0)
            {
               if(_loc3_.dx == horizontal)
               {
                  _loc4_ = 0;
                  while(_loc4_ < this.m_HorizJoins.length)
                  {
                     _loc5_ = this.m_HorizJoins[_loc4_];
                     _loc6_ = new IntPoint(_loc5_.edge.xbot,_loc5_.edge.ybot);
                     _loc7_ = new IntPoint(_loc5_.edge.xtop,_loc5_.edge.ytop);
                     _loc8_ = new IntPoint(_loc3_.xbot,_loc3_.ybot);
                     _loc9_ = new IntPoint(_loc3_.xtop,_loc3_.ytop);
                     if(this.getOverlapSegment(new Segment(_loc6_,_loc7_),new Segment(_loc8_,_loc9_),new Segment(null,null)))
                     {
                        this.addJoin(_loc5_.edge,_loc3_,_loc5_.savedIdx,-1);
                     }
                     _loc4_++;
                  }
               }
            }
            if(_loc2_.nextInAEL != _loc3_)
            {
               if(_loc3_.outIdx >= 0 && _loc3_.prevInAEL.outIdx >= 0 && slopesEqual(_loc3_.prevInAEL,_loc3_,m_UseFullRange))
               {
                  this.addJoin(_loc3_,_loc3_.prevInAEL,-1,-1);
               }
               _loc10_ = _loc2_.nextInAEL;
               _loc11_ = new IntPoint(_loc2_.xcurr,_loc2_.ycurr);
               while(_loc10_ != _loc3_)
               {
                  if(_loc10_ == null)
                  {
                     throw new ClipperException("InsertLocalMinimaIntoAEL: missing rightbound!");
                  }
                  this.intersectEdges(_loc3_,_loc10_,_loc11_,Protects.NONE);
                  _loc10_ = _loc10_.nextInAEL;
               }
            }
            popLocalMinima();
         }
      }
      
      private function insertEdgeIntoAEL(param1:TEdge) : void
      {
         var _loc2_:TEdge = null;
         param1.prevInAEL = null;
         param1.nextInAEL = null;
         if(this.m_ActiveEdges == null)
         {
            this.m_ActiveEdges = param1;
         }
         else if(this.E2InsertsBeforeE1(this.m_ActiveEdges,param1))
         {
            param1.nextInAEL = this.m_ActiveEdges;
            this.m_ActiveEdges.prevInAEL = param1;
            this.m_ActiveEdges = param1;
         }
         else
         {
            _loc2_ = this.m_ActiveEdges;
            while(_loc2_.nextInAEL != null && !this.E2InsertsBeforeE1(_loc2_.nextInAEL,param1))
            {
               _loc2_ = _loc2_.nextInAEL;
            }
            param1.nextInAEL = _loc2_.nextInAEL;
            if(_loc2_.nextInAEL != null)
            {
               _loc2_.nextInAEL.prevInAEL = param1;
            }
            param1.prevInAEL = _loc2_;
            _loc2_.nextInAEL = param1;
         }
      }
      
      private function E2InsertsBeforeE1(param1:TEdge, param2:TEdge) : Boolean
      {
         return param2.xcurr == param1.xcurr ? param2.dx > param1.dx : param2.xcurr < param1.xcurr;
      }
      
      private function isEvenOddFillType(param1:TEdge) : Boolean
      {
         if(param1.polyType == PolyType.SUBJECT)
         {
            return this.m_SubjFillType == PolyFillType.EVEN_ODD;
         }
         return this.m_ClipFillType == PolyFillType.EVEN_ODD;
      }
      
      private function isEvenOddAltFillType(param1:TEdge) : Boolean
      {
         if(param1.polyType == PolyType.SUBJECT)
         {
            return this.m_ClipFillType == PolyFillType.EVEN_ODD;
         }
         return this.m_SubjFillType == PolyFillType.EVEN_ODD;
      }
      
      private function isContributing(param1:TEdge) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.polyType == PolyType.SUBJECT)
         {
            _loc2_ = this.m_SubjFillType;
            _loc3_ = this.m_ClipFillType;
         }
         else
         {
            _loc2_ = this.m_ClipFillType;
            _loc3_ = this.m_SubjFillType;
         }
         switch(_loc2_)
         {
            case PolyFillType.EVEN_ODD:
            case PolyFillType.NON_ZERO:
               if(abs(param1.windCnt) != 1)
               {
                  return false;
               }
               break;
            case PolyFillType.POSITIVE:
               if(param1.windCnt != 1)
               {
                  return false;
               }
               break;
            default:
               if(param1.windCnt != -1)
               {
                  return false;
               }
         }
         switch(this.m_ClipType)
         {
            case ClipType.INTERSECTION:
               switch(_loc3_)
               {
                  case PolyFillType.EVEN_ODD:
                  case PolyFillType.NON_ZERO:
                     return param1.windCnt2 != 0;
                  case PolyFillType.POSITIVE:
                     return param1.windCnt2 > 0;
                  default:
                     return param1.windCnt2 < 0;
               }
               break;
            case ClipType.UNION:
               switch(_loc3_)
               {
                  case PolyFillType.EVEN_ODD:
                  case PolyFillType.NON_ZERO:
                     return param1.windCnt2 == 0;
                  case PolyFillType.POSITIVE:
                     return param1.windCnt2 <= 0;
                  default:
                     return param1.windCnt2 >= 0;
               }
               break;
            case ClipType.DIFFERENCE:
               if(param1.polyType == PolyType.SUBJECT)
               {
                  switch(_loc3_)
                  {
                     case PolyFillType.EVEN_ODD:
                     case PolyFillType.NON_ZERO:
                        return param1.windCnt2 == 0;
                     case PolyFillType.POSITIVE:
                        return param1.windCnt2 <= 0;
                     default:
                        return param1.windCnt2 >= 0;
                  }
               }
               else
               {
                  switch(_loc3_)
                  {
                     case PolyFillType.EVEN_ODD:
                     case PolyFillType.NON_ZERO:
                        return param1.windCnt2 != 0;
                     case PolyFillType.POSITIVE:
                        return param1.windCnt2 > 0;
                     default:
                        return param1.windCnt2 < 0;
                  }
               }
               break;
            default:
               return true;
         }
      }
      
      private function setWindingCount(param1:TEdge) : void
      {
         var _loc2_:TEdge = param1.prevInAEL;
         while(_loc2_ != null && _loc2_.polyType != param1.polyType)
         {
            _loc2_ = _loc2_.prevInAEL;
         }
         if(_loc2_ == null)
         {
            param1.windCnt = param1.windDelta;
            param1.windCnt2 = 0;
            _loc2_ = this.m_ActiveEdges;
         }
         else if(this.isEvenOddFillType(param1))
         {
            param1.windCnt = 1;
            param1.windCnt2 = _loc2_.windCnt2;
            _loc2_ = _loc2_.nextInAEL;
         }
         else
         {
            if(_loc2_.windCnt * _loc2_.windDelta < 0)
            {
               if(abs(_loc2_.windCnt) > 1)
               {
                  if(_loc2_.windDelta * param1.windDelta < 0)
                  {
                     param1.windCnt = _loc2_.windCnt;
                  }
                  else
                  {
                     param1.windCnt = _loc2_.windCnt + param1.windDelta;
                  }
               }
               else
               {
                  param1.windCnt = _loc2_.windCnt + _loc2_.windDelta + param1.windDelta;
               }
            }
            else if(abs(_loc2_.windCnt) > 1 && _loc2_.windDelta * param1.windDelta < 0)
            {
               param1.windCnt = _loc2_.windCnt;
            }
            else if(_loc2_.windCnt + param1.windDelta == 0)
            {
               param1.windCnt = _loc2_.windCnt;
            }
            else
            {
               param1.windCnt = _loc2_.windCnt + param1.windDelta;
            }
            param1.windCnt2 = _loc2_.windCnt2;
            _loc2_ = _loc2_.nextInAEL;
         }
         if(this.isEvenOddAltFillType(param1))
         {
            while(_loc2_ != param1)
            {
               param1.windCnt2 = param1.windCnt2 == 0 ? 1 : 0;
               _loc2_ = _loc2_.nextInAEL;
            }
         }
         else
         {
            while(_loc2_ != param1)
            {
               param1.windCnt2 += _loc2_.windDelta;
               _loc2_ = _loc2_.nextInAEL;
            }
         }
      }
      
      private function addEdgeToSEL(param1:TEdge) : void
      {
         if(this.m_SortedEdges == null)
         {
            this.m_SortedEdges = param1;
            param1.prevInSEL = null;
            param1.nextInSEL = null;
         }
         else
         {
            param1.nextInSEL = this.m_SortedEdges;
            param1.prevInSEL = null;
            this.m_SortedEdges.prevInSEL = param1;
            this.m_SortedEdges = param1;
         }
      }
      
      private function copyAELToSEL() : void
      {
         var _loc1_:TEdge = this.m_ActiveEdges;
         this.m_SortedEdges = _loc1_;
         if(this.m_ActiveEdges == null)
         {
            return;
         }
         this.m_SortedEdges.prevInSEL = null;
         _loc1_ = _loc1_.nextInAEL;
         while(_loc1_ != null)
         {
            _loc1_.prevInSEL = _loc1_.prevInAEL;
            _loc1_.prevInSEL.nextInSEL = _loc1_;
            _loc1_.nextInSEL = null;
            _loc1_ = _loc1_.nextInAEL;
         }
      }
      
      private function swapPositionsInAEL(param1:TEdge, param2:TEdge) : void
      {
         var _loc3_:TEdge = null;
         var _loc4_:TEdge = null;
         if(param1.nextInAEL == null && param1.prevInAEL == null)
         {
            return;
         }
         if(param2.nextInAEL == null && param2.prevInAEL == null)
         {
            return;
         }
         if(param1.nextInAEL == param2)
         {
            _loc3_ = param2.nextInAEL;
            if(_loc3_ != null)
            {
               _loc3_.prevInAEL = param1;
            }
            _loc4_ = param1.prevInAEL;
            if(_loc4_ != null)
            {
               _loc4_.nextInAEL = param2;
            }
            param2.prevInAEL = _loc4_;
            param2.nextInAEL = param1;
            param1.prevInAEL = param2;
            param1.nextInAEL = _loc3_;
         }
         else if(param2.nextInAEL == param1)
         {
            _loc3_ = param1.nextInAEL;
            if(_loc3_ != null)
            {
               _loc3_.prevInAEL = param2;
            }
            _loc4_ = param2.prevInAEL;
            if(_loc4_ != null)
            {
               _loc4_.nextInAEL = param1;
            }
            param1.prevInAEL = _loc4_;
            param1.nextInAEL = param2;
            param2.prevInAEL = param1;
            param2.nextInAEL = _loc3_;
         }
         else
         {
            _loc3_ = param1.nextInAEL;
            _loc4_ = param1.prevInAEL;
            param1.nextInAEL = param2.nextInAEL;
            if(param1.nextInAEL != null)
            {
               param1.nextInAEL.prevInAEL = param1;
            }
            param1.prevInAEL = param2.prevInAEL;
            if(param1.prevInAEL != null)
            {
               param1.prevInAEL.nextInAEL = param1;
            }
            param2.nextInAEL = _loc3_;
            if(param2.nextInAEL != null)
            {
               param2.nextInAEL.prevInAEL = param2;
            }
            param2.prevInAEL = _loc4_;
            if(param2.prevInAEL != null)
            {
               param2.prevInAEL.nextInAEL = param2;
            }
         }
         if(param1.prevInAEL == null)
         {
            this.m_ActiveEdges = param1;
         }
         else if(param2.prevInAEL == null)
         {
            this.m_ActiveEdges = param2;
         }
      }
      
      private function swapPositionsInSEL(param1:TEdge, param2:TEdge) : void
      {
         var _loc3_:TEdge = null;
         var _loc4_:TEdge = null;
         if(param1.nextInSEL == null && param1.prevInSEL == null)
         {
            return;
         }
         if(param2.nextInSEL == null && param2.prevInSEL == null)
         {
            return;
         }
         if(param1.nextInSEL == param2)
         {
            _loc3_ = param2.nextInSEL;
            if(_loc3_ != null)
            {
               _loc3_.prevInSEL = param1;
            }
            _loc4_ = param1.prevInSEL;
            if(_loc4_ != null)
            {
               _loc4_.nextInSEL = param2;
            }
            param2.prevInSEL = _loc4_;
            param2.nextInSEL = param1;
            param1.prevInSEL = param2;
            param1.nextInSEL = _loc3_;
         }
         else if(param2.nextInSEL == param1)
         {
            _loc3_ = param1.nextInSEL;
            if(_loc3_ != null)
            {
               _loc3_.prevInSEL = param2;
            }
            _loc4_ = param2.prevInSEL;
            if(_loc4_ != null)
            {
               _loc4_.nextInSEL = param1;
            }
            param1.prevInSEL = _loc4_;
            param1.nextInSEL = param2;
            param2.prevInSEL = param1;
            param2.nextInSEL = _loc3_;
         }
         else
         {
            _loc3_ = param1.nextInSEL;
            _loc4_ = param1.prevInSEL;
            param1.nextInSEL = param2.nextInSEL;
            if(param1.nextInSEL != null)
            {
               param1.nextInSEL.prevInSEL = param1;
            }
            param1.prevInSEL = param2.prevInSEL;
            if(param1.prevInSEL != null)
            {
               param1.prevInSEL.nextInSEL = param1;
            }
            param2.nextInSEL = _loc3_;
            if(param2.nextInSEL != null)
            {
               param2.nextInSEL.prevInSEL = param2;
            }
            param2.prevInSEL = _loc4_;
            if(param2.prevInSEL != null)
            {
               param2.prevInSEL.nextInSEL = param2;
            }
         }
         if(param1.prevInSEL == null)
         {
            this.m_SortedEdges = param1;
         }
         else if(param2.prevInSEL == null)
         {
            this.m_SortedEdges = param2;
         }
      }
      
      private function addLocalMaxPoly(param1:TEdge, param2:TEdge, param3:IntPoint) : void
      {
         this.addOutPt(param1,param3);
         if(param1.outIdx == param2.outIdx)
         {
            param1.outIdx = -1;
            param2.outIdx = -1;
         }
         else if(param1.outIdx < param2.outIdx)
         {
            this.appendPolygon(param1,param2);
         }
         else
         {
            this.appendPolygon(param2,param1);
         }
      }
      
      private function addLocalMinPoly(param1:TEdge, param2:TEdge, param3:IntPoint) : void
      {
         var _loc4_:TEdge = null;
         var _loc5_:TEdge = null;
         if(param2.dx == horizontal || param1.dx > param2.dx)
         {
            this.addOutPt(param1,param3);
            param2.outIdx = param1.outIdx;
            param1.side = EdgeSide.LEFT;
            param2.side = EdgeSide.RIGHT;
            _loc4_ = param1;
            if(_loc4_.prevInAEL == param2)
            {
               _loc5_ = param2.prevInAEL;
            }
            else
            {
               _loc5_ = _loc4_.prevInAEL;
            }
         }
         else
         {
            this.addOutPt(param2,param3);
            param1.outIdx = param2.outIdx;
            param1.side = EdgeSide.RIGHT;
            param2.side = EdgeSide.LEFT;
            _loc4_ = param2;
            if(_loc4_.prevInAEL == param1)
            {
               _loc5_ = param1.prevInAEL;
            }
            else
            {
               _loc5_ = _loc4_.prevInAEL;
            }
         }
         if(_loc5_ != null && _loc5_.outIdx >= 0 && topX(_loc5_,param3.Y) == topX(_loc4_,param3.Y) && slopesEqual(_loc4_,_loc5_,m_UseFullRange))
         {
            this.addJoin(_loc4_,_loc5_,-1,-1);
         }
      }
      
      private function createOutRec() : OutRec
      {
         var _loc1_:OutRec = new OutRec();
         _loc1_.idx = -1;
         _loc1_.isHole = false;
         _loc1_.firstLeft = null;
         _loc1_.appendLink = null;
         _loc1_.pts = null;
         _loc1_.bottomPt = null;
         _loc1_.bottomFlag = null;
         _loc1_.sides = EdgeSide.NEITHER;
         return _loc1_;
      }
      
      private function addOutPt(param1:TEdge, param2:IntPoint) : void
      {
         var _loc4_:OutRec = null;
         var _loc5_:OutPt = null;
         var _loc6_:OutPt = null;
         var _loc7_:OutPt = null;
         var _loc3_:Boolean = param1.side == EdgeSide.LEFT;
         if(param1.outIdx < 0)
         {
            _loc4_ = this.createOutRec();
            this.m_PolyOuts.push(_loc4_);
            _loc4_.idx = this.m_PolyOuts.length - 1;
            param1.outIdx = _loc4_.idx;
            _loc5_ = new OutPt();
            _loc4_.pts = _loc5_;
            _loc4_.bottomPt = _loc5_;
            _loc5_.pt = param2;
            _loc5_.idx = _loc4_.idx;
            _loc5_.next = _loc5_;
            _loc5_.prev = _loc5_;
            this.setHoleState(param1,_loc4_);
         }
         else
         {
            _loc4_ = this.m_PolyOuts[param1.outIdx];
            _loc5_ = _loc4_.pts;
            if(_loc3_ && pointsEqual(param2,_loc5_.pt) || !_loc3_ && pointsEqual(param2,_loc5_.prev.pt))
            {
               return;
            }
            if((param1.side | _loc4_.sides) != _loc4_.sides)
            {
               if(_loc4_.sides == EdgeSide.NEITHER && param2.Y == _loc5_.pt.Y)
               {
                  if(_loc3_)
                  {
                     if(param2.X == _loc5_.pt.X + 1)
                     {
                        return;
                     }
                  }
                  else if(param2.X == _loc5_.pt.X - 1)
                  {
                     return;
                  }
               }
               _loc4_.sides |= param1.side;
               if(_loc4_.sides == EdgeSide.BOTH)
               {
                  if(_loc3_)
                  {
                     _loc7_ = _loc4_.pts;
                     _loc6_ = _loc7_.next;
                     if(_loc7_.pt.Y != _loc6_.pt.Y && _loc7_.pt.Y != param2.Y && (_loc7_.pt.X - param2.X) / (_loc7_.pt.Y - param2.Y) < (_loc7_.pt.X - _loc6_.pt.X) / (_loc7_.pt.Y - _loc6_.pt.Y))
                     {
                        _loc4_.bottomFlag = _loc7_;
                     }
                  }
                  else
                  {
                     _loc7_ = _loc4_.pts.prev;
                     _loc6_ = _loc7_.next;
                     if(_loc7_.pt.Y != _loc6_.pt.Y && _loc7_.pt.Y != param2.Y && (_loc7_.pt.X - param2.X) / (_loc7_.pt.Y - param2.Y) > (_loc7_.pt.X - _loc6_.pt.X) / (_loc7_.pt.Y - _loc6_.pt.Y))
                     {
                        _loc4_.bottomFlag = _loc7_;
                     }
                  }
               }
            }
            _loc6_ = new OutPt();
            _loc6_.pt = param2;
            _loc6_.idx = _loc4_.idx;
            if(_loc6_.pt.Y == _loc4_.bottomPt.pt.Y && _loc6_.pt.X < _loc4_.bottomPt.pt.X)
            {
               _loc4_.bottomPt = _loc6_;
            }
            _loc6_.next = _loc5_;
            _loc6_.prev = _loc5_.prev;
            _loc6_.prev.next = _loc6_;
            _loc5_.prev = _loc6_;
            if(_loc3_)
            {
               _loc4_.pts = _loc6_;
            }
         }
      }
      
      private function getOverlapSegment(param1:Segment, param2:Segment, param3:Segment) : Boolean
      {
         if(param1.pt1.Y == param1.pt2.Y || abs((param1.pt1.X - param1.pt2.X) / (param1.pt1.Y - param1.pt2.Y)) > 1)
         {
            if(param1.pt1.X > param1.pt2.X)
            {
               param1.swapPoints();
            }
            if(param2.pt1.X > param2.pt2.X)
            {
               param2.swapPoints();
            }
            if(param1.pt1.X > param2.pt1.X)
            {
               param3.pt1 = param1.pt1;
            }
            else
            {
               param3.pt1 = param2.pt1;
            }
            if(param1.pt2.X < param2.pt2.X)
            {
               param3.pt2 = param1.pt2;
            }
            else
            {
               param3.pt2 = param2.pt2;
            }
            return param3.pt1.X < param3.pt2.X;
         }
         if(param1.pt1.Y < param1.pt2.Y)
         {
            param1.swapPoints();
         }
         if(param2.pt1.Y < param2.pt2.Y)
         {
            param2.swapPoints();
         }
         if(param1.pt1.Y < param2.pt1.Y)
         {
            param3.pt1 = param1.pt1;
         }
         else
         {
            param3.pt1 = param2.pt1;
         }
         if(param1.pt2.Y > param2.pt2.Y)
         {
            param3.pt2 = param1.pt2;
         }
         else
         {
            param3.pt2 = param2.pt2;
         }
         return param3.pt1.Y > param3.pt2.Y;
      }
      
      private function findSegment(param1:OutPtRef, param2:Segment) : Boolean
      {
         var _loc8_:Segment = null;
         var _loc3_:OutPt = param1.outPt;
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc4_:OutPt = _loc3_;
         var _loc5_:IntPoint = param2.pt1;
         var _loc6_:IntPoint = param2.pt2;
         var _loc7_:Segment = new Segment(_loc5_,_loc6_);
         while(true)
         {
            _loc8_ = new Segment(_loc3_.pt,_loc3_.prev.pt);
            if(slopesEqual4(_loc5_,_loc6_,_loc3_.pt,_loc3_.prev.pt,true) && slopesEqual3(_loc5_,_loc6_,_loc3_.pt,true) && this.getOverlapSegment(_loc7_,_loc8_,param2))
            {
               break;
            }
            _loc3_ = _loc3_.next;
            param1.outPt = _loc3_;
            if(_loc3_ == _loc4_)
            {
               return false;
            }
         }
         return true;
      }
      
      internal function pt3IsBetweenPt1AndPt2(param1:IntPoint, param2:IntPoint, param3:IntPoint) : Boolean
      {
         if(pointsEqual(param1,param3) || pointsEqual(param2,param3))
         {
            return true;
         }
         if(param1.X != param2.X)
         {
            return param1.X < param3.X == param3.X < param2.X;
         }
         return param1.Y < param3.Y == param3.Y < param2.Y;
      }
      
      private function insertPolyPtBetween(param1:OutPt, param2:OutPt, param3:IntPoint) : OutPt
      {
         var _loc4_:OutPt = new OutPt();
         _loc4_.pt = param3;
         if(param2 == param1.next)
         {
            param1.next = _loc4_;
            param2.prev = _loc4_;
            _loc4_.next = param2;
            _loc4_.prev = param1;
         }
         else
         {
            param2.next = _loc4_;
            param1.prev = _loc4_;
            _loc4_.next = param1;
            _loc4_.prev = param2;
         }
         return _loc4_;
      }
      
      private function setHoleState(param1:TEdge, param2:OutRec) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:TEdge = param1.prevInAEL;
         while(_loc4_ != null)
         {
            if(_loc4_.outIdx >= 0)
            {
               _loc3_ = !_loc3_;
               if(param2.firstLeft == null)
               {
                  param2.firstLeft = this.m_PolyOuts[_loc4_.outIdx];
               }
            }
            _loc4_ = _loc4_.prevInAEL;
         }
         if(_loc3_)
         {
            param2.isHole = true;
         }
      }
      
      private function getDx(param1:IntPoint, param2:IntPoint) : Number
      {
         if(param1.Y == param2.Y)
         {
            return horizontal;
         }
         return Number(param2.X - param1.X) / Number(param2.Y - param1.Y);
      }
      
      private function firstIsBottomPt(param1:OutPt, param2:OutPt) : Boolean
      {
         var _loc3_:OutPt = param1.prev;
         while(pointsEqual(_loc3_.pt,param1.pt) && _loc3_ != param1)
         {
            _loc3_ = _loc3_.prev;
         }
         var _loc4_:Number = Math.abs(this.getDx(param1.pt,_loc3_.pt));
         _loc3_ = param1.next;
         while(pointsEqual(_loc3_.pt,param1.pt) && _loc3_ != param1)
         {
            _loc3_ = _loc3_.next;
         }
         var _loc5_:Number = Math.abs(this.getDx(param1.pt,_loc3_.pt));
         _loc3_ = param2.prev;
         while(pointsEqual(_loc3_.pt,param2.pt) && _loc3_ != param2)
         {
            _loc3_ = _loc3_.prev;
         }
         var _loc6_:Number = Math.abs(this.getDx(param2.pt,_loc3_.pt));
         _loc3_ = param2.next;
         while(pointsEqual(_loc3_.pt,param2.pt) && _loc3_ != param2)
         {
            _loc3_ = _loc3_.next;
         }
         var _loc7_:Number = Math.abs(this.getDx(param2.pt,_loc3_.pt));
         return _loc4_ >= _loc6_ && _loc4_ >= _loc7_ || _loc5_ >= _loc6_ && _loc5_ >= _loc7_;
      }
      
      private function getBottomPt(param1:OutPt) : OutPt
      {
         var _loc2_:OutPt = null;
         var _loc3_:OutPt = param1.next;
         while(_loc3_ != param1)
         {
            if(_loc3_.pt.Y > param1.pt.Y)
            {
               param1 = _loc3_;
               _loc2_ = null;
            }
            else if(_loc3_.pt.Y == param1.pt.Y && _loc3_.pt.X <= param1.pt.X)
            {
               if(_loc3_.pt.X < param1.pt.X)
               {
                  _loc2_ = null;
                  param1 = _loc3_;
               }
               else if(_loc3_.next != param1 && _loc3_.prev != param1)
               {
                  _loc2_ = _loc3_;
               }
            }
            _loc3_ = _loc3_.next;
         }
         if(_loc2_ != null)
         {
            while(_loc2_ != _loc3_)
            {
               if(!this.firstIsBottomPt(_loc3_,_loc2_))
               {
                  param1 = _loc2_;
               }
               _loc2_ = _loc2_.next;
               while(!pointsEqual(_loc2_.pt,param1.pt))
               {
                  _loc2_ = _loc2_.next;
               }
            }
         }
         return param1;
      }
      
      private function getLowermostRec(param1:OutRec, param2:OutRec) : OutRec
      {
         var _loc3_:OutPt = param1.bottomPt;
         var _loc4_:OutPt = param2.bottomPt;
         if(_loc3_.pt.Y > _loc4_.pt.Y)
         {
            return param1;
         }
         if(_loc3_.pt.Y < _loc4_.pt.Y)
         {
            return param2;
         }
         if(_loc3_.pt.X < _loc4_.pt.X)
         {
            return param1;
         }
         if(_loc3_.pt.X > _loc4_.pt.X)
         {
            return param2;
         }
         if(_loc3_.next == _loc3_)
         {
            return param2;
         }
         if(_loc4_.next == _loc4_)
         {
            return param1;
         }
         if(this.firstIsBottomPt(_loc3_,_loc4_))
         {
            return param1;
         }
         return param2;
      }
      
      private function param1RightOfParam2(param1:OutRec, param2:OutRec) : Boolean
      {
         while(true)
         {
            param1 = param1.firstLeft;
            if(param1 == param2)
            {
               break;
            }
            if(param1 == null)
            {
               return false;
            }
         }
         return true;
      }
      
      private function appendPolygon(param1:TEdge, param2:TEdge) : void
      {
         var _loc5_:OutRec = null;
         var _loc10_:int = 0;
         var _loc3_:OutRec = this.m_PolyOuts[param1.outIdx];
         var _loc4_:OutRec = this.m_PolyOuts[param2.outIdx];
         if(this.param1RightOfParam2(_loc3_,_loc4_))
         {
            _loc5_ = _loc4_;
         }
         else if(this.param1RightOfParam2(_loc4_,_loc3_))
         {
            _loc5_ = _loc3_;
         }
         else
         {
            _loc5_ = this.getLowermostRec(_loc3_,_loc4_);
         }
         var _loc6_:OutPt = _loc3_.pts;
         var _loc7_:OutPt = _loc6_.prev;
         var _loc8_:OutPt = _loc4_.pts;
         var _loc9_:OutPt = _loc8_.prev;
         if(param1.side == EdgeSide.LEFT)
         {
            if(param2.side == EdgeSide.LEFT)
            {
               this.reversePolyPtLinks(_loc8_);
               _loc8_.next = _loc6_;
               _loc6_.prev = _loc8_;
               _loc7_.next = _loc9_;
               _loc9_.prev = _loc7_;
               _loc3_.pts = _loc9_;
            }
            else
            {
               _loc9_.next = _loc6_;
               _loc6_.prev = _loc9_;
               _loc8_.prev = _loc7_;
               _loc7_.next = _loc8_;
               _loc3_.pts = _loc8_;
            }
            _loc10_ = EdgeSide.LEFT;
         }
         else
         {
            if(param2.side == EdgeSide.RIGHT)
            {
               this.reversePolyPtLinks(_loc8_);
               _loc7_.next = _loc9_;
               _loc9_.prev = _loc7_;
               _loc8_.next = _loc6_;
               _loc6_.prev = _loc8_;
            }
            else
            {
               _loc7_.next = _loc8_;
               _loc8_.prev = _loc7_;
               _loc6_.prev = _loc9_;
               _loc9_.next = _loc6_;
            }
            _loc10_ = EdgeSide.RIGHT;
         }
         if(_loc5_ == _loc4_)
         {
            _loc3_.bottomPt = _loc4_.bottomPt;
            _loc3_.bottomPt.idx = _loc3_.idx;
            if(_loc4_.firstLeft != _loc3_)
            {
               _loc3_.firstLeft = _loc4_.firstLeft;
            }
            _loc3_.isHole = _loc4_.isHole;
         }
         _loc4_.pts = null;
         _loc4_.bottomPt = null;
         _loc4_.appendLink = _loc3_;
         var _loc11_:int = param1.outIdx;
         var _loc12_:int = param2.outIdx;
         param1.outIdx = -1;
         param2.outIdx = -1;
         var _loc13_:TEdge = this.m_ActiveEdges;
         while(_loc13_ != null)
         {
            if(_loc13_.outIdx == _loc12_)
            {
               _loc13_.outIdx = _loc11_;
               _loc13_.side = _loc10_;
               break;
            }
            _loc13_ = _loc13_.nextInAEL;
         }
         var _loc14_:int = 0;
         while(_loc14_ < this.m_Joins.length)
         {
            if(this.m_Joins[_loc14_].poly1Idx == _loc12_)
            {
               this.m_Joins[_loc14_].poly1Idx = _loc11_;
            }
            if(this.m_Joins[_loc14_].poly2Idx == _loc12_)
            {
               this.m_Joins[_loc14_].poly2Idx = _loc11_;
            }
            _loc14_++;
         }
         _loc14_ = 0;
         while(_loc14_ < this.m_HorizJoins.length)
         {
            if(this.m_HorizJoins[_loc14_].savedIdx == _loc12_)
            {
               this.m_HorizJoins[_loc14_].savedIdx = _loc11_;
            }
            _loc14_++;
         }
      }
      
      private function reversePolyPtLinks(param1:OutPt) : void
      {
         var _loc2_:OutPt = null;
         var _loc3_:OutPt = null;
         _loc2_ = param1;
         do
         {
            _loc3_ = _loc2_.next;
            _loc2_.next = _loc2_.prev;
            _loc2_.prev = _loc3_;
            _loc2_ = _loc3_;
         }
         while(_loc2_ != param1);
      }
      
      private function doEdge1(param1:TEdge, param2:TEdge, param3:IntPoint) : void
      {
         this.addOutPt(param1,param3);
         swapSides(param1,param2);
         swapPolyIndexes(param1,param2);
      }
      
      private function doEdge2(param1:TEdge, param2:TEdge, param3:IntPoint) : void
      {
         this.addOutPt(param2,param3);
         swapSides(param1,param2);
         swapPolyIndexes(param1,param2);
      }
      
      private function doBothEdges(param1:TEdge, param2:TEdge, param3:IntPoint) : void
      {
         this.addOutPt(param1,param3);
         this.addOutPt(param2,param3);
         swapSides(param1,param2);
         swapPolyIndexes(param1,param2);
      }
      
      private function intersectEdges(param1:TEdge, param2:TEdge, param3:IntPoint, param4:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc5_:Boolean = (Protects.LEFT & param4) == 0 && param1.nextInLML == null && param1.xtop == param3.X && param1.ytop == param3.Y;
         var _loc6_:Boolean = (Protects.RIGHT & param4) == 0 && param2.nextInLML == null && param2.xtop == param3.X && param2.ytop == param3.Y;
         var _loc7_:Boolean = param1.outIdx >= 0;
         var _loc8_:Boolean = param2.outIdx >= 0;
         if(param1.polyType == param2.polyType)
         {
            if(this.isEvenOddFillType(param1))
            {
               _loc15_ = param1.windCnt;
               param1.windCnt = param2.windCnt;
               param2.windCnt = _loc15_;
            }
            else
            {
               if(param1.windCnt + param2.windDelta == 0)
               {
                  param1.windCnt = -param1.windCnt;
               }
               else
               {
                  param1.windCnt += param2.windDelta;
               }
               if(param2.windCnt - param1.windDelta == 0)
               {
                  param2.windCnt = -param2.windCnt;
               }
               else
               {
                  param2.windCnt -= param1.windDelta;
               }
            }
         }
         else
         {
            if(!this.isEvenOddFillType(param2))
            {
               param1.windCnt2 += param2.windDelta;
            }
            else
            {
               param1.windCnt2 = param1.windCnt2 == 0 ? 1 : 0;
            }
            if(!this.isEvenOddFillType(param1))
            {
               param2.windCnt2 -= param1.windDelta;
            }
            else
            {
               param2.windCnt2 = param2.windCnt2 == 0 ? 1 : 0;
            }
         }
         if(param1.polyType == PolyType.SUBJECT)
         {
            _loc9_ = this.m_SubjFillType;
            _loc11_ = this.m_ClipFillType;
         }
         else
         {
            _loc9_ = this.m_ClipFillType;
            _loc11_ = this.m_SubjFillType;
         }
         if(param2.polyType == PolyType.SUBJECT)
         {
            _loc10_ = this.m_SubjFillType;
            _loc12_ = this.m_ClipFillType;
         }
         else
         {
            _loc10_ = this.m_ClipFillType;
            _loc12_ = this.m_SubjFillType;
         }
         switch(_loc9_)
         {
            case PolyFillType.POSITIVE:
               _loc13_ = param1.windCnt;
               break;
            case PolyFillType.NEGATIVE:
               _loc13_ = -param1.windCnt;
               break;
            default:
               _loc13_ = abs(param1.windCnt);
         }
         switch(_loc10_)
         {
            case PolyFillType.POSITIVE:
               _loc14_ = param2.windCnt;
               break;
            case PolyFillType.NEGATIVE:
               _loc14_ = -param2.windCnt;
               break;
            default:
               _loc14_ = abs(param2.windCnt);
         }
         if(_loc7_ && _loc8_)
         {
            if(_loc5_ || _loc6_ || _loc13_ != 0 && _loc13_ != 1 || _loc14_ != 0 && _loc14_ != 1 || param1.polyType != param2.polyType && this.m_ClipType != ClipType.XOR)
            {
               this.addLocalMaxPoly(param1,param2,param3);
            }
            else
            {
               this.doBothEdges(param1,param2,param3);
            }
         }
         else if(_loc7_)
         {
            if((_loc14_ == 0 || _loc14_ == 1) && (this.m_ClipType != ClipType.INTERSECTION || param2.polyType == PolyType.SUBJECT || param2.windCnt2 != 0))
            {
               this.doEdge1(param1,param2,param3);
            }
         }
         else if(_loc8_)
         {
            if((_loc13_ == 0 || _loc13_ == 1) && (this.m_ClipType != ClipType.INTERSECTION || param1.polyType == PolyType.SUBJECT || param1.windCnt2 != 0))
            {
               this.doEdge2(param1,param2,param3);
            }
         }
         else if((_loc13_ == 0 || _loc13_ == 1) && (_loc14_ == 0 || _loc14_ == 1) && !_loc5_ && !_loc6_)
         {
            switch(_loc11_)
            {
               case PolyFillType.POSITIVE:
                  _loc16_ = param1.windCnt2;
                  break;
               case PolyFillType.NEGATIVE:
                  _loc16_ = -param1.windCnt2;
                  break;
               default:
                  _loc16_ = abs(param1.windCnt2);
            }
            switch(_loc12_)
            {
               case PolyFillType.POSITIVE:
                  _loc17_ = param2.windCnt2;
                  break;
               case PolyFillType.NEGATIVE:
                  _loc17_ = -param2.windCnt2;
                  break;
               default:
                  _loc17_ = abs(param2.windCnt2);
            }
            if(param1.polyType != param2.polyType)
            {
               this.addLocalMinPoly(param1,param2,param3);
            }
            else if(_loc13_ == 1 && _loc14_ == 1)
            {
               switch(this.m_ClipType)
               {
                  case ClipType.INTERSECTION:
                     if(_loc16_ > 0 && _loc17_ > 0)
                     {
                        this.addLocalMinPoly(param1,param2,param3);
                     }
                     break;
                  case ClipType.UNION:
                     if(_loc16_ <= 0 && _loc17_ <= 0)
                     {
                        this.addLocalMinPoly(param1,param2,param3);
                     }
                     break;
                  case ClipType.DIFFERENCE:
                     if(param1.polyType == PolyType.CLIP && _loc16_ > 0 && _loc17_ > 0 || param1.polyType == PolyType.SUBJECT && _loc16_ <= 0 && _loc17_ <= 0)
                     {
                        this.addLocalMinPoly(param1,param2,param3);
                     }
                     break;
                  case ClipType.XOR:
                     this.addLocalMinPoly(param1,param2,param3);
               }
            }
            else
            {
               swapSides(param1,param2);
            }
         }
         if(_loc5_ != _loc6_ && (_loc5_ && param1.outIdx >= 0 || _loc6_ && param2.outIdx >= 0))
         {
            swapSides(param1,param2);
            swapPolyIndexes(param1,param2);
         }
         if(_loc5_)
         {
            this.deleteFromAEL(param1);
         }
         if(_loc6_)
         {
            this.deleteFromAEL(param2);
         }
      }
      
      private function deleteFromAEL(param1:TEdge) : void
      {
         var _loc2_:TEdge = param1.prevInAEL;
         var _loc3_:TEdge = param1.nextInAEL;
         if(_loc2_ == null && _loc3_ == null && param1 != this.m_ActiveEdges)
         {
            return;
         }
         if(_loc2_ != null)
         {
            _loc2_.nextInAEL = _loc3_;
         }
         else
         {
            this.m_ActiveEdges = _loc3_;
         }
         if(_loc3_ != null)
         {
            _loc3_.prevInAEL = _loc2_;
         }
         param1.nextInAEL = null;
         param1.prevInAEL = null;
      }
      
      private function deleteFromSEL(param1:TEdge) : void
      {
         var _loc2_:TEdge = param1.prevInSEL;
         var _loc3_:TEdge = param1.nextInSEL;
         if(_loc2_ == null && _loc3_ == null && param1 != this.m_SortedEdges)
         {
            return;
         }
         if(_loc2_ != null)
         {
            _loc2_.nextInSEL = _loc3_;
         }
         else
         {
            this.m_SortedEdges = _loc3_;
         }
         if(_loc3_ != null)
         {
            _loc3_.prevInSEL = _loc2_;
         }
         param1.nextInSEL = null;
         param1.prevInSEL = null;
      }
      
      private function updateEdgeIntoAEL(param1:TEdge) : TEdge
      {
         if(param1.nextInLML == null)
         {
            throw new ClipperException("UpdateEdgeIntoAEL: invalid call");
         }
         var _loc2_:TEdge = param1.prevInAEL;
         var _loc3_:TEdge = param1.nextInAEL;
         param1.nextInLML.outIdx = param1.outIdx;
         if(_loc2_ != null)
         {
            _loc2_.nextInAEL = param1.nextInLML;
         }
         else
         {
            this.m_ActiveEdges = param1.nextInLML;
         }
         if(_loc3_ != null)
         {
            _loc3_.prevInAEL = param1.nextInLML;
         }
         param1.nextInLML.side = param1.side;
         param1.nextInLML.windDelta = param1.windDelta;
         param1.nextInLML.windCnt = param1.windCnt;
         param1.nextInLML.windCnt2 = param1.windCnt2;
         param1 = param1.nextInLML;
         param1.prevInAEL = _loc2_;
         param1.nextInAEL = _loc3_;
         if(param1.dx != horizontal)
         {
            this.insertScanbeam(param1.ytop);
         }
         return param1;
      }
      
      private function processHorizontals() : void
      {
         var _loc1_:TEdge = this.m_SortedEdges;
         while(_loc1_ != null)
         {
            this.deleteFromSEL(_loc1_);
            this.processHorizontal(_loc1_);
            _loc1_ = this.m_SortedEdges;
         }
      }
      
      private function processHorizontal(param1:TEdge) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:TEdge = null;
         var _loc7_:TEdge = null;
         if(param1.xcurr < param1.xtop)
         {
            _loc3_ = param1.xcurr;
            _loc4_ = param1.xtop;
            _loc2_ = int(Direction.LEFT_TO_RIGHT);
         }
         else
         {
            _loc3_ = param1.xtop;
            _loc4_ = param1.xcurr;
            _loc2_ = int(Direction.RIGHT_TO_LEFT);
         }
         if(param1.nextInLML != null)
         {
            _loc5_ = null;
         }
         else
         {
            _loc5_ = getMaximaPair(param1);
         }
         var _loc6_:TEdge = getNextInAEL(param1,_loc2_);
         while(_loc6_ != null)
         {
            _loc7_ = getNextInAEL(_loc6_,_loc2_);
            if(_loc5_ != null || _loc2_ == Direction.LEFT_TO_RIGHT && _loc6_.xcurr <= _loc4_ || _loc2_ == Direction.RIGHT_TO_LEFT && _loc6_.xcurr >= _loc3_)
            {
               if(_loc6_.xcurr == param1.xtop && _loc5_ == null)
               {
                  if(slopesEqual(_loc6_,param1.nextInLML,m_UseFullRange))
                  {
                     if(param1.outIdx >= 0 && _loc6_.outIdx >= 0)
                     {
                        this.addJoin(param1.nextInLML,_loc6_,param1.outIdx,-1);
                     }
                     break;
                  }
                  if(_loc6_.dx < param1.nextInLML.dx)
                  {
                     break;
                  }
               }
               if(_loc6_ == _loc5_)
               {
                  if(_loc2_ == Direction.LEFT_TO_RIGHT)
                  {
                     this.intersectEdges(param1,_loc6_,new IntPoint(_loc6_.xcurr,param1.ycurr),0);
                  }
                  else
                  {
                     this.intersectEdges(_loc6_,param1,new IntPoint(_loc6_.xcurr,param1.ycurr),0);
                  }
                  if(_loc5_.outIdx >= 0)
                  {
                     throw new ClipperException("ProcessHorizontal error");
                  }
                  return;
               }
               if(_loc6_.dx == horizontal && !isMinima(_loc6_) && _loc6_.xcurr <= _loc6_.xtop)
               {
                  if(_loc2_ == Direction.LEFT_TO_RIGHT)
                  {
                     this.intersectEdges(param1,_loc6_,new IntPoint(_loc6_.xcurr,param1.ycurr),this.isTopHorz(param1,_loc6_.xcurr) ? int(Protects.LEFT) : int(Protects.BOTH));
                  }
                  else
                  {
                     this.intersectEdges(_loc6_,param1,new IntPoint(_loc6_.xcurr,param1.ycurr),this.isTopHorz(param1,_loc6_.xcurr) ? int(Protects.RIGHT) : int(Protects.BOTH));
                  }
               }
               else if(_loc2_ == Direction.LEFT_TO_RIGHT)
               {
                  this.intersectEdges(param1,_loc6_,new IntPoint(_loc6_.xcurr,param1.ycurr),this.isTopHorz(param1,_loc6_.xcurr) ? int(Protects.LEFT) : int(Protects.BOTH));
               }
               else
               {
                  this.intersectEdges(_loc6_,param1,new IntPoint(_loc6_.xcurr,param1.ycurr),this.isTopHorz(param1,_loc6_.xcurr) ? int(Protects.RIGHT) : int(Protects.BOTH));
               }
               this.swapPositionsInAEL(param1,_loc6_);
            }
            else if(_loc2_ == Direction.LEFT_TO_RIGHT && _loc6_.xcurr > _loc4_ && param1.nextInSEL == null || _loc2_ == Direction.RIGHT_TO_LEFT && _loc6_.xcurr < _loc3_ && param1.nextInSEL == null)
            {
               break;
            }
            _loc6_ = _loc7_;
         }
         if(param1.nextInLML != null)
         {
            if(param1.outIdx >= 0)
            {
               this.addOutPt(param1,new IntPoint(param1.xtop,param1.ytop));
            }
            param1 = this.updateEdgeIntoAEL(param1);
         }
         else
         {
            if(param1.outIdx >= 0)
            {
               this.intersectEdges(param1,_loc5_,new IntPoint(param1.xtop,param1.ycurr),Protects.BOTH);
            }
            this.deleteFromAEL(_loc5_);
            this.deleteFromAEL(param1);
         }
      }
      
      private function isTopHorz(param1:TEdge, param2:Number) : Boolean
      {
         var _loc3_:TEdge = this.m_SortedEdges;
         while(_loc3_ != null)
         {
            if(param2 >= Math.min(_loc3_.xcurr,_loc3_.xtop) && param2 <= Math.max(_loc3_.xcurr,_loc3_.xtop))
            {
               return false;
            }
            _loc3_ = _loc3_.nextInSEL;
         }
         return true;
      }
      
      private function processIntersections(param1:int, param2:int) : Boolean
      {
         var botY:int = param1;
         var topY:int = param2;
         if(this.m_ActiveEdges == null)
         {
            return true;
         }
         try
         {
            this.buildIntersectList(botY,topY);
            if(this.m_IntersectNodes == null)
            {
               return true;
            }
            if(!this.fixupIntersections())
            {
               return false;
            }
            this.processIntersectList();
         }
         catch(e:Error)
         {
            m_SortedEdges = null;
            disposeIntersectNodes();
            throw new ClipperException("ProcessIntersections error");
         }
         return true;
      }
      
      private function buildIntersectList(param1:int, param2:int) : void
      {
         var _loc5_:TEdge = null;
         var _loc6_:IntPoint = null;
         if(this.m_ActiveEdges == null)
         {
            return;
         }
         var _loc3_:TEdge = this.m_ActiveEdges;
         _loc3_.tmpX = topX(_loc3_,param2);
         this.m_SortedEdges = _loc3_;
         this.m_SortedEdges.prevInSEL = null;
         _loc3_ = _loc3_.nextInAEL;
         while(_loc3_ != null)
         {
            _loc3_.prevInSEL = _loc3_.prevInAEL;
            _loc3_.prevInSEL.nextInSEL = _loc3_;
            _loc3_.nextInSEL = null;
            _loc3_.tmpX = topX(_loc3_,param2);
            _loc3_ = _loc3_.nextInAEL;
         }
         var _loc4_:Boolean = true;
         while(_loc4_ && this.m_SortedEdges != null)
         {
            _loc4_ = false;
            _loc3_ = this.m_SortedEdges;
            while(_loc3_.nextInSEL != null)
            {
               _loc5_ = _loc3_.nextInSEL;
               _loc6_ = new IntPoint();
               if(_loc3_.tmpX > _loc5_.tmpX && this.intersectPoint(_loc3_,_loc5_,_loc6_))
               {
                  if(_loc6_.Y > param1)
                  {
                     _loc6_.Y = param1;
                     _loc6_.X = topX(_loc3_,_loc6_.Y);
                  }
                  this.addIntersectNode(_loc3_,_loc5_,_loc6_);
                  this.swapPositionsInSEL(_loc3_,_loc5_);
                  _loc4_ = true;
               }
               else
               {
                  _loc3_ = _loc5_;
               }
            }
            if(_loc3_.prevInSEL == null)
            {
               break;
            }
            _loc3_.prevInSEL.nextInSEL = null;
         }
         this.m_SortedEdges = null;
      }
      
      private function fixupIntersections() : Boolean
      {
         var _loc3_:TEdge = null;
         var _loc4_:TEdge = null;
         if(this.m_IntersectNodes.next == null)
         {
            return true;
         }
         this.copyAELToSEL();
         var _loc1_:IntersectNode = this.m_IntersectNodes;
         var _loc2_:IntersectNode = this.m_IntersectNodes.next;
         while(_loc2_ != null)
         {
            _loc3_ = _loc1_.edge1;
            if(_loc3_.prevInSEL == _loc1_.edge2)
            {
               _loc4_ = _loc3_.prevInSEL;
            }
            else if(_loc3_.nextInSEL == _loc1_.edge2)
            {
               _loc4_ = _loc3_.nextInSEL;
            }
            else
            {
               while(_loc2_ != null)
               {
                  if(_loc2_.edge1.nextInSEL == _loc2_.edge2 || _loc2_.edge1.prevInSEL == _loc2_.edge2)
                  {
                     break;
                  }
                  _loc2_ = _loc2_.next;
               }
               if(_loc2_ == null)
               {
                  return false;
               }
               this.swapIntersectNodes(_loc1_,_loc2_);
               _loc3_ = _loc1_.edge1;
               _loc4_ = _loc1_.edge2;
            }
            this.swapPositionsInSEL(_loc3_,_loc4_);
            _loc1_ = _loc1_.next;
            _loc2_ = _loc1_.next;
         }
         this.m_SortedEdges = null;
         return _loc1_.edge1.prevInSEL == _loc1_.edge2 || _loc1_.edge1.nextInSEL == _loc1_.edge2;
      }
      
      private function processIntersectList() : void
      {
         var _loc1_:IntersectNode = null;
         while(this.m_IntersectNodes != null)
         {
            _loc1_ = this.m_IntersectNodes.next;
            this.intersectEdges(this.m_IntersectNodes.edge1,this.m_IntersectNodes.edge2,this.m_IntersectNodes.pt,Protects.BOTH);
            this.swapPositionsInAEL(this.m_IntersectNodes.edge1,this.m_IntersectNodes.edge2);
            this.m_IntersectNodes = null;
            this.m_IntersectNodes = _loc1_;
         }
      }
      
      private function addIntersectNode(param1:TEdge, param2:TEdge, param3:IntPoint) : void
      {
         var _loc5_:IntersectNode = null;
         var _loc4_:IntersectNode = new IntersectNode();
         _loc4_.edge1 = param1;
         _loc4_.edge2 = param2;
         _loc4_.pt = param3;
         _loc4_.next = null;
         if(this.m_IntersectNodes == null)
         {
            this.m_IntersectNodes = _loc4_;
         }
         else if(this.processParam1BeforeParam2(_loc4_,this.m_IntersectNodes))
         {
            _loc4_.next = this.m_IntersectNodes;
            this.m_IntersectNodes = _loc4_;
         }
         else
         {
            _loc5_ = this.m_IntersectNodes;
            while(_loc5_.next != null && this.processParam1BeforeParam2(_loc5_.next,_loc4_))
            {
               _loc5_ = _loc5_.next;
            }
            _loc4_.next = _loc5_.next;
            _loc5_.next = _loc4_;
         }
      }
      
      private function processParam1BeforeParam2(param1:IntersectNode, param2:IntersectNode) : Boolean
      {
         var _loc3_:Boolean = false;
         if(param1.pt.Y == param2.pt.Y)
         {
            if(param1.edge1 == param2.edge1 || param1.edge2 == param2.edge1)
            {
               _loc3_ = param2.pt.X > param1.pt.X;
               return param2.edge1.dx > 0 ? !_loc3_ : _loc3_;
            }
            if(param1.edge1 == param2.edge2 || param1.edge2 == param2.edge2)
            {
               _loc3_ = param2.pt.X > param1.pt.X;
               return param2.edge2.dx > 0 ? !_loc3_ : _loc3_;
            }
            return param2.pt.X > param1.pt.X;
         }
         return param1.pt.Y > param2.pt.Y;
      }
      
      private function swapIntersectNodes(param1:IntersectNode, param2:IntersectNode) : void
      {
         var _loc3_:TEdge = param1.edge1;
         var _loc4_:TEdge = param1.edge2;
         var _loc5_:IntPoint = param1.pt;
         param1.edge1 = param2.edge1;
         param1.edge2 = param2.edge2;
         param1.pt = param2.pt;
         param2.edge1 = _loc3_;
         param2.edge2 = _loc4_;
         param2.pt = _loc5_;
      }
      
      private function intersectPoint(param1:TEdge, param2:TEdge, param3:IntPoint) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(slopesEqual(param1,param2,m_UseFullRange))
         {
            return false;
         }
         if(param1.dx == 0)
         {
            param3.X = param1.xbot;
            if(param2.dx == horizontal)
            {
               param3.Y = param2.ybot;
            }
            else
            {
               _loc5_ = param2.ybot - param2.xbot / param2.dx;
               param3.Y = round(param3.X / param2.dx + _loc5_);
            }
         }
         else if(param2.dx == 0)
         {
            param3.X = param2.xbot;
            if(param1.dx == horizontal)
            {
               param3.Y = param1.ybot;
            }
            else
            {
               _loc4_ = param1.ybot - param1.xbot / param1.dx;
               param3.Y = round(param3.X / param1.dx + _loc4_);
            }
         }
         else
         {
            _loc4_ = param1.xbot - param1.ybot * param1.dx;
            _loc5_ = param2.xbot - param2.ybot * param2.dx;
            _loc5_ = (_loc5_ - _loc4_) / (param1.dx - param2.dx);
            param3.Y = round(_loc5_);
            param3.X = round(param1.dx * _loc5_ + _loc4_);
         }
         return param3.Y == param1.ytop && param3.Y >= param2.ytop && param1.tmpX > param2.tmpX || param3.Y == param2.ytop && param3.Y >= param1.ytop && param1.tmpX > param2.tmpX || param3.Y > param1.ytop && param3.Y > param2.ytop;
      }
      
      private function disposeIntersectNodes() : void
      {
         var _loc1_:IntersectNode = null;
         while(this.m_IntersectNodes != null)
         {
            _loc1_ = this.m_IntersectNodes.next;
            this.m_IntersectNodes = null;
            this.m_IntersectNodes = _loc1_;
         }
      }
      
      private function processEdgesAtTopOfScanbeam(param1:int) : void
      {
         var _loc3_:TEdge = null;
         var _loc4_:int = 0;
         var _loc5_:HorzJoinRec = null;
         var _loc6_:IntPoint = null;
         var _loc7_:IntPoint = null;
         var _loc8_:IntPoint = null;
         var _loc9_:IntPoint = null;
         var _loc2_:TEdge = this.m_ActiveEdges;
         while(_loc2_ != null)
         {
            if(isMaxima(_loc2_,param1) && getMaximaPair(_loc2_).dx != horizontal)
            {
               _loc3_ = _loc2_.prevInAEL;
               this.doMaxima(_loc2_,param1);
               if(_loc3_ == null)
               {
                  _loc2_ = this.m_ActiveEdges;
               }
               else
               {
                  _loc2_ = _loc3_.nextInAEL;
               }
            }
            else
            {
               if(isIntermediate(_loc2_,param1) && _loc2_.nextInLML.dx == horizontal)
               {
                  if(_loc2_.outIdx >= 0)
                  {
                     this.addOutPt(_loc2_,new IntPoint(_loc2_.xtop,_loc2_.ytop));
                     _loc4_ = 0;
                     while(_loc4_ < this.m_HorizJoins.length)
                     {
                        _loc5_ = this.m_HorizJoins[_loc4_];
                        _loc6_ = new IntPoint(_loc5_.edge.xbot,_loc5_.edge.ybot);
                        _loc7_ = new IntPoint(_loc5_.edge.xtop,_loc5_.edge.ytop);
                        _loc8_ = new IntPoint(_loc2_.nextInLML.xbot,_loc2_.nextInLML.ybot);
                        _loc9_ = new IntPoint(_loc2_.nextInLML.xtop,_loc2_.nextInLML.ytop);
                        if(this.getOverlapSegment(new Segment(_loc6_,_loc7_),new Segment(_loc8_,_loc9_),new Segment(null,null)))
                        {
                           this.addJoin(_loc5_.edge,_loc2_.nextInLML,_loc5_.savedIdx,_loc2_.outIdx);
                        }
                        _loc4_++;
                     }
                     this.addHorzJoin(_loc2_.nextInLML,_loc2_.outIdx);
                  }
                  _loc2_ = this.updateEdgeIntoAEL(_loc2_);
                  this.addEdgeToSEL(_loc2_);
               }
               else
               {
                  _loc2_.xcurr = topX(_loc2_,param1);
                  _loc2_.ycurr = param1;
               }
               _loc2_ = _loc2_.nextInAEL;
            }
         }
         this.processHorizontals();
         _loc2_ = this.m_ActiveEdges;
         while(_loc2_ != null)
         {
            if(isIntermediate(_loc2_,param1))
            {
               if(_loc2_.outIdx >= 0)
               {
                  this.addOutPt(_loc2_,new IntPoint(_loc2_.xtop,_loc2_.ytop));
               }
               _loc2_ = this.updateEdgeIntoAEL(_loc2_);
               if(_loc2_.outIdx >= 0 && _loc2_.prevInAEL != null && _loc2_.prevInAEL.outIdx >= 0 && _loc2_.prevInAEL.xcurr == _loc2_.xbot && _loc2_.prevInAEL.ycurr == _loc2_.ybot && slopesEqual4(new IntPoint(_loc2_.xbot,_loc2_.ybot),new IntPoint(_loc2_.xtop,_loc2_.ytop),new IntPoint(_loc2_.xbot,_loc2_.ybot),new IntPoint(_loc2_.prevInAEL.xtop,_loc2_.prevInAEL.ytop),m_UseFullRange))
               {
                  this.addOutPt(_loc2_.prevInAEL,new IntPoint(_loc2_.xbot,_loc2_.ybot));
                  this.addJoin(_loc2_,_loc2_.prevInAEL,-1,-1);
               }
               else if(_loc2_.outIdx >= 0 && _loc2_.nextInAEL != null && _loc2_.nextInAEL.outIdx >= 0 && _loc2_.nextInAEL.ycurr > _loc2_.nextInAEL.ytop && _loc2_.nextInAEL.ycurr <= _loc2_.nextInAEL.ybot && _loc2_.nextInAEL.xcurr == _loc2_.xbot && _loc2_.nextInAEL.ycurr == _loc2_.ybot && slopesEqual4(new IntPoint(_loc2_.xbot,_loc2_.ybot),new IntPoint(_loc2_.xtop,_loc2_.ytop),new IntPoint(_loc2_.xbot,_loc2_.ybot),new IntPoint(_loc2_.nextInAEL.xtop,_loc2_.nextInAEL.ytop),m_UseFullRange))
               {
                  this.addOutPt(_loc2_.nextInAEL,new IntPoint(_loc2_.xbot,_loc2_.ybot));
                  this.addJoin(_loc2_,_loc2_.nextInAEL,-1,-1);
               }
            }
            _loc2_ = _loc2_.nextInAEL;
         }
      }
      
      private function doMaxima(param1:TEdge, param2:int) : void
      {
         var _loc3_:TEdge = getMaximaPair(param1);
         var _loc4_:int = param1.xtop;
         var _loc5_:TEdge = param1.nextInAEL;
         while(_loc5_ != _loc3_)
         {
            if(_loc5_ == null)
            {
               throw new ClipperException("DoMaxima error");
            }
            this.intersectEdges(param1,_loc5_,new IntPoint(_loc4_,param2),Protects.BOTH);
            _loc5_ = _loc5_.nextInAEL;
         }
         if(param1.outIdx < 0 && _loc3_.outIdx < 0)
         {
            this.deleteFromAEL(param1);
            this.deleteFromAEL(_loc3_);
         }
         else
         {
            if(!(param1.outIdx >= 0 && _loc3_.outIdx >= 0))
            {
               throw new ClipperException("DoMaxima error");
            }
            this.intersectEdges(param1,_loc3_,new IntPoint(_loc4_,param2),Protects.NONE);
         }
      }
      
      private function orientationOutRec(param1:OutRec, param2:Boolean) : Boolean
      {
         var _loc3_:OutPt = param1.pts;
         var _loc4_:OutPt = param1.pts.next;
         while(_loc4_ != param1.pts)
         {
            if(_loc4_.pt.Y >= _loc3_.pt.Y)
            {
               if(_loc4_.pt.Y > _loc3_.pt.Y || _loc4_.pt.X < _loc3_.pt.X)
               {
                  _loc3_ = _loc4_;
               }
            }
            _loc4_ = _loc4_.next;
         }
         param1.bottomPt = _loc3_;
         _loc3_.idx = param1.idx;
         _loc4_ = _loc3_;
         var _loc5_:OutPt = _loc4_.prev;
         var _loc6_:OutPt = _loc4_.next;
         while(_loc4_ != _loc5_ && pointsEqual(_loc4_.pt,_loc5_.pt))
         {
            _loc5_ = _loc5_.prev;
         }
         while(_loc4_ != _loc6_ && pointsEqual(_loc4_.pt,_loc6_.pt))
         {
            _loc6_ = _loc6_.next;
         }
         var _loc7_:IntPoint = new IntPoint(_loc4_.pt.X - _loc5_.pt.X,_loc4_.pt.Y - _loc5_.pt.Y);
         var _loc8_:IntPoint = new IntPoint(_loc6_.pt.X - _loc4_.pt.X,_loc6_.pt.Y - _loc4_.pt.Y);
         if(param2)
         {
            return IntPoint.cross(_loc7_,_loc8_) >= 0;
         }
         return IntPoint.cross(_loc7_,_loc8_) >= 0;
      }
      
      private function pointCount(param1:OutPt) : int
      {
         if(param1 == null)
         {
            return 0;
         }
         var _loc2_:int = 0;
         var _loc3_:OutPt = param1;
         do
         {
            _loc2_++;
            _loc3_ = _loc3_.next;
         }
         while(_loc3_ != param1);
         return _loc2_;
      }
      
      private function buildResult(param1:Polygons) : void
      {
         var _loc2_:OutRec = null;
         var _loc3_:OutPt = null;
         var _loc4_:int = 0;
         var _loc5_:Polygon = null;
         var _loc6_:int = 0;
         param1.clear();
         for each(_loc2_ in this.m_PolyOuts)
         {
            if(_loc2_.pts != null)
            {
               _loc3_ = _loc2_.pts;
               _loc4_ = this.pointCount(_loc3_);
               if(_loc4_ >= 3)
               {
                  _loc5_ = new Polygon();
                  _loc6_ = 0;
                  while(_loc6_ < _loc4_)
                  {
                     _loc5_.addPoint(_loc3_.pt);
                     _loc3_ = _loc3_.next;
                     _loc6_++;
                  }
                  param1.addPolygon(_loc5_);
               }
            }
         }
      }
      
      private function fixupOutPolygon(param1:OutRec) : void
      {
         var _loc4_:OutPt = null;
         var _loc2_:OutPt = null;
         param1.pts = param1.bottomPt;
         var _loc3_:OutPt = param1.bottomPt;
         while(!(_loc3_.prev == _loc3_ || _loc3_.prev == _loc3_.next))
         {
            if(pointsEqual(_loc3_.pt,_loc3_.next.pt) || slopesEqual3(_loc3_.prev.pt,_loc3_.pt,_loc3_.next.pt,m_UseFullRange))
            {
               _loc2_ = null;
               _loc4_ = _loc3_;
               if(_loc3_ == param1.bottomPt)
               {
                  param1.bottomPt = null;
               }
               _loc3_.prev.next = _loc3_.next;
               _loc3_.next.prev = _loc3_.prev;
               _loc3_ = _loc3_.prev;
               _loc4_ = null;
            }
            else
            {
               if(_loc3_ == _loc2_)
               {
                  if(param1.bottomPt == null)
                  {
                     param1.bottomPt = this.getBottomPt(_loc3_);
                     param1.bottomPt.idx = param1.idx;
                     param1.pts = param1.bottomPt;
                  }
                  return;
               }
               if(_loc2_ == null)
               {
                  _loc2_ = _loc3_;
               }
               _loc3_ = _loc3_.next;
            }
         }
         this.disposeOutPts(_loc3_);
         param1.pts = null;
         param1.bottomPt = null;
      }
      
      private function checkHoleLinkages1(param1:OutRec, param2:OutRec) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.m_PolyOuts.length)
         {
            if(this.m_PolyOuts[_loc3_].isHole && this.m_PolyOuts[_loc3_].bottomPt != null && this.m_PolyOuts[_loc3_].firstLeft == param1 && !pointInPolygon(this.m_PolyOuts[_loc3_].bottomPt.pt,param1.pts,m_UseFullRange))
            {
               this.m_PolyOuts[_loc3_].firstLeft = param2;
            }
            _loc3_++;
         }
      }
      
      private function checkHoleLinkages2(param1:OutRec, param2:OutRec) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.m_PolyOuts.length)
         {
            if(this.m_PolyOuts[_loc3_].isHole && this.m_PolyOuts[_loc3_].bottomPt != null && this.m_PolyOuts[_loc3_].firstLeft == param2)
            {
               this.m_PolyOuts[_loc3_].firstLeft = param1;
            }
            _loc3_++;
         }
      }
      
      private function joinCommonEdges(param1:Boolean) : void
      {
         var _loc3_:JoinRec = null;
         var _loc4_:OutRec = null;
         var _loc5_:OutPtRef = null;
         var _loc6_:OutRec = null;
         var _loc7_:OutPtRef = null;
         var _loc8_:Segment = null;
         var _loc9_:Segment = null;
         var _loc10_:Segment = null;
         var _loc11_:IntPoint = null;
         var _loc12_:IntPoint = null;
         var _loc13_:IntPoint = null;
         var _loc14_:IntPoint = null;
         var _loc15_:OutPt = null;
         var _loc16_:OutPt = null;
         var _loc17_:OutPt = null;
         var _loc18_:OutPt = null;
         var _loc19_:OutPt = null;
         var _loc20_:OutPt = null;
         var _loc21_:OutPt = null;
         var _loc22_:int = 0;
         var _loc23_:JoinRec = null;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc2_:int = 0;
         for(; _loc2_ < this.m_Joins.length; _loc2_++)
         {
            _loc3_ = this.m_Joins[_loc2_];
            _loc4_ = this.m_PolyOuts[_loc3_.poly1Idx];
            _loc5_ = new OutPtRef(_loc4_.pts);
            _loc6_ = this.m_PolyOuts[_loc3_.poly2Idx];
            _loc7_ = new OutPtRef(_loc6_.pts);
            _loc8_ = new Segment(_loc3_.pt2a,_loc3_.pt2b);
            _loc9_ = new Segment(_loc3_.pt1a,_loc3_.pt1b);
            if(this.findSegment(_loc5_,_loc8_))
            {
               if(_loc3_.poly1Idx == _loc3_.poly2Idx)
               {
                  _loc7_.outPt = _loc5_.outPt.next;
                  if(!this.findSegment(_loc7_,_loc9_) || _loc7_.outPt == _loc5_.outPt)
                  {
                     continue;
                  }
               }
               else if(!this.findSegment(_loc7_,_loc9_))
               {
                  continue;
               }
               _loc10_ = new Segment(null,null);
               if(this.getOverlapSegment(_loc8_,_loc9_,_loc10_))
               {
                  _loc11_ = _loc10_.pt1;
                  _loc12_ = _loc10_.pt2;
                  _loc13_ = _loc9_.pt1;
                  _loc14_ = _loc9_.pt2;
                  _loc15_ = _loc5_.outPt;
                  _loc16_ = _loc7_.outPt;
                  _loc21_ = _loc15_.prev;
                  if(pointsEqual(_loc15_.pt,_loc11_))
                  {
                     _loc17_ = _loc15_;
                  }
                  else if(pointsEqual(_loc21_.pt,_loc11_))
                  {
                     _loc17_ = _loc21_;
                  }
                  else
                  {
                     _loc17_ = this.insertPolyPtBetween(_loc15_,_loc21_,_loc11_);
                  }
                  if(pointsEqual(_loc15_.pt,_loc12_))
                  {
                     _loc18_ = _loc15_;
                  }
                  else if(pointsEqual(_loc21_.pt,_loc12_))
                  {
                     _loc18_ = _loc21_;
                  }
                  else if(_loc17_ == _loc15_ || _loc17_ == _loc21_)
                  {
                     _loc18_ = this.insertPolyPtBetween(_loc15_,_loc21_,_loc12_);
                  }
                  else if(this.pt3IsBetweenPt1AndPt2(_loc15_.pt,_loc17_.pt,_loc12_))
                  {
                     _loc18_ = this.insertPolyPtBetween(_loc15_,_loc17_,_loc12_);
                  }
                  else
                  {
                     _loc18_ = this.insertPolyPtBetween(_loc17_,_loc21_,_loc12_);
                  }
                  _loc21_ = _loc16_.prev;
                  if(pointsEqual(_loc16_.pt,_loc11_))
                  {
                     _loc19_ = _loc16_;
                  }
                  else if(pointsEqual(_loc21_.pt,_loc11_))
                  {
                     _loc19_ = _loc21_;
                  }
                  else
                  {
                     _loc19_ = this.insertPolyPtBetween(_loc16_,_loc21_,_loc11_);
                  }
                  if(pointsEqual(_loc16_.pt,_loc12_))
                  {
                     _loc20_ = _loc16_;
                  }
                  else if(pointsEqual(_loc21_.pt,_loc12_))
                  {
                     _loc20_ = _loc21_;
                  }
                  else if(_loc19_ == _loc16_ || _loc19_ == _loc21_)
                  {
                     _loc20_ = this.insertPolyPtBetween(_loc16_,_loc21_,_loc12_);
                  }
                  else if(this.pt3IsBetweenPt1AndPt2(_loc16_.pt,_loc19_.pt,_loc12_))
                  {
                     _loc20_ = this.insertPolyPtBetween(_loc16_,_loc19_,_loc12_);
                  }
                  else
                  {
                     _loc20_ = this.insertPolyPtBetween(_loc19_,_loc21_,_loc12_);
                  }
                  if(_loc17_.next == _loc18_ && _loc19_.prev == _loc20_)
                  {
                     _loc17_.next = _loc19_;
                     _loc19_.prev = _loc17_;
                     _loc18_.prev = _loc20_;
                     _loc20_.next = _loc18_;
                  }
                  else
                  {
                     if(!(_loc17_.prev == _loc18_ && _loc19_.next == _loc20_))
                     {
                        continue;
                     }
                     _loc17_.prev = _loc19_;
                     _loc19_.next = _loc17_;
                     _loc18_.next = _loc20_;
                     _loc20_.prev = _loc18_;
                  }
                  if(_loc3_.poly2Idx == _loc3_.poly1Idx)
                  {
                     _loc4_.pts = this.getBottomPt(_loc17_);
                     _loc4_.bottomPt = _loc4_.pts;
                     _loc4_.bottomPt.idx = _loc4_.idx;
                     _loc6_ = this.createOutRec();
                     this.m_PolyOuts.push(_loc6_);
                     _loc6_.idx = this.m_PolyOuts.length - 1;
                     _loc3_.poly2Idx = _loc6_.idx;
                     _loc6_.pts = this.getBottomPt(_loc18_);
                     _loc6_.bottomPt = _loc6_.pts;
                     _loc6_.bottomPt.idx = _loc6_.idx;
                     if(pointInPolygon(_loc6_.pts.pt,_loc4_.pts,m_UseFullRange))
                     {
                        _loc6_.isHole = !_loc4_.isHole;
                        _loc6_.firstLeft = _loc4_;
                        if(_loc6_.isHole == xor(this.m_ReverseOutput,this.orientationOutRec(_loc6_,m_UseFullRange)))
                        {
                           this.reversePolyPtLinks(_loc6_.pts);
                        }
                     }
                     else if(pointInPolygon(_loc4_.pts.pt,_loc6_.pts,m_UseFullRange))
                     {
                        _loc6_.isHole = _loc4_.isHole;
                        _loc4_.isHole = !_loc6_.isHole;
                        _loc6_.firstLeft = _loc4_.firstLeft;
                        _loc4_.firstLeft = _loc6_;
                        if(_loc4_.isHole == xor(this.m_ReverseOutput,this.orientationOutRec(_loc4_,m_UseFullRange)))
                        {
                           this.reversePolyPtLinks(_loc4_.pts);
                        }
                        if(param1)
                        {
                           this.checkHoleLinkages1(_loc4_,_loc6_);
                        }
                     }
                     else
                     {
                        _loc6_.isHole = _loc4_.isHole;
                        _loc6_.firstLeft = _loc4_.firstLeft;
                        if(param1)
                        {
                           this.checkHoleLinkages1(_loc4_,_loc6_);
                        }
                     }
                     _loc22_ = _loc2_ + 1;
                     while(_loc22_ < this.m_Joins.length)
                     {
                        _loc23_ = this.m_Joins[_loc22_];
                        if(_loc23_.poly1Idx == _loc3_.poly1Idx && pointIsVertex(_loc23_.pt1a,_loc18_))
                        {
                           _loc23_.poly1Idx = _loc3_.poly2Idx;
                        }
                        if(_loc23_.poly2Idx == _loc3_.poly1Idx && pointIsVertex(_loc23_.pt2a,_loc18_))
                        {
                           _loc23_.poly2Idx = _loc3_.poly2Idx;
                        }
                        _loc22_++;
                     }
                     this.fixupOutPolygon(_loc4_);
                     this.fixupOutPolygon(_loc6_);
                     if(this.orientationOutRec(_loc4_,m_UseFullRange) != this.areaOutRec(_loc4_,m_UseFullRange) > 0)
                     {
                        this.disposeBottomPt(_loc4_);
                     }
                     if(this.orientationOutRec(_loc6_,m_UseFullRange) != this.areaOutRec(_loc6_,m_UseFullRange) > 0)
                     {
                        this.disposeBottomPt(_loc6_);
                     }
                  }
                  else
                  {
                     if(param1)
                     {
                        this.checkHoleLinkages2(_loc4_,_loc6_);
                     }
                     this.fixupOutPolygon(_loc4_);
                     if(_loc4_.pts != null)
                     {
                        _loc4_.isHole = !this.orientationOutRec(_loc4_,m_UseFullRange);
                        if(_loc4_.isHole && _loc4_.firstLeft == null)
                        {
                           _loc4_.firstLeft = _loc6_.firstLeft;
                        }
                     }
                     _loc24_ = _loc4_.idx;
                     _loc25_ = _loc6_.idx;
                     _loc6_.pts = null;
                     _loc6_.bottomPt = null;
                     _loc6_.appendLink = _loc4_;
                     _loc22_ = _loc2_ + 1;
                     while(_loc22_ < this.m_Joins.length)
                     {
                        _loc23_ = this.m_Joins[_loc22_];
                        if(_loc23_.poly1Idx == _loc25_)
                        {
                           _loc23_.poly1Idx = _loc24_;
                        }
                        if(_loc23_.poly2Idx == _loc25_)
                        {
                           _loc23_.poly2Idx = _loc24_;
                        }
                        _loc22_++;
                     }
                  }
               }
            }
         }
      }
      
      private function areaOutRec(param1:OutRec, param2:Boolean) : Number
      {
         var _loc3_:OutPt = param1.pts;
         var _loc4_:Number = 0;
         do
         {
            _loc4_ += _loc3_.prev.pt.X * _loc3_.pt.Y - _loc3_.pt.X * _loc3_.prev.pt.Y;
            _loc3_ = _loc3_.next;
         }
         while(_loc3_ != param1.pts);
         return _loc4_ / 2;
      }
   }
}

import com.logicom.geom.IntPoint;

final class Protects
{
   
   public static const NONE:int = 0;
   
   public static const LEFT:int = 1;
   
   public static const RIGHT:int = 2;
   
   public static const BOTH:int = 3;
   
   public function Protects()
   {
      super();
   }
}

final class Direction
{
   
   public static const RIGHT_TO_LEFT:int = 0;
   
   public static const LEFT_TO_RIGHT:int = 1;
   
   public function Direction()
   {
      super();
   }
}

final class Scanbeam
{
   
   public var Y:int;
   
   public var next:Scanbeam;
   
   public function Scanbeam()
   {
      super();
   }
}

final class JoinRec
{
   
   public var pt1a:IntPoint;
   
   public var pt1b:IntPoint;
   
   public var poly1Idx:int;
   
   public var pt2a:IntPoint;
   
   public var pt2b:IntPoint;
   
   public var poly2Idx:int;
   
   public function JoinRec()
   {
      super();
   }
}
