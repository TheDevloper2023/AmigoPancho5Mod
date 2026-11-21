package PlayLevels.amigoPancho.tela.interElements.performers
{
   import flash.events.Event;
   
   public class ClassBlockPerfomer extends ClassContacterPerforms
   {
      
      public function ClassBlockPerfomer(param1:String)
      {
         super(param1);
      }
      
      override public function findHitPerf(param1:Event) : void
      {
         var _loc2_:ClassBasePerfomer = null;
         super.findHitPerf(param1);
         for each(_loc2_ in arrPerfCont)
         {
            _loc2_.setMouseReactOff();
         }
      }
      
      override public function setOn(param1:Number) : void
      {
         var _loc2_:ClassBasePerfomer = null;
         for each(_loc2_ in arrPerfCont)
         {
            if(!(_loc2_ is ClassContacterPerforms))
            {
               _loc2_.setOn(param1);
            }
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

