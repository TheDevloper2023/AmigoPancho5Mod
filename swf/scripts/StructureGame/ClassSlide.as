package StructureGame
{
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassSlide extends ClassBaseGameObject
   {
      
      private var pauseBut:int;
      
      public function ClassSlide()
      {
         super("slide");
         visible = false;
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesFon,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         movie.n.visible = false;
         movie.n.addEventListener(MouseEvent.MOUSE_DOWN,this.close);
         addEventListener(Event.ENTER_FRAME,this.qwe);
         var _loc2_:int = param1[0] as int;
         if(_loc2_ == 15)
         {
            movie.gotoAndStop(1);
            movie.cacheAsBitmap = true;
            ClassSetDataGame._so.data.slideTibet = "1";
            visible = true;
            return;
         }
         if(_loc2_ == 31)
         {
            movie.gotoAndStop(3);
            movie.cacheAsBitmap = true;
            ClassSetDataGame._so.data.slideRussia = "1";
            visible = true;
            return;
         }
         this.close();
      }
      
      public function qwe(param1:Event) : void
      {
         if(++this.pauseBut == 60)
         {
            movie.n.visible = true;
         }
      }
      
      public function close(param1:MouseEvent = null) : void
      {
         ButtonsCkick.play();
         removeEventListener(Event.ENTER_FRAME,this.qwe);
         movie.n.removeEventListener(MouseEvent.MOUSE_DOWN,this.close);
         dispatchEvent(new Event("CLOSE"));
      }
   }
}

