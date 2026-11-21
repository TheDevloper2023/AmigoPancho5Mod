package PlayLevels.amigoPancho
{
   import ActionsBeforeGame.ClassPreloader;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseStar;
   import StructureGame.ClassShowBadges;
   import Tela.ClassBaseBody;
   import Tela.ClassBaseGameObject;
   import Tela.ClassPol;
   import Tela.Hints.ClassHint;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ClassPlayLevel extends ClassControlLevel
   {
      
      public static var isUpdate:Boolean = true;
      
      private var pauseScore:int;
      
      private var isShowSlider:Boolean;
      
      private var timerw:int;
      
      private var pauseDestroyBodies:int;
      
      public function ClassPlayLevel()
      {
         ControlSounds.stopAllSounds();
         ControlSounds.setChangeValumeMusic("mMenu",0,0.05);
         super();
         setPlayMus(numLevel);
         ClassPol.setTextureWithMask();
         addEventListener(Event.ADDED_TO_STAGE,this.addOnStage);
         ClassHint.showNextHint();
         isUpdate = true;
         ClassPolygonPesok.create();
      }
      
      public static function setPlayMus(param1:int) : void
      {
         if(param1 != 32)
         {
            if(param1 > 15)
            {
               ControlSounds.setChangeValumeMusic("mGame01",0,0.05);
               ControlSounds.setChangeValumeMusic("mGame03",0,0.05);
               ControlSounds.playMusic("mGame02",ClassSetDataGame.volumeMusGame - 0.2,0,20);
            }
            else
            {
               ControlSounds.setChangeValumeMusic("mGame01",0,0.05);
               ControlSounds.setChangeValumeMusic("mGame02",0,0.05);
               ControlSounds.playMusic("mGame03",ClassSetDataGame.volumeMusGame,0,20);
            }
            ControlSounds.setChangeValumeMusic("mMenu",0,0.05);
         }
         else
         {
            ControlSounds.stopAllSounds();
            ControlSounds.setChangeValumeMusic("mGame01",0,0.05);
            ControlSounds.setChangeValumeMusic("mGame02",0,0.05);
            ControlSounds.setChangeValumeMusic("mGame03",0,0.05);
            ControlSounds.playMusic("mMenu",ClassSetDataGame.volumeMusMenu,0);
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         if(isUpdate == true)
         {
            super.update(param1);
            if(++this.pauseScore > 5)
            {
               this.pauseScore = 0;
               setScoreChanges(-1);
            }
            ClassPolygonPesok.update();
         }
      }
      
      private function addOnStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.addOnStage);
         amigo5.mainStage.addEventListener("WIN",this.win);
         amigo5.mainStage.addEventListener("AMIGO_DIE",this.heroDie);
         amigo5.mainStage.addEventListener(MouseEvent.MOUSE_DOWN,this.md);
         addEventListener(Event.ENTER_FRAME,this.qwe);
      }
      
      private function qwe(param1:Event) : void
      {
         var _loc2_:int = 0;
         removeEventListener(Event.ENTER_FRAME,this.qwe);
         if(ClassShowBadges.countF == 1)
         {
            if(numLevel != 32)
            {
               _loc2_ = 27;
               if(numLevel > 15)
               {
                  _loc2_ = 28;
               }
               ClassPartOfDress.setFrameForAll(ClassShowBadges.arrFrames[_loc2_ - 1]);
            }
         }
      }
      
      private function md(param1:MouseEvent) : void
      {
      }
      
      private function starTaked(param1:Event) : void
      {
      }
      
      private function win(param1:Event) : void
      {
         trace("!!!!!!!!!!  win  !!!!!!!!!!!!!!!!!!");
         isUpdate = false;
         ClassPreloader.requestOnGameAd(this.setWin);
         ClassBaseStar.hideStars();
      }
      
      public function qwewe(param1:Event) : void
      {
         if(++this.timerw > 80)
         {
            removeEventListener(Event.ENTER_FRAME,this.qwewe);
            this.setWin();
         }
      }
      
      private function heroDie(param1:Event) : void
      {
         this.setLose();
      }
      
      private function eventFromUley(param1:Event) : void
      {
      }
      
      override public function setLose() : void
      {
         super.setLose();
      }
      
      override public function setWin() : void
      {
         super.setWin();
      }
      
      override public function setOver() : void
      {
         ControlSounds.stopAllSounds();
         super.setOver();
      }
      
      private function waitDestroyBodies(param1:Event) : void
      {
         if(++this.pauseDestroyBodies > 40)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitDestroyBodies);
            this.bestroyAllBody();
         }
      }
      
      public function bestroyAllBody() : void
      {
         var _loc1_:ClassBaseGameObject = null;
         for each(_loc1_ in ClassBaseLevel.arrGameObjects)
         {
            if(_loc1_ is ClassBaseBody)
            {
               (_loc1_ as ClassBaseBody).destroyBody();
            }
         }
      }
      
      override public function destroy() : void
      {
         ClassBaseStar.resetData();
         ClassPolygonPesok.destroyAll();
         removeEventListener(Event.ENTER_FRAME,this.waitDestroyBodies);
         amigo5.mainStage.removeEventListener(MouseEvent.MOUSE_DOWN,this.md);
         amigo5.mainStage.removeEventListener("AMIGO_DIE",this.heroDie);
         amigo5.mainStage.removeEventListener("WIN",this.win);
         super.destroy();
         isUpdate = true;
      }
   }
}

