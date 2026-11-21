package PlayLevels.amigoPancho
{
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import Tela.ClassBaseGameObject;
   import Tela.ClassCircle;
   import Tela.ClassPol;
   import flash.display.MovieClip;
   
   public class ClassStatPic extends ClassBaseGameObject
   {
      
      private static var arrStatPic:Array = [];
      
      public function ClassStatPic(param1:String)
      {
         super(param1);
         if(param1 == "picStat14")
         {
            setParentSprite(ClassLayers.spriteForSuperStat);
         }
         else
         {
            setParentSprite(ClassLayers.spriteForStatPic);
         }
         arrStatPic.push(this);
         if(movie.getChildAt(0) is MovieClip)
         {
            (movie.getChildAt(0) as MovieClip).stop();
         }
      }
      
      public static function setUnvisiblePol() : void
      {
         var _loc1_:ClassBaseGameObject = null;
         var _loc2_:ClassStatPic = null;
         for each(_loc1_ in ClassBaseLevel.arrGameObjects)
         {
            if(_loc1_ is ClassPol || _loc1_ is ClassCircle)
            {
               for each(_loc2_ in arrStatPic)
               {
                  if(_loc2_.hitTestObject(_loc1_))
                  {
                     if(_loc2_.nameMovie != "picStat33" && _loc2_.nameMovie != "picStat32" && _loc2_.nameMovie != "picStat30" && _loc2_.nameMovie != "picStat31" && _loc2_.nameMovie != "picStat13" && _loc2_.nameMovie != "picStat12" && _loc2_.nameMovie != "picStat21")
                     {
                        _loc1_.visible = false;
                     }
                  }
               }
            }
         }
      }
      
      override public function destroy() : void
      {
         ClassMath.removeObjectFromArray(arrStatPic,this);
         super.destroy();
      }
   }
}

