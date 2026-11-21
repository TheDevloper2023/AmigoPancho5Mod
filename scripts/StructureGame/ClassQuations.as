package StructureGame
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassQuations extends Sprite
   {
      
      public const ClickOK:String = "ClickOK";
      
      public const ClickNO:String = "ClickNO";
      
      private var but_ok:SimpleButton;
      
      private var but_no:SimpleButton;
      
      private var movieQuat:MovieClip;
      
      public function ClassQuations()
      {
         super();
         var _loc1_:Class = amigo5.swfMoviesStructur.getAssetClass("QuationYesNo");
         this.movieQuat = new _loc1_();
         this.but_ok = (this.movieQuat as Object).but_ok;
         this.but_no = (this.movieQuat as Object).but_no;
         this.but_ok.addEventListener(MouseEvent.CLICK,this.butOkClick);
         this.but_no.addEventListener(MouseEvent.CLICK,this.butNoClick);
         addChild(this.movieQuat);
      }
      
      private function butOkClick(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         dispatchEvent(new Event(this.ClickOK));
      }
      
      private function butNoClick(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         dispatchEvent(new Event(this.ClickNO));
      }
      
      public function destroy() : void
      {
         this.but_ok.removeEventListener(MouseEvent.CLICK,this.butOkClick);
         this.but_no.removeEventListener(MouseEvent.CLICK,this.butNoClick);
         this.but_ok = null;
         this.but_no = null;
         removeChild(this.movieQuat);
         this.movieQuat = null;
      }
   }
}

