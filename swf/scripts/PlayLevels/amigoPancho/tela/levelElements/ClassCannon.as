package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassResendEventsPerform;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassCannon extends ClassResendEventsPerform
   {
      
      public static var isHalf:Boolean;
      
      private var timerFire:int;
      
      private var isGoingBlastUp:Boolean = false;
      
      private var isGoingBlastDown:Boolean;
      
      private var timerBoom:int = 0;
      
      public function ClassCannon(param1:String)
      {
         super(param1);
         movie.mark.visible = false;
         setParentSprite(ClassLayers.spriteForSuperStat);
         if(isHalf)
         {
            this.timerFire = 18;
         }
         isHalf = !isHalf;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.setCustomGravity(new b2Vec2(0,0));
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(isBlastWas == false)
         {
            ++this.timerFire;
            if(this.timerFire == 36)
            {
               this.fire();
               this.timerFire = 0;
            }
         }
         else
         {
            if(this.isGoingBlastUp == true)
            {
               ++this.timerBoom;
               scaleX += 0.01;
               scaleY += 0.01;
               if(this.timerBoom > 7)
               {
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
      }
      
      private function fire() : void
      {
         ControlSounds.playSound("mCannon");
         if(movie.baza)
         {
            movie.gotoAndPlay("t1");
         }
         var _loc1_:MovieClip = movie.mark;
         var _loc2_:Point = new Point(_loc1_.x * movie.scaleX,_loc1_.y);
         var _loc3_:Point = new Point(_loc2_.x + 5 * movie.scaleX,_loc2_.y);
         _loc3_ = localToGlobal(_loc3_);
         _loc2_ = localToGlobal(_loc2_);
         var _loc4_:ClassFireBall = new ClassFireBall();
         _loc4_.setPosition(_loc2_.x,_loc2_.y,rotation);
         parent.addChild(_loc4_);
         _loc4_.init([this]);
         _loc4_.scaleX = movie.scaleX;
         var _loc5_:Point = ClassMath.getVector(_loc2_,_loc3_);
         var _loc6_:Number = _loc4_.body.GetMass() * 100;
         var _loc7_:b2Vec2 = new b2Vec2(_loc5_.x / scalePhysic * _loc6_,_loc5_.y / scalePhysic * _loc6_);
         _loc4_.body.ApplyImpulse(_loc7_,_loc4_.body.GetWorldCenter());
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         if(isBlastWas == false)
         {
            this.setBoom();
            return true;
         }
         return false;
      }
      
      private function setBoom() : void
      {
         if(isBlastWas == false)
         {
            startBlow("sBlowUp01",2,false);
            isBlastWas = true;
            this.isGoingBlastUp = true;
            ControlSounds.playSound("mRocketExplode",2);
            setMouseUpGlobalResend();
         }
      }
      
      private function updateBoomDown(param1:Event = null) : void
      {
         ++this.timerBoom;
         scaleX -= 0.01;
         scaleY -= 0.01;
         if(this.timerBoom > 7)
         {
            movie.dulo.gotoAndStop(2);
            if(movie.baza)
            {
               movie.baza.gotoAndStop(2);
            }
            if(movie.baza)
            {
               movie.gotoAndPlay(2);
            }
            this.isGoingBlastDown = false;
         }
      }
      
      override public function mover(param1:MouseEvent) : void
      {
         setMOverResend();
      }
      
      override public function mout(param1:MouseEvent = null) : void
      {
         setMouseOutResend();
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         setMouseDownResend();
      }
      
      override public function mUp(param1:MouseEvent = null) : void
      {
         setMouseUpResend();
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

