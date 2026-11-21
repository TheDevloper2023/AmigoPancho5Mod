package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import MenuGame.ClassMenuGame;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.amigo.ClassBalloonAmigo;
   import PlayLevels.amigoPancho.tela.amigo.ClassPartAmigo;
   import Tela.ClassBaseBody;
   import easing.Regular;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassBaseStar extends ClassLevelObject
   {
      
      public static var arrStars:Array = [];
      
      public static var numStarsTaken:int = 0;
      
      public static var tempNumStarsTaken:int = 0;
      
      public static var id:int = 0;
      
      private var idOwn:int;
      
      private var myTweenMoveX:Tween;
      
      private var myTweenMoveY:Tween;
      
      private var isStartMove:Boolean;
      
      private var isTaken:Boolean;
      
      public function ClassBaseStar(param1:String)
      {
         super("star_1");
         arrStars.push(this);
         setParentSprite(ClassLayers.spriteForBoom);
         arrPhysicParam = [0,0.2,0.2];
         isOffMakeAngle = true;
         this.idOwn = ++id;
         movie.gotoAndStop(2);
      }
      
      public static function hideStars() : void
      {
         var _loc1_:ClassBaseStar = null;
         for each(_loc1_ in arrStars)
         {
            if(_loc1_.isTaken == true)
            {
               _loc1_.alpha = 0;
            }
         }
      }
      
      public static function saveTakenStars() : void
      {
         var _loc1_:ClassBaseStar = null;
         for each(_loc1_ in arrStars)
         {
            if(_loc1_.isTaken == true)
            {
               ClassSetDataGame._so.data[ClassBaseLevel.numLevel + "star" + _loc1_.idOwn] = 1;
            }
         }
      }
      
      public static function resetData() : void
      {
         id = 0;
         numStarsTaken = 0;
         tempNumStarsTaken = 0;
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesInterface,param1);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(param1 is ClassPartAmigo || param1 is ClassBalloonAmigo)
         {
            if(isDestroyBody == false)
            {
               movie.gotoAndPlay(2);
               isDestroyBody = true;
               this.isTaken = true;
               ClassBaseLevel.scores += 300;
               ++numStarsTaken;
               addEventListener(Event.ENTER_FRAME,this.waitLight);
               ControlSounds.playSound("arpedgio",10);
            }
         }
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         setScale(2,2);
         if(int(ClassSetDataGame._so.data[ClassBaseLevel.numLevel + "star" + String(this.idOwn)]))
         {
            visible = false;
            isLive = false;
            ++numStarsTaken;
            ++tempNumStarsTaken;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(visible)
         {
            rotation += 0.5;
            if(this.isStartMove == true)
            {
               this.myTweenMoveX.onEnterFrame(param1);
               this.myTweenMoveY.onEnterFrame(param1);
            }
         }
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassPartAmigo || param1 is ClassBalloonAmigo)
         {
            return true;
         }
         return false;
      }
      
      private function waitLight(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(movie.currentFrame == movie.totalFrames)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitLight);
            amigo5.mainStage.addChild(this);
            _loc2_ = 0;
            _loc3_ = 440;
            if(tempNumStarsTaken == 0)
            {
               _loc2_ = 52;
            }
            if(tempNumStarsTaken == 1)
            {
               _loc2_ = 36;
            }
            if(tempNumStarsTaken == 2)
            {
               _loc2_ = 60;
            }
            this.myTweenMoveX = new Tween(this,"x",Regular.easeIn,this.x,_loc2_,25,false);
            this.myTweenMoveX.addEventListener(TweenEvent.MOTION_STOP,this.setStopTweenX);
            this.myTweenMoveY = new Tween(this,"y",Regular.easeIn,this.y,_loc3_,25,false);
            this.myTweenMoveX.start();
            this.myTweenMoveY.start();
            ++tempNumStarsTaken;
            this.isStartMove = true;
         }
      }
      
      private function setStopTweenX(param1:Event) : void
      {
         this.myTweenMoveX.removeEventListener(TweenEvent.MOTION_STOP,this.setStopTweenX);
         this.getStar();
      }
      
      public function getStar() : void
      {
         visible = false;
         ClassMenuGame.setOpenStar(numStarsTaken);
         ControlSounds.playSound("levelLose2",4);
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrStars);
         removeEventListener(Event.ENTER_FRAME,this.waitLight);
         if(this.myTweenMoveX)
         {
            this.myTweenMoveX.addEventListener(TweenEvent.MOTION_STOP,this.setStopTweenX);
         }
         this.myTweenMoveX = null;
         super.destroy();
      }
   }
}

