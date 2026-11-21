package StructureGame
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassBaseStructureGameElement extends ClassDamping
   {
      
      public var movie:MovieClip;
      
      private var currentEvent:String;
      
      public var isShowDamping:Boolean = true;
      
      public function ClassBaseStructureGameElement(param1:String, param2:Boolean = true)
      {
         super();
         var _loc3_:Class = amigo5.swfMoviesStructur.getAssetClass(param1);
         this.movie = new _loc3_() as MovieClip;
         addChild(this.movie);
         if(param2)
         {
            action(this.movie,ACTION_APPEARANCE);
            addEventListener(EVENT_COMPLETED,this.appearanceCompleted);
         }
      }
      
      private function appearanceCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.appearanceCompleted);
      }
      
      public function extinction(param1:String) : void
      {
         this.currentEvent = param1;
         if(!this.isShowDamping)
         {
            this.isShowDamping = true;
            this.extinctionCompleted(null);
            return;
         }
         action(this.movie,ACTION_EXTINCTION);
         addEventListener(EVENT_COMPLETED,this.extinctionCompleted);
      }
      
      private function extinctionCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.extinctionCompleted);
         dispatchEvent(new Event(this.currentEvent));
      }
      
      override public function destroy() : void
      {
         super.destroy();
         removeEventListener(EVENT_COMPLETED,this.extinctionCompleted);
         removeEventListener(EVENT_COMPLETED,this.appearanceCompleted);
         while(this.movie.numChildren)
         {
            this.movie.removeChildAt(0);
         }
         removeChild(this.movie);
         this.movie = null;
         this.currentEvent = null;
      }
   }
}

