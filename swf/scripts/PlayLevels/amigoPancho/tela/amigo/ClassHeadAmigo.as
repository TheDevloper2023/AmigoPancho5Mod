package PlayLevels.amigoPancho.tela.amigo
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassYMax;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassHeadAmigo extends ClassPartAmigo
   {
      
      private var isWin:Boolean;
      
      private var isRad:Boolean;
      
      private var isOffAnim:Boolean;
      
      private var isGloomy:Boolean;
      
      private var yMax:Number;
      
      private var pauseGloomy:int;
      
      private var countGloomy:int;
      
      public function ClassHeadAmigo(param1:String)
      {
         super(param1);
         movie.fass.stop();
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         return !(param1 is ClassHandAmigo);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.SetAngularVelocity(0);
         amigo5.mainStage.addEventListener("PART_AMIGO_CONTACT",this.playGloomy);
         this.yMax = 140;
         addEventListener(Event.ENTER_FRAME,this.findYMax);
      }
      
      public function findYMax(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findYMax);
         if(ClassYMax.instance)
         {
            this.yMax = ClassYMax.instance.y;
         }
      }
      
      public function playIspug() : void
      {
         if(this.isOffAnim == false)
         {
            movie.fass.gotoAndPlay("fFall");
            ControlSounds.playSound("mHeroFall");
            this.isOffAnim = true;
         }
      }
      
      public function playFear() : void
      {
         if(this.isOffAnim == false)
         {
            movie.fass.gotoAndPlay("fFear");
            ControlSounds.playSound("mHeroFear",0.5);
         }
      }
      
      public function playGloomy(param1:Event = null) : void
      {
         if(this.isOffAnim == false && this.isGloomy == false)
         {
            this.isGloomy = true;
            movie.fass.gotoAndPlay("fGloomy");
            if(++this.countGloomy < 4)
            {
               ControlSounds.playSound("mHeroGloomy",1);
            }
            this.pauseGloomy = 0;
            addEventListener(Event.ENTER_FRAME,this.waitGloomy);
         }
      }
      
      private function waitGloomy(param1:Event) : void
      {
         if(++this.pauseGloomy > 40)
         {
            this.pauseGloomy = 0;
            this.isGloomy = false;
            if(this.isOffAnim == false)
            {
               movie.fass.gotoAndStop(1);
            }
            removeEventListener(Event.ENTER_FRAME,this.waitGloomy);
         }
      }
      
      public function playBee() : void
      {
         if(this.isOffAnim == false)
         {
            movie.fass.gotoAndPlay("fBee");
            this.isOffAnim = true;
         }
      }
      
      public function playRadost() : void
      {
         if(this.isOffAnim == false)
         {
            this.isRad = true;
            this.isOffAnim = true;
            movie.fass.gotoAndPlay("fGlad");
            ControlSounds.playSound("mHeroGlad");
         }
      }
      
      override public function createBlack() : void
      {
         movie.fass.gotoAndPlay("fFire");
         this.isOffAnim = true;
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.isWin == false)
         {
            if(y < -90 && this.isWin == false)
            {
               this.isWin = true;
               this.isOffAnim = true;
               amigo5.mainStage.dispatchEvent(new Event("WIN"));
            }
            if(this.isRad == false && y < this.yMax)
            {
               this.playRadost();
            }
         }
      }
      
      override public function destroy() : void
      {
         ClassYMax.instance = null;
         ControlSounds.stopSound("mHeroGlad");
         ControlSounds.stopSound("mHeroGloomy");
         ControlSounds.stopSound("mHeroFall");
         ControlSounds.stopSound("mHeroFear");
         removeEventListener(Event.ENTER_FRAME,this.findYMax);
         amigo5.mainStage.removeEventListener("PART_AMIGO_CONTACT",this.playGloomy);
         removeEventListener(Event.ENTER_FRAME,this.waitGloomy);
         super.destroy();
      }
   }
}

