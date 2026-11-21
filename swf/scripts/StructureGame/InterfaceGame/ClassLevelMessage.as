package StructureGame.InterfaceGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class ClassLevelMessage extends Sprite
   {
      
      private var movieMessage:MovieClip;
      
      private var textFieldMessage:TextField;
      
      public function ClassLevelMessage()
      {
         super();
         var _loc1_:Class = amigo5.swfMoviesInterface.getAssetClass("levelMessage");
         this.movieMessage = new _loc1_();
         this.textFieldMessage = (this.movieMessage as Object).message;
         this.textFieldMessage.visible = false;
         addChild(this.movieMessage);
      }
      
      public function start(param1:String) : void
      {
         this.textFieldMessage.text = param1;
         this.textFieldMessage.visible = true;
      }
      
      public function stop() : void
      {
         this.textFieldMessage.text = "";
         this.textFieldMessage.visible = false;
      }
      
      public function destroy() : void
      {
         removeChild(this.movieMessage);
         this.movieMessage = null;
         this.textFieldMessage = null;
      }
   }
}

