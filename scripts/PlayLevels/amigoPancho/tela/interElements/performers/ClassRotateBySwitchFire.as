package PlayLevels.amigoPancho.tela.interElements.performers
{
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import PlayLevels.amigoPancho.tela.levelElements.ClassFire;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassRotateBySwitchFire extends ClassRotateBySwitch
   {
      
      public static var arrFire:Array = [];
      
      private var sound:ClassSoundCompleted;
      
      public function ClassRotateBySwitchFire(param1:String)
      {
         var _loc3_:MovieClip = null;
         super(param1);
         kFor = 15;
         var _loc2_:int = 0;
         while(_loc2_ < movie.numChildren)
         {
            _loc3_ = movie.getChildAt(_loc2_) as MovieClip;
            if(_loc3_.toString().indexOf("sFire") > -1)
            {
               _loc3_.gotoAndPlay(Math.round(Math.random() * 14) + 2);
               arrFire.push(_loc3_);
            }
            _loc2_++;
         }
         if(ClassFire.isSoundFire == false)
         {
            ClassFire.isSoundFire = true;
            this.soundPlay();
            amigo5.mainStage.addEventListener("ALL_SOUND_OFF",this.soundStop);
            amigo5.mainStage.addEventListener("ALL_SOUND_ON",this.soundPlay);
         }
      }
      
      private function soundStop(param1:Event = null) : void
      {
         if(this.sound)
         {
            this.sound.destroy();
            this.sound = null;
         }
      }
      
      private function soundPlay(param1:Event = null) : void
      {
         if(this.sound == null)
         {
            if(ClassPlayLevel.isUpdate)
            {
               this.sound = ControlSounds.loadAndPlay("mFire",0,1);
            }
         }
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.removeEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.removeEventListener("ALL_SOUND_ON",this.soundPlay);
         this.soundStop();
         ClassFire.isSoundFire = false;
         arrFire = [];
         super.destroy();
      }
   }
}

