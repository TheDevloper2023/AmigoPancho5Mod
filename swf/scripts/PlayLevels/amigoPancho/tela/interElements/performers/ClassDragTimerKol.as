package PlayLevels.amigoPancho.tela.interElements.performers
{
   import Box2D.Common.Math.b2Vec2;
   import flash.events.Event;
   
   public class ClassDragTimerKol extends ClassDragMouseKol
   {
      
      public static var arrDrag:Array = [];
      
      private var isStart:Boolean;
      
      private var timer:int;
      
      private var rot:Number;
      
      public function ClassDragTimerKol(param1:String)
      {
         super(param1);
         arrDrag.push(this);
         setMouseReactOff();
      }
      
      override public function setOn(param1:Number) : void
      {
         this.isStart = true;
         body.SetLinearDamping(0);
         this.rot = rotation;
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:b2Vec2 = null;
         super.update(param1);
         if(this.isStart)
         {
            _loc2_ = new b2Vec2(-4,0);
            if(movie.scaleX > 0)
            {
               _loc2_ = new b2Vec2(4,0);
            }
            if(this.rot > 10)
            {
               _loc2_ = new b2Vec2(0,4);
            }
            body.ApplyImpulse(_loc2_,body.GetWorldCenter());
            if(++this.timer > 20 && speedBody < 0.01)
            {
               this.isStart = false;
               body.SetLinearDamping(100);
            }
         }
      }
      
      override public function destroy() : void
      {
         removeThisFromArray(arrDrag);
         super.destroy();
      }
   }
}

