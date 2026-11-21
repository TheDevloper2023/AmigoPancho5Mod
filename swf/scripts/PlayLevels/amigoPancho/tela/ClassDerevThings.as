package PlayLevels.amigoPancho.tela
{
   public class ClassDerevThings extends ClassDoska
   {
      
      public function ClassDerevThings(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         criticEn = 100;
      }
      
      override public function setBreak(param1:int = 0) : void
      {
         super.setBreak();
         ControlSounds.playSound("udar2",1);
      }
   }
}

