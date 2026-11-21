package EditorLevels
{
   import MenuGame.*;
   import StructureGame.ClassDamping;
   import StructureGame.InterfaceGame.ClassButtonSound;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.text.TextField;
   import flash.xml.XMLNode;
   
   public class ClassEditor extends ClassDamping
   {
      
      public static var isPush:Boolean;
      
      private static var rezhim:String;
      
      private static var wasChangeOnLevel:Boolean = false;
      
      public static var arrUndo:Array = [];
      
      private var currentEvent:String;
      
      private var konstructor:ClassKonstructor;
      
      private var level:ClassLevel;
      
      private var menuKonstruktor:ClassMenuKonstruktor;
      
      private var doLevel:ClassDoLevel;
      
      private var shareObgects:ClassShareObgects;
      
      private var nameGame:String;
      
      private var isMusicPlay:Boolean;
      
      private var isSoundPlay:Boolean;
      
      private var message:ClassMessage;
      
      private var buttonSound:ClassButtonSound;
      
      public const SOUND_ON:String = "SOUND_ON";
      
      public const SOUND_OFF:String = "SOUND_OFF";
      
      public const MUSIC_ON:String = "MUSIC_ON";
      
      public const MUSIC_OFF:String = "MUSIC_OFF";
      
      private const CREATE:String = "CREATE";
      
      private const NEWWINDOWS:String = "NEWWINDOWS";
      
      public const MENU:String = "MENU";
      
      public const TEST:String = "TEST";
      
      public const SELECTOR:String = "SELECTOR";
      
      private var objectSend:ClassSend;
      
      private var isImport:* = false;
      
      public function ClassEditor()
      {
         super();
      }
      
      public function startCreate() : void
      {
         var _loc2_:MovieClip = null;
         if(rezhim != this.TEST)
         {
            wasChangeOnLevel = false;
         }
         rezhim = this.CREATE;
         this.doLevel = new ClassDoLevel();
         var _loc1_:Array = this.doLevel.makeMovieLevelFromStr();
         _loc2_ = _loc1_[0] as MovieClip;
         this.level = new ClassLevel(_loc2_,this.nameGame);
         addChild(this.level);
         this.menuKonstruktor = new ClassMenuKonstruktor();
         this.menuKonstruktor.setLevelName("level: " + _loc2_.nameLevel);
         this.menuKonstruktor.setNickName("created by " + _loc2_.nickLevel);
         addChild(this.menuKonstruktor);
         var _loc3_:Number = 56;
         var _loc4_:Number = 22;
         this.buttonSound = new ClassButtonSound();
         this.buttonSound.setPosition(new Point(133.6,440),new Point(167.6,440));
         this.buttonSound.visible = false;
         addChild(this.buttonSound);
         this.konstructor = new ClassKonstructor(this.nameGame);
         this.konstructor.setFon(_loc2_.fon);
         this.konstructor.setAlphaKonstruktor(_loc2_.alphaKonstruktor);
         this.konstructor.setStateKonstruktor(new Point(_loc2_.xKonstruktor,_loc2_.yKonstruktor));
         this.konstructor.setSelectedType(_loc2_.selectedType);
         this.konstructor.setStateSliderL_XY(this.level.x,this.level.y);
         this.konstructor.setSetting(_loc1_[1] as XML);
         addChild(this.konstructor);
         this.objectSend = new ClassSend();
         addChild(this.objectSend);
         this.shareObgects = new ClassShareObgects();
         this.message = new ClassMessage();
         this.appearanceCompleted(null);
         y = amigo5.deltaY;
      }
      
      private function appearanceCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.appearanceCompleted);
         this.buttonSound.addEventListener(this.buttonSound.EVENT_PRESS,this.eventFromSoundMusic);
         this.menuKonstruktor.addEventListener(this.menuKonstruktor.START_EVENT,this.eventFromMenu);
         this.level.addEventListener(this.level.TELO_VYBRANO,this.pressOnTelo);
         this.level.addEventListener(this.level.PRESS_ON_LEVEL,this.pressOnLevel);
         this.level.addEventListener(this.level.LEVEL_CHANGE,this.levelChange);
         this.level.addEventListener(this.level.TEST,this.goTest);
         this.level.addEventListener(this.level.LOOK_KOORD_MOVIE_TELO,this.getOutKonstruktor);
         this.level.addEventListener(this.level.START_IMPORT,this.goIMPORT);
         this.level.addEventListener(this.level.SHOW_CODELEVEL,this.goShowCodeLevel);
         this.konstructor.addEventListener(this.konstructor.TELO_PEREDANO,this.putMovieFromKonstrOnLevel);
         this.konstructor.addEventListener(this.konstructor.CHANGE_GABARITS,this.setGabaritsTeloOnLevel);
         this.konstructor.addEventListener(this.konstructor.CHANGE_FON,this.setChangeFon);
         this.konstructor.addEventListener(this.konstructor.CHANGE_ALPHA,this.setChangeAlpha);
         this.konstructor.addEventListener(this.konstructor.CHANGE_MOVEL,this.setChangeMoveL);
         this.konstructor.addEventListener(this.konstructor.CHANGE_MOVEL_X,this.setChangeMoveL_X);
         this.konstructor.addEventListener(this.konstructor.CHANGE_MOVEL_Y,this.setChangeMoveL_Y);
         this.konstructor.addEventListener(this.konstructor.CHANGE_LEVEL_S,this.setChangeLevel_S);
         this.konstructor.addEventListener(this.konstructor.CHANGE_STATE,this.setChangeState);
         this.konstructor.addEventListener(this.konstructor.CHANGE_TYPE,this.setChangeType);
      }
      
      private function eventFromMenu(param1:Event) : void
      {
         switch(this.menuKonstruktor.curEvent)
         {
            case this.menuKonstruktor.TEST:
               this.goTest(null);
               break;
            case this.menuKonstruktor.CLEAR:
               this.goClear(null);
               break;
            case this.menuKonstruktor.SAVE:
               // Hardcode this for now
               this.goShare(null);
               break;
            case this.menuKonstruktor.SEND:
               // Hardcode this for now
               this.goShare(null); //this.goSEND(null);
               break;
            case this.menuKonstruktor.SHARE:
               this.goShare(null);
               break;
            case this.menuKonstruktor.LOAD:
               this.goLOAD(null);
               break;
            case this.menuKonstruktor.MENU:
               this.goMenu(null);
               break;
            case this.menuKonstruktor.SELECTOR:
               this.goSelector(null);
               break;
            case this.menuKonstruktor.UNDO:
               this.goUndo(null);
               break;
            case this.menuKonstruktor.TUTORIAL:
               this.goTutoroal(null);
               break;
            case this.menuKonstruktor.IMPORT:
               this.goIMPORT(null);
         }
      }
      
      private function goIMPORT(param1:Event) : void
      {
         var closeCodeText:Function;
         var movieClass:Class = null;
         var movieCode:MovieClip = null;
         var textField:TextField = null;
         var saveCodeText:Function = null;
         var e:Event = param1;
         if(this.isImport == false)
         {
            closeCodeText = function(param1:MouseEvent = null):void
            {
               movieCode.but_ok.removeEventListener(MouseEvent.CLICK,saveCodeText);
               movieCode.removeChild(movieCode.but_ok);
               removeChild(movieCode);
               movieCode = null;
               isImport = false;
               level.isStopAll = false;
               stage.focus = level;
            };
            saveCodeText = function(param1:MouseEvent):void
            {
               var _loc5_:XML = null;
               var _loc2_:XML = new XML(textField.text);
               var _loc3_:SharedObject = SharedObject.getLocal(ClassInformGame.nameGame);
               var _loc4_:Number = 1;
               while(_loc3_.data["xmlLevel_" + _loc4_])
               {
                  _loc4_++;
               }
               for each(_loc5_ in _loc2_.children())
               {
                  if(_loc5_.name() == "jopa")
                  {
                     if(_loc5_.attribute("nameLevel") == "")
                     {
                        _loc5_.@nameLevel = "Level_" + _loc4_.toString();
                     }
                     if(_loc5_.attribute("nickLevel") == "")
                     {
                        _loc5_.@nickLevel = "no Nick";
                     }
                     if(_loc5_.attribute("numberLevel") == "")
                     {
                        _loc5_.@numLevel = "0";
                     }
                     while(getIsThisLevelExists(_loc5_.attribute("nameLevel")))
                     {
                        _loc5_.@nameLevel = _loc5_.attribute("nameLevel") + "_";
                     }
                     _loc3_.data["xmlLevel_" + _loc4_.toString()] = new XML("<xml>" + _loc5_.toString() + "</xml>");
                     _loc4_++;
                  }
               }
               isImport = false;
               closeCodeText();
            };
            this.isImport = true;
            this.level.isStopAll = true;
            movieClass = amigo5.swfMoviesInterface.getAssetClass("codeLevels");
            movieCode = new movieClass();
            textField = movieCode.textCode as TextField;
            textField.text = "Paste the data of level into this window";
            textField.selectable = true;
            movieCode.width = 690;
            movieCode.height = 460;
            addChild(movieCode);
            movieCode.but_ok.addEventListener(MouseEvent.CLICK,saveCodeText);
            textField.setSelection(0,20000);
            stage.focus = textField;
            textField.alwaysShowSelection = true;
         }
      }
      
      private function getIsThisLevelExists(param1:String) : Boolean
      {
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc2_:Number = 1;
         var _loc3_:SharedObject = SharedObject.getLocal(ClassInformGame.nameGame);
         while(_loc3_.data["xmlLevel_" + _loc2_])
         {
            _loc4_ = _loc3_.data["xmlLevel_" + _loc2_];
            for each(_loc5_ in _loc4_.children())
            {
               if(_loc5_.name() == "jopa")
               {
                  _loc6_ = _loc5_.attribute("nameLevel");
                  if(_loc6_ == param1)
                  {
                     return true;
                  }
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      private function goShowCodeLevel(param1:Event) : void
      {
         var movieClass:Class = null;
         var movieCode:MovieClip = null;
         var textField:TextField = null;
         var xmlLevel:XML = null;
         var closeCodeText:Function = null;
         var e:Event = param1;
         if(this.isImport == false)
         {
            closeCodeText = function(param1:MouseEvent = null):void
            {
               movieCode.but_ok.removeEventListener(MouseEvent.CLICK,closeCodeText);
               movieCode.removeChild(movieCode.but_ok);
               removeChild(movieCode);
               movieCode = null;
               isImport = false;
               level.isStopAll = false;
               stage.focus = level;
               rezhim = CREATE;
            };
            this.isImport = true;
            this.level.isStopAll = true;
            movieClass = amigo5.swfMoviesInterface.getAssetClass("codeLevels");
            movieCode = new movieClass();
            textField = movieCode.textCode as TextField;
            rezhim = this.NEWWINDOWS;
            this.level.unloadMovieFromSeleralMovie();
            xmlLevel = this.getStrLevel();
            textField.text = xmlLevel.toString();
            movieCode.width = 690;
            movieCode.height = 460;
            addChild(movieCode);
            movieCode.but_ok.addEventListener(MouseEvent.CLICK,closeCodeText);
            textField.setSelection(0,200000);
            stage.focus = textField;
            textField.alwaysShowSelection = true;
         }
      }
      
      private function eventFromSoundMusic(param1:Event) : void
      {
         switch(this.buttonSound.EVENT_PressButton)
         {
            case this.buttonSound.SOUND_OFF:
               this.soundOff(param1);
               break;
            case this.buttonSound.SOUND_ON:
               this.soundOn(param1);
               break;
            case this.buttonSound.MUSIC_ON:
               this.musicOn(param1);
               break;
            case this.buttonSound.MUSIC_OFF:
               this.musicOff(param1);
         }
      }
      
      public function getStrLevel() : XML
      {
         var _loc1_:MovieClip = this.level.getMovieLevel();
         var _loc2_:XMLNode = this.konstructor.getSetting();
         return this.doLevel.makeStrLevelFromMovie(_loc1_,_loc2_);
      }
      
      private function pressOnTelo(param1:Event) : void
      {
         var _loc2_:MovieClip = this.level.getSelectedTelo();
         if(_loc2_)
         {
            trace(_loc2_ + " x=" + _loc2_.x + "   y=" + _loc2_.y);
            if(!this.level.isSelectSeveralTels)
            {
               this.konstructor.showGabarits(_loc2_);
            }
         }
      }
      
      private function getOutKonstruktor(param1:Event) : void
      {
         this.konstructor.hideKonstructor(this.level.getKoordCurentTelo());
      }
      
      private function pressOnLevel(param1:Event) : void
      {
         this.level.noFlash();
         this.konstructor.hideGabarits();
      }
      
      private function levelChange(param1:Event = null) : void
      {
         if(this.level.isNoSave)
         {
            return;
         }
         var _loc2_:XML = this.getStrLevel();
         if(_loc2_ != arrUndo[arrUndo.length - 1])
         {
            wasChangeOnLevel = true;
            isPush = true;
            arrUndo.push(_loc2_);
            if(arrUndo.length > 100)
            {
               arrUndo.splice(0,1);
            }
         }
         ClassSetDataGame.saveXMLLevelToShara(_loc2_,0);
         ClassSetDataGame.isTestWas = false;
         ClassSetDataGame.saveNumLastLevel(0);
      }
      
      private function putMovieFromKonstrOnLevel(param1:Event) : void
      {
         this.level.addTelo(this.konstructor.selectedTelo,this.konstructor.getTypeSelected());
      }
      
      private function setGabaritsTeloOnLevel(param1:Event) : void
      {
         trace("setGabaritsTeloOnLevel Editor ");
         this.level.setGabarits(this.konstructor.getGabarits());
      }
      
      private function setChangeFon(param1:Event) : void
      {
         this.level.changeFon(this.konstructor.getNameFon());
      }
      
      private function setChangeAlpha(param1:Event) : void
      {
         this.level.changeAlphaKonstkuktor(this.konstructor.getAlpha());
         this.levelChange();
      }
      
      private function setChangeMoveL(param1:Event) : void
      {
         this.level.setModeMoveL(this.konstructor.getIsMoveLevel());
         this.levelChange();
      }
      
      private function setChangeMoveL_X(param1:Event) : void
      {
         this.level.setMoveL_X(this.konstructor.getMoveL_X());
      }
      
      private function setChangeMoveL_Y(param1:Event) : void
      {
         this.level.setMoveL_Y(this.konstructor.getMoveL_Y());
      }
      
      private function setChangeLevel_S(param1:Event) : void
      {
         this.level.setLevel_S(this.konstructor.getLevel_S());
      }
      
      private function setChangeType(param1:Event = null) : void
      {
         this.level.changeTypeSelected(this.konstructor.getTypeSelected());
         this.levelChange();
      }
      
      private function setChangeState(param1:Event) : void
      {
         var _loc2_:Point = this.konstructor.getState();
         this.level.changeStateKonstkuktor(_loc2_.x,_loc2_.y);
         this.levelChange();
      }
      
      private function goMenu(param1:Event) : void
      {
         this.goMenuOk();
      }
      
      private function goMenuNo(param1:Event = null) : void
      {
         this.level.isStopAll = false;
         this.message.removeEventListener(this.message.PRESS_OK,this.goMenuOk);
         this.message.removeEventListener(this.message.PRESS_CANCEL,this.goMenuNo);
         this.message.hide();
      }
      
      private function goMenuOk(param1:Event = null) : void
      {
         if(wasChangeOnLevel)
         {
            this.goMenuNo(param1);
         }
         this.level.unloadMovieFromSeleralMovie();
         this.extinction(this.MENU);
      }
      
      private function goSelector(param1:Event) : void
      {
         this.goSelectorOk();
      }
      
      private function goSelectorNo(param1:Event = null) : void
      {
         this.level.isStopAll = false;
         this.message.removeEventListener(this.message.PRESS_OK,this.goSelectorOk);
         this.message.removeEventListener(this.message.PRESS_CANCEL,this.goSelectorNo);
         this.message.destroy();
      }
      
      private function goSelectorOk(param1:Event = null) : void
      {
         if(wasChangeOnLevel)
         {
            this.goSelectorNo(param1);
         }
         this.level.unloadMovieFromSeleralMovie();
         this.extinction(this.SELECTOR);
      }
      
      private function goTest(param1:Event) : void
      {
         if(rezhim == this.CREATE)
         {
            rezhim = this.TEST;
            this.level.unloadMovieFromSeleralMovie();
            this.extinction(this.TEST);
         }
      }
      
      private function goTutoroal(param1:Event) : void
      {
         ClassLinks.goToLink("tutorial");
      }
      
      private function goClear(param1:Event) : void
      {
         if(this.CREATE)
         {
            this.level.unloadMovieFromSeleralMovie();
            this.level.clearAll();
            this.konstructor.hideGabarits();
         }
      }
      
      private function goLOAD(param1:Event) : void
      {
         trace("goLOAD");
         rezhim = this.NEWWINDOWS;
         this.level.isStopAll = true;
         this.level.unloadMovieFromSeleralMovie();
         addChild(this.shareObgects);
         this.shareObgects.loadLevel();
         this.shareObgects.addEventListener(this.shareObgects.CLOSE,this.closeNEWWINDOW);
         this.shareObgects.addEventListener(this.shareObgects.LOAD_OK,this.loadNewLevel);
      }
      
      private function loadNewLevel(param1:Event) : void
      {
         this.closeNEWWINDOW(param1);
         this.destroy();
         wasChangeOnLevel = false;
         this.startCreate();
      }
      
      private function goSEND(param1:Event) : void
      {
      }
      
      private function goShare(param1:Event) : void
      {
         var urlGame:String = null;
         var objectChareLevel:ClassChareLevel = null;
         var closeChareLevel:Function = null;
         var e:Event = param1;
         closeChareLevel = function(param1:Event):void
         {
            objectChareLevel.removeEventListener(objectChareLevel.CLOSE,closeChareLevel);
            removeChild(objectChareLevel);
            objectChareLevel = null;
            level.isStopAll = false;
            rezhim = CREATE;
            stage.focus = level.stage;
         };
         urlGame = "http://127.0.0.1:5000/linklevel" //http://www.bubblebox.com/scripts/coverorange/_rpc3LinkLevel_.php";
         objectChareLevel = new ClassChareLevel(this.getStrLevel().toString(),urlGame);
         addChild(objectChareLevel);
         rezhim = this.NEWWINDOWS;
         this.level.isStopAll = true;
         this.level.unloadMovieFromSeleralMovie();
         objectChareLevel.addEventListener(objectChareLevel.CLOSE,closeChareLevel);
      }
      
      private function goSAVE(param1:Event) : void
      {
         rezhim = this.NEWWINDOWS;
         this.level.isStopAll = true;
         this.level.unloadMovieFromSeleralMovie();
         var _loc2_:XML = this.getStrLevel();
         addChild(this.shareObgects);
         this.shareObgects.saveLevel(_loc2_,this.doLevel.getNumLevel(_loc2_),this.doLevel.getNameLevel(_loc2_),this.doLevel.getNickLevel(_loc2_));
         this.shareObgects.addEventListener(this.shareObgects.CLOSE,this.closeNEWWINDOW);
         this.shareObgects.addEventListener(this.shareObgects.NAME_LEVEL_READY,this.writeNameLevelInMenuAndMovie);
      }
      
      private function writeNameLevelInMenuAndMovie(param1:Event) : void
      {
         var _loc2_:String = this.shareObgects.getNameLevel();
         var _loc3_:String = this.shareObgects.getNickName();
         this.menuKonstruktor.setLevelName("level: " + _loc2_);
         this.menuKonstruktor.setNickName("created by " + _loc3_);
         var _loc4_:MovieClip = this.level.getMovieLevel();
         _loc4_.nameLevel = _loc2_;
         _loc4_.nickLevel = _loc3_;
         wasChangeOnLevel = false;
      }
      
      private function closeNEWWINDOW(param1:Event) : void
      {
         this.level.isStopAll = false;
         this.shareObgects.removeEventListener(this.shareObgects.NAME_LEVEL_READY,this.writeNameLevelInMenuAndMovie);
         this.shareObgects.removeEventListener(this.shareObgects.CLOSE,this.closeNEWWINDOW);
         this.shareObgects.removeEventListener(this.shareObgects.LOAD_OK,this.loadNewLevel);
         removeChild(this.shareObgects);
         stage.focus = this.level.stage;
         rezhim = this.CREATE;
      }
      
      private function musicOn(param1:Event) : void
      {
         this.isMusicPlay = true;
         this.extinction(this.MUSIC_ON);
      }
      
      private function musicOff(param1:Event) : void
      {
         this.isMusicPlay = false;
         this.extinction(this.MUSIC_OFF);
      }
      
      private function soundOn(param1:Event) : void
      {
         this.isSoundPlay = true;
         this.extinction(this.SOUND_ON);
      }
      
      private function soundOff(param1:Event) : void
      {
         this.isSoundPlay = false;
         this.extinction(this.SOUND_OFF);
      }
      
      private function goUndo(param1:Event) : void
      {
         var _loc2_:XML = null;
         if(arrUndo.length > 0)
         {
            this.level.unloadMovieFromSeleralMovie();
            if(isPush)
            {
               arrUndo.pop();
               isPush = false;
            }
            if(arrUndo.length == 1)
            {
               _loc2_ = arrUndo[0];
            }
            if(arrUndo.length > 1)
            {
               _loc2_ = arrUndo.pop();
            }
            this.destroy();
            ClassSetDataGame.saveXMLLevelToShara(_loc2_,0);
            this.startCreate();
         }
      }
      
      private function extinction(param1:String) : void
      {
         this.currentEvent = param1;
         if(param1.indexOf("MUSIC") > -1 || param1.indexOf("SOUND") > -1 || param1.indexOf("TEST") > -1)
         {
            this.extinctionCompleted(null);
            return;
         }
         action(this,ACTION_EXTINCTION);
         addEventListener(EVENT_COMPLETED,this.extinctionCompleted);
      }
      
      private function extinctionCompleted(param1:Event) : void
      {
         removeEventListener(EVENT_COMPLETED,this.extinctionCompleted);
         dispatchEvent(new Event(this.currentEvent));
      }
      
      override public function destroy() : void
      {
         this.message = null;
         removeChild(this.objectSend);
         this.objectSend.destroy();
         this.objectSend = null;
         this.buttonSound.removeEventListener(this.buttonSound.EVENT_PRESS,this.eventFromSoundMusic);
         this.buttonSound = null;
         this.konstructor.removeEventListener(this.konstructor.TELO_PEREDANO,this.putMovieFromKonstrOnLevel);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_GABARITS,this.setGabaritsTeloOnLevel);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_FON,this.setChangeFon);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_ALPHA,this.setChangeAlpha);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_TYPE,this.setChangeType);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_STATE,this.setChangeState);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_MOVEL_X,this.setChangeMoveL_X);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_MOVEL_Y,this.setChangeMoveL_Y);
         this.konstructor.removeEventListener(this.konstructor.CHANGE_LEVEL_S,this.setChangeLevel_S);
         this.konstructor.destroy();
         removeChild(this.konstructor);
         this.level.removeEventListener(this.level.TELO_VYBRANO,this.pressOnTelo);
         this.level.removeEventListener(this.level.PRESS_ON_LEVEL,this.pressOnLevel);
         this.level.removeEventListener(this.level.LEVEL_CHANGE,this.levelChange);
         this.level.removeEventListener(this.level.TEST,this.goTest);
         this.level.removeEventListener(this.level.LOOK_KOORD_MOVIE_TELO,this.getOutKonstruktor);
         this.level.removeEventListener(this.level.START_IMPORT,this.goShowCodeLevel);
         this.level.removeEventListener(this.level.SHOW_CODELEVEL,this.goShowCodeLevel);
         this.level.destroy();
         removeChild(this.level);
         this.doLevel.destroy();
         this.menuKonstruktor.removeEventListener(this.menuKonstruktor.START_EVENT,this.eventFromMenu);
         this.menuKonstruktor.destroy();
         removeChild(this.menuKonstruktor);
         if(this.shareObgects.parent)
         {
            this.shareObgects.parent.removeChild(this.shareObgects);
         }
         this.shareObgects.destroy();
         this.shareObgects = null;
         this.doLevel = null;
         this.level = null;
         this.konstructor = null;
         this.menuKonstruktor = null;
         while(numChildren)
         {
            removeChildAt(0);
         }
         super.destroy();
      }
   }
}

