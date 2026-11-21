package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.media.Sound;
   
   public class ControlSounds extends Sprite
   {
      
      private static var swfSounds:Object;
      
      public static var isReady:Boolean = false;
      
      public static var curMusicOptions:Array = [];
      
      private static var arrSounds:Array = [];
      
      private static var arrMusics:Array = [];
      
      private static var arrStrMusic:Array = [];
      
      public function ControlSounds()
      {
         super();
      }
      
      public static function playSound(param1:String, param2:Number = 1, param3:int = 1, param4:Boolean = true) : void
      {
         var _loc5_:ClassSoundCompleted = null;
         if(ClassSetDataGame.isSound)
         {
            if(param3 == 0)
            {
               param3 = 100000;
            }
            for each(_loc5_ in arrSounds)
            {
               if(_loc5_.getNameSound() == param1)
               {
                  if(_loc5_.getIsSoundPlay())
                  {
                     if(param4 != true)
                     {
                        return;
                     }
                     _loc5_.stop(null);
                  }
                  _loc5_.play(param3,param2);
                  return;
               }
            }
            trace("!NO SOUND " + param1);
         }
      }
      
      public static function playMusic(param1:String, param2:Number, param3:int = 1, param4:Number = 0) : void
      {
         var _loc5_:ClassSoundCompleted = null;
         curMusicOptions = [param1,param2,param3];
         if(ClassSetDataGame.isMusic)
         {
            if(param3 == 0)
            {
               param3 = 100000;
            }
            for each(_loc5_ in arrMusics)
            {
               if(_loc5_.getNameSound() == param1)
               {
                  if(_loc5_.getIsSoundPlay() == false)
                  {
                     _loc5_.play(param3,param2,param4);
                  }
                  return;
               }
            }
            trace("!NO SOUND " + param1);
         }
      }
      
      public static function setChangeValumeMusic(param1:String, param2:Number, param3:Number = 0.01) : void
      {
         var _loc4_:ClassSoundCompleted = null;
         trace("setChangeValumeMusic");
         if(ClassSetDataGame.isMusic)
         {
            _loc4_ = getSound("music",param1);
            changeValume(_loc4_,param2,param3,param1);
         }
      }
      
      public static function setValumeAllMusicsToZero() : void
      {
         var _loc1_:String = null;
         var _loc2_:ClassSoundCompleted = null;
         for each(_loc1_ in arrStrMusic)
         {
            _loc2_ = getSound("music",_loc1_);
            changeValume(_loc2_,0,0.05,_loc1_);
         }
      }
      
      public static function setValumeAllMusicsToBackFromZero() : void
      {
         var _loc1_:ClassSoundCompleted = getSound("music",curMusicOptions[0]);
         changeValume(_loc1_,curMusicOptions[1],0.05,curMusicOptions[0]);
      }
      
      public static function setChangeValumeSound(param1:String, param2:Number, param3:Number = 0.01) : void
      {
         var _loc4_:ClassSoundCompleted = null;
         if(ClassSetDataGame.isSound)
         {
            _loc4_ = getSound("sound",param1);
            changeValume(_loc4_,param2,param3,param1);
         }
      }
      
      private static function changeValume(param1:ClassSoundCompleted, param2:Number, param3:Number = 0.01, param4:String = "не указано") : void
      {
         if(param1)
         {
            param1.setVolume(param2,param3);
         }
         else
         {
            trace("Не могу изменить звук \'" + param4 + "\' - не найден");
         }
      }
      
      public static function stopMusic(param1:String) : void
      {
         var _loc2_:ClassSoundCompleted = null;
         for each(_loc2_ in arrMusics)
         {
            if(_loc2_.getNameSound() == param1)
            {
               _loc2_.stop();
            }
         }
      }
      
      public static function stopAllMusic() : void
      {
         var _loc1_:ClassSoundCompleted = null;
         for each(_loc1_ in arrMusics)
         {
            _loc1_.stop();
         }
      }
      
      public static function stopSound(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:ClassSoundCompleted = null;
         for each(_loc3_ in arrSounds)
         {
            if(_loc3_.getNameSound() == param1)
            {
               _loc3_.stop();
               if(!param2)
               {
                  break;
               }
            }
         }
      }
      
      public static function stopAllSounds(param1:String = "") : void
      {
         var _loc2_:ClassSoundCompleted = null;
         for each(_loc2_ in arrSounds)
         {
            if(_loc2_.getNameSound() != param1)
            {
               _loc2_.stop();
            }
         }
      }
      
      public static function loadAndPlay(param1:String = "", param2:* = 1, param3:Number = 1, param4:Boolean = false, param5:Number = 0) : ClassSoundCompleted
      {
         var _loc6_:Class = null;
         var _loc7_:ClassSoundCompleted = null;
         if(ClassSetDataGame.isSound)
         {
            _loc6_ = swfSounds.getAssetClass(param1);
            if(_loc6_)
            {
               _loc7_ = new ClassSoundCompleted(new _loc6_() as Sound);
               _loc7_.play(param2,param3,0,param4,param5);
            }
         }
         return _loc7_;
      }
      
      public static function loadSound(param1:String = "") : ClassSoundCompleted
      {
         var _loc3_:ClassSoundCompleted = null;
         var _loc2_:Class = swfSounds.getAssetClass(param1);
         if(_loc2_ != null)
         {
            _loc3_ = new ClassSoundCompleted(new _loc2_() as Sound);
         }
         return _loc3_;
      }
      
      public static function init() : void
      {
         swfSounds = new ApplicationAssetsSounds();
         swfSounds.init();
         swfSounds.addEventListener(Event.INIT,loadSounds);
      }
      
      public static function loadSounds(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         swfSounds.removeEventListener(Event.INIT,loadSounds);
         var _loc2_:Array = [];
         _loc2_.push("mFan");
         _loc2_.push("mCactusShot");
         _loc2_.push("mBurst");
         _loc2_.push("mHeroFall");
         _loc2_.push("mHeroGlad");
         _loc2_.push("mHeroFear");
         _loc2_.push("mHeroAuch");
         _loc2_.push("mHeroDieFan");
         _loc2_.push("mHeroGloomy");
         _loc2_.push("mHeroDieBee");
         _loc2_.push("mRocketStart");
         _loc2_.push("mRocketExplode");
         _loc2_.push("mRotate");
         _loc2_.push("mRotate");
         _loc2_.push("mFire");
         _loc2_.push("mErase");
         _loc2_.push("mBadFall02");
         _loc2_.push("mBadFall01");
         _loc2_.push("mAcid");
         _loc2_.push("mAchieve01");
         _loc2_.push("mMetalWood");
         _loc2_.push("mStoneWood");
         _loc2_.push("arpedgio");
         _loc2_.push("levelLose1");
         _loc2_.push("levelLose2");
         _loc2_.push("mCannon");
         _loc2_.push("fireball");
         for each(_loc3_ in _loc2_)
         {
            _loc5_ = swfSounds.getAssetClass(_loc3_);
            if(_loc5_)
            {
               arrSounds.push(new ClassSoundCompleted(new _loc5_() as Sound));
            }
         }
         _loc2_ = [];
         _loc2_ = null;
         arrStrMusic.push("mMenu");
         arrStrMusic.push("mGame01");
         arrStrMusic.push("mGame02");
         arrStrMusic.push("mGame03");
         for each(_loc4_ in arrStrMusic)
         {
            _loc5_ = swfSounds.getAssetClass(_loc4_);
            if(_loc5_)
            {
               arrMusics.push(new ClassSoundCompleted(new _loc5_() as Sound));
            }
         }
         isReady = true;
      }
      
      private static function getSound(param1:String, param2:String) : ClassSoundCompleted
      {
         var _loc4_:ClassSoundCompleted = null;
         var _loc3_:Array = [];
         if(param1 == "music")
         {
            _loc3_ = arrMusics;
         }
         if(param1 == "sound")
         {
            _loc3_ = arrSounds;
         }
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.getNameSound() == param2)
            {
               return _loc4_;
            }
         }
         return null;
      }
   }
}

