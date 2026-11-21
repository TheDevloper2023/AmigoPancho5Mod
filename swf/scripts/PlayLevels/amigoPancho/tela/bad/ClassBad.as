package PlayLevels.amigoPancho.tela.bad
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.ClassHero;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseBalloon;
   import Tela.ClassBaseBody;
   
   public class ClassBad extends ClassHero
   {
      
      private var isIspugWas:Boolean;
      
      private var objHead:ClassHeadBad;
      
      public function ClassBad(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForKaktus);
      }
      
      override public function init(param1:Array = null) : void
      {
         var _loc2_:ClassBaseBody = null;
         super.init(param1);
         for each(_loc2_ in arrPart)
         {
            if(_loc2_ is ClassHeadBad)
            {
               this.objHead = _loc2_ as ClassHeadBad;
            }
         }
      }
      
      override public function showBlast() : void
      {
         createBlast(this.objHead.getPosition());
      }
      
      override public function balloonBreak(param1:ClassBaseBalloon) : void
      {
         super.balloonBreak(param1);
         if(this.isIspugWas == false)
         {
            this.isIspugWas = true;
            this.objHead.playIspug();
         }
      }
      
      override public function destroy() : void
      {
         this.objHead = null;
         super.destroy();
      }
   }
}

