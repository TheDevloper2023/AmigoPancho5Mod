package StructureGame.InterfaceGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassButtonSound extends Sprite
   {
      
      public const SOUND_OFF:String = "SOUND_OFF";
      
      public const SOUND_ON:String = "SOUND_ON";
      
      public const MUSIC_ON:String = "MUSIC_ON";
      
      public const MUSIC_OFF:String = "MUSIC_OFF";
      
      public var EVENT_PressButton:String = "";
      
      public var EVENT_PRESS:String = "EVENT_PRESS";
      
      private var but_sound:MovieClip;
      
      private var but_music:MovieClip;
      
      private var currentMovie:MovieClip;
      
      public function ClassButtonSound()
      {
         super();
         var _loc1_:Class = amigo5.swfMoviesInterface.getAssetClass("btnSound");
         this.but_sound = new _loc1_();
         _loc1_ = amigo5.swfMoviesInterface.getAssetClass("btnMusic");
         this.but_music = new _loc1_();
         this.but_sound.addEventListener(MouseEvent.MOUSE_OVER,this.soundMarkOver);
         this.but_sound.addEventListener(MouseEvent.MOUSE_OUT,this.soundMarkOut);
         this.but_sound.addEventListener(MouseEvent.CLICK,this.soundClick);
         this.but_music.addEventListener(MouseEvent.MOUSE_OVER,this.musicMarkOver);
         this.but_music.addEventListener(MouseEvent.MOUSE_OUT,this.musicMarkOut);
         this.but_music.addEventListener(MouseEvent.CLICK,this.musicClick);
      }
      
      public function setPosition(param1:Point, param2:Point, param3:Number = 1) : void
      {
         this.but_sound.x = param1.x;
         this.but_sound.y = param1.y;
         this.but_sound.gotoAndStop("on");
         this.but_music.x = param2.x;
         this.but_music.y = param2.y;
         this.but_music.gotoAndStop("on");
         this.but_music.scaleX = param3;
         this.but_music.scaleY = param3;
         this.but_sound.scaleX = param3;
         this.but_sound.scaleY = param3;
         addChild(this.but_sound);
         addChild(this.but_music);
         this.setValue();
      }
      
      private function setValue() : void
      {
         if(ClassSetDataGame.isMusic == false)
         {
            this.but_music.gotoAndStop("off");
         }
         if(ClassSetDataGame.isSound == false)
         {
            this.but_sound.gotoAndStop("off");
         }
      }
      
      private function soundMarkOver(param1:Event) : void
      {
         this.currentMovie = this.but_sound;
         this.markOver();
      }
      
      private function soundMarkOut(param1:Event) : void
      {
         this.currentMovie = this.but_sound;
         this.markOut();
      }
      
      private function soundClick(param1:Event) : void
      {
         this.currentMovie = this.but_sound;
         this.click();
      }
      
      private function musicMarkOver(param1:Event) : void
      {
         this.currentMovie = this.but_music;
         this.markOver();
      }
      
      private function musicMarkOut(param1:Event) : void
      {
         this.currentMovie = this.but_music;
         this.markOut();
      }
      
      private function musicClick(param1:Event) : void
      {
         this.currentMovie = this.but_music;
         this.click();
      }
      
      private function markOver() : void
      {
         if(this.currentMovie.currentLabel == "on")
         {
            this.currentMovie.gotoAndStop("mouseOn_1");
            return;
         }
         if(this.currentMovie.currentLabel == "off")
         {
            this.currentMovie.gotoAndStop("mouseOn_2");
            return;
         }
      }
      
      private function markOut() : void
      {
         if(this.currentMovie.currentLabel == "mouseOn_1")
         {
            this.currentMovie.gotoAndStop("on");
            return;
         }
         if(this.currentMovie.currentLabel == "mouseOn_2")
         {
            this.currentMovie.gotoAndStop("off");
            return;
         }
      }
      
      private function click() : void
      {
         ButtonsCkick.play();
         if(this.currentMovie.currentLabel == "mouseOn_1")
         {
            this.currentMovie.gotoAndStop("mouseOn_2");
            if(this.currentMovie.toString().indexOf("Sound") > -1)
            {
               this.EVENT_PressButton = this.SOUND_OFF;
               ControlSounds.stopAllSounds();
               ClassSetDataGame.setSoundPlay(false);
               amigo5.mainStage.dispatchEvent(new Event("ALL_SOUND_OFF"));
            }
            else
            {
               trace("MUSIC_OFF");
               this.EVENT_PressButton = this.MUSIC_OFF;
               ClassSetDataGame.setMusicPlay(false);
               ControlSounds.stopAllMusic();
            }
            dispatchEvent(new Event(this.EVENT_PRESS));
            return;
         }
         if(this.currentMovie.currentLabel == "mouseOn_2")
         {
            this.currentMovie.gotoAndStop("mouseOn_1");
            if(this.currentMovie.toString().indexOf("Sound") > -1)
            {
               this.EVENT_PressButton = this.SOUND_ON;
               ClassSetDataGame.setSoundPlay(true);
               amigo5.mainStage.dispatchEvent(new Event("ALL_SOUND_ON"));
            }
            else
            {
               this.EVENT_PressButton = this.MUSIC_ON;
               trace("MUSIC_ON");
               ClassSetDataGame.setMusicPlay(true);
               ControlSounds.playMusic(ControlSounds.curMusicOptions[0],ControlSounds.curMusicOptions[1],ControlSounds.curMusicOptions[2]);
            }
            dispatchEvent(new Event(this.EVENT_PRESS));
            return;
         }
      }
      
      public function destroy() : void
      {
         this.but_sound.removeEventListener(MouseEvent.MOUSE_OVER,this.soundMarkOver);
         this.but_sound.removeEventListener(MouseEvent.MOUSE_OUT,this.soundMarkOut);
         this.but_sound.removeEventListener(MouseEvent.CLICK,this.soundClick);
         this.but_music.removeEventListener(MouseEvent.MOUSE_OVER,this.musicMarkOver);
         this.but_music.removeEventListener(MouseEvent.MOUSE_OUT,this.musicMarkOut);
         this.but_music.removeEventListener(MouseEvent.CLICK,this.musicClick);
         this.but_sound.parent.removeChild(this.but_sound);
         this.but_music.parent.removeChild(this.but_music);
         this.but_sound = null;
         this.but_music = null;
      }
   }
}

