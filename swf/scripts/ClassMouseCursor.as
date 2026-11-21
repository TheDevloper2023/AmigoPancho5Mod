package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class ClassMouseCursor extends Sprite
   {
      
      private static var curMovieUserCursor:MovieClip;
      
      private static var mainSprite:Stage;
      
      private static var isShowingUserCursor:Boolean;
      
      private static var numSelectedCursor:int;
      
      public static var typeSelectedCursor:String;
      
      public static var USER_CURSOR:String = "USER_CURSOR";
      
      public static var MOUSE_CURSOR:String = "MOUSE_CURSOR";
      
      private static var arrCursors:Array = [];
      
      private static var isMakeVisibleUserCursor:Boolean = true;
      
      public function ClassMouseCursor()
      {
         super();
      }
      
      public static function init(param1:Array, param2:Stage) : void
      {
         var _loc3_:MovieClip = null;
         mainSprite = param2;
         arrCursors = param1;
         for each(_loc3_ in arrCursors)
         {
            _loc3_.visible = false;
            mainSprite.addChild(_loc3_);
            _loc3_.mouseEnabled = false;
            _loc3_.mouseChildren = false;
         }
         curMovieUserCursor = arrCursors[0] as MovieClip;
         mainSprite.addEventListener(Event.ENTER_FRAME,update);
      }
      
      public static function showUserCusror(param1:int) : void
      {
         var _loc2_:MovieClip = null;
         for each(_loc2_ in arrCursors)
         {
            _loc2_.visible = false;
         }
         if(isMakeVisibleUserCursor == true)
         {
            hideMouseCursor();
         }
         curMovieUserCursor = arrCursors[param1 - 1] as MovieClip;
         if(curMovieUserCursor)
         {
            curMovieUserCursor.visible = isMakeVisibleUserCursor;
            isShowingUserCursor = true;
            numSelectedCursor = param1;
            typeSelectedCursor = USER_CURSOR;
            update(null);
         }
      }
      
      public static function showMouseCursor() : void
      {
         var _loc1_:MovieClip = null;
         for each(_loc1_ in arrCursors)
         {
            _loc1_.visible = false;
         }
         isShowingUserCursor = false;
         Mouse.cursor = MouseCursor.AUTO;
         typeSelectedCursor = MOUSE_CURSOR;
         Mouse.show();
      }
      
      public static function setIsVisibleUserCursor(param1:Boolean) : void
      {
         isMakeVisibleUserCursor = param1;
         if(typeSelectedCursor == USER_CURSOR)
         {
            curMovieUserCursor.visible = isMakeVisibleUserCursor;
         }
      }
      
      public static function createMouseCursorAuto() : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      public static function getNumLastSelectedUserCursor() : int
      {
         return numSelectedCursor;
      }
      
      public static function getTypeLastSelectedCursor() : String
      {
         return typeSelectedCursor;
      }
      
      public static function createMouseCursorButton() : void
      {
         Mouse.cursor = MouseCursor.BUTTON;
      }
      
      public static function hideMouseCursor() : void
      {
         Mouse.hide();
      }
      
      private static function update(param1:Event) : void
      {
         if(isShowingUserCursor)
         {
            curMovieUserCursor.x = mainSprite.mouseX;
            curMovieUserCursor.y = mainSprite.mouseY;
         }
      }
      
      public static function getMovieCursor(param1:int) : MovieClip
      {
         return arrCursors[param1 - 1] as MovieClip;
      }
   }
}

