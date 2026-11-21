package PlayLevels.BaseLevels
{
   import Tela.ClassBox;
   import Tela.ClassCircle;
   import Tela.ClassJoint;
   import Tela.ClassPeremychka;
   import Tela.ClassPicture;
   import Tela.ClassPol;
   import Tela.ClassRevolute;
   import Tela.ClassTriangle;
   import Tela.Hints.ClassHint;
   
   public class ClassGameObjectsName
   {
      
      public function ClassGameObjectsName()
      {
         super();
      }
      
      public static function getNameClass(param1:String) : Class
      {
         var _loc2_:Class = null;
         if(param1.indexOf("t_treugol") > -1)
         {
            _loc2_ = ClassTriangle;
         }
         if(param1.indexOf("t_shap") > -1)
         {
            _loc2_ = ClassCircle;
         }
         if(param1.indexOf("t_pol") > -1)
         {
            _loc2_ = ClassPol;
         }
         if(param1 == "t_rect")
         {
            _loc2_ = ClassBox;
         }
         if(param1 == "t_box")
         {
            _loc2_ = ClassBox;
         }
         if(param1 == "t_circ")
         {
            _loc2_ = ClassCircle;
         }
         if(param1 == "t_treug")
         {
            _loc2_ = ClassTriangle;
         }
         if(param1.indexOf("t_joint") > -1)
         {
            _loc2_ = ClassJoint;
         }
         if(param1.indexOf("t_peremychka") > -1)
         {
            _loc2_ = ClassPeremychka;
         }
         if(param1.indexOf("t_revolute") > -1)
         {
            _loc2_ = ClassRevolute;
         }
         if(param1.indexOf("pic_per") > -1)
         {
            _loc2_ = ClassPerednik;
         }
         if(param1.indexOf("pic_underper") > -1)
         {
            _loc2_ = ClassUnderPerednik;
         }
         if(param1.indexOf("picture") > -1)
         {
            _loc2_ = ClassPicture;
         }
         if(param1.indexOf("pic_hint") > -1)
         {
            _loc2_ = ClassHint;
         }
         return _loc2_;
      }
   }
}

