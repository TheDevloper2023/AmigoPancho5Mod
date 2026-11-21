package EditorLevels
{
   import flash.display.MovieClip;
   import flash.xml.XMLNode;
   
   public class ClassDoLevel
   {
      
      private var movieLevel:MovieClip;
      
      private var contTela:MovieClip;
      
      private var contFon:MovieClip;
      
      private var contPerednik:MovieClip;
      
      private var xmlLevel:XML;
      
      private var movieFon:MovieClip;
      
      public function ClassDoLevel()
      {
         super();
      }
      
      public function makeStrLevelFromMovie(param1:MovieClip, param2:XMLNode) : XML
      {
         var _loc4_:XML = null;
         var _loc6_:Number = NaN;
         var _loc7_:MovieClip = null;
         var _loc12_:XMLNode = null;
         var _loc13_:String = null;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc3_:String = "";
         _loc4_ = <xml/>;
         var _loc5_:Boolean = false;
         this.contOnLevel(param1);
         var _loc8_:String = this.contFon.getChildAt(0).toString().substr(12,1);
         var _loc9_:XMLNode = new XMLNode(1,"jopa");
         _loc9_.attributes.numberLevel = param1.numberLevel;
         _loc9_.attributes.nameLevel = param1.nameLevel;
         _loc9_.attributes.nickLevel = param1.nickLevel;
         _loc9_.attributes.fon = param1.fon;
         _loc9_.attributes.alphaKonstruktor = param1.alphaKonstruktor;
         _loc9_.attributes.xKonstruktor = param1.xKonstruktor;
         _loc9_.attributes.yKonstruktor = param1.yKonstruktor;
         _loc9_.attributes.selectedType = param1.selectedType;
         _loc9_.attributes.xL = param1.parent.x;
         _loc9_.attributes.yL = param1.parent.y;
         var _loc10_:XMLNode = new XMLNode(1,"bodies");
         var _loc11_:int = 0;
         while(_loc11_ < this.contTela.numChildren)
         {
            _loc7_ = this.contTela.getChildAt(_loc11_) as MovieClip;
            _loc7_.gotoAndStop(1);
            _loc6_ = _loc7_.rotation;
            _loc7_.rotation = 0;
            _loc13_ = _loc7_.toString().replace("object ","");
            _loc13_ = _loc13_.substring(1,_loc13_.length - 1);
            _loc14_ = _loc7_.width;
            _loc15_ = _loc7_.height;
            _loc12_ = new XMLNode(1,"body");
            _loc12_.attributes.name = _loc13_;
            _loc12_.attributes.width = Math.round(_loc14_);
            _loc12_.attributes.height = Math.round(_loc15_);
            if(_loc13_ == "zomby")
            {
               _loc12_.attributes.width = 48;
               _loc12_.attributes.height = 53;
            }
            _loc12_.attributes.x = Math.round(_loc7_.x);
            _loc12_.attributes.y = Math.round(_loc7_.y);
            if(_loc6_ != 0)
            {
               _loc12_.attributes.rotation = _loc6_;
            }
            if(_loc7_.mirrorShape > 0)
            {
               _loc12_.attributes.mirrorShape = _loc7_.mirrorShape;
            }
            if(_loc7_.density > 0)
            {
               _loc12_.attributes.density = _loc7_.density;
            }
            if(_loc7_.friction > 0)
            {
               _loc12_.attributes.friction = _loc7_.friction;
            }
            if(_loc7_.restitution > 0)
            {
               _loc12_.attributes.restitution = _loc7_.restitution;
            }
            if(_loc7_.strength > 0)
            {
               _loc12_.attributes.strength = _loc7_.strength;
            }
            _loc12_.attributes.a_damp = _loc7_.a_damp;
            _loc12_.attributes.l_damp = _loc7_.l_damp;
            _loc10_.appendChild(_loc12_);
            _loc7_.rotation = _loc6_;
            _loc11_++;
         }
         _loc9_.appendChild(_loc10_);
         _loc12_ = new XMLNode(1,"setting");
         _loc9_.appendChild(_loc12_);
         _loc12_.appendChild(param2);
         _loc4_.appendChild(_loc9_);
         return new XML("<xml>" + _loc4_ + "</xml>");
      }
      
      public function makeMovieLevelFromStr() : Array
      {
         var _loc1_:XML = null;
         var _loc2_:XMLNode = null;
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         var _loc6_:MovieClip = null;
         var _loc7_:XML = null;
         var _loc8_:XML = null;
         var _loc9_:String = null;
         var _loc10_:Class = null;
         var _loc11_:MovieClip = null;
         this.sreateShablonLevel();
         this.xmlLevel = ClassSetDataGame.getXMLLevelFromShara(0);
         if(this.xmlLevel == null)
         {
            this.xmlLevel = <xml>
							  <jopa nickLevel="Player" xKonstruktor="0" yKonstruktorfon="0" numberLevel="0" selectedType="Dyn" nameLevel="Level 0" alphaKonstruktor="" fon="1">
							    <bodies>
									
							    </bodies>
							  </jopa>
							</xml>;
         }
         for each(_loc3_ in this.xmlLevel.children())
         {
            if(_loc3_.name() == "jopa")
            {
               _loc4_ = _loc3_.attribute("fon");
               _loc5_ = amigo5.swfMoviesFon.getAssetClass("fon_" + _loc4_);
               _loc6_ = new _loc5_();
               _loc6_.cacheAsBitmap = true;
               _loc6_.stop();
               this.contFon.addChild(_loc6_);
               this.movieLevel.nameLevel = _loc3_.attribute("nameLevel");
               this.movieLevel.numberLevel = _loc3_.attribute("numberLevel");
               this.movieLevel.nickLevel = _loc3_.attribute("nickLevel");
               this.movieLevel.fon = _loc3_.attribute("fon");
               this.movieLevel.alphaKonstruktor = _loc3_.attribute("alphaKonstruktor");
               this.movieLevel.xKonstruktor = _loc3_.attribute("xKonstruktor");
               this.movieLevel.yKonstruktor = _loc3_.attribute("yKonstruktor");
               this.movieLevel.selectedType = _loc3_.attribute("selectedType");
               this.movieLevel.x = _loc3_.attribute("xL");
               this.movieLevel.y = _loc3_.attribute("yL");
               for each(_loc7_ in _loc3_.children())
               {
                  if(_loc7_.name() == "bodies")
                  {
                     for each(_loc8_ in _loc7_.children())
                     {
                        if(_loc8_.name() == "body")
                        {
                           _loc9_ = _loc8_.attribute("name");
                           _loc10_ = amigo5.swfMoviesGame.getAssetClass(_loc9_);
                           if(_loc10_)
                           {
                              _loc11_ = new _loc10_();
                              _loc11_.x = _loc8_.attribute("x");
                              _loc11_.y = _loc8_.attribute("y");
                              _loc11_.width = _loc8_.attribute("width");
                              _loc11_.height = _loc8_.attribute("height");
                              _loc11_.rotation = 0;
                              _loc11_.mirrorShape = 0;
                              _loc11_.strength = 0;
                              _loc11_.density = 0;
                              _loc11_.friction = 0;
                              _loc11_.restitution = 0;
                              _loc11_.a_damp = 0;
                              _loc11_.l_damp = 0;
                              if(_loc8_.attribute("rotation") != 0)
                              {
                                 _loc11_.rotation = _loc8_.attribute("rotation");
                              }
                              if(_loc8_.attribute("mirrorShape") > 0)
                              {
                                 _loc11_.mirrorShape = _loc8_.attribute("mirrorShape");
                              }
                              if(_loc8_.attribute("strength") > 0)
                              {
                                 _loc11_.strength = _loc8_.attribute("strength");
                              }
                              if(_loc8_.attribute("density") > 0)
                              {
                                 _loc11_.density = _loc8_.attribute("density");
                              }
                              if(_loc8_.attribute("friction") > 0)
                              {
                                 _loc11_.friction = _loc8_.attribute("friction");
                              }
                              if(_loc8_.attribute("restitution") > 0)
                              {
                                 _loc11_.restitution = _loc8_.attribute("restitution");
                              }
                              _loc11_.a_damp = _loc8_.attribute("a_damp");
                              _loc11_.l_damp = _loc8_.attribute("l_damp");
                              _loc11_.cacheAsBitmap = true;
                              this.contTela.addChild(_loc11_);
                           }
                           else
                           {
                              trace("Не найден класс для объекта игры " + _loc9_);
                           }
                        }
                     }
                  }
                  if(_loc7_.name() == "setting")
                  {
                     _loc1_ = _loc7_;
                  }
               }
            }
         }
         return [this.movieLevel,_loc1_];
      }
      
      public function sreateShablonLevel() : MovieClip
      {
         this.create_movies();
         this.movieLevel.addChild(this.contFon);
         this.movieLevel.addChild(this.contTela);
         this.movieLevel.addChild(this.contPerednik);
         this.contFon.ownName = "contFon";
         this.contTela.ownName = "contTela";
         this.contPerednik.ownName = "contPerednik";
         return this.movieLevel;
      }
      
      public function contOnLevel(param1:MovieClip) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_) as MovieClip;
            if(Boolean(_loc3_) && _loc3_.hasOwnProperty("ownName"))
            {
               if(_loc3_.ownName == "contTela")
               {
                  this.contTela = _loc3_;
               }
               if(_loc3_.ownName == "contFon")
               {
                  this.contFon = _loc3_;
               }
            }
            _loc2_++;
         }
      }
      
      internal function create_movies() : *
      {
         this.movieLevel = new MovieClip();
         this.contTela = new MovieClip();
         this.contFon = new MovieClip();
         this.contPerednik = new MovieClip();
      }
      
      public function destroy() : void
      {
         this.movieLevel = null;
         this.contTela = null;
         this.contFon = null;
         this.xmlLevel = null;
      }
      
      public function getNumLevel(param1:XML) : Number
      {
         var _loc3_:XML = null;
         var _loc2_:Number = 0;
         for each(_loc3_ in param1.children())
         {
            if(_loc3_.name() == "jopa")
            {
               _loc2_ = Number(_loc3_.attribute("numberLevel"));
               break;
            }
         }
         return _loc2_;
      }
      
      public function getNameLevel(param1:XML) : String
      {
         var _loc2_:String = null;
         var _loc3_:XML = null;
         for each(_loc3_ in param1.children())
         {
            if(_loc3_.name() == "jopa")
            {
               _loc2_ = _loc3_.attribute("nameLevel");
               break;
            }
         }
         return _loc2_;
      }
      
      public function getNickLevel(param1:XML) : String
      {
         var _loc2_:String = null;
         var _loc3_:XML = null;
         for each(_loc3_ in param1.children())
         {
            if(_loc3_.name() == "jopa")
            {
               _loc2_ = _loc3_.attribute("nickLevel");
               break;
            }
         }
         return _loc2_;
      }
      
      public function getStrLevel() : XML
      {
         return this.xmlLevel;
      }
      
      public function setLevelNameInStr(param1:XML, param2:String) : XML
      {
         param1.jopa.@nameLevel = param2;
         return param1;
      }
      
      public function setNickNameInStr(param1:XML, param2:String) : XML
      {
         param1.jopa.@nickLevel = param2;
         return param1;
      }
   }
}

