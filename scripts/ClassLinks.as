package
{
   import ActionsBeforeGame.ClassPreloader;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class ClassLinks
   {
      
      public function ClassLinks()
      {
         super();
      }
      
      public static function goToLinkQabo() : void
      {
         goToLink("http://www.qaibo.com");
      }
      
      public static function goToLinkMore() : void
      {
         goToLink(ClassPreloader.getMoreGamesLink());
      }
      
      public static function goToLinkAddSite() : void
      {
         goToLink(ClassPreloader.getAddToSiteLink());
      }
      
      public static function goToLinkSolution() : void
      {
         var _loc1_:String = ClassPreloader.getGameLink("walkthrough");
         goToLink(_loc1_);
      }
      
      public static function goToLinkLike() : void
      {
         var _loc1_:String = ClassPreloader.getTrackedLink();
         goToLink(_loc1_);
      }
      
      public static function goToLinkHighscores() : void
      {
      }
      
      public static function goToGameLink(param1:String) : void
      {
         var _loc2_:String = ClassPreloader.getGameLink(param1);
         goToLink(_loc2_);
      }
      
      public static function goToLink(param1:String) : void
      {
         var _loc2_:URLRequest = new URLRequest(param1);
         navigateToURL(_loc2_,"_blank");
      }
   }
}

