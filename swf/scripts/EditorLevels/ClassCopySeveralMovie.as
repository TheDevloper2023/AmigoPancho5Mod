package EditorLevels
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassCopySeveralMovie extends Sprite
   {
      
      public const MOUSE_UP:String = "";
      
      private var startXForContCopy:Number;
      
      private var startYForContCopy:Number;
      
      private var movieForSelect:MovieClip;
      
      private var contTela:MovieClip;
      
      private var contForAllSeveral:MovieClip;
      
      public function ClassCopySeveralMovie(param1:MovieClip, param2:String)
      {
         super();
         this.contTela = param1;
         var _loc3_:Class = amigo5.swfMoviesGame.getAssetClass(param2);
         this.movieForSelect = new _loc3_();
         addEventListener(Event.ADDED_TO_STAGE,this.setListeners);
      }
      
      private function setListeners(param1:Event) : void
      {
         this.startXForContCopy = stage.mouseX;
         this.startYForContCopy = stage.mouseY;
         this.movieForSelect.x = this.startXForContCopy;
         this.movieForSelect.y = this.startYForContCopy;
         removeEventListener(Event.ADDED_TO_STAGE,this.setListeners);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.resizeContForCopy);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.resizeContForCopy);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.MouseUp);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.MouseUp);
         addChild(this.movieForSelect);
         this.resizeContForCopy(null);
      }
      
      public function getContWithSeleralMovie() : MovieClip
      {
         return this.contForAllSeveral;
      }
      
      public function setContWithSeleralMovie(param1:MovieClip, param2:Boolean = false) : void
      {
         var _loc5_:MovieClip = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc3_:MovieClip = param1.parent as MovieClip;
         var _loc4_:* = int(param1.numChildren - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = param1.getChildAt(_loc4_) as MovieClip;
            if((Boolean(_loc5_)) && _loc5_.ownName != "contForCopyTels")
            {
               _loc6_ = new Point(_loc5_.x,_loc5_.y);
               _loc7_ = _loc5_.parent.localToGlobal(_loc6_);
               _loc8_ = _loc3_.globalToLocal(_loc7_);
               _loc5_.x = _loc8_.x;
               _loc5_.y = _loc8_.y;
               if(param2 == true)
               {
                  _loc5_.isSelected = true;
               }
               _loc3_.addChild(_loc5_);
            }
            _loc4_--;
         }
         _loc3_.removeChild(param1);
      }
      
      public function moveMovieInSeveralCont(param1:MovieClip) : MovieClip
      {
         var _loc6_:MovieClip = null;
         var _loc2_:Point = new Point(this.movieForSelect.x,this.movieForSelect.y);
         var _loc3_:Point = this.movieForSelect.parent.localToGlobal(_loc2_);
         var _loc4_:Point = param1.globalToLocal(_loc3_);
         this.movieForSelect.x = _loc4_.x;
         this.movieForSelect.y = _loc4_.y;
         param1.addChild(this.movieForSelect);
         this.contForAllSeveral = new MovieClip();
         this.contForAllSeveral.ownName = "contForAllSeveral";
         var _loc5_:* = 0;
         while(_loc5_ < param1.numChildren)
         {
            _loc6_ = param1.getChildAt(_loc5_) as MovieClip;
            if(_loc6_.isSelected)
            {
               this.contForAllSeveral.addChild(_loc6_);
               _loc6_.isSelected = false;
               _loc5_--;
            }
            _loc5_++;
         }
         this.contForAllSeveral.addChild(this.movieForSelect);
         param1.addChild(this.contForAllSeveral);
         return this.contForAllSeveral;
      }
      
      public function setNewMovieForSelect(param1:MovieClip) : void
      {
         this.movieForSelect = param1;
      }
      
      public function destroy() : void
      {
         while(numChildren)
         {
            removeChildAt(0);
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.MouseUp);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.resizeContForCopy);
         this.movieForSelect = null;
         if(this.contForAllSeveral.parent)
         {
            this.contForAllSeveral.parent.removeChild(this.contForAllSeveral);
         }
         this.contForAllSeveral = null;
         this.contTela = null;
         this.parent.removeChild(this);
      }
      
      private function resizeContForCopy(param1:MouseEvent) : void
      {
         var _loc2_:Number = this.startXForContCopy;
         var _loc3_:Number = this.startYForContCopy;
         if(stage.mouseX < this.startXForContCopy && stage.mouseY > this.startYForContCopy)
         {
            _loc2_ = stage.mouseX;
            _loc3_ = this.startYForContCopy;
         }
         if(stage.mouseX < this.startXForContCopy && stage.mouseY < this.startYForContCopy)
         {
            _loc2_ = stage.mouseX;
            _loc3_ = stage.mouseY;
         }
         if(stage.mouseX > this.startXForContCopy && stage.mouseY < this.startYForContCopy)
         {
            _loc2_ = this.startXForContCopy;
            _loc3_ = stage.mouseY;
         }
         this.movieForSelect.x = _loc2_ - parent.x;
         this.movieForSelect.y = _loc3_ - parent.y;
         this.movieForSelect.width = Math.abs(this.startXForContCopy - stage.mouseX);
         this.movieForSelect.height = Math.abs(this.startYForContCopy - stage.mouseY);
      }
      
      private function MouseUp(param1:MouseEvent) : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.MouseUp);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.resizeContForCopy);
         var _loc2_:int = 0;
         while(_loc2_ < this.contTela.numChildren)
         {
            _loc3_ = this.contTela.getChildAt(_loc2_) as MovieClip;
            _loc4_ = this.movieForSelect.x + parent.x;
            while(_loc4_ < this.movieForSelect.x + parent.x + this.movieForSelect.width)
            {
               _loc5_ = this.movieForSelect.y + parent.y;
               while(_loc5_ < this.movieForSelect.y + parent.y + this.movieForSelect.height)
               {
                  if(_loc3_.hitTestPoint(_loc4_,_loc5_,true))
                  {
                     _loc3_.isSelected = true;
                     break;
                  }
                  _loc5_ += 2;
               }
               if(_loc3_.isSelected)
               {
                  break;
               }
               _loc4_ += 2;
            }
            _loc2_++;
         }
         this.moveMovieInTheSeveralCont(this.contTela,this.movieForSelect);
      }
      
      private function moveMovieInTheSeveralCont(param1:MovieClip, param2:MovieClip) : void
      {
         var _loc4_:MovieClip = null;
         this.contForAllSeveral = new MovieClip();
         this.contForAllSeveral.ownName = "contForAllSeveral";
         var _loc3_:* = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_) as MovieClip;
            if(_loc4_.isSelected)
            {
               this.contForAllSeveral.addChild(_loc4_);
               _loc4_.isSelected = false;
               _loc3_--;
            }
            _loc3_++;
         }
         param2.ownName = "contForCopyTels";
         this.contForAllSeveral.addChild(param2);
         param1.addChild(this.contForAllSeveral);
         dispatchEvent(new Event(this.MOUSE_UP));
      }
   }
}

