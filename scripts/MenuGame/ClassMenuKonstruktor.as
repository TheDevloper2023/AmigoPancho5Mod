package MenuGame
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class ClassMenuKonstruktor extends ClassMenu
   {
      
      public function ClassMenuKonstruktor()
      {
         super("konstruktor_menu");
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesInterface,param1);
      }
      
      override internal function setListeners() : void
      {
         (movie as Object).button_test.addEventListener(MouseEvent.CLICK,goTest);
         (movie as Object).button_menu.addEventListener(MouseEvent.CLICK,goMenu);
         (movie as Object).button_selector.addEventListener(MouseEvent.CLICK,goSelector);
         (movie as Object).button_save.addEventListener(MouseEvent.CLICK,goSave);
         (movie as Object).button_save.addEventListener(MouseEvent.CLICK,goSend);
         (movie as Object).button_share.addEventListener(MouseEvent.CLICK,goShare);
         (movie as Object).button_load.addEventListener(MouseEvent.CLICK,goLoad);
         (movie as Object).button_clear.addEventListener(MouseEvent.CLICK,goClear);
         (movie as Object).button_undo.addEventListener(MouseEvent.CLICK,goUndo);
         (movie as Object).button_tutorial.addEventListener(MouseEvent.CLICK,goTutorial);
         (movie as Object).button_import.addEventListener(MouseEvent.CLICK,goImport);
      }
      
      override public function destroy() : void
      {
         (movie as Object).button_test.removeEventListener(MouseEvent.CLICK,goTest);
         (movie as Object).button_menu.removeEventListener(MouseEvent.CLICK,goMenu);
         (movie as Object).button_selector.removeEventListener(MouseEvent.CLICK,goSelector);
         (movie as Object).button_save.removeEventListener(MouseEvent.CLICK,goSave);
         (movie as Object).button_save.removeEventListener(MouseEvent.CLICK,goSend);
         (movie as Object).button_share.removeEventListener(MouseEvent.CLICK,goShare);
         (movie as Object).button_load.removeEventListener(MouseEvent.CLICK,goLoad);
         (movie as Object).button_clear.removeEventListener(MouseEvent.CLICK,goClear);
         (movie as Object).button_undo.removeEventListener(MouseEvent.CLICK,goUndo);
         (movie as Object).button_tutorial.removeEventListener(MouseEvent.CLICK,goTutorial);
         (movie as Object).button_import.removeEventListener(MouseEvent.CLICK,goImport);
         super.destroy();
      }
   }
}

