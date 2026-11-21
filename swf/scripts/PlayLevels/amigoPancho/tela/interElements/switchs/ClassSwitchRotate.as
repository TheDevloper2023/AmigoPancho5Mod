package PlayLevels.amigoPancho.tela.interElements.switchs
{
   import PlayLevels.amigoPancho.ClassStatObjects;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ClassSwitchRotate extends ClassBaseSwitch
   {
      
      private var pointMouse:Point;
      
      private var rr:Number = 0;
      
      private var rych:MovieClip;
      
      public var cours:Number;
      
      private var oldA:Number = 0;
      
      private var oldCours:Number = 0;
      
      private var tempRR:Number;
      
      private var isStartLimit:Boolean;
      
      public function ClassSwitchRotate(param1:String)
      {
         super(param1);
         this.rych = movie.r;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         addEventListener(Event.ENTER_FRAME,this.findPic);
      }
      
      public function findPic(param1:Event) : void
      {
         var _loc2_:ClassStatObjects = null;
         removeEventListener(Event.ENTER_FRAME,this.findPic);
         for each(_loc2_ in ClassStatObjects.arrStatObj)
         {
            if(_loc2_.hitTestObject(this))
            {
               movie.b.visible = false;
               destroyBody();
               return;
            }
         }
         createDynamic();
      }
      
      override public function getSpriteForLight() : Sprite
      {
         return this.rych;
      }
      
      override public function mDown(param1:MouseEvent) : void
      {
         super.mDown(param1);
         this.rr = this.calcRot() - this.rych.rotation;
         this.oldA = this.calcRot() - this.rr;
         this.oldCours = 0;
         this.isStartLimit = false;
      }
      
      override public function mDownGlobal(param1:MouseEvent) : void
      {
         super.mDownGlobal(param1);
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         super.update(param1);
         if(isTouchBegin)
         {
            if(objectPerfomer.isOnLimit == true)
            {
               this.isStartLimit = true;
            }
            else if(this.isStartLimit == true)
            {
               this.isStartLimit = false;
               this.rr = this.calcRot() - this.rych.rotation;
               this.oldA = this.calcRot() - this.rr;
               this.oldCours = 0;
            }
            _loc2_ = this.calcRot() - this.rr;
            this.cours = _loc2_ - this.oldA;
            objectPerfomer.setOn(this.cours * kf);
            if(this.isStartLimit == false)
            {
               _loc3_ = Math.abs(this.cours / 20) + 0.2;
               if(_loc3_ > 1)
               {
                  _loc3_ = 1;
               }
               if(this.cours != 0)
               {
                  ControlSounds.playSound("mRotate",_loc3_ + 0.2,1,false);
               }
               this.rych.rotation = _loc2_;
            }
            this.oldA = _loc2_;
            this.oldCours = this.cours;
         }
      }
      
      public function calcRot() : Number
      {
         this.pointMouse = new Point(parent.mouseX,parent.mouseY);
         var _loc1_:Number = this.pointMouse.x - x;
         var _loc2_:Number = -(this.pointMouse.y - y);
         angle = Math.atan(_loc2_ / _loc1_) / (Math.PI / 180);
         if(_loc1_ < 0)
         {
            angle += 180;
         }
         if(_loc1_ >= 0 && _loc2_ < 0)
         {
            angle += 360;
         }
         return -angle;
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.findPic);
         super.destroy();
      }
   }
}

