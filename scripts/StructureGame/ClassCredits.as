package StructureGame
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class ClassCredits extends ClassBaseStructureGameElement
   {
      
      public const MENU:String = "MENU";
      
      private var noteMusic:MovieClip;
      
      public function ClassCredits()
      {
         super("credits");
         movie.myAnton.addEventListener(MouseEvent.CLICK,this.go_Anton);
         movie.button_menu.addEventListener(MouseEvent.CLICK,this.closeCredits);
         movie.but_bubble.addEventListener(MouseEvent.CLICK,this.go_bubble_credits);
         movie.but_bubble.visible = ClassFlags.isShowLogo;
      }
      
      private function go_Anton(param1:Event) : void
      {
         var _loc2_:URLRequest = new URLRequest("mailto:arosw@mail.ru");
         navigateToURL(_loc2_,"_blank");
      }
      
      private function closeCredits(param1:Event) : void
      {
         extinction(this.MENU);
      }
      
      private function go_bubble_credits(param1:Event) : void
      {
         ClassLinks.goToLink("Credits_logo");
      }
      
      override public function destroy() : void
      {
         movie.myAnton.removeEventListener(MouseEvent.CLICK,this.go_Anton);
         movie.button_menu.removeEventListener(MouseEvent.CLICK,this.closeCredits);
         movie.but_bubble.removeEventListener(MouseEvent.CLICK,this.go_bubble_credits);
         while(movie.numChildren)
         {
            movie.removeChildAt(0);
         }
         removeChild(movie);
         while(numChildren)
         {
            removeChildAt(0);
         }
         movie = null;
      }
   }
}

