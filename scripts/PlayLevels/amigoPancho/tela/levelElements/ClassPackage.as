package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   
   public class ClassPackage extends ClassLevelObject
   {
      
      public function ClassPackage(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForSuperStat);
         movie.mouseChildren = false;
         movie.mouseEnabled = false;
         mouseChildren = false;
         mouseEnabled = false;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.SetAngularDamping(3);
      }
      
      override public function setBeginContact(param1:ClassBaseBody, param2:b2Contact) : void
      {
         super.setBeginContact(param1,param2);
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
      }
      
      public function setRotation(param1:Number) : void
      {
         rotation = param1;
         if(isBodyCreated)
         {
            body.SetAngle(ClassMath.getRadianFromGradus(param1));
         }
      }
   }
}

