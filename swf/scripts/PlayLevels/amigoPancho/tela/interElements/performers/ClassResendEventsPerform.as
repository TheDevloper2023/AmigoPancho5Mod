package PlayLevels.amigoPancho.tela.interElements.performers
{
   import flash.events.Event;
   
   public class ClassResendEventsPerform extends ClassBasePerfomer
   {
      
      public var arrPerfCont:Array = [];
      
      public function ClassResendEventsPerform(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         addEventListener(Event.ENTER_FRAME,this.findHitPerf);
      }
      
      public function findHitPerf(param1:Event) : void
      {
         var _loc2_:ClassBasePerfomer = null;
         removeEventListener(Event.ENTER_FRAME,this.findHitPerf);
         for each(_loc2_ in ClassBasePerfomer.arrObjectsPerform)
         {
            if(_loc2_ != this && hitTestObject(_loc2_))
            {
               this.arrPerfCont.push(_loc2_);
            }
         }
      }
      
      public function setMouseOffResend() : void
      {
         var _loc1_:ClassBasePerfomer = null;
         for each(_loc1_ in this.arrPerfCont)
         {
            _loc1_.setMouseReactOff();
         }
      }
      
      public function setMouseOnResend() : void
      {
         var _loc1_:ClassBasePerfomer = null;
         for each(_loc1_ in this.arrPerfCont)
         {
            _loc1_.setMouseReactOn();
         }
      }
      
      public function setMOverResend() : void
      {
         var _loc1_:ClassBasePerfomer = null;
         for each(_loc1_ in this.arrPerfCont)
         {
            _loc1_.mover(null);
         }
      }
      
      public function setMouseOutResend() : void
      {
         var _loc1_:ClassBasePerfomer = null;
         for each(_loc1_ in this.arrPerfCont)
         {
            _loc1_.mout();
         }
      }
      
      public function setMouseDownResend() : void
      {
         var _loc1_:ClassBasePerfomer = null;
         for each(_loc1_ in this.arrPerfCont)
         {
            _loc1_.mDown(null);
         }
      }
      
      public function setMouseUpResend() : void
      {
         var _loc1_:ClassBasePerfomer = null;
         for each(_loc1_ in this.arrPerfCont)
         {
            _loc1_.mUp();
         }
      }
      
      public function setMouseUpGlobalResend() : void
      {
         var _loc1_:ClassBasePerfomer = null;
         for each(_loc1_ in this.arrPerfCont)
         {
            _loc1_.mUpGlobal();
         }
      }
      
      override public function destroy() : void
      {
         this.arrPerfCont = [];
         this.arrPerfCont = null;
         removeEventListener(Event.ENTER_FRAME,this.findHitPerf);
         super.destroy();
      }
   }
}

