package PlayLevels.amigoPancho.tela
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import PlayLevels.BaseLevels.ClassBasePhysicLevel;
   import PlayLevels.BaseLevels.ClassMouseEvents;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.ClassBaseBody;
   import Tela.ClassSensor;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class ClassDoska extends ClassLevelObject
   {
      
      private var isCreateSensor:Boolean;
      
      private var isTestContact:Boolean;
      
      private var arrSensors:Array = [];
      
      private var halfFrame:int;
      
      private var timerContactFire:int = 40;
      
      private var widthSensor:int;
      
      private var heightSensor:int;
      
      public var isJustStartFire:Boolean;
      
      public function ClassDoska(param1:String)
      {
         super(param1);
         criticEn = 500;
         arrPhysicParam = [1,0.2,0.2];
         this.widthSensor = width;
         this.heightSensor = height;
         setDestroy(true,criticEn);
      }
      
      override public function setBeginContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
         if(isBreak)
         {
            return;
         }
         super.setBeginContact(param1,contactResult);
         if(param1 is ClassSensor && (param1 as ClassSensor).userData == "fire")
         {
            this.setFire();
         }
      }
      
      public function setFire() : void
      {
         if(isFire == false)
         {
            isFire = true;
            movie.gotoAndPlay(3);
            this.isCreateSensor = true;
            this.isJustStartFire = true;
            ControlSounds.playSound("fire",2.5,1,true);
            ControlSounds.playSound("shipenie",0.5,1,false);
         }
      }
      
      public function fireDoskaNie() : void
      {
         if(isFire == false)
         {
            if(this.timerContactFire-- < 0)
            {
               this.setFire();
            }
         }
      }
      
      private function createSensor() : void
      {
         var _loc1_:int = 0;
         var _loc3_:MovieClip = null;
         _loc1_ = 5;
         var _loc2_:* = _loc1_;
         while(_loc2_ > 0)
         {
            _loc3_ = getCopyMovie("konturB");
            _loc3_.x = movie.x + this.widthSensor / _loc1_ * (_loc2_ - _loc1_ + 2);
            _loc3_.width = this.widthSensor / _loc1_ + 8;
            _loc3_.height = this.heightSensor + 8;
            _loc3_.rotation = movie.rotation;
            addChild(_loc3_);
            _loc3_.visible = false;
            this.arrSensors.push(_loc3_);
            _loc2_--;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:ClassMouseEvents = null;
         var _loc3_:ClassDoska = null;
         var _loc4_:MovieClip = null;
         if(this.isCreateSensor)
         {
            this.isCreateSensor = false;
            this.isTestContact = true;
            this.createSensor();
         }
         if(this.isTestContact)
         {
            for each(_loc2_ in ClassBasePhysicLevel.arrPhysicObjects)
            {
               if(_loc2_ is ClassDoska)
               {
                  _loc3_ = _loc2_ as ClassDoska;
                  for each(_loc4_ in this.arrSensors)
                  {
                     if(_loc4_.hitTestObject(_loc3_))
                     {
                        _loc3_.fireDoskaNie();
                     }
                  }
               }
            }
         }
         super.update();
      }
      
      override public function setEffectFromBomb(param1:Array = null) : void
      {
         super.setEffectFromBomb(param1);
         setBreak();
      }
      
      override public function destroy() : void
      {
         var _loc1_:MovieClip = null;
         if(this.isTestContact)
         {
            for each(_loc1_ in this.arrSensors)
            {
               removeChild(_loc1_);
               _loc1_ = null;
            }
         }
         this.arrSensors = null;
         super.destroy();
      }
   }
}

