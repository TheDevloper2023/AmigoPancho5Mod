package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactImpulse;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import Tela.ClassBaseBody;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassDragMouseRocket extends ClassDragByMouse
   {
      
      private var isTouch:Boolean;
      
      private var isStartR:Boolean;
      
      public function ClassDragMouseRocket(param1:String)
      {
         super(param1);
         isVertical = true;
         setParentSprite(ClassLayers.spriteForRocket);
      }
      
      override public function setPostSolveContact(param1:ClassBaseBody, param2:b2Contact, param3:b2ContactImpulse) : void
      {
         super.setPostSolveContact(param1,param2,param3);
         if(param1.body.GetType() == b2Body.b2_dynamicBody && param1 is ClassBasePerfomer == false)
         {
            this.isTouch = true;
         }
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         if(this.isTouch && this.isStartR == false)
         {
            this.crateR(true);
         }
      }
      
      override public function mUpGlobal(param1:MouseEvent = null) : void
      {
         if(isTouchBegin && isMoveWas == false && this.isStartR == false)
         {
            this.crateR();
         }
         super.mUpGlobal(param1);
      }
      
      public function crateR(param1:Boolean = false) : void
      {
         var _loc2_:ClassRocket = new ClassRocket();
         _loc2_.arrObjNoColide.push(this);
         var _loc3_:Point = localToGlobal(new Point(movie.r.x * movie.scaleX,movie.r.y));
         _loc2_.setPosition(_loc3_.x,_loc3_.y);
         if(isVertical == false)
         {
            _loc2_.rotation = 90;
         }
         _loc2_.movie.scaleX = movie.scaleX;
         _loc2_.init();
         _loc2_.mDown(null);
         ClassBaseLevel.arrNewObjectGame.push(_loc2_);
         movie.removeChild(movie.r);
         this.isStartR = true;
      }
   }
}

