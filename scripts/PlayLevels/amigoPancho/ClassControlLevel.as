package PlayLevels.amigoPancho
{
   import PlayLevels.BaseLevels.ClassMouseEvents;
   import Tela.ClassBaseBody;
   import Tela.ClassDestroyTelo;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassControlLevel extends ClassLayers
   {
      
      private var timerScore:int = 10;
      
      private var pauseWin:int = 30;
      
      private var isWasPutSlip:Boolean;
      
      private var pausePutSleep:int = 5;
      
      private var waitMoveObejct:int = 0;
      
      public var isLiveHeroOnLevel:Boolean;
      
      public var isExistMoveObjec:Boolean;
      
      private var waitIfLevelLose:int;
      
      private var isWasFirstManyUpdates:Boolean;
      
      private var countFirstUpdates:int = 3;
      
      public var timeStopObject:int;
      
      public var isStopAllLong:Boolean;
      
      public function ClassControlLevel()
      {
         super();
      }
      
      override public function mouseDown(param1:MouseEvent = null) : void
      {
         super.mouseDown(param1);
      }
      
      override public function checkKeys() : void
      {
         super.checkKeys();
         if(isStartListenenKeys)
         {
            if(ClassKeys.is_R())
            {
               isStartListenenKeys = false;
               setReset();
            }
            if(ClassKeys.is_ctrl() && ClassKeys.is_alt() && ClassKeys.is_shift() && ClassKeys.is_N())
            {
               isStartListenenKeys = false;
               setNextLevel();
            }
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         if(ClassPaused.isPaused)
         {
            return;
         }
         this.isLiveHeroOnLevel = false;
         this.isExistMoveObjec = false;
         super.update(param1);
         if(this.isWasFirstManyUpdates == false)
         {
            if(--this.countFirstUpdates < 0)
            {
               this.isWasFirstManyUpdates = true;
            }
            else
            {
               this.update();
            }
         }
         this.checkKeys();
         if(this.isExistMoveObjec == false)
         {
            if(++this.timeStopObject > 50)
            {
               this.isStopAllLong = true;
            }
         }
         else
         {
            this.timeStopObject = 0;
            this.isStopAllLong = false;
         }
      }
      
      override public function updateGameObject(param1:ClassMouseEvents) : void
      {
         var _loc2_:ClassBaseBody = null;
         super.updateGameObject(param1);
         if(isLevelOver == false)
         {
            if(param1 is ClassBaseBody)
            {
               _loc2_ = param1 as ClassBaseBody;
               if(_loc2_.isJointExists == false && _loc2_.speedBody > 0.2)
               {
                  this.isExistMoveObjec = true;
               }
            }
         }
      }
      
      override public function startDestroyFragmentsGameObject(param1:ClassDestroyTelo) : void
      {
         super.startDestroyFragmentsGameObject(param1);
      }
      
      override public function destroyGameObject(param1:ClassMouseEvents) : void
      {
         super.destroyGameObject(param1);
      }
      
      private function showScoreFromDestroy(param1:Point, param2:int) : void
      {
      }
      
      public function putSleepAll() : void
      {
         var _loc2_:ClassBaseBody = null;
         var _loc1_:int = 0;
         while(_loc1_ < arrPhysicObjects.length)
         {
            _loc2_ = arrPhysicObjects[_loc1_] as ClassBaseBody;
            if(Boolean(_loc2_) && _loc2_.isBodyCreated)
            {
               _loc2_.body.SetAwake(false);
            }
            _loc1_++;
         }
         this.isWasPutSlip = true;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

