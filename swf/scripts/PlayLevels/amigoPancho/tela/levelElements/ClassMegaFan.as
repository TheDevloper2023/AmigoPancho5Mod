package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import PlayLevels.amigoPancho.bees.ClassBee;
   import PlayLevels.amigoPancho.tela.ClassPartHero;
   import PlayLevels.amigoPancho.tela.amigo.ClassPartAmigo;
   import PlayLevels.amigoPancho.tela.bad.ClassPartBad;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassFan;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassRocket;
   import Tela.ClassBaseBody;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassMegaFan extends ClassFan
   {
      
      private var sound:ClassSoundCompleted;
      
      private var isBoom:Boolean;
      
      private var isGoingBlastUp:Boolean = false;
      
      private var isGoingBlastDown:Boolean;
      
      private var timerBoom:int = 0;
      
      internal var speedLop:Number = 60;
      
      public function ClassMegaFan(param1:String)
      {
         super(param1);
         arrPhysicParam = [0,0,0];
         setParentSprite(ClassLayers.spriteForSuperStat);
         this.soundPlay();
         amigo5.mainStage.addEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.addEventListener("ALL_SOUND_ON",this.soundPlay);
         movie.t.text = "";
         movie.t.text += "0";
         movie.t.visible = false;
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
            if(ClassPlayLevel.isUpdate && isBlock == false)
            {
               this.sound = ControlSounds.loadAndPlay("mFan",0,0.4);
            }
         }
      }
      
      override public function startSettings() : void
      {
         movie.lopast.gotoAndStop(1);
         movie.b.gotoAndStop(1);
         movie.r.gotoAndStop(1);
         kFor = 1;
      }
      
      override public function findHitPerf(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findHitPerf);
      }
      
      override public function setMouseOffResend() : void
      {
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
      }
      
      public function setBoom() : void
      {
         var _loc1_:Point = null;
         if(isBlastWas == false)
         {
            movie.t.text += "2";
            if(rotation == 90)
            {
               _loc1_ = new Point(x,y - 35 * movie.scaleY);
            }
            else
            {
               _loc1_ = new Point(x - 25 * movie.scaleX,y);
            }
            startBlow("sBlowUp01",2.5,false,_loc1_);
            isBlastWas = true;
            isBlock = true;
            this.isGoingBlastUp = true;
            ControlSounds.playSound("mRocketExplode",2);
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         movie.lopast.rotation += this.speedLop;
         if(this.isBoom == true && isBlock == false)
         {
            this.setBoom();
         }
         if(this.isGoingBlastUp == true)
         {
            ++this.timerBoom;
            movie.t.text = this.timerBoom;
            scaleX += 0.01;
            scaleY += 0.01;
            if(this.timerBoom > 7)
            {
               movie.t.text += "3";
               this.soundStop();
               this.timerBoom = 0;
               this.isGoingBlastDown = true;
               this.isGoingBlastUp = false;
            }
         }
         if(this.isGoingBlastDown == true)
         {
            this.updateBoomDown();
         }
      }
      
      private function updateBoomDown(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         ++this.timerBoom;
         scaleX -= 0.01;
         scaleY -= 0.01;
         if(this.timerBoom > 7)
         {
            movie.lopast.gotoAndStop(3);
            movie.b.gotoAndStop(2);
            movie.r.gotoAndStop(2);
            this.speedLop = 3;
            _loc2_ = Math.round(Math.random() * 120);
            movie.lopast.rotation = Math.round(_loc2_);
            this.isGoingBlastDown = false;
         }
      }
      
      override public function getSpriteForLight() : Sprite
      {
         return this;
      }
      
      override public function setOn(param1:Number) : void
      {
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         setMouseReactOff();
      }
      
      public function testKill() : void
      {
         var _loc1_:ClassLevelObject = null;
         var _loc2_:Number = NaN;
         if(this.isBoom == true)
         {
            return;
         }
         for each(_loc1_ in arrLevelObjects)
         {
            if(_loc1_ != this)
            {
               if(_loc1_ is ClassBee)
               {
                  _loc2_ = ClassMath.getDistansFromToPoints(getPosition(),_loc1_.getPosition());
                  if(_loc2_ < 40)
                  {
                     _loc1_.isLive = false;
                  }
               }
               if(_loc1_.hitTestPoint(x,y))
               {
                  if(_loc1_ is ClassPartAmigo || _loc1_ is ClassPartBad)
                  {
                     movie.lopast.gotoAndStop(2);
                     (_loc1_ as ClassPartHero).setInFan();
                  }
                  if(_loc1_ is ClassRocket)
                  {
                     this.isBoom = true;
                     return;
                  }
                  if(_loc1_ is ClassStone)
                  {
                     movie.t.text += "1";
                     this.isBoom = true;
                     _loc1_.isLive = false;
                     return;
                  }
                  if(Boolean(_loc1_.body) && _loc1_.body.GetType() == b2Body.b2_dynamicBody)
                  {
                     if(_loc1_ is ClassBaseBalloon)
                     {
                        (_loc1_ as ClassBaseBalloon).isBoom = true;
                     }
                     else
                     {
                        _loc1_.isLive = false;
                     }
                  }
               }
            }
         }
      }
      
      override public function setWork() : void
      {
         direct = 1;
         setWind();
         this.testKill();
      }
      
      override public function mUpGlobal(param1:MouseEvent = null) : void
      {
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         this.setBoom();
         return true;
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.removeEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.removeEventListener("ALL_SOUND_ON",this.soundPlay);
         this.soundStop();
         removeEventListener(Event.ENTER_FRAME,this.updateBoomDown);
         super.destroy();
      }
   }
}

