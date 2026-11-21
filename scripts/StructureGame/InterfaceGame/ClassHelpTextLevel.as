package StructureGame.InterfaceGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class ClassHelpTextLevel extends Sprite
   {
      
      private var movieText:MovieClip;
      
      private var textFieldHelp:TextField;
      
      private var timePause:int = 5;
      
      private var alphaText:Number = 0.6;
      
      private var i:int;
      
      private var numAlpha:Number = 0;
      
      public function ClassHelpTextLevel()
      {
         super();
         var _loc1_:Class = amigo5.swfMoviesInterface.getAssetClass("help_text");
         this.movieText = new _loc1_();
         this.textFieldHelp = (this.movieText as Object).helpText;
         this.movieText.visible = false;
         this.movieText.alpha = 0;
         addChild(this.movieText);
      }
      
      public function start() : void
      {
         if(ClassFlags.isShowLevelHelpText == false)
         {
            return;
         }
         var _loc1_:String = "";
         var _loc2_:Number = 1000;
         var _loc3_:Number = 1000;
         var _loc4_:int = ClassSetDataGame.tekLevel;
         this.movieText.visible = true;
         if(_loc4_ == 7)
         {
            _loc1_ = "";
            _loc2_ = 450;
            _loc3_ = 280;
         }
         this.textFieldHelp.text = _loc1_;
         this.movieText.x = _loc2_;
         this.movieText.y = _loc3_;
         addEventListener(Event.ENTER_FRAME,this.waitPause);
      }
      
      private function waitPause(param1:Event) : void
      {
         if(++this.i == this.timePause)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitPause);
            addEventListener(Event.ENTER_FRAME,this.showText);
         }
      }
      
      private function showText(param1:Event) : void
      {
         this.numAlpha += 0.02;
         this.movieText.alpha = this.numAlpha;
         if(this.numAlpha > this.alphaText)
         {
            removeEventListener(Event.ENTER_FRAME,this.showText);
         }
      }
      
      public function hideText() : void
      {
         addEventListener(Event.ENTER_FRAME,this.startHideText);
      }
      
      private function startHideText(param1:Event) : void
      {
         if((alpha = alpha - 0.05) < 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.startHideText);
            visible = false;
         }
      }
      
      public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.startHideText);
         removeEventListener(Event.ENTER_FRAME,this.waitPause);
         removeEventListener(Event.ENTER_FRAME,this.showText);
         removeChild(this.movieText);
         this.textFieldHelp = null;
         this.movieText = null;
      }
   }
}

