package PlayLevels.amigoPancho.tela
{
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import flash.events.Event;
   
   public class ClassKoleso extends ClassLevelObject
   {
      
      public function ClassKoleso(param1:String)
      {
         super(param1);
      }
      
      override public function update(param1:Event = null) : void
      {
         if(isBodyCreated)
         {
            if(speedBody < 0.06 && body.GetAngularVelocity() < Math.abs(0.01))
            {
               body.SetAngularVelocity(0);
            }
         }
         super.update(param1);
      }
   }
}

