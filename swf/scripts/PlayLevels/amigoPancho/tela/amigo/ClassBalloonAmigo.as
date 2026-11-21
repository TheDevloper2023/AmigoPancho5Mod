package PlayLevels.amigoPancho.tela.amigo
{
   import Box2D.Common.Math.b2Vec2;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseBalloon;
   import PlayLevels.amigoPancho.tela.levelElements.ClassYLimit;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassBalloonAmigo extends ClassBaseBalloon
   {
      
      public static var arrBallonsAmigo:Array = [];
      
      private var dopForse:Number = 1;
      
      private var isGetLimit:Boolean;
      
      public function ClassBalloonAmigo(param1:String)
      {
         super(param1);
         arrPhysicParam = [3,0.2,0];
         arrBallonsAmigo.push(this);
         setParentSprite(ClassLayers.spriteForAmigo);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.SetAngularDamping(10);
         amigo5.mainStage.addEventListener("PRESS_ON_AMIGO",this.start);
         amigo5.mainStage.addEventListener("BALLON_BREAK",this.setMoreForse);
      }
      
      override public function findVer(param1:Event) : void
      {
         super.findVer(param1);
         body.SetLinearDamping(0.5);
         startForseFly = -0.6 * body.GetMass();
         isStart = false;
         if(ClassYLimit.instance)
         {
            yLimit = ClassYLimit.instance.y;
         }
         else
         {
            yLimit = y;
         }
      }
      
      private function partInBlast(param1:Event) : void
      {
         isBoom = true;
      }
      
      private function setMoreForse(param1:Event) : void
      {
         this.dopForse = 1.3;
      }
      
      override public function actionBlast() : void
      {
         if(isBlast == false)
         {
            amigo5.mainStage.removeEventListener("PRESS_ON_AMIGO",this.start);
            amigo5.mainStage.removeEventListener("BALLON_BREAK",this.setMoreForse);
            amigo5.mainStage.dispatchEvent(new Event("BALLON_BREAK"));
         }
         super.actionBlast();
      }
      
      private function start(param1:Event = null) : void
      {
         yLimit = -300;
         startForseFly = -0.6 * body.GetMass();
         body.SetLinearDamping(0.5);
         isStart = true;
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(isBodyCreated && isStart == false && this.isGetLimit == false)
         {
            if(y <= yLimit + 40)
            {
               this.isGetLimit = true;
               startForseFly = -0.56 * body.GetMass();
               body.SetLinearDamping(2);
            }
         }
      }
      
      override public function setGo(param1:b2Vec2, param2:Number = 4) : void
      {
         var _loc3_:Number = 1;
         if(Math.random() > 0.9)
         {
            _loc3_ = 0.9 + Math.random() * 0.3;
         }
         param1.y *= _loc3_ * this.dopForse;
         super.setGo(param1,param2);
         if(isBodyCreated && isStart == false && Math.random() > 0.9 && y < yLimit + 5)
         {
            body.ApplyImpulse(new b2Vec2(0,0.5),body.GetWorldCenter());
         }
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrBallonsAmigo);
         amigo5.mainStage.removeEventListener("PRESS_ON_AMIGO",this.start);
         amigo5.mainStage.removeEventListener("BALLON_BREAK",this.setMoreForse);
         super.destroy();
      }
   }
}

