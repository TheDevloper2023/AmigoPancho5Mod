package EditorLevels
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import flash.text.TextField;
   
   public class ClassSend extends Sprite
   {
      
      private var movieSend:MovieClip;
      
      private var nameLevelTF:TextField;
      
      private var _so:SharedObject = SharedObject.getLocal(ClassInformGame.nameGame);
      
      internal var hint:String;
      
      public function ClassSend()
      {
         super();
      }
      
      public function init(param1:XML) : void
      {
         var _loc2_:Class = amigo5.swfMoviesInterface.getAssetClass("send_table");
         this.movieSend = new _loc2_();
         this.nameLevelTF = this.movieSend.nameLevel;
         this.movieSend.Strcode.text = param1.toString();
         this.movieSend.Strcode.visible = false;
         if(this._so.data["myNameLevel"])
         {
            this.nameLevelTF.text = this._so.data["myNameLevel"];
         }
         if(this._so.data["myNameNike"])
         {
            this.movieSend.nameNick.text = this._so.data["myNameNike"];
         }
         if(this._so.data["myContry"])
         {
            this.movieSend.Contry.text = this._so.data["myContry"];
         }
         if(this._so.data["myEmail"])
         {
            this.movieSend.e_mail.text = this._so.data["myEmail"];
         }
         if(!this._so.data["kolSend"])
         {
            this._so.data["kolSend"] = 0;
         }
         if(Boolean(this._so.data["kolSend"]) && this._so.data["rememberDate"] != new Date().getDate())
         {
            this._so.data["kolSend"] = 0;
         }
         this.movieSend.ost.text += String(10 - Number(this._so.data["kolSend"]));
         addChild(this.movieSend);
         this.movieSend.but_ok.addEventListener(MouseEvent.CLICK,this.sendAfterClickOk);
         this.movieSend.but_no.addEventListener(MouseEvent.CLICK,this.sendAfterClickNo);
      }
      
      private function sendAfterClickNo(param1:Event = null) : void
      {
         this.movieSend.but_ok.removeEventListener(MouseEvent.CLICK,this.sendAfterClickOk);
         this.movieSend.but_no.removeEventListener(MouseEvent.CLICK,this.sendAfterClickNo);
         removeChild(this.movieSend);
         this.saveDataPlayer();
      }
      
      private function saveDataPlayer() : void
      {
         this._so.data["myNameNike"] = this.movieSend.nameNick.text;
         this._so.data["myContry"] = this.movieSend.Contry.text;
         this._so.data["myEmail"] = this.movieSend.e_mail.text;
      }
      
      private function sendAfterClickOk(param1:Event) : void
      {
         this.saveDataPlayer();
         this.sendAfterClickNo();
      }
      
      private function changeTFcode(param1:Event) : void
      {
         trace("changeTFcode");
      }
      
      private function sendIfMore3Try() : void
      {
      }
      
      public function destroy() : void
      {
      }
   }
}

