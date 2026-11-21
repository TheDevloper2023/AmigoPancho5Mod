package PlayLevels.amigoPancho
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObjectZ;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class ClassKontSfer extends ClassLevelObjectZ
   {
      
      public function ClassKontSfer()
      {
         super("kontCirk");
         isPhysic = false;
         movie.visible = false;
         width = ClassPolygonPesok.radius * 2;
         height = width;
      }
      
      public function getPointsMark() : Array
      {
         var _loc3_:MovieClip = null;
         var _loc4_:Point = null;
         var _loc1_:Array = [];
         var _loc2_:int = 1;
         while(_loc2_ < 7)
         {
            _loc3_ = movie["m" + _loc2_];
            _loc4_ = new Point(_loc3_.x,_loc3_.y);
            _loc4_ = localToGlobal(_loc4_);
            _loc4_.x = Math.round(_loc4_.x) as int;
            _loc4_.y = Math.round(_loc4_.y) as int;
            _loc1_.push(_loc4_);
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

