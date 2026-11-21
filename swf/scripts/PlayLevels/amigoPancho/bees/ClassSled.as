package PlayLevels.amigoPancho.bees
{
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassSled extends ClassBaseGameObject
   {
      
      public var lastDist:Number;
      
      public function ClassSled()
      {
         super("sled");
         alpha = 0.2;
         addEventListener(Event.ENTER_FRAME,this.update);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,"sled");
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.update);
         super.destroy();
      }
   }
}

