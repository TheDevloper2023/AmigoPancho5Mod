package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassActions extends Sprite
   {
      
      public const STOP_MOVE:String = "STOP_MOVE";
      
      public const STOP_ALPHA:String = "STOP_ALPHA";
      
      private var alphaCourse:Number = -1;
      
      private var flashMovie:MovieClip = new MovieClip();
      
      public var moveMovie:Object = new Object();
      
      private var finishPoint:Point;
      
      private var speed:Number;
      
      private var alphaMovie:Number;
      
      private var movieAlpha:Object;
      
      private var kSpeed:Number = 0;
      
      private var acceleration:Number;
      
      private var cours:int;
      
      private var halfDist:Point;
      
      private var jumpUP:Number;
      
      private var isHalfDist:Boolean;
      
      private var isInCreace:Boolean;
      
      private var numAlphaStop:Number;
      
      private var stepAlpha:Number;
      
      public function ClassActions()
      {
         super();
      }
      
      public function startFlashMovie(param1:MovieClip) : void
      {
         this.flashMovie = param1;
         addEventListener(Event.ENTER_FRAME,this.flash);
      }
      
      private function flash(param1:Event) : void
      {
         this.flashMovie.alpha += 0.03 * this.alphaCourse;
         if(this.flashMovie.alpha > 0.95)
         {
            this.alphaCourse = -1;
            this.flashMovie.alpha = 0.95;
         }
         if(this.flashMovie.alpha < 0.4)
         {
            this.alphaCourse = 1;
            this.flashMovie.alpha = 0.4;
         }
      }
      
      public function stopFlashMovie() : void
      {
         if(this.flashMovie)
         {
            this.flashMovie.alpha = 1;
            this.flashMovie = null;
         }
         removeEventListener(Event.ENTER_FRAME,this.flash);
      }
      
      public function startMoveMovie(param1:Object, param2:Point, param3:Number, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.moveMovie = param1;
         this.isInCreace = param5;
         this.speed = param3;
         this.finishPoint = param2;
         this.halfDist = new Point((param2.x - param1.x) / 2 + param1.x,(param2.y - param1.y) / 2 + param1.y);
         this.cours = 1;
         this.acceleration = 0.03;
         this.jumpUP = 0.003;
         this.isHalfDist = false;
         addEventListener(Event.ENTER_FRAME,this.move);
      }
      
      public function move(param1:Event) : void
      {
         if(ClassPaused.isPaused)
         {
            return;
         }
         var _loc2_:Point = this.findNextPointLine(new Point(this.moveMovie.x,this.moveMovie.y),this.finishPoint,this.speed * this.kSpeed);
         this.kSpeed += this.acceleration * this.cours;
         this.acceleration += this.jumpUP * this.cours;
         if(this.kSpeed < 0.04)
         {
            this.kSpeed = 0.04;
         }
         if(this.isInCreace == true)
         {
            (this.moveMovie as MovieClip).scaleX += 0.015 * this.cours;
            (this.moveMovie as MovieClip).scaleY += 0.015 * this.cours;
         }
         if(Math.abs(this.moveMovie.x - this.halfDist.x) <= this.speed && Math.abs(this.moveMovie.y - this.halfDist.y) <= this.speed && !this.isHalfDist)
         {
            this.isHalfDist = true;
            this.cours = -1;
            this.jumpUP = 0.001;
         }
         this.moveMovie.x = _loc2_.x;
         this.moveMovie.y = _loc2_.y;
         if(Math.abs(this.moveMovie.x - this.finishPoint.x) <= this.speed * this.kSpeed && Math.abs(this.moveMovie.y - this.finishPoint.y) <= this.speed * this.kSpeed)
         {
            this.stopMove();
         }
      }
      
      public function findNextPointLine(param1:Point, param2:Point, param3:Number) : Point
      {
         var _loc5_:Number = NaN;
         var _loc4_:Point = new Point();
         if(param3 == 0)
         {
            _loc4_ = param1;
         }
         else
         {
            _loc5_ = Math.sqrt((param1.x - param2.x) * (param1.x - param2.x) + (param1.y - param2.y) * (param1.y - param2.y));
            if(_loc5_ == 0)
            {
               _loc4_ = param1;
            }
            else
            {
               _loc5_ = param3 / _loc5_;
               _loc4_.x = param1.x + _loc5_ * (param2.x - param1.x);
               _loc4_.y = param1.y + _loc5_ * (param2.y - param1.y);
            }
         }
         return _loc4_;
      }
      
      public function stopMove() : void
      {
         if(this.moveMovie)
         {
            this.moveMovie = null;
         }
         removeEventListener(Event.ENTER_FRAME,this.move);
         dispatchEvent(new Event(this.STOP_MOVE));
      }
      
      public function startAlphaFrom0Movie(param1:Object, param2:Number, param3:Number = 0.04) : void
      {
         this.stepAlpha = param3;
         this.numAlphaStop = param2;
         this.movieAlpha = param1;
         this.alphaMovie = param1.alpha;
         addEventListener(Event.ENTER_FRAME,this.allpha);
      }
      
      public function allpha(param1:Event) : void
      {
         this.alphaMovie += this.stepAlpha;
         this.movieAlpha.alpha = this.alphaMovie;
         if(this.alphaMovie >= this.numAlphaStop)
         {
            removeEventListener(Event.ENTER_FRAME,this.allpha);
            dispatchEvent(new Event(this.STOP_ALPHA));
         }
      }
      
      public function destroy() : void
      {
         this.stopFlashMovie();
         removeEventListener(Event.ENTER_FRAME,this.move);
         if(this.moveMovie)
         {
            this.moveMovie = null;
         }
      }
   }
}

