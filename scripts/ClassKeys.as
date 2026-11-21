package
{
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   
   public class ClassKeys
   {
      
      private static var keyCode:int;
      
      public static var movieclip:Stage;
      
      public static var press_left:Boolean = false;
      
      public static var press_right:Boolean = false;
      
      public static var press_up:Boolean = false;
      
      public static var press_down:Boolean = false;
      
      public static var press_space:Boolean = false;
      
      public static var press_ctrl:Boolean = false;
      
      public static var press_R:Boolean = false;
      
      public static var press_N:Boolean = false;
      
      public static var press_shift:Boolean = false;
      
      public static var press_alt:Boolean = false;
      
      public static var press_DEL:Boolean = false;
      
      public static var press_1:Boolean = false;
      
      public static var press_2:Boolean = false;
      
      public static var press_3:Boolean = false;
      
      public static var press_4:Boolean = false;
      
      public static var press_5:Boolean = false;
      
      public static var press_6:Boolean = false;
      
      public static var press_C:Boolean = false;
      
      public static var press_I:Boolean = false;
      
      public static var press_E:Boolean = false;
      
      public static var isKeyDownWas:Boolean = false;
      
      public static var isKeyUpWas:Boolean = false;
      
      public function ClassKeys()
      {
         super();
      }
      
      public static function init(param1:Stage) : void
      {
         movieclip = param1;
         movieclip.addEventListener(KeyboardEvent.KEY_DOWN,key_down);
         movieclip.addEventListener(KeyboardEvent.KEY_UP,key_up);
      }
      
      public static function is_alt() : Boolean
      {
         return press_alt;
      }
      
      public static function is_shift() : Boolean
      {
         return press_shift;
      }
      
      public static function is_left() : Boolean
      {
         return press_left;
      }
      
      public static function is_right() : Boolean
      {
         return press_right;
      }
      
      public static function is_up() : Boolean
      {
         return press_up;
      }
      
      public static function is_down() : Boolean
      {
         return press_down;
      }
      
      public static function is_space() : Boolean
      {
         return press_space;
      }
      
      public static function is_ctrl() : Boolean
      {
         return press_ctrl;
      }
      
      public static function is_R() : Boolean
      {
         return press_R;
      }
      
      public static function is_N() : Boolean
      {
         return press_N;
      }
      
      public static function is_DEL() : Boolean
      {
         return press_DEL;
      }
      
      public static function is_1() : Boolean
      {
         return press_1;
      }
      
      public static function is_2() : Boolean
      {
         return press_2;
      }
      
      public static function is_3() : Boolean
      {
         return press_3;
      }
      
      public static function is_4() : Boolean
      {
         return press_4;
      }
      
      public static function is_5() : Boolean
      {
         return press_5;
      }
      
      public static function is_6() : Boolean
      {
         return press_6;
      }
      
      public static function is_C() : Boolean
      {
         return press_C;
      }
      
      public static function is_I() : Boolean
      {
         return press_I;
      }
      
      public static function is_E() : Boolean
      {
         return press_E;
      }
      
      private static function key_down(param1:KeyboardEvent) : void
      {
         keyCode = param1.keyCode;
         if(param1.altKey)
         {
            press_alt = true;
         }
         setVariable(keyCode,true);
         isKeyDownWas = true;
         isKeyUpWas = false;
      }
      
      private static function key_up(param1:KeyboardEvent) : void
      {
         isKeyDownWas = false;
         isKeyUpWas = true;
         if(param1.altKey)
         {
            press_alt = false;
         }
         setVariable(param1.keyCode,false);
      }
      
      private static function setVariable(param1:int, param2:Boolean) : void
      {
         if(param1 == 16)
         {
            press_shift = param2;
         }
         if(param1 == 78)
         {
            press_N = param2;
         }
         if(param1 == 32)
         {
            press_space = param2;
         }
         if(param1 == 37)
         {
            press_left = param2;
         }
         if(param1 == 38)
         {
            press_up = param2;
         }
         if(param1 == 39)
         {
            press_right = param2;
         }
         if(param1 == 40)
         {
            press_down = param2;
         }
         if(param1 == 17)
         {
            press_ctrl = param2;
         }
         if(param1 == 82)
         {
            press_R = param2;
         }
         if(param1 == 46)
         {
            press_DEL = param2;
         }
         if(param1 == 67)
         {
            press_C = param2;
         }
         if(param1 == 73)
         {
            press_I = param2;
         }
         if(param1 == 69)
         {
            press_E = param2;
         }
         if(param1 == 49)
         {
            press_1 = param2;
         }
         if(param1 == 50)
         {
            press_2 = param2;
         }
         if(param1 == 51)
         {
            press_3 = param2;
         }
         if(param1 == 52)
         {
            press_4 = param2;
         }
         if(param1 == 53)
         {
            press_5 = param2;
         }
         if(param1 == 54)
         {
            press_6 = param2;
         }
      }
      
      public static function falsePress() : void
      {
         press_left = false;
         press_right = false;
         press_up = false;
         press_down = false;
         press_space = false;
         press_ctrl = false;
         press_R = false;
         press_N = false;
         press_shift = false;
         press_alt = false;
         press_DEL = false;
         press_1 = false;
         press_2 = false;
         press_3 = false;
         press_4 = false;
         press_5 = false;
         press_6 = false;
         press_C = false;
         press_I = false;
         press_E = false;
         isKeyDownWas = false;
      }
      
      public static function getKeyCode() : int
      {
         return keyCode;
      }
      
      public static function destroy() : void
      {
         movieclip.removeEventListener(KeyboardEvent.KEY_DOWN,key_down);
         movieclip.removeEventListener(KeyboardEvent.KEY_UP,key_up);
         movieclip = null;
      }
   }
}

