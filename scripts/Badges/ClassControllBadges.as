package Badges
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class ClassControllBadges extends EventDispatcher
   {
      
      public const OPEN_BADGE:String = "OPEN_BADGE";
      
      private var arrObjectBadges:Array = [];
      
      public var _parent:Sprite;
      
      private var displayBadges:ClassDisplayBadges;
      
      public function ClassControllBadges(param1:Sprite)
      {
         var _loc2_:Array = null;
         var _loc3_:ClassBaseBadge = null;
         var _loc4_:Array = null;
         super();
         this._parent = param1;
         this.displayBadges = new ClassDisplayBadges(this._parent);
         for each(_loc2_ in ClassInformGame.arrBadges)
         {
            this.arrObjectBadges.push(new ClassBaseBadge(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]));
         }
         for each(_loc3_ in this.arrObjectBadges)
         {
            _loc4_ = ClassSetDataGame.loadDataBadge(_loc3_.ownNumber);
            if(_loc4_ != null)
            {
               _loc3_.loadDataFromComp(_loc4_);
            }
         }
         this.clearBadgiesCounterWhereEventInOneLevel();
      }
      
      public function updateBadges(param1:Number, param2:String, param3:int = 0) : void
      {
         var _loc4_:ClassBaseBadge = null;
         for each(_loc4_ in this.arrObjectBadges)
         {
            _loc4_.setEvent(param2,param1,param3);
            if(_loc4_.getStatusOpen() == true && _loc4_.isWasShown == false)
            {
               this.displayBadges.showBadge(_loc4_);
               _loc4_.isWasShown = true;
               dispatchEvent(new Event(this.OPEN_BADGE));
            }
            ClassSetDataGame.saveBadges(_loc4_.getOwnNumber(),_loc4_.arrMission,_loc4_.getStatusOpen(),_loc4_.getNameAchivement(),_loc4_.isWasShown);
         }
      }
      
      public function clearBadgiesCounterWhereEventInOneLevel() : void
      {
         var _loc1_:ClassBaseBadge = null;
         for each(_loc1_ in this.arrObjectBadges)
         {
            _loc1_.clearCounterTiedLevel();
            ClassSetDataGame.saveBadges(_loc1_.getOwnNumber(),_loc1_.arrMission,_loc1_.getStatusOpen(),_loc1_.getNameAchivement(),_loc1_.isWasShown);
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:ClassBaseBadge = null;
         this.displayBadges.destroy();
         this.displayBadges = null;
         for each(_loc1_ in this.arrObjectBadges)
         {
            _loc1_.destroy();
         }
         this.arrObjectBadges = null;
         this._parent = null;
      }
   }
}

