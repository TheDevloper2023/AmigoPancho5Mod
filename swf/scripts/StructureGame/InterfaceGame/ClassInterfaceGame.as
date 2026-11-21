package StructureGame.InterfaceGame
{
   import MenuGame.ClassMenuGame;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassInterfaceGame extends Sprite
   {
      
      public const RESET:String = "RESET";
      
      public const MENU:String = "MENU";
      
      public const SELECTOR:String = "SELECTOR";
      
      public const NEXT_LEVEL:String = "NEXT_LEVEL";
      
      public const EDITOR:String = "EDITOR";
      
      public const TUTORIAL:String = "TUTORIAL";
      
      public const ACHI:String = "ACHI";
      
      public const INTERFACE_EVENT:String = "INTERFACE_EVENT";
      
      public const STOP_SCREEN:String = "STOP_SCREEN";
      
      public var nameCurEvent:String = "";
      
      private var objectLevelMessage:ClassLevelMessage;
      
      private var objectRecord:ClassNewRecord;
      
      private var objectGameMenu:ClassMenuGame;
      
      private var objectLevelCompleteScreen:ClassLevelCompleteScreen;
      
      private var objectButtonSound:ClassButtonSound;
      
      private var objectComplete:ClassComplete;
      
      internal var objBtnMore:ClassBtnMore;
      
      private var isLevelWin:Boolean;
      
      private var numLevel:int;
      
      private var scoreLevel:int;
      
      private var oldScoreLevel:int;
      
      private var oldScoreTotal:int;
      
      private var scoreTotal:int;
      
      private var countStarsWas:int;
      
      private var pauseMore:int;
      
      public function ClassInterfaceGame()
      {
         super();
      }
      
      public function init(param1:String, param2:int, param3:Number) : void
      {
         this.objectLevelMessage = new ClassLevelMessage();
         this.objectRecord = new ClassNewRecord();
         this.objectGameMenu = new ClassMenuGame();
         this.objectButtonSound = new ClassButtonSound();
         this.objectLevelMessage;
         addChild(this.objectLevelMessage);
         this.objectRecord.x = 350;
         this.objectRecord.y = 230;
         addChild(this.objectRecord);
         this.objectGameMenu.setTotalScores(param3.toString());
         this.objectGameMenu.setLevelScores(param2.toString());
         this.objectGameMenu.setLevelName(param1);
         addChild(this.objectGameMenu);
         this.objectGameMenu.addEventListener(this.objectGameMenu.START_EVENT,this.eventFromGameMenu);
         this.objectButtonSound.setPosition(new Point(430,483),new Point(470,483));
         this.objectButtonSound.visible = true;
         this.objectGameMenu.objedButtons(this.objectButtonSound);
      }
      
      public function getScoreTable() : Array
      {
         return this.objectGameMenu.getScoreTable();
      }
      
      public function hideButtonsInGameMenu() : void
      {
         this.objectGameMenu.hideButtons();
      }
      
      public function putLogo(param1:Sprite) : void
      {
         this.objectGameMenu.putLogo(param1);
      }
      
      private function eventFromGameMenu(param1:Event) : void
      {
         switch(this.objectGameMenu.curEvent)
         {
            case this.objectGameMenu.MENU:
               this.startEvent(this.MENU);
               break;
            case this.objectGameMenu.RESET:
               this.startEvent(this.RESET);
               break;
            case this.objectGameMenu.SELECTOR:
               this.startEvent(this.SELECTOR);
               break;
            case this.objectGameMenu.NEXT:
               this.startEvent(this.NEXT_LEVEL);
               break;
            case this.objectGameMenu.EDITOR:
               this.startEvent(this.EDITOR);
               break;
            case this.objectGameMenu.TUTORIAL:
               this.startEvent(this.TUTORIAL);
               break;
            case this.objectGameMenu.ACHI:
               this.startEvent(this.ACHI);
         }
      }
      
      public function showScore(param1:int) : void
      {
         this.objectGameMenu.setLevelScores(param1.toString());
      }
      
      public function showLevelComplete(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.isLevelWin = param1;
         this.numLevel = param2;
         this.scoreLevel = param3;
         this.oldScoreLevel = param4;
         this.oldScoreTotal = param5;
         this.scoreTotal = param6;
         this.countStarsWas = param7;
         this.objectComplete = new ClassComplete();
         addChild(this.objectComplete);
         this.objBtnMore = new ClassBtnMore();
         addChild(this.objBtnMore);
         addEventListener(Event.ENTER_FRAME,this.waitMore);
      }
      
      private function waitMore(param1:Event) : void
      {
         if(++this.pauseMore > 30)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitMore);
            this.objectComplete.start(this.isLevelWin,this.numLevel,this.scoreLevel,this.oldScoreLevel,this.oldScoreTotal,this.scoreTotal);
            this.objectComplete.addEventListener(this.objectComplete.EVENT,this.eventFromComplete);
         }
      }
      
      private function eventFromComplete(param1:Event) : void
      {
         switch(this.objectComplete.nameEvent)
         {
            case "RESET":
               this.startEvent(this.RESET);
               break;
            case "SELECTOR":
               this.startEvent(this.SELECTOR);
               break;
            case "NEXT":
               this.startEvent(this.NEXT_LEVEL);
               break;
            case "TUTORIAL":
               this.startEvent(this.TUTORIAL);
               break;
            case "ACHI":
               this.startEvent(this.ACHI);
         }
      }
      
      public function showRecord() : void
      {
         this.objectRecord.start(40);
      }
      
      private function startEvent(param1:String) : void
      {
         this.nameCurEvent = param1;
         dispatchEvent(new Event(this.INTERFACE_EVENT));
      }
      
      public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.waitMore);
         if(this.objBtnMore)
         {
            this.objBtnMore.parent.removeChild(this.objBtnMore);
            this.objBtnMore.destroy();
            this.objBtnMore = null;
         }
         if(this.objectComplete)
         {
            this.objectComplete.removeEventListener(this.objectComplete.EVENT,this.eventFromComplete);
            this.objectComplete.parent.removeChild(this.objectComplete);
            this.objectComplete.destroy();
            this.objectComplete = null;
         }
         this.objectGameMenu.removeEventListener(this.objectGameMenu.START_EVENT,this.eventFromGameMenu);
         while(numChildren)
         {
            removeChildAt(0);
         }
         this.objectLevelMessage.destroy();
         this.objectLevelMessage = null;
         this.objectRecord.destroy();
         this.objectRecord = null;
         this.objectGameMenu.destroy();
         this.objectGameMenu = null;
         this.objectButtonSound.destroy();
         this.objectButtonSound = null;
      }
   }
}

