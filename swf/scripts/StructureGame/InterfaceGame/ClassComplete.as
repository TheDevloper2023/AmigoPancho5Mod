package StructureGame.InterfaceGame
{
   import ActionsBeforeGame.ClassPreloader;
   import MenuGame.ClassMenuGame;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseStar;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassComplete extends ClassBaseGameObject
   {
      
      public function ClassComplete()
      {
         super("sInterLevel0");
         movie.stop();
         visible = false;
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesInterface,param1);
      }
      
      public function start(param1:Boolean, param2:int, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         visible = true;
         movie.play();
         amigo5.mainStage.dispatchEvent(new Event("ALL_SOUND_OFF"));
         ClassPlayLevel.isUpdate = false;
         if(param1)
         {
            ClassMenuGame.setGetStars(ClassBaseStar.numStarsTaken);
            movie.b.ss.init(String(param2));
            ClassBaseStar.saveTakenStars();
            movie.b.fail.visible = false;
            if(movie.b.t)
            {
               movie.b.t.visible = false;
            }
            if(param3 <= 0)
            {
               param3 = 0;
            }
            if(param4 <= 0)
            {
               param4 = 0;
            }
            if(param6 <= 0)
            {
               param6 = 0;
            }
            var _loc7_:Number = param4;
            if(param3 > param4)
            {
               _loc7_ = param3;
            }
            movie.b.score.text = param3.toString();
            while(movie.b.score.text.length < 4)
            {
               movie.b.score.text = "0" + movie.b.score.text;
            }
            movie.b.best.text = _loc7_.toString();
            while(movie.b.best.text.length < 4)
            {
               movie.b.best.text = "0" + movie.b.best.text;
            }
            movie.b.r.addEventListener(MouseEvent.CLICK,this.setR);
            movie.b.n.addEventListener(MouseEvent.CLICK,this.setN);
            movie.b.s.addEventListener(MouseEvent.CLICK,this.setS);
            ClassPreloader.showLogo(this);
            return;
         }
      }
      
      private function setAi(param1:MouseEvent) : void
      {
      }
      
      private function goMore(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkMore();
      }
      
      private function setR(param1:MouseEvent = null) : void
      {
         trace("setR");
         ButtonsCkick.play();
         nameEvent = "RESET";
         dispatchEvent(new Event(EVENT));
      }
      
      private function setN(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         nameEvent = "NEXT";
         movie.gotoAndPlay("close");
         dispatchEvent(new Event(EVENT));
      }
      
      private function setS(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         nameEvent = "SELECTOR";
         dispatchEvent(new Event(EVENT));
      }
      
      private function setD(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         nameEvent = "DRESS";
         dispatchEvent(new Event(EVENT));
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.dispatchEvent(new Event("ALL_SOUND_ON"));
         movie.b.r.removeEventListener(MouseEvent.CLICK,this.setR);
         movie.b.n.removeEventListener(MouseEvent.CLICK,this.setN);
         movie.b.s.removeEventListener(MouseEvent.CLICK,this.setS);
         super.destroy();
      }
   }
}

