package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ClassMessage extends Sprite
   {
      
      public const msOkNo:String = "msOkNo";
      
      public const msOk:String = "msOk";
      
      public const msOkClose:String = "msOkClose";
      
      public const msOkCancel:String = "msOkCancel";
      
      public const PRESS_OK:String = "PRESS_OK";
      
      public const PRESS_NO:String = "PRESS_NO";
      
      public const PRESS_CLOSE:String = "PRESS_CLOSE";
      
      public const PRESS_CANCEL:String = "PRESS_CANCEL";
      
      private var movieMessage:MovieClip;
      
      private var but_ok:SimpleButton;
      
      private var but_no:SimpleButton;
      
      private var but_close:SimpleButton;
      
      private var but_cancel:SimpleButton;
      
      private var textMessage:TextField;
      
      private var mainSprite:Sprite;
      
      public function ClassMessage()
      {
         super();
         var _loc1_:Class = amigo5.swfMoviesKonstructor.getAssetClass("message");
         this.movieMessage = new _loc1_();
         this.textMessage = (this.movieMessage as Object).mess;
         this.but_ok = (this.movieMessage as Object).but_ok;
         this.but_no = (this.movieMessage as Object).but_no;
         this.but_close = (this.movieMessage as Object).but_close;
         this.but_cancel = (this.movieMessage as Object).but_cancel;
         this.setListeners();
      }
      
      public function hide() : void
      {
         if(this.movieMessage.parent)
         {
            this.mainSprite.removeChild(this.movieMessage);
         }
      }
      
      private function showButOk() : void
      {
         this.but_ok.visible = true;
         this.but_close.visible = false;
         this.but_no.visible = false;
         this.but_cancel.visible = false;
         this.but_ok.x = 353;
      }
      
      private function showButOkNo() : void
      {
         this.but_ok.visible = true;
         this.but_close.visible = false;
         this.but_no.visible = true;
         this.but_cancel.visible = false;
      }
      
      private function showButOkClose() : void
      {
         this.but_ok.visible = true;
         this.but_close.visible = true;
         this.but_no.visible = false;
         this.but_cancel.visible = false;
      }
      
      private function showButOkCancel() : void
      {
         this.but_ok.visible = true;
         this.but_cancel.visible = true;
         this.but_close.visible = false;
         this.but_no.visible = false;
      }
      
      private function setListeners() : void
      {
         this.but_ok.addEventListener(MouseEvent.CLICK,this.butOkPress);
         this.but_close.addEventListener(MouseEvent.CLICK,this.butClosePress);
         this.but_no.addEventListener(MouseEvent.CLICK,this.butNoPress);
         this.but_cancel.addEventListener(MouseEvent.CLICK,this.butCancelPress);
      }
      
      private function butOkPress(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(this.PRESS_OK));
      }
      
      private function butClosePress(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(this.PRESS_CLOSE));
      }
      
      private function butNoPress(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(this.PRESS_NO));
      }
      
      private function butCancelPress(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(this.PRESS_CANCEL));
      }
      
      public function destroy() : void
      {
         this.but_cancel.removeEventListener(MouseEvent.CLICK,this.butCancelPress);
         this.but_ok.removeEventListener(MouseEvent.CLICK,this.butOkPress);
         this.but_close.removeEventListener(MouseEvent.CLICK,this.butClosePress);
         this.but_no.removeEventListener(MouseEvent.CLICK,this.butNoPress);
         while(this.movieMessage.numChildren)
         {
            this.movieMessage.removeChildAt(0);
         }
         this.but_ok = null;
         this.but_close = null;
         this.but_no = null;
         this.but_cancel = null;
         this.textMessage = null;
         this.hide();
         this.movieMessage = null;
      }
   }
}

