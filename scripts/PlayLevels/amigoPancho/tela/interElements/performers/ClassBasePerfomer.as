package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Dynamics.b2Body;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.tela.interElements.ClassReactOnMouse;
   import PlayLevels.amigoPancho.tela.interElements.switchs.ClassBaseSwitch;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassBasePerfomer extends ClassReactOnMouse
   {
      
      public static var ON_LIMIT_1:String = "ON_LIMIT_1";
      
      public static var ON_LIMIT_2:String = "ON_LIMIT_2";
      
      public static var ON_LIMIT:String = "ON_LIMIT";
      
      public static var arrObjectsPerform:Array = [];
      
      public var limit1:Point = new Point();
      
      public var limit2:Point = new Point();
      
      public var switchPos:Point;
      
      public var isVertical:Boolean;
      
      public var objectSwitch:ClassBaseSwitch;
      
      public var isAction:Boolean;
      
      public var isOnLimit:Boolean;
      
      public var arrObjNoColide:Array = [];
      
      public function ClassBasePerfomer(param1:String)
      {
         super(param1);
         setParentSprite(ClassLayers.spriteForPerformers);
         arrObjectsPerform.push(this);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         if(movie.switchPos)
         {
            this.switchPos = new Point(movie.switchPos.x,movie.switchPos.y);
            this.switchPos = localToGlobal(this.switchPos);
            movie.switchPos.visible = false;
         }
         if(Math.abs(rotation) == 90)
         {
            this.isVertical = true;
         }
         addEventListener(Event.ENTER_FRAME,this.findStaticHit);
      }
      
      public function findStaticHit(param1:Event) : void
      {
         var _loc3_:ClassBaseBody = null;
         removeEventListener(Event.ENTER_FRAME,this.findStaticHit);
         var _loc2_:int = 0;
         while(_loc2_ < ClassBaseBody.arrObject.length)
         {
            _loc3_ = ClassBaseBody.arrObject[_loc2_] as ClassBaseBody;
            if(Boolean(_loc3_ && _loc3_.isBodyCreated) && Boolean(_loc3_.body.GetType() == b2Body.b2_staticBody) && _loc3_.hitTestObject(this))
            {
               this.arrObjNoColide.push(_loc3_);
            }
            _loc2_++;
         }
      }
      
      override public function shouldCollide(param1:ClassBaseBody) : Boolean
      {
         if(this.getIsHit(param1))
         {
            return false;
         }
         return super.shouldCollide(param1);
      }
      
      private function getIsHit(param1:ClassBaseBody) : Boolean
      {
         var _loc2_:ClassBaseBody = null;
         for each(_loc2_ in this.arrObjNoColide)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function setOn(param1:Number) : void
      {
         this.isAction = true;
      }
      
      public function setOff() : void
      {
         this.isAction = false;
      }
      
      public function setObjectSwitch(param1:ClassBaseSwitch) : void
      {
         this.objectSwitch = param1;
      }
      
      override public function setOptions(param1:XML) : void
      {
         super.setOptions(param1);
         var _loc2_:String = param1.attribute("l_damp");
         var _loc3_:String = param1.attribute("a_damp");
         this.limit1.x = Number(param1.attribute("l_damp"));
         this.limit1.y = Number(param1.attribute("a_damp"));
      }
      
      public function dispatchLimit_1() : void
      {
         dispatchEvent(new Event(ON_LIMIT_1));
      }
      
      public function dispatchLimit_2() : void
      {
         dispatchEvent(new Event(ON_LIMIT_2));
      }
      
      override public function destroy() : void
      {
         this.arrObjNoColide = [];
         this.arrObjNoColide = null;
         removeEventListener(Event.ENTER_FRAME,this.findStaticHit);
         this.objectSwitch = null;
         removeThisFromArray(arrObjectsPerform);
         super.destroy();
      }
   }
}

