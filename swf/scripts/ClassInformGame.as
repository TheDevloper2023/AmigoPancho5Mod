package
{
   public class ClassInformGame
   {
      
      public static var pauseBeforShot:Number;
      
      public static var countCoreOnLevel:Number;
      
      public static var arrBadges:Array;
      
      public static var bombRadius:Number;
      
      public static var pogreshnostVGabaritah:Number;
      
      public static var idGame:Number;
      
      public static var classCore_1:Class;
      
      public static var classCore_2:Class;
      
      public static var classShot:Class;
      
      public static var gameClassCore:Class;
      
      public static var classMovieBlastBomb:Class;
      
      public static var idMochiGame:String;
      
      public static var idMochiBoard:String;
      
      public static const RAGDOLL:String = "Rag_";
      
      public static const probation:String = "amigo5";
      
      public static var nameGame:String = probation;
      
      public static var isShowLink_iPhone:Boolean = false;
      
      public static const EVENT_GAMEOVER:String = "EVENT_GAMEOVER";
      
      public static const EVENT_CHANGESCORES:String = "EVENT_CHANGESCORES";
      
      public static const EVENT_LEFT_BEETLES:String = "EVENT_LEFT_BEETLES";
      
      public static const EVENT_LEVEL_COMPLETED:String = "EVENT_LEVEL_COMPLETED";
      
      public static const EVENT_COUNT_JOINT_OBJECTS:String = "EVENT_COUNT_JOINT_OBJECTS";
      
      public static const EVENT_KILLED_RAGDOLL:String = "EVENT_KILLED_RAGDOLL";
      
      public static const EVENT_LEVEL_LOSE:String = "EVENT_LEVEL_LOSE";
      
      public static const EVENT_TOTALSCORES:String = "EVENT_TOTALSCORES";
      
      public static const EVENT_KILLED_GOOD_HERO:String = "EVENT_KILLED_GOOD_HERO";
      
      public static const EVENT_MAKESHOT:String = "EVENT_MAKESHOT";
      
      public function ClassInformGame()
      {
         super();
      }
      
      public static function assignNameGame() : void
      {
         setFirstBadges();
      }
      
      public static function setFirstBadges() : void
      {
      }
   }
}

