package
{
   import ActionsBeforeGame.ClassIntro;
   import StructureGame.ClassControllStructureGame;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import flash.events.Event;
   
   public class amigo5 extends Sprite
   {
      
      public static var swfMoviesStructur:ApplicationAssetsStructur;
      
      public static var swfMoviesGame:ApplicationAssetsGame;
      
      public static var swfMoviesFon:ApplicationAssetsFon;
      
      public static var swfMoviesInterface:ApplicationAssetsInterface;
      
      public static var swfMoviesKonstructor:ApplicationAssetsKonstructor;
      
      public static var swfMoviesIntro:ApplicationAssetsIntro;
      
      public static var swfMoviesZ:ApplicationAssetsZ;
      
      public static var mainStage:Stage;
      
      public static var qqq:Sprite;
      
      public static var deltaY:Number = 0;
      
      public var fp:FPS;
      
      private var objectControllStructureGame:ClassControllStructureGame;
      
      private var i:int = 0;
      
      private var arrSwfMovies:Array;
      
      private var objectIntro:ClassIntro;
      
      public function amigo5()
      {
         super();
         qqq = this;
         addEventListener(Event.ADDED,this.makeArrMovies);
      }
      
      private function makeArrMovies(param1:Event) : void
      {
         removeEventListener(Event.ADDED,this.makeArrMovies);
         swfMoviesStructur = new ApplicationAssetsStructur();
         swfMoviesGame = new ApplicationAssetsGame();
         swfMoviesFon = new ApplicationAssetsFon();
         swfMoviesInterface = new ApplicationAssetsInterface();
         swfMoviesIntro = new ApplicationAssetsIntro();
         swfMoviesKonstructor = new ApplicationAssetsKonstructor();
         swfMoviesZ = new ApplicationAssetsZ();
         this.arrSwfMovies = [swfMoviesIntro,swfMoviesStructur,swfMoviesGame,swfMoviesFon,swfMoviesInterface,swfMoviesKonstructor,swfMoviesZ];
         this.loadMovies();
      }
      
      private function loadMovies() : void
      {
         this.arrSwfMovies[this.i].init();
         this.arrSwfMovies[this.i].addEventListener(Event.INIT,this.waitLoadMovies);
      }
      
      private function waitLoadMovies(param1:Event) : void
      {
         this.arrSwfMovies[this.i].removeEventListener(Event.INIT,this.waitLoadMovies);
         if(this.i++ < this.arrSwfMovies.length - 1)
         {
            this.loadMovies();
         }
         else
         {
            this.arrSwfMovies = null;
            this.startLoadSounds();
         }
      }
      
      private function startLoadSounds() : void
      {
         ControlSounds.init();
         addEventListener(Event.ENTER_FRAME,this.waitRedyLoadSounds);
      }
      
      private function waitRedyLoadSounds(param1:Event) : void
      {
         if(ControlSounds.isReady)
         {
            removeEventListener(Event.ENTER_FRAME,this.waitRedyLoadSounds);
            this.startIntro();
         }
      }
      
      private function startIntro() : void
      {
         stage.quality = StageQuality.BEST;
         if(ClassFlags.isShowIntro == false)
         {
            this.startGame();
            return;
         }
         this.objectIntro = new ClassIntro(swfMoviesIntro,ClassSetDataGame.isSound,false);
         addChild(this.objectIntro);
         this.objectIntro.init();
         this.objectIntro.addEventListener(this.objectIntro.FINISH,this.init);
      }
      
      private function init(param1:Event) : void
      {
         if(this.objectIntro)
         {
            this.objectIntro.removeEventListener(this.objectIntro.FINISH,this.init);
            removeChild(this.objectIntro);
            this.objectIntro.destroy();
            this.objectIntro = null;
         }
         this.startGame();
      }
      
      private function startGame() : void
      {
         mainStage = this.stage;
         this.fp = new FPS();
         stage.addChild(this.fp);
         ClassInformGame.assignNameGame();
         ClassSetDataGame.loadDataGame();
         ClassSetDataGame.SaveAllAchivenetsInFirstTimeGame();
         ClassKeys.init(stage);
         this.createControllStructureGame();
      }
      
      private function createControllStructureGame() : void
      {
         this.objectControllStructureGame = new ClassControllStructureGame(this);
         stage.quality = StageQuality.BEST;
         this.objectControllStructureGame.init();
      }
      
      private function showPaused(param1:Event) : void
      {
         ClassPaused.show(this);
      }
   }
}

