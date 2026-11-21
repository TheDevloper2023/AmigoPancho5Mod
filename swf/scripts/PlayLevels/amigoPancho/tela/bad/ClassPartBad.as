package PlayLevels.amigoPancho.tela.bad
{
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.ClassPartHero;
   import Tela.ClassBaseBody;
   
   public class ClassPartBad extends ClassPartHero
   {
      
      public function ClassPartBad(param1:String)
      {
         super(param1);
         arrPhysicParam = [1,0.3,0.2];
         isTestInFire = true;
         setParentSprite(ClassLayers.spriteForKaktus);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.SetAngularVelocity(0.5);
         if(ClassBaseLevel.numLevel > 15)
         {
            this.setFrame(2);
         }
      }
      
      public function setFrame(param1:int) : void
      {
         movie.gotoAndStop(param1);
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(param1 is ClassPartBad)
         {
            return false;
         }
         return super.shouldCollide(param1);
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

