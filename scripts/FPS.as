package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.system.System;
   import flash.text.TextField;
   import flash.utils.getTimer;
   
   public class FPS extends Sprite
   {
      
      private var fMillisecond:uint;
      
      private var sMillisecond:uint;
      
      private var frameCount:Number;
      
      private var lastMeasure:Number;
      
      private var output:String;
      
      private var counterDisplay:TextField;
      
      public function FPS()
      {
         super();
         this.counterDisplay = new TextField();
         this.counterDisplay.selectable = false;
         this.counterDisplay.width = 80;
         this.counterDisplay.height = 34;
         addChild(this.counterDisplay);
         this.fMillisecond = getTimer();
         this.sMillisecond = this.fMillisecond + 1000;
         this.frameCount = 0;
         this.output = "--";
         this.lastMeasure = 0;
         addEventListener(Event.ENTER_FRAME,this.onEnterFrameEvent);
         y = 0;
         x = 7;
         scaleX = 0.7;
         scaleY = 0.8;
         visible = ClassFlags.isShowFPS;
      }
      
      private function onEnterFrameEvent(param1:Event) : void
      {
         this.updateCounter();
      }
      
      private function updateCounter() : void
      {
         var _loc1_:Number = NaN;
         this.fMillisecond = getTimer();
         if(this.fMillisecond > this.sMillisecond)
         {
            _loc1_ = this.frameCount / (this.fMillisecond - this.sMillisecond + 1000) * 1000;
            this.sMillisecond = this.fMillisecond + 1000;
            this.frameCount = 0;
            if(this.lastMeasure != _loc1_)
            {
               this.lastMeasure = _loc1_;
               this.output = "FPS " + _loc1_.toFixed(1) + "\nM " + Math.round(System.totalMemory / 1024) + "";
            }
         }
         else
         {
            this.frameCount += 1;
         }
         this.counterDisplay.text = this.output;
      }
   }
}

