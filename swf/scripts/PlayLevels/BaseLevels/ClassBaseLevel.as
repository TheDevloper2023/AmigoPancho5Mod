package PlayLevels.BaseLevels
{
   import PlayLevels.amigoPancho.ClassOwnObjectsByName;
   import StructureGame.ClassControlGame;
   import StructureGame.InterfaceGame.ClassHelpTextLevel;
   import Tela.ClassBaseGameObject;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.xml.XMLNode;
   
   public class ClassBaseLevel extends ClassMouseEvents
   {
      
      public static var scores:Number;
      
      public static var settingLevel:XML;
      
      public static var numLevel:int;
      
      public static var isLevelOver:Boolean;
      
      public static var xL:Number;
      
      public static var yL:Number;
      
      public static var lastFon:String;
      
      public static var arrGameObjects:Array = [];
      
      public static var arrNewObjectGame:Array = [];
      
      public static var numFon:int = 0;
      
      public const LEVEL_WIN:String = "LEVEL_WIN";
      
      public const LEVEL_LOSE:String = "LEVEL_LOSE";
      
      public const LEVEL_CHANGESCORE:String = "LEVEL_CHANGESCORE";
      
      public const LEVEL_SHOOT:String = "LEVEL_SHORT";
      
      public const EVENT_LEVEL:String = "EVENT_LEVEL";
      
      public const LEVEL_NEXT:String = "LEVEL_NEXT";
      
      public const LEVEL_RESET:String = "LEVEL_RESET";
      
      public const UNVIS_L:String = "UNVIS_L";
      
      public const UNVIS_R:String = "UNVIS_R";
      
      public const VIS_L:String = "VIS_L";
      
      public const VIS_R:String = "VIS_R";
      
      public const CLICK:String = "CLICK";
      
      public var nameCurEvent:String = "";
      
      public var nameLevel:String;
      
      public var nickLevel:String;
      
      public var fonLevel:String;
      
      public var isLevelWin:Boolean;
      
      public var isLevelLose:Boolean;
      
      public var isTimeOver:Boolean;
      
      public var isStopTestingLevelCompleted:Boolean;
      
      public var isStopTestingLevelLose:Boolean;
      
      public var xmlLevel:XML;
      
      public var isStartListenenKeys:Boolean;
      
      public var sptiteForFon:MovieClip = new MovieClip();
      
      public var objectHelpTextLevel:ClassHelpTextLevel;
      
      public var sptiteForScoreTable:Sprite = new Sprite();
      
      public function ClassBaseLevel()
      {
         super();
         arrNewObjectGame = [];
         arrGameObjects = [];
         this.isTimeOver = false;
         isLevelOver = false;
         addChild(this.sptiteForFon);
         numLevel = ClassSetDataGame.tekLevel;
         scores = ClassSetDataGame.startScoreLevel;
         this.setScoreChanges(0);
         if(numLevel == 0)
         {
            this.xmlLevel = ClassSetDataGame.getXMLLevelFromShara(0);
         }
         else if(ClassFlags.isLevelsFromCode)
         {
            this.xmlLevel = ClassSetDataGame.getXMLLevelFromCode(numLevel);
         }
         else
         {
            this.xmlLevel = ClassSetDataGame.getXMLLevelFromShara(numLevel);
         }
         this.parseLevel();
         addEventListener(Event.ADDED_TO_STAGE,this.addToStage);
         this.objectHelpTextLevel = new ClassHelpTextLevel();
         this.objectHelpTextLevel.start();
         addChild(this.objectHelpTextLevel);
         addChild(this.sptiteForScoreTable);
      }
      
      public function sendScoreTable(param1:Array) : void
      {
         var _loc2_:DisplayObject = null;
         for each(_loc2_ in param1)
         {
            this.sptiteForScoreTable.addChild(_loc2_);
         }
      }
      
      public function setOverScoreTable() : void
      {
         addChild(this.sptiteForScoreTable);
      }
      
      public function addToStage(param1:Event = null) : void
      {
         this.isStartListenenKeys = true;
         removeEventListener(Event.ADDED_TO_STAGE,this.addToStage);
         stage.focus = stage;
         setListenMouse();
         addEventListener(Event.ENTER_FRAME,this.update);
      }
      
      public function mouseOverMenu() : void
      {
      }
      
      public function mouseOutMenu() : void
      {
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc3_:ClassMouseEvents = null;
         xL = x;
         yL = y;
         var _loc2_:* = 0;
         while(_loc2_ < arrGameObjects.length)
         {
            _loc3_ = arrGameObjects[_loc2_] as ClassMouseEvents;
            if(_loc3_.isLive == false)
            {
               this.destroyGameObject(_loc3_);
               arrGameObjects.splice(_loc2_,1);
               _loc2_--;
            }
            else
            {
               this.updateGameObject(_loc3_);
            }
            _loc2_++;
         }
         this.checkKeys();
         this.addNewGameObjects();
         super.update(param1);
      }
      
      public function addNewGameObjects() : void
      {
         if(arrNewObjectGame.length)
         {
            arrGameObjects = arrGameObjects.concat(arrNewObjectGame);
            arrNewObjectGame = [];
         }
      }
      
      public function checkKeys() : void
      {
      }
      
      public function destroyGameObject(param1:ClassMouseEvents) : void
      {
         param1.destroy();
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
         param1 = null;
      }
      
      public function updateGameObject(param1:ClassMouseEvents) : void
      {
         param1.update();
      }
      
      public function setCountStars(param1:int) : void
      {
      }
      
      public function saveXMLStrLevel() : void
      {
         ClassSetDataGame.saveXMLLevelToShara(this.xmlLevel,0);
      }
      
      public function getEvent() : String
      {
         return this.nameCurEvent;
      }
      
      public function setReset() : void
      {
         this.nameCurEvent = this.LEVEL_RESET;
         dispatchEvent(new Event(this.EVENT_LEVEL));
      }
      
      public function setLose() : void
      {
         if(isLevelOver == false)
         {
            this.nameCurEvent = this.LEVEL_LOSE;
            this.isLevelWin = false;
            this.isLevelLose = true;
            this.setOver();
            dispatchEvent(new Event(this.EVENT_LEVEL));
         }
      }
      
      public function setWin() : void
      {
         if(isLevelOver == false)
         {
            this.nameCurEvent = this.LEVEL_WIN;
            this.isLevelWin = true;
            this.isLevelLose = false;
            if(ClassControlGame.objectAchi)
            {
               ClassControlGame.objectAchi.updateBadges(numLevel,ClassInformGame.EVENT_LEVEL_COMPLETED,0);
            }
            this.setOver();
            dispatchEvent(new Event(this.EVENT_LEVEL));
            dispatchEvent(new Event(this.LEVEL_WIN));
         }
      }
      
      public function setOver() : void
      {
         isLevelOver = true;
      }
      
      public function screenScoreStop() : void
      {
      }
      
      public function setScoreChanges(param1:Number) : void
      {
         scores += param1;
         if(scores < 0)
         {
            scores = 0;
         }
         else
         {
            this.nameCurEvent = this.LEVEL_CHANGESCORE;
            dispatchEvent(new Event(this.EVENT_LEVEL));
         }
      }
      
      public function setNextLevel() : void
      {
         this.nameCurEvent = this.LEVEL_NEXT;
         this.isStopTestingLevelCompleted = true;
         this.isLevelWin = true;
         this.isLevelLose = false;
         dispatchEvent(new Event(this.EVENT_LEVEL));
      }
      
      public function getScores() : Number
      {
         return scores;
      }
      
      private function getScore() : Number
      {
         return scores;
      }
      
      internal function parseLevel() : void
      {
         var _loc1_:XMLNode = null;
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc5_:MovieClip = null;
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc8_:String = null;
         var _loc9_:Class = null;
         var _loc10_:ClassBaseGameObject = null;
         if(this.xmlLevel == null)
         {
            return;
         }
         for each(_loc2_ in this.xmlLevel.children())
         {
            if(_loc2_.name() == "jopa")
            {
               _loc3_ = _loc2_.attribute("fon");
               if(numLevel != 32)
               {
                  _loc3_ = "1";
                  if(numLevel > 15)
                  {
                     _loc3_ = "2";
                  }
                  ClassSetDataGame.setLastFon(_loc3_);
               }
               else
               {
                  _loc3_ = ClassSetDataGame.getLastFon();
               }
               _loc4_ = amigo5.swfMoviesFon.getAssetClass("fon_" + _loc3_);
               ClassSetDataGame.setLastFon(_loc3_);
               _loc5_ = new _loc4_();
               _loc5_.cacheAsBitmap = true;
               addChild(_loc5_);
               for each(_loc6_ in _loc2_.children())
               {
                  if(_loc6_.name() == "setting")
                  {
                     settingLevel = _loc6_;
                  }
               }
               for each(_loc6_ in _loc2_.children())
               {
                  if(_loc6_.name() == "bodies")
                  {
                     for each(_loc7_ in _loc6_.children())
                     {
                        if(_loc7_.name() == "body")
                        {
                           _loc8_ = _loc7_.attribute("name");
                           _loc9_ = ClassGameObjectsName.getNameClass(_loc8_);
                           if(_loc9_ == null)
                           {
                              _loc9_ = ClassOwnObjectsByName.getNameClass(_loc8_);
                           }
                           if(_loc9_)
                           {
                              _loc10_ = new _loc9_(_loc8_);
                              trace("nameObject " + _loc8_);
                              _loc10_.setOptions(_loc7_);
                              _loc10_.y += amigo5.deltaY;
                              addChild(_loc10_);
                              _loc10_.init();
                              _loc10_.sendGameObjects(arrGameObjects);
                              arrGameObjects.push(_loc10_);
                           }
                           else
                           {
                              trace("Не найден класс для объекта игры " + _loc8_);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      override public function mouseDown(param1:MouseEvent = null) : void
      {
         super.mouseDown(param1);
         this.nameCurEvent = this.CLICK;
         dispatchEvent(new Event(this.EVENT_LEVEL));
      }
      
      override public function destroy() : void
      {
         var _loc1_:ClassMouseEvents = null;
         this.objectHelpTextLevel.parent.removeChild(this.objectHelpTextLevel);
         this.objectHelpTextLevel.destroy();
         this.objectHelpTextLevel = null;
         removeChild(this.sptiteForScoreTable);
         isLevelOver = true;
         removeEventListener(Event.ENTER_FRAME,this.update);
         removeChild(this.sptiteForFon);
         this.sptiteForFon = null;
         ClassKeys.falsePress();
         removeEventListener(Event.ADDED_TO_STAGE,this.addToStage);
         while(arrNewObjectGame[0])
         {
            _loc1_ = arrNewObjectGame[0];
            this.destroyGameObject(_loc1_);
            arrNewObjectGame.splice(0,1);
         }
         while(arrGameObjects[0])
         {
            _loc1_ = arrGameObjects[0];
            this.destroyGameObject(_loc1_);
            arrGameObjects.splice(0,1);
         }
         arrGameObjects = null;
         arrNewObjectGame = null;
         this.xmlLevel = null;
         settingLevel = null;
         super.destroy();
      }
   }
}

