package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassBoxDestroy extends ClassBasePerfomer
   {
      
      public function ClassBoxDestroy(param1:String)
      {
         super(param1);
         setDestroy(true,500);
         arrPhysicParam = [0,0,0];
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         mout(param1);
         super.mDown(param1);
         startBlow("sBlowUp03");
         amigo5.mainStage.dispatchEvent(new Event("WOOD_BREAK"));
         ControlSounds.loadAndPlay("mVanish",1,1.5,true);
         this.destroyObjectsIfJoint();
      }
      
      public function destroyObjectsIfJoint() : void
      {
         var _loc1_:b2Joint = null;
         var _loc2_:b2JointEdge = body.GetJointList();
         while(_loc2_)
         {
            _loc1_ = _loc2_.joint;
            _loc1_.GetBodyA().GetUserData().isLive = false;
            _loc1_.GetBodyB().GetUserData().isLive = false;
            _loc2_ = _loc2_.next;
         }
      }
      
      override public function setBlastFromRocket() : Boolean
      {
         ControlSounds.loadAndPlay("mVanish",1,1,true);
         startBlow("sBlowUp01",1.5,false);
         setLowAlpha(true,0.2);
         return true;
      }
   }
}

