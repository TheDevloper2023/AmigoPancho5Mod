package PlayLevels.amigoPancho
{
   import PlayLevels.amigoPancho.bees.ClassAmigoSwarm;
   import PlayLevels.amigoPancho.tela.ClassContPol;
   import PlayLevels.amigoPancho.tela.ClassDerevThings;
   import PlayLevels.amigoPancho.tela.ClassDoska;
   import PlayLevels.amigoPancho.tela.ClassKoleso;
   import PlayLevels.amigoPancho.tela.ClassKrysha;
   import PlayLevels.amigoPancho.tela.ClassMetal;
   import PlayLevels.amigoPancho.tela.ClassSteklThings;
   import PlayLevels.amigoPancho.tela.ClassSteklo;
   import PlayLevels.amigoPancho.tela.ClassStena;
   import PlayLevels.amigoPancho.tela.ClassZemlya;
   import PlayLevels.amigoPancho.tela.ClassZveno;
   import PlayLevels.amigoPancho.tela.amigo.ClassAmigo;
   import PlayLevels.amigoPancho.tela.amigo.ClassBalloonAmigo;
   import PlayLevels.amigoPancho.tela.amigo.ClassHandAmigo;
   import PlayLevels.amigoPancho.tela.amigo.ClassHat;
   import PlayLevels.amigoPancho.tela.amigo.ClassHeadAmigo;
   import PlayLevels.amigoPancho.tela.amigo.ClassJointZ;
   import PlayLevels.amigoPancho.tela.amigo.ClassPartAmigo;
   import PlayLevels.amigoPancho.tela.bad.ClassBad;
   import PlayLevels.amigoPancho.tela.bad.ClassHeadBad;
   import PlayLevels.amigoPancho.tela.bad.ClassPartBad;
   import PlayLevels.amigoPancho.tela.bad.ClassSabla;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassBlockPerfomer;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassBoxDestroy;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassContacterPerforms;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragByMouse;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragBySwitch;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragMouseKakt;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragMouseKol;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragMouseRocket;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragMouseRocketHoriz;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassDragTimerKol;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassFan;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassRocket;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassRotateBySwitch;
   import PlayLevels.amigoPancho.tela.interElements.performers.ClassRotateBySwitchFire;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassButtonStart;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassDragByDynSwitch;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassSwitchButon;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassSwitchLine;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassSwitchRotate;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassTimerSwitch;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBadMouse;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBalloonBad;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBalloonBad2;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBalloonBad3;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseBalloon;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseStar;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBgRocket;
   import PlayLevels.amigoPancho.tela.levelElements.ClassCannon;
   import PlayLevels.amigoPancho.tela.levelElements.ClassCar;
   import PlayLevels.amigoPancho.tela.levelElements.ClassCloud;
   import PlayLevels.amigoPancho.tela.levelElements.ClassFire;
   import PlayLevels.amigoPancho.tela.levelElements.ClassFireV;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKaktGround;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKaktus;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKaktusFire;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKletka;
   import PlayLevels.amigoPancho.tela.levelElements.ClassKol;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLimitBalloon;
   import PlayLevels.amigoPancho.tela.levelElements.ClassMegaFan;
   import PlayLevels.amigoPancho.tela.levelElements.ClassMetalShip;
   import PlayLevels.amigoPancho.tela.levelElements.ClassMill;
   import PlayLevels.amigoPancho.tela.levelElements.ClassMillRotate;
   import PlayLevels.amigoPancho.tela.levelElements.ClassNails;
   import PlayLevels.amigoPancho.tela.levelElements.ClassPackage;
   import PlayLevels.amigoPancho.tela.levelElements.ClassStatColide;
   import PlayLevels.amigoPancho.tela.levelElements.ClassStone;
   import PlayLevels.amigoPancho.tela.levelElements.ClassVerKakt;
   import PlayLevels.amigoPancho.tela.levelElements.ClassVerevka;
   import PlayLevels.amigoPancho.tela.levelElements.ClassWheelKoluch;
   import PlayLevels.amigoPancho.tela.levelElements.ClassYLimit;
   import PlayLevels.amigoPancho.tela.levelElements.ClassYMax;
   import PlayLevels.amigoPancho.tela.levelElements.codeSwitch.ClassBlockRCode;
   import PlayLevels.amigoPancho.tela.levelElements.codeSwitch.ClassStandCode;
   import PlayLevels.amigoPancho.tela.levelElements.codeSwitch.ClassSwitchCode;
   import Tela.ClassMultiShape;
   
   public class ClassOwnObjectsByName
   {
      
      public function ClassOwnObjectsByName()
      {
         super();
      }
      
      public static function getNameClass(param1:String) : Class
      {
         var _loc2_:Class = null;
         var _loc6_:String = null;
         if(param1.indexOf("t_box_1") > -1)
         {
            _loc2_ = ClassDoska;
         }
         if(param1.indexOf("t_seif") > -1)
         {
            _loc2_ = ClassMetal;
         }
         if(param1.indexOf("t_stena") > -1)
         {
            _loc2_ = ClassStena;
         }
         if(param1.indexOf("t_treugD") > -1)
         {
            _loc2_ = ClassKrysha;
         }
         if(param1.indexOf("zveno") > -1)
         {
            _loc2_ = ClassZveno;
         }
         if(param1.indexOf("dor") > -1)
         {
            _loc2_ = ClassDor;
         }
         if(param1.indexOf("t_ppp") > -1)
         {
            _loc2_ = ClassMultiShape;
         }
         if(param1.indexOf("t_zemlya1") > -1)
         {
            _loc2_ = ClassZemlya;
         }
         if(param1.indexOf("t_koleso") > -1)
         {
            _loc2_ = ClassKoleso;
         }
         if(param1.indexOf("contPol") > -1)
         {
            _loc2_ = ClassContPol;
         }
         if(param1.indexOf("steklo") > -1)
         {
            _loc2_ = ClassSteklo;
         }
         if(param1.indexOf("metal") > -1)
         {
            _loc2_ = ClassMetal;
         }
         if(param1.indexOf("doska") > -1)
         {
            _loc2_ = ClassDoska;
         }
         var _loc3_:Array = ["t_steklo","t_stekloC","t_telek","t_anten","t_vann","t_kond","t_stir","t_unit","t_holod","t_lamp"];
         var _loc4_:Array = ["t_doska","t_doskaC","t_zerkalo","t_stul","t_taburet","t_tumb","t_tumb2","t_shkaf"];
         var _loc5_:Array = ["t_metal2","t_metalC"];
         for each(_loc6_ in _loc3_)
         {
            if(param1 == _loc6_)
            {
               _loc2_ = ClassSteklThings;
            }
         }
         for each(_loc6_ in _loc4_)
         {
            if(param1 == _loc6_)
            {
               _loc2_ = ClassDerevThings;
            }
         }
         for each(_loc6_ in _loc5_)
         {
            if(param1 == _loc6_)
            {
               _loc2_ = ClassMetal;
            }
         }
         if(param1.indexOf("decor") > -1)
         {
            _loc2_ = ClassDecor;
         }
         if(param1.indexOf("picStat") > -1)
         {
            _loc2_ = ClassStatPic;
         }
         if(param1 == "hero")
         {
            _loc2_ = ClassAmigo;
         }
         if(param1 == "footR")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1 == "bBalloon01")
         {
            _loc2_ = ClassBalloonAmigo;
         }
         if(param1 == "verevka")
         {
            _loc2_ = ClassVerevka;
         }
         if(param1.indexOf("sMarkerJoint") > -1)
         {
            _loc2_ = ClassJointZ;
         }
         if(param1 == "handR")
         {
            _loc2_ = ClassHandAmigo;
         }
         if(param1 == "handL")
         {
            _loc2_ = ClassHandAmigo;
         }
         if(param1 == "shoulderL")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1 == "shoulderR")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1 == "hat")
         {
            _loc2_ = ClassHat;
         }
         if(param1 == "head")
         {
            _loc2_ = ClassHeadAmigo;
         }
         if(param1 == "bodyUp")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1 == "bodyDown")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1 == "legL")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1 == "legR")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1 == "footL")
         {
            _loc2_ = ClassPartAmigo;
         }
         if(param1.indexOf("bBad02_") > -1)
         {
            _loc2_ = ClassPartBad;
         }
         if(param1 == "bBad02_05")
         {
            _loc2_ = ClassSabla;
         }
         if(param1.indexOf("bBad01_") > -1)
         {
            _loc2_ = ClassPartBad;
         }
         if(param1 == "bBad01_05")
         {
            _loc2_ = ClassSabla;
         }
         if(param1.indexOf("gBad06") > -1)
         {
            _loc2_ = ClassBad;
         }
         if(param1 == "bCactus01")
         {
            _loc2_ = ClassKaktus;
         }
         if(param1 == "upLimit")
         {
            _loc2_ = ClassUpLimit;
         }
         if(param1 == "bDrag01")
         {
            _loc2_ = ClassDragByMouse;
         }
         if(param1 == "bDrag10")
         {
            _loc2_ = ClassDragByMouse;
         }
         if(param1 == "bDragb10")
         {
            _loc2_ = ClassDragByMouse;
         }
         if(param1 == "bDragb9")
         {
            _loc2_ = ClassDragByMouse;
         }
         if(param1 == "butnPress")
         {
            _loc2_ = ClassButtonStart;
         }
         if(param1 == "bCage01")
         {
            _loc2_ = ClassKletka;
         }
         if(param1 == "metalPalka")
         {
            _loc2_ = ClassKletka;
         }
         if(param1 == "bDrag07")
         {
            _loc2_ = ClassDragMouseKakt;
         }
         if(param1 == "gRocket04")
         {
            _loc2_ = ClassDragMouseRocket;
         }
         if(param1 == "gRocket05")
         {
            _loc2_ = ClassDragMouseRocketHoriz;
         }
         if(param1 == "bDrag08")
         {
            _loc2_ = ClassDragMouseKol;
         }
         if(param1 == "bDrag09")
         {
            _loc2_ = ClassDragTimerKol;
         }
         if(param1 == "dragLimit")
         {
            _loc2_ = ClassStatObjects;
         }
         if(param1 == "dragLimit2")
         {
            _loc2_ = ClassStatObjects;
         }
         if(param1 == "timerFall")
         {
            _loc2_ = ClassTimerSwitch;
         }
         if(param1 == "bSwitch01")
         {
            _loc2_ = ClassSwitchLine;
         }
         if(param1 == "gFan01")
         {
            _loc2_ = ClassFan;
         }
         if(param1 == "bBalloon")
         {
            _loc2_ = ClassBaseBalloon;
         }
         if(param1 == "rev")
         {
            _loc2_ = ClassSwitchRotate;
         }
         if(param1 == "rev2")
         {
            _loc2_ = ClassSwitchRotate;
         }
         if(param1 == "bBar01")
         {
            _loc2_ = ClassDragBySwitch;
         }
         if(param1 == "bBar03")
         {
            _loc2_ = ClassDragBySwitch;
         }
         if(param1 == "gBar12")
         {
            _loc2_ = ClassDragBySwitch;
         }
         if(param1 == "bBar02")
         {
            _loc2_ = ClassRotateBySwitch;
         }
         if(param1 == "bBar02_2")
         {
            _loc2_ = ClassRotateBySwitch;
         }
         if(param1.indexOf("CactusA") > -1)
         {
            _loc2_ = ClassKaktusFire;
         }
         if(param1 == "bRocket01")
         {
            _loc2_ = ClassRocket;
         }
         if(param1 == "bRocketBg01")
         {
            _loc2_ = ClassBgRocket;
         }
         if(param1 == "gykffkhj")
         {
            _loc2_ = ClassStatObjects;
         }
         if(param1 == "telega")
         {
            _loc2_ = ClassCar;
         }
         if(param1 == "bCar02")
         {
            _loc2_ = ClassCar;
         }
         if(param1 == "koleso")
         {
            _loc2_ = ClassCar;
         }
         if(param1 == "gSharp02")
         {
            _loc2_ = ClassKaktus;
         }
         if(param1 == "bFire01")
         {
            _loc2_ = ClassFire;
         }
         if(param1 == "bFire01V")
         {
            _loc2_ = ClassFireV;
         }
         if(param1 == "bBalloonBad")
         {
            _loc2_ = ClassBalloonBad;
         }
         if(param1 == "t_pesok")
         {
            _loc2_ = ClassPolygonPesok;
         }
         if(param1.indexOf("bBox") > -1)
         {
            _loc2_ = ClassBoxDestroy;
         }
         if(param1.indexOf("sPipe0") > -1)
         {
            _loc2_ = ClassStatObjects;
         }
         if(param1.indexOf("statObj_") > -1)
         {
            _loc2_ = ClassStatObjects;
         }
         if(param1 == "bBat02")
         {
            _loc2_ = ClassBadMouse;
         }
         if(param1 == "bBat01")
         {
            _loc2_ = ClassBadMouse;
         }
         if(param1 == "bRocketFg04")
         {
            _loc2_ = ClassBlockPerfomer;
         }
         if(param1.indexOf("contactRocket") > -1)
         {
            _loc2_ = ClassContacterPerforms;
         }
         if(param1 == "butRock")
         {
            _loc2_ = ClassSwitchButon;
         }
         if(param1.indexOf("bBar06_01") > -1)
         {
            _loc2_ = ClassDragByDynSwitch;
         }
         if(param1.indexOf("bSpikes01_") > -1)
         {
            _loc2_ = ClassKol;
         }
         if(param1 == "bWheel01")
         {
            _loc2_ = ClassWheelKoluch;
         }
         if(param1 == "bFanMega02")
         {
            _loc2_ = ClassMegaFan;
         }
         if(param1 == "statCollide")
         {
            _loc2_ = ClassStatColide;
         }
         if(param1.indexOf("bStone") > -1)
         {
            _loc2_ = ClassStone;
         }
         if(param1.indexOf("bPackage") > -1)
         {
            _loc2_ = ClassPackage;
         }
         if(param1 == "bBalloonBad2")
         {
            _loc2_ = ClassBalloonBad2;
         }
         if(param1 == "bBalloonBad3")
         {
            _loc2_ = ClassBalloonBad3;
         }
         if(param1 == "t_doska4")
         {
            _loc2_ = ClassLimitBalloon;
         }
         if(param1 == "bFireA01")
         {
            _loc2_ = ClassRotateBySwitchFire;
         }
         if(param1 == "bCactus")
         {
            _loc2_ = ClassKaktus;
         }
         if(param1 == "swarm")
         {
            _loc2_ = ClassAmigoSwarm;
         }
         if(param1 == "bAcidCloud01")
         {
            _loc2_ = ClassCloud;
         }
         if(param1.indexOf("metalShip") > -1)
         {
            _loc2_ = ClassMetalShip;
         }
         if(param1.indexOf("bCactusGround") > -1)
         {
            _loc2_ = ClassKaktGround;
         }
         if(param1.indexOf("bSpikes") > -1)
         {
            _loc2_ = ClassKaktus;
         }
         if(param1.indexOf("bNails") > -1)
         {
            _loc2_ = ClassNails;
         }
         if(param1.indexOf("bCactus31") > -1)
         {
            _loc2_ = ClassKaktus;
         }
         if(param1 == "bSpinButton01")
         {
            _loc2_ = ClassSwitchCode;
         }
         if(param1 == "blockButRocket")
         {
            _loc2_ = ClassBlockRCode;
         }
         if(param1 == "sRocketFg05")
         {
            _loc2_ = ClassStandCode;
         }
         if(param1 == "bBad01_01")
         {
            _loc2_ = ClassHeadBad;
         }
         if(param1 == "bBad02_01")
         {
            _loc2_ = ClassHeadBad;
         }
         if(param1 == "yLimit")
         {
            _loc2_ = ClassYLimit;
         }
         if(param1 == "yMax")
         {
            _loc2_ = ClassYMax;
         }
         if(param1 == "xdfths")
         {
            _loc2_ = ClassVerKakt;
         }
         if(param1 == "sInfo18")
         {
            _loc2_ = ClassWelcomTable;
         }
         if(param1 == "tableLinks")
         {
            _loc2_ = ClassTableLinks;
         }
         if(param1 == "mill")
         {
            _loc2_ = ClassMill;
         }
         if(param1 == "mill2")
         {
            _loc2_ = ClassMill;
         }
         if(param1 == "millrot")
         {
            _loc2_ = ClassMillRotate;
         }
         if(param1 == "cannon")
         {
            _loc2_ = ClassCannon;
         }
         if(param1 == "cannon2")
         {
            _loc2_ = ClassCannon;
         }
         if(param1 == "holePes")
         {
            _loc2_ = ClassHoleInPesok;
         }
         if(param1 == "areaNextHint")
         {
            _loc2_ = ClassAreaNextHint;
         }
         if(param1 == "star")
         {
            _loc2_ = ClassBaseStar;
         }
         if(_loc2_ == null)
         {
            _loc2_ = ClassLevelObject;
         }
         return _loc2_;
      }
   }
}

