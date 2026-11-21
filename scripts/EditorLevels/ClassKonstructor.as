package EditorLevels
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.xml.XMLNode;
   
   public class ClassKonstructor extends Sprite
   {
      
      public var selectedTelo:MovieClip;
      
      public var selectedFon:String;
      
      private var movieKonstructor:MovieClip;
      
      private var movieCaption:MovieClip;
      
      private var textFieldRotation:TextField;
      
      private var kontTela:MovieClip = new MovieClip();
      
      private var kontForMoveTela:MovieClip = new MovieClip();
      
      private var isTeloSelect:Boolean = false;
      
      private var isTeloOverKonstruktor:Boolean = false;
      
      private var selectedTeloStartX:Number;
      
      private var selectedTeloStartY:Number;
      
      private var selectedTeloScX:Number;
      
      private var selectedTeloScY:Number;
      
      private var lastKoordKonstr:Point = new Point(0,0);
      
      private var buttonHideWindow:MovieClip;
      
      private var buttonCenteWindow:MovieClip;
      
      private var isCanListenMouseOverCaption:Boolean = true;
      
      private var numGabSelected:int;
      
      private var isKonstruktorHide:Boolean = false;
      
      private var nameTypeObjectSelected:String = "dyn";
      
      public const TELO_PEREDANO:String = "teloPeredano";
      
      public const CHANGE_GABARITS:String = "changeGabarits";
      
      public const CHANGE_FON:String = "changeFon";
      
      public const CHANGE_ALPHA:String = "changeAlpha";
      
      public const CHANGE_STATE:String = "CHANGE_STATE";
      
      public const CHANGE_TYPE:String = "CHANGE_TYPE";
      
      public const CHANGE_MOVEL:String = "CHANGE_MOVEL";
      
      public const CHANGE_MOVEL_X:String = "CHANGE_MOVEL_X";
      
      public const CHANGE_MOVEL_Y:String = "CHANGE_MOVEL_Y";
      
      public const CHANGE_LEVEL_S:String = "CHANGE_LEVEL_S";
      
      private var p:int = 0;
      
      private var pointState:Point = new Point();
      
      public function ClassKonstructor(param1:String)
      {
         super();
         var _loc2_:Class = amigo5.swfMoviesGame.getAssetClass("konstructor");
         this.movieKonstructor = new _loc2_() as MovieClip;
         addChild(this.movieKonstructor);
         this.textFieldRotation = this.movieKonstructor.rotSpeed as TextField;
         this.movieCaption = (this.movieKonstructor as Object).caption;
         this.movieCaption.addEventListener(MouseEvent.MOUSE_OVER,this.showKonstructor);
         this.movieCaption.addEventListener(MouseEvent.CLICK,this.showOrHideKonstruktor);
         this.buttonHideWindow = (this.movieCaption as Object).but_hideWindow;
         this.buttonHideWindow.gotoAndStop(1);
         this.buttonHideWindow.addEventListener(MouseEvent.CLICK,this.but_hideWindowClick);
         addChild(this.kontForMoveTela);
         this.hideGabarits();
         addEventListener(Event.ADDED_TO_STAGE,this.setListeners);
      }
      
      private function setListeners(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.setListeners);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMove);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.movieKonstructor.widthShape.addEventListener("change",this.changeWidthEvent);
         this.movieKonstructor.heightShape.addEventListener("change",this.changeHeightEvent);
         this.movieKonstructor.rotationShape.addEventListener("change",this.changeRotEvent);
         this.movieKonstructor.xShape.addEventListener("change",this.changexEvent);
         this.movieKonstructor.yShape.addEventListener("change",this.changeyEvent);
         this.movieKonstructor.density.addEventListener("change",this.changeDensityEvent);
         this.movieKonstructor.restitution.addEventListener("change",this.changeRestitutionEvent);
         this.movieKonstructor.friction.addEventListener("change",this.changeFrictionEvent);
         this.movieKonstructor.mirrorShape.addEventListener("change",this.changeMirrorEvent);
         this.movieKonstructor.strength.addEventListener("change",this.changeStrengthEvent);
         this.movieKonstructor.l_damp.addEventListener("change",this.changeLdampEvent);
         this.movieKonstructor.a_damp.addEventListener("change",this.changeAdampEvent);
         this.movieKonstructor.moveL.addEventListener("change",this.changeMoveL);
         this.movieKonstructor.sett.del.addEventListener(MouseEvent.CLICK,this.delList);
         this.movieKonstructor.bg.addEventListener("change",this.changeBgEvent);
         this.setAllFons();
      }
      
      private function setAllFons() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ < 6)
         {
            this.movieKonstructor.bg.addItem({
               "label":"pic " + _loc1_,
               "data":_loc1_.toString()
            });
            _loc1_++;
         }
         this.movieKonstructor.bg.rowCount = 6;
      }
      
      private function changeBgEvent(param1:Event) : void
      {
         var _loc2_:String = this.movieKonstructor.bg.value;
         if(_loc2_ != this.selectedFon)
         {
            this.selectedFon = "fon_" + _loc2_;
            dispatchEvent(new Event(this.CHANGE_FON));
         }
      }
      
      public function getSetting() : XMLNode
      {
         var _loc1_:XMLNode = new XMLNode(1,"core");
         _loc1_.attributes.list = this.movieKonstructor.sett.cores.text;
         _loc1_.attributes.num = this.movieKonstructor.sett.numBalloons.value;
         return _loc1_;
      }
      
      public function setSetting(param1:XML) : void
      {
         var _loc2_:XML = null;
         if(param1)
         {
            for each(_loc2_ in param1.children())
            {
               if(_loc2_.name() == "core")
               {
                  this.movieKonstructor.sett.cores.text = _loc2_.attribute("list");
                  this.movieKonstructor.sett.numBalloons.value = int(_loc2_.attribute("num"));
               }
            }
         }
      }
      
      private function delList(param1:MouseEvent) : void
      {
         this.movieKonstructor.sett.cores.text = "";
      }
      
      private function but_centeWindowClick(param1:MouseEvent) : void
      {
         this.lastKoordKonstr = new Point(0,0);
         this.isCanListenMouseOverCaption = true;
         this.showKonstructor(param1);
      }
      
      private function but_hideWindowClick(param1:MouseEvent) : void
      {
         if(this.buttonHideWindow.currentFrame == 1)
         {
            this.lastKoordKonstr = new Point(0,0);
            this.hideKonstructor();
         }
      }
      
      public function hideKonstructor(param1:Point = null) : void
      {
         if(param1 == null && this.movieKonstructor.y != -300 || param1 != null && this.movieKonstructor.hitTestPoint(param1.x,param1.y))
         {
            this.hide(param1);
            this.changeStateEvent();
         }
      }
      
      private function hide(param1:Point = null) : void
      {
         this.isCanListenMouseOverCaption = false;
         addChild(this.movieCaption);
         this.movieCaption.alpha = 0.3;
         this.buttonHideWindow.gotoAndStop(2);
         this.movieKonstructor.y = -300;
         if(param1 != null)
         {
            this.lastKoordKonstr = new Point(0,0);
         }
         addEventListener(Event.ENTER_FRAME,this.mouseOutFromCaption);
         this.isKonstruktorHide = true;
      }
      
      private function showOrHideKonstruktor(param1:MouseEvent) : void
      {
         if(this.isKonstruktorHide)
         {
         }
      }
      
      public function setStateSliderL_XY(param1:int, param2:int, param3:Number = 1) : void
      {
      }
      
      private function mouseOutFromCaption(param1:Event) : void
      {
         ++this.p;
         if(this.p > 20)
         {
            removeEventListener(Event.ENTER_FRAME,this.mouseOutFromCaption);
            this.isCanListenMouseOverCaption = true;
            this.p = 0;
         }
      }
      
      private function showKonstructor(param1:MouseEvent) : void
      {
         if(this.movieKonstructor.y == -300 && this.isCanListenMouseOverCaption)
         {
            this.movieCaption.alpha = 1;
            this.buttonHideWindow.gotoAndStop(1);
            this.movieKonstructor.addChild(this.movieCaption);
            this.movieKonstructor.y = this.lastKoordKonstr.y;
            this.movieKonstructor.x = this.lastKoordKonstr.x;
            this.isKonstruktorHide = false;
            this.changeStateEvent();
         }
      }
      
      public function setFon(param1:String) : void
      {
         this.movieKonstructor.bg.selectedIndex = int(param1) - 1;
      }
      
      public function getNameFon() : String
      {
         return this.selectedFon;
      }
      
      public function rotationToSpeed() : void
      {
         this.textFieldRotation.text = "rotat. speed";
      }
      
      public function speedToRotation() : void
      {
         this.textFieldRotation.text = "rotation";
      }
      
      private function changeWidthEvent(param1:Event) : void
      {
         this.numGabSelected = 1;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeHeightEvent(param1:Event) : void
      {
         this.numGabSelected = 2;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeRotEvent(param1:Event) : void
      {
         this.numGabSelected = 3;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeDensityEvent(param1:Event) : void
      {
         this.numGabSelected = 4;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeFrictionEvent(param1:Event) : void
      {
         this.numGabSelected = 5;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeRestitutionEvent(param1:Event) : void
      {
         this.numGabSelected = 6;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changexEvent(param1:Event) : void
      {
         this.numGabSelected = 7;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeyEvent(param1:Event) : void
      {
         this.numGabSelected = 8;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeMirrorEvent(param1:Event) : void
      {
         this.numGabSelected = 9;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeSliderEvent(param1:Event) : void
      {
         this.numGabSelected = 10;
         var _loc2_:Number = this.movieKonstructor.slider.value / 10;
         alpha = _loc2_;
         dispatchEvent(new Event(this.CHANGE_ALPHA));
      }
      
      private function changeStrengthEvent(param1:Event) : void
      {
         trace("changeStrengthEvent Konstruktor" + this.movieKonstructor.strength.value);
         this.numGabSelected = 11;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeLdampEvent(param1:Event) : void
      {
         this.numGabSelected = 12;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeAdampEvent(param1:Event) : void
      {
         this.numGabSelected = 13;
         dispatchEvent(new Event(this.CHANGE_GABARITS));
      }
      
      private function changeMoveL(param1:Event) : void
      {
         dispatchEvent(new Event(this.CHANGE_MOVEL));
      }
      
      private function changeLevelX(param1:Event) : void
      {
         var _loc2_:Number = Number(this.movieKonstructor.sliderLevelX.value);
         dispatchEvent(new Event(this.CHANGE_MOVEL_X));
      }
      
      private function changeLevelY(param1:Event) : void
      {
         var _loc2_:Number = Number(this.movieKonstructor.sliderLevelY.value);
         dispatchEvent(new Event(this.CHANGE_MOVEL_Y));
      }
      
      private function changeLevelScale(param1:Event) : void
      {
         var _loc2_:Number = Number(this.movieKonstructor.sliderScale.value);
         dispatchEvent(new Event(this.CHANGE_LEVEL_S));
      }
      
      public function getMoveL_X() : Number
      {
         return this.movieKonstructor.sliderLevelX.value;
      }
      
      public function getMoveL_Y() : Number
      {
         return this.movieKonstructor.sliderLevelY.value;
      }
      
      public function getLevel_S() : Number
      {
         return this.movieKonstructor.sliderScale.value;
      }
      
      public function getIsMoveLevel() : Boolean
      {
         return this.movieKonstructor.moveL.selected as Boolean;
      }
      
      private function changeStateEvent() : void
      {
         this.pointState.x = this.movieKonstructor.x;
         this.pointState.y = this.movieKonstructor.y;
         dispatchEvent(new Event(this.CHANGE_STATE));
      }
      
      public function setStateKonstruktor(param1:Point) : void
      {
         this.movieKonstructor.x = param1.x;
         this.movieKonstructor.y = param1.y;
         this.pointState = param1;
         if(this.movieKonstructor.y == -300)
         {
            this.hide(null);
         }
      }
      
      public function getState() : Point
      {
         return this.pointState;
      }
      
      public function setAlphaKonstruktor(param1:int) : void
      {
         if(param1 == 0)
         {
            param1 = 10;
         }
         if(param1 <= 2)
         {
            param1 = 2;
         }
      }
      
      public function setSelectedType(param1:String) : void
      {
         if(param1)
         {
            this.movieKonstructor[param1].selected = true;
         }
         else
         {
            param1 = "Dyn";
         }
         this.setType(param1);
      }
      
      public function getTypeSelected() : String
      {
         return this.nameTypeObjectSelected;
      }
      
      public function getAlpha() : int
      {
         return 1;
      }
      
      private function mouseMove(param1:MouseEvent) : void
      {
         this.bigSmall();
         this.teloOverKonstruktorOrNot();
      }
      
      private function mouseDown(param1:MouseEvent) : void
      {
         this.teloSelect();
         this.konstrSelect(param1);
         this.fonsChange(param1);
      }
      
      private function fonsChange(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(param1.target.toString().indexOf("RadioButton") > -1)
         {
            _loc2_ = param1.target.name;
            if(_loc2_.indexOf("fon_") > -1)
            {
               if(_loc2_ != this.selectedFon)
               {
                  this.selectedFon = _loc2_;
                  dispatchEvent(new Event(this.CHANGE_FON));
               }
               return;
            }
            this.setType(_loc2_);
         }
      }
      
      private function teloSelect() : Boolean
      {
         var _loc2_:MovieClip = null;
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.kontTela.numChildren)
         {
            _loc2_ = this.kontTela.getChildAt(_loc1_) as MovieClip;
            if(Boolean(_loc2_) && Boolean(_loc2_.visible == true) && _loc2_.hitTestPoint(mouseX,mouseY,true))
            {
               this.isTeloSelect = true;
               this.isTeloOverKonstruktor = true;
               this.selectedTelo = _loc2_;
               this.selectedTeloScX = this.selectedTelo.scaleX;
               this.selectedTeloScY = this.selectedTelo.scaleY;
               this.selectedTeloStartX = this.selectedTelo.x + this.movieKonstructor.x + this.kontTela.x;
               this.selectedTeloStartY = this.selectedTelo.y + this.movieKonstructor.y + this.kontTela.y;
               _loc3_ = this.selectedTelo.toString().substr(8,100);
               _loc3_ = _loc3_.substr(0,_loc3_.length - 1);
               _loc4_ = amigo5.swfMoviesGame.getAssetClass(_loc3_);
               this.selectedTelo = new _loc4_();
               this.selectedTelo.x = this.selectedTeloStartX + 2;
               this.selectedTelo.y = this.selectedTeloStartY + 2;
               this.selectedTelo.scaleX = this.selectedTeloScX;
               this.selectedTelo.scaleY = this.selectedTeloScY;
               switch(_loc3_)
               {
                  case "t_coreLittle":
                     this.movieKonstructor.sett.cores.text += "S";
                     break;
                  case "t_coreBlast":
                     this.movieKonstructor.sett.cores.text += "B";
                     break;
                  case "t_coreFire":
                     this.movieKonstructor.sett.cores.text += "F";
               }
               this.kontForMoveTela.addChild(this.selectedTelo);
               this.selectedTelo.startDrag();
               this.selectedTelo.gotoAndStop(1);
               stage.removeEventListener(MouseEvent.MOUSE_UP,this.selectedTeloMouseUp);
               stage.addEventListener(MouseEvent.MOUSE_UP,this.selectedTeloMouseUp);
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      internal function konstrSelect(param1:MouseEvent) : *
      {
         var selectedKonstrMouseUp:Function = null;
         var e:MouseEvent = param1;
         selectedKonstrMouseUp = function(param1:MouseEvent):*
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,selectedKonstrMouseUp);
            movieKonstructor.stopDrag();
            if(movieKonstructor.y != -300)
            {
               lastKoordKonstr.x = movieKonstructor.x;
               lastKoordKonstr.y = movieKonstructor.y;
               changeStateEvent();
            }
         };
         if(e.target.toString().indexOf("captionWindow") > -1 && !this.isKonstruktorHide)
         {
            this.movieKonstructor.startDrag();
            stage.removeEventListener(MouseEvent.MOUSE_UP,selectedKonstrMouseUp);
            stage.addEventListener(MouseEvent.MOUSE_UP,selectedKonstrMouseUp);
         }
      }
      
      internal function selectedTeloMouseUp(param1:MouseEvent) : *
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.selectedTeloMouseUp);
         this.selectedTelo.stopDrag();
         this.kontForMoveTela.removeChild(this.selectedTelo);
         if(!this.isTeloOverKonstruktor)
         {
            dispatchEvent(new Event(this.TELO_PEREDANO));
         }
         this.showKonstructor(param1);
         this.selectedTelo = null;
         this.isTeloSelect = false;
      }
      
      private function bigSmall() : void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.kontTela.numChildren)
         {
            _loc2_ = this.kontTela.getChildAt(_loc1_) as MovieClip;
            if(_loc2_)
            {
               if(_loc2_.hitTestPoint(mouseX,mouseY,true))
               {
                  if(_loc2_.big == false || _loc2_.big == undefined)
                  {
                     _loc2_.width *= 1.1;
                     _loc2_.scaleY *= 1.1;
                     _loc2_.big = true;
                     return;
                  }
               }
               else if(_loc2_.big == true)
               {
                  _loc2_.width /= 1.1;
                  _loc2_.scaleY /= 1.1;
                  _loc2_.big = false;
                  return;
               }
            }
            _loc1_++;
         }
      }
      
      internal function teloOverKonstruktorOrNot() : void
      {
         if(this.isTeloSelect)
         {
            if(this.movieKonstructor.hitTestPoint(mouseX,mouseY))
            {
               this.selectedTelo.scaleX = this.selectedTeloScX;
               this.selectedTelo.scaleY = this.selectedTeloScY;
               this.isTeloOverKonstruktor = true;
            }
            else
            {
               if(this.selectedTelo.toString().indexOf("pic_") > -1)
               {
                  this.selectedTelo.scaleX = 1;
                  this.selectedTelo.scaleY = 1;
               }
               else
               {
                  this.selectedTelo.scaleX = 1;
                  this.selectedTelo.scaleY = 1;
               }
               this.isTeloOverKonstruktor = false;
               this.movieKonstructor.y = -300;
            }
         }
      }
      
      internal function hideGabarits() : *
      {
         this.movieKonstructor.widthShape.enabled = false;
         this.movieKonstructor.heightShape.enabled = false;
         this.movieKonstructor.rotationShape.enabled = false;
         this.movieKonstructor.xShape.enabled = false;
         this.movieKonstructor.yShape.enabled = false;
         this.movieKonstructor.widthShape.value = 0;
         this.movieKonstructor.heightShape.value = 0;
         this.movieKonstructor.rotationShape.value = 0;
         this.movieKonstructor.xShape.value = 0;
         this.movieKonstructor.yShape.value = 0;
         this.movieKonstructor.density.enabled = false;
         this.movieKonstructor.restitution.enabled = false;
         this.movieKonstructor.rest.text = "restitution";
         this.movieKonstructor.strength.visible = false;
         this.movieKonstructor.restitution.visible = true;
         this.movieKonstructor.l_damp.enabled = false;
         this.movieKonstructor.a_damp.enabled = false;
         this.movieKonstructor.friction.enabled = false;
         this.movieKonstructor.mirrorShape.enabled = false;
         this.movieKonstructor.mirrorShape.selected = false;
         this.movieKonstructor.density.value = 0;
         this.movieKonstructor.restitution.value = 0;
         this.movieKonstructor.friction.value = 0;
         this.movieKonstructor.l_damp.value = -0.1;
         this.movieKonstructor.a_damp.value = -0.1;
      }
      
      internal function showGabarits(param1:MovieClip) : *
      {
         this.movieKonstructor.density.enabled = true;
         this.movieKonstructor.restitution.enabled = true;
         this.movieKonstructor.friction.enabled = true;
         this.movieKonstructor.mirrorShape.enabled = true;
         this.movieKonstructor.l_damp.enabled = true;
         this.movieKonstructor.a_damp.enabled = true;
         this.movieKonstructor.density.value = param1.density;
         this.movieKonstructor.restitution.value = param1.restitution;
         this.movieKonstructor.friction.value = param1.friction;
         this.movieKonstructor.strength.value = param1.strength;
         var _loc2_:String = param1.a_damp;
         var _loc3_:String = param1.l_damp;
         this.movieKonstructor.l_damp.value = param1.l_damp;
         this.movieKonstructor.a_damp.value = param1.a_damp;
         this.movieKonstructor.widthShape.enabled = true;
         this.movieKonstructor.heightShape.enabled = true;
         this.movieKonstructor.rotationShape.enabled = true;
         var _loc4_:Number = param1.rotation;
         param1.rotation = 0;
         this.movieKonstructor.xShape.enabled = true;
         this.movieKonstructor.yShape.enabled = true;
         this.movieKonstructor.xShape.value = param1.x;
         this.movieKonstructor.yShape.value = param1.y;
         this.movieKonstructor.widthShape.value = param1.width;
         this.movieKonstructor.heightShape.value = param1.height;
         if(int(param1.mirrorShape) == 1)
         {
            this.movieKonstructor.mirrorShape.selected = true;
         }
         else
         {
            this.movieKonstructor.mirrorShape.selected = false;
         }
         param1.rotation = _loc4_;
         this.movieKonstructor.rotationShape.value = param1.rotation;
         this.correctGadarits(param1);
      }
      
      public function getGabarits() : Array
      {
         trace("getGabaritStrength Konstructor" + this.movieKonstructor.strength.value);
         return [this.numGabSelected,this.movieKonstructor.widthShape.value,this.movieKonstructor.heightShape.value,this.movieKonstructor.rotationShape.value,this.movieKonstructor.density.value,this.movieKonstructor.friction.value,this.movieKonstructor.restitution.value,this.movieKonstructor.xShape.value,this.movieKonstructor.yShape.value,this.movieKonstructor.mirrorShape.selected,null,this.movieKonstructor.strength.value,this.movieKonstructor.l_damp.value,this.movieKonstructor.a_damp.value];
      }
      
      private function seachStringInArr(param1:Array, param2:String) : Boolean
      {
         var _loc3_:String = null;
         for each(_loc3_ in param1)
         {
            if(param2.indexOf(_loc3_) > -1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function correctGadarits(param1:MovieClip) : void
      {
         var _loc2_:String = param1.toString();
         this.speedToRotation();
         if(_loc2_.indexOf("revolute") > -1 || _loc2_.indexOf("joint") > -1)
         {
            this.movieKonstructor.rotationShape.enabled = true;
            this.rotationToSpeed();
         }
         if(_loc2_.indexOf("steklo") > -1 || _loc2_.toString().indexOf("t_stak") > -1 || _loc2_.toString().indexOf("bank") > -1)
         {
            this.movieKonstructor.rest.text = "strength";
            this.movieKonstructor.strength.visible = true;
            this.movieKonstructor.restitution.visible = false;
         }
         else
         {
            this.movieKonstructor.rest.text = "restitution";
            this.movieKonstructor.strength.visible = false;
            this.movieKonstructor.restitution.visible = true;
         }
      }
      
      private function stopAllmovie(param1:Sprite) : void
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_) as MovieClip;
            if(_loc3_)
            {
               _loc3_.gotoAndStop(1);
            }
            _loc2_++;
         }
      }
      
      private function setType(param1:String) : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:String = null;
         this.nameTypeObjectSelected = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.movieKonstructor.numChildren)
         {
            _loc3_ = this.movieKonstructor.getChildAt(_loc2_) as MovieClip;
            if(_loc3_)
            {
               _loc4_ = _loc3_.toString();
               if(_loc4_.indexOf("contFor") > -1)
               {
                  _loc3_.visible = false;
                  this.stopAllmovie(_loc3_);
                  if(_loc4_.indexOf("contFor" + param1) > -1)
                  {
                     _loc3_.visible = true;
                     this.kontTela = _loc3_;
                  }
               }
            }
            _loc2_++;
         }
         dispatchEvent(new Event(this.CHANGE_TYPE));
      }
      
      public function destroy() : void
      {
         var _loc1_:* = undefined;
         removeEventListener(Event.ENTER_FRAME,this.mouseOutFromCaption);
         this.movieCaption.removeEventListener(MouseEvent.MOUSE_OVER,this.showKonstructor);
         this.movieCaption.removeEventListener(MouseEvent.CLICK,this.showOrHideKonstruktor);
         this.buttonHideWindow.removeEventListener(MouseEvent.CLICK,this.but_hideWindowClick);
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMove);
         this.movieKonstructor.widthShape.removeEventListener("change",this.changeWidthEvent);
         this.movieKonstructor.heightShape.removeEventListener("change",this.changeHeightEvent);
         this.movieKonstructor.rotationShape.removeEventListener("change",this.changeRotEvent);
         this.movieKonstructor.xShape.removeEventListener("change",this.changexEvent);
         this.movieKonstructor.yShape.removeEventListener("change",this.changeyEvent);
         this.movieKonstructor.density.removeEventListener("change",this.changeDensityEvent);
         this.movieKonstructor.restitution.removeEventListener("change",this.changeRestitutionEvent);
         this.movieKonstructor.friction.removeEventListener("change",this.changeFrictionEvent);
         this.movieKonstructor.mirrorShape.removeEventListener("change",this.changeMirrorEvent);
         this.movieKonstructor.strength.removeEventListener("change",this.changeStrengthEvent);
         this.movieKonstructor.l_damp.removeEventListener("change",this.changeLdampEvent);
         this.movieKonstructor.a_damp.removeEventListener("change",this.changeAdampEvent);
         this.movieKonstructor.moveL.removeEventListener("change",this.changeMoveL);
         this.movieKonstructor.sett.del.removeEventListener(MouseEvent.CLICK,this.delList);
         this.movieKonstructor.bg.removeEventListener("change",this.changeBgEvent);
         while(this.movieKonstructor.numChildren)
         {
            _loc1_ = this.movieKonstructor.getChildAt(0);
            this.movieKonstructor.removeChild(_loc1_);
            _loc1_ = null;
         }
         this.movieKonstructor = null;
         this.kontForMoveTela = null;
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
   }
}

