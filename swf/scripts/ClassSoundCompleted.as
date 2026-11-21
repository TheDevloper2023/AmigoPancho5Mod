package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class ClassSoundCompleted extends Sprite
   {
      
      private var soundChanel:SoundChannel = new SoundChannel();
      
      private var mySoundTransform:SoundTransform = new SoundTransform();
      
      private var sound:Sound;
      
      private var nameSound:String;
      
      private var isSoundCompleted:Boolean;
      
      private var isSoundPlay:Boolean;
      
      private var coursVolume:int = 1;
      
      private var needVolume:Number;
      
      private var curVolume:Number;
      
      private var lastAmplitudeValue:Number;
      
      private var amplitudeValue:Number;
      
      private var step:Number;
      
      private var isChekPosition:Boolean;
      
      private var isDestroyAfterFin:Boolean;
      
      private var startPosition:Number = 0;
      
      private var countRepeate:int;
      
      private var pauseBeforStart:int;
      
      private var timerPause:int;
      
      public function ClassSoundCompleted(param1:Sound)
      {
         super();
         this.sound = param1;
         this.isSoundCompleted = false;
         this.isSoundPlay = false;
         this.nameSound = this.sound.toString();
         this.nameSound = this.nameSound.substring(8,this.nameSound.length - 1);
      }
      
      public function play(param1:int, param2:Number, param3:Number = 0, param4:Boolean = false, param5:Number = 0) : void
      {
         this.curVolume = param2;
         this.pauseBeforStart = param3;
         this.countRepeate = param1;
         this.isDestroyAfterFin = param4;
         this.startPosition = param5;
         this.mySoundTransform.volume = this.curVolume;
         if(param1 == 0)
         {
            this.countRepeate = 99999;
         }
         this.isSoundPlay = true;
         if(param3 > 0)
         {
            addEventListener(Event.ENTER_FRAME,this.waitPauseBefor);
         }
         else
         {
            this.start();
         }
      }
      
      private function waitPauseBefor(param1:Event) : void
      {
         if(++this.timerPause >= this.pauseBeforStart)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitPauseBefor);
            this.start();
         }
      }
      
      public function start() : void
      {
         this.soundChanel = this.sound.play(this.startPosition,this.countRepeate,this.mySoundTransform);
         this.soundChanel.addEventListener(Event.SOUND_COMPLETE,this.stop);
      }
      
      public function setVolume(param1:Number, param2:Number = 0.01) : void
      {
         if(this.isSoundPlay == false)
         {
            return;
         }
         this.step = param2;
         this.needVolume = param1;
         this.amplitudeValue = 0;
         this.lastAmplitudeValue = 1;
         if(this.curVolume > this.needVolume)
         {
            this.coursVolume = -1;
         }
         else
         {
            this.coursVolume = 1;
         }
         addEventListener(Event.ENTER_FRAME,this.changeValume);
      }
      
      private function changeValume(param1:Event) : void
      {
         this.curVolume += this.step * this.coursVolume;
         this.amplitudeValue = Math.abs(this.curVolume - this.needVolume);
         if(this.amplitudeValue > this.lastAmplitudeValue)
         {
            this.amplitudeValue = 0;
            this.lastAmplitudeValue = 1;
            this.curVolume = this.needVolume;
            this.mySoundTransform.volume = this.needVolume;
            this.soundChanel.soundTransform = this.mySoundTransform;
            removeEventListener(Event.ENTER_FRAME,this.changeValume);
            if(this.needVolume <= 0)
            {
               this.stop();
            }
            return;
         }
         this.mySoundTransform.volume = this.curVolume;
         this.soundChanel.soundTransform = this.mySoundTransform;
         this.lastAmplitudeValue = this.amplitudeValue;
      }
      
      public function getNameSound() : String
      {
         return this.nameSound;
      }
      
      public function getIsSoundPlay() : Boolean
      {
         return this.isSoundPlay;
      }
      
      public function getIsSoundCompleted() : Boolean
      {
         return this.isSoundCompleted;
      }
      
      public function stop(param1:Event = null) : void
      {
         this.soundChanel.removeEventListener(Event.SOUND_COMPLETE,this.stop);
         removeEventListener(Event.ENTER_FRAME,this.waitPauseBefor);
         removeEventListener(Event.ENTER_FRAME,this.changeValume);
         this.isSoundCompleted = true;
         this.isSoundPlay = false;
         this.soundChanel.stop();
         if(this.isDestroyAfterFin == true)
         {
            this.destroy();
         }
      }
      
      public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.waitPauseBefor);
         removeEventListener(Event.ENTER_FRAME,this.changeValume);
         this.soundChanel.removeEventListener(Event.SOUND_COMPLETE,this.stop);
         this.soundChanel.stop();
         this.isSoundPlay = false;
         this.soundChanel = null;
         this.sound = null;
         this.mySoundTransform = null;
         this.nameSound = "";
         this.isSoundCompleted = false;
      }
   }
}

