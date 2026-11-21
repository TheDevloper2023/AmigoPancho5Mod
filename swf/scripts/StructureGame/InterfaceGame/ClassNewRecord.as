package StructureGame.InterfaceGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class ClassNewRecord extends Sprite
   {
      
      private var movieRecord:MovieClip;
      
      private var timeOnSprite:Number;
      
      private var changeAlpha:Number = 1;
      
      public function ClassNewRecord()
      {
         super();
         var _loc1_:Class = amigo5.swfMoviesInterface.getAssetClass("levelRecord");
         this.movieRecord = new _loc1_();
         addChild(this.movieRecord);
         this.movieRecord.visible = false;
         visible = false;
      }
      
      public function start(param1:Number) : void
      {
         this.movieRecord.visible = true;
         this.timeOnSprite = param1;
         this.movieRecord.addEventListener(Event.ENTER_FRAME,this.timeWait);
         ControlSounds.playSound("record",0.3,1);
      }
      
      private function timeWait(param1:Event) : void
      {
         --this.timeOnSprite;
         if(this.timeOnSprite < 0)
         {
            this.movieRecord.removeEventListener(Event.ENTER_FRAME,this.timeWait);
            this.movieRecord.addEventListener(Event.ENTER_FRAME,this.timeChangeAlphaTo_0);
         }
      }
      
      private function timeChangeAlphaTo_0(param1:Event) : void
      {
         this.changeAlpha -= 0.05;
         this.movieRecord.alpha = this.changeAlpha;
         if(this.changeAlpha < 0)
         {
            this.movieRecord.removeEventListener(Event.ENTER_FRAME,this.timeChangeAlphaTo_0);
            this.movieRecord.visible = false;
         }
      }
      
      public function destroy() : void
      {
         this.movieRecord.removeEventListener(Event.ENTER_FRAME,this.timeWait);
         this.movieRecord.removeEventListener(Event.ENTER_FRAME,this.timeChangeAlphaTo_0);
         removeChild(this.movieRecord);
         this.movieRecord = null;
      }
   }
}

