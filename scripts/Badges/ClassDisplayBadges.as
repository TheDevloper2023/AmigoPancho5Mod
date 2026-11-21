package Badges
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class ClassDisplayBadges extends Sprite
   {
      
      private var badge:ClassBaseBadge;
      
      private var mainParent:Sprite;
      
      private var movieFon:MovieClip = new MovieClip();
      
      private var bAlpha:Number = 0;
      
      private var arrBadges:Array = [];
      
      private var isShowNow:Boolean;
      
      public function ClassDisplayBadges(param1:Sprite)
      {
         super();
         this.mainParent = param1;
         this.isShowNow = false;
         addEventListener(Event.ENTER_FRAME,this.update);
      }
      
      public function showBadge(param1:ClassBaseBadge) : void
      {
         this.badge = param1;
         this.arrBadges.push(this.badge);
         ControlSounds.playSound("getBonus",0.3);
      }
      
      private function update(param1:Event) : void
      {
         var _loc2_:ClassBaseBadge = null;
         var _loc3_:MovieClip = null;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         if(Boolean(this.arrBadges.length) && this.isShowNow == false)
         {
            this.isShowNow = true;
            _loc2_ = this.arrBadges[0] as ClassBaseBadge;
            _loc2_.isWasShown = true;
            _loc3_ = _loc2_.movieBadge;
            _loc4_ = _loc2_.getNameAchivement();
            _loc5_ = amigo5.swfMoviesStructur.getAssetClass("fon_badge");
            this.movieFon = new _loc5_();
            this.movieFon.x = 250;
            this.movieFon.y = 390;
            this.movieFon.alpha = 0;
            this.movieFon.stop();
            this.movieFon.textLocked.stop();
            this.movieFon.pic.gotoAndStop(_loc2_.ownNumber);
            (this.movieFon.textAch as TextField).text = _loc4_;
            this.mainParent.addChild(this.movieFon);
            this.movieFon.addEventListener(Event.ENTER_FRAME,this.appearanceBadge);
         }
      }
      
      private function appearanceBadge(param1:Event) : void
      {
         this.bAlpha += 0.06;
         this.movieFon.alpha = this.bAlpha;
         if(this.bAlpha > 3)
         {
            this.movieFon.removeEventListener(Event.ENTER_FRAME,this.appearanceBadge);
            this.movieFon.addEventListener(Event.ENTER_FRAME,this.disappearance);
         }
      }
      
      private function disappearance(param1:Event) : void
      {
         this.bAlpha -= 0.07;
         this.movieFon.alpha = this.bAlpha;
         if(this.bAlpha < 0)
         {
            this.movieFon.removeEventListener(Event.ENTER_FRAME,this.disappearance);
            this.mainParent.removeChild(this.movieFon);
            this.arrBadges.splice(0,1);
            this.isShowNow = false;
         }
      }
      
      public function destroy() : void
      {
         this.movieFon.removeEventListener(Event.ENTER_FRAME,this.disappearance);
         this.movieFon.removeEventListener(Event.ENTER_FRAME,this.appearanceBadge);
         removeEventListener(Event.ENTER_FRAME,this.update);
         this.arrBadges = null;
         this.badge = null;
      }
   }
}

