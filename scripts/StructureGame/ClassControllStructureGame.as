package StructureGame
{
   import EditorLevels.*;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassControllStructureGame
   {
      
      public var fp:FPS;
      
      private var mainMenu:ClassMainMenu;
      
      private var createLevels:ClassEditor;
      
      private var controlGame:ClassControlGame;
      
      private var selectorLevels:ClassSelector;
      
      private var badgesShow:ClassShowBadges;
      
      private var gameFinish:ClassGameOver;
      
      private var xmlLevel:XML;
      
      private var isAchiFromMenu:Boolean;
      
      private var isCreatedFromPlayer:Boolean = false;
      
      private var numStepLevel:Number;
      
      private var mainSprite:Sprite;
      
      public function ClassControllStructureGame(param1:Sprite)
      {
         super();
         this.mainSprite = param1;
      }
      
      public function init() : void
      {
         if(ClassFlags.isStartFirstLevel)
         {
            this.playLevel();
         }
         else
         {
            this.createMainMenu();
         }
      }
      
      public function createMainMenu() : void
      {
         this.mainMenu = new ClassMainMenu(ClassSetDataGame.isMusic,ClassSetDataGame.isSound);
         this.mainSprite.addChild(this.mainMenu);
         this.mainMenu.addEventListener(this.mainMenu.pressPlay,this.playGame);
         this.mainMenu.addEventListener(this.mainMenu.pressCreate,this.pressCreateGameInMenu);
         this.mainMenu.addEventListener(this.mainMenu.pressCredits,this.creditsGame);
         this.mainMenu.addEventListener(this.mainMenu.pressBadges,this.pressBadgesInMenu);
         this.mainMenu.addEventListener(this.mainMenu.showCodeLevels,this.showCodeLevels);
      }
      
      private function playGame(param1:Event) : void
      {
         this.destroyMainMenu();
         this.selectorGame();
      }
      
      private function pressBadgesInMenu(param1:Event) : void
      {
         this.destroyMainMenu();
         this.isAchiFromMenu = true;
         this.badgesGame();
      }
      
      private function creditsGame(param1:Event) : void
      {
         var credits:ClassCredits = null;
         var closeCredits:Function = null;
         var e:Event = param1;
         closeCredits = function(param1:Event):void
         {
            credits.removeEventListener(credits.MENU,closeCredits);
            credits.destroy();
            mainSprite.removeChild(credits);
            credits = null;
            createMainMenu();
         };
         this.destroyMainMenu();
         credits = new ClassCredits();
         this.mainSprite.addChild(credits);
         credits.addEventListener(credits.MENU,closeCredits);
      }
      
      private function pressCreateGameInMenu(param1:Event) : void
      {
         this.destroyMainMenu();
         this.goEditor();
      }
      
      private function showCodeLevels(param1:Event) : void
      {
         var movieCode:MovieClip = null;
         var closeCodeText:Function = null;
         var e:Event = param1;
         closeCodeText = function(param1:MouseEvent):void
         {
            movieCode.but_ok.removeEventListener(MouseEvent.CLICK,closeCodeText);
            movieCode.removeChild(movieCode.but_ok);
            mainSprite.removeChild(movieCode);
            movieCode = null;
         };
         var movieClass:Class = amigo5.swfMoviesInterface.getAssetClass("codeLevels");
         movieCode = new movieClass();
         this.mainSprite.addChild(movieCode);
         movieCode.textCode.text = ClassSetDataGame.getCodeGameLevels();
         movieCode.but_ok.addEventListener(MouseEvent.CLICK,closeCodeText);
      }
      
      private function badgesGame() : void
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < ClassSetDataGame.kolVoBadges)
         {
            _loc1_.push(ClassSetDataGame.loadDataBadge(_loc2_ + 1));
            _loc2_++;
         }
         this.badgesShow = new ClassShowBadges(_loc1_);
         this.mainSprite.addChild(this.badgesShow);
         this.badgesShow.addEventListener(this.badgesShow.MENU,this.goMenuFromBadgesShow);
         this.badgesShow.addEventListener(this.badgesShow.LEVEL,this.goGameFromBadgesShow);
      }
      
      private function goGameFromBadgesShow(param1:Event) : void
      {
         var _loc2_:Number = this.badgesShow.getNumLevel();
         ClassSetDataGame.saveNumLastLevel(_loc2_);
         this.destroyBadgesShow();
         this.playLevel();
      }
      
      private function goMenuFromBadgesShow(param1:Event) : void
      {
         this.destroyBadgesShow();
         if(this.isAchiFromMenu)
         {
            this.createMainMenu();
         }
         else
         {
            this.playLevel();
         }
      }
      
      private function goEditor() : void
      {
         this.createLevels = new ClassEditor();
         this.createLevels.startCreate();
         this.createLevels.addEventListener(this.createLevels.MENU,this.goMenuFromCreateLevels);
         this.createLevels.addEventListener(this.createLevels.TEST,this.goTestFromCreateLevels);
         this.createLevels.addEventListener(this.createLevels.SELECTOR,this.goSelectorFromCreateLevels);
         this.mainSprite.addChild(this.createLevels);
      }
      
      private function goMenuFromCreateLevels(param1:Event) : void
      {
         this.destroyCreateLevels();
         this.createMainMenu();
      }
      
      private function goSelectorFromCreateLevels(param1:Event) : void
      {
         this.destroyCreateLevels();
         this.selectorGame();
      }
      
      private function goTestFromCreateLevels(param1:Event) : void
      {
         this.destroyCreateLevels();
         ClassSetDataGame.tekLevel = 0;
         this.playLevel();
      }
      
      private function selectorGame() : void
      {
         this.selectorLevels = new ClassSelector(ClassSetDataGame.massivScores);
         this.mainSprite.addChild(this.selectorLevels);
         this.selectorLevels.addEventListener(this.selectorLevels.MENU,this.goMenuFromSelectorLevels);
         this.selectorLevels.addEventListener(this.selectorLevels.LEVEL,this.goLevelFromSelectorLevels);
         this.selectorLevels.addEventListener(this.selectorLevels.CLEAR,this.pressClearScoresInSelector);
      }
      
      private function pressClearScoresInSelector(param1:Event) : void
      {
         ClassSetDataGame.clearDataGame();
         ClassSetDataGame.SaveAllAchivenetsInFirstTimeGame();
         this.destroySelectorLevels();
         this.selectorGame();
      }
      
      private function goMenuFromSelectorLevels(param1:Event) : void
      {
         this.destroySelectorLevels();
         this.createMainMenu();
      }
      
      private function goLevelFromSelectorLevels(param1:Event) : void
      {
         var _loc2_:Number = this.selectorLevels.getSelectLevel();
         ClassSetDataGame.saveNumLastLevel(_loc2_);
         this.destroySelectorLevels();
         this.playLevel();
      }
      
      public function playLevel() : void
      {
         this.controlGame = new ClassControlGame();
         this.mainSprite.addChild(this.controlGame);
         this.controlGame.start();
         this.controlGame.addEventListener(this.controlGame.CONTROLGAME_EVENT,this.eventFromControlGame);
      }
      
      private function eventFromControlGame(param1:Event) : void
      {
         switch(this.controlGame.nameCurEvent)
         {
            case this.controlGame.GAMEOVER:
               this.destroyControlGame();
               this.goGameOver(param1);
               break;
            case this.controlGame.EDITOR:
               this.pressEditorInControlGame(param1);
               break;
            case this.controlGame.SELECTOR:
               this.pressSelectorInControlGame(param1);
               break;
            case this.controlGame.MENU:
               this.pressMenuInControlGame(param1);
               break;
            case this.controlGame.CREATE:
               this.isCreatedFromPlayer = true;
               this.pressEditorInControlGame(param1);
               break;
            case this.controlGame.ACHI:
               this.goAhiFromGame(param1);
               break;
            case this.controlGame.RESET:
               this.goReset(param1);
               break;
            case this.controlGame.NEXT:
               this.goNext();
         }
      }
      
      private function goNext() : void
      {
         this.destroyControlGame();
         this.playLevel();
      }
      
      private function goReset(param1:Event) : void
      {
         this.destroyControlGame();
         this.playLevel();
      }
      
      private function goAhiFromGame(param1:Event) : void
      {
         this.destroyControlGame();
         this.isAchiFromMenu = false;
         this.badgesGame();
      }
      
      private function pressMenuInControlGame(param1:Event) : void
      {
         this.destroyControlGame();
         this.createMainMenu();
      }
      
      private function pressSelectorInControlGame(param1:Event) : void
      {
         this.destroyControlGame();
         this.selectorGame();
      }
      
      private function pressEditorInControlGame(param1:Event) : void
      {
         this.destroyControlGame();
         this.goEditor();
      }
      
      private function goGameOver(param1:Event = null) : void
      {
         this.gameFinish = new ClassGameOver();
         this.gameFinish.addEventListener(this.gameFinish.MENU,this.goMenuFromGameOver);
         this.mainSprite.addChild(this.gameFinish);
      }
      
      private function goMenuFromGameOver(param1:Event) : void
      {
         this.gameFinish.removeEventListener(this.gameFinish.MENU,this.goMenuFromGameOver);
         this.mainSprite.removeChild(this.gameFinish);
         this.gameFinish.destroy();
         this.gameFinish = null;
         this.createMainMenu();
      }
      
      private function destroyMainMenu() : void
      {
         this.mainMenu.removeEventListener(this.mainMenu.pressPlay,this.playGame);
         this.mainMenu.removeEventListener(this.mainMenu.pressCreate,this.pressCreateGameInMenu);
         this.mainMenu.removeEventListener(this.mainMenu.pressCredits,this.creditsGame);
         this.mainMenu.removeEventListener(this.mainMenu.pressBadges,this.pressBadgesInMenu);
         this.mainMenu.destroy();
         this.mainSprite.removeChild(this.mainMenu);
         this.mainMenu = null;
      }
      
      private function destroyCreateLevels() : void
      {
         this.createLevels.removeEventListener(this.createLevels.MENU,this.goMenuFromCreateLevels);
         this.createLevels.removeEventListener(this.createLevels.TEST,this.goTestFromCreateLevels);
         this.createLevels.removeEventListener(this.createLevels.SELECTOR,this.goSelectorFromCreateLevels);
         this.createLevels.destroy();
         this.mainSprite.removeChild(this.createLevels);
         this.createLevels = null;
      }
      
      private function destroySelectorLevels() : void
      {
         this.selectorLevels.removeEventListener(this.selectorLevels.MENU,this.goMenuFromCreateLevels);
         this.selectorLevels.removeEventListener(this.selectorLevels.LEVEL,this.goLevelFromSelectorLevels);
         this.selectorLevels.removeEventListener(this.selectorLevels.CLEAR,this.pressClearScoresInSelector);
         this.selectorLevels.destroy();
         this.mainSprite.removeChild(this.selectorLevels);
         this.selectorLevels = null;
      }
      
      private function destroyBadgesShow() : void
      {
         this.badgesShow.removeEventListener(this.badgesShow.MENU,this.goMenuFromBadgesShow);
         this.badgesShow.removeEventListener(this.badgesShow.LEVEL,this.goGameFromBadgesShow);
         this.badgesShow.destroy();
         this.mainSprite.removeChild(this.badgesShow);
         this.badgesShow = null;
      }
      
      private function destroyControlGame() : void
      {
         this.controlGame.removeEventListener(this.controlGame.CONTROLGAME_EVENT,this.eventFromControlGame);
         this.controlGame.destroy();
         this.mainSprite.removeChild(this.controlGame);
         this.controlGame = null;
      }
   }
}

