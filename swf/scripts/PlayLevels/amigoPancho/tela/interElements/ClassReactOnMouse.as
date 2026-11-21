package PlayLevels.amigoPancho.tela.interElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.Hints.ClassHint;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassReactOnMouse extends ClassLevelObject
   {
      
      public static var arrReactMouse:Array = [];
      
      public var isTouchBegin:Boolean;
      
      private var isMouseUpOnThis:Boolean;
      
      public var isMouseReact:Boolean;
      
      public function ClassReactOnMouse(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForPerformers);
         this.setMouseReactOn();
         arrReactMouse.push(this);
      }
      
      public static function setMouseReactOffKrome(param1:ClassReactOnMouse = null) : void
      {
         var _loc2_:ClassReactOnMouse = null;
         for each(_loc2_ in arrReactMouse)
         {
            if(param1 != _loc2_)
            {
               _loc2_.setMouseReactOff();
            }
         }
      }
      
      public static function setMouseReactOnKrome(param1:ClassReactOnMouse = null) : void
      {
         var _loc2_:ClassReactOnMouse = null;
         for each(_loc2_ in arrReactMouse)
         {
            if(param1 != _loc2_)
            {
               _loc2_.setMouseReactOn();
            }
         }
      }
      
      public static function setMouseReactOnObj(param1:ClassReactOnMouse) : void
      {
         var _loc2_:ClassReactOnMouse = null;
         for each(_loc2_ in arrReactMouse)
         {
            if(param1 == _loc2_)
            {
               _loc2_.setMouseReactOn();
            }
         }
      }
      
      public function setMouseReactOn() : void
      {
         if(this.isMouseReact == false)
         {
            this.isMouseReact = true;
            addEventListener(MouseEvent.MOUSE_OVER,this.mover);
            addEventListener(MouseEvent.MOUSE_OUT,this.mout);
            addEventListener(MouseEvent.MOUSE_DOWN,this.mDown);
            amigo5.mainStage.addEventListener(MouseEvent.MOUSE_UP,this.mUpGlobal);
            ClassLayers.spriteLevel.addEventListener(MouseEvent.MOUSE_DOWN,this.mDownGlobal);
            addEventListener(MouseEvent.MOUSE_UP,this.mUp);
            amigo5.mainStage.addEventListener(Event.MOUSE_LEAVE,this.M_LEAVE);
         }
      }
      
      public function M_LEAVE(param1:Event) : void
      {
         this.mUpGlobal();
      }
      
      public function setMouseReactOff() : void
      {
         if(this.isMouseReact == true)
         {
            this.mUpGlobal();
            this.isMouseReact = false;
            removeEventListener(MouseEvent.MOUSE_OVER,this.mover);
            removeEventListener(MouseEvent.MOUSE_OUT,this.mout);
            removeEventListener(MouseEvent.MOUSE_DOWN,this.mDown);
            amigo5.mainStage.removeEventListener(MouseEvent.MOUSE_UP,this.mUpGlobal);
            ClassLayers.spriteLevel.removeEventListener(MouseEvent.MOUSE_DOWN,this.mDownGlobal);
            removeEventListener(MouseEvent.MOUSE_UP,this.mUp);
            amigo5.mainStage.removeEventListener(Event.MOUSE_LEAVE,this.M_LEAVE);
         }
      }
      
      public function mover(param1:MouseEvent) : void
      {
         this.startLightMouseButton();
      }
      
      public function startLightMouseButton() : void
      {
         setLight(5);
         ClassMouseCursor.createMouseCursorButton();
      }
      
      public function mout(param1:MouseEvent = null) : void
      {
         if(this.isTouchBegin == false)
         {
            this.clearLightMouseAuto();
         }
      }
      
      public function clearLightMouseAuto() : void
      {
         clearLight();
         ClassMouseCursor.createMouseCursorAuto();
      }
      
      public function mUpGlobal(param1:MouseEvent = null) : void
      {
         if(this.isTouchBegin == true)
         {
            this.isTouchBegin = false;
            if(this.isMouseUpOnThis == false)
            {
               clearLight();
               ClassMouseCursor.createMouseCursorAuto();
            }
         }
         this.isMouseUpOnThis = false;
      }
      
      public function mUp(param1:MouseEvent = null) : void
      {
         this.isMouseUpOnThis = true;
      }
      
      public function mDown(param1:MouseEvent) : void
      {
         this.isTouchBegin = true;
         ClassHint.showNextHint();
      }
      
      public function mDownGlobal(param1:MouseEvent) : void
      {
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrReactMouse);
         this.setMouseReactOff();
         super.destroy();
      }
   }
}

