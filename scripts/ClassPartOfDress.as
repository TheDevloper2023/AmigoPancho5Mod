package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassPartOfDress extends MovieClip
   {
      
      public static var arrDressPart:Array = [];
      
      private var nameFrame:String;
      
      private var idName:String;
      
      public function ClassPartOfDress()
      {
         super();
         arrDressPart.push(this);
         var _loc1_:String = this.toString().substr(8,100);
         this.idName = _loc1_.substr(0,_loc1_.length - 1);
         if(ClassSetDataGame._so.data[this.idName] != undefined)
         {
            this.nameFrame = ClassSetDataGame._so.data[this.idName];
         }
         else
         {
            this.nameFrame = "0";
         }
         addEventListener(Event.ENTER_FRAME,this.setFirstFrame);
      }
      
      public static function setFrameForAll(param1:String) : void
      {
         var _loc2_:ClassPartOfDress = null;
         for each(_loc2_ in arrDressPart)
         {
            _loc2_.setFrame(param1);
         }
      }
      
      public static function destroyAll() : void
      {
         var _loc1_:ClassPartOfDress = null;
         for each(_loc1_ in arrDressPart)
         {
            _loc1_.destroy();
         }
      }
      
      private function setFirstFrame(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.setFirstFrame);
         this.setFrame(this.nameFrame,true);
      }
      
      public function next(param1:MouseEvent) : void
      {
         nextFrame();
      }
      
      public function setFrame(param1:String, param2:Boolean = false) : void
      {
         this.nameFrame = param1;
         if(param1 != "0")
         {
            gotoAndStop(param1);
         }
         else
         {
            gotoAndStop(1);
         }
         ClassSetDataGame._so.data[this.idName] = param1;
      }
      
      public function destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.next);
         removeEventListener(Event.ENTER_FRAME,this.setFirstFrame);
         ClassMath.removeObjectFromArray(arrDressPart,this);
      }
   }
}

