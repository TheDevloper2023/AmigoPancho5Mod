package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ClassKaktusFire extends ClassKaktus
   {
      
      private var timerFire:int;
      
      public function ClassKaktusFire(param1:String)
      {
         super(param1);
      }
      
      override public function update(param1:Event = null) : void
      {
         super.update(param1);
         ++this.timerFire;
         if(this.timerFire == 4)
         {
            this.fire(movie.rp);
         }
         if(this.timerFire == 8)
         {
            this.fire(movie.lp);
            this.timerFire = 0;
            ControlSounds.playSound("mCactusShot");
         }
      }
      
      private function fire(param1:MovieClip) : void
      {
         var _loc4_:ClassKoluchFire = null;
         var _loc2_:Point = new Point(param1.x * movie.scaleX,param1.y);
         var _loc3_:Point = new Point(_loc2_.x + 5 * movie.scaleX,_loc2_.y);
         _loc3_ = localToGlobal(_loc3_);
         _loc2_ = localToGlobal(_loc2_);
         _loc4_ = new ClassKoluchFire();
         _loc4_.setPosition(_loc2_.x + 10 * movie.scaleX,_loc2_.y,rotation,0.6,0.6);
         parent.addChild(_loc4_);
         _loc4_.init([this]);
         _loc4_.scaleX = movie.scaleX * 0.5;
         _loc4_.scaleY = movie.scaleX * 0.4;
         var _loc5_:Point = ClassMath.getVector(_loc2_,_loc3_);
         var _loc6_:Number = _loc4_.body.GetMass() * 200;
         var _loc7_:b2Vec2 = new b2Vec2(_loc5_.x / scalePhysic * _loc6_,_loc5_.y / scalePhysic * _loc6_);
         _loc4_.body.ApplyImpulse(_loc7_,_loc4_.body.GetWorldCenter());
         param1.gotoAndPlay(2);
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

