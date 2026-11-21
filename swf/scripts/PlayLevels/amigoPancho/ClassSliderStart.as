package PlayLevels.amigoPancho
{
   import ActionsBeforeGame.ClassPreloader;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassSliderStart extends ClassBaseGameObject
   {
      
      private var numLevel:int;
      
      private var numFrame:int;
      
      private var s:Boolean;
      
      public function ClassSliderStart()
      {
         super("slideStart");
         mouseEnabled = false;
         movie.mouseEnabled = false;
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesFon,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.numLevel = param1[0];
         if(this.numLevel == 1 && this.numLevel != ClassSetDataGame.lastLevel)
         {
            this.numFrame = 1;
            this.startSlider();
            ClassSetDataGame._so.data.slideStartTexas = "1";
            return;
         }
         if(this.numLevel == 16 && this.numLevel != ClassSetDataGame.lastLevel)
         {
            this.numFrame = 2;
            this.startSlider();
            ClassSetDataGame._so.data.slideStartTibet = "1";
            return;
         }
         dispatchEvent(new Event("CLOSE"));
         dispatchEvent(new Event("DESTROY"));
      }
      
      public function startSlider() : void
      {
         movie.gotoAndStop(this.numFrame);
         ClassPlayLevel.setPlayMus(this.numLevel);
         movie.cacheAsBitmap = true;
         movie.mmn.n.addEventListener(MouseEvent.MOUSE_DOWN,this.pressN);
         addEventListener(Event.ENTER_FRAME,this.update);
         ClassPreloader.showLogo(this);
      }
      
      public function pressN(param1:MouseEvent = null) : void
      {
         ButtonsCkick.play();
         movie.cacheAsBitmap = true;
         this.cacheAsBitmap = true;
         setLowAlpha(true,0.05);
         movie.mmn.n.removeEventListener(MouseEvent.MOUSE_DOWN,this.pressN);
         dispatchEvent(new Event("CLOSE"));
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.s == false)
         {
            movie.m.t.country.gotoAndStop(this.numFrame);
         }
         if(isLive == false)
         {
            removeEventListener(Event.ENTER_FRAME,this.update);
            dispatchEvent(new Event("DESTROY"));
         }
         this.s = true;
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.update);
         movie.mmn.n.removeEventListener(MouseEvent.MOUSE_DOWN,this.pressN);
         super.destroy();
      }
   }
}

