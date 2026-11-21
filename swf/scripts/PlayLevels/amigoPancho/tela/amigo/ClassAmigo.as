package PlayLevels.amigoPancho.tela.amigo
{
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.ClassHero;
   import PlayLevels.amigoPancho.tela.ClassPartHero;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseBalloon;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassAmigo extends ClassHero
   {
      
      private var isAmigoFly:Boolean;
      
      private var isInFire:Boolean;
      
      private var countBreakBalloons:int;
      
      private var objHead:ClassHeadAmigo;
      
      private var objHandL:ClassHandAmigo;
      
      private var objHandR:ClassHandAmigo;
      
      private var objBallL:ClassBalloonAmigo;
      
      private var objBallR:ClassBalloonAmigo;
      
      private var arrBall:Array = [];
      
      private var arrHands:Array = [];
      
      private var pauseWaitDie:int;
      
      private var timerDie:int;
      
      private var isWaitDie:Boolean;
      
      public function ClassAmigo(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForAmigo);
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         var _loc2_:ClassBaseBody = null;
         super.init(param1);
         for each(_loc2_ in arrPart)
         {
            if(_loc2_ is ClassHeadAmigo)
            {
               this.objHead = _loc2_ as ClassHeadAmigo;
            }
            if(_loc2_ is ClassHandAmigo)
            {
               if(_loc2_.x > x)
               {
                  this.objHandR = _loc2_ as ClassHandAmigo;
               }
               if(_loc2_.x < x)
               {
                  this.objHandL = _loc2_ as ClassHandAmigo;
               }
            }
            if(_loc2_ is ClassBalloonAmigo)
            {
               if(_loc2_.x > x)
               {
                  this.objBallR = _loc2_ as ClassBalloonAmigo;
               }
               if(_loc2_.x < x)
               {
                  this.objBallL = _loc2_ as ClassBalloonAmigo;
               }
            }
         }
         if(ClassBaseLevel.numLevel != 32)
         {
            ClassLayers.spriteForAmigo.addEventListener(MouseEvent.MOUSE_DOWN,this.click);
            ClassLayers.spriteForAmigo.addEventListener(MouseEvent.MOUSE_OVER,this.mo);
            ClassLayers.spriteForAmigo.addEventListener(MouseEvent.MOUSE_OUT,this.mu);
         }
      }
      
      private function click(param1:MouseEvent) : void
      {
         ClassLayers.spriteForAmigo.removeEventListener(MouseEvent.MOUSE_DOWN,this.click);
         ClassLayers.spriteForAmigo.removeEventListener(MouseEvent.MOUSE_OVER,this.mo);
         ClassLayers.spriteForAmigo.removeEventListener(MouseEvent.MOUSE_OUT,this.mu);
         amigo5.mainStage.dispatchEvent(new Event("PRESS_ON_AMIGO"));
         ClassMouseCursor.createMouseCursorAuto();
         this.isAmigoFly = true;
      }
      
      override public function balloonBreak(param1:ClassBaseBalloon) : void
      {
         super.balloonBreak(param1);
         ++this.countBreakBalloons;
         if(this.countBreakBalloons == 1)
         {
            this.objHead.playFear();
         }
         if(this.countBreakBalloons == 2)
         {
            this.objHead.playIspug();
            this.startWaitDie(70);
         }
         if(param1 == this.objBallL)
         {
            this.objHandL.fOpen();
         }
         if(param1 == this.objBallR)
         {
            this.objHandR.fOpen();
         }
      }
      
      override public function showBlast() : void
      {
         createBlast(this.objHead.getPosition());
      }
      
      override public function heroInFire() : void
      {
         super.heroInFire();
         if(this.isInFire == false)
         {
            this.isInFire = true;
            this.allPartBlack();
            this.startWaitDie(60);
         }
      }
      
      override public function heroInKaplya() : void
      {
         var _loc1_:ClassBaseBody = null;
         super.heroInKaplya();
         if(this.isInFire == false)
         {
            this.isInFire = true;
            for each(_loc1_ in arrPart)
            {
               if(_loc1_ is ClassPartHero)
               {
                  (_loc1_ as ClassPartHero).createGreen();
               }
            }
            this.startWaitDie(60);
         }
      }
      
      public function allPartBlack() : void
      {
         var _loc1_:ClassBaseBody = null;
         for each(_loc1_ in arrPart)
         {
            if(_loc1_ is ClassPartHero)
            {
               (_loc1_ as ClassPartHero).createBlack();
            }
         }
      }
      
      override public function setContactBee() : void
      {
         super.setContactBee();
         if(countContactBee > 3)
         {
            this.objHead.playBee();
         }
      }
      
      private function startWaitDie(param1:int) : void
      {
         if(this.isWaitDie == false)
         {
            this.isWaitDie = true;
            this.pauseWaitDie = param1;
            addEventListener(Event.ENTER_FRAME,this.startTimerWaitDie);
         }
      }
      
      private function startTimerWaitDie(param1:Event = null) : void
      {
         if(++this.timerDie > this.pauseWaitDie)
         {
            removeEventListener(Event.ENTER_FRAME,this.startTimerWaitDie);
            amigo5.mainStage.dispatchEvent(new Event("AMIGO_DIE"));
         }
      }
      
      override public function allPartsDie() : void
      {
         super.allPartsDie();
         this.startWaitDie(40);
      }
      
      private function mo(param1:MouseEvent) : void
      {
         ClassMouseCursor.createMouseCursorButton();
      }
      
      private function mu(param1:MouseEvent) : void
      {
         ClassMouseCursor.createMouseCursorAuto();
      }
      
      override public function destroy() : void
      {
         this.objHead = null;
         ClassPartOfDress.destroyAll();
         removeEventListener(Event.ENTER_FRAME,this.startTimerWaitDie);
         ClassLayers.spriteForAmigo.removeEventListener(MouseEvent.MOUSE_DOWN,this.click);
         ClassLayers.spriteForAmigo.removeEventListener(MouseEvent.MOUSE_OVER,this.mo);
         ClassLayers.spriteForAmigo.removeEventListener(MouseEvent.MOUSE_OUT,this.mu);
         this.objHandL = null;
         this.objHandR = null;
         this.objBallL = null;
         this.objHead = null;
         this.objBallR = null;
         this.arrBall = [];
         this.arrBall = null;
         this.arrHands = [];
         this.arrHands = null;
         super.destroy();
      }
   }
}

