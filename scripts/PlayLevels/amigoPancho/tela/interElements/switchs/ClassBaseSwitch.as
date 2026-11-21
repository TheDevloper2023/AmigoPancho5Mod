package PlayLevels.amigoPancho.tela.interElements.switchs
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.ClassReactOnMouse;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassBasePerfomer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassBaseSwitch extends ClassReactOnMouse
   {
      
      public var objectPerfomer:ClassBasePerfomer;
      
      public var isVertical:Boolean;
      
      public var kf:Number = 1;
      
      public function ClassBaseSwitch(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSwitch);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         createStatic();
         if(rotation == 90)
         {
            this.isVertical = true;
         }
         addEventListener(Event.ENTER_FRAME,this.findPerfomer);
      }
      
      public function findPerfomer(param1:Event) : void
      {
         var _loc2_:ClassBasePerfomer = null;
         removeEventListener(Event.ENTER_FRAME,this.findPerfomer);
         for each(_loc2_ in ClassBasePerfomer.arrObjectsPerform)
         {
            if(_loc2_.hitTestObject(this))
            {
               this.objectPerfomer = _loc2_;
               this.objectPerfomer.setObjectSwitch(this);
            }
         }
         if(this.objectPerfomer == null)
         {
            setMouseReactOff();
            createStatic();
         }
         else if(this.objectPerfomer.switchPos)
         {
            setPosition(this.objectPerfomer.switchPos.x,this.objectPerfomer.switchPos.y);
         }
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:Number = Number(param1.attribute("l_damp"));
         if(_loc2_ != -0.1)
         {
            this.kf = _loc2_;
         }
         if(!this.kf)
         {
            this.kf = 1;
         }
      }
      
      override public function mUpGlobal(param1:MouseEvent = null) : void
      {
         if(isTouchBegin == true)
         {
            super.mUpGlobal(param1);
            if(this.objectPerfomer)
            {
               this.objectPerfomer.setOff();
            }
         }
      }
      
      override public function destroy() : void
      {
         this.objectPerfomer = null;
         removeEventListener(Event.ENTER_FRAME,this.findPerfomer);
         super.destroy();
      }
   }
}

