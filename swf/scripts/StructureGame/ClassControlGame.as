package StructureGame
{
   import Badges.ClassControllBadges;
   import EditorLevels.ClassDoLevel;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import PlayLevels.amigoPancho.ClassSliderStart;
   import StructureGame.InterfaceGame.ClassButtonSound;
   import StructureGame.InterfaceGame.ClassInterfaceGame;
   import com.spilgames.api.ScoreService;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassControlGame extends ClassDamping
   {
      
      public static var isScreenUpLevelHere:Boolean;
      
      public static var numLevel:Number;
      
      public static var instance:Sprite;
      
      public static var spriteForPlashka:Sprite;
      
      public static var objectAchi:ClassControllBadges;
      
      public var nameCurEvent:String = "";
      
      public const EDITOR:String = "EDITOR";
      
      public const MENU:String = "MENU";
      
      public const RESET:String = "RESET";
      
      public const SELECTOR:String = "SELECTOR";
      
      public const CREATE:String = "CREATE";
      
      public const PLAY_RC3:String = "PLAY_RC3";
      
      public const GAMEOVER:String = "GAMEOVER";
      
      public const SOUND_ON:String = "SOUND_ON";
      
      public const SOUND_OFF:String = "SOUND_OFF";
      
      public const MUSIC_ON:String = "MUSIC_ON";
      
      public const MUSIC_OFF:String = "MUSIC_OFF";
      
      public const NEXT:String = "NEXT";
      
      public const TUTORIAL:String = "TUTORIAL";
      
      public const CONTROLGAME_EVENT:String = "CONTROLGAME_EVENT";
      
      public const ACHI:String = "ACHI";
      
      private var isNextLevel:Boolean;
      
      private var isReset:Boolean;
      
      private var rezhim:String;
      
      private var xmlLevel:XML;
      
      private var doLevel:ClassDoLevel;
      
      private var objectLevel:ClassBaseLevel;
      
      private var movieLevel:MovieClip;
      
      private var menuObject:Object;
      
      private var informGame:ClassInformGame;
      
      private var buttonSound:ClassButtonSound;
      
      private var isMusicPlay:Boolean;
      
      private var isSoundPlay:Boolean;
      
      private var some_event:String;
      
      private var i:int = 0;
      
      private var isLevelComplete:Boolean;
      
      private var isTestMouseOverMenu:Boolean;
      
      private var isDumpingFinish:Boolean;
      
      private var buttonLogoSponsor2:SimpleButton;
      
      private var movieTesting:MovieClip;
      
      private var tempText:String;
      
      private var arrTela:Array;
      
      private var waitAfterEndLevel:int;
      
      private var isEndLevel:Boolean;
      
      private var isJustGameFinish:Boolean;
      
      private var isMadeDeleteStrelka:Boolean;
      
      private var isSoundWater:Boolean;
      
      private var waitSoundWater:int;
      
      private var isOpenAchi:Boolean;
      
      private var numStars:int;
      
      private var isCtrl:Boolean = false;
      
      private var isLoseLevel:Boolean;
      
      private var waitAfterLoseLevel:int;
      
      private var isShowHelp:Boolean = false;
      
      public var objectInterface:ClassInterfaceGame;
      
      private var numLevel:int;
      
      private var scoreLevel:int;
      
      private var scoreTotal:int;
      
      private var oldScoreLevel:int;
      
      private var isForciblyNext:Boolean;
      
      private var isSoundStar:Boolean;
      
      private var timerWaitSoundStar:int = 90;
      
      private var objectSliderStart:ClassSliderStart;
      
      private var objectSlide:ClassSlide;
      
      private var oldScoreTotal:Number;
      
      public function ClassControlGame()
      {
         super();
         instance = this.objectLevel;
      }
      
      public function start() : void
      {
         this.numLevel = ClassSetDataGame.tekLevel;
         this.start1();
      }
      
      public function start1() : void
      {
         spriteForPlashka = new Sprite();
         spriteForPlashka.mouseEnabled = false;
         addChild(spriteForPlashka);
         if(this.numLevel == 1 || this.numLevel == 16)
         {
            this.objectSliderStart = new ClassSliderStart();
            this.objectSliderStart.addEventListener("CLOSE",this.init);
            this.objectSliderStart.addEventListener("DESTROY",this.destroySliderStart);
            spriteForPlashka.addChild(this.objectSliderStart);
            this.objectSliderStart.init([this.numLevel]);
         }
         else
         {
            this.init();
         }
         ClassSetDataGame.savePreviousLevel(this.numLevel);
         action(this,ACTION_APPEARANCE,0.07,false);
      }
      
      public function destroySliderStart(param1:Event = null) : void
      {
         if(this.objectSliderStart != null)
         {
            this.objectSliderStart.removeEventListener("CLOSE",this.init);
            this.objectSliderStart.removeEventListener("DESTROY",this.init);
            this.objectSliderStart.destroy();
            spriteForPlashka.removeChild(this.objectSliderStart);
            this.objectSliderStart = null;
         }
      }
      
      public function init(param1:Event = null) : void
      {
         this.objectLevel = new ClassPlayLevel();
         addChild(this.objectLevel);
         this.objectInterface = new ClassInterfaceGame();
         addChild(this.objectInterface);
         this.objectInterface.y += amigo5.deltaY;
         this.objectInterface.init(this.numLevel.toString(),ClassSetDataGame.startScoreLevel,ClassSetDataGame.totalScore);
         addChild(spriteForPlashka);
         this.objectInterface.addEventListener(this.objectInterface.INTERFACE_EVENT,this.eventFromInterface);
         this.objectLevel.addEventListener(this.objectLevel.EVENT_LEVEL,this.eventFromLevel);
         objectAchi = new ClassControllBadges(this);
      }
      
      private function mouseOverInt(param1:MouseEvent) : void
      {
         this.objectLevel.mouseOverMenu();
      }
      
      private function mouseOutInt(param1:MouseEvent) : void
      {
         this.objectLevel.mouseOutMenu();
      }
      
      private function eventFromLevel(param1:Event) : void
      {
         var _loc2_:int = 0;
         switch(this.objectLevel.nameCurEvent)
         {
            case this.objectLevel.LEVEL_SHOOT:
               break;
            case this.objectLevel.LEVEL_WIN:
               this.completeLevel();
               break;
            case this.objectLevel.CLICK:
               this.objectInterface.hideButtonsInGameMenu();
               break;
            case this.objectLevel.LEVEL_NEXT:
               this.isForciblyNext = true;
               ClassBaseLevel.scores = 0;
               this.completeLevel();
               break;
            case this.objectLevel.LEVEL_RESET:
               this.close(this.RESET);
               break;
            case this.objectLevel.LEVEL_CHANGESCORE:
               _loc2_ = this.objectLevel.getScores();
               this.objectInterface.showScore(_loc2_);
               break;
            case this.objectLevel.LEVEL_LOSE:
               if(Math.random() > 0.5)
               {
               }
               this.close(this.RESET);
         }
      }
      
      private function eventFromInterface(param1:Event) : void
      {
         switch(this.objectInterface.nameCurEvent)
         {
            case this.objectInterface.MENU:
               this.close(this.MENU);
               break;
            case this.objectInterface.RESET:
               this.close(this.RESET);
               break;
            case this.objectInterface.SELECTOR:
               this.close(this.SELECTOR);
               break;
            case this.objectInterface.NEXT_LEVEL:
               this.nextLevelFromWin();
               break;
            case this.objectInterface.EDITOR:
               this.objectLevel.saveXMLStrLevel();
               this.close(this.EDITOR);
               break;
            case this.objectInterface.TUTORIAL:
               this.startEvent(this.TUTORIAL);
               break;
            case this.objectInterface.ACHI:
               this.startEvent(this.ACHI);
               break;
            case this.objectInterface.STOP_SCREEN:
               this.objectLevel.screenScoreStop();
         }
      }
      
      public function nextLevelFromWin() : void
      {
         if(this.numLevel == 15 || this.numLevel == 31)
         {
            trace("nextLevelFromWin");
            this.destroyEventListeners();
            action(this,ACTION_EXTINCTION);
            addEventListener(EVENT_COMPLETED,this.completedNextLevel);
         }
         else
         {
            this.setNextLevel();
         }
      }
      
      private function completedNextLevel(param1:Event) : void
      {
         trace("completedNextLevel");
         removeEventListener(EVENT_COMPLETED,this.completedNextLevel);
         this.destroy();
         ClassSetDataGame.tekLevel = 32;
         this.objectLevel = new ClassPlayLevel();
         this.objectLevel.addEventListener(this.objectLevel.LEVEL_WIN,this.createSlider);
         ClassSetDataGame.saveNumLastLevel(this.numLevel + 1);
         if(this.numLevel == 31)
         {
            ClassSetDataGame.saveNumLastLevel(31);
         }
         else
         {
            ClassSetDataGame.saveNumLastLevel(this.numLevel + 1);
         }
         addChild(this.objectLevel);
         amigo5.mainStage.dispatchEvent(new Event("PRESS_ON_AMIGO"));
         action(this,ACTION_APPEARANCE);
      }
      
      public function createSlider(param1:Event = null) : void
      {
         trace("createSlider " + this.numLevel);
         this.objectLevel.removeEventListener(this.objectLevel.LEVEL_WIN,this.createSlider);
         this.objectSlide = new ClassSlide();
         this.objectSlide.addEventListener("CLOSE",this.setNextLevel);
         addChild(this.objectSlide);
         this.objectSlide.init([this.numLevel]);
      }
      
      public function destroySlider() : void
      {
         if(this.objectSlide != null)
         {
            this.objectSlide.removeEventListener("CLOSE",this.setNextLevel);
            this.objectSlide.destroy();
            removeChild(this.objectSlide);
            this.objectSlide = null;
         }
      }
      
      private function setNextLevel(param1:Event = null) : void
      {
         if(ClassSetDataGame.testAllLevelCompleted() == true)
         {
            if(ClassSetDataGame.isGameFinish == false)
            {
               ClassSetDataGame.setGameFinish();
               this.close(this.GAMEOVER);
               return;
            }
         }
         if(this.numLevel == ClassSetDataGame.kolVoLevels)
         {
            this.close(this.SELECTOR);
            return;
         }
         ClassSetDataGame.saveNumLastLevel(this.numLevel = this.numLevel + 1);
         this.close(this.NEXT);
      }
      
      private function startEvent(param1:String) : void
      {
         this.nameCurEvent = param1;
         dispatchEvent(new Event(this.CONTROLGAME_EVENT));
      }
      
      private function completeLevel() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.scoreLevel = this.objectLevel.getScores();
         this.oldScoreLevel = ClassSetDataGame.getLevelScore(this.numLevel);
         this.oldScoreTotal = ClassSetDataGame.totalScore;
         ClassSetDataGame.setLevelScoresAndTotal(this.numLevel,this.scoreLevel);
         this.scoreTotal = ClassSetDataGame.totalScore;
         ScoreService.submitScore(this.scoreTotal);
         if(this.oldScoreLevel > 0 && this.scoreLevel > this.oldScoreLevel)
         {
            this.objectInterface.showRecord();
         }
         if(this.isForciblyNext)
         {
            if(ClassSetDataGame.testAllLevelCompleted() == true)
            {
               if(ClassSetDataGame.isGameFinish == false)
               {
                  ClassSetDataGame.setGameFinish();
                  this.close(this.GAMEOVER);
                  return;
               }
            }
            this.numLevel += 1;
            if(this.numLevel > ClassSetDataGame.kolVoLevels)
            {
               this.close(this.SELECTOR);
            }
            else
            {
               ClassSetDataGame.saveNumLastLevel(this.numLevel);
               this.close(this.NEXT);
            }
         }
         else
         {
            this.objectInterface.showLevelComplete(true,this.numLevel,this.scoreLevel,this.oldScoreLevel,this.oldScoreTotal,this.scoreTotal,_loc2_);
            this.objectLevel.setCountStars(_loc1_);
         }
      }
      
      private function close(param1:String) : void
      {
         this.nameCurEvent = param1;
         this.destroyEventListeners();
         action(this,ACTION_EXTINCTION);
         addEventListener(EVENT_COMPLETED,this.extinctionCompleted);
      }
      
      private function extinctionCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.extinctionCompleted);
         dispatchEvent(new Event(this.CONTROLGAME_EVENT));
      }
      
      public function destroyLevel() : void
      {
         if(this.objectLevel)
         {
            this.objectLevel.removeEventListener(this.objectLevel.LEVEL_WIN,this.createSlider);
            this.objectLevel.removeEventListener(this.objectLevel.EVENT_LEVEL,this.eventFromLevel);
            this.objectLevel.destroy();
            removeChild(this.objectLevel);
            this.objectLevel = null;
         }
      }
      
      public function destroyInterface() : void
      {
         if(this.objectInterface)
         {
            this.objectInterface.removeEventListener(this.objectInterface.INTERFACE_EVENT,this.eventFromInterface);
            this.objectInterface.removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOverInt);
            this.objectInterface.removeEventListener(MouseEvent.MOUSE_OUT,this.mouseOutInt);
            this.objectInterface.destroy();
            removeChild(this.objectInterface);
            this.objectInterface = null;
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
         this.destroyEventListeners();
         this.destroySliderStart();
         this.destroySlider();
         if(spriteForPlashka)
         {
            spriteForPlashka.parent.removeChild(spriteForPlashka);
            spriteForPlashka = null;
         }
         if(objectAchi)
         {
            objectAchi.destroy();
            objectAchi = null;
         }
         this.destroyInterface();
         this.destroyLevel();
      }
      
      public function destroyEventListeners() : void
      {
         removeEventListener(EVENT_COMPLETED,this.extinctionCompleted);
         removeEventListener(EVENT_COMPLETED,this.completedNextLevel);
         if(this.objectInterface)
         {
            this.objectInterface.removeEventListener(this.objectInterface.INTERFACE_EVENT,this.eventFromInterface);
            this.objectInterface.removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOverInt);
            this.objectInterface.removeEventListener(MouseEvent.MOUSE_OUT,this.mouseOutInt);
         }
         if(this.objectLevel)
         {
            this.objectLevel.removeEventListener(this.objectLevel.LEVEL_WIN,this.createSlider);
            this.objectLevel.removeEventListener(this.objectLevel.EVENT_LEVEL,this.eventFromLevel);
         }
      }
   }
}

