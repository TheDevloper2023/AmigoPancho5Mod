package PlayLevels.amigoPancho.tela.levelElements
{
   import PlayLevels.amigoPancho.ClassLayers;
   import flash.events.Event;
   
   public class ClassVerevka extends ClassLevelObjectZ
   {
      
      public static var arrVer:Array = [];
      
      public var ballon:ClassBaseBalloon;
      
      public function ClassVerevka(param1:String)
      {
         super(param1);
         arrVer.push(this);
         setParentSprite(ClassLayers.spriteForDynamic);
      }
      
      public function setRemove() : void
      {
         isLive = false;
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(Boolean(this.ballon) && this.ballon.isLive == false)
         {
            this.setRemove();
         }
      }
      
      override public function destroyAfterOutOfScreen() : void
      {
         var _loc1_:* = x - width / 2;
         var _loc2_:* = x + width / 2;
         var _loc3_:* = y - height / 2;
         var _loc4_:* = y + height / 2;
         if(_loc2_ < -100 || _loc1_ > 800 || _loc3_ > 700 || _loc4_ < -300)
         {
            trace("destroyAfterOutOfScreen " + this);
            isLive = false;
         }
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         this.setRemove();
         return super.setBlastFromRocket();
      }
      
      override public function destroy() : void
      {
         this.ballon = null;
         removeThisFromArray(arrVer);
         super.destroy();
      }
   }
}

