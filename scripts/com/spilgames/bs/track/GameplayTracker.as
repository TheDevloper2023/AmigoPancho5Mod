package com.spilgames.bs.track
{
   public class GameplayTracker extends ATracker
   {
      
      private static var _instance:GameplayTracker;
      
      public function GameplayTracker(param1:Private)
      {
         super();
         eventType = "game";
      }
      
      public static function getInstance() : GameplayTracker
      {
         if(!_instance)
         {
            _instance = new GameplayTracker(new Private());
         }
         return _instance;
      }
      
      public function startGame() : void
      {
         call(SpilTrackEvent.GAME_START);
      }
      
      public function levelStart(param1:String = "", param2:Object = null) : void
      {
         if(!param2)
         {
            param2 = new Object();
         }
         param2.level = param1;
         call(SpilTrackEvent.GAME_LEVEL_START,param2);
      }
      
      public function levelComplete(param1:Object) : void
      {
         call(SpilTrackEvent.GAME_LEVEL_FINISH,param1);
      }
      
      public function levelFailed(param1:Object) : void
      {
         call(SpilTrackEvent.GAME_LEVEL_FAIL,param1);
      }
      
      public function worldStart(param1:String) : void
      {
         call(SpilTrackEvent.GAME_WORLD_START,{"level":param1});
      }
      
      public function worldComplete(param1:Object) : void
      {
         call(SpilTrackEvent.GAME_WORLD_FINISH,param1);
      }
      
      public function scene(param1:String) : void
      {
         call(SpilTrackEvent.GAME_SCENE,{"scene":param1});
      }
      
      public function milestone(param1:String) : void
      {
         call(SpilTrackEvent.GAME_MILESTONE,{"milestone":param1});
      }
      
      public function objectiveReached(param1:String) : void
      {
         call(SpilTrackEvent.GAME_OBJECTIVE,{"objective":param1});
      }
      
      public function setting(param1:String) : void
      {
         call(SpilTrackEvent.GAME_SETTINGS,{"setting":param1});
      }
      
      public function winGame() : void
      {
         call(SpilTrackEvent.GAME_WIN);
      }
      
      public function resetGame() : void
      {
         call(SpilTrackEvent.GAME_RESET);
      }
      
      public function quitGame() : void
      {
         call(SpilTrackEvent.GAME_QUIT);
      }
      
      public function loseGame() : void
      {
         call(SpilTrackEvent.GAME_LOSE);
      }
      
      public function tutorialFinished() : void
      {
         call(SpilTrackEvent.GAME_TUTORIAL_FINISH);
      }
      
      public function tutorialStep(param1:String) : void
      {
         call(SpilTrackEvent.GAME_TUTORIAL_STEP,{"step":param1});
      }
      
      public function buttonPressed(param1:String) : void
      {
         call(SpilTrackEvent.GAME_BUTTON_PRESS,{"name":param1});
      }
      
      public function itemObtained(param1:String) : void
      {
         call(SpilTrackEvent.GAME_ITEM_GET,{"name":param1});
      }
      
      public function itemSetting(param1:String) : void
      {
         call(SpilTrackEvent.GAME_ITEM_SET,{"setting":param1});
      }
      
      public function pauseGame() : void
      {
         call(SpilTrackEvent.GAME_PAUSE);
      }
      
      public function resumeGame() : void
      {
         call(SpilTrackEvent.GAME_PAUSE);
      }
      
      public function feature(param1:String) : void
      {
         call(SpilTrackEvent.GAME_FEATURE,{"name":param1});
      }
      
      public function score(param1:String) : void
      {
         call(SpilTrackEvent.GAME_SCORE,{"score":param1});
      }
      
      public function highScore(param1:String) : void
      {
         call(SpilTrackEvent.GAME_HIGHSCORE,{"score":param1});
      }
      
      public function newRecord(param1:String) : void
      {
         call(SpilTrackEvent.GAME_NEW_RECORD,{"score":param1});
      }
      
      public function heartbeat(param1:Object = null) : void
      {
         call(SpilTrackEvent.GAME_HEARTBEAT,param1);
      }
      
      public function __custom(param1:Object) : void
      {
         call(SpilTrackEvent.GAME_CUSTOM,param1);
      }
   }
}

class Private
{
   
   public function Private()
   {
      super();
   }
}
