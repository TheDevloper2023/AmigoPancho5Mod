package PlayLevels.amigoPancho.tela.interElements.switchs
{
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragBySwitch;
   
   public class ClassDragByDynSwitch extends ClassDragBySwitch
   {
      
      public function ClassDragByDynSwitch(param1:String)
      {
         super(param1);
      }
      
      override public function getActionForse(param1:int) : Number
      {
         return param1 / 15;
      }
   }
}

