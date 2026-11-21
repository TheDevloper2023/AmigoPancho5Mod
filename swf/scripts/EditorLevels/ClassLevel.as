package EditorLevels
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class ClassLevel extends Sprite
   {
      
      public const TELO_VYBRANO:String = "TELO_VYBRANO";
      
      public const PRESS_ON_LEVEL:String = "PRESS_ON_LEVEL";
      
      public const LEVEL_CHANGE:String = "LEVEL_CHANGE";
      
      public const TELO_NEOPREDELENO:String = "TELO_NEOPREDELENO";
      
      public const CHANGE_XY:String = "CHANGE_XY";
      
      public const TEST:String = "TEST";
      
      public const LOOK_KOORD_MOVIE_TELO:String = "LOOK_KOORD_MOVIE_TELO";
      
      public const START_IMPORT:String = "START_IMPORT";
      
      public const SHOW_CODELEVEL:String = "SHOW_CODELEVEL";
      
      public var isSelectSeveralTels:Boolean;
      
      public var isStopAll:Boolean;
      
      private var alphaCourse:int = -1;
      
      private var isTeloSelect:Boolean;
      
      private var isPressOnSeveralCont:Boolean;
      
      private var isGetOutKonstrWas:Boolean = false;
      
      private var movieLevel:MovieClip;
      
      private var curentTelo:MovieClip;
      
      private var contTela:MovieClip = new MovieClip();
      
      private var contFon:MovieClip = new MovieClip();
      
      private var contForCopyTela:MovieClip;
      
      private var contWithSeveralTela:MovieClip = new MovieClip();
      
      private var strLevel:XML;
      
      private var isflashTelo:Boolean;
      
      private var isShowMessCopy:Boolean;
      
      private var mouseMessage:TextField = new TextField();
      
      public var isPushkaHere:Boolean;
      
      public var isCannonHere:Boolean;
      
      public var isTestWas:Boolean;
      
      public var isRolyHere:Boolean;
      
      private var isSetGabarits:Boolean;
      
      private var startTimeChangeGabarits:Number = 0;
      
      private var isModeMoveLevel:Boolean;
      
      private var isPressArrow:Boolean;
      
      private var stopTestPress:Boolean = true;
      
      private var mainTimer:Number = 0;
      
      private var isNoLight:Boolean = false;
      
      internal var pauseFirstKeyPress:Number = 0;
      
      private var isTeloMove:Boolean = false;
      
      public var isNoSave:Boolean;
      
      private var severalMovie:ClassCopySeveralMovie;
      
      public function ClassLevel(param1:MovieClip = null, param2:String = "")
      {
         var _loc4_:MovieClip = null;
         super();
         this.movieLevel = param1;
         var _loc3_:int = 0;
         while(_loc3_ < this.movieLevel.numChildren)
         {
            _loc4_ = this.movieLevel.getChildAt(_loc3_) as MovieClip;
            if((Boolean(_loc4_)) && _loc4_.hasOwnProperty("ownName"))
            {
               if(_loc4_.ownName == "contTela")
               {
                  this.contTela = _loc4_;
               }
               if(_loc4_.ownName == "contFon")
               {
                  this.contFon = _loc4_;
               }
            }
            _loc3_++;
         }
         addChild(this.movieLevel);
         this.x = this.movieLevel.x;
         this.y = this.movieLevel.y;
         this.movieLevel.x = 0;
         this.movieLevel.y = 0;
         this.allMovieStop1();
         this.fonStop();
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMove);
         addEventListener(Event.ENTER_FRAME,this.update);
         addEventListener(Event.ADDED_TO_STAGE,this.setListenKeys);
         mouseEnabled = true;
         doubleClickEnabled = true;
         this.addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheel);
      }
      
      private function mouseWheel(param1:MouseEvent) : void
      {
         var _loc2_:Number = y + param1.delta * 5;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ > 150)
         {
            _loc2_ = 150;
         }
         y = _loc2_;
      }
      
      public function getIsPushka() : Boolean
      {
         return this.getIsTeloOnLevel("pushka");
      }
      
      public function getIsRoly() : Boolean
      {
         return this.getIsTeloOnLevel("rolypoly");
      }
      
      public function setModeMoveL(param1:Boolean) : void
      {
         this.isModeMoveLevel = param1;
      }
      
      public function setMoveL_X(param1:Number) : void
      {
         this.x = -param1;
      }
      
      public function setMoveL_Y(param1:Number) : void
      {
         this.y = param1;
      }
      
      public function setLevel_S(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc7_:Number = NaN;
         _loc2_ = this.height;
         _loc3_ = this.width;
         this.scaleX = param1;
         this.scaleY = param1;
         var _loc4_:Number = this.height;
         var _loc5_:Number = this.width;
         var _loc6_:Number = (_loc2_ - _loc4_) / 7;
         _loc7_ = (_loc3_ - _loc5_) / 5;
         this.y += _loc6_;
         this.x += _loc7_;
      }
      
      private function getIsTeloOnLevel(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         while(_loc2_ < this.contTela.numChildren)
         {
            _loc3_ = this.contTela.getChildAt(_loc2_) as MovieClip;
            if(_loc3_)
            {
               if(_loc3_.toString().indexOf(param1) > -1)
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      public function clearAll() : void
      {
         var _loc1_:* = 0;
         var _loc2_:MovieClip = null;
         while(_loc1_ < this.contTela.numChildren)
         {
            _loc2_ = this.contTela.getChildAt(_loc1_) as MovieClip;
            if(Boolean(_loc2_) && _loc2_.toString().indexOf("t_bRam") == -1)
            {
               this.contTela.removeChild(_loc2_);
               _loc1_--;
            }
            _loc1_++;
         }
         this.isflashTelo = false;
         this.isTeloSelect = false;
         this.isSelectSeveralTels = false;
         this.isPressOnSeveralCont = false;
         this.isShowMessCopy = false;
         this.isGetOutKonstrWas = false;
         this.doChangeLevel("clearAll");
      }
      
      public function getSelectedTelo() : MovieClip
      {
         return this.curentTelo;
      }
      
      public function setGabarits(param1:Array) : void
      {
         var _loc2_:String = null;
         if(this.curentTelo)
         {
            trace("setGabarits Level " + param1[11]);
            this.curentTelo.rotation = 0;
            _loc2_ = this.curentTelo.toString();
            if(_loc2_.indexOf("arb") > -1 || _loc2_.indexOf("decor") > -1 || _loc2_.indexOf("peremychka") > -1 || _loc2_.indexOf("revolute") > -1 || _loc2_.indexOf("joint") > -1 || _loc2_.indexOf("_c") > -1 || _loc2_.indexOf("pic_") > -1 || _loc2_.indexOf("rat") > -1 || _loc2_.indexOf("t_o_d") > -1 || _loc2_.indexOf("pushka") > -1)
            {
               if(param1[0] == 1)
               {
                  this.curentTelo.width = param1[1];
                  this.curentTelo.scaleY = this.curentTelo.scaleX;
               }
               if(param1[0] == 2)
               {
                  this.curentTelo.height = param1[2];
                  this.curentTelo.scaleX = this.curentTelo.scaleY;
               }
            }
            else
            {
               this.curentTelo.width = param1[1];
               this.curentTelo.height = param1[2];
            }
            if(_loc2_.indexOf("t_mp") == -1)
            {
               this.curentTelo.rotation = param1[3];
            }
            this.curentTelo.density = param1[4];
            this.curentTelo.friction = param1[5];
            this.curentTelo.restitution = param1[6];
            this.curentTelo.x = param1[7];
            this.curentTelo.y = param1[8];
            this.curentTelo.mirrorShape = param1[9];
            this.curentTelo.strength = param1[11];
            this.curentTelo.l_damp = param1[12];
            this.curentTelo.a_damp = param1[13];
            if(param1[9] == true)
            {
               this.curentTelo.scaleX = -this.curentTelo.scaleX;
               this.curentTelo.mirrorShape = 1;
            }
            else
            {
               this.curentTelo.scaleX = Math.abs(this.curentTelo.scaleX);
               this.curentTelo.mirrorShape = 0;
            }
            this.startTimeChangeGabarits = this.mainTimer;
            this.isSetGabarits = true;
         }
      }
      
      public function addTelo(param1:MovieClip, param2:String) : void
      {
         this.unloadMovieFromSeleralMovie();
         this.curentTelo = param1;
         this.curentTelo.x -= x;
         this.curentTelo.y -= y;
         this.contTela.addChild(this.curentTelo);
         this.curentTelo.gotoAndStop(1);
         this.heroAndJointOnUp(this.contTela);
         this.curentTelo.density = 1;
         this.curentTelo.friction = 0.5;
         this.curentTelo.restitution = 0.2;
         if(param2 == "Dyn")
         {
            this.curentTelo.density = 1;
            this.curentTelo.friction = 0.5;
            this.curentTelo.restitution = 0.2;
            if(this.curentTelo.toString().indexOf("steklo") > -1 || this.curentTelo.toString().indexOf("t_stak") > -1)
            {
               this.curentTelo.strength = 6;
            }
         }
         if(param2 == "Stat")
         {
            this.curentTelo.density = 0;
            this.curentTelo.friction = 0.5;
            this.curentTelo.restitution = 0;
         }
         if(this.curentTelo.toString().indexOf("revolute_motor") > -1)
         {
            this.curentTelo.rotation = 2;
         }
         this.doChangeLevel("addTelo");
         this.isNoSave = false;
         dispatchEvent(new Event(this.TELO_VYBRANO));
         this.isflashTelo = true;
         this.isTeloSelect = true;
         this.setLight(this.curentTelo);
      }
      
      public function changeFon(param1:String) : void
      {
         var _loc3_:MovieClip = null;
         this.contFon.removeChildAt(0);
         var _loc2_:Class = amigo5.swfMoviesFon.getAssetClass(param1);
         if(_loc2_)
         {
            _loc3_ = new _loc2_();
            _loc3_.cacheAsBitmap = true;
            _loc3_.gotoAndStop(1);
            this.contFon.addChild(_loc3_);
            this.movieLevel.fon = param1.toString().substr(4,1);
            this.fonStop();
         }
         else
         {
            trace("Не найден фон " + param1);
         }
      }
      
      private function fonStop() : void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc1_:MovieClip = this.contFon.getChildAt(0) as MovieClip;
         while(_loc2_ < _loc1_.numChildren)
         {
            _loc3_ = _loc1_.getChildAt(_loc2_) as MovieClip;
            if(_loc3_)
            {
               _loc3_.gotoAndStop(1);
               if(_loc3_.numChildren)
               {
                  _loc4_ = _loc3_.getChildAt(0) as MovieClip;
                  if(_loc4_)
                  {
                     _loc4_.visible = false;
                  }
               }
            }
            _loc2_++;
         }
      }
      
      public function changeAlphaKonstkuktor(param1:int) : void
      {
         this.movieLevel.alphaKonstruktor = param1;
      }
      
      public function changeStateKonstkuktor(param1:int, param2:int) : void
      {
         this.movieLevel.xKonstruktor = param1;
         this.movieLevel.yKonstruktor = param2;
      }
      
      public function changeTypeSelected(param1:String) : void
      {
         this.movieLevel.selectedType = param1;
      }
      
      public function getMovieLevel() : MovieClip
      {
         return this.movieLevel;
      }
      
      public function unloadMovieFromSeleralMovie(param1:Boolean = true) : void
      {
         if(this.isSelectSeveralTels)
         {
            if(param1 == true)
            {
               this.severalMovie.setContWithSeleralMovie(this.curentTelo,false);
               this.severalMovie.destroy();
               this.severalMovie = null;
               this.isSelectSeveralTels = false;
               this.heroAndJointOnUp(this.contTela);
               this.doChangeLevel("unloadMovieFromSeleralMovie_1");
            }
            else
            {
               this.severalMovie.setContWithSeleralMovie(this.curentTelo,true);
               this.heroAndJointOnUp(this.contTela);
               this.doChangeLevel("unloadMovieFromSeleralMovie_2");
               this.curentTelo = this.severalMovie.moveMovieInSeveralCont(this.contTela);
            }
         }
         else
         {
            this.doChangeLevel("unloadMovieFromSeleralMovie_3");
         }
      }
      
      public function noFlash() : void
      {
         this.isflashTelo = false;
         this.allTelsAlpha_1();
      }
      
      private function update(param1:Event) : void
      {
         if(this.isStopAll)
         {
            return;
         }
         this.changeAlpha(this.curentTelo);
         ++this.mainTimer;
         if(this.isSetGabarits == true)
         {
            if(this.mainTimer - this.startTimeChangeGabarits > 20)
            {
               this.isNoSave = true;
               dispatchEvent(new Event(this.TELO_VYBRANO));
               this.isNoSave = false;
               this.doChangeLevel("setGabarits");
               this.isSetGabarits = false;
               this.mainTimer = 5;
               this.startTimeChangeGabarits = 0;
            }
         }
         if(ClassKeys.is_C() == true || ClassKeys.is_ctrl())
         {
            if(this.isShowMessCopy == false)
            {
               this.showMouseMess("+");
            }
            else
            {
               this.setMessMousePosition();
            }
         }
         else if(this.isShowMessCopy == true)
         {
            this.hideMouseMess();
         }
         if(ClassKeys.is_I() == true)
         {
            this.hideMouseMess();
            dispatchEvent(new Event(this.START_IMPORT));
            return;
         }
         if(ClassKeys.is_E() == true)
         {
            this.hideMouseMess();
            dispatchEvent(new Event(this.SHOW_CODELEVEL));
            return;
         }
         this.isPressArrow = false;
         if(ClassKeys.is_left())
         {
            this.moveCurentTelo(-1,0);
         }
         if(ClassKeys.is_right())
         {
            this.moveCurentTelo(1,0);
         }
         if(ClassKeys.is_down())
         {
            this.moveCurentTelo(0,1);
         }
         if(ClassKeys.is_up())
         {
            this.moveCurentTelo(0,-1);
         }
         if(this.isPressArrow == false && this.stopTestPress == false)
         {
            this.doChangeLevel("moveCurentTelo");
            this.stopTestPress = true;
            this.pauseFirstKeyPress = 0;
         }
         if(ClassKeys.is_DEL())
         {
            this.deleteCurentTelo();
         }
         if(ClassKeys.is_space())
         {
            this.isStopAll = true;
            dispatchEvent(new Event(this.TEST));
         }
      }
      
      private function mouseDown(param1:MouseEvent) : void
      {
         this.teloSelectMouseDown();
      }
      
      private function mouseMove(param1:MouseEvent) : void
      {
         var _loc3_:MovieClip = null;
         if(this.isModeMoveLevel == true)
         {
            return;
         }
         var _loc2_:* = int(this.contTela.numChildren - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.contTela.getChildAt(_loc2_) as MovieClip;
            if(_loc3_.hitTestPoint(stage.mouseX,stage.mouseY,true))
            {
               if(_loc3_.isLight == false && this.isNoLight == false)
               {
                  this.setLight(_loc3_);
                  this.isNoLight = true;
                  return;
               }
            }
            else if(_loc3_.isLight == true)
            {
               this.clearLight(_loc3_);
               this.isNoLight = false;
            }
            _loc2_--;
         }
      }
      
      public function setLight(param1:MovieClip, param2:int = 3, param3:uint = 16777215, param4:int = 3) : void
      {
         var _loc5_:GlowFilter = new GlowFilter();
         _loc5_.color = param3;
         _loc5_.blurX = param2;
         _loc5_.blurY = param2;
         _loc5_.strength = param4;
         param1.filters = [_loc5_];
         param1.isLight = true;
      }
      
      public function clearLight(param1:MovieClip) : void
      {
         param1.filters = [];
         param1.isLight = false;
      }
      
      private function setListenKeys(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.setListenKeys);
         stage.focus = stage;
      }
      
      private function deleteCurentTelo() : void
      {
         if(this.curentTelo)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.selectedTeloMouseUp);
            if(this.isSelectSeveralTels)
            {
               this.severalMovie.destroy();
               this.severalMovie = null;
               this.isSelectSeveralTels = false;
            }
            if(this.curentTelo.parent)
            {
               this.curentTelo.parent.removeChild(this.curentTelo);
            }
            this.curentTelo = null;
            this.doChangeLevel("deleteCurentTelo");
            this.isTeloSelect = false;
            this.isflashTelo = false;
            dispatchEvent(new Event(this.PRESS_ON_LEVEL));
         }
      }
      
      private function moveCurentTelo(param1:Number, param2:Number) : void
      {
         ++this.pauseFirstKeyPress;
         this.isPressArrow = true;
         this.stopTestPress = false;
         if(Boolean(this.curentTelo) && (this.pauseFirstKeyPress == 1 || this.pauseFirstKeyPress > 10))
         {
            this.curentTelo.x += param1;
            this.curentTelo.y += param2;
            dispatchEvent(new Event(this.TELO_VYBRANO));
         }
      }
      
      private function doChangeLevel(param1:String) : void
      {
         dispatchEvent(new Event(this.LEVEL_CHANGE));
      }
      
      private function changeAlpha(param1:MovieClip) : void
      {
         if(this.isflashTelo == true)
         {
            param1.alpha += 0.03 * this.alphaCourse;
            if(param1.alpha > 1)
            {
               this.alphaCourse = -1;
               param1.alpha = 1;
            }
            if(param1.alpha < 0.3)
            {
               this.alphaCourse = 1;
               param1.alpha = 0.3;
            }
         }
      }
      
      private function allTelsAlpha_1() : void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.contTela.numChildren)
         {
            _loc2_ = this.contTela.getChildAt(_loc1_) as MovieClip;
            _loc2_.alpha = 1;
            _loc1_++;
         }
      }
      
      private function makeFon(param1:String = "fon_1") : MovieClip
      {
         var _loc2_:Class = amigo5.swfMoviesFon.getAssetClass(param1);
         return new _loc2_();
      }
      
      private function teloSelectMouseDown() : void
      {
         var _loc2_:MovieClip = null;
         if(this.isModeMoveLevel == true)
         {
            this.startDrag();
            return;
         }
         stage.focus = this.movieLevel.stage;
         var _loc1_:* = int(this.contTela.numChildren - 1);
         while(_loc1_ >= 0)
         {
            _loc2_ = this.contTela.getChildAt(_loc1_) as MovieClip;
            if(_loc2_.hitTestPoint(stage.mouseX,stage.mouseY,true))
            {
               if(_loc2_.ownName == "contForAllSeveral")
               {
                  this.isPressOnSeveralCont = true;
               }
               else
               {
                  this.unloadMovieFromSeleralMovie();
               }
               this.isTeloSelect = true;
               this.isTeloMove = true;
               if(_loc2_ != this.curentTelo)
               {
                  this.allTelsAlpha_1();
               }
               this.curentTelo = _loc2_;
               if(ClassKeys.is_C() || ClassKeys.is_ctrl() || ClassKeys.is_alt())
               {
                  this.curentTelo = this.copySelectedMovie(this.curentTelo);
               }
               this.curentTelo.startDrag();
               this.contTela.addChild(this.curentTelo);
               stage.removeEventListener(MouseEvent.MOUSE_UP,this.selectedTeloMouseUp);
               stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.selectedTeloMove);
               stage.addEventListener(MouseEvent.MOUSE_MOVE,this.selectedTeloMove);
               stage.addEventListener(MouseEvent.MOUSE_UP,this.selectedTeloMouseUp);
               this.heroAndJointOnUp(this.contTela);
               this.isNoSave = true;
               dispatchEvent(new Event(this.TELO_VYBRANO));
               this.isflashTelo = true;
               return;
            }
            _loc1_--;
         }
         this.unloadMovieFromSeleralMovie();
         this.heroAndJointOnUp(this.contTela);
         dispatchEvent(new Event(this.PRESS_ON_LEVEL));
         this.makeContForSelectTels();
         this.isTeloSelect = false;
         this.isflashTelo = false;
      }
      
      private function mouseUp(param1:MouseEvent) : void
      {
         if(this.isModeMoveLevel == true)
         {
            this.stopDrag();
         }
      }
      
      private function selectedTeloMove(param1:MouseEvent) : void
      {
         if(this.curentTelo)
         {
            dispatchEvent(new Event(this.LOOK_KOORD_MOVIE_TELO));
         }
      }
      
      public function getKoordCurentTelo() : Point
      {
         return new Point(this.curentTelo.x,this.curentTelo.y);
      }
      
      private function selectedTeloMouseUp(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.selectedTeloMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.selectedTeloMouseUp);
         this.curentTelo.stopDrag();
         this.unloadMovieFromSeleralMovie(false);
         this.isPressOnSeveralCont = false;
         this.isTeloMove = false;
         this.isNoSave = false;
         dispatchEvent(new Event(this.TELO_VYBRANO));
      }
      
      private function makeContForSelectTels() : void
      {
         var punContWithSeveralMovie:Function = null;
         punContWithSeveralMovie = function(param1:Event):void
         {
            severalMovie.removeEventListener(severalMovie.MOUSE_UP,punContWithSeveralMovie);
            curentTelo = severalMovie.getContWithSeleralMovie();
            if(!curentTelo)
            {
               return;
            }
            if(curentTelo.numChildren > 1)
            {
               isflashTelo = true;
               isSelectSeveralTels = true;
            }
            else
            {
               severalMovie.destroy();
               severalMovie = null;
               curentTelo.removeChildAt(0);
               curentTelo = null;
               isSelectSeveralTels = false;
            }
         };
         this.severalMovie = new ClassCopySeveralMovie(this.contTela,"contForCopyTels_1");
         addChild(this.severalMovie);
         this.severalMovie.addEventListener(this.severalMovie.MOUSE_UP,punContWithSeveralMovie);
      }
      
      private function copySelectedMovie(param1:MovieClip) : MovieClip
      {
         var _loc3_:* = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         var _loc2_:MovieClip = new MovieClip();
         if(this.isPressOnSeveralCont)
         {
            _loc2_.ownName = "contForAllSeveral";
            _loc3_ = int(param1.numChildren - 1);
            while(_loc3_ >= 0)
            {
               _loc4_ = param1.getChildAt(_loc3_) as MovieClip;
               if(_loc4_)
               {
                  _loc5_ = this.getCopyTelo(_loc4_);
                  if(_loc4_.ownName == "contForCopyTels")
                  {
                     _loc5_.ownName = "contForCopyTels";
                     this.severalMovie.setNewMovieForSelect(_loc5_);
                  }
                  _loc2_.addChild(_loc5_);
               }
               _loc3_--;
            }
            this.severalMovie.setContWithSeleralMovie(this.curentTelo,false);
            this.isSelectSeveralTels = true;
            return _loc2_;
         }
         return this.getCopyTelo(param1);
      }
      
      private function getCopyTelo(param1:MovieClip) : MovieClip
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         var _loc4_:Number = param1.rotation;
         param1.rotation = 0;
         var _loc5_:Number = Math.round(param1.width);
         var _loc6_:Number = Math.round(param1.height);
         param1.rotation = _loc4_;
         var _loc7_:String = param1.toString().substr(8,100);
         _loc7_ = _loc7_.substr(0,_loc7_.length - 1);
         var _loc8_:Class = amigo5.swfMoviesGame.getAssetClass(_loc7_);
         var _loc9_:MovieClip = new _loc8_();
         _loc9_.gotoAndStop(1);
         _loc9_.x = _loc2_;
         _loc9_.y = _loc3_;
         _loc9_.width = _loc5_;
         _loc9_.height = _loc6_;
         _loc9_.rotation = _loc4_;
         _loc9_.density = param1.density;
         _loc9_.friction = param1.friction;
         _loc9_.restitution = param1.restitution;
         _loc9_.mirrorShape = param1.mirrorShape;
         _loc9_.scaleX = param1.scaleX;
         _loc9_.a_damp = param1.a_damp;
         _loc9_.l_damp = param1.l_damp;
         return _loc9_;
      }
      
      private function showMouseMess(param1:String, param2:Boolean = false) : void
      {
         this.mouseMessage.selectable = false;
         if(param2)
         {
            this.mouseMessage.backgroundColor = 16777215;
         }
         this.mouseMessage.background = param2;
         this.mouseMessage.multiline = true;
         this.mouseMessage.border = param2;
         this.mouseMessage.autoSize = TextFieldAutoSize.CENTER;
         this.mouseMessage.text = " " + param1 + " ";
         this.setMessMousePosition();
         addChild(this.mouseMessage);
         this.isShowMessCopy = true;
      }
      
      private function setMessMousePosition() : void
      {
         this.mouseMessage.y = stage.mouseY - 15;
         this.mouseMessage.x = stage.mouseX;
      }
      
      private function hideMouseMess() : void
      {
         if(Boolean(this.mouseMessage) && Boolean(this.mouseMessage.parent))
         {
            this.mouseMessage.parent.removeChild(this.mouseMessage);
         }
         this.isShowMessCopy = false;
         stage.focus = stage;
      }
      
      private function allMovieStop1() : void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.contTela.numChildren)
         {
            _loc2_ = this.contTela.getChildAt(_loc1_) as MovieClip;
            _loc2_.isLight = false;
            _loc2_.gotoAndStop(1);
            _loc1_++;
         }
      }
      
      private function heroAndJointOnUp(param1:MovieClip) : void
      {
         var _loc18_:MovieClip = null;
         var _loc20_:Array = null;
         var _loc21_:String = null;
         var _loc22_:MovieClip = null;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         var _loc12_:Array = [];
         var _loc13_:Array = [];
         var _loc14_:Array = [];
         var _loc15_:Array = [];
         var _loc16_:Array = [_loc7_,_loc6_,_loc11_,_loc8_,_loc4_,_loc10_,_loc12_,_loc2_,_loc3_,_loc9_,_loc5_,_loc13_];
         var _loc17_:Array = [_loc14_,_loc15_];
         var _loc19_:int = 0;
         while(_loc19_ < param1.numChildren)
         {
            _loc18_ = param1.getChildAt(_loc19_) as MovieClip;
            _loc21_ = _loc18_.toString().substr(_loc18_.toString().length - 3,2);
            if(_loc18_.toString().indexOf("holePes") > -1)
            {
               _loc13_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("peremychka") > -1)
            {
               _loc4_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("t_joint") > -1)
            {
               _loc2_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("t_revolute") > -1)
            {
               _loc3_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("t_mp") > -1)
            {
               _loc12_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("pushka") > -1)
            {
               _loc9_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("t_o_d") > -1)
            {
               _loc10_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("t_pesok") > -1)
            {
               _loc15_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("t_pol") > -1)
            {
               _loc14_.push(_loc18_);
            }
            else if(_loc18_.toString().indexOf("pic_") > -1)
            {
               _loc6_.push(_loc18_);
            }
            else if(_loc21_ == "_s")
            {
               _loc7_.push(_loc18_);
            }
            else
            {
               _loc11_.push(_loc18_);
            }
            _loc19_++;
         }
         for each(_loc20_ in _loc16_)
         {
            for each(_loc22_ in _loc20_)
            {
               param1.addChild(_loc22_);
            }
         }
         for each(_loc20_ in _loc17_)
         {
            for each(_loc22_ in _loc20_)
            {
               param1.addChildAt(_loc22_,0);
            }
         }
      }
      
      public function destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMove);
         removeEventListener(Event.ENTER_FRAME,this.update);
         removeEventListener(Event.ADDED_TO_STAGE,this.setListenKeys);
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheel);
         while(this.movieLevel.numChildren)
         {
            this.movieLevel.removeChildAt(0);
         }
         removeChild(this.movieLevel);
         this.movieLevel = null;
         if(this.severalMovie)
         {
            this.severalMovie.destroy();
         }
         this.severalMovie = null;
         this.curentTelo = null;
         this.contTela = null;
         this.contFon = null;
         this.contForCopyTela = null;
         this.contWithSeveralTela = null;
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
   }
}

