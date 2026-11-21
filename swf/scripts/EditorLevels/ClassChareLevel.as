package EditorLevels
{
   import Badges.ClassControllBadges;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ClassChareLevel extends Sprite
   {
      
      public const CLOSE:String = "CLOSE";
      
      public const LINK_READY:String = "LINK_READY";
      
      private var strLink:String;
      
      private var buttonOK:SimpleButton;
      
      private var buttonCopy:SimpleButton;
      
      private var buttonCANCEL:SimpleButton;
      
      private var windowText:TextField;
      
      private var windowCaption:TextField;
      
      private var movie:MovieClip;
      
      private var objectControlBadges:ClassControllBadges;
      
      public function ClassChareLevel(param1:String, param2:String)
      {
         super();
         // There is such sceen, will implement it later promise

         //var _loc3_:Class = amigo5.swfMoviesInterface.getAssetClass("shareLevel");
         //this.movie = new _loc3_();
         //this.buttonOK = (this.movie as Object).but_ok;
         //this.buttonCopy = (this.movie as Object).but_copy;
         //this.buttonCANCEL = (this.movie as Object).but_cancel;
         //this.buttonCANCEL.addEventListener(MouseEvent.CLICK,this.closeShare);
         //this.buttonOK.visible = false;
         //this.buttonCopy.visible = false;
         //this.windowText = (this.movie as Object).message;
         //this.windowCaption = (this.movie as Object).caption;
         //this.windowText.text = "Wait a moment, please...";
         //(this.movie.tck as TextField).text = "";
         //addChild(this.movie);
         //addEventListener(this.LINK_READY,this.showLinkNow);
         
         this.getWebLink(param1,param2);
      }
      
      private function getWebLink(param1:String, param2:String) : void
      {
         var _loc3_:URLRequest = new URLRequest(param2);
         var _loc4_:URLVariables = new URLVariables();
         param1 = "c" + param1 + "o";
         param1 = this.convertStrIn16(param1);
         _loc4_.level = param1;
         _loc3_.data = _loc4_;
         _loc3_.method = URLRequestMethod.POST;
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.TEXT;
         _loc5_.addEventListener(Event.COMPLETE,this.gettingLinkComplete);
         _loc5_.load(_loc3_);
      }
      
      private function convertStrIn16(param1:String) : String
      {
         var _loc4_:String = null;
         var _loc2_:String = "c";
         var _loc3_:Number = 1;
         while(_loc3_ < param1.length - 1)
         {
            _loc4_ = param1.charCodeAt(_loc3_).toString(16);
            if(_loc4_.length == 2)
            {
               _loc2_ += param1.charCodeAt(_loc3_).toString(16);
            }
            _loc3_++;
         }
         return _loc2_ + "o";
      }
      
      private function gettingLinkComplete(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         this.strLink = _loc2_.data;
         dispatchEvent(new Event(this.LINK_READY));
      }
      
      private function showLinkNow(param1:Event) : void
      {
         this.buttonCANCEL.visible = false;
         this.buttonOK.addEventListener(MouseEvent.CLICK,this.closeShare);
         var _loc2_:TextFormat = new TextFormat();
         if(this.strLink != "error")
         {
            this.buttonOK.x = 473;
            this.buttonCopy.visible = true;
            this.buttonOK.visible = true;
            this.buttonCopy.addEventListener(MouseEvent.CLICK,this.copyLinck);
            _loc2_.underline = true;
            _loc2_.size = 11;
            _loc2_.color = 255;
            this.windowText.selectable = true;
            this.windowText.background = true;
            this.windowText.backgroundColor = 16777215;
            this.windowText.border = true;
            this.windowText.borderColor = 0;
            this.windowCaption.text = "YOUR  LEVEL  LINK";
            this.windowText.htmlText = "<a href=\"event:" + this.strLink + "\">" + this.strLink + "</a>";
            this.movie.addEventListener(TextEvent.LINK,this.linkHandler);
            (this.movie.tck as TextField).text = "Click the link to play this level:";
            this.objectControlBadges = new ClassControllBadges(this.movie as Sprite);
            this.objectControlBadges.updateBadges(-1,ClassInformGame.EVENT_COUNT_JOINT_OBJECTS);
         }
         else
         {
            this.buttonOK.visible = true;
            this.windowText.text = "WRONG CODE LEVEL";
         }
         this.windowText.setTextFormat(_loc2_);
      }
      
      private function copyLinck(param1:MouseEvent) : void
      {
         this.windowText.setSelection(0,10000);
         this.windowText.alwaysShowSelection = true;
         System.setClipboard(this.windowText.text);
      }
      
      private function linkHandler(param1:TextEvent) : void
      {
         this.movie.removeEventListener(TextEvent.LINK,this.linkHandler);
         navigateToURL(new URLRequest(param1.text),"_blank");
      }
      
      public function closeShare(param1:Event) : void
      {
         this.copyLinck(null);
         if(this.objectControlBadges)
         {
            this.objectControlBadges.destroy();
         }
         this.objectControlBadges = null;
         this.buttonOK.removeEventListener(MouseEvent.CLICK,this.closeShare);
         this.buttonCANCEL.removeEventListener(MouseEvent.CLICK,this.closeShare);
         this.buttonCopy.removeEventListener(MouseEvent.CLICK,this.copyLinck);
         this.movie.removeEventListener(TextEvent.LINK,this.linkHandler);
         this.movie.removeChild(this.buttonOK);
         this.movie.removeChild(this.windowText);
         removeChild(this.movie);
         this.movie = null;
         dispatchEvent(new Event(this.CLOSE));
      }
   }
}

