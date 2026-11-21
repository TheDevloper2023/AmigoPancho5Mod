package StructureGame
{
   import ActionsBeforeGame.ClassPreloader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ClassSelector extends ClassDamping
   {
      
      public const MENU:String = "menu";
      
      public const CLEAR:String = "CLEAR";
      
      public const LEVEL:String = "level";
      
      private var movieSelector:MovieClip;
      
      private var numLevel:Number = 0;
      
      private var massivScores:Array = [];
      
      private var inputhigh:TextField;
      
      private var currentEvent:String;
      
      private var arrForeMovieLevel:Array = new Array();
      
      private var myQuation:ClassQuations;
      
      private var selectedLevel:MovieClip;
      
      private var alphaCourse:Number = -1;
      
      private var objectDoplerAPI:ClassDoplerAPI;
      
      private var hsLoad:MovieClip;
      
      public var myGlow:GlowFilter = new GlowFilter();
      
      public var arrGlow:Array = [];
      
      private var timeWait:int;
      
      private var isWait:Boolean;
      
      public function ClassSelector(param1:Array)
      {
         super();
         this.massivScores = param1;
         var _loc2_:Class = amigo5.swfMoviesStructur.getAssetClass("selector");
         this.movieSelector = new _loc2_();
         this.hsLoad = (this.movieSelector as Object).hsloader;
         this.hsLoad.x = 100;
         this.hsLoad.y = 315;
         this.inputhigh = this.movieSelector.inputhigh as TextField;
         var _loc3_:String = ClassSetDataGame.totalScore.toString();
         this.inputhigh.text = _loc3_;
         (this.movieSelector as Object).btnsubmit.visible = true;
         this.setListeners();
         addEventListener(EVENT_COMPLETED,this.appearanceCompleted);
         addChild(this.movieSelector);
         ClassPreloader.showLogo(this);
         action(this.movieSelector,ACTION_APPEARANCE);
         this.objectDoplerAPI = new ClassDoplerAPI(ClassSetDataGame.totalScore,ClassSetDataGame.IDgame,this.hsLoad,1);
         addEventListener(Event.ENTER_FRAME,this.update);
         this.movieSelector.lc.visible = ClassFlags.isVisibleEdit;
         this.movieSelector.ss.visible = ClassFlags.isVisibleEdit;
         this.movieSelector.gg.visible = ClassFlags.isVisibleEdit;
         this.movieSelector.lc.selected = ClassFlags.isLevelsFromCode;
         this.movieSelector.ss.selected = ClassFlags.isSaveLevelsFromCodeToShara;
         this.movieSelector.gg.selected = ClassFlags.isGameOver;
         this.movieSelector.lc.addEventListener("change",this.changeLC);
         this.movieSelector.ss.addEventListener("change",this.changeSS);
         this.movieSelector.gg.addEventListener("change",this.changeGG);
      }
      
      private function changeLC(param1:Event = null) : void
      {
         ButtonsCkick.play();
         ClassFlags.isLevelsFromCode = this.movieSelector.lc.selected;
         trace("ClassFlags.isLevelsFromCode " + ClassFlags.isLevelsFromCode);
      }
      
      private function changeSS(param1:Event = null) : void
      {
         ButtonsCkick.play();
         ClassFlags.isSaveLevelsFromCodeToShara = this.movieSelector.ss.selected;
         trace("ClassFlags.isSaveLevelsFromCodeToShara " + ClassFlags.isSaveLevelsFromCodeToShara);
      }
      
      private function changeGG(param1:Event = null) : void
      {
         ButtonsCkick.play();
         ClassFlags.isGameOver = this.movieSelector.gg.selected;
         ClassSetDataGame.isGameFinish = false;
         trace("ClassFlags.isGameOver " + ClassFlags.isGameOver);
      }
      
      private function appearanceCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.appearanceCompleted);
      }
      
      private function setListeners() : void
      {
         var _loc13_:int = 0;
         var _loc14_:MovieClip = null;
         var _loc15_:Number = NaN;
         (this.movieSelector as Object).but_menu.addEventListener(MouseEvent.CLICK,this.goMenu);
         (this.movieSelector as Object).but_clearScores.addEventListener(MouseEvent.CLICK,this.clearScores);
         (this.movieSelector as Object).btnsubmit.addEventListener(MouseEvent.CLICK,this.goAPI);
         (this.movieSelector as Object).but_more.addEventListener(MouseEvent.CLICK,this.goMore);
         if(!ClassSetDataGame.isGameStarted)
         {
            (this.movieSelector as Object).but_clearScores.visible = false;
         }
         var _loc1_:Number = 0;
         var _loc2_:Class = amigo5.swfMoviesInterface.getAssetClass("icon_level");
         var _loc3_:Array = [124,155,124,124];
         var _loc4_:Array = [8,7,8,8];
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc4_.length);
         var _loc7_:int = 140;
         var _loc8_:int = 75;
         var _loc9_:int = 61;
         var _loc10_:int = 0;
         var _loc11_:int = 1;
         var _loc12_:int = 0;
         while(_loc12_ < _loc6_)
         {
            _loc10_ = 0;
            _loc11_ = 1;
            _loc13_ = 0;
            while(_loc13_ < _loc4_[_loc5_])
            {
               if(this.numLevel++ < ClassSetDataGame.kolVoLevels)
               {
                  _loc14_ = new _loc2_() as MovieClip;
                  _loc14_.x = _loc3_[_loc12_];
                  _loc14_.y = _loc7_ - (_loc10_ = _loc10_ + 0 * _loc11_);
                  this.movieSelector.addChild(_loc14_);
                  _loc14_.scores.visible = false;
                  _loc14_.num_level.text = this.numLevel.toString();
                  _loc14_.num_level.visible = true;
                  (_loc14_.p as MovieClip).gotoAndStop(1);
                  if(this.numLevel > 15)
                  {
                     (_loc14_.p as MovieClip).gotoAndStop(2);
                  }
                  _loc14_.ramka.visible = false;
                  _loc14_.scaleX = 0.85;
                  _loc14_.scaleY = 0.85;
                  _loc14_.ss.init(String(this.numLevel),true);
                  if(ClassSetDataGame.massivOpenLevels[this.numLevel] == true)
                  {
                     _loc14_.gotoAndStop("open");
                     _loc14_.addEventListener(MouseEvent.MOUSE_OVER,this.mouse_on_levels);
                     _loc14_.addEventListener(MouseEvent.MOUSE_OUT,this.mouse_out_levels);
                     _loc14_.addEventListener(MouseEvent.CLICK,this.mouse_click_levels);
                     this.arrForeMovieLevel.push(_loc14_);
                     if(this.numLevel == ClassSetDataGame.tekLevel)
                     {
                        _loc14_.ramka.visible = true;
                     }
                     if(this.massivScores[this.numLevel] >= 0)
                     {
                        _loc15_ = Number(this.massivScores[this.numLevel]);
                        (_loc14_.scores as TextField).visible = true;
                        _loc14_.scores.text = _loc15_.toString();
                     }
                     else
                     {
                        (_loc14_.scores as TextField).visible = false;
                        _loc14_.scores.text = "0";
                     }
                  }
                  else
                  {
                     _loc14_.gotoAndStop("close");
                     _loc14_.but.visible = false;
                  }
                  _loc3_[_loc12_] += _loc9_;
               }
               _loc13_++;
            }
            _loc5_++;
            _loc7_ += _loc8_;
            _loc12_++;
         }
         _loc14_ = null;
         this.movieSelector.but_bubble.addEventListener(MouseEvent.CLICK,this.mouse_click_bubble);
         this.movieSelector.but_bubble.visible = ClassFlags.isShowLogo;
      }
      
      private function goAPI(param1:MouseEvent) : void
      {
      }
      
      private function mouse_click_bubble(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLink("Selector_Logo");
      }
      
      private function goMore(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkMore();
      }
      
      private function mouse_on_levels(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.parent.addChild(_loc2_);
         _loc2_.gotoAndStop("select");
      }
      
      private function mouse_out_levels(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.gotoAndStop("open");
         var _loc3_:TextFormat = new TextFormat();
      }
      
      private function mouse_click_levels(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         this.numLevel = Number(_loc2_.num_level.text);
         ClassSetDataGame.tekLevel = this.numLevel;
         this.extinction(this.LEVEL);
      }
      
      private function goMenu(param1:MouseEvent) : void
      {
         this.extinction(this.MENU);
      }
      
      private function extinction(param1:String) : void
      {
         ButtonsCkick.play();
         this.currentEvent = param1;
         action(this.movieSelector,ACTION_EXTINCTION,0.12);
         addEventListener(EVENT_COMPLETED,this.extinctionCompleted);
      }
      
      private function extinctionCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.extinctionCompleted);
         dispatchEvent(new Event(this.currentEvent));
      }
      
      public function getSelectLevel() : Number
      {
         return this.numLevel;
      }
      
      private function clearScores(param1:MouseEvent) : void
      {
         if(ClassSetDataGame.isGameStarted == true)
         {
            this.myQuation = new ClassQuations();
            addChild(this.myQuation);
            this.myQuation.addEventListener(this.myQuation.ClickOK,this.clear);
            this.myQuation.addEventListener(this.myQuation.ClickNO,this.noClear);
         }
      }
      
      private function clear(param1:Event) : void
      {
         this.noClear(param1);
         this.extinction(this.CLEAR);
      }
      
      private function noClear(param1:Event) : void
      {
         this.myQuation.removeEventListener(this.myQuation.ClickOK,this.clear);
         this.myQuation.removeEventListener(this.myQuation.ClickNO,this.noClear);
         removeChild(this.myQuation);
         this.myQuation.destroy();
      }
      
      public function update(param1:Event) : void
      {
         if(this.isWait == false && (ClassKeys.is_ctrl() && ClassKeys.is_alt() && ClassKeys.is_shift() && ClassKeys.is_N()))
         {
            ClassFlags.isVisibleEdit = !ClassFlags.isVisibleEdit;
            this.movieSelector.lc.visible = ClassFlags.isVisibleEdit;
            this.movieSelector.ss.visible = ClassFlags.isVisibleEdit;
            this.movieSelector.gg.visible = ClassFlags.isVisibleEdit;
            this.timeWait = 0;
            this.isWait = true;
            addEventListener(Event.ENTER_FRAME,this.wait);
         }
      }
      
      public function wait(param1:Event) : void
      {
         if(++this.timeWait > 10)
         {
            this.isWait = false;
            removeEventListener(Event.ENTER_FRAME,this.wait);
         }
      }
      
      override public function destroy() : void
      {
         var _loc1_:MovieClip = null;
         super.destroy();
         removeEventListener(Event.ENTER_FRAME,this.update);
         removeEventListener(Event.ENTER_FRAME,this.wait);
         this.objectDoplerAPI.desrtoy();
         this.objectDoplerAPI = null;
         this.movieSelector.lc.removeEventListener("change",this.changeLC);
         this.movieSelector.ss.removeEventListener("change",this.changeSS);
         this.movieSelector.gg.removeEventListener("change",this.changeGG);
         this.movieSelector.but_bubble.removeEventListener(MouseEvent.CLICK,this.mouse_click_bubble);
         this.movieSelector.but_menu.removeEventListener(MouseEvent.CLICK,this.goMenu);
         this.movieSelector.but_clearScores.removeEventListener(MouseEvent.CLICK,this.clearScores);
         this.movieSelector.btnsubmit.removeEventListener(MouseEvent.CLICK,this.goAPI);
         this.movieSelector.but_more.removeEventListener(MouseEvent.CLICK,this.goMore);
         for each(_loc1_ in this.arrForeMovieLevel)
         {
            _loc1_.removeEventListener(MouseEvent.MOUSE_OVER,this.mouse_on_levels);
            _loc1_.removeEventListener(MouseEvent.MOUSE_OUT,this.mouse_out_levels);
            _loc1_.removeEventListener(MouseEvent.CLICK,this.mouse_click_levels);
            _loc1_.parent.removeChild(_loc1_);
            _loc1_ = null;
         }
         this.arrForeMovieLevel = null;
         while(this.movieSelector.numChildren)
         {
            this.movieSelector.removeChildAt(0);
         }
         removeChild(this.movieSelector);
         this.movieSelector = null;
         while(numChildren)
         {
            removeChildAt(0);
         }
         this.inputhigh = null;
         this.hsLoad = null;
         this.massivScores = null;
      }
   }
}

