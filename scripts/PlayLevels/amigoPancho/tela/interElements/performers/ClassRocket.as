package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBadMouse;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseBalloon;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKoluchFire;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import PlayLevels.amigoPancho.tela.levelElements.ClassVerevka;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassRocket extends ClassBasePerfomer
   {
      
      public var isFirstContact:Boolean;
      
      private var isBlast:Boolean;
      
      private var isStart:Boolean;
      
      private var startRot:Number;
      
      private var timerWait:int;
      
      public function ClassRocket(param1:String = "bRocket01")
      {
         super(param1);
         setDestroy(true,500);
         setParentSprite(ClassLayers.spriteForRocket);
         movie.fire.visible = false;
         movie.fire.stop();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         createStatic();
         body.setCustomGravity(new b2Vec2(0,0));
         this.startRot = rotation;
         body.SetFixedRotation(true);
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         super.mDown(param1);
         movie.b.gotoAndStop(2);
         this.setOn(0);
      }
      
      override public function setOn(param1:Number) : void
      {
         if(this.isStart == false)
         {
            super.setOn(param1);
            addEventListener(Event.ENTER_FRAME,this.waitFire);
            movie.fire.visible = true;
            movie.fire.gotoAndPlay(2);
            this.isStart = true;
            setMouseReactOff();
            ControlSounds.playSound("mRocketStart",1.2);
         }
      }
      
      private function waitFire(param1:Event) : void
      {
         if(++this.timerWait > 10)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitFire);
            createDynamic();
            isTouchBegin = false;
            super.mout();
         }
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         var _loc4_:ClassLevelObject = null;
         super.setPostSolveContact(param1,param2,param3);
         if(this.isFirstContact == false)
         {
            _loc4_ = param1 as ClassLevelObject;
            if(!(_loc4_ is ClassKoluchFire))
            {
               this.isFirstContact = true;
               this.isBlast = true;
               ControlSounds.stopSound("mRocketStart");
               ControlSounds.playSound("mRocketExplode",1.5);
            }
            else
            {
               _loc4_.isLive = false;
            }
         }
      }
      
      private function blast() : void
      {
         startBlow("sBlowUp01",2);
         isLive = false;
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:Number = NaN;
         super.update(param1);
         if(isAction)
         {
            _loc3_ = movie.scaleX;
            if(this.startRot == 0)
            {
               _loc2_ = new b2Vec2(1.5 * _loc3_,0);
            }
            else
            {
               if(this.startRot == -90)
               {
                  _loc3_ = -0.3;
               }
               _loc2_ = new b2Vec2(0,1.5 * _loc3_);
            }
            body.ApplyImpulse(_loc2_,body.GetWorldCenter());
         }
         if(this.isFirstContact)
         {
            isAction = false;
            this.isBlast = !(contactObject as ClassLevelObject).setBlastFromRocket();
            if(this.isBlast)
            {
               this.blast();
            }
            else
            {
               isLive = false;
            }
         }
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassBadMouse)
         {
            return true;
         }
         if(param1 is ClassVerevka)
         {
            (param1 as ClassVerevka).setBlastFromRocket();
            return false;
         }
         if(param1 is ClassBaseBalloon)
         {
            (param1 as ClassBaseBalloon).setBlastFromRocket();
            return false;
         }
         return super.shouldCollide(param1);
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.waitFire);
         super.destroy();
      }
   }
}

