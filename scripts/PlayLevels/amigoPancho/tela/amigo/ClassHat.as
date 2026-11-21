package PlayLevels.amigoPancho.tela.amigo
{
   public class ClassHat extends ClassPartAmigo
   {
      
      public function ClassHat(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.SetAngularVelocity(25);
      }
   }
}

