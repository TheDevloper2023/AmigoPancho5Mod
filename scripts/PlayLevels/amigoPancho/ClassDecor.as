package PlayLevels.amigoPancho
{
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   
   public class ClassDecor extends ClassBaseGameObject
   {
      
      public function ClassDecor(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForKaktGorsh);
      }
      
      override public function init(param1:Array = null) : void
      {
         var _loc3_:int = 0;
         super.init(param1);
         var _loc2_:MovieClip = movie.getChildAt(0) as MovieClip;
         if(_loc2_)
         {
            _loc3_ = 1;
            if(Math.random() > 0.5)
            {
               _loc3_ = 2;
            }
            _loc2_.gotoAndStop(_loc3_);
         }
      }
   }
}

