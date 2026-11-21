package Tela
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassOscolok extends ClassBaseBody
   {
      
      private var timeInLive:int = 40;
      
      private var isCollision:Boolean;
      
      public function ClassOscolok(param1:MovieClip, param2:Boolean)
      {
         super(nameMovie);
         this.isCollision = param2;
         movie = param1;
         addChild(movie);
         nameMovie = movie.toString();
         arrPhysicParam = [20,0.3,0.2];
      }
      
      override public function createPhysicShape() : void
      {
         setShapeCircle(width / 2);
         super.createPhysicShape();
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         return false;
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update();
         if((alpha = alpha - 0.02) <= 0)
         {
            isLive = false;
         }
      }
   }
}

