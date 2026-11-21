package PlayLevels.amigoPancho.tela.interElements.performers
{
   import PlayLevels.amigoPancho.ClassLayers;
   import flash.events.Event;
   
   public class ClassContacterPerforms extends ClassBasePerfomer
   {
      
      public var arrPerfCont:Array = [];
      
      public function ClassContacterPerforms(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSuperStat);
         setMouseReactOff();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         createStatic();
         destroyBody();
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
      
      override public function setOn(param1:Number) : void
      {
         var _loc2_:ClassBasePerfomer = null;
         super.setOn(param1);
         for each(_loc2_ in this.arrPerfCont)
         {
            _loc2_.setOn(param1);
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

