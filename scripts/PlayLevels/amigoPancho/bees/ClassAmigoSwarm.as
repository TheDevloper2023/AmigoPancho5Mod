package PlayLevels.amigoPancho.bees
{
   import PlayLevels.amigoPancho.tela.amigo.ClassHeadAmigo;
   import PlayLevels.amigoPancho.tela.levelElements.ClassBaseBalloon;
   import PlayLevels.amigoPancho.tela.levelElements.ClassLevelObject;
   import Tela.ClassBaseGameObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassAmigoSwarm extends ClassBaseGameObject
   {
      
      private var arrAims:Array = [];
      
      private var countBee:int = 999;
      
      public function ClassAmigoSwarm(param1:String)
      {
         super(param1);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         addEventListener(Event.ENTER_FRAME,this.findAim);
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:Number = Number(param1.attribute("l_damp"));
         if(_loc2_ != -0.1)
         {
            this.countBee = _loc2_;
         }
      }
      
      public function findAim(param1:Event) : void
      {
         var _loc2_:ClassLevelObject = null;
         removeEventListener(Event.ENTER_FRAME,this.findAim);
         for each(_loc2_ in ClassBaseBalloon.arrBaseBalloon)
         {
            if(_loc2_ is ClassBaseBalloon)
            {
               this.arrAims.push(_loc2_);
            }
         }
         for each(_loc2_ in ClassLevelObject.arrLevelObjects)
         {
            if(_loc2_ is ClassHeadAmigo)
            {
               this.arrAims.push(_loc2_);
            }
         }
         this.createBees();
      }
      
      public function createBees() : void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:Point = null;
         var _loc4_:ClassBee = null;
         if(this.arrAims.length > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < movie.numChildren)
            {
               _loc2_ = movie.getChildAt(_loc1_) as MovieClip;
               if(Boolean(_loc2_) && _loc2_.toString().indexOf("pic_mark") > -1)
               {
                  _loc3_ = localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  _loc4_ = new ClassBee();
                  _loc4_.setPosition(_loc3_.x,_loc3_.y);
                  _loc4_.init([null,this.arrAims]);
               }
               if(_loc1_ == this.countBee)
               {
                  break;
               }
               _loc1_++;
            }
         }
         removeChild(movie);
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findAim);
         super.destroy();
      }
   }
}

