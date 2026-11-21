package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   import flash.display.MovieClip;
   
   public class ClassGrad extends ClassLevelObject
   {
      
      public var isGrad:Boolean;
      
      public function ClassGrad(param1:String)
      {
         super(param1);
         this.isGrad = false;
         if(param1 == "grad")
         {
            this.isGrad = true;
         }
         arrPhysicParam = [1,0.2,0.2];
         setParentSprite(ClassLayers.spriteForBee);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         var _loc2_:Number = 0;
         if(this.isGrad)
         {
            _loc2_ = Math.round(180);
         }
         setPosition(x,y,_loc2_);
         body.SetFixedRotation(true);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         setLowAlpha(true);
         body.SetFixedRotation(true);
         body.SetLinearDamping(3);
         movie.gotoAndPlay(2);
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassCloud)
         {
            return false;
         }
         if(param1 is ClassGrad)
         {
            return false;
         }
         return super.shouldCollide(param1);
      }
   }
}

