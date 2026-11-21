package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassRotateBySwitchFire;
   import Tela.ClassBaseBody;
   import Tela.ClassMultiShape;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassLevelObject extends ClassMultiShape
   {
      
      public static var arrLevelObjects:Array = [];
      
      public var isBreakFromSensor:Boolean;
      
      public var isTestInFire:Boolean;
      
      public var isBlastWas:Boolean;
      
      public function ClassLevelObject(param1:String)
      {
         super(param1);
         this.isBreakFromSensor = true;
         arrPhysicParam = [1,0.5,0.3,0,0];
         arrLevelObjects.push(this);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
      }
      
      public function setEffectFromBomb(param1:Array = null) : void
      {
      }
      
      public function setBlastFromRocket() : Boolean
      {
         return false;
      }
      
      public function setBombJoint() : void
      {
      }
      
      public function startBlow(param1:String, param2:Number = 1, param3:Boolean = true, param4:Point = null) : void
      {
         var _loc5_:ClassBlast = null;
         if(param4 == null)
         {
            param4 = new Point(x,y);
         }
         _loc5_ = new ClassBlast(param1);
         _loc5_.setPosition(param4.x,param4.y,0,param2,param2);
         ClassLayers.spriteForBoom.addChild(_loc5_);
         ClassLayers.spriteForBoom.mouseEnabled = false;
         ClassLayers.spriteForBoom.mouseChildren = false;
         _loc5_.init();
         ClassBaseLevel.arrNewObjectGame.push(_loc5_);
         isLive = !param3;
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         this.destroyAfterOutOfScreen();
         if(this.isTestInFire)
         {
            this.testFire();
         }
      }
      
      public function destroyAfterOutOfScreen() : void
      {
         var _loc1_:* = x - width / 2;
         var _loc2_:* = x + width / 2;
         var _loc3_:* = y - height / 2;
         var _loc4_:* = y + height / 2;
         if(_loc2_ < -100 || _loc1_ > 800 || _loc3_ > 1500 || _loc4_ < -150)
         {
            isLive = false;
         }
      }
      
      public function testFire() : void
      {
         var _loc1_:ClassFire = null;
         var _loc2_:MovieClip = null;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         for each(_loc1_ in ClassFire.arrFire)
         {
            if(hitTestObject(_loc1_))
            {
               this.actionIfInFire();
            }
         }
         for each(_loc2_ in ClassRotateBySwitchFire.arrFire)
         {
            _loc3_ = new Point(_loc2_.x,_loc2_.y);
            _loc4_ = _loc2_.parent.localToGlobal(_loc3_);
            if(hitTestPoint(_loc4_.x,_loc4_.y))
            {
               this.actionIfInFire();
            }
         }
      }
      
      public function actionIfInFire() : void
      {
      }
      
      override public function setBeginContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
         if(isBreak)
         {
            return;
         }
         super.setBeginContact(param1,contactResult);
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrLevelObjects);
         super.destroy();
      }
   }
}

