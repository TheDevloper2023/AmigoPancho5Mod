package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassKoluchFire extends ClassLevelObject
   {
      
      public static var arrKoluch:Array = [];
      
      private var objKaktFire:ClassKaktusFire;
      
      private var isContactAlow:Boolean;
      
      private var timerContact:int;
      
      public var isContactPack:Boolean;
      
      public function ClassKoluchFire()
      {
         super("koluch");
         arrPhysicParam = [2,0.2,0.05];
         ClassBaseLevel.arrGameObjects.push(this);
         arrKoluch.push(this);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.objKaktFire = param1[0] as ClassKaktusFire;
         body.SetFixedRotation(true);
         body.setCustomGravity(new b2Vec2(0,0));
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         var _loc4_:int = 0;
         super.setPostSolveContact(param1,param2,param3);
         if(param1 != this.objKaktFire)
         {
            body.SetFixedRotation(false);
            body.m_useCustomGravity = false;
            _loc4_ = 1;
            if(Math.random() > 0.5)
            {
               _loc4_ = -1;
            }
            body.SetAngularVelocity(Math.random() * 20 * _loc4_);
            this.isContactAlow = true;
            isLive = false;
         }
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         var _loc2_:ClassKaktus = null;
         if(param1 is ClassPackage)
         {
            this.isContactPack = true;
            isLive = false;
            return false;
         }
         if(this.isContactAlow == false)
         {
            if(param1 is ClassKaktus)
            {
               _loc2_ = param1 as ClassKaktus;
               if(param1 == this.objKaktFire)
               {
                  return false;
               }
               if(_loc2_.isColideWithKoluch == false)
               {
                  isLive = false;
                  return false;
               }
            }
         }
         return true;
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         return false;
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(arrKoluch.length > 10)
         {
            arrKoluch[0].isLive = false;
         }
      }
      
      override public function destroy() : void
      {
         this.objKaktFire = null;
         removeThisFromArray(arrKoluch);
         super.destroy();
      }
   }
}

