package StructureGame
{
   import ActionsBeforeGame.ClassPreloader;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public class ClassShowBadges extends ClassBaseStructureGameElement
   {
      
      public static var countF:int = 1;
      
      public static var arrFrames:Array = ["fSkin02","fSkin01","fSkin07","fSkin04","fSkin03","fSkin05","0","fSkin10","fSkin11","fGhost","fHero01","fHero02","fHero03","fHero04","fHero05","fHero06","fHero07","fHero08","fHero09","fHero10","fHero11","fHero12","fHero13","fHero16","fHero17","fHero18","fHero19","fHero20"];
      
      public const MENU:String = "MENU";
      
      public const LEVEL:String = "LEVEL";
      
      private var butMenu:SimpleButton;
      
      private var numSelectedLevel:Number;
      
      public function ClassShowBadges(param1:Array)
      {
         super("bagdes_show");
         this.butMenu = (movie as Object).butMenu;
         this.butMenu.addEventListener(MouseEvent.CLICK,this.goMenu);
         movie.but_more.addEventListener(MouseEvent.CLICK,this.goMore);
         var _loc2_:MovieClip = ClassMath.getCopyMovie(amigo5.swfMoviesZ,"heroForDress");
         movie.addChild(_loc2_);
         _loc2_.width *= 0.8;
         _loc2_.height *= 0.8;
         _loc2_.x += 70;
         _loc2_.y += 55;
         movie.l.addEventListener(MouseEvent.CLICK,this.mouseLeft);
         movie.r.addEventListener(MouseEvent.CLICK,this.mouseRight);
         sSign01.isVisible = false;
         if(ClassSetDataGame._so.data.frameDress > 0)
         {
            countF = int(ClassSetDataGame._so.data.frameDress);
         }
         else
         {
            countF = 1;
         }
         ClassPreloader.showLogo(this);
         movie.like.addEventListener(MouseEvent.CLICK,this.goLike);
      }
      
      private function goLike(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkLike();
      }
      
      private function goMore(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         ClassLinks.goToLinkMore();
      }
      
      private function mouseLeft(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         this.nextFrame(-1);
      }
      
      private function mouseRight(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         this.nextFrame(1);
      }
      
      private function nextFrame(param1:int) : void
      {
         countF += param1;
         if(countF < 1)
         {
            countF = arrFrames.length;
         }
         if(countF > arrFrames.length)
         {
            countF = 1;
         }
         ClassPartOfDress.setFrameForAll(arrFrames[countF - 1]);
         ClassSetDataGame._so.data.frameDress = countF;
      }
      
      public function getNumLevel() : int
      {
         return this.numSelectedLevel;
      }
      
      private function goMenu(param1:MouseEvent) : void
      {
         ButtonsCkick.play();
         extinction(this.MENU);
      }
      
      override public function destroy() : void
      {
         movie.like.removeEventListener(MouseEvent.CLICK,this.goLike);
         movie.but_more.removeEventListener(MouseEvent.CLICK,this.goMore);
         this.butMenu.removeEventListener(MouseEvent.CLICK,this.goMenu);
         this.butMenu = null;
         movie.l.removeEventListener(MouseEvent.CLICK,this.mouseLeft);
         movie.r.removeEventListener(MouseEvent.CLICK,this.mouseRight);
         ClassPartOfDress.destroyAll();
         super.destroy();
      }
   }
}

