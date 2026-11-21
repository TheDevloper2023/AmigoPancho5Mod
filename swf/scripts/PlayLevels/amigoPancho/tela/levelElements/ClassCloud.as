package PlayLevels.amigoPancho.tela.levelElements
{
   import Box2D.Common.Math.b2Vec2;
   import PlayLevels.BaseLevels.ClassBaseLevel;
   import PlayLevels.amigoPancho.ClassLayers;
   import PlayLevels.amigoPancho.ClassPlayLevel;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   
   public class ClassCloud extends ClassLevelObject
   {
      
      private var pauseGrad:int;
      
      private var nameOsad:String = "grad";
      
      public function ClassCloud(param1:String)
      {
         super(param1);
         movie.play();
         setParentSprite(ClassLayers.spriteForCloud);
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         body.setCustomGravity(new b2Vec2(0,0));
         body.SetLinearDamping(4);
         body.SetFixedRotation(true);
         ControlSounds.playSound("mAcid",0.3,0);
         amigo5.mainStage.addEventListener("ALL_SOUND_ON",this.soundPlay);
         amigo5.mainStage.addEventListener("ALL_SOUND_OFF",this.soundOff);
         if(ClassBaseLevel.numLevel > 15)
         {
            transform.colorTransform = new ColorTransform(0.16,0.61,0);
            this.nameOsad = "kaplya";
         }
      }
      
      private function soundPlay(param1:Event = null) : void
      {
         if(ClassPlayLevel.isUpdate)
         {
            ControlSounds.playSound("mAcid",0.3,0);
         }
      }
      
      private function soundOff(param1:Event = null) : void
      {
         ControlSounds.stopSound("mAcid");
      }
      
      override public function update(param1:Event = null) : void
      {
         var _loc2_:ClassGrad = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         super.update(param1);
         if(ClassBaseLevel.isLevelOver == false)
         {
            if(++this.pauseGrad > 1)
            {
               this.pauseGrad = 0;
               _loc2_ = new ClassGrad(this.nameOsad);
               _loc3_ = width * 0.8;
               _loc4_ = x - width / 2 + 10;
               _loc5_ = Math.random() * _loc3_ + _loc4_;
               _loc2_.setPosition(_loc5_,y);
               _loc2_.init();
               ClassBaseLevel.arrGameObjects.push(_loc2_);
            }
         }
      }
      
      override public function destroy() : void
      {
         amigo5.mainStage.removeEventListener("ALL_SOUND_OFF",this.soundOff);
         amigo5.mainStage.removeEventListener("ALL_SOUND_ON",this.soundPlay);
         super.destroy();
      }
   }
}

