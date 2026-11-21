package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import PlayLevels.amigoPancho.tela.amigo.ClassPartAmigo;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.sampler.stopSampling;
   
   public class ClassBadMouse extends ClassBaseBalloon
   {
      
      private var isFirstContactWas:Boolean;
      
      private var cours:int = 1;
      
      private var isAction:Boolean;
      
      private var pauseAfterContact:int = 20;
      
      private var sound:ClassSoundCompleted;
      
      private var timerBoom:int;
      
      public function ClassBadMouse(param1:String)
      {
         super(param1);
         movie.w1.gotoAndPlay(2);
         movie.w2.gotoAndPlay(2);
         isGoUpWithOutVerevka = false;
         amigo5.mainStage.addEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.addEventListener("ALL_SOUND_ON",this.soundPlay);
         setParentSprite(ClassLayers.spriteForBgRocket);
         if(ClassBaseLevel.numLevel > 15)
         {
            movie.gotoAndStop(2);
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
               this.sound = ControlSounds.loadAndPlay("mBatFlyFast2",0,0.5,false,Math.random() * 1170);
            }
         }
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         var _loc2_:Point = localToGlobal(new Point(x,y + height / 2));
         body.ApplyImpulse(new b2Vec2(0.05,0),new b2Vec2(_loc2_.x / scalePhysic,_loc2_.y / scalePhysic));
         startForseFly = -1 * body.GetMass();
         this.soundPlay();
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         if(isBoom == false)
         {
            if(this.isAction == false)
            {
               this.isAction = true;
               this.isFirstContactWas = true;
               body.SetAngularDamping(5);
               body.SetLinearDamping(1);
               body.SetFixedRotation(true);
            }
            else if(!(param1 is ClassPartAmigo) && !(param1 is ClassBaseBalloon))
            {
               if(this.pauseAfterContact < 0)
               {
                  this.cours = -this.cours;
                  this.pauseAfterContact = 15;
               }
            }
         }
      }
      
      override public function actionBlast() : void
      {
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         if(isBoom == false)
         {
            startBlow("sBlowUp01",1.5,false);
            stopSampling();
            setLowAlpha(true,0.1);
            isDestroyBody = true;
            addEventListener(Event.ENTER_FRAME,this.updateBoomUp);
         }
         isBoom = true;
         return true;
      }
      
      public function updateBoomUp(param1:Event) : void
      {
         ++this.timerBoom;
         scaleX += 0.03;
         scaleY += 0.03;
         if(this.timerBoom >= 6)
         {
            removeEventListener(Event.ENTER_FRAME,this.updateBoomUp);
            this.timerBoom = 0;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.isAction)
         {
            --this.pauseAfterContact;
         }
      }
      
      override public function setGo(param1:b2Vec2, param2:Number = 4) : void
      {
         super.setGo(param1,param2);
         if(this.isFirstContactWas)
         {
            body.ApplyImpulse(new b2Vec2(2.3 * this.cours,0),body.GetWorldCenter());
         }
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         return true;
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.removeEventListener("ALL_SOUND_OFF",this.soundStop);
         amigo5.mainStage.removeEventListener("ALL_SOUND_ON",this.soundPlay);
         this.soundStop();
         this.sound = null;
         removeEventListener(Event.ENTER_FRAME,this.updateBoomUp);
         super.destroy();
      }
   }
}

