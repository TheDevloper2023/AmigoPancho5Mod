package StructureGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class ClassDamping extends Sprite
   {
      
      public const EVENT_COMPLETED:String = "EVENT_COMPLETED";
      
      public const ACTION_EXTINCTION:String = "ACTION_EXTINCTION";
      
      public const ACTION_APPEARANCE:String = "ACTION_APPEARANCE";
      
      public var movieDumping:MovieClip;
      
      internal var isDampFin:Boolean = false;
      
      public function ClassDamping()
      {
         super();
      }
      
      public function action(param1:Sprite, param2:String, param3:Number = 0.12, param4:Boolean = true) : void
      {
         var _loc5_:Class = amigo5.swfMoviesStructur.getAssetClass("dumping");
         this.movieDumping = new _loc5_();
         addChild(this.movieDumping);
         if(param2 == this.ACTION_EXTINCTION)
         {
            this.movieDumping.gotoAndPlay("startNight");
         }
         if(param2 == this.ACTION_APPEARANCE)
         {
            this.movieDumping.gotoAndPlay("startLight");
         }
         addEventListener(Event.ENTER_FRAME,this.doIt);
      }
      
      private function doIt(param1:Event) : void
      {
         if(this.movieDumping.currentFrameLabel == "s")
         {
            removeChild(this.movieDumping);
            removeEventListener(Event.ENTER_FRAME,this.doIt);
            dispatchEvent(new Event(this.EVENT_COMPLETED));
            this.isDampFin = true;
         }
      }
      
      public function destroy() : void
      {
         if(this.movieDumping)
         {
            this.movieDumping.removeEventListener(Event.ENTER_FRAME,this.doIt);
            if(this.movieDumping.parent)
            {
               this.movieDumping.parent.removeChild(this.movieDumping);
            }
            this.movieDumping = null;
         }
      }
   }
}

