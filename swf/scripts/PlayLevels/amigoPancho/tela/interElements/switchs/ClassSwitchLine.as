package PlayLevels.amigoPancho.tela.interElements.switchs
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassSwitchLine extends ClassBaseSwitch
   {
      
      private var startPos:Point;
      
      private var pointLimit:Point;
      
      private var pDown:Point;
      
      private var pDelta:Point;
      
      private var cours:int = 1;
      
      public function ClassSwitchLine(param1:String)
      {
         super(param1);
      }
      
      override public function findPerfomer(param1:Event) : void
      {
         super.findPerfomer(param1);
         if(objectPerfomer)
         {
            this.createLimit();
         }
         this.startPos = new Point(x,y);
      }
      
      public function createLimit() : void
      {
         var _loc1_:Number = ClassMath.getDistansFromToPoints(objectPerfomer.limit1,getPosition());
         _loc1_ = 8;
         var _loc2_:Number = ClassMath.getDistansFromToPoints(objectPerfomer.limit2,getPosition());
         _loc2_ = 8;
         this.pointLimit = new Point(8,8);
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         super.mDown(param1);
         this.pDown = new Point(stage.mouseX,stage.mouseY);
         this.pDelta = new Point(stage.mouseX - x,stage.mouseY - y);
      }
      
      override public function mUpGlobal(param1:MouseEvent = null) : void
      {
         super.mUpGlobal(param1);
         x = this.startPos.x;
         y = this.startPos.y;
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         super.update(param1);
         if(isTouchBegin)
         {
            this.cours = 0;
            if(isVertical == false)
            {
               _loc2_ = this.pDown.x + (stage.mouseX - this.pDown.x) - this.pDelta.x;
               if(this.startPos.x - _loc2_ > 0)
               {
                  this.cours = -1;
               }
               if(this.startPos.x - _loc2_ < 0)
               {
                  this.cours = 1;
               }
               _loc3_ = Math.abs(this.startPos.x - _loc2_);
               if(_loc3_ < this.pointLimit.x)
               {
                  x = _loc2_;
               }
               else
               {
                  x = this.startPos.x + this.pointLimit.x * this.cours;
               }
            }
            else
            {
               _loc4_ = this.pDown.y + (stage.mouseY - this.pDown.y) - this.pDelta.y;
               if(this.startPos.y - _loc4_ > 0)
               {
                  this.cours = -1;
               }
               if(this.startPos.y - _loc4_ < 0)
               {
                  this.cours = 1;
               }
               _loc3_ = Math.abs(this.startPos.y - _loc4_);
               if(_loc3_ < this.pointLimit.y)
               {
                  y = _loc4_;
               }
               else
               {
                  y = this.startPos.y + this.pointLimit.y * this.cours;
               }
            }
            objectPerfomer.setOn(this.cours);
         }
      }
   }
}

