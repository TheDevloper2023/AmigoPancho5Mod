package PlayLevels.amigoPancho
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class ClassHoleInPesok extends ClassLevelObject
   {
      
      public static var arrHolls:Array = [];
      
      public function ClassHoleInPesok(param1:String)
      {
         super(param1);
         isPhysic = false;
         arrHolls.push(this);
      }
      
      public static function setHolls() : void
      {
         var _loc1_:ClassHoleInPesok = null;
         for each(_loc1_ in arrHolls)
         {
            _loc1_.createHols();
         }
      }
      
      public function createHols() : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:Point = null;
         var _loc1_:Array = [];
         var _loc2_:int = 1;
         while(_loc2_ < 11)
         {
            _loc3_ = movie["m" + _loc2_];
            _loc4_ = new Point(_loc3_.x,_loc3_.y);
            _loc4_ = localToGlobal(_loc4_);
            _loc4_.x = Math.round(_loc4_.x) as int;
            _loc4_.y = Math.round(_loc4_.y) as int;
            _loc1_.push(_loc4_);
            _loc2_++;
         }
         ClassPolygonPesok.action(_loc1_);
         isLive = false;
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrHolls);
         super.destroy();
      }
   }
}

