package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassDoplerAPI extends MovieClip
   {
      
      public const CANCEL:String = "CANCEL";
      
      private var score:Number;
      
      private var game:String;
      
      private var viewURL:String = "";
      
      private var view:Number = 1;
      
      private var hsloader:MovieClip;
      
      private var pelena:MovieClip;
      
      private var butCancel:SimpleButton;
      
      public function ClassDoplerAPI(param1:Number, param2:String, param3:MovieClip, param4:Number)
      {
         var _loc6_:Point = null;
         super();
         this.hsloader = param3;
         this.hsloader.visible = false;
         this.game = param2;
         this.score = param1;
         this.view = param4;
         var _loc5_:Class = amigo5.swfMoviesStructur.getAssetClass("pelenaBlack");
         this.pelena = new _loc5_();
         _loc6_ = this.hsloader.globalToLocal(new Point(0,0));
         this.pelena.x = _loc6_.x;
         this.pelena.y = _loc6_.y;
         this.pelena.alpha = 0.7;
         this.hsloader.addChild(this.pelena);
         _loc5_ = amigo5.swfMoviesStructur.getAssetClass("but_cancel");
         this.butCancel = new _loc5_() as SimpleButton;
         this.butCancel.x = 530;
         this.butCancel.y = -8;
         this.hsloader.addChild(this.butCancel);
         this.butCancel.addEventListener(MouseEvent.CLICK,this.closeSubmit);
      }
      
      public function start() : void
      {
         this.hsloader.visible = true;
         this.hsloader.alpha = 0;
         this.hsloader.loadHighscores(this.game,this.score,this.view,this.viewURL);
         addEventListener(Event.ENTER_FRAME,this.startAlpha);
      }
      
      private function closeSubmit(param1:MouseEvent) : void
      {
         addEventListener(Event.ENTER_FRAME,this.startAlpha0);
      }
      
      private function startAlpha(param1:Event) : void
      {
         if((this.hsloader.alpha = this.hsloader.alpha + 0.15) > 1)
         {
            removeEventListener(Event.ENTER_FRAME,this.startAlpha);
         }
      }
      
      private function startAlpha0(param1:Event) : void
      {
         if((this.hsloader.alpha = this.hsloader.alpha - 0.15) < 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.startAlpha0);
            this.hsloader.visible = false;
         }
      }
      
      public function desrtoy() : void
      {
         this.butCancel.removeEventListener(MouseEvent.CLICK,this.closeSubmit);
         this.hsloader.removeChild(this.butCancel);
         this.butCancel = null;
         removeEventListener(Event.ENTER_FRAME,this.startAlpha);
         removeEventListener(Event.ENTER_FRAME,this.startAlpha0);
         this.hsloader.removeChild(this.pelena);
         this.pelena = null;
         this.hsloader = null;
      }
   }
}

