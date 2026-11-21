package PlayLevels.amigoPancho
{
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   
   public class ClassDor extends ClassLevelObject
   {
      
      public static var arrDors:Array = [];
      
      public var isOpen:Boolean;
      
      public function ClassDor(param1:String)
      {
         super(param1);
         movie.gotoAndStop("close");
         arrPhysicParam = [0,0.1,0.1];
         arrDors.push(this);
         setParentSprite(ClassLayers.spriteForDynamic);
      }
      
      public static function setAllOpen() : void
      {
         var _loc1_:ClassDor = null;
         trace("setAllOpen");
         for each(_loc1_ in arrDors)
         {
            if(_loc1_.isOpen == false)
            {
               _loc1_.setOpen();
            }
         }
      }
      
      public function setOpen() : void
      {
         trace("setOpen");
         var _loc1_:ClassDor = new ClassDor("dor");
         _loc1_.setPosition(getPosition().x,getPosition().y);
         parent.addChild(_loc1_);
         _loc1_.init();
         _loc1_.movie.gotoAndStop(2);
         _loc1_.isOpen = true;
         ClassBaseLevel.arrNewObjectGame.push(_loc1_);
         isLive = false;
      }
      
      override public function destroy() : void
      {
         ClassMath.removeObjectFromArray(arrDors,this);
         super.destroy();
      }
   }
}

