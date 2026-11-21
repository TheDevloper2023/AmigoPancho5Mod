package StructureGame
{
   import ActionsBeforeGame.ClassPreloader;
   import Badges.ClassControllBadges;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ClassGameOver extends ClassDamping
   {
      
      public const MENU:String = "MENU";
      
      private var movie:MovieClip;
      
      private var inputhigh:TextField;
      
      private var menu_but:SimpleButton;
      
      private var but_logo:SimpleButton;
      
      private var currentEvent:String;
      
      private var timerWait:int;
      
      private var objectAchi:ClassControllBadges;
      
      private var pauseFerk:int = 70;
      
      public function ClassGameOver()
      {
         super();
         var _loc1_:Class = amigo5.swfMoviesStructur.getAssetClass("pozdravlenie");
         this.movie = new _loc1_();
         this.inputhigh = (this.movie as Object).inputhigh;
         this.menu_but = (this.movie as Object).but_menu;
         this.but_logo = (this.movie as Object).sponsor;
         this.but_logo.visible = ClassFlags.isShowLogo;
         this.inputhigh.text = ClassSetDataGame.totalScore.toString();
         action(this.movie,ACTION_APPEARANCE);
         addEventListener(EVENT_COMPLETED,this.appearanceCompleted);
         addChild(this.movie);
         (this.movie as Object).btnsubmit5.visible = true;
         ControlSounds.stopMusic("musGame");
         ControlSounds.stopMusic("musGame2");
         ControlSounds.stopMusic("musGame3");
         ControlSounds.stopMusic("musGame4");
         ControlSounds.playSound("end",1);
         addEventListener(Event.ENTER_FRAME,this.waitFerk);
         this.objectAchi = new ClassControllBadges(this);
         this.objectAchi.updateBadges(-1,ClassInformGame.EVENT_GAMEOVER,-1);
         ClassFlags.isGameOver = false;
         ControlSounds.stopAllSounds();
         ControlSounds.setChangeValumeMusic("mGame01",0,0.05);
         ControlSounds.setChangeValumeMusic("mGame02",0,0.05);
         ControlSounds.setChangeValumeMusic("mGame03",0,0.05);
         ControlSounds.playMusic("mMenu",ClassSetDataGame.volumeMusMenu,0);
         ClassPreloader.showLogo(this);
      }
      
      private function waitFerk(param1:Event) : void
      {
      }
      
      private function appearanceCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.appearanceCompleted);
         this.menu_but.addEventListener(MouseEvent.CLICK,this.pressMenu);
         this.but_logo.addEventListener(MouseEvent.CLICK,this.pressBubble);
         (this.movie as Object).btnsubmit5.addEventListener(MouseEvent.CLICK,this.goAPI);
         (this.movie as Object).but_more.addEventListener(MouseEvent.CLICK,this.goMore);
         this.movie.but_walk.addEventListener(MouseEvent.CLICK,this.goWalk);
         addEventListener(Event.ENTER_FRAME,this.update);
         this.movie.a1.addEventListener(MouseEvent.CLICK,this.setA1);
         this.movie.a2.addEventListener(MouseEvent.CLICK,this.setA2);
         this.movie.a3.addEventListener(MouseEvent.CLICK,this.setA3);
         this.movie.a4.addEventListener(MouseEvent.CLICK,this.setA4);
         this.movie.like.addEventListener(MouseEvent.CLICK,this.goLike);
      }
      
      private function goLike(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkLike();
      }
      
      private function setA1(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo1");
      }
      
      private function setA2(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo2");
      }
      
      private function setA3(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo3");
      }
      
      private function setA4(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToGameLink("amigo4");
      }
      
      private function update(param1:Event) : void
      {
      }
      
      private function goWalk(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkSolution();
      }
      
      private function goAPI(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
      }
      
      private function goMore(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkMore();
      }
      
      private function pressBubble(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLink("GameOver_Logo");
      }
      
      private function pressMenu(param1:MouseEvent) : void
      {
         this.extinction(this.MENU);
      }
      
      private function extinction(param1:String) : void
      {
         ButtonsCkick.play();
         this.currentEvent = param1;
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
         this.objectAchi.destroy();
         this.objectAchi = null;
         removeEventListener(Event.ENTER_FRAME,this.update);
         (this.movie as Object).but_more.removeEventListener(MouseEvent.CLICK,this.goMore);
         this.movie.a1.removeEventListener(MouseEvent.CLICK,this.setA1);
         this.movie.a2.removeEventListener(MouseEvent.CLICK,this.setA2);
         this.movie.a3.removeEventListener(MouseEvent.CLICK,this.setA3);
         this.movie.a4.removeEventListener(MouseEvent.CLICK,this.setA4);
         this.movie.like.removeEventListener(MouseEvent.CLICK,this.goLike);
         ControlSounds.stopSound("gameover");
         ControlSounds.stopSound("ferk");
         ControlSounds.stopAllSounds();
         this.menu_but.removeEventListener(MouseEvent.CLICK,this.pressMenu);
         (this.movie as Object).btnsubmit5.removeEventListener(MouseEvent.CLICK,this.goAPI);
         this.movie.but_walk.removeEventListener(MouseEvent.CLICK,this.goWalk);
         removeEventListener(EVENT_COMPLETED,this.appearanceCompleted);
         removeEventListener(Event.ENTER_FRAME,this.waitFerk);
         this.menu_but = null;
         while(this.movie.numChildren)
         {
            this.movie.removeChildAt(0);
         }
         removeChild(this.movie);
         this.movie = null;
         this.inputhigh = null;
      }
   }
}

