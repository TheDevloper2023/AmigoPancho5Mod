package PlayLevels.amigoPancho.tela.levelElements.codeSwitch
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragTimerKol;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.events.Event;
   
   public class ClassStandCode extends ClassLevelObject
   {
      
      private var arrSw:Array = [];
      
      private var arrBR:Array = [];
      
      public function ClassStandCode(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSuperStat);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         addEventListener(Event.ENTER_FRAME,this.findSwitchs);
      }
      
      public function findSwitchs(param1:Event) : void
      {
         var _loc2_:ClassLevelObject = null;
         removeEventListener(Event.ENTER_FRAME,this.findSwitchs);
         for each(_loc2_ in ClassLevelObject.arrLevelObjects)
         {
            if(hitTestObject(_loc2_))
            {
               if(_loc2_ is ClassSwitchCode)
               {
                  this.arrSw.push(_loc2_);
                  _loc2_.addEventListener(_loc2_.EVENT,this.eventFromSwitch);
               }
            }
            if(_loc2_ is ClassBlockRCode)
            {
               this.arrBR.push(_loc2_);
            }
         }
      }
      
      private function eventFromSwitch(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ClassSwitchCode = null;
         for each(_loc3_ in this.arrSw)
         {
            if(_loc3_.isTrue)
            {
               _loc2_++;
            }
         }
         if(_loc2_ == this.arrSw.length)
         {
            this.setIsblockRocketOpen(true);
            for each(_loc3_ in this.arrSw)
            {
               _loc3_.setOpen();
               this.startDvig();
            }
         }
         else
         {
            this.setIsblockRocketOpen(false);
            for each(_loc3_ in this.arrSw)
            {
               _loc3_.setClose();
            }
         }
      }
      
      private function startDvig() : void
      {
         var _loc1_:ClassDragTimerKol = null;
         for each(_loc1_ in ClassDragTimerKol.arrDrag)
         {
            _loc1_.setOn(0);
         }
      }
      
      private function setIsblockRocketOpen(param1:Boolean) : void
      {
         var _loc2_:ClassBlockRCode = null;
         for each(_loc2_ in this.arrBR)
         {
            if(param1)
            {
               _loc2_.setOpen();
            }
            else
            {
               _loc2_.setClose();
            }
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findSwitchs);
         this.arrSw = [];
         this.arrSw = null;
         this.arrBR = [];
         this.arrBR = null;
         super.destroy();
      }
   }
}

