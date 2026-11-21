package StructureGame
{
   import ActionsBeforeGame.ClassPreloader;
   import StructureGame.InterfaceGame.ClassButtonSound;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class ClassMainMenu extends ClassBaseStructureGameElement
   {
      
      private var currentEvent:String;
      
      private var myQuation:ClassQuations;
      
      private var movieMenu:MovieClip;
      
      private var but_play:SimpleButton;
      
      private var but_create:SimpleButton;
      
      private var but_credits:SimpleButton;
      
      private var but_more:SimpleButton;
      
      private var but_addweb:SimpleButton;
      
      private var but_highscore:SimpleButton;
      
      private var buttonSound:ClassButtonSound;
      
      private var but_badges:SimpleButton;
      
      private var but_logo:SimpleButton;
      
      private var but_bubbleNameGame:SimpleButton;
      
      private var button_showGameLevels:MovieClip;
      
      public const pressPlay:String = "pressPlay";
      
      public const pressCreate:String = "pressCreate";
      
      public const pressCredits:String = "pressCredits";
      
      public const pressMoregame:String = "pressMoregame";
      
      public const pressAddweb:String = "pressAddweb";
      
      public const pressHighscore:String = "pressHighscore";
      
      public const pressBadges:String = "pressBadges";
      
      public const showCodeLevels:String = "showCodeLevels";
      
      public const SOUND_ON:String = "SOUND_ON";
      
      public const SOUND_OFF:String = "SOUND_OFF";
      
      public const MUSIC_ON:String = "MUSIC_ON";
      
      public const MUSIC_OFF:String = "MUSIC_OFF";
      
      public function ClassMainMenu(param1:Boolean = true, param2:Boolean = true)
      {
         super("main_menu");
         ControlSounds.stopAllSounds();
         ControlSounds.setChangeValumeMusic("mGame01",0,0.05);
         ControlSounds.setChangeValumeMusic("mGame02",0,0.05);
         ControlSounds.setChangeValumeMusic("mGame03",0,0.05);
         ControlSounds.playMusic("mMenu",ClassSetDataGame.volumeMusMenu,0);
         this.but_play = (movie as Object).b.but_play;
         this.but_credits = (movie as Object).b.but_credits;
         this.but_more = (movie as Object).b.but_more;
         this.but_addweb = (movie as Object).b.but_site;
         this.but_highscore = (movie as Object).b.but_highscore;
         this.but_badges = (movie as Object).b.but_badges;
         this.button_showGameLevels = (movie as Object).button_showGameLevels;
         this.button_showGameLevels.visible = ClassFlags.isVisibleEdit;
         this.button_showGameLevels.alpha = 0;
         this.but_logo = (movie as Object).bubble_menu;
         this.but_logo.visible = ClassFlags.isShowLogo;
         this.setListenersForButtons();
         movie.version.text = ClassFlags.version;
         movie.cacheAsBitmap = true;
         ClassPreloader.showLogo(this);
      }
      
      private function pressInButSound(param1:Event) : void
      {
         switch(this.buttonSound.EVENT_PressButton)
         {
            case this.buttonSound.MUSIC_ON:
               this.musicOn(param1);
               break;
            case this.buttonSound.MUSIC_OFF:
               this.musicOff(param1);
               break;
            case this.buttonSound.SOUND_ON:
               this.soundOn(param1);
               break;
            case this.buttonSound.SOUND_OFF:
               this.soundOff(param1);
         }
      }
      
      private function setListenersForButtons() : void
      {
         this.but_play.addEventListener(MouseEvent.CLICK,this.playGame);
         this.but_more.addEventListener(MouseEvent.CLICK,this.moreGame);
         this.but_addweb.addEventListener(MouseEvent.CLICK,this.addWeb);
         this.but_highscore.addEventListener(MouseEvent.CLICK,this.highscoreGame);
         this.button_showGameLevels.addEventListener(MouseEvent.CLICK,this.showGameLevels);
         this.but_logo.addEventListener(MouseEvent.CLICK,this.gotoBubble);
         movie.b.options.addEventListener(MouseEvent.CLICK,this.showOptions);
         movie.b.credits.addEventListener(MouseEvent.CLICK,this.showCredits);
         this.but_badges.addEventListener(MouseEvent.CLICK,this.badgesGame);
         movie.links.a1.addEventListener(MouseEvent.CLICK,this.setA1);
         movie.links.a2.addEventListener(MouseEvent.CLICK,this.setA2);
         movie.links.a3.addEventListener(MouseEvent.CLICK,this.setA3);
         movie.links.a4.addEventListener(MouseEvent.CLICK,this.setA4);
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
      
      private function showOptions(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         var _loc2_:ClassOptions = new ClassOptions();
         addChild(_loc2_);
         addChild(ClassPreloader.logo);
      }
      
      private function showCredits(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         var _loc2_:ClassSocial = new ClassSocial();
         addChild(_loc2_);
         addChild(ClassPreloader.logo);
      }
      
      private function gotoBubbleGame(param1:MouseEvent) : void
      {
         var _loc2_:String = "http://www.notdoppler.com/?ref=rolypolycannonbmp2";
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_,"_blank");
      }
      
      private function gotoBubble(param1:MouseEvent) : void
      {
         var _loc2_:String = "http://www.notdoppler.com/?ref=rolypolycannonbmp2";
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_,"_blank");
      }
      
      private function showGameLevels(param1:MouseEvent) : void
      {
         isShowDamping = false;
         this.extinction(this.showCodeLevels);
      }
      
      private function playGame(param1:MouseEvent) : void
      {
         trace("playGame");
         this.extinction(this.pressPlay);
         this.currentEvent = this.pressPlay;
      }
      
      private function createGame(param1:MouseEvent) : void
      {
         this.extinction(this.pressCreate);
      }
      
      override public function extinction(param1:String) : void
      {
         super.extinction(param1);
         ButtonsCkick.play();
      }
      
      private function creditsGame(param1:MouseEvent) : void
      {
         this.extinction(this.pressCredits);
      }
      
      private function moreGame(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkMore();
      }
      
      private function addWeb(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkAddSite();
      }
      
      private function highscoreGame(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
      }
      
      private function badgesGame(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         this.extinction(this.pressBadges);
      }
      
      private function musicOn(param1:Event) : void
      {
         isShowDamping = false;
         this.extinction(this.MUSIC_ON);
      }
      
      private function musicOff(param1:Event) : void
      {
         isShowDamping = false;
         this.extinction(this.MUSIC_OFF);
      }
      
      private function soundOn(param1:Event) : void
      {
         isShowDamping = false;
         this.extinction(this.SOUND_ON);
      }
      
      private function soundOff(param1:Event) : void
      {
         isShowDamping = false;
         this.extinction(this.SOUND_OFF);
      }
      
      override public function destroy() : void
      {
         ControlSounds.stopMusic("musGame");
         ControlSounds.stopMusic("musGame2");
         ControlSounds.stopAllSounds();
         this.but_play.removeEventListener(MouseEvent.CLICK,this.playGame);
         movie.links.a1.removeEventListener(MouseEvent.CLICK,this.setA1);
         movie.links.a2.removeEventListener(MouseEvent.CLICK,this.setA2);
         movie.links.a3.removeEventListener(MouseEvent.CLICK,this.setA3);
         movie.links.a4.removeEventListener(MouseEvent.CLICK,this.setA4);
         this.but_more.removeEventListener(MouseEvent.CLICK,this.moreGame);
         this.but_addweb.removeEventListener(MouseEvent.CLICK,this.addWeb);
         this.but_highscore.removeEventListener(MouseEvent.CLICK,this.highscoreGame);
         if(this.but_badges)
         {
            this.but_badges.removeEventListener(MouseEvent.CLICK,this.badgesGame);
         }
         this.button_showGameLevels.removeEventListener(MouseEvent.CLICK,this.showGameLevels);
         this.but_logo.removeEventListener(MouseEvent.CLICK,this.gotoBubble);
         movie.b.options.removeEventListener(MouseEvent.CLICK,this.showOptions);
         this.but_bubbleNameGame = null;
         this.buttonSound = null;
         this.but_play = null;
         this.but_credits = null;
         this.but_more = null;
         this.but_addweb = null;
         this.but_highscore = null;
         this.but_badges = null;
         this.but_logo = null;
         this.currentEvent = null;
         super.destroy();
      }
   }
}

