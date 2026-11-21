package ActionsBeforeGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassIntro extends Sprite
   {
      
      public const FINISH:String = "FINISH";
      
      private var movieIntro:MovieClip;
      
      public function ClassIntro(param1:Object, param2:Boolean, param3:Boolean)
      {
         super();
         var _loc4_:Class = param1.getAssetClass("intro");
         this.movieIntro = new _loc4_();
         addChild(this.movieIntro);
      }
      
      public function init() : void
      {
         addEventListener(Event.ENTER_FRAME,this.goSkrytIntro);
         addEventListener(MouseEvent.CLICK,this.clickIntro1);
         ClassMouseCursor.createMouseCursorButton();
      }
      
      private function clickIntro1(param1:Event) : void
      {
         ClassLinks.goToGameLink("splashscreena10");
      }
      
      private function goSkrytIntro(param1:Event) : void
      {
         if(this.movieIntro.m.currentFrame == 149)
         {
            this.movieIntro.m.stop();
            removeEventListener(Event.ENTER_FRAME,this.goSkrytIntro);
            ClassMouseCursor.createMouseCursorAuto();
            dispatchEvent(new Event(this.FINISH));
         }
      }
      
      public function destroy() : void
      {
         trace("destroy");
         removeEventListener(MouseEvent.CLICK,this.clickIntro1);
         removeEventListener(Event.ENTER_FRAME,this.goSkrytIntro);
         while(this.movieIntro.m.numChildren)
         {
            this.movieIntro.m.removeChildAt(0);
         }
         while(this.movieIntro.numChildren)
         {
            this.movieIntro.removeChildAt(0);
         }
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
   }
}

