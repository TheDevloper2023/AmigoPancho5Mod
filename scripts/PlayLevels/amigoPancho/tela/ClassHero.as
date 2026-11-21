package PlayLevels.amigoPancho.tela
{
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.ClassOwnObjectsByName;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseBalloon;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBlast;
   import Tela.ClassBaseBody;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassHero extends ClassBaseGameObject
   {
      
      public var arrPart:Array = [];
      
      public var countContactBee:int;
      
      public function ClassHero(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForKaktus);
      }
      
      override public function getCopyMovie(param1:String) : MovieClip
      {
         return ClassMath.getCopyMovie(amigo5.swfMoviesZ,param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc5_:ClassBaseGameObject = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         super.init(param1);
         scaleX = 1;
         scaleY = 1;
         while(movie.numChildren)
         {
            _loc2_ = movie.getChildAt(0) as Sprite;
            _loc3_ = _loc2_.toString().substr(8,100);
            _loc3_ = _loc3_.substr(0,_loc3_.length - 1);
            _loc4_ = ClassOwnObjectsByName.getNameClass(_loc3_);
            if(_loc4_)
            {
               _loc5_ = new _loc4_(_loc3_);
               _loc6_ = new Point(_loc2_.x,_loc2_.y);
               _loc7_ = localToGlobal(_loc6_);
               _loc5_.x = _loc7_.x;
               _loc5_.y = _loc7_.y;
               _loc5_.rotation = _loc2_.rotation;
               parent.addChild(_loc5_);
               _loc5_.init([_loc2_.name]);
               _loc5_.sendObjectForEvent(this);
               _loc5_.sendGameObjects(ClassBaseLevel.arrGameObjects);
               ClassBaseLevel.arrGameObjects.push(_loc5_);
               this.arrPart.push(_loc5_);
            }
            _loc2_.parent.removeChild(_loc2_);
         }
      }
      
      override public function receiveEvent(param1:ClassBaseGameObject, param2:String) : void
      {
         if(param2 == "PART_DIE")
         {
            this.allPartsDie();
         }
         if(param2 == "HIT_ROCKET")
         {
            this.allPartsAlphaLow();
            this.showBlast();
         }
         if(param2 == "HIT_FIRE")
         {
            this.heroInFire();
         }
         if(param2 == "HIT_KAPLYA")
         {
            this.heroInKaplya();
         }
         if(param2 == "BALLOON_BREAK")
         {
            this.balloonBreak(param1 as ClassBaseBalloon);
         }
         if(param2 == "HIT_BEE")
         {
            this.setContactBee();
         }
      }
      
      public function setContactBee() : void
      {
         ++this.countContactBee;
      }
      
      public function balloonBreak(param1:ClassBaseBalloon) : void
      {
      }
      
      public function heroInFire() : void
      {
      }
      
      public function heroInKaplya() : void
      {
      }
      
      public function showBlast() : void
      {
         this.createBlast(new Point(x,y));
      }
      
      public function createBlast(param1:Point, param2:String = "sBlowUp01") : *
      {
         var _loc3_:ClassBlast = new ClassBlast(param2);
         _loc3_.setPosition(param1.x,param1.y,0,1.8,1.8);
         ClassLayers.spriteForBoom.addChild(_loc3_);
         _loc3_.init();
         ClassBaseLevel.arrNewObjectGame.push(_loc3_);
      }
      
      public function allPartsAlphaLow() : void
      {
         var _loc1_:ClassBaseBody = null;
         for each(_loc1_ in this.arrPart)
         {
            _loc1_.destroyBody();
            _loc1_.setLowAlpha(true,0.1);
         }
      }
      
      public function allPartsDie() : void
      {
         var _loc1_:ClassBaseBody = null;
         for each(_loc1_ in this.arrPart)
         {
            _loc1_.isLive = false;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
      }
      
      override public function destroy() : void
      {
         this.arrPart = [];
         this.arrPart = null;
         super.destroy();
      }
   }
}

