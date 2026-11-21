package Badges
{
   import flash.display.MovieClip;
   
   public class ClassBaseBadge
   {
      
      private var nameBadge:String;
      
      private var nameAchivement:String;
      
      public var isOpen:Boolean;
      
      public var ownNumber:int;
      
      public var arrMission:Array;
      
      public var movieBadge:MovieClip;
      
      public var isWasShown:Boolean = false;
      
      public function ClassBaseBadge(param1:int, param2:String, param3:Array, param4:String)
      {
         super();
         this.nameAchivement = param4;
         this.arrMission = param3;
         this.ownNumber = param1;
      }
      
      public function setEvent(param1:String, param2:int, param3:int = -10) : void
      {
         var _loc5_:Array = null;
         if(this.isOpen == true)
         {
            return;
         }
         var _loc4_:Boolean = true;
         for each(_loc5_ in this.arrMission)
         {
            if(param1 == _loc5_[0])
            {
               if(_loc5_[3] == param2)
               {
                  ++_loc5_[1];
                  if(param3 < 0)
                  {
                     _loc5_[4] = true;
                  }
                  else if(param3 > 0)
                  {
                     if(param3 >= _loc5_[2])
                     {
                        _loc5_[4] = true;
                     }
                     else
                     {
                        _loc5_[4] = false;
                     }
                  }
                  else if(_loc5_[1] <= _loc5_[2])
                  {
                     _loc5_[4] = true;
                  }
                  else
                  {
                     _loc5_[4] = false;
                  }
               }
            }
         }
         for each(_loc5_ in this.arrMission)
         {
            if(_loc5_[4] == false)
            {
               _loc4_ = false;
            }
         }
         if(_loc4_ == true)
         {
            this.isOpen = true;
         }
      }
      
      public function closeBadge() : void
      {
         this.isOpen = false;
         this.movieBadge.gotoAndStop("close");
      }
      
      public function getOwnNumber() : int
      {
         return this.ownNumber;
      }
      
      public function getStatusOpen() : Boolean
      {
         return this.isOpen;
      }
      
      public function loadDataFromComp(param1:Array) : void
      {
         this.arrMission = param1[0];
         this.isOpen = param1[1];
         this.isWasShown = param1[3];
      }
      
      public function getNameAchivement() : String
      {
         return this.nameAchivement;
      }
      
      public function clearCounterTiedLevel() : void
      {
         var _loc1_:Array = null;
         if(this.isOpen == false)
         {
            for each(_loc1_ in this.arrMission)
            {
               if(_loc1_[3] > 0)
               {
                  _loc1_[1] = 0;
                  _loc1_[4] = false;
               }
            }
         }
      }
      
      public function destroy() : void
      {
         this.movieBadge = null;
         this.arrMission = null;
      }
   }
}

