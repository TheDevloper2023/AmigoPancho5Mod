package
{
   import flash.geom.Point;
   import flash.net.SharedObject;
   
   public class ClassSetDataGame
   {
      
      public static var isMusicGame1:Boolean;
      
      private static var badgeAttr:String;
      
      public static var isShowIntroApple:Boolean;
      
      public static var isTestWas:Boolean;
      
      public static var lastLevel:int;
      
      private static var lastFon:String;
      
      public static var IDgame:String = "amigo5";
      
      public static var massivScores:Array = [];
      
      public static var massivOpenLevels:Array = [];
      
      public static var _so:SharedObject = SharedObject.getLocal(ClassInformGame.nameGame);
      
      public static var totalScore:Number = 0;
      
      public static var tekLevel:Number = 1;
      
      public static var kolVoLevels:Number = 31;
      
      public static var kolVoLevelForOpen:Number = 1;
      
      public static var kolVoBadges:Number = 15;
      
      public static var isGameFinish:Boolean = false;
      
      public static var isAllLevelsCompleted:Boolean = false;
      
      public static var isMusic:Boolean = false;
      
      public static var isSound:Boolean = false;
      
      public static var isGameStarted:Boolean = false;
      
      public static var isGameWasLoad:Boolean = false;
      
      private static var isBlood:Boolean = true;
      
      private static var massivStars:Array = [];
      
      public static var startScoreLevel:int = 1000;
      
      public static var countScreen:int = 1;
      
      public static var volumeMusMenu:Number = 0.8;
      
      public static var volumeMusGame:Number = 1.2;
      
      public function ClassSetDataGame()
      {
         super();
      }
      
      public static function loadDataGame() : void
      {
         badgeAttr = "d";
         isShowIntroApple = true;
         totalScore = 0;
         var _loc1_:int = 0;
         while(_loc1_ < ClassSetDataGame.kolVoLevels + 1)
         {
            massivOpenLevels[_loc1_] = _so.data["isOpenLevel_" + _loc1_];
            massivScores[_loc1_] = _so.data["level_" + _loc1_];
            if(massivScores[_loc1_] != undefined)
            {
               totalScore += massivScores[_loc1_];
            }
            _loc1_++;
         }
         openLevelsAlways();
         if(massivScores[0] != undefined)
         {
            totalScore -= massivScores[0];
         }
         if(_so.data["lastLevel"] == undefined)
         {
            _so.data["lastLevel"] = 1;
         }
         if(_so.data["previousLevel"] == undefined)
         {
            _so.data["previousLevel"] = 0;
         }
         tekLevel = _so.data["lastLevel"];
         lastLevel = _so.data["previousLevel"];
         if(_so.data["isGameFinish"] == 1)
         {
            isGameFinish = true;
         }
         if(_so.data.isMusic == undefined)
         {
            _so.data.isMusic = true;
         }
         if(_so.data.isBlood == undefined)
         {
            _so.data.isBlood = true;
         }
         if(_so.data.isSound == undefined)
         {
            _so.data.isSound = true;
         }
         if(_so.data.isMusicGame1 == undefined)
         {
            _so.data.isMusicGame1 = false;
         }
         if(_so.data.isShowIntroApple == 2)
         {
            isShowIntroApple = false;
         }
         _so.data.isMusicGame1 = !_so.data.isMusicGame1;
         isMusicGame1 = _so.data.isMusicGame1;
         isMusic = _so.data.isMusic;
         isSound = _so.data.isSound;
         isBlood = _so.data.isBlood;
         if(_so.data.isGameStarted == 1)
         {
            isGameStarted = true;
         }
         if(_so.data.isGameWasLoad == 1)
         {
            isGameWasLoad = true;
         }
         _so.data.isGameWasLoad = 1;
         if(_so.data.isAllLevelsCompleted == 1)
         {
            isAllLevelsCompleted = true;
         }
      }
      
      public static function saveNumLastLevel(param1:Number) : void
      {
         tekLevel = param1;
         _so.data["lastLevel"] = param1;
         _so.flush();
      }
      
      public static function savePreviousLevel(param1:Number) : void
      {
         lastLevel = param1;
         _so.data["lastLevel"] = param1;
         _so.flush();
      }
      
      public static function saveXMLLevelToShara(param1:XML, param2:Number) : void
      {
         _so.data["xmlLevel_" + param2] = param1;
         _so.flush();
      }
      
      public static function setLastFon(param1:String) : void
      {
         _so.data["lastFon"] = param1;
         lastFon = param1;
      }
      
      public static function getLastFon() : String
      {
         lastFon = _so.data["lastFon"];
         return lastFon;
      }
      
      public static function getXMLLevelFromCode(param1:Number) : XML
      {
         return ClassAllLevels.getStrCodeLevel(param1);
      }
      
      public static function getXMLLevelFromShara(param1:Number) : XML
      {
         var _loc2_:XML = null;
         if(_so.data["xmlLevel_" + param1.toString()])
         {
            _loc2_ = _so.data["xmlLevel_" + param1.toString()];
         }
         else
         {
            _loc2_ = null;
         }
         return _loc2_;
      }
      
      public static function getIsLevelCompleted(param1:int) : Boolean
      {
         return massivScores[param1] >= 0;
      }
      
      public static function setLevelCompleted(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            massivOpenLevels[param1] = true;
            _so.data["isOpenLevel_" + param1] = true;
            massivScores[param1] = 0;
         }
         else
         {
            massivOpenLevels[param1] = undefined;
            _so.data["isOpenLevel_" + param1] = undefined;
            massivScores[param1] = undefined;
         }
      }
      
      public static function loadShareStars() : void
      {
         var _loc2_:Point = null;
         massivStars = [];
         var _loc1_:int = 0;
         while(_loc1_ < kolVoLevels)
         {
            _loc2_ = new Point(0,0);
            _loc2_.x = _so.data["starX_" + (_loc1_ + 1)];
            _loc2_.y = _so.data["starY_" + (_loc1_ + 1)];
            massivStars.push(_loc2_);
            _loc1_++;
         }
      }
      
      public static function setStar(param1:int, param2:int = 1) : void
      {
         var _loc3_:Point = massivStars[param1 - 1] as Point;
         if(_loc3_.y < param2)
         {
            massivStars[param1 - 1] = new Point(_loc3_.x,param2);
         }
         _so.data["starX_" + param1] = massivStars[param1 - 1].x;
         _so.data["starY_" + param1] = massivStars[param1 - 1].y;
         _so.flush();
      }
      
      public static function getStar(param1:int) : Point
      {
         return massivStars[param1 - 1];
      }
      
      public static function openLevelsAlways() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= kolVoLevelForOpen)
         {
            massivOpenLevels[_loc1_] = true;
            _so.data["isOpenLevel_" + _loc1_] = true;
            _loc1_++;
         }
      }
      
      public static function setBlood(param1:Boolean) : void
      {
         _so.data.isBlood = param1;
         ClassSetDataGame.isBlood = _so.data.isBlood;
      }
      
      public static function getIsBlood() : Boolean
      {
         return isBlood;
      }
      
      public static function setShowIntroApple() : void
      {
         var _loc1_:Number = NaN;
         if(_so.data.isShowIntroApple == undefined)
         {
            _so.data.isShowIntroApple = 0;
         }
         _loc1_ = Number(_so.data.isShowIntroApple);
         _loc1_++;
         if(_loc1_ > 2)
         {
            _loc1_ = 2;
         }
         _so.data.isShowIntroApple = _loc1_;
      }
      
      public static function SaveAllAchivenetsInFirstTimeGame() : void
      {
         var _loc1_:Array = null;
         if(!isGameWasLoad)
         {
            ClassInformGame.setFirstBadges();
            for each(_loc1_ in ClassInformGame.arrBadges)
            {
               saveBadges(_loc1_[0],_loc1_[2],false,_loc1_[3],false);
            }
         }
      }
      
      public static function openNextLevel() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= ClassSetDataGame.kolVoLevels)
         {
            if(massivOpenLevels[_loc1_] == undefined)
            {
               massivOpenLevels[_loc1_] = true;
               _so.data["isOpenLevel_" + _loc1_] = true;
               break;
            }
            _loc1_++;
         }
      }
      
      public static function testAllLevelCompleted() : Boolean
      {
         if(ClassFlags.isGameOver)
         {
            return true;
         }
         isAllLevelsCompleted = true;
         var _loc1_:int = 1;
         while(_loc1_ <= ClassSetDataGame.kolVoLevels)
         {
            if(massivScores[_loc1_] == undefined)
            {
               isAllLevelsCompleted = false;
               _so.data.isAllLevelsCompleted = undefined;
               return isAllLevelsCompleted;
            }
            _loc1_++;
         }
         _so.data.isAllLevelsCompleted = 1;
         return isAllLevelsCompleted;
      }
      
      public static function clearDataGame() : void
      {
         totalScore = 0;
         tekLevel = 1;
         isGameFinish = false;
         isGameStarted = false;
         isGameWasLoad = false;
         isAllLevelsCompleted = false;
         massivOpenLevels = [];
         massivScores = [];
         var _loc1_:int = 0;
         while(_loc1_ <= kolVoLevels)
         {
            _so.data["isOpenLevel_" + _loc1_] = undefined;
            _so.data["level_" + _loc1_] = undefined;
            _so.data["isStartAfterCover" + _loc1_] = undefined;
            _so.data["coverLevel" + _loc1_] = undefined;
            _loc1_++;
         }
         _so.data["lastLevel"] = undefined;
         _so.data["previousLevel"] = undefined;
         _so.data["isGameFinish"] = undefined;
         _so.data.isGameStarted = undefined;
         _so.data.isAllLevelsCompleted = undefined;
         _so.data.isShowIntroApple = undefined;
         _so.data.slideRussia = undefined;
         _so.data.slideTexas = undefined;
         _so.data.slideTibet = undefined;
         _so.data.slideStartRussia = undefined;
         _so.data.slideStartTexas = undefined;
         _so.data.slideStartTibet = undefined;
         _so.data.frameDress = undefined;
         openLevelsAlways();
         clearStars();
      }
      
      public static function clearStars() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ <= 40)
         {
            ClassSetDataGame._so.data[_loc1_ + "star1"] = undefined;
            ClassSetDataGame._so.data[_loc1_ + "star2"] = undefined;
            ClassSetDataGame._so.data[_loc1_ + "star3"] = undefined;
            ClassSetDataGame._so.data["isGetWay" + String(_loc1_) + "_1"] = undefined;
            ClassSetDataGame._so.data["isGetWay" + String(_loc1_) + "_2"] = undefined;
            ClassSetDataGame._so.data["isGetWay" + String(_loc1_) + "_3"] = undefined;
            _loc1_++;
         }
      }
      
      public static function setGameFinish() : void
      {
         isGameFinish = true;
         _so.data["isGameFinish"] = 1;
      }
      
      public static function setLevelScoresAndTotal(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         isGameStarted = true;
         _so.data.isGameStarted = 1;
         if(massivScores[param1] != undefined)
         {
            _loc3_ = Number(massivScores[param1]);
         }
         else
         {
            openNextLevel();
         }
         if(massivScores[param1] == undefined || _loc3_ < param2)
         {
            massivScores[param1] = param2;
            _so.data["level_" + param1] = param2;
            totalScore = 0;
            _loc4_ = 0;
            while(_loc4_ < kolVoLevels)
            {
               _loc5_ = Number(massivScores[_loc4_]);
               if(_loc5_ > 0)
               {
                  totalScore += _loc5_;
               }
               _loc4_++;
            }
            if(massivScores[0] != undefined)
            {
               totalScore -= massivScores[0];
            }
         }
      }
      
      public static function getLevelScore(param1:int) : int
      {
         var _loc2_:int = 0;
         return int(massivScores[param1]);
      }
      
      public static function isRecordOnLevel(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Number = Number(massivScores[param1]);
         if(_loc3_ < param2)
         {
            return true;
         }
         return false;
      }
      
      public static function setMusicPlay(param1:Boolean) : void
      {
         isMusic = param1;
         _so.data.isMusic = isMusic;
      }
      
      public static function setSoundPlay(param1:Boolean) : void
      {
         isSound = param1;
         _so.data.isSound = isSound;
      }
      
      public static function saveBadges(param1:int, param2:Array, param3:Boolean, param4:String, param5:Boolean) : void
      {
         _so.data[badgeAttr + "_" + param1] = [param2,param3,param4,param5];
      }
      
      public static function loadDataBadge(param1:int) : Array
      {
         return _so.data[badgeAttr + "_" + param1];
      }
      
      public static function getCodeGameLevels() : String
      {
         var _loc3_:XML = null;
         var _loc1_:Number = 1;
         var _loc2_:String = "";
         while(_so.data["xmlLevel_" + _loc1_])
         {
            _loc3_ = _so.data["xmlLevel_" + _loc1_];
            _loc2_ += "strLevel=" + _loc3_.toString() + "\narrStrLevels.push(strLevel);\n";
            _loc1_++;
         }
         return _loc2_;
      }
   }
}

