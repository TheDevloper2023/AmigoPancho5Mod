package PlayLevels.amigoPancho.tela.levelElements
{
   public class ClassBalloonBad extends ClassBaseBalloon
   {
      
      public function ClassBalloonBad(param1:String)
      {
         super(param1);
         yLimit = -500;
         trace("ClassBalloonBad");
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         startForseFly = -1.21 * body.GetMass();
      }
   }
}

