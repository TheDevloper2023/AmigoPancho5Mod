package Tela.Hints
{
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseGameObject;
   import flash.events.Event;
   
   public class ClassHint extends ClassBaseGameObject
   {
      
      public static var isStartFirst:Boolean;
      
      public static var arrHints:Array = [];
      
      private var pauseWait:int = 30;
      
      private var isRemove:Boolean;
      
      public function ClassHint(param1:String)
      {
         super(param1);
         isStartFirst = false;
         mouseEnabled = false;
         mouseChildren = false;
         visible = false;
         arrHints.push(this);
         movie.gotoAndStop(2);
         setParentSprite(ClassLayers.spriteForHint);
      }
      
      public static function showNextHint() : void
      {
         if(arrHints.length > 0)
         {
            if(isStartFirst == true)
            {
               arrHints[0].hide();
            }
            if(arrHints.length > 0)
            {
               arrHints[0].show();
            }
            isStartFirst = true;
         }
      }
      
      public static function hideCur(param1:Boolean = true) : void
      {
         if(arrHints.length > 0)
         {
            arrHints[0].hide(param1);
         }
      }
      
      public function show() : void
      {
         visible = true;
         alpha = 0;
         addEventListener(Event.ENTER_FRAME,this.wait);
      }
      
      private function wait(param1:Event) : void
      {
         if(this.pauseWait-- < 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.wait);
            this.start();
         }
      }
      
      private function start() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.alpha0);
         addEventListener(Event.ENTER_FRAME,this.alpha1);
      }
      
      private function alpha1(param1:Event) : void
      {
         if((alpha = alpha + 0.05) >= 1)
         {
            removeEventListener(Event.ENTER_FRAME,this.alpha1);
            alpha = 1;
            movie.gotoAndPlay(2);
            if(movie.m)
            {
               movie.m.gotoAndPlay(2);
            }
         }
      }
      
      public function hide(param1:Boolean = true) : void
      {
         this.isRemove = param1;
         if(param1)
         {
            removeThisFromArray(arrHints);
         }
         removeEventListener(Event.ENTER_FRAME,this.wait);
         removeEventListener(Event.ENTER_FRAME,this.alpha1);
         addEventListener(Event.ENTER_FRAME,this.alpha0);
      }
      
      private function alpha0(param1:Event) : void
      {
         if((alpha = alpha - 0.1) <= 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.alpha0);
            alpha = 0;
            visible = false;
            movie.stop();
            isLive = !this.isRemove;
         }
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrHints);
         movie.stop();
         removeEventListener(Event.ENTER_FRAME,this.wait);
         removeEventListener(Event.ENTER_FRAME,this.alpha1);
         removeEventListener(Event.ENTER_FRAME,this.alpha0);
         super.destroy();
      }
   }
}

