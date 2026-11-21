package StructureGame.InterfaceGame
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class ClassLevelCompleteScreen extends ClassActions
   {
      
      public const MORE_GAME:String = "MORE_GAME";
      
      public const RESET:String = "RESET";
      
      public const NEXT:String = "NEXT";
      
      public const EVENT:String = "START_EVENT";
      
      public var curEvent:String = "";
      
      private var movie:MovieClip;
      
      private var pelena:MovieClip;
      
      private var field_current:TextField;
      
      private var field_best:TextField;
      
      private var field_total:TextField;
      
      private var but_more:SimpleButton;
      
      private var but_next:SimpleButton;
      
      private var but_replay:SimpleButton;
      
      private var button_solution:SimpleButton;
      
      private var pointFinish:Point;
      
      private var pause:int;
      
      private var isMovie:Boolean;
      
      private var countStarsWas:int = 0;
      
      private var curentScore:int = 0;
      
      private var tempScore:int = 0;
      
      private var total:Number;
      
      private var newBestScore:int = 0;
      
      private var numLevel:int;
      
      public var isStart:Boolean;
      
      private var pauseStartLose:uint;
      
      public function ClassLevelCompleteScreen()
      {
         super();
         this.isStart = false;
      }
      
      private function clickSolution(param1:MouseEvent) : void
      {
      }
      
      public function startComplete(param1:int, param2:Boolean, param3:Point, param4:Point) : void
      {
         var _loc5_:Class = amigo5.swfMoviesInterface.getAssetClass("levelUpTabl");
         this.movie = new _loc5_() as MovieClip;
         this.movie.x = param3.x;
         this.movie.y = param3.y;
         this.pointFinish = param4;
         this.field_current = this.movie.scores.current;
         this.field_best = this.movie.scores.best;
         this.field_total = this.movie.scores.total;
         this.pelena = this.movie.pelena;
         this.pelena.alpha = 0;
         this.pelena.visible = false;
         this.but_more = this.movie.butt_more;
         this.but_next = this.movie.button_nextlevel;
         this.but_replay = this.movie.button_replay;
         this.button_solution = this.movie.button_solution;
         this.but_more.addEventListener(MouseEvent.CLICK,this.clickMore);
         this.but_replay.addEventListener(MouseEvent.CLICK,this.clickReplay);
         this.but_next.addEventListener(MouseEvent.CLICK,this.clickNext);
         this.button_solution.addEventListener(MouseEvent.CLICK,this.clickSolution);
         this.button_solution.visible = false;
         this.movie.cacheAsBitmap = true;
         addChild(this.movie);
         this.movie.visible = false;
         this.isMovie = param2;
         this.pause = param1;
         addEventListener(Event.ENTER_FRAME,this.waitStartPause);
      }
      
      public function showLevelAchivment(param1:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:String = null;
         var _loc2_:MovieClip = ClassMath.getCopyMovie(amigo5.swfMoviesStructur,"fon_badge");
         _loc2_.x = -100;
         _loc2_.y = 32;
         _loc2_.stop();
         _loc2_.textLocked.gotoAndStop(1);
         this.movie.addChildAt(_loc2_,3);
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < ClassSetDataGame.kolVoBadges)
         {
            _loc3_.push(ClassSetDataGame.loadDataBadge(_loc4_ + 1));
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = int(_loc5_[0][0][3]);
            if(_loc6_ == this.numLevel)
            {
               _loc7_ = Boolean(_loc5_[1]);
               _loc8_ = _loc5_[2];
               _loc2_.textAch.text = _loc8_;
               _loc2_.textLocked.stop();
               _loc2_.textLocked.visible = true;
               if(!_loc7_)
               {
                  _loc2_.gotoAndStop(2);
                  _loc2_.textLocked.gotoAndStop(2);
               }
               else
               {
                  _loc2_.pic.gotoAndStop(_loc4_ + 1);
                  _loc2_.gotoAndStop(1);
                  _loc2_.textLocked.gotoAndStop(1);
               }
               this.movie.scores.y -= 13;
               return;
            }
            _loc4_++;
         }
         _loc2_.visible = false;
      }
      
      private function waitStartPause(param1:Event) : void
      {
         if(this.pause-- < 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitStartPause);
            if(this.isMovie)
            {
               this.movie.visible = true;
               startMoveMovie(this.movie,this.pointFinish,8);
               ControlSounds.playSound("screenMove",0.5);
               addEventListener(STOP_MOVE,this.screenStop);
            }
            else
            {
               this.movie.visible = true;
               alpha = 0;
               this.movie.x = this.pointFinish.x;
               this.movie.y = this.pointFinish.y;
               startAlphaFrom0Movie(this,1,0.1);
               addEventListener(STOP_ALPHA,this.startPelenaBlack);
            }
         }
      }
      
      public function startPelenaBlack(param1:Event = null) : void
      {
         removeEventListener(STOP_ALPHA,this.startPelenaBlack);
         this.pelena.visible = true;
         startAlphaFrom0Movie(this.pelena,1);
         this.curEvent = STOP_MOVE;
         dispatchEvent(new Event(this.EVENT));
      }
      
      private function screenStop(param1:Event = null) : void
      {
         removeEventListener(STOP_MOVE,this.screenStop);
         this.curEvent = STOP_MOVE;
         dispatchEvent(new Event(this.EVENT));
         addEventListener(Event.ENTER_FRAME,this.updateScores);
         ControlSounds.playSound("counter",1,0);
      }
      
      private function updateScores(param1:Event) : void
      {
         if(ClassPaused.isPaused)
         {
            return;
         }
         if((this.tempScore = this.tempScore + 100) >= this.curentScore)
         {
            this.tempScore = this.curentScore;
            this.field_total.text = this.total.toString();
            while(this.field_total.text.length < 4)
            {
               this.field_total.text = "0" + this.field_total.text;
            }
            this.field_best.text = this.newBestScore.toString();
            while(this.field_best.text.length < 4)
            {
               this.field_best.text = "0" + this.field_best.text;
            }
            removeEventListener(Event.ENTER_FRAME,this.updateScores);
            this.pelena.visible = true;
            startAlphaFrom0Movie(this.pelena,0.9);
            ControlSounds.stopSound("counter");
         }
         this.field_current.text = this.tempScore.toString();
         while(this.field_current.text.length < 4)
         {
            this.field_current.text = "0" + this.field_current.text;
         }
      }
      
      private function clickMore(param1:MouseEvent) : void
      {
         this.curEvent = this.MORE_GAME;
         dispatchEvent(new Event(this.EVENT));
      }
      
      private function clickReplay(param1:MouseEvent) : void
      {
         this.curEvent = this.RESET;
         dispatchEvent(new Event(this.EVENT));
      }
      
      private function clickNext(param1:MouseEvent) : void
      {
         this.curEvent = this.NEXT;
         dispatchEvent(new Event(this.EVENT));
      }
      
      public function setData(param1:int, param2:Number, param3:Number, param4:*, param5:Number, param6:int) : void
      {
         this.isStart = true;
         this.total = param5;
         this.curentScore = param2;
         this.countStarsWas = param6;
         if(param2 <= 0)
         {
            param2 = 0;
         }
         if(param3 <= 0)
         {
            param3 = 0;
         }
         if(param5 <= 0)
         {
            param5 = 0;
         }
         this.newBestScore = param3;
         if(param2 > param3)
         {
            this.newBestScore = param2;
         }
         this.field_current.text = param2.toString();
         while(this.field_current.text.length < 4)
         {
            this.field_current.text = "0" + this.field_current.text;
         }
         this.field_best.text = param3.toString();
         while(this.field_best.text.length < 4)
         {
            this.field_best.text = "0" + this.field_best.text;
         }
         this.field_total.text = param4.toString();
         while(this.field_total.text.length < 4)
         {
            this.field_total.text = "0" + this.field_total.text;
         }
         this.setNumLevel(param1);
      }
      
      private function setNumLevel(param1:Number) : void
      {
         this.numLevel = param1;
      }
      
      public function setLevelLose() : void
      {
         this.but_next.visible = false;
         this.button_solution.visible = true;
         this.movie.y = 245;
      }
      
      private function showStars() : void
      {
      }
      
      public function startLoseOnly(param1:Boolean, param2:int) : void
      {
         this.numLevel = param2;
         var _loc3_:Class = amigo5.swfMoviesInterface.getAssetClass("levelUpTabl");
         this.movie = new _loc3_() as MovieClip;
         this.movie.gotoAndStop(2);
         this.movie.x = 332;
         this.movie.y = 230;
         this.pelena = this.movie.pelena;
         this.pelena.alpha = 0;
         this.but_more = this.movie.butt_more;
         this.but_replay = this.movie.button_replay;
         this.button_solution = this.movie.button_solution;
         this.movie.button_nextlevel.visible = false;
         this.but_more.addEventListener(MouseEvent.CLICK,this.clickMore);
         this.but_replay.addEventListener(MouseEvent.CLICK,this.clickReplay);
         this.button_solution.addEventListener(MouseEvent.CLICK,this.clickSolution);
         this.movie.cacheAsBitmap = true;
         addChild(this.movie);
         this.movie.visible = true;
         alpha = 0;
         this.pauseStartLose = setTimeout(this.waitStartLose,200);
      }
      
      private function waitStartLose() : void
      {
         ControlSounds.setChangeValumeMusic("musGame",0,0.01);
         ControlSounds.setChangeValumeMusic("musGame2",0,0.01);
         ControlSounds.playSound("zombies",0.6);
         ControlSounds.playSound("levelLose2",1);
         clearTimeout(this.pauseStartLose);
         startAlphaFrom0Movie(this,1,0.1);
         addEventListener(STOP_ALPHA,this.startPelenaBlack);
      }
      
      override public function destroy() : void
      {
         ControlSounds.stopSound("counter");
         clearTimeout(this.pauseStartLose);
         removeEventListener(Event.ENTER_FRAME,this.updateScores);
         removeEventListener(Event.ENTER_FRAME,this.waitStartPause);
         if(this.movie)
         {
            if(this.button_solution)
            {
               this.button_solution.removeEventListener(MouseEvent.CLICK,this.clickSolution);
            }
            if(this.but_more)
            {
               this.but_more.removeEventListener(MouseEvent.CLICK,this.clickMore);
            }
            if(this.but_replay)
            {
               this.but_replay.removeEventListener(MouseEvent.CLICK,this.clickReplay);
            }
            if(this.but_next)
            {
               this.but_next.removeEventListener(MouseEvent.CLICK,this.clickNext);
            }
            while(this.movie.numChildren)
            {
               this.movie.removeChildAt(0);
            }
            removeChild(this.movie);
         }
         while(numChildren)
         {
            removeChild(getChildAt(0));
         }
         super.destroy();
      }
   }
}

