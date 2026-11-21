package PlayLevels.amigoPancho.tela.interElements.performers
{
   import flash.display.Sprite;
   
   public class ClassDragMouseKakt extends ClassDragByMouse
   {
      
      public function ClassDragMouseKakt(param1:String)
      {
         super(param1);
         isVertical = true;
      }
      
      override public function getSpriteForLight() : Sprite
      {
         return movie.m;
      }
   }
}

