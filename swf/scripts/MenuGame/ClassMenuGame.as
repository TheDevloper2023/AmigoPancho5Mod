package MenuGame
{
   import ActionsBeforeGame.ClassPreloader;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import StructureGame.ClassControlGame;
   import StructureGame.ClassPause;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ClassMenuGame extends ClassMenu
   {
      
      private static var objStars:MovieClip;
      
      private static var countStar:int;
      
      private var totalTextField:TextField;
      
      private var spriteForButtons:Sprite = new Sprite();
      
      public var objPause:ClassPause;
      
      private var moveCours:int = -1;
      
      private var timeMove:int = 0;
      
      private var isButOutScreen:Boolean;
      
      public function ClassMenuGame()
      {
         super("game_menu");
         this.totalTextField = (movie as Object).total;
         movie.bubble_menu.x = 628;
         movie.bubble_menu.y = 15;
         var _loc1_:int = ClassBaseLevel.numLevel;
         this.mouseEnabled = true;
         movie.bubble_menu.visible = ClassFlags.isShowLogoInLevels;
         ClassControlGame.spriteForPlashka.addChildAt(movie.bubble_menu,0);
         addChild(this.spriteForButtons);
         countStar = 0;
         ClassPreloader.showLogo(this);
      }
      
      public static function setGetStars(param1:int) : void
      {
         trace("1 countStars " + param1);
         objStars.setGetStar(param1);
      }
      
      public static function setOpenStar(param1:int) : void
      {
         objStars.init2(param1);
      }
      
      override public function setLevelName(param1:String) : void
      {
         super.setLevelName(param1);
         objStars = movie.ss;
         objStars.init(param1,true);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesInterface,param1);
      }
      
      public function objedButtons(param1:Sprite) : void
      {
      }
      
      public function setTotalScores(param1:String) : void
      {
         while(param1.length < 4)
         {
            param1 = "0" + param1;
         }
         this.totalTextField.text = "TOTAL: " + param1;
      }
      
      public function getScoreTable() : Array
      {
         return [this.totalTextField,scoresTextField,nameLevel,nickLevel];
      }
      
      public function hideButtons() : void
      {
         if(this.isButOutScreen == true)
         {
            this.goPause();
         }
      }
      
      override internal function setListeners() : void
      {
         super.setListeners();
         (movie as Object).button_editor.addEventListener(MouseEvent.CLICK,goEditor);
         (movie as Object).button_editor.visible = ClassFlags.isVisibleEdit;
         movie.button_solution.addEventListener(MouseEvent.CLICK,goSolution);
         (movie as Object).button_pause.addEventListener(MouseEvent.CLICK,this.goPause);
         movie.button_achi.addEventListener(MouseEvent.CLICK,goAchi);
      }
      
      public function goPause(param1:Event = null) : void
      {
         ButtonsCkick.play();
         this.objPause = new ClassPause();
         addChild(this.objPause);
         this.objPause.sendObjectForEvent(this);
      }
      
      override public function receiveEvent(param1:ClassBaseGameObject, param2:String) : void
      {
         if(param2 == "SELECTOR")
         {
            goSelector(null);
         }
         if(param2 == "DRESS")
         {
            goAchi(null);
         }
         if(param2 == "NEXT")
         {
            goSelector(null);
         }
         if(param2 == "RESET")
         {
            goReset(null);
         }
         if(param2 == "CLOSE_FINISH")
         {
            this.objPause = null;
         }
      }
      
      private function moveButtons(param1:Event) : void
      {
         if(this.timeMove++ > 7)
         {
            removeEventListener(Event.ENTER_FRAME,this.moveButtons);
            this.timeMove = 0;
            isMove = false;
         }
         else
         {
            this.spriteForButtons.y -= 5.25 * this.moveCours;
         }
      }
      
      public function putLogo(param1:Sprite) : void
      {
         param1.addChild((movie as Object).game_logo);
      }
      
      override public function destroy() : void
      {
         objStars = null;
         countStar = 0;
         if(this.objPause)
         {
            this.objPause.parent.removeChild(this.objPause);
            this.objPause.destroy();
            this.objPause = null;
         }
         this.totalTextField = null;
         movie.button_achi.removeEventListener(MouseEvent.CLICK,goAchi);
         (movie as Object).button_editor.removeEventListener(MouseEvent.CLICK,goEditor);
         (movie as Object).button_solution.removeEventListener(MouseEvent.CLICK,goSolution);
         (movie as Object).button_pause.removeEventListener(MouseEvent.CLICK,this.goPause);
         removeEventListener(Event.ENTER_FRAME,this.moveButtons);
         while(this.spriteForButtons.numChildren)
         {
            this.spriteForButtons.removeChildAt(0);
         }
         removeChild(this.spriteForButtons);
         this.spriteForButtons = null;
         super.destroy();
      }
   }
}

