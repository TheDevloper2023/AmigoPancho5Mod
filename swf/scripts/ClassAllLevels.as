package
{
   public class ClassAllLevels
   {
      
      public function ClassAllLevels()
      {
         super();
      }
      
      public static function getStrCodeLevel(param1:Number) : XML
      {
         return (ClassAllLevelsRoly.levelsRoly() as Array)[param1 - 1];
      }
   }
}

