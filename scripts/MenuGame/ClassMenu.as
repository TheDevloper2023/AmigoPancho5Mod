package MenuGame
{
   import Tela.ClassBaseGameObject;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class ClassMenu extends ClassBaseGameObject
   {
      
      public const RESET:String = "reset";
      
      public const MENU:String = "menu";
      
      public const SELECTOR:String = "selector";
      
      public const TEST:String = "test";
      
      public const SEND:String = "send";
      
      public const SAVE:String = "save";
      
      public const SHARE:String = "share";
      
      public const LOAD:String = "load";
      
      public const CLEAR:String = "clear";
      
      public const NEXT:String = "next";
      
      public const EDITOR:String = "editor";
      
      public const UNDO:String = "undo";
      
      public const CREATE:String = "CREATE";
      
      public const IMPORT:String = "IMPORT";
      
      public const PLAY_RC3:String = "PLAY_RC3";
      
      public const TUTORIAL:String = "TUTORIAL";
      
      public const ACHI:String = "ACHI";
      
      public const CTRL:String = "CTRL";
      
      public var scoresTextField:TextField;
      
      public var curEvent:String;
      
      public const START_EVENT:String = "EVENT_PRESS";
      
      public var nameLevel:TextField;
      
      public var nickLevel:TextField;
      
      private var cousseFlash:int = 1;
      
      private var textColor:uint;
      
      public function ClassMenu(param1:String)
      {
         super(param1);
         this.nameLevel = (movie as Object).nameLevel;
         this.nickLevel = (movie as Object).nickLevel;
         this.scoresTextField = (movie as Object).scores;
         this.textColor = this.scoresTextField.textColor;
         this.setListeners();
      }
      
      public function setFlashScores() : void
      {
         addEventListener(Event.ENTER_FRAME,this.flashScores);
         this.scoresTextField.textColor = 16750950;
      }
      
      private function flashScores(param1:Event) : void
      {
         if(ClassPaused.isPaused)
         {
            return;
         }
         this.scoresTextField.scaleX += 0.04 * this.cousseFlash;
         this.scoresTextField.scaleY += 0.04 * this.cousseFlash;
         if(this.scoresTextField.scaleX > 1.15)
         {
            this.cousseFlash = -1;
         }
         if(this.scoresTextField.scaleX < 1)
         {
            this.scoresTextField.scaleX = 1;
            this.scoresTextField.scaleY = 1;
            this.cousseFlash = 1;
            removeEventListener(Event.ENTER_FRAME,this.flashScores);
            this.scoresTextField.textColor = this.textColor;
         }
      }
      
      public function setPositionNameLevel(param1:Point) : void
      {
         this.nameLevel.x = param1.x;
         this.nameLevel.y = param1.y;
      }
      
      public function setLevelScores(param1:String) : void
      {
         while(param1.length < 4)
         {
            param1 = "0" + param1;
         }
         this.scoresTextField.text = param1;
      }
      
      public function showHideAllbuttons(param1:Boolean) : void
      {
         var _loc3_:SimpleButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < movie.numChildren)
         {
            _loc3_ = movie.getChildAt(_loc2_) as SimpleButton;
            if(_loc3_)
            {
               _loc3_.visible = param1;
            }
            _loc2_++;
         }
      }
      
      public function setLevelName(param1:String) : void
      {
         this.nameLevel.text = "lvl: " + param1;
      }
      
      public function setNickName(param1:String) : void
      {
         this.nickLevel.text = param1;
      }
      
      internal function setListeners() : void
      {
      }
      
      internal function goNext(param1:MouseEvent) : void
      {
         this.curEvent = this.NEXT;
         this.eventPressButton();
      }
      
      internal function goApp(param1:MouseEvent) : void
      {
      }
      
      internal function goEditor(param1:MouseEvent) : void
      {
         this.curEvent = this.EDITOR;
         this.eventPressButton();
      }
      
      internal function goReset(param1:MouseEvent) : void
      {
         this.curEvent = this.RESET;
         this.eventPressButton();
      }
      
      internal function goMenu(param1:MouseEvent) : void
      {
         this.curEvent = this.MENU;
         this.eventPressButton();
      }
      
      internal function goCtrl(param1:MouseEvent) : void
      {
         this.curEvent = this.CTRL;
         this.eventPressButton();
      }
      
      internal function goSelector(param1:MouseEvent) : void
      {
         this.curEvent = this.SELECTOR;
         this.eventPressButton();
      }
      
      internal function goSponsor(param1:MouseEvent) : void
      {
         ClassLinks.goToLink("Gameplay_Logo");
      }
      
      internal function goSolution(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkSolution();
      }
      
      internal function goTest(param1:MouseEvent) : void
      {
         this.curEvent = this.TEST;
         this.eventPressButton();
      }
      
      internal function goSave(param1:MouseEvent) : void
      {
         this.curEvent = this.SAVE;
         this.eventPressButton();
      }
      
      internal function goShare(param1:MouseEvent) : void
      {
         this.curEvent = this.SHARE;
         this.eventPressButton();
      }
      
      internal function goSend(param1:MouseEvent) : void
      {
         this.curEvent = this.SEND;
         this.eventPressButton();
      }
      
      internal function goLoad(param1:MouseEvent) : void
      {
         this.curEvent = this.LOAD;
         this.eventPressButton();
      }
      
      internal function goClear(param1:MouseEvent) : void
      {
         this.curEvent = this.CLEAR;
         this.eventPressButton();
      }
      
      internal function goUndo(param1:MouseEvent) : void
      {
         this.curEvent = this.UNDO;
         this.eventPressButton();
      }
      
      internal function goImport(param1:MouseEvent) : void
      {
         this.curEvent = this.IMPORT;
         this.eventPressButton();
      }
      
      internal function goCreate(param1:MouseEvent) : void
      {
         this.curEvent = this.CREATE;
         this.eventPressButton();
      }
      
      internal function goPlayRC3(param1:MouseEvent) : void
      {
         this.curEvent = this.PLAY_RC3;
         this.eventPressButton();
      }
      
      internal function goTutorial(param1:MouseEvent) : void
      {
         this.curEvent = this.TUTORIAL;
         this.eventPressButton();
      }
      
      internal function goAchi(param1:MouseEvent) : void
      {
         this.curEvent = this.ACHI;
         this.eventPressButton();
      }
      
      private function eventPressButton() : void
      {
         ButtonsCkick.play();
         dispatchEvent(new Event(this.START_EVENT));
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.flashScores);
         while(movie.numChildren)
         {
            movie.removeChildAt(0);
         }
         removeChild(movie);
         movie = null;
         this.scoresTextField = null;
         this.nameLevel = null;
         this.nickLevel = null;
         super.destroy();
      }
   }
}

