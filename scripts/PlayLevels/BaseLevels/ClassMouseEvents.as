package PlayLevels.BaseLevels
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassMouseEvents extends Sprite
   {
      
      public const EVENT:String = "EVENT";
      
      public var nameEvent:String = "";
      
      public var isLive:Boolean = true;
      
      public var isMouseDown:Boolean;
      
      public var isMouseUp:Boolean;
      
      public var isMouseOut:Boolean;
      
      public var isMouseMove:Boolean;
      
      public var isMouseOver:Boolean;
      
      public var pointMouseEvent:Point = new Point();
      
      public var lastPointMouse:Point = new Point();
      
      public function ClassMouseEvents()
      {
         super();
      }
      
      public function setListenMouse() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         addEventListener(MouseEvent.MOUSE_OUT,this.mouseOut);
         addEventListener(MouseEvent.MOUSE_OVER,this.mouseOver);
         addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMove);
      }
      
      public function removeListenMouse() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         removeEventListener(MouseEvent.MOUSE_OUT,this.mouseOut);
         removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOver);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMove);
      }
      
      public function update(param1:Event = null) : void
      {
         this.isMouseOver = false;
         this.isMouseOut = false;
         this.isMouseDown = false;
         this.isMouseUp = false;
         this.isMouseMove = false;
      }
      
      public function mouseDown(param1:MouseEvent = null) : void
      {
         this.pointMouseEvent.x = mouseX;
         this.pointMouseEvent.y = mouseY;
         this.isMouseDown = true;
      }
      
      public function mouseUp(param1:MouseEvent = null) : void
      {
         this.isMouseUp = true;
      }
      
      public function mouseOut(param1:MouseEvent = null) : void
      {
         this.isMouseOut = true;
      }
      
      public function mouseOver(param1:MouseEvent = null) : void
      {
         this.isMouseOver = true;
      }
      
      public function mouseMove(param1:MouseEvent = null) : void
      {
         this.isMouseMove = true;
      }
      
      public function mouseDownGlobal() : void
      {
      }
      
      public function mouseUpGlobal() : void
      {
      }
      
      public function mouseOutGlobal() : void
      {
      }
      
      public function mouseOverGlobal() : void
      {
      }
      
      public function mouseMoveGlobal() : void
      {
      }
      
      public function destroy() : void
      {
         this.pointMouseEvent = null;
         this.lastPointMouse = null;
         this.removeListenMouse();
      }
   }
}

