package PlayLevels.amigoPancho.tela.interElements.switchs
{
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassBlockPerfomer;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragTimerKol;
   import flash.events.Event;
   
   public class ClassTimerSwitch extends ClassBlockPerfomer
   {
      
      private var timerPause:int = 10;
      
      private var timerStep:int;
      
      public function ClassTimerSwitch(param1:String)
      {
         super(param1);
         arrPerfCont = ClassDragTimerKol.arrDrag;
         setParentSprite(ClassLayers.spriteForStatic);
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.timerPause > 0 && ++this.timerStep > 70)
         {
            this.timerStep = 0;
            if(--this.timerPause < 1)
            {
               setOn(1);
            }
            movie.timer.text = this.timerPause.toString();
         }
      }
   }
}

