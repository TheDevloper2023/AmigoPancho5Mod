package
{
   import EditorLevels.ClassDoLevel;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import flash.text.TextField;
   
   public class ClassShareObgects extends Sprite
   {
      
      private static var _so:SharedObject = SharedObject.getLocal(ClassInformGame.nameGame);
      
      private static var selectedIndexLevel:Number = 0;
      
      private var movieSave_table:MovieClip;
      
      private var xmlLevel:XML;
      
      private var numLevel:Number;
      
      private var nameLevelStr:String;
      
      private var nickNameLevelStr:String;
      
      private var doLevel:ClassDoLevel;
      
      private var nLevel:String;
      
      private var nName:String;
      
      private var message:ClassMessage;
      
      public const CLOSE:String = "CLOSE";
      
      public const LOAD_OK:String = "LOAD_OK";
      
      public const NAME_LEVEL_READY:String = "NAME_LEVEL_READY";
      
      internal var dg:Object;
      
      public function ClassShareObgects()
      {
         super();
         this.doLevel = new ClassDoLevel();
      }
      
      public static function clearShareLevels(param1:int, param2:*) : void
      {
         while(param2 > -1)
         {
            _so.data["xmlLevel_" + param1] = null;
            _so.flush();
            param1++;
            param2--;
         }
      }
      
      public function saveLevel(param1:XML, param2:Number, param3:String, param4:String) : void
      {
         var save_tablClass:Class;
         var nameLevel:TextField = null;
         var nameNick:TextField = null;
         var saveAfterClickNo:Function = null;
         var saveAfterClickOk:Function = null;
         var xmlLevel:XML = param1;
         var numLevel:Number = param2;
         var nameLevelStr:String = param3;
         var nickNameLevelStr:String = param4;
         saveAfterClickNo = function(param1:MouseEvent):void
         {
            movieSave_table.but_ok.removeEventListener(MouseEvent.CLICK,saveAfterClickOk);
            movieSave_table.but_no.removeEventListener(MouseEvent.CLICK,saveAfterClickNo);
            removeChild(movieSave_table);
            dispatchEvent(new Event(CLOSE));
            movieSave_table = null;
         };
         saveAfterClickOk = function(param1:MouseEvent):void
         {
            saveStrOnComp(xmlLevel,nameNick.text);
            nLevel = nameLevel.text;
            nName = nameNick.text;
            dispatchEvent(new Event(NAME_LEVEL_READY));
            saveAfterClickNo(null);
         };
         var saveStrOnComp:Function = function(param1:XML, param2:String):void
         {
            var _loc3_:XML = null;
            numLevel = 1;
            while(_so.data["xmlLevel_" + numLevel])
            {
               _loc3_ = _so.data["xmlLevel_" + numLevel];
               if(doLevel.getNameLevel(_loc3_) == nameLevel.text)
               {
                  break;
               }
               ++numLevel;
            }
            param1.jopa.@nameLevel = nameLevel.text;
            param1.jopa.@nickLevel = param2;
            _so.data["xmlLevel_" + numLevel.toString()] = param1;
            _so.data["myNameNike"] = param2;
            _so.flush();
         };
         this.xmlLevel = xmlLevel;
         this.numLevel = numLevel;
         this.nameLevelStr = nameLevelStr;
         this.nickNameLevelStr = nickNameLevelStr;
         save_tablClass = amigo5.swfMoviesKonstructor.getAssetClass("save_table");
         this.movieSave_table = new save_tablClass();
         this.movieSave_table.isSaveShare.text = "SAVE LEVEL";
         nameLevel = this.movieSave_table.nameLevel;
         nameNick = this.movieSave_table.nameNick;
         if(nickNameLevelStr == "Player" && _so.data["myNameNike"] != undefined)
         {
            nameNick.text = _so.data["myNameNike"];
         }
         else
         {
            if(!nickNameLevelStr)
            {
               nickNameLevelStr = "Anton";
            }
            nameNick.text = nickNameLevelStr;
         }
         if(!nameLevelStr)
         {
            nameLevelStr = "Level 1";
         }
         nameLevel.text = nameLevelStr;
         nameLevel.setSelection(0,200);
         stage.focus = nameLevel;
         nameLevel.alwaysShowSelection = true;
         this.movieSave_table.but_ok.addEventListener(MouseEvent.CLICK,saveAfterClickOk);
         this.movieSave_table.but_no.addEventListener(MouseEvent.CLICK,saveAfterClickNo);
         addChild(this.movieSave_table);
      }
      
      public function getNameLevel() : String
      {
         return this.nLevel;
      }
      
      public function getNickName() : String
      {
         return this.nName;
      }
      
      public function loadLevel() : void
      {
         var tekLevel:Number;
         var movieLoad_tabl:MovieClip = null;
         var loadAfterClickNo:Function = null;
         var loadAfterClickOk:Function = null;
         var loadAfterClickDel:Function = null;
         var messageDestroy:Function = null;
         var loadAfterClickDelAndOk:Function = null;
         var tekStrLevrl:XML = null;
         var doLevel:ClassDoLevel = null;
         var nameLevel:String = null;
         loadAfterClickNo = function(param1:MouseEvent):void
         {
            movieLoad_tabl.but_ok.removeEventListener(MouseEvent.CLICK,loadAfterClickOk);
            movieLoad_tabl.but_no.removeEventListener(MouseEvent.CLICK,loadAfterClickNo);
            movieLoad_tabl.but_del.removeEventListener(MouseEvent.CLICK,loadAfterClickDel);
            removeChild(movieLoad_tabl);
            dispatchEvent(new Event(CLOSE));
         };
         loadAfterClickOk = function(param1:MouseEvent):void
         {
            if(getMaxLevelNumber() == 1)
            {
               return;
            }
            var _loc2_:Number = Number(dg.selectedItem.numLevel);
            selectedIndexLevel = _loc2_ - 1;
            xmlLevel = _so.data["xmlLevel_" + _loc2_];
            ClassSetDataGame.saveXMLLevelToShara(xmlLevel,0);
            dispatchEvent(new Event(LOAD_OK));
            loadAfterClickNo(param1);
         };
         loadAfterClickDel = function(param1:Event):void
         {
            if(getMaxLevelNumber() == 1)
            {
               return;
            }
            var _loc2_:String = dg.selectedItem.label;
            loadAfterClickDelAndOk(param1);
         };
         messageDestroy = function(param1:Event):void
         {
            if(message)
            {
               message.removeEventListener(message.PRESS_OK,loadAfterClickDelAndOk);
               message.removeEventListener(message.PRESS_NO,messageDestroy);
               message.destroy();
            }
         };
         loadAfterClickDelAndOk = function(param1:Event):void
         {
            var _loc6_:XML = null;
            var _loc7_:String = null;
            messageDestroy(param1);
            var _loc2_:String = dg.selectedItem.label;
            var _loc3_:Number = 1;
            var _loc4_:Array = [];
            while(_so.data["xmlLevel_" + _loc3_])
            {
               _loc6_ = _so.data["xmlLevel_" + _loc3_];
               _loc7_ = doLevel.getNameLevel(_loc6_);
               if(_loc7_ != _loc2_)
               {
                  _loc4_.push(_loc6_);
               }
               else
               {
                  _so.data["xmlLevel_" + _loc3_] = null;
                  selectedIndexLevel = _loc3_ - 1;
               }
               _loc3_++;
            }
            if(selectedIndexLevel + 2 == _loc3_)
            {
               --selectedIndexLevel;
            }
            var _loc5_:int = 1;
            while(_loc5_ < 1000)
            {
               if(_so.data["xmlLevel_" + _loc5_])
               {
                  _so.data["xmlLevel_" + _loc5_] = null;
               }
               _loc5_++;
            }
            _loc3_ = 0;
            while(_loc4_[_loc3_])
            {
               _so.data["xmlLevel_" + (_loc3_ + 1)] = _loc4_[_loc3_];
               _loc3_++;
            }
            selectedIndexLevel = selectedIndexLevel - 1;
            if(selectedIndexLevel < 0)
            {
               selectedIndexLevel = 0;
            }
            movieLoad_tabl.but_ok.removeEventListener(MouseEvent.CLICK,loadAfterClickOk);
            movieLoad_tabl.but_no.removeEventListener(MouseEvent.CLICK,loadAfterClickNo);
            movieLoad_tabl.but_del.removeEventListener(MouseEvent.CLICK,loadAfterClickDel);
            removeChild(movieLoad_tabl);
            loadLevel();
         };
         var load_tableClass:Class = amigo5.swfMoviesKonstructor.getAssetClass("load_table");
         movieLoad_tabl = new load_tableClass();
         this.dg = (movieLoad_tabl as Object)["dataTable"];
         tekLevel = 1;
         while(_so.data["xmlLevel_" + tekLevel])
         {
            tekStrLevrl = _so.data["xmlLevel_" + tekLevel];
            doLevel = new ClassDoLevel();
            nameLevel = doLevel.getNameLevel(tekStrLevrl);
            this.dg.addItem({
               "label":nameLevel,
               "numLevel":tekLevel
            });
            tekLevel++;
         }
         this.dg.selectedIndex = selectedIndexLevel;
         this.dg.scrollToSelected();
         addChild(movieLoad_tabl);
         movieLoad_tabl.but_ok.addEventListener(MouseEvent.CLICK,loadAfterClickOk);
         movieLoad_tabl.but_no.addEventListener(MouseEvent.CLICK,loadAfterClickNo);
         movieLoad_tabl.but_del.addEventListener(MouseEvent.CLICK,loadAfterClickDel);
      }
      
      internal function getMaxLevelNumber() : Number
      {
         var _loc1_:Number = 1;
         while(_so.data["xmlLevel_" + _loc1_])
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function destroy() : *
      {
         this.movieSave_table = null;
      }
   }
}

