package
{
   public class ClassAllLevelsRoly
   {
      
      public function ClassAllLevelsRoly()
      {
         super();
      }
      
      public static function levelsRoly() : Array
      {
         var _loc1_:XML = null;
         var _loc2_:Array = [];
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 1_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pesok" x="422" l_damp="-0.1" y="292" width="80" rotation="-4" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="305" l_damp="-0.1" y="291" width="80" rotation="-3" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="352" y="203" width="300" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="352" y="240" width="300" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="352" a_damp="-0.1" y="277" width="300" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="361" a_damp="-0.1" y="192" width="80" rotation="7" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="393" a_damp="-0.1" y="190" width="80" rotation="-4" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="462" a_damp="-0.1" y="190" width="63" rotation="5" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="347" l_damp="-0.1" y="290" width="80" rotation="7" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="470" l_damp="-0.1" y="290" width="63" rotation="5" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="237" l_damp="-0.1" y="290" width="63" rotation="5" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="245" a_damp="-0.1" y="190" width="80" rotation="-5" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="303" a_damp="-0.1" y="187" width="40" rotation="1" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="518" a_damp="-0.1" y="186" width="14" rotation="-63" height="56" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="551" a_damp="-0.1" y="10" width="30" rotation="-7" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="559" a_damp="-0.1" y="52" width="30" rotation="126" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="550" a_damp="-0.1" y="27" width="30" rotation="15" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="573" a_damp="-0.1" y="405" width="66" rotation="-19" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="146" a_damp="-0.1" y="439" width="46" rotation="14" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="57" l_damp="-0.1" y="73" width="57" rotation="69" height="56" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="154" a_damp="-0.1" y="168" width="57" rotation="25" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="547" a_damp="-0.1" y="269" width="62" rotation="88" height="100" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="177" a_damp="-0.1" y="212" width="57" rotation="93" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="177" a_damp="-0.1" y="264" width="57" rotation="88" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="174" a_damp="-0.1" y="287" width="57" rotation="69" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="52" a_damp="-0.1" y="17" width="46" rotation="7" height="70" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="49" a_damp="-0.1" y="41" width="46" rotation="-5" height="70" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="181" a_damp="-0.1" y="317" width="57" rotation="22" height="56" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="185" width="30" rotation="-104" height="56" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="524" a_damp="-0.1" y="321" width="57" rotation="-22" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="573" a_damp="-0.1" y="215" width="57" rotation="93" height="150" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="183" a_damp="-0.1" y="187" width="34" rotation="46" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="96" a_damp="-0.1" y="125" width="123" rotation="46" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="537" a_damp="-0.1" y="187" width="30" rotation="-90" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="32" a_damp="-0.1" y="237" width="80" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="164" a_damp="-0.1" y="390" width="46" rotation="31" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="166" a_damp="-0.1" y="343" width="74" rotation="7" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="542" a_damp="-0.1" y="368" width="46" rotation="-31" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="572" a_damp="-0.1" y="443" width="46" rotation="-6" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="571" a_damp="-0.1" y="335" width="57" l_damp="-0.1" height="82" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="113" a_damp="-0.1" y="306" width="84" l_damp="-0.1" height="336" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="367" a_damp="-0.1" y="49" width="14" rotation="-73" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="344" a_damp="-0.1" y="29" width="60" l_damp="-0.1" height="56" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="557" a_damp="-0.1" y="169" width="30" rotation="-140" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="523" a_damp="-0.1" y="180" width="14" rotation="-79" height="56" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="638" a_damp="-0.1" y="211" width="180" l_damp="-0.1" height="500" strength="0.1" friction="0.5"/>
				  <body name="pic_hint5" density="1" x="499" a_damp="-0.1" y="36" width="80" l_damp="-0.1" height="108" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="pic_hint3" density="1" x="769" y="233" width="224" l_damp="undefined" height="324" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="350" y="527" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="348" y="340" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="t_shap" x="306" a_damp="-0.1" y="-18" width="150" l_damp="-0.1" height="150" strength="0.2" friction="0.5"/>
				  <body name="yMax" x="176" y="50" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bSpikes01_5" x="532" a_damp="-0.1" y="22" width="50" rotation="105" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="450" a_damp="-0.1" y="3" width="50" rotation="-71" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="416" a_damp="-0.1" y="47" width="50" rotation="-33" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="377" y="-18" width="150" l_damp="-0.1" height="150" a_damp="-0.1" friction="0.5"/>
				  <body name="statObj_11" x="90" y="344" width="100" l_damp="undefined" height="142" a_damp="undefined" friction="0.5"/>
				  <body name="areaNextHint" density="1" x="348" y="178" width="40" l_damp="undefined" height="23" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gFan01" x="567" a_damp="-0.1" y="111" width="116" l_damp="2" height="111" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="star" x="471" y="57" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 2_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pesok" x="518" a_damp="-0.1" y="193" width="60" rotation="14" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="514" a_damp="-0.1" y="173" width="53" rotation="46" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="515" a_damp="-0.1" y="63" width="43" rotation="-44" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="391" a_damp="-0.1" y="60" width="230" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="390" a_damp="-0.1" y="133" width="230" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="531" a_damp="-0.1" y="35" width="54" rotation="-16" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="425" a_damp="-0.1" y="43" width="62" rotation="5" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="312" l_damp="-0.1" y="46" width="50" rotation="4" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="362" a_damp="-0.1" y="190" width="50" rotation="4" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="455" a_damp="-0.1" y="190" width="50" rotation="5" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="410" a_damp="-0.1" y="190" width="50" rotation="-3" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="314" a_damp="-0.1" y="190" width="50" rotation="-3" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="366" a_damp="-0.1" y="43" width="62" rotation="-5" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="479" l_damp="-0.1" y="43" width="62" rotation="-5" height="14" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="550" a_damp="-0.1" y="40" width="50" rotation="-34" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="572" a_damp="-0.1" y="43" width="36" rotation="-10" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="506" a_damp="-0.1" y="188" width="60" rotation="-9" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="391" a_damp="-0.1" y="96" width="230" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="390" a_damp="-0.1" y="170" width="230" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="504" a_damp="-0.1" y="131" width="62" rotation="97" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="504" a_damp="-0.1" y="73" width="62" rotation="82" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="559" a_damp="-0.1" y="201" width="50" rotation="18" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="184" a_damp="-0.1" y="205" width="20" rotation="-80" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="684" a_damp="-0.1" y="321" width="180" l_damp="-0.1" height="288" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="53" a_damp="-0.1" y="445" width="36" l_damp="-0.1" height="54" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="52" a_damp="-0.1" y="17" width="46" rotation="7" height="70" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="49" a_damp="-0.1" y="41" width="46" rotation="-5" height="70" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="49" a_damp="-0.1" y="105" width="46" rotation="6" height="70" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="36" a_damp="-0.1" y="168" width="46" rotation="19" height="70" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="29" a_damp="-0.1" y="204" width="46" rotation="11" height="70" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="576" a_damp="-0.1" y="465" width="57" rotation="14" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="168" a_damp="-0.1" y="12" width="44" rotation="-24" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="190" a_damp="-0.1" y="186" width="34" rotation="-20" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="278" a_damp="-0.1" y="188" width="34" rotation="-27" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="276" l_damp="-0.1" y="18" width="34" rotation="-11" height="46" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="607" a_damp="-0.1" y="225" width="30" rotation="59" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="580" a_damp="-0.1" y="418" width="40" rotation="15" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="599" a_damp="-0.1" y="342" width="30" rotation="16" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="681" a_damp="-0.1" y="-55" width="180" l_damp="-0.1" height="250" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="587" a_damp="-0.1" y="378" width="30" rotation="21" height="36" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="593" a_damp="-0.1" y="43" width="30" l_damp="-0.1" height="52" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="596" a_damp="-0.1" y="195" width="30" l_damp="-0.1" height="34" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="576" a_damp="-0.1" y="-16" width="38" l_damp="-0.1" height="52" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="584" l_damp="-0.1" y="24" width="30" rotation="-33" height="52" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="598" a_damp="-0.1" y="211" width="30" rotation="33" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="279" a_damp="-0.1" y="136" width="34" rotation="4" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="276" a_damp="-0.1" y="95" width="34" rotation="-11" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="276" a_damp="-0.1" y="55" width="34" rotation="11" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="279" a_damp="-0.1" y="168" width="30" rotation="1" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="276" l_damp="-0.1" y="55" width="34" rotation="11" height="46" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="228" a_damp="-0.1" y="106" width="90" l_damp="-0.1" height="220" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="181" a_damp="-0.1" y="142" width="34" rotation="-4" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="176" a_damp="-0.1" y="96" width="34" rotation="-9" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="170" a_damp="-0.1" y="47" width="34" rotation="-3" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="17" a_damp="-0.1" y="237" width="60" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="91" a_damp="-0.1" y="451" width="46" rotation="-26" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="63" a_damp="-0.1" y="403" width="46" rotation="-35" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="42" a_damp="-0.1" y="361" width="46" rotation="-21" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="29" a_damp="-0.1" y="313" width="46" rotation="-12" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="yLimit" x="234" y="362" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="hero" density="1" x="233" y="528" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gFan01" x="614" a_damp="-0.1" y="291" width="116" l_damp="-0.1" height="111" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes01_3" x="101" a_damp="-0.1" y="417" width="88" rotation="-119" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_3" x="61" a_damp="-0.1" y="336" width="88" rotation="-110" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_3" x="48" a_damp="-0.1" y="246" width="88" rotation="-88" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="76" a_damp="-0.1" y="30" width="50" rotation="-88" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="75" a_damp="-0.1" y="84" width="50" rotation="-90" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_3" x="65" a_damp="-0.1" y="157" width="88" rotation="-76" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="299" a_damp="-0.1" y="154" width="50" rotation="-88" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="297" a_damp="-0.1" y="100" width="50" rotation="-100" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_4" x="294" a_damp="-0.1" y="60" width="24" rotation="-78" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="167" a_damp="-0.1" y="176" width="50" rotation="73" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="159" l_damp="-0.1" y="122" width="50" rotation="86" height="23" a_damp="-0.1" friction="0.5"/>
				  <body name="bSpikes01_5" x="153" a_damp="-0.1" y="69" width="50" rotation="86" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="144" a_damp="-0.1" y="17" width="50" rotation="69" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="statObj_10" x="227" a_damp="-0.1" y="106" width="112" l_damp="-0.1" height="79" strength="0.2" friction="0.5"/>
				  <body name="yMax" x="116" y="81" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bFanMega02" x="667" a_damp="-0.1" y="125" width="204" l_damp="-0.1" height="116" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="star" x="117" y="242" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="-62" nameLevel="Level 3_" yKonstruktor="180">
				<bodies>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="704" y="219" width="80" l_damp="-0.1" height="500" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="48" a_damp="-0.1" y="195" width="60" rotation="33" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="533" a_damp="-0.1" y="410" width="80" l_damp="-0.1" height="200" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="475" a_damp="-0.1" y="351" width="60" rotation="-110" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="615" a_damp="-0.1" y="237" width="60" rotation="-39" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="574" a_damp="-0.1" y="274" width="60" rotation="-46" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="486" a_damp="-0.1" y="316" width="60" rotation="-25" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="537" a_damp="-0.1" y="298" width="60" rotation="-13" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="487" a_damp="-0.1" y="390" width="60" rotation="-102" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="509" a_damp="-0.1" y="443" width="76" rotation="-122" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="598" a_damp="-0.1" y="377" width="80" l_damp="-0.1" height="230" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="175" a_damp="-0.1" y="401" width="86" l_damp="-0.1" height="200" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="229" a_damp="-0.1" y="401" width="60" rotation="-82" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="237" a_damp="-0.1" y="362" width="60" rotation="-70" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="90" a_damp="-0.1" y="225" width="60" rotation="38" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="167" a_damp="-0.1" y="284" width="60" rotation="17" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="219" a_damp="-0.1" y="304" width="60" rotation="25" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="129" a_damp="-0.1" y="262" width="60" rotation="49" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="215" a_damp="-0.1" y="450" width="60" rotation="-66" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="98" y="353" width="80" l_damp="-0.1" height="230" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-1" a_damp="-0.1" y="234" width="80" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="24" a_damp="-0.1" y="152" width="60" rotation="75" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="41" a_damp="-0.1" y="8" width="60" rotation="98" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="25" a_damp="-0.1" y="56" width="60" rotation="118" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="683" a_damp="-0.1" y="81" width="60" rotation="-86" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="673" a_damp="-0.1" y="38" width="60" rotation="-125" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="650" a_damp="-0.1" y="-6" width="60" rotation="-110" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="682" a_damp="-0.1" y="139" width="60" rotation="-93" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="652" a_damp="-0.1" y="198" width="102" rotation="-59" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="646" a_damp="-0.1" y="356" width="80" l_damp="-0.1" height="260" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="45" a_damp="-0.1" y="343" width="80" l_damp="-0.1" height="250" strength="0.2" friction="0.5"/>
				  <body name="pic_hint4" strength="0.1" density="1" friction="0.5" restitution="0.2" x="131" y="223" width="71" l_damp="-0.1" height="292" mirrorShape="1" a_damp="-0.1"/>
				  <body name="pic_hint1" density="1" x="577" y="354" width="561" l_damp="undefined" height="261" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="354" a_damp="-0.1" y="365" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				  <body name="bBar01" density="1" x="352" a_damp="4.5" y="323" width="156" l_damp="0" height="23" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="354" a_damp="-0.1" y="528" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="t_shap" x="460" a_damp="-0.1" y="323" width="40" l_damp="-0.1" height="40" strength="0.2" friction="0.5"/>
				  <body name="statObj_4" density="1" x="244" a_damp="-0.1" y="322" width="72" l_damp="-0.1" height="62" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="247" a_damp="-0.1" y="320" width="79" l_damp="0" height="79" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" density="1" x="346" a_damp="-0.1" y="100" width="598" l_damp="-0.1" height="5" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit" x="36" a_damp="-0.1" y="99" width="40" l_damp="-0.1" height="38" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit" x="658" y="100" width="40" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bDrag08" density="5" x="412" y="100" width="123" l_damp="-0.1" height="49" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bDrag08" density="5" x="292" a_damp="-0.1" y="100" width="123" l_damp="-0.1" height="49" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="star" x="153" y="29" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 4_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pol" x="529" a_damp="-0.1" y="169" width="23" rotation="-32" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="527" a_damp="-0.1" y="174" width="32" rotation="-80" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="520" a_damp="-0.1" y="195" width="32" rotation="-65" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="654" a_damp="-0.1" y="147" width="60" rotation="-37" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="625" a_damp="-0.1" y="189" width="200" l_damp="-0.1" height="94" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="191" a_damp="-0.1" y="296" width="68" rotation="23" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="65" a_damp="-0.1" y="361" width="200" l_damp="-0.1" height="208" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="166" a_damp="-0.1" y="278" width="30" rotation="45" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="518" a_damp="-0.1" y="425" width="60" rotation="38" height="71" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="542" a_damp="-0.1" y="386" width="60" rotation="25" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="545" l_damp="-0.1" y="354" width="30" rotation="45" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="646" y="383" width="200" l_damp="-0.1" height="100" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="680" a_damp="-0.1" y="260" width="60" rotation="-27" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="667" a_damp="-0.1" y="218" width="60" rotation="25" height="88" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="601" a_damp="-0.1" y="225" width="54" rotation="13" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="522" a_damp="-0.1" y="224" width="30" rotation="-54" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="542" a_damp="-0.1" y="224" width="45" rotation="-18" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="205" a_damp="-0.1" y="445" width="45" rotation="111" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="217" a_damp="-0.1" y="420" width="45" rotation="135" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="261" a_damp="-0.1" y="315" width="30" rotation="73" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="261" a_damp="-0.1" y="337" width="30" rotation="103" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="229" a_damp="-0.1" y="313" width="43" rotation="-9" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="138" a_damp="-0.1" y="321" width="265" l_damp="-0.1" height="50" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="247" a_damp="-0.1" y="363" width="45" rotation="125" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="235" a_damp="-0.1" y="389" width="45" rotation="107" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="201" a_damp="-0.1" y="364" width="86" l_damp="-0.1" height="96" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="445" a_damp="-0.1" y="459" width="49" rotation="79" height="33" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="463" width="265" l_damp="-0.1" height="61" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="494" a_damp="-0.1" y="436" width="49" rotation="12" height="17" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="441" a_damp="-0.1" y="440" width="23" rotation="55" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="105" a_damp="-0.1" y="43" width="174" l_damp="-0.1" height="100" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="206" a_damp="-0.1" y="14" width="80" rotation="58" height="74" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="204" a_damp="-0.1" y="50" width="43" rotation="9" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="204" l_damp="-0.1" y="78" width="43" rotation="-9" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="173" a_damp="-0.1" y="115" width="64" rotation="-78" height="100" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="156" a_damp="-0.1" y="113" width="62" rotation="-5" height="83" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="102" a_damp="-0.1" y="114" width="62" rotation="2" height="83" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="50" l_damp="-0.1" y="119" width="62" rotation="-9" height="83" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="23" l_damp="-0.1" y="171" width="60" rotation="-54" height="44" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="166" y="417" width="86" l_damp="-0.1" height="96" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="18" a_damp="-0.1" y="251" width="60" rotation="-21" height="65" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="6" a_damp="-0.1" y="194" width="60" rotation="2" height="65" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="49" l_damp="-0.1" y="288" width="60" rotation="-54" height="44" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="177" a_damp="-0.1" y="333" width="60" rotation="69" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="199" a_damp="-0.1" y="352" width="29" rotation="36" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="681" l_damp="-0.1" y="368" width="60" rotation="25" height="44" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="256" a_damp="-0.1" y="0" width="50" rotation="-14" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="259" a_damp="-0.1" y="11" width="45" rotation="22" height="22" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="449" a_damp="-0.1" y="15" width="45" rotation="-22" height="22" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="452" a_damp="-0.1" y="4" width="50" rotation="14" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="638" a_damp="-0.1" y="10" width="60" rotation="49" height="88" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="659" l_damp="-0.1" y="50" width="60" rotation="-54" height="44" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="520" l_damp="-0.1" y="20" width="45" rotation="-18" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="618" a_damp="-0.1" y="16" width="200" rotation="7" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="490" a_damp="-0.1" y="7" width="60" rotation="-73" height="44" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="686" a_damp="-0.1" y="116" width="62" rotation="-9" height="83" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="690" a_damp="-0.1" y="286" width="60" rotation="-9" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" y="9" width="265" l_damp="-0.1" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="688" y="241" width="50" l_damp="-0.1" height="500" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="0" a_damp="-0.1" y="245" width="50" l_damp="-0.1" height="500" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="566" y="463" width="265" l_damp="-0.1" height="61" a_damp="-0.1" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="dragLimit" density="1" x="458" y="36" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" strength="0.1" rotation="90" density="1" friction="0.5" restitution="0.2" x="256" y="174" width="250" l_damp="-0.1" height="5" a_damp="-0.1"/>
				  <body name="dragLimit" density="1" x="256" y="36" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bDrag01" strength="0.1" rotation="90" density="1" friction="0.5" restitution="0.2" x="256" y="114" width="110" l_damp="-0.1" height="34" a_damp="-0.1"/>
				  <body name="dragLimit" density="1" x="458" y="435" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit" density="1" x="255" y="304" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_shap" x="508" a_damp="-0.1" y="208" width="40" l_damp="-0.1" height="40" strength="0.2" friction="0.5"/>
				  <body name="picStat_2" strength="0.1" rotation="90" density="1" friction="0.5" restitution="0.2" x="459" y="232" width="391" l_damp="-0.1" height="5" a_damp="-0.1"/>
				  <body name="bDrag01" density="1" x="460" l_damp="-0.1" y="359" width="110" rotation="90" height="34" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="354" y="352" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="hero" density="1" x="355" y="526" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="cannon" x="148" a_damp="-0.1" y="206" width="140" l_damp="-0.1" height="100" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="cannon" x="554" a_damp="-0.1" y="91" width="140" l_damp="-0.1" height="100" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="cannon" x="574" y="282" width="140" l_damp="-0.1" height="100" mirrorShape="1" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_15" x="118" y="336" width="145" l_damp="undefined" height="70" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" numberLevel="0" xKonstruktor="-5" yL="0" xL="0" yKonstruktor="-300" nameLevel="Level 5_" nickLevel="Player" selectedType="Stat" alphaKonstruktor="">
				<bodies>
				  <body name="t_pol" x="-5" y="-5" width="5" height="5" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="6" y="235" width="50" height="470" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="90" y="440" width="130" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="157" y="441" width="26" rotation="14" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="166" y="359" width="26" rotation="12" height="38" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="169" y="359" width="26" rotation="1" height="38" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="162" y="394" width="26" rotation="-1" height="38" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="153" y="408" width="26" rotation="33" height="38" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="166" y="396" width="26" rotation="9" height="46" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="39" y="410" width="32" rotation="-22" height="38" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="19" y="231" width="26" rotation="3" height="65" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="21" y="279" width="26" rotation="-7" height="65" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="26" y="342" width="26" rotation="-2" height="65" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="31" y="378" width="26" rotation="-12" height="38" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="21" y="161" width="26" height="78" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="150" y="14" width="26" rotation="15" height="40" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="141" y="41" width="26" rotation="76" height="46" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="78" y="18" width="125" height="72" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="151" y="-14" width="26" rotation="-17" height="33" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="93" y="39" width="26" rotation="104" height="65" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="33" y="95" width="26" rotation="26" height="65" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="48" y="57" width="36" rotation="50" height="65" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="443" y="443" width="48" rotation="-19" height="63" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="428" y="413" width="26" rotation="23" height="30" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="451" y="389" width="37" rotation="42" height="46" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="554" y="205" width="28" rotation="35" height="24" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="559" y="184" width="200" height="60" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="609" y="205" width="100" height="36" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="456" y="179" width="28" rotation="96" height="24" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="457" y="202" width="28" rotation="80" height="24" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="465" y="223" width="28" rotation="59" height="24" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="479" y="219" width="28" rotation="-59" height="24" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="472" y="216" width="26" rotation="1" height="38" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="657" y="204" width="28" rotation="-59" height="24" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="677" y="185" width="36" height="36" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="691" y="393" width="112" rotation="13" height="40" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="498" y="1" width="44" rotation="22" height="48" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="668" y="21" width="41" rotation="-7" height="30" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="631" y="21" width="41" rotation="7" height="30" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="589" y="18" width="41" rotation="2" height="30" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="531" y="19" width="41" rotation="8" height="30" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="465" y="-10" width="41" rotation="44" height="30" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="608" y="0" width="200" height="60" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="566" y="17" width="41" rotation="-12" height="30" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="575" y="438" width="248" height="102" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="463" y="365" width="35" rotation="8" height="46" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="453" y="367" width="26" rotation="19" height="46" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="474" y="369" width="26" rotation="-8" height="46" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="563" y="411" width="156" height="102" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="673" y="176" width="36" rotation="12" height="36" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="458" y="163" width="28" rotation="92" height="24" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="467" y="161" width="28" rotation="56" height="24" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_shap" x="169" y="342" width="26" height="26" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="dragLimit" x="90" l_damp="-0.1" y="425" width="40" height="38" restitution="0.2" strength="0.1" density="1" a_damp="-0.1" friction="0.5"/>
				  <body name="hero" x="306" l_damp="undefined" y="478" width="95" height="146" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="yLimit" x="304" y="364" width="96" height="15" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				  <body name="picStat_2" l_damp="-0.1" a_damp="-0.1" rotation="90" density="1" friction="0.5" x="90" y="240" width="344" height="5" restitution="0.2" strength="0.1"/>
				  <body name="bBar01" l_damp="-2" a_damp="2" rotation="90" density="1" friction="0.5" x="605" y="194" width="200" height="26" restitution="0.2" strength="0.2"/>
				  <body name="rev" x="606" l_damp="-0.1" y="188" width="97" height="101" restitution="0.2" strength="0.1" density="1" a_damp="-0.1" friction="0.5"/>
				  <body name="statObj_1" x="605" l_damp="-0.1" y="188" width="69" height="72" restitution="0.2" strength="0.1" density="1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_shap" x="472" y="233" width="26" height="26" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="bCarWheel02" x="512" l_damp="0" y="349" width="24" height="24" restitution="0.2" strength="0.1" density="1" a_damp="0" friction="0.5"/>
				  <body name="bCarWheel02" x="562" l_damp="-0.1" y="349" width="24" height="24" restitution="0.2" strength="0.1" density="1" a_damp="-0.1" friction="0.5"/>
				  <body name="telega" x="530" l_damp="undefined" y="133" width="106" height="29" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="t_shap" x="460" y="152" width="26" height="26" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="dragLimit" x="90" l_damp="undefined" y="56" width="40" height="38" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="bDrag07" x="89" l_damp="undefined" y="383" width="58" height="53" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="bCar02" x="536" l_damp="-0.1" y="331" width="99" height="46" restitution="0.2" strength="0.1" density="1" a_damp="-0.1" friction="0.5"/>
				  <body name="gCactusA01" x="92" l_damp="undefined" y="319" width="57" height="75" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="bCactusA05" l_damp="-0.1" a_damp="-0.1" mirrorShape="1" density="1" friction="0.5" x="557" y="282" width="48" height="77" restitution="0.2" strength="0.2"/>
				  <body name="bCactusA05" x="518" restitution="0.2" y="85" width="48" l_damp="-0.1" height="77" mirrorShape="1" density="1" a_damp="-0.1" friction="0.5"/>
				  <body name="koleso" x="498" l_damp="undefined" y="142" width="27" height="27" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="koleso" x="543" l_damp="undefined" y="142" width="27" height="27" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint" x="512" l_damp="0" y="349" width="6" height="6" restitution="0.2" strength="0.1" density="1" a_damp="0" friction="0.5"/>
				  <body name="t_joint" x="562" l_damp="0" y="349" width="6" height="6" restitution="0.2" strength="0.1" density="1" a_damp="0" friction="0.5"/>
				  <body name="t_joint_fixed" x="560" l_damp="undefined" y="318" width="9" height="9" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint" x="498" l_damp="0" y="142" width="6" height="6" restitution="0.2" density="1" a_damp="0" friction="0.5"/>
				  <body name="t_joint" x="543" l_damp="0" y="142" width="6" height="6" restitution="0.2" density="1" a_damp="0" friction="0.5"/>
				  <body name="t_joint_fixed" x="505" l_damp="undefined" y="118" width="9" height="9" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint_fixed" x="91" l_damp="undefined" y="355" width="9" height="9" restitution="0.2" density="1" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 6_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" rotation="25" height="5" strength="0.2" friction="1" l_damp="-0.1"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="118" a_damp="-0.1" y="253" width="122" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="92" a_damp="-0.1" y="295" width="250" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="19" a_damp="-0.1" y="288" width="350" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="6" a_damp="-0.1" y="98" width="60" rotation="15" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="671" a_damp="-0.1" y="163" width="100" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="597" a_damp="-0.1" y="183" width="84" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="698" a_damp="-0.1" y="91" width="60" rotation="-32" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="612" a_damp="-0.1" y="131" width="60" rotation="-38" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="635" a_damp="-0.1" y="387" width="136" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="615" a_damp="-0.1" y="264" width="154" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="633" a_damp="-0.1" y="301" width="118" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="672" a_damp="-0.1" y="392" width="146" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="603" a_damp="-0.1" y="340" width="50" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="658" a_damp="-0.1" y="108" width="60" rotation="-15" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="578" a_damp="-0.1" y="168" width="60" rotation="-56" height="38" strength="0.2" friction="1" l_damp="-0.1"/>
				  <body name="t_pesok" x="603" a_damp="-0.1" y="227" width="210" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="545" a_damp="-0.1" y="205" width="79" rotation="-31" height="38" strength="0.2" friction="1" l_damp="-0.1"/>
				  <body name="t_pesok" x="634" a_damp="-0.1" y="169" width="82" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="131" a_damp="-0.1" y="186" width="79" rotation="25" height="38" strength="0.2" friction="1" l_damp="-0.1"/>
				  <body name="t_pesok" x="86" a_damp="-0.1" y="157" width="60" rotation="56" height="38" strength="0.2" friction="1" l_damp="-0.1"/>
				  <body name="t_pesok" x="51" a_damp="-0.1" y="120" width="60" rotation="38" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="55" l_damp="-0.1" y="292" width="350" rotation="90" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="434" a_damp="-0.1" y="235" width="50" rotation="118" height="20" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="509" a_damp="-0.1" y="239" width="50" rotation="32" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="468" a_damp="-0.1" y="338" width="60" l_damp="-0.1" height="260" strength="0.2" friction="0.2"/>
				  <body name="t_pol" x="137" a_damp="-0.1" y="432" width="30" l_damp="-0.1" height="100" strength="0.2" friction="0.3"/>
				  <body name="t_pol" x="93" a_damp="-0.1" y="464" width="58" rotation="115" height="60" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="107" a_damp="-0.1" y="418" width="58" rotation="102" height="60" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="124" a_damp="-0.1" y="373" width="58" rotation="118" height="60" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="139" a_damp="-0.1" y="328" width="58" rotation="104" height="60" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="136" a_damp="-0.1" y="281" width="50" rotation="94" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="143" a_damp="-0.1" y="236" width="50" rotation="105" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="185" a_damp="-0.1" y="213" width="40" rotation="28" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="219" a_damp="-0.1" y="394" width="50" rotation="66" height="34" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="206" l_damp="-0.1" y="301" width="50" rotation="81" height="20" a_damp="-0.1" friction="0.2"/>
				  <body name="t_pol" x="181" y="335" width="60" l_damp="-0.1" height="260" a_damp="-0.1" friction="0.3"/>
				  <body name="t_pol" x="629" a_damp="-0.1" y="462" width="50" rotation="70" height="56" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="605" a_damp="-0.1" y="431" width="50" rotation="52" height="68" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="526" a_damp="-0.1" y="363" width="60" l_damp="-0.1" height="220" strength="0.2" friction="0.2"/>
				  <body name="t_pol" x="561" a_damp="-0.1" y="303" width="50" rotation="72" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="579" a_damp="-0.1" y="345" width="50" rotation="60" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="599" a_damp="-0.1" y="387" width="50" rotation="70" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="572" a_damp="-0.1" y="401" width="34" l_damp="-0.1" height="128" strength="0.2" friction="0.2"/>
				  <body name="t_pol" x="439" a_damp="-0.1" y="329" width="50" rotation="98" height="20" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="436" a_damp="-0.1" y="353" width="50" rotation="107" height="20" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="433" a_damp="-0.1" y="442" width="50" rotation="102" height="20" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="204" l_damp="-0.1" y="231" width="50" rotation="87" height="20" a_damp="-0.1" friction="0.2"/>
				  <body name="t_pol" x="202" l_damp="-0.1" y="278" width="50" rotation="98" height="20" a_damp="-0.1" friction="0.2"/>
				  <body name="t_pol" x="213" a_damp="-0.1" y="348" width="50" rotation="83" height="20" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="433" a_damp="-0.1" y="398" width="50" rotation="82" height="20" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="221" a_damp="-0.1" y="431" width="50" rotation="102" height="38" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="226" a_damp="-0.1" y="449" width="50" rotation="76" height="38" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="161" a_damp="-0.1" y="214" width="50" rotation="-23" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="541" a_damp="-0.1" y="267" width="50" rotation="52" height="40" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="t_pol" x="436" a_damp="-0.1" y="283" width="70" rotation="74" height="26" strength="0.2" friction="0.2" l_damp="-0.1"/>
				  <body name="bBox01" x="467" a_damp="-0.1" y="173" width="77" l_damp="-0.1" height="69" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox01" x="251" a_damp="-0.1" y="173" width="77" l_damp="-0.1" height="69" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="349" y="527" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="348" y="315" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="statObj_12" x="502" a_damp="-0.1" y="317" width="105" l_damp="-0.1" height="88" strength="0.2" friction="0.5"/>
 					<body name="bBox10" density="1" x="360" a_damp="-0.1" y="121" width="190" l_damp="-0.1" height="20" strength="0.1" friction="0.2" restitution="0.2"/>
					<body name="bNails21" strength="0.2" rotation="180" density="1" friction="10" restitution="0.2" x="418" y="134" width="91" l_damp="-0.1" height="24" a_damp="-0.1"/>
				  <body name="bNails21" strength="0.1" rotation="180" density="1" friction="0.5" restitution="0.2" x="308" y="132" width="103" l_damp="-0.1" height="24" a_damp="-0.1"/>
				 
				  <body name="bCactus31" density="1" x="296" a_damp="-0.1" y="96" width="30" l_damp="-0.1" height="30" strength="0.2" friction="0.3" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="328" a_damp="-0.1" y="96" width="30" l_damp="-0.1" height="30" strength="0.1" friction="0.3" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="360" a_damp="-0.1" y="96" width="30" l_damp="-0.1" height="30" strength="0.1" friction="0.3" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="391" a_damp="-0.1" y="95" width="30" l_damp="-0.1" height="30" strength="0.1" friction="0.3" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="423" a_damp="-0.1" y="96" width="30" l_damp="-0.1" height="30" strength="0.1" friction="0.3" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="403" y="126" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="308" y="126" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="12" nameLevel="Level 7_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pol" x="469" a_damp="-0.1" y="364" width="36" rotation="33" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="462" a_damp="-0.1" y="334" width="36" rotation="10" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="439" a_damp="-0.1" y="447" width="48" rotation="24" height="58" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="442" a_damp="-0.1" y="410" width="36" rotation="8" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="452" a_damp="-0.1" y="374" width="36" rotation="21" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="472" a_damp="-0.1" y="380" width="36" rotation="5" height="44" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="475" a_damp="-0.1" y="407" width="36" rotation="-9" height="44" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="476" a_damp="-0.1" y="446" width="36" rotation="5" height="44" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="473" a_damp="-0.1" y="339" width="36" rotation="-13" height="44" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="682" a_damp="-0.1" y="314" width="40" rotation="-18" height="40" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="613" a_damp="-0.1" y="37" width="120" rotation="1" height="102" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="555" a_damp="-0.1" y="43" width="62" rotation="-16" height="110" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="647" a_damp="-0.1" y="69" width="68" rotation="-47" height="62" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="436" a_damp="-0.1" y="-3" width="200" l_damp="-0.1" height="200" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="508" a_damp="-0.1" y="88" width="60" rotation="-32" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="658" a_damp="-0.1" y="106" width="40" rotation="-33" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="670" a_damp="-0.1" y="143" width="40" rotation="-5" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="669" a_damp="-0.1" y="182" width="40" rotation="9" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="669" a_damp="-0.1" y="214" width="40" rotation="-9" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="670" a_damp="-0.1" y="245" width="40" rotation="5" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="672" a_damp="-0.1" y="279" width="40" rotation="-12" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="469" a_damp="-0.1" y="111" width="36" rotation="-50" height="82" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="431" a_damp="-0.1" y="127" width="36" rotation="-12" height="90" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="458" a_damp="-0.1" y="130" width="36" rotation="-27" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="417" a_damp="-0.1" y="138" width="36" rotation="19" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="394" a_damp="-0.1" y="126" width="36" rotation="37" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="377" a_damp="-0.1" y="104" width="50" rotation="62" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="334" a_damp="-0.1" y="4" width="69" rotation="50" height="67" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="363" a_damp="-0.1" y="51" width="69" rotation="64" height="67" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="95" a_damp="-0.1" y="-24" width="69" rotation="-66" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="57" a_damp="-0.1" y="56" width="69" rotation="109" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="109" a_damp="-0.1" y="432" width="100" rotation="77" height="102" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="110" a_damp="-0.1" y="351" width="89" rotation="96" height="86" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="97" a_damp="-0.1" y="285" width="89" rotation="70" height="96" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-23" a_damp="-0.1" y="247" width="200" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="72" a_damp="-0.1" y="229" width="89" rotation="142" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="66" a_damp="-0.1" y="24" width="69" rotation="128" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="60" a_damp="-0.1" y="164" width="89" rotation="81" height="67" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="718" a_damp="-0.1" y="231" width="100" l_damp="-0.1" height="460" strength="0.2" friction="0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="rev" x="74" a_damp="-0.1" y="100" width="79" l_damp="-0.1" height="79" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBar03" density="1" x="142" a_damp="6.5" y="102" width="351" l_damp="0" height="22" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="2" x="325" a_damp="-0.1" y="87" width="40" l_damp="-0.1" height="40" strength="0.1" friction="0.5" restitution="0.4"/>
				  <body name="yLimit" x="335" y="325" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="hero" density="1" x="337" y="419" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="statObj_3" x="74" a_damp="-0.1" y="102" width="75" rotation="180" height="60" strength="0.1" friction="0.5" l_damp="-0.1" restitution="0.2"/>
				  <body name="bStone03" density="5" x="585" a_damp="-0.1" y="138" width="101" l_damp="-0.1" height="71" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox01" x="587" a_damp="-0.1" y="335" width="77" l_damp="-0.1" height="68" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="t_shap" x="466" a_damp="-0.1" y="319" width="40" rotation="-4" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bCage01" strength="0.2" rotation="180" density="5" friction="0.2" restitution="0.2" x="577" y="237" width="143" l_damp="-0.1" height="134" a_damp="-0.1"/>
				  <body name="statObj_6" x="68" y="309" width="95" l_damp="undefined" height="124" a_damp="undefined" friction="0.5"/>
				  <body name="bBat01" density="1" x="338" a_damp="-0.1" y="245" width="115" l_damp="0" height="97" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="star" x="133" y="42" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 8_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pesok" x="488" l_damp="-0.1" y="76" width="50" rotation="77" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="486" l_damp="-0.1" y="48" width="22" rotation="116" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="613" l_damp="-0.1" y="147" width="60" rotation="4" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="516" l_damp="-0.1" y="147" width="60" rotation="4" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="573" l_damp="-0.1" y="146" width="60" rotation="-7" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="656" l_damp="-0.1" y="145" width="33" rotation="-14" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="204" a_damp="-0.1" y="161" width="33" rotation="-14" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="121" a_damp="-0.1" y="162" width="60" rotation="-7" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="161" a_damp="-0.1" y="163" width="60" rotation="4" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="222" a_damp="-0.1" y="102" width="50" rotation="102" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="222" a_damp="-0.1" y="56" width="50" rotation="77" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="586" y="138" width="202" l_damp="-0.1" height="28" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="586" y="33" width="202" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="586" y="70" width="202" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="586" y="107" width="202" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="123" a_damp="-0.1" y="152" width="202" l_damp="-0.1" height="28" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="123" a_damp="-0.1" y="46" width="202" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="123" y="83" width="202" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="123" y="120" width="202" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="221" a_damp="-0.1" y="122" width="50" rotation="81" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="221" a_damp="-0.1" y="152" width="22" rotation="116" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="487" l_damp="-0.1" y="95" width="50" rotation="102" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="487" a_damp="-0.1" y="132" width="36" rotation="73" height="16" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="64" a_damp="-0.1" y="161" width="60" rotation="8" height="16" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="465" a_damp="-0.1" y="19" width="20" rotation="62" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="474" a_damp="-0.1" y="30" width="20" rotation="37" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="674" a_damp="-0.1" y="165" width="26" rotation="-25" height="32" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="241" a_damp="-0.1" y="-5" width="48" rotation="-52" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="44" a_damp="-0.1" y="176" width="20" rotation="25" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="477" a_damp="-0.1" y="-12" width="62" rotation="38" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="180" a_damp="-0.1" y="447" width="60" rotation="11" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="156" a_damp="-0.1" y="410" width="78" rotation="55" height="94" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-7" y="381" width="300" l_damp="undefined" height="200" a_damp="undefined" friction="0.5"/>
				  <body name="t_pol" x="0" a_damp="-0.1" y="27" width="87" rotation="12" height="300" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-13" a_damp="-0.1" y="271" width="50" rotation="-4" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="141" a_damp="-0.1" y="295" width="20" rotation="51" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="155" a_damp="-0.1" y="355" width="50" rotation="42" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="142" l_damp="-0.1" y="329" width="50" rotation="-114" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-7" a_damp="-0.1" y="219" width="56" rotation="19" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="175" a_damp="-0.1" y="385" width="50" rotation="-19" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="17" a_damp="-0.1" y="150" width="86" rotation="80" height="48" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="13" a_damp="-0.1" y="184" width="50" rotation="53" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="695" a_damp="-0.1" y="332" width="98" rotation="-77" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="696" a_damp="-0.1" y="170" width="50" rotation="-85" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="698" a_damp="-0.1" y="210" width="50" rotation="-100" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="705" a_damp="-0.1" y="256" width="50" rotation="-96" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="480" a_damp="-0.1" y="368" width="9" rotation="27" height="14" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="491" a_damp="-0.1" y="364" width="15" rotation="-32" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="503" a_damp="-0.1" y="385" width="50" rotation="27" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="499" a_damp="-0.1" y="410" width="50" rotation="-34" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="495" a_damp="-0.1" y="393" width="50" rotation="10" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="527" a_damp="-0.1" y="461" width="86" rotation="62" height="48" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="673" a_damp="-0.1" y="427" width="300" l_damp="-0.1" height="110" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="687" a_damp="-0.1" y="38" width="50" rotation="-110" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="687" a_damp="-0.1" y="126" width="60" rotation="-116" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="684" a_damp="-0.1" y="78" width="50" rotation="-56" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="521" a_damp="-0.1" y="-4" width="88" rotation="-4" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="596" a_damp="-0.1" y="-15" width="88" rotation="-12" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="678" a_damp="-0.1" y="0" width="88" rotation="-141" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="198" a_damp="-0.1" y="7" width="87" rotation="-4" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="117" a_damp="-0.1" y="6" width="87" rotation="5" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="64" a_damp="-0.1" y="10" width="87" rotation="-6" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="37" a_damp="-0.1" y="24" width="87" rotation="-20" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="232" a_damp="-0.1" y="27" width="20" rotation="56" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="674" a_damp="-0.1" y="149" width="20" rotation="95" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="dragLimit" density="1" x="24" y="96" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit" density="1" x="661" y="96" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="343" y="516" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gRocket05" density="1" x="381" y="91" width="70" l_damp="undefined" height="91" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gRocket05" density="1" x="307" y="91" width="70" l_damp="undefined" height="91" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="cannon" x="585" a_damp="-0.1" y="321" width="141" l_damp="-0.1" height="100" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="339" y="362" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="cannon" x="97" a_damp="-0.1" y="230" width="141" l_damp="-0.1" height="100" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" density="1" x="193" y="97" width="320" l_damp="undefined" height="5" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" density="1" x="488" y="97" width="320" l_damp="undefined" height="5" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="statObj_9" x="88" y="373" width="123" l_damp="undefined" height="99" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 9_" yKonstruktor="143">
				<bodies>
				  <body name="t_pesok" x="358" a_damp="-0.1" y="95" width="612" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="570" a_damp="-0.1" y="59" width="92" rotation="-3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="580" l_damp="-0.1" y="139" width="92" rotation="3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="358" a_damp="-0.1" y="62" width="612" l_damp="-0.1" height="30" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="619" l_damp="-0.1" y="140" width="92" rotation="6" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="617" a_damp="-0.1" y="57" width="92" rotation="-6" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="147" l_damp="-0.1" y="139" width="92" rotation="-3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="145" a_damp="-0.1" y="59" width="92" rotation="3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="103" a_damp="-0.1" y="57" width="92" rotation="6" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="103" l_damp="-0.1" y="141" width="92" rotation="-6" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="358" a_damp="-0.1" y="132" width="612" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="676" a_damp="-0.1" y="182" width="62" rotation="-104" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="660" a_damp="-0.1" y="148" width="10" rotation="29" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="672" a_damp="-0.1" y="42" width="44" rotation="-29" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="674" a_damp="-0.1" y="18" width="44" rotation="-73" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="683" a_damp="-0.1" y="96" width="50" l_damp="-0.1" height="134" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="45" a_damp="-0.1" y="42" width="44" rotation="29" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="60" a_damp="-0.1" y="150" width="10" rotation="-29" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="2" a_damp="-0.1" y="90" width="135" rotation="90" height="114" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="18" a_damp="-0.1" y="18" width="52" rotation="73" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="679" a_damp="-0.1" y="208" width="62" rotation="-86" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="682" a_damp="-0.1" y="265" width="62" rotation="-99" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="686" a_damp="-0.1" y="295" width="62" rotation="-82" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="686" a_damp="-0.1" y="348" width="62" rotation="-99" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="688" a_damp="-0.1" y="392" width="62" rotation="-83" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="677" a_damp="-0.1" y="441" width="62" rotation="-69" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="18" a_damp="-0.1" y="183" width="76" rotation="-70" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="5" a_damp="-0.1" y="238" width="76" rotation="-80" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="0" a_damp="-0.1" y="289" width="76" rotation="-103" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="5" a_damp="-0.1" y="353" width="76" rotation="-86" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-6" a_damp="-0.1" y="421" width="76" rotation="-76" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="bCactus31" density="1" x="350" a_damp="-0.1" y="30" width="35" l_damp="-0.1" height="35" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bBox01" x="619" a_damp="-0.1" y="360" width="77" l_damp="-0.1" height="69" strength="0.1" friction="1" restitution="0.2"/>
				  <body name="hero" density="1" x="172" y="528" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBat01" density="1" x="171" a_damp="-0.1" y="246" width="115" l_damp="0" height="87" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="166" y="343" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bBox01" x="525" a_damp="-0.1" y="360" width="77" l_damp="-0.1" height="69" strength="0.1" friction="1" restitution="0.2"/>
				  <body name="metalPalka" density="1" x="495" a_damp="-0.1" y="315" width="14" l_damp="-0.1" height="14" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bCage01" strength="0.2" rotation="180" density="2" friction="0.5" restitution="0.2" x="570" y="246" width="168" l_damp="-0.1" height="165" a_damp="-0.1"/>
				  <body name="metalPalka" strength="0.2" rotation="118" density="1" friction="0.5" restitution="0.4" x="437" y="139" width="25" l_damp="-0.1" height="165" a_damp="-0.1"/>
				  <body name="star" x="408" y="29" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint" density="1" x="497" a_damp="0" y="173" width="10" l_damp="0" height="10" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="496" y="315" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="holePes" x="367" a_damp="-0.1" y="105" width="25" rotation="-64" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="376" a_damp="-0.1" y="110" width="26" rotation="-64" height="46" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="389" a_damp="-0.1" y="117" width="28" rotation="-64" height="46" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="401" a_damp="-0.1" y="123" width="28" rotation="-64" height="46" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="426" l_damp="-0.1" y="134" width="26" rotation="-64" height="46" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="439" l_damp="-0.1" y="140" width="26" rotation="-64" height="46" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="452" l_damp="-0.1" y="146" width="26" rotation="-64" height="46" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="466" l_damp="-0.1" y="152" width="26" rotation="-64" height="46" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="479" l_damp="-0.1" y="158" width="26" rotation="-64" height="46" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="414" a_damp="-0.1" y="130" width="28" rotation="-64" height="46" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="434" l_damp="-0.1" y="146" width="26" rotation="-64" height="46" a_damp="-0.1" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="12" nameLevel="Level 10_" yKonstruktor="141">
				<bodies>
				  <body name="t_pol" x="629" a_damp="-0.1" y="429" width="74" rotation="-15" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="620" a_damp="-0.1" y="372" width="74" rotation="-3" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="751" y="209" width="250" l_damp="-0.1" height="510" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="405" a_damp="-0.1" y="462" width="40" rotation="-78" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="411" a_damp="-0.1" y="422" width="40" rotation="-84" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="412" a_damp="-0.1" y="409" width="40" rotation="-101" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="410" a_damp="-0.1" y="373" width="40" rotation="-84" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="293" a_damp="-0.1" y="467" width="40" rotation="78" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="286" a_damp="-0.1" y="428" width="40" rotation="84" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="284" a_damp="-0.1" y="406" width="40" rotation="101" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="286" a_damp="-0.1" y="371" width="40" rotation="84" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="454" a_damp="-0.1" y="474" width="40" rotation="-108" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="436" a_damp="-0.1" y="446" width="40" rotation="-130" height="32" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="427" a_damp="-0.1" y="411" width="40" rotation="-96" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="420" a_damp="-0.1" y="374" width="40" rotation="-104" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="247" a_damp="-0.1" y="465" width="40" rotation="130" height="28" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="261" a_damp="-0.1" y="441" width="40" rotation="115" height="28" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="268" a_damp="-0.1" y="409" width="40" rotation="96" height="28" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="275" a_damp="-0.1" y="374" width="40" rotation="104" height="28" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="282" a_damp="-0.1" y="450" width="30" l_damp="-0.1" height="200" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="612" a_damp="-0.1" y="128" width="119" rotation="9" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="595" a_damp="-0.1" y="94" width="74" rotation="40" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="551" a_damp="-0.1" y="113" width="30" rotation="-63" height="26" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="534" a_damp="-0.1" y="133" width="38" rotation="-37" height="33" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="508" a_damp="-0.1" y="140" width="20" rotation="-12" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="490" a_damp="-0.1" y="143" width="20" rotation="-25" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="518" y="150" width="80" l_damp="-0.1" height="18" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="163" a_damp="-0.1" y="150" width="80" l_damp="-0.1" height="18" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="173" a_damp="-0.1" y="140" width="20" rotation="12" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="190" a_damp="-0.1" y="143" width="20" rotation="25" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="150" a_damp="-0.1" y="132" width="38" rotation="37" height="33" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="137" a_damp="-0.1" y="112" width="30" rotation="63" height="26" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="414" y="451" width="30" l_damp="-0.1" height="200" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="613" a_damp="-0.1" y="231" width="74" rotation="-7" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="610" a_damp="-0.1" y="285" width="74" rotation="12" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="611" a_damp="-0.1" y="332" width="74" rotation="-15" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="83" a_damp="-0.1" y="274" width="74" rotation="71" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="599" a_damp="-0.1" y="-6" width="74" rotation="-27" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="611" a_damp="-0.1" y="46" width="74" rotation="11" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="612" a_damp="-0.1" y="180" width="74" rotation="-11" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="123" a_damp="-0.1" y="6" width="74" rotation="124" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="103" a_damp="-0.1" y="65" width="74" rotation="73" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="105" a_damp="-0.1" y="120" width="74" rotation="103" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="98" a_damp="-0.1" y="150" width="74" rotation="89" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="91" l_damp="-0.1" y="214" width="74" rotation="105" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="85" a_damp="-0.1" y="326" width="74" rotation="104" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="80" a_damp="-0.1" y="354" width="74" rotation="63" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="85" a_damp="-0.1" y="398" width="74" rotation="105" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-16" a_damp="-0.1" y="252" width="250" l_damp="-0.1" height="510" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="566" l_damp="-0.1" y="-159" width="95" rotation="-21" height="100" a_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="345" a_damp="-0.1" y="529" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_4" density="1" x="108" y="174" width="74" l_damp="undefined" height="62" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="statObj_2" density="1" x="575" a_damp="-0.1" y="173" width="69" l_damp="-0.1" height="63" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="110" a_damp="-0.1" y="173" width="92" l_damp="-0.1" height="94" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="344" a_damp="-0.1" y="380" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				  <body name="t_doska4" x="230" a_damp="-0.1" y="218" width="86" l_damp="-0.1" height="16" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="t_doska4" x="462" a_damp="-0.1" y="220" width="96" l_damp="-0.1" height="16" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox02_5" x="340" a_damp="-0.1" y="80" width="148" l_damp="-0.1" height="33" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="575" a_damp="-0.1" y="172" width="92" l_damp="-0.1" height="94" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="59" density="1" friction="0.5" restitution="0.1" x="302" y="62" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="318" a_damp="-0.1" y="62" width="31" rotation="59" height="33" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="340" a_damp="-0.1" y="62" width="29" rotation="59" height="31" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="36" density="1" friction="0.5" restitution="0.1" x="379" y="47" width="33" l_damp="-0.1" height="35" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="59" density="1" friction="0.5" restitution="0.1" x="383" y="62" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="59" density="1" friction="0.5" restitution="0.1" x="364" y="62" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bBar01" density="1" x="240" a_damp="6.4" y="173" width="214" l_damp="0" height="29" strength="0.1" friction="2" restitution="0.2"/>
				  <body name="bBar01" density="1" x="448" a_damp="0" y="173" width="214" l_damp="-6.5" height="29" strength="0.1" friction="2" restitution="0.2"/>
				  <body name="gBad06_2" density="1" x="267" a_damp="-0.1" y="326" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="gBad06_3" density="1" x="428" y="320" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="36" density="1" friction="0.5" restitution="0.1" x="314" y="47" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="star" x="517" y="36" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 11_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pesok" x="632" a_damp="-0.1" y="298" width="70" rotation="47" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="105" a_damp="-0.1" y="259" width="50" rotation="-35" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="140" a_damp="-0.1" y="253" width="50" rotation="-13" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="541" a_damp="-0.1" y="206" width="50" rotation="-9" height="14" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="635" a_damp="-0.1" y="276" width="62" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="588" a_damp="-0.1" y="265" width="50" rotation="31" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="658" a_damp="-0.1" y="192" width="34" rotation="-38" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="620" a_damp="-0.1" y="205" width="50" rotation="-13" height="24" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="589" y="202" width="50" l_damp="-0.1" height="14" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="41" a_damp="-0.1" y="278" width="44" l_damp="-0.1" height="48" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="57" a_damp="-0.1" y="204" width="50" rotation="13" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="29" a_damp="-0.1" y="191" width="34" rotation="38" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="140" a_damp="-0.1" y="207" width="50" rotation="13" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="94" a_damp="-0.1" y="202" width="50" l_damp="-0.1" height="14" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="88" a_damp="-0.1" y="224" width="146" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="591" y="224" width="146" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="587" y="249" width="146" l_damp="-0.1" height="18" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="67" a_damp="-0.1" y="275" width="38" rotation="-25" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="89" a_damp="-0.1" y="248" width="146" l_damp="-0.1" height="22" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="50" a_damp="-0.1" y="302" width="57" rotation="-43" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="547" a_damp="-0.1" y="255" width="50" rotation="13" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="179" a_damp="-0.1" y="253" width="30" rotation="-47" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="164" a_damp="-0.1" y="248" width="40" rotation="-18" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="627" a_damp="-0.1" y="367" width="100" rotation="-19" height="65" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="459" a_damp="-0.1" y="413" width="100" rotation="-9" height="65" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="533" a_damp="-0.1" y="396" width="100" rotation="-15" height="65" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="453" a_damp="-0.1" y="478" width="75" rotation="-102" height="65" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="519" y="229" width="40" l_damp="-0.1" height="22" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="530" a_damp="-0.1" y="253" width="14" rotation="-24" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="655" a_damp="-0.1" y="344" width="96" rotation="-36" height="61" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="699" l_damp="-0.1" y="165" width="89" rotation="128" height="67" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-7" a_damp="-0.1" y="334" width="89" rotation="128" height="67" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="513" a_damp="-0.1" y="453" width="80" l_damp="-0.1" height="50" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="-4" a_damp="-0.1" y="434" width="89" rotation="75" height="67" strength="0.2" friction="0.75" l_damp="-0.1"/>
				  <body name="t_pol" x="758" a_damp="-0.1" y="293" width="200" rotation="90" height="200" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="85" a_damp="-0.1" y="-33" width="69" rotation="-66" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="6" a_damp="-0.1" y="131" width="89" rotation="115" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="34" a_damp="-0.1" y="62" width="69" rotation="109" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="54" a_damp="-0.1" y="18" width="69" rotation="128" height="67" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="767" l_damp="-0.1" y="102" width="200" rotation="87" height="200" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="743" a_damp="-0.1" y="24" width="200" rotation="87" height="200" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="667" a_damp="-0.1" y="151" width="30" rotation="-8" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="669" a_damp="-0.1" y="304" width="30" rotation="8" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="669" a_damp="-0.1" y="168" width="30" rotation="2" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="670" a_damp="-0.1" y="213" width="30" rotation="-9" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-3" a_damp="-0.1" y="273" width="89" rotation="83" height="67" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-75" a_damp="-0.1" y="248" width="200" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="-19" a_damp="-0.1" y="180" width="89" rotation="-151" height="67" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="19" a_damp="-0.1" y="159" width="30" rotation="83" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="149" a_damp="-0.1" y="202" width="14" rotation="-30" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="164" a_damp="-0.1" y="210" width="40" rotation="18" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="160" a_damp="-0.1" y="229" width="40" l_damp="-0.1" height="22" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="148" a_damp="-0.1" y="257" width="14" rotation="30" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="515" a_damp="-0.1" y="246" width="40" rotation="18" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="515" a_damp="-0.1" y="210" width="40" rotation="-18" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="531" l_damp="-0.1" y="202" width="14" rotation="30" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="649" l_damp="-0.1" y="372" width="89" rotation="-151" height="67" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="644" a_damp="-0.1" y="477" width="200" l_damp="-0.1" height="200" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="167" a_damp="-0.1" y="257" width="30" rotation="9" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="167" a_damp="-0.1" y="202" width="30" rotation="-9" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="179" a_damp="-0.1" y="206" width="30" rotation="47" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="bAcidCloud01" density="1" x="338" y="68" width="176" l_damp="undefined" height="99" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="statObj_3" x="188" a_damp="-0.1" y="230" width="75" l_damp="-0.1" height="60" mirrorShape="1" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_3" x="496" a_damp="-0.1" y="230" width="75" l_damp="-0.1" height="60" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="rev" x="495" a_damp="-0.1" y="228" width="79" l_damp="-0.1" height="79" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="345" y="356" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bWheel01" density="2.8" x="96" y="154" width="86" l_damp="-0.1" height="86" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bWheel01" density="10" x="589" a_damp="-0.1" y="155" width="86" l_damp="-0.1" height="86" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="rev" x="188" a_damp="-0.1" y="228" width="79" l_damp="-0.1" height="79" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_13" x="552" a_damp="-0.1" y="407" width="122" rotation="-8" height="78" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bBar02" density="5" x="425" a_damp="1.6" y="229" width="171" l_damp="-1.6" height="26" strength="0.1" friction="0.2" restitution="0.2"/>
				  <body name="bBar02_2" density="5" x="260" a_damp="1.6" y="229" width="171" l_damp="-1.6" height="26" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes01_5" x="27" a_damp="-0.1" y="378" width="50" rotation="-90" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_3" x="39" a_damp="-0.1" y="458" width="88" rotation="-105" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="hero" density="1" x="363" y="521" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="star" x="368" y="199" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="394" nameLevel="Level 12_" yKonstruktor="39">
				<bodies>
				  <body name="t_pol" x="597" a_damp="-0.1" y="36" width="30" rotation="-139" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="628" a_damp="-0.1" y="17" width="104" rotation="-38" height="112" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="573" a_damp="-0.1" y="18" width="30" rotation="-148" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="8" width="30" rotation="-106" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="678" a_damp="-0.1" y="126" width="24" rotation="-29" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="676" a_damp="-0.1" y="192" width="24" rotation="13" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="666" a_damp="-0.1" y="215" width="24" rotation="45" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="36" a_damp="-0.1" y="22" width="74" rotation="60" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="44" a_damp="-0.1" y="65" width="74" rotation="10" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="331" a_damp="-0.1" y="444" width="38" rotation="30" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="258" a_damp="-0.1" y="444" width="20" rotation="-32" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="313" l_damp="-0.1" y="597" width="300" rotation="90" height="130" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="253" a_damp="-0.1" y="420" width="20" rotation="-2" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="434" a_damp="-0.1" y="414" width="34" rotation="40" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="362" a_damp="-0.1" y="404" width="20" rotation="-28" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="357" a_damp="-0.1" y="370" width="20" rotation="-4" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="358" l_damp="-0.1" y="398" width="20" rotation="-2" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="415" l_damp="-0.1" y="559" width="300" rotation="90" height="130" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="439" a_damp="-0.1" y="378" width="28" rotation="4" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="653" a_damp="-0.1" y="364" width="300" rotation="90" height="130" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="453" y="365" width="20" l_damp="-0.1" height="200" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="457" l_damp="-0.1" y="282" width="20" rotation="-12" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="465" a_damp="-0.1" y="336" width="20" rotation="-2" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="461" l_damp="-0.1" y="310" width="20" rotation="-3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="604" a_damp="-0.1" y="242" width="58" rotation="29" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="583" a_damp="-0.1" y="256" width="58" rotation="59" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="572" a_damp="-0.1" y="267" width="58" rotation="32" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="283" width="58" rotation="8" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="565" a_damp="-0.1" y="307" width="58" rotation="-3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="562" a_damp="-0.1" y="361" width="58" rotation="18" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="565" a_damp="-0.1" y="334" width="58" rotation="1" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="528" a_damp="-0.1" y="379" width="20" rotation="53" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="484" a_damp="-0.1" y="380" width="20" rotation="-53" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="469" a_damp="-0.1" y="365" width="20" rotation="-15" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="525" l_damp="-0.1" y="526" width="300" rotation="90" height="130" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="436" l_damp="-0.1" y="361" width="20" rotation="-2" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="465" l_damp="-0.1" y="384" width="20" rotation="8" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="462" l_damp="-0.1" y="414" width="29" rotation="-13" height="45" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="447" l_damp="-0.1" y="292" width="20" rotation="12" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="442" l_damp="-0.1" y="317" width="20" rotation="20" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="355" l_damp="-0.1" y="319" width="20" rotation="-12" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="359" l_damp="-0.1" y="347" width="20" rotation="-3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="345" l_damp="-0.1" y="329" width="20" rotation="12" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="340" l_damp="-0.1" y="354" width="20" rotation="20" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="333" l_damp="-0.1" y="398" width="20" rotation="-2" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="334" l_damp="-0.1" y="415" width="28" rotation="9" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="351" y="402" width="20" l_damp="-0.1" height="200" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="248" a_damp="-0.1" y="369" width="20" rotation="-12" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="252" a_damp="-0.1" y="397" width="20" rotation="-3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="238" a_damp="-0.1" y="379" width="20" rotation="12" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="233" a_damp="-0.1" y="404" width="20" rotation="20" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="226" a_damp="-0.1" y="448" width="20" rotation="-2" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="244" a_damp="-0.1" y="452" width="20" l_damp="-0.1" height="200" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="673" a_damp="-0.1" y="82" width="74" rotation="-57" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="40" a_damp="-0.1" y="113" width="74" rotation="4" height="72" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="38" a_damp="-0.1" y="171" width="74" rotation="-2" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="619" a_damp="-0.1" y="739" width="20" rotation="-19" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="694" y="251" width="50" l_damp="-0.1" height="500" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="34" a_damp="-0.1" y="348" width="74" rotation="93" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="31" l_damp="-0.1" y="418" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="29" l_damp="-0.1" y="433" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="36" a_damp="-0.1" y="280" width="74" rotation="83" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="39" a_damp="-0.1" y="230" width="74" rotation="96" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-3" a_damp="-0.1" y="251" width="50" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="695" l_damp="-0.1" y="272" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="694" l_damp="-0.1" y="334" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="695" a_damp="-0.1" y="439" width="74" rotation="-97" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="696" a_damp="-0.1" y="375" width="74" rotation="-81" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="150" a_damp="-0.1" y="526" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="154" a_damp="-0.1" y="315" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				  <body name="bRocketBg01" x="397" l_damp="-0.1" y="354" width="41" rotation="90" height="87" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="t_shap" x="453" a_damp="-0.1" y="270" width="22" l_damp="-0.1" height="20" strength="0.1" friction="0.5"/>
				  <body name="t_shap" x="351" y="307" width="22" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_shap" x="244" y="356" width="22" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="bRocketBg01" x="290" a_damp="-0.1" y="388" width="41" rotation="90" height="87" strength="0.2" friction="0.5" l_damp="-0.1" restitution="0.2"/>
				  <body name="bRocket01" strength="0.2" rotation="-90" density="1" friction="0.5" restitution="0.2" x="290" y="389" width="94" l_damp="-0.1" height="42" a_damp="-0.1"/>
				  <body name="bRocket01" strength="0.1" rotation="-90" density="1" friction="0.5" restitution="0.2" x="397" y="355" width="94" l_damp="-0.1" height="42" a_damp="-0.1"/>
				  <body name="bRocketBg01" x="505" l_damp="-0.1" y="321" width="41" rotation="90" height="87" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bRocket01" strength="0.1" rotation="-90" density="1" friction="0.5" restitution="0.2" x="504" y="322" width="94" l_damp="-0.1" height="42" a_damp="-0.1"/>
				  <body name="bCactusGround02" x="624" a_damp="-0.1" y="201" width="48" l_damp="-0.1" height="28" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="gCactusA01" x="622" a_damp="-0.1" y="154" width="57" l_damp="-0.1" height="75" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 13_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pol" x="143" a_damp="-0.1" y="458" width="38" rotation="-24" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="139" a_damp="-0.1" y="424" width="30" rotation="-6" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="132" a_damp="-0.1" y="388" width="30" rotation="-17" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="118" a_damp="-0.1" y="356" width="30" rotation="-32" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="96" a_damp="-0.1" y="335" width="30" rotation="-60" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="113" a_damp="-0.1" y="68" width="30" rotation="-87" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="248" a_damp="-0.1" y="64" width="30" rotation="-76" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="284" a_damp="-0.1" y="67" width="30" rotation="-105" height="32" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="224" a_damp="-0.1" y="69" width="30" rotation="-99" height="59" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="67" a_damp="-0.1" y="68" width="30" rotation="-95" height="40" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="31" a_damp="-0.1" y="79" width="30" rotation="-117" height="40" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="14" a_damp="-0.1" y="106" width="30" rotation="-156" height="40" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-4" a_damp="-0.1" y="180" width="52" rotation="-2" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-3" a_damp="-0.1" y="217" width="48" rotation="7" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-1" a_damp="-0.1" y="245" width="48" rotation="-7" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="7" a_damp="-0.1" y="277" width="48" rotation="-18" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="26" a_damp="-0.1" y="310" width="48" rotation="-40" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="63" a_damp="-0.1" y="320" width="30" rotation="-73" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="448" a_damp="-0.1" y="-6" width="30" rotation="-130" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="462" a_damp="-0.1" y="10" width="52" rotation="78" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="670" a_damp="-0.1" y="55" width="52" l_damp="-0.1" height="46" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="639" a_damp="-0.1" y="86" width="52" rotation="61" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="637" a_damp="-0.1" y="41" width="52" rotation="-61" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="663" a_damp="-0.1" y="117" width="74" rotation="-61" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="671" a_damp="-0.1" y="155" width="74" rotation="-47" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="97" width="242" l_damp="-0.1" height="18" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="596" a_damp="-0.1" y="5" width="72" rotation="90" height="300" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="150" a_damp="-0.1" y="29" width="98" rotation="90" height="300" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="289" a_damp="-0.1" y="11" width="30" rotation="-98" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="287" a_damp="-0.1" y="31" width="30" rotation="-73" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-15" a_damp="-0.1" y="251" width="50" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="619" a_damp="-0.1" y="739" width="20" rotation="-19" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="694" y="251" width="50" l_damp="-0.1" height="500" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="700" a_damp="-0.1" y="190" width="74" rotation="-37" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="694" l_damp="-0.1" y="211" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="695" l_damp="-0.1" y="272" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="694" l_damp="-0.1" y="334" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="695" a_damp="-0.1" y="439" width="74" rotation="-97" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="696" a_damp="-0.1" y="375" width="74" rotation="-81" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-66" a_damp="-0.1" y="412" width="178" rotation="90" height="310" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="101" a_damp="-0.1" y="410" width="52" l_damp="-0.1" height="126" strength="0.1" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="picStat_2" density="1" x="190" y="143" width="320" l_damp="undefined" height="5" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit" density="1" x="12" y="142" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" density="1" x="480" y="65" width="320" l_damp="undefined" height="5" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" density="1" x="509" y="143" width="320" l_damp="undefined" height="5" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gBad06_4" density="1" x="509" y="381" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBox03" x="503" a_damp="-0.1" y="273" width="107" rotation="-133" height="66" strength="0.1" friction="1" l_damp="-0.1" restitution="0.2"/>
				  <body name="bBox03" x="560" a_damp="-0.1" y="244" width="102" rotation="46" height="62" strength="0.1" friction="0.5" l_damp="-0.1" restitution="0.2"/>
				  <body name="t_doska4" strength="0.2" rotation="90" density="1" friction="0.5" restitution="0.2" x="461" y="313" width="30" l_damp="-0.1" height="16" a_damp="-0.1"/>
				  <body name="t_doska4" density="1" x="560" l_damp="-0.1" y="316" width="30" rotation="90" height="16" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox03" x="319" a_damp="-0.1" y="244" width="102" rotation="46" height="62" strength="0.1" friction="0.5" l_damp="-0.1" restitution="0.2"/>
				  <body name="gBad06_5" density="1" x="270" y="381" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_doska4" density="1" x="218" l_damp="-0.1" y="313" width="30" rotation="90" height="16" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="t_doska4" density="1" x="320" l_damp="-0.1" y="313" width="30" rotation="90" height="16" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="386" a_damp="-0.1" y="529" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="383" a_damp="-0.1" y="360" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				  <body name="bDragb9" density="1" x="40" y="133" width="107" l_damp="undefined" height="51" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bDragb10" density="1" x="144" y="134" width="107" l_damp="undefined" height="52" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gykffkhj" x="248" a_damp="-0.1" y="63" width="160" l_damp="-0.1" height="14" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox03" x="263" a_damp="-0.1" y="273" width="107" rotation="-133" height="66" strength="0.1" friction="1" l_damp="-0.1" restitution="0.2"/>
				  <body name="dragLimit" density="1" x="632" y="142" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bDrag09" density="1" x="390" y="65" width="109" l_damp="undefined" height="42" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit2" density="1" x="621" y="64" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="104" density="1" friction="0.5" restitution="0.8" x="261" y="216" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="66" density="1" friction="0.5" restitution="0.8" x="283" y="217" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.8" x="303" y="216" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.8" x="292" y="206" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.8" x="315" y="206" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.8" x="326" y="215" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="500" l_damp="-0.1" y="218" width="31" rotation="104" height="33" a_damp="-0.1" friction="0.5" restitution="0.8"/>
				  <body name="bCactus01" density="1" x="522" l_damp="-0.1" y="219" width="31" rotation="66" height="33" a_damp="-0.1" friction="0.5" restitution="0.8"/>
				  <body name="bCactus01" density="1" x="542" l_damp="-0.1" y="218" width="31" rotation="66" height="33" a_damp="-0.1" friction="0.5" restitution="0.8"/>
				  <body name="bCactus01" density="1" x="531" l_damp="-0.1" y="208" width="31" rotation="66" height="33" a_damp="-0.1" friction="0.5" restitution="0.8"/>
				  <body name="bCactus01" density="1" x="554" l_damp="-0.1" y="208" width="31" rotation="66" height="33" a_damp="-0.1" friction="0.5" restitution="0.8"/>
				  <body name="bCactus01" density="1" x="565" l_damp="-0.1" y="217" width="31" rotation="66" height="33" a_damp="-0.1" friction="0.5" restitution="0.8"/>
				  <body name="bSpikes01_3" x="90" a_damp="-0.1" y="85" width="88" rotation="2" height="24" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_4" x="33" a_damp="-0.1" y="101" width="24" rotation="-56" height="23" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_4" x="605" y="107" width="24" l_damp="-0.1" height="23" a_damp="-0.1" friction="0.5"/>
				  <body name="bSpikes01_3" x="520" y="106" width="88" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="bSpikes01_4" x="461" a_damp="-0.1" y="106" width="24" l_damp="-0.1" height="23" strength="0.1" friction="0.5"/>
				  <body name="bSpikes01_4" x="579" y="107" width="24" l_damp="-0.1" height="23" a_damp="-0.1" friction="0.5"/>
				  <body name="butnPress" x="171" a_damp="-0.1" y="86" width="66" l_damp="-0.1" height="43" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes01_5" x="233" a_damp="-0.1" y="85" width="50" rotation="-5" height="23" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_4" x="272" a_damp="-0.1" y="86" width="24" rotation="5" height="23" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="dragLimit2" density="1" x="312" y="63" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="star" x="142" y="173" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 14_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pol" x="37" a_damp="-0.1" y="24" width="87" rotation="-20" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="64" a_damp="-0.1" y="10" width="87" rotation="-6" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="117" a_damp="-0.1" y="6" width="87" rotation="5" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="198" a_damp="-0.1" y="7" width="87" rotation="-4" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="678" a_damp="-0.1" y="0" width="88" rotation="-141" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="596" a_damp="-0.1" y="-15" width="88" rotation="-12" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="521" a_damp="-0.1" y="-4" width="88" rotation="-4" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="687" a_damp="-0.1" y="38" width="50" rotation="-110" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="527" a_damp="-0.1" y="461" width="86" rotation="62" height="48" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="705" a_damp="-0.1" y="256" width="50" rotation="-96" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="698" a_damp="-0.1" y="210" width="50" rotation="-100" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="696" a_damp="-0.1" y="170" width="50" rotation="-85" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="695" a_damp="-0.1" y="332" width="98" rotation="-77" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="237" a_damp="-0.1" y="-5" width="48" rotation="-52" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="477" a_damp="-0.1" y="-12" width="62" rotation="38" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-16" a_damp="-0.1" y="-17" width="87" rotation="7" height="300" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-14" a_damp="-0.1" y="197" width="56" rotation="2" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-15" a_damp="-0.1" y="148" width="50" rotation="78" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-12" a_damp="-0.1" y="244" width="50" rotation="-4" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-9" a_damp="-0.1" y="267" width="86" rotation="80" height="48" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-9" a_damp="-0.1" y="334" width="56" rotation="6" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="499" a_damp="-0.1" y="410" width="50" rotation="-34" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="673" a_damp="-0.1" y="427" width="300" l_damp="-0.1" height="110" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="495" a_damp="-0.1" y="393" width="50" rotation="10" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="503" a_damp="-0.1" y="385" width="50" rotation="27" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="491" a_damp="-0.1" y="364" width="15" rotation="-32" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="480" a_damp="-0.1" y="368" width="9" rotation="27" height="14" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="503" l_damp="-0.1" y="186" width="50" rotation="10" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="674" a_damp="-0.1" y="182" width="300" l_damp="-0.1" height="30" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="695" a_damp="-0.1" y="127" width="60" rotation="-102" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="694" a_damp="-0.1" y="84" width="50" rotation="-78" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="511" l_damp="-0.1" y="181" width="50" rotation="27" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="499" l_damp="-0.1" y="159" width="15" rotation="-32" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="488" l_damp="-0.1" y="162" width="9" rotation="27" height="14" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="506" a_damp="-0.1" y="194" width="50" rotation="-49" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="531" a_damp="-0.1" y="210" width="50" rotation="9" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="692" a_damp="-0.1" y="276" width="50" rotation="54" height="51" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="676" l_damp="-0.1" y="375" width="50" rotation="34" height="51" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="576" a_damp="-0.1" y="210" width="50" rotation="25" height="59" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="684" a_damp="-0.1" y="244" width="130" rotation="30" height="80" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="617" a_damp="-0.1" y="221" width="50" rotation="15" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-10" a_damp="-0.1" y="384" width="56" rotation="-6" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="12" a_damp="-0.1" y="433" width="56" rotation="-57" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="45" a_damp="-0.1" y="449" width="56" rotation="-93" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="108" a_damp="-0.1" y="458" width="56" rotation="-64" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="135" a_damp="-0.1" y="488" width="56" rotation="-20" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="343" y="516" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="339" y="362" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="dragLimit" density="1" x="87" y="430" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" strength="0.2" rotation="90" density="1" friction="0.5" restitution="0.2" x="87" y="220" width="391" l_damp="-0.1" height="5" a_damp="-0.1"/>
				  <body name="dragLimit" density="1" x="86" y="37" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bDrag01" strength="0.1" rotation="90" density="1" friction="0.5" restitution="0.2" x="87" y="220" width="124" l_damp="-0.1" height="37" a_damp="-0.1"/>
				  <body name="cannon" x="571" a_damp="-0.1" y="321" width="141" l_damp="-0.1" height="100" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="cannon2" density="1" x="86" a_damp="-0.1" y="220" width="110" l_damp="-0.1" height="76" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="cannon" x="584" y="116" width="141" l_damp="-0.1" height="100" mirrorShape="1" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="87" y="220" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="433" nameLevel="Level 15_" yKonstruktor="-300">
				<bodies>
				  <body name="t_pol" x="566" l_damp="-0.1" y="-159" width="95" rotation="-21" height="100" a_damp="-0.1"/>
				  <body name="t_pol" x="31" a_damp="-0.1" y="252" width="250" l_damp="-0.1" height="510" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="664" y="214" width="250" l_damp="-0.1" height="510" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="567" a_damp="-0.1" y="242" width="74" rotation="14" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="567" a_damp="-0.1" y="180" width="74" rotation="-11" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="567" a_damp="-0.1" y="128" width="74" rotation="9" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="564" a_damp="-0.1" y="100" width="74" rotation="-6" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="46" width="74" rotation="11" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="554" a_damp="-0.1" y="-6" width="74" rotation="-27" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="332" width="74" rotation="-15" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="566" a_damp="-0.1" y="387" width="74" rotation="10" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="563" a_damp="-0.1" y="442" width="74" rotation="-3" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="538" a_damp="-0.1" y="475" width="74" rotation="34" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="147" a_damp="-0.1" y="454" width="74" rotation="55" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="132" a_damp="-0.1" y="398" width="74" rotation="105" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="127" a_damp="-0.1" y="354" width="74" rotation="63" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="132" a_damp="-0.1" y="326" width="74" rotation="104" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="124" l_damp="-0.1" y="246" width="74" rotation="55" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="138" l_damp="-0.1" y="214" width="74" rotation="105" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="145" a_damp="-0.1" y="150" width="74" rotation="89" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="152" a_damp="-0.1" y="120" width="74" rotation="103" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="150" a_damp="-0.1" y="65" width="74" rotation="73" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="170" a_damp="-0.1" y="6" width="74" rotation="124" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="statObj_2" density="1" x="530" a_damp="-0.1" y="287" width="69" l_damp="-0.1" height="63" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="530" a_damp="-0.1" y="286" width="92" l_damp="-0.1" height="94" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox01" x="345" a_damp="-0.1" y="140" width="77" l_damp="-0.1" height="68" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="157" a_damp="-0.1" y="287" width="92" l_damp="-0.1" height="94" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_2" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="157" y="287" width="69" l_damp="-0.1" height="63" a_damp="-0.1"/>
				  <body name="bWheel01" density="1" x="341" a_damp="-0.1" y="63" width="101" l_damp="-0.1" height="100" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="345" a_damp="-0.1" y="529" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bWheel01" strength="0.2" rotation="-26" density="1" friction="0.5" restitution="0.2" x="345" y="256" width="101" l_damp="-0.1" height="100" a_damp="-0.1"/>
				  <body name="yLimit" x="347" a_damp="-0.1" y="338" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				  <body name="bBar01" density="5" x="205" a_damp="3.9" y="287" width="210" l_damp="-2.5" height="29" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBar01" density="5" x="486" a_damp="2.8" y="287" width="210" l_damp="-3.7" height="29" strength="0.1" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
					  <jopa yKonstruktor="220" alphaKonstruktor="" xL="0" yL="0" selectedType="Stat" numberLevel="0" xKonstruktor="3" nickLevel="Player" nameLevel="Level 16_" fon="1">
					    <bodies>
					      <body name="t_pol" x="668" strength="0.2" y="188" width="100" l_damp="-0.1" height="700" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="6" y="214" width="74" l_damp="-0.1" rotation="105" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="13" strength="0.2" y="150" width="74" l_damp="-0.1" rotation="89" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="12" strength="0.2" y="120" width="74" l_damp="-0.1" rotation="103" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="10" strength="0.2" y="65" width="74" l_damp="-0.1" rotation="73" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="14" strength="0.2" y="30" width="74" l_damp="-0.1" rotation="101" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="414" strength="0.2" y="461" width="55" l_damp="-0.1" rotation="-108" height="48" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="404" strength="0.2" y="424" width="40" l_damp="-0.1" rotation="-130" height="32" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="397" strength="0.2" y="393" width="40" l_damp="-0.1" rotation="-96" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="390" strength="0.2" y="356" width="40" l_damp="-0.1" rotation="-104" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="214" strength="0.1" y="459" width="55" l_damp="-0.1" rotation="130" height="48" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="228" strength="0.1" y="424" width="40" l_damp="-0.1" rotation="115" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="233" strength="0.1" y="390" width="40" l_damp="-0.1" rotation="96" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="239" strength="0.1" y="354" width="40" l_damp="-0.1" rotation="104" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="374" strength="0.2" y="380" width="40" l_damp="-0.1" rotation="123" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="253" strength="0.2" y="379" width="40" l_damp="-0.1" rotation="56" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="199" strength="0.2" y="6" width="50" l_damp="-0.1" rotation="-93" height="62" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="199" strength="0.2" y="37" width="34" l_damp="-0.1" rotation="-110" height="52" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="188" strength="0.2" y="50" width="34" l_damp="-0.1" rotation="-102" height="22" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="199" strength="0.2" y="64" width="34" l_damp="-0.1" rotation="-41" height="20" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="632" strength="0.2" y="283" width="74" l_damp="-0.1" rotation="9" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="615" strength="0.2" y="176" width="74" l_damp="-0.1" rotation="-31" height="80" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="423" strength="0.2" y="487" width="40" l_damp="-0.1" rotation="-108" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="318" strength="0.1" y="486" width="163" l_damp="-0.1" height="200" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="244" strength="0.2" y="361" width="60" l_damp="-0.1" rotation="90" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="384" strength="0.2" y="362" width="60" l_damp="-0.1" rotation="90" height="28" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="216" strength="0.2" y="82" width="36" l_damp="-0.1" rotation="-89" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="208" strength="0.2" y="87" width="36" l_damp="-0.1" rotation="-106" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="460" strength="0.2" y="75" width="98" l_damp="-0.1" rotation="-94" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="421" strength="0.2" y="106" width="36" l_damp="-0.1" rotation="-79" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="491" strength="0.2" y="-4" width="500" l_damp="-0.1" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="422" strength="0.2" y="85" width="36" l_damp="-0.1" rotation="-96" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="400" strength="0.2" y="32" width="36" l_damp="-0.1" rotation="-144" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="373" strength="0.2" y="17" width="36" l_damp="-0.1" rotation="-167" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="265" strength="0.2" y="16" width="36" l_damp="-0.1" rotation="-14" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="233" strength="0.2" y="40" width="36" l_damp="-0.1" rotation="-51" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="223" strength="0.2" y="63" width="36" l_damp="-0.1" rotation="-72" height="34" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="418" strength="0.2" y="57" width="64" l_damp="-0.1" rotation="-111" height="42" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="240" strength="0.2" y="16" width="36" l_damp="-0.1" rotation="-32" height="60" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="560" strength="0.2" y="71" width="148" l_damp="-0.1" rotation="-65" height="96" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="594" strength="0.2" y="108" width="110" l_damp="-0.1" rotation="-33" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="502" strength="0.2" y="74" width="102" l_damp="-0.1" rotation="-80" height="70" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="3" strength="0.2" y="449" width="74" l_damp="-0.1" rotation="82" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="1" strength="0.1" y="274" width="74" l_damp="-0.1" rotation="71" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="3" strength="0.2" y="326" width="74" l_damp="-0.1" rotation="104" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="-2" strength="0.2" y="354" width="74" l_damp="-0.1" rotation="63" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="3" strength="0.2" y="398" width="74" l_damp="-0.1" rotation="105" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="634" strength="0.2" y="387" width="74" l_damp="-0.1" rotation="10" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="631" strength="0.2" y="442" width="74" l_damp="-0.1" rotation="-3" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="634" strength="0.2" y="332" width="74" l_damp="-0.1" rotation="-15" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="622" strength="0.2" y="472" width="74" l_damp="-0.1" rotation="15" height="66" a_damp="-0.1" friction="0.5"/>
					      <body name="t_pol" x="566" y="-159" width="95" l_damp="-0.1" rotation="-21" height="100" a_damp="-0.1"/>
					      <body name="t_shap" x="-5" strength="0.1" y="-5" width="5" l_damp="" height="5" a_damp="" friction="0.5"/>
					      <body name="yLimit" x="491" strength="0.1" y="343" width="96" l_damp="-0.1" height="15" a_damp="-0.1" friction="0.5"/>
					      <body name="gFan01" x="314" strength="0.1" y="404" width="116" l_damp="3.3" rotation="90" height="111" a_damp="-0.1" friction="0.5"/>
					      <body name="bStone03" x="310" strength="0.2" y="166" width="110" l_damp="-0.1" density="3" height="60" a_damp="-0.1" friction="0.3"/>
					      <body name="gFan01" x="618" strength="0.1" y="243" width="116" l_damp="4" height="111" a_damp="-0.1" friction="0.5" restitution="0.2"/>
					      <body name="bSpikes01_4" x="393" strength="0.1" y="57" width="24" l_damp="-0.1" rotation="68" height="23" a_damp="-0.1" friction="0.5"/>
					      <body name="bSpikes01_4" x="403" strength="0.1" y="108" width="24" l_damp="-0.1" rotation="105" height="23" a_damp="-0.1" friction="0.5"/>
					      <body name="bSpikes01_4" x="402" strength="0.1" y="82" width="24" l_damp="-0.1" rotation="78" height="23" a_damp="-0.1" friction="0.5"/>
					      <body name="bSpikes01_3" x="317" y="32" width="88" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
					      <body name="bSpikes01_4" x="374" strength="0.1" y="38" width="24" l_damp="-0.1" rotation="18" height="23" a_damp="-0.1" friction="0.5"/>
					      <body name="bSpikes01_4" x="259" strength="0.2" y="40" width="24" l_damp="-0.1" rotation="-28" height="23" a_damp="-0.1" friction="0.5"/>
					      <body name="bSpikes01_4" x="242" strength="0.2" y="62" width="24" l_damp="-0.1" rotation="-67" height="23" a_damp="-0.1" friction="0.5"/>
					      <body name="bSpikes01_4" x="235" strength="0.2" y="88" width="24" l_damp="-0.1" rotation="-79" height="23" a_damp="-0.1" friction="0.5"/>
					      <body name="bBox01" x="314" strength="0.1" y="224" width="77" l_damp="-0.1" height="66" a_damp="-0.1" friction="0.5" restitution="0.2"/>
					      <body name="bBox01" x="314" strength="0.1" y="290" width="77" l_damp="-0.1" height="62" a_damp="-0.1" friction="0.4"/>
					      <body name="hero" x="495" strength="0.1" y="529" width="95" l_damp="-0.1" density="1" height="146" a_damp="-0.1" friction="0.5" restitution="0.2"/>
					      <body name="bAcidCloud01" x="317" strength="0.2" y="77" width="130" l_damp="-0.1" density="1" height="62" a_damp="-0.1" friction="0.5" restitution="0.2"/>
					      <body name="star" x="319" y="84" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
					      <body name="statObj_13" x="492" strength="0.2" y="67" width="115" l_damp="-0.1" height="80" a_damp="-0.1" friction="0.5"/>
					    </bodies>
					    <setting>
					      <core list="LLL" num="1"/>
					    </setting>
					  </jopa>
					</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="0" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 17_" yKonstruktor="-300" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pol" x="119" a_damp="-0.1" y="58" width="58" rotation="15" height="42" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="366" a_damp="-0.1" y="55" width="58" rotation="-15" height="42" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="113" l_damp="-0.1" y="62" width="58" rotation="-19" height="42" a_damp="-0.1" friction="0.1"/>
				  <body name="t_pol" x="316" a_damp="-0.1" y="49" width="58" rotation="-9" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="350" a_damp="-0.1" y="48" width="58" rotation="1" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="377" a_damp="-0.1" y="47" width="58" rotation="7" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="428" l_damp="-0.1" y="46" width="58" rotation="-9" height="42" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="440" a_damp="-0.1" y="45" width="58" rotation="-5" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="476" a_damp="-0.1" y="47" width="58" rotation="5" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="225" a_damp="-0.1" y="14" width="600" l_damp="-0.1" height="100" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="524" a_damp="-0.1" y="42" width="58" rotation="-19" height="42" strength="0.2" friction="0.1" l_damp="-0.1"/>
				  <body name="t_pol" x="538" a_damp="-0.1" y="14" width="58" rotation="-78" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="18" a_damp="-0.1" y="219" width="74" rotation="117" height="88" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="32" a_damp="-0.1" y="431" width="74" rotation="88" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="29" a_damp="-0.1" y="363" width="74" rotation="81" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="10" a_damp="-0.1" y="304" width="74" rotation="63" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="8" a_damp="-0.1" y="270" width="74" rotation="83" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="264" l_damp="-0.1" y="49" width="58" rotation="7" height="42" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="264" a_damp="-0.1" y="50" width="58" rotation="-6" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="213" a_damp="-0.1" y="49" width="58" rotation="9" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="185" a_damp="-0.1" y="52" width="58" rotation="-6" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="133" a_damp="-0.1" y="51" width="58" rotation="7" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="52" a_damp="-0.1" y="79" width="118" rotation="133" height="100" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="717" l_damp="-0.1" y="-5" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="716" l_damp="-0.1" y="59" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="717" l_damp="-0.1" y="120" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="716" l_damp="-0.1" y="182" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="717" a_damp="-0.1" y="287" width="74" rotation="-97" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="718" a_damp="-0.1" y="223" width="74" rotation="-81" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="559" l_damp="-0.1" y="448" width="196" rotation="90" height="10" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="557" a_damp="-0.1" y="479" width="196" rotation="90" height="10" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="569" a_damp="-0.1" y="409" width="196" rotation="90" height="10" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="548" a_damp="-0.1" y="452" width="48" rotation="-78" height="33" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="550" a_damp="-0.1" y="405" width="48" rotation="-81" height="19" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="719" l_damp="-0.1" y="299" width="74" rotation="-58" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="558" a_damp="-0.1" y="348" width="74" rotation="-75" height="10" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="671" a_damp="-0.1" y="408" width="200" rotation="90" height="42" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-8" a_damp="-0.1" y="148" width="74" rotation="89" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="bFanMega02" x="616" a_damp="-0.1" y="387" width="204" rotation="90" height="116" strength="0.2" friction="0.5" l_damp="-0.1" restitution="0.2"/>
				  <body name="bBox01" x="173" a_damp="-0.1" y="266" width="77" l_damp="-0.1" height="69" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox01" x="387" a_damp="-0.1" y="266" width="77" l_damp="-0.1" height="69" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="386" a_damp="-0.1" y="334" width="65" l_damp="-0.1" height="76" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="385" a_damp="-0.1" y="382" width="8" l_damp="-0.1" height="38" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="gBad06_4" density="1" x="169" y="384" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes01_3" x="191" y="74" width="88" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="bSpikes01_5" x="262" a_damp="-0.1" y="73" width="50" rotation="-5" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_5" x="314" a_damp="-0.1" y="72" width="50" rotation="1" height="23" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="gFan01" x="53" a_damp="-0.1" y="169" width="116" l_damp="3.5" height="111" mirrorShape="1" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bWheel01" density="5" x="388" a_damp="-0.1" y="199" width="80" l_damp="-0.1" height="80" strength="0.1" friction="0.5"/>
				  <body name="bWheel01" density="5" x="174" a_damp="-0.1" y="197" width="80" l_damp="-0.1" height="80" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="279" a_damp="-0.1" y="351" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				  <body name="bStone01" density="0.8" x="385" a_damp="-0.1" y="425" width="52" l_damp="-0.1" height="52" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="276" a_damp="-0.1" y="530" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="xdfths" strength="0.2" rotation="-10" density="0.3" friction="0.5" restitution="0.2" x="386" y="427" width="53" l_damp="-0.1" height="8" a_damp="-0.1"/>
				  <body name="star" x="249" y="108" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint_fixed" density="1" x="385" y="427" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="385" y="400" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
						  <jopa fon="1" nickLevel="Player" xL="0" selectedType="Stat" yL="0" numberLevel="0" alphaKonstruktor="" xKonstruktor="0" nameLevel="Level 18_" yKonstruktor="-300">
							<bodies>
							  <body name="t_pol" x="38" l_damp="-0.1" y="8" width="74" rotation="10" height="76" a_damp="-0.1" friction="0.5"/>
							  <body name="t_pol" x="645" a_damp="-0.1" y="414" width="74" rotation="-97" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="640" l_damp="-0.1" y="321" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
							  <body name="t_pol" x="646" a_damp="-0.1" y="350" width="74" rotation="-81" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="641" a_damp="-0.1" y="437" width="74" rotation="-81" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="638" l_damp="-0.1" y="242" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
							  <body name="t_pol" x="635" a_damp="-0.1" y="208" width="74" rotation="-110" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="627" a_damp="-0.1" y="151" width="74" rotation="-85" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="638" a_damp="-0.1" y="85" width="74" rotation="-76" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="678" y="245" width="50" l_damp="-0.1" height="500" a_damp="-0.1" friction="0.5"/>
							  <body name="t_pol" x="634" l_damp="-0.1" y="23" width="74" rotation="-110" height="66" a_damp="-0.1" friction="0.5"/>
							  <body name="t_pol" x="51" a_damp="-0.1" y="425" width="84" rotation="-81" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="54" a_damp="-0.1" y="355" width="74" rotation="93" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="-3" a_damp="-0.1" y="282" width="50" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
							  <body name="t_pol" x="33" a_damp="-0.1" y="213" width="74" rotation="-2" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="34" a_damp="-0.1" y="160" width="74" rotation="4" height="72" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="38" a_damp="-0.1" y="115" width="74" rotation="10" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="40" a_damp="-0.1" y="52" width="74" rotation="85" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="46" a_damp="-0.1" y="218" width="96" rotation="70" height="72" strength="0.1" friction="0.5" l_damp="-0.1"/>
							  <body name="t_pol" x="619" a_damp="-0.1" y="739" width="20" rotation="-19" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
							  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
							  <body name="yLimit" x="363" a_damp="-0.1" y="371" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
							  <body name="bSpikes02_01" density="1" x="211" a_damp="-0.1" y="266" width="7" l_damp="-0.1" height="68" strength="0.2" friction="0.5" restitution="0.2"/>
							  <body name="bSpikes02_01" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="237" y="264" width="7" l_damp="-0.1" height="68" a_damp="-0.1"/>
							  <body name="bSpikes02_02" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="224" y="302" width="18" l_damp="-0.1" height="8" a_damp="-0.1"/>
							  <body name="bSpikes02_01" density="1" x="237" l_damp="-0.1" y="110" width="7" rotation="180" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
							  <body name="bSpikes02_01" density="1" x="303" l_damp="-0.1" y="204" width="7" rotation="-90" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
							  <body name="bSpikes02_01" strength="0.2" rotation="90" density="1" friction="0.5" restitution="0.2" x="301" y="177" width="7" l_damp="-0.1" height="68" a_damp="-0.1"/>
							  <body name="bSpikes02_01" strength="0.2" rotation="-90" density="1" friction="0.5" restitution="0.2" x="149" y="203" width="7" l_damp="-0.1" height="68" a_damp="-0.1"/>
							  <body name="bSpikes02_02" strength="0.2" rotation="90" density="1" friction="0.5" restitution="0.2" x="339" y="191" width="18" l_damp="-0.1" height="8" a_damp="-0.1"/>
							  <body name="gFan01" x="61" a_damp="-0.1" y="280" width="116" l_damp="3" height="111" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
							  <body name="hero" density="1" x="354" a_damp="-0.1" y="525" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
							  <body name="mill2" density="1" x="465" a_damp="1" y="191" width="225" l_damp="-0.1" height="224" strength="0.1" friction="0.1" restitution="0.2"/>
							  <body name="bNails22" density="1" x="383" y="190" width="82" l_damp="undefined" height="47" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="bNails21" density="1" x="541" y="179" width="84" l_damp="undefined" height="27" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="bNails22" strength="0.1" rotation="90" density="1" friction="0.5" restitution="0.2" x="466" y="107" width="82" l_damp="-0.1" height="47" a_damp="1"/>
							  <body name="bNails21" strength="0.1" rotation="-90" density="1" friction="0.5" restitution="0.2" x="452" y="257" width="84" l_damp="-0.1" height="27" a_damp="1"/>
							  <body name="rev" density="1" x="628" a_damp="-0.1" y="279" width="90" l_damp="-0.1" height="89" strength="0.2" friction="0.5" restitution="0.2"/>
							  <body name="statObj_4" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="633" y="281" width="74" l_damp="-0.1" height="62" a_damp="-0.1"/>
							  <body name="mill" density="5" x="225" a_damp="3" y="191" width="224" l_damp="-0.1" height="226" strength="0.1" friction="0.2" restitution="0.2"/>
							  <body name="bCactus31" density="1" x="294" a_damp="2" y="137" width="33" l_damp="-0.1" height="34" strength="0.1" friction="0.5" restitution="0.2"/>
							  <body name="bCactus31" density="1" x="279" a_damp="3" y="161" width="33" l_damp="-0.1" height="34" strength="0.1" friction="0.5" restitution="0.2"/>
							  <body name="bCactus31" density="1" x="309" a_damp="3" y="159" width="33" l_damp="-0.1" height="34" strength="0.1" friction="0.5" restitution="0.2"/>
							  <body name="bCactus31" density="2" x="176" a_damp="2" y="166" width="33" l_damp="-0.1" height="34" strength="0.1" friction="0.5" restitution="0.2"/>
							  <body name="bCactus31" density="2.2" x="142" a_damp="2" y="166" width="33" l_damp="-0.1" height="34" strength="0.1" friction="0.5" restitution="0.2"/>
							  <body name="bBar01" density="10" x="655" a_damp="4.5" y="281" width="163" l_damp="0" height="23" strength="0.2" friction="0.5" restitution="0.2"/>
							  <body name="star" x="177" y="280" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
							  <body name="t_joint_fixed" density="1" x="215" y="263" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="234" y="263" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="225" y="298" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="305" y="201" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="234" y="118" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="148" y="201" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="305" a_damp="-0.1" y="181" width="5" l_damp="-0.1" height="5" strength="0.1" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="337" y="190" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="549" y="187" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="464" y="90" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="387" y="189" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_joint_fixed" density="1" x="459" y="263" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_revolute" density="1" x="225" y="191" width="15" l_damp="undefined" height="15" a_damp="undefined" friction="0.5" restitution="0.2"/>
							  <body name="t_revolute" strength="0.1" rotation="-2" density="1" friction="0.5" restitution="0.2" x="465" y="191" width="15" l_damp="-0.1" height="15" a_damp="-0.1"/>
							</bodies>
							<setting>
							  <core list="LLL" num="1"/>
							</setting>
						  </jopa>
						</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="-1" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 19_" yKonstruktor="47" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="389" a_damp="-0.1" y="321" width="60" rotation="12" height="10" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="352" a_damp="-0.1" y="301" width="178" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="346" a_damp="-0.1" y="269" width="178" l_damp="-0.1" height="32" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="340" a_damp="-0.1" y="225" width="178" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="287" a_damp="-0.1" y="134" width="60" rotation="8" height="10" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="390" a_damp="-0.1" y="134" width="60" rotation="-8" height="10" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="340" a_damp="-0.1" y="152" width="178" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="342" a_damp="-0.1" y="188" width="178" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="340" a_damp="-0.1" y="261" width="178" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="301" l_damp="-0.1" y="319" width="60" rotation="-8" height="10" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="439" a_damp="-0.1" y="340" width="50" rotation="-143" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="204" a_damp="-0.1" y="227" width="100" l_damp="-0.1" height="200" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="447" a_damp="-0.1" y="105" width="50" rotation="114" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="472" a_damp="-0.1" y="62" width="158" rotation="88" height="54" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="425" a_damp="-0.1" y="-5" width="50" rotation="47" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="185" a_damp="-0.1" y="395" width="50" rotation="99" height="48" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="230" a_damp="-0.1" y="58" width="50" rotation="105" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="80" a_damp="-0.1" y="243" width="200" l_damp="-0.1" height="500" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="594" a_damp="-0.1" y="210" width="200" l_damp="-0.1" height="500" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="202" a_damp="-0.1" y="87" width="186" rotation="80" height="88" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="245" a_damp="-0.1" y="7" width="60" rotation="122" height="44" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="202" a_damp="-0.1" y="344" width="72" rotation="125" height="58" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="179" a_damp="-0.1" y="439" width="50" rotation="115" height="34" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="445" a_damp="-0.1" y="21" width="50" rotation="66" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="504" a_damp="-0.1" y="431" width="50" rotation="-120" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="484" a_damp="-0.1" y="390" width="50" rotation="-114" height="48" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="252" a_damp="-0.1" y="250" width="34" rotation="82" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="247" a_damp="-0.1" y="145" width="50" rotation="102" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="251" a_damp="-0.1" y="171" width="50" rotation="78" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="252" a_damp="-0.1" y="217" width="50" rotation="99" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="226" a_damp="-0.1" y="116" width="50" rotation="55" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="449" a_damp="-0.1" y="127" width="50" rotation="147" height="36" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="442" a_damp="-0.1" y="169" width="50" rotation="120" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="433" l_damp="-0.1" y="147" width="50" rotation="78" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="426" l_damp="-0.1" y="256" width="50" rotation="82" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="426" l_damp="-0.1" y="211" width="50" rotation="99" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="479" a_damp="-0.1" y="230" width="100" l_damp="-0.1" height="208" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="475" a_damp="-0.1" y="332" width="83" rotation="-98" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="240" a_damp="-0.1" y="339" width="50" rotation="153" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="259" a_damp="-0.1" y="291" width="92" rotation="69" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="422" a_damp="-0.1" y="292" width="92" rotation="-69" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="341" a_damp="-0.1" y="524" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="263" a_damp="-0.1" y="104" width="29" l_damp="-0.1" height="31" strength="0.1" friction="0.2" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="-26" density="1" friction="0.2" restitution="0.2" x="249" y="93" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="111" density="1" friction="0.2" restitution="0.2" x="272" y="90" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="60" density="1" friction="0.2" restitution="0.2" x="284" y="97" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="60" density="1" friction="0.2" restitution="0.2" x="293" y="125" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="60" density="1" friction="0.2" restitution="0.2" x="276" y="118" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="-26" density="1" friction="0.2" restitution="0.2" x="291" y="110" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="60" density="1" friction="0.2" restitution="0.2" x="305" y="101" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="60" density="1" friction="0.2" restitution="0.2" x="310" y="113" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="89" density="1" friction="0.2" restitution="0.2" x="311" y="125" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="95" density="1" friction="0.2" restitution="0.2" x="328" y="123" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="-26" density="1" friction="0.2" restitution="0.2" x="324" y="101" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="95" density="1" friction="0.2" restitution="0.2" x="335" y="92" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="95" density="1" friction="0.2" restitution="0.2" x="346" y="107" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="111" density="1" friction="0.2" restitution="0.2" x="349" y="123" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="111" density="1" friction="0.2" restitution="0.2" x="356" y="90" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="95" density="1" friction="0.2" restitution="0.2" x="367" y="103" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="95" density="1" friction="0.2" restitution="0.2" x="371" y="122" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="390" a_damp="-0.1" y="119" width="29" l_damp="-0.1" height="31" strength="0.2" friction="0.2" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="-26" density="1" friction="0.2" restitution="0.2" x="385" y="102" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="111" density="1" friction="0.2" restitution="0.2" x="399" y="98" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="-26" density="1" friction="0.2" restitution="0.2" x="407" y="116" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="95" density="1" friction="0.2" restitution="0.2" x="413" y="93" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="60" density="1" friction="0.2" restitution="0.2" x="422" y="110" width="27" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="430" y="93" width="29" l_damp="-0.1" height="31" a_damp="-0.1" friction="0.2" restitution="0.2"/>
				  <body name="yLimit" x="339" a_damp="-0.1" y="355" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="0" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 20_" yKonstruktor="-300" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="510" a_damp="-0.1" y="312" width="20" rotation="18" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="476" a_damp="-0.1" y="311" width="56" rotation="-3" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="510" a_damp="-0.1" y="352" width="56" rotation="31" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="460" a_damp="-0.1" y="326" width="161" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="407" a_damp="-0.1" y="348" width="56" rotation="-31" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="408" a_damp="-0.1" y="309" width="56" rotation="-9" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="458" a_damp="-0.1" y="312" width="56" rotation="14" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="696" a_damp="-0.1" y="263" width="60" rotation="-9" height="79" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="681" a_damp="-0.1" y="203" width="60" rotation="-17" height="91" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="669" a_damp="-0.1" y="136" width="60" rotation="25" height="88" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="544" a_damp="-0.1" y="142" width="45" rotation="-18" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="524" a_damp="-0.1" y="142" width="30" rotation="-54" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="603" a_damp="-0.1" y="143" width="54" rotation="13" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="522" a_damp="-0.1" y="113" width="32" rotation="-65" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="529" a_damp="-0.1" y="92" width="32" rotation="-80" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="545" l_damp="-0.1" y="322" width="30" rotation="45" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="646" y="351" width="200" l_damp="-0.1" height="100" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="681" l_damp="-0.1" y="336" width="60" rotation="25" height="44" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="26" l_damp="-0.1" y="5" width="62" rotation="-9" height="83" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-1" l_damp="-0.1" y="58" width="60" rotation="-54" height="44" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-21" a_damp="-0.1" y="86" width="60" rotation="2" height="65" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-13" a_damp="-0.1" y="132" width="60" rotation="-21" height="65" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="109" a_damp="-0.1" y="159" width="30" rotation="45" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="115" a_damp="-0.1" y="183" width="45" rotation="88" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="114" a_damp="-0.1" y="216" width="30" rotation="103" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="99" a_damp="-0.1" y="237" width="45" rotation="135" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="9" a_damp="-0.1" y="188" width="200" l_damp="-0.1" height="100" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="94" a_damp="-0.1" y="254" width="45" rotation="111" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="85" a_damp="-0.1" y="287" width="68" rotation="94" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="73" a_damp="-0.1" y="348" width="68" rotation="110" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="52" a_damp="-0.1" y="396" width="46" rotation="120" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="43" a_damp="-0.1" y="424" width="46" rotation="102" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="42" a_damp="-0.1" y="450" width="46" rotation="86" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-21" y="278" width="200" l_damp="-0.1" height="100" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-28" y="340" width="200" l_damp="-0.1" height="100" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-58" y="430" width="200" l_damp="-0.1" height="100" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="353" a_damp="-0.1" y="325" width="33" rotation="-50" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="339" a_damp="-0.1" y="348" width="33" rotation="-69" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="332" a_damp="-0.1" y="376" width="33" rotation="-83" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="339" a_damp="-0.1" y="409" width="48" rotation="-100" height="45" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="337" a_damp="-0.1" y="450" width="32" rotation="-82" height="34" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="369" a_damp="-0.1" y="362" width="28" rotation="89" height="47" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="435" y="442" width="200" l_damp="-0.1" height="100" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="550" a_damp="-0.1" y="349" width="60" rotation="8" height="44" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="524" a_damp="-0.1" y="390" width="67" rotation="146" height="48" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="381" a_damp="-0.1" y="386" width="79" rotation="33" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="77" a_damp="-0.1" y="1" width="62" rotation="5" height="83" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="130" a_damp="-0.1" y="1" width="62" rotation="-6" height="83" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="156" a_damp="-0.1" y="-12" width="62" rotation="-47" height="83" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="517" a_damp="-0.1" y="66" width="23" rotation="-12" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="522" a_damp="-0.1" y="25" width="62" rotation="-34" height="106" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="623" a_damp="-0.1" y="54" width="200" l_damp="-0.1" height="200" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="375" a_damp="-0.1" y="328" width="28" rotation="68" height="27" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="372" a_damp="-0.1" y="348" width="28" rotation="97" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="627" y="418" width="200" l_damp="-0.1" height="100" a_damp="-0.1" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="t_shap" x="510" a_damp="-0.1" y="126" width="40" l_damp="-0.1" height="40" strength="0.2" friction="0.5"/>
				  <body name="cannon" x="98" a_damp="-0.1" y="87" width="140" l_damp="-0.1" height="100" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="t_shap" x="364" y="317" width="40" l_damp="-0.1" height="40" a_damp="-0.1" friction="0.5"/>
				  <body name="gFan01" x="454" a_damp="-0.1" y="400" width="116" rotation="90" height="111" strength="0.2" friction="0.5" l_damp="2.4" restitution="0.2"/>
				  <body name="yLimit" x="226" y="354" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="hero" density="1" x="223" y="522" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="cannon" x="586" a_damp="-0.1" y="249" width="140" l_damp="-0.1" height="100" mirrorShape="1" strength="0.1" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="-35" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 21_" yKonstruktor="182" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="460" l_damp="-0.1" y="198" width="92" rotation="3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="236" l_damp="-0.1" y="198" width="92" rotation="-3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="455" a_damp="-0.1" y="118" width="92" rotation="-3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="500" a_damp="-0.1" y="116" width="92" rotation="-6" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="234" a_damp="-0.1" y="118" width="92" rotation="3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="192" a_damp="-0.1" y="116" width="92" rotation="6" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="346" y="191" width="400" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="346" y="154" width="400" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="346" a_damp="-0.1" y="121" width="400" l_damp="-0.1" height="30" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="192" l_damp="-0.1" y="200" width="92" rotation="-6" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="502" l_damp="-0.1" y="199" width="92" rotation="6" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="624" l_damp="-0.1" y="49" width="134" rotation="90" height="134" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="656" a_damp="-0.1" y="218" width="50" rotation="-53" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="679" a_damp="-0.1" y="342" width="50" rotation="32" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="688" a_damp="-0.1" y="246" width="44" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="749" y="444" width="300" l_damp="undefined" height="200" a_damp="undefined" friction="0.5"/>
				  <body name="t_pol" x="122" a_damp="-0.1" y="454" width="50" rotation="67" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="111" a_damp="-0.1" y="387" width="50" rotation="76" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="116" a_damp="-0.1" y="355" width="20" rotation="51" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="115" a_damp="-0.1" y="430" width="50" rotation="91" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-33" y="441" width="300" l_damp="undefined" height="200" a_damp="undefined" friction="0.5"/>
				  <body name="t_pol" x="563" a_damp="-0.1" y="9" width="44" rotation="-70" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="557" a_damp="-0.1" y="77" width="44" rotation="-73" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="555" a_damp="-0.1" y="101" width="44" rotation="-29" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="134" a_damp="-0.1" y="101" width="44" rotation="29" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="76" a_damp="-0.1" y="50" width="78" l_damp="-0.1" height="104" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="25" a_damp="-0.1" y="250" width="50" rotation="19" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="149" a_damp="-0.1" y="209" width="10" rotation="-29" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="43" a_damp="-0.1" y="115" width="50" rotation="-78" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="35" l_damp="-0.1" y="356" width="50" rotation="-62" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="23" a_damp="-0.1" y="328" width="50" rotation="-22" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="116" a_damp="-0.1" y="219" width="10" rotation="90" height="73" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="50" a_damp="-0.1" y="217" width="50" rotation="53" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="91" a_damp="-0.1" y="149" width="135" rotation="90" height="114" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="130" a_damp="-0.1" y="76" width="44" rotation="73" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="125" a_damp="-0.1" y="42" width="44" rotation="94" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="120" a_damp="-0.1" y="7" width="44" rotation="70" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="558" a_damp="-0.1" y="44" width="44" rotation="-94" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="597" a_damp="-0.1" y="379" width="50" rotation="-41" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="590" a_damp="-0.1" y="398" width="50" rotation="-9" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="604" a_damp="-0.1" y="433" width="50" rotation="-33" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="19" a_damp="-0.1" y="241" width="44" l_damp="-0.1" height="500" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="686" l_damp="-0.1" y="261" width="50" rotation="-22" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="610" a_damp="-0.1" y="201" width="50" rotation="-82" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="607" a_damp="-0.1" y="155" width="134" rotation="90" height="134" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="543" a_damp="-0.1" y="207" width="10" rotation="29" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="340" y="524" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactusGround02" x="84" a_damp="-0.1" y="327" width="48" l_damp="-0.1" height="30" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="341" y="339" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bCactusA05" x="86" a_damp="-0.1" y="286" width="48" l_damp="-0.1" height="87" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="347" a_damp="-0.1" y="142" width="50" l_damp="-0.1" height="50" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bCactusGround02" x="626" y="330" width="48" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="gCactusA01" x="624" a_damp="-0.1" y="286" width="57" l_damp="-0.1" height="75" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bPackage02" density="0.3" x="344" a_damp="-0.1" y="74" width="121" l_damp="-0.1" height="70" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="holePes" x="345" a_damp="-0.1" y="141" width="55" l_damp="-0.1" height="57" strength="0.1" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="0" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 22_" yKonstruktor="-300" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="551" a_damp="-0.1" y="347" width="60" rotation="35" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="555" a_damp="-0.1" y="306" width="40" rotation="11" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="493" a_damp="-0.1" y="198" width="40" rotation="-50" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="489" a_damp="-0.1" y="265" width="40" rotation="59" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="479" a_damp="-0.1" y="307" width="60" rotation="34" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="529" a_damp="-0.1" y="330" width="60" rotation="15" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="140" l_damp="-0.1" y="323" width="60" rotation="139" height="18" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="209" a_damp="-0.1" y="283" width="60" rotation="160" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="183" a_damp="-0.1" y="292" width="186" rotation="-27" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="301" a_damp="-0.1" y="272" width="80" rotation="4" height="24" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="150" a_damp="-0.1" y="263" width="60" rotation="139" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="170" a_damp="-0.1" y="244" width="60" rotation="127" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="181" a_damp="-0.1" y="141" width="60" rotation="45" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="161" a_damp="-0.1" y="119" width="60" rotation="27" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="563" a_damp="-0.1" y="86" width="48" rotation="-30" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="525" a_damp="-0.1" y="112" width="48" rotation="-38" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="481" a_damp="-0.1" y="134" width="48" rotation="-17" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="132" a_damp="-0.1" y="64" width="80" rotation="22" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="191" a_damp="-0.1" y="104" width="80" rotation="45" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="242" a_damp="-0.1" y="137" width="80" rotation="3" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="268" a_damp="-0.1" y="141" width="80" rotation="-7" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="344" a_damp="-0.1" y="153" width="320" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="152" a_damp="-0.1" y="277" width="114" rotation="-27" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="512" l_damp="-0.1" y="130" width="114" rotation="-27" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="524" a_damp="-0.1" y="307" width="186" rotation="27" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="162" a_damp="-0.1" y="104" width="180" rotation="36" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="318" a_damp="-0.1" y="133" width="40" rotation="-16" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="370" a_damp="-0.1" y="134" width="80" rotation="8" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="449" a_damp="-0.1" y="141" width="80" rotation="2" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="379" a_damp="-0.1" y="273" width="80" rotation="-3" height="24" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="115" a_damp="-0.1" y="87" width="60" rotation="41" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="193" a_damp="-0.1" y="177" width="60" rotation="77" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="190" a_damp="-0.1" y="219" width="60" rotation="97" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="341" a_damp="-0.1" y="227" width="296" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="341" a_damp="-0.1" y="263" width="296" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="341" a_damp="-0.1" y="190" width="296" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="529" l_damp="-0.1" y="159" width="114" rotation="-27" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="452" a_damp="-0.1" y="286" width="20" rotation="59" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="571" a_damp="-0.1" y="155" width="40" rotation="-10" height="18" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="21" a_damp="-0.1" y="41" width="92" l_damp="-0.1" height="120" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="91" a_damp="-0.1" y="1" width="60" rotation="-85" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="77" a_damp="-0.1" y="48" width="60" rotation="-63" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="47" a_damp="-0.1" y="91" width="60" rotation="-48" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="697" a_damp="-0.1" y="72" width="200" l_damp="-0.1" height="182" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="579" a_damp="-0.1" y="20" width="60" rotation="-98" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="677" a_damp="-0.1" y="185" width="50" rotation="-139" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="570" a_damp="-0.1" y="424" width="48" rotation="70" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="571" a_damp="-0.1" y="401" width="48" rotation="113" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="581" a_damp="-0.1" y="358" width="48" rotation="96" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="590" l_damp="-0.1" y="319" width="48" rotation="111" height="56" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="120" a_damp="-0.1" y="451" width="48" rotation="111" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="120" a_damp="-0.1" y="420" width="48" rotation="80" height="62" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="110" a_damp="-0.1" y="383" width="48" rotation="62" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="107" a_damp="-0.1" y="340" width="48" rotation="76" height="32" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="695" a_damp="-0.1" y="247" width="98" rotation="-77" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="11" a_damp="-0.1" y="124" width="50" rotation="53" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-9" a_damp="-0.1" y="159" width="56" rotation="19" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-15" a_damp="-0.1" y="211" width="50" rotation="-4" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="95" a_damp="-0.1" y="247" width="48" rotation="80" height="32" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="100" a_damp="-0.1" y="292" width="48" rotation="87" height="32" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-43" a_damp="-0.1" y="349" width="300" l_damp="-0.1" height="256" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="575" a_damp="-0.1" y="446" width="48" rotation="86" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="641" a_damp="-0.1" y="160" width="50" rotation="-155" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="604" a_damp="-0.1" y="138" width="50" rotation="-143" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="582" a_damp="-0.1" y="110" width="50" rotation="-114" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="578" a_damp="-0.1" y="71" width="60" rotation="-81" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="726" a_damp="-0.1" y="378" width="300" l_damp="-0.1" height="182" strength="0.1" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="343" y="516" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="339" y="333" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="cannon" x="585" a_damp="-0.1" y="236" width="141" l_damp="-0.1" height="100" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="cannon" x="89" a_damp="-0.1" y="170" width="141" l_damp="-0.1" height="100" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="swarm" density="1" x="230" a_damp="-0.1" y="53" width="118" l_damp="5" height="118" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="swarm" density="1" x="349" y="67" width="118" l_damp="5" height="118" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="swarm" density="1" x="463" y="47" width="118" l_damp="5" height="118" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" strength="0.1" rotation="-2" density="1" friction="0.5" restitution="0.2" x="347" y="202" width="66" l_damp="-0.1" height="66" a_damp="-0.1"/>
				  <body name="holePes" x="344" a_damp="-0.1" y="203" width="76" rotation="5" height="78" strength="0.2" friction="0.5" l_damp="-0.1"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="-62" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 23_" yKonstruktor="297" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="412" a_damp="-0.1" y="45" width="62" rotation="-5" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="349" y="129" width="300" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="348" a_damp="-0.1" y="91" width="300" l_damp="-0.1" height="20" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="348" y="110" width="300" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="349" y="148" width="300" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="349" y="167" width="300" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="350" y="186" width="300" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="229" a_damp="-0.1" y="191" width="50" rotation="8" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="277" a_damp="-0.1" y="194" width="50" rotation="-3" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="326" a_damp="-0.1" y="194" width="50" rotation="4" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="419" a_damp="-0.1" y="194" width="50" rotation="5" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="231" l_damp="-0.1" y="49" width="50" rotation="-3" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="277" a_damp="-0.1" y="51" width="50" rotation="9" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="310" a_damp="-0.1" y="50" width="50" rotation="-6" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="472" a_damp="-0.1" y="45" width="62" rotation="5" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="362" a_damp="-0.1" y="50" width="62" rotation="4" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="374" a_damp="-0.1" y="194" width="50" rotation="-3" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="470" a_damp="-0.1" y="192" width="60" rotation="-9" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="348" y="72" width="300" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="348" y="53" width="300" l_damp="-0.1" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="32" a_damp="-0.1" y="245" width="300" l_damp="-0.1" height="500" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="609" a_damp="-0.1" y="93" width="180" l_damp="-0.1" height="250" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="610" y="435" width="180" l_damp="-0.1" height="250" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="507" a_damp="-0.1" y="419" width="100" rotation="34" height="194" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="183" a_damp="-0.1" y="338" width="100" rotation="-19" height="300" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="263" a_damp="-0.1" y="441" width="30" rotation="-8" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="253" a_damp="-0.1" y="400" width="30" rotation="-20" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="234" a_damp="-0.1" y="364" width="30" rotation="-38" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="231" a_damp="-0.1" y="343" width="30" rotation="-8" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="229" a_damp="-0.1" y="304" width="30" l_damp="-0.1" height="46" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="220" a_damp="-0.1" y="267" width="30" rotation="-26" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="197" a_damp="-0.1" y="234" width="30" rotation="-43" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="183" a_damp="-0.1" y="197" width="30" rotation="41" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="194" a_damp="-0.1" y="165" width="34" rotation="4" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="191" a_damp="-0.1" y="124" width="34" rotation="-11" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="191" a_damp="-0.1" y="84" width="34" rotation="11" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="190" a_damp="-0.1" y="47" width="34" rotation="-15" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="190" a_damp="-0.1" y="21" width="34" rotation="6" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="190" a_damp="-0.1" y="211" width="30" rotation="-7" height="46" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="429" a_damp="-0.1" y="454" width="30" rotation="14" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="447" a_damp="-0.1" y="424" width="30" rotation="47" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="463" a_damp="-0.1" y="410" width="30" rotation="15" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="481" a_damp="-0.1" y="379" width="30" rotation="45" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="494" a_damp="-0.1" y="365" width="30" rotation="35" height="46" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="514" a_damp="-0.1" y="330" width="30" rotation="21" height="36" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="510" a_damp="-0.1" y="178" width="30" rotation="-13" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="507" a_damp="-0.1" y="132" width="30" rotation="4" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="507" a_damp="-0.1" y="97" width="30" rotation="-9" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="509" a_damp="-0.1" y="54" width="30" rotation="16" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="512" a_damp="-0.1" y="16" width="30" rotation="-3" height="52" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="408" l_damp="-0.1" y="106" width="26" rotation="-12" height="28" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="-2" density="1" friction="0.5" restitution="0.2" x="383" y="75" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.2" x="291" y="35" width="33" l_damp="-0.1" height="35" a_damp="-0.1"/>
				  <body name="bFanMega02" x="594" a_damp="-0.1" y="258" width="204" l_damp="-0.1" height="116" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="140" density="1" friction="0.5" restitution="0.2" x="406" y="141" width="28" l_damp="-0.1" height="30" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="34" density="1" friction="0.5" restitution="0.2" x="291" y="150" width="33" l_damp="-0.1" height="35" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="15" density="1" friction="0.5" restitution="0.2" x="318" y="172" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bStone01" density="1" x="349" a_damp="-0.1" y="122" width="70" l_damp="-0.1" height="70" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="-48" density="1" friction="0.5" restitution="0.2" x="350" y="179" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.2" x="375" y="34" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.2" x="318" y="33" width="33" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.2" x="402" y="34" width="26" l_damp="-0.1" height="28" a_damp="-0.1"/>
				  <body name="hero" density="1" x="350" y="526" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="348" y="359" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bCactus01" strength="0.1" rotation="66" density="1" friction="0.5" restitution="0.2" x="346" y="32" width="33" l_damp="-0.1" height="35" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="386" l_damp="-0.1" y="168" width="28" rotation="140" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="287" a_damp="-0.1" y="110" width="28" l_damp="-0.1" height="30" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="345" a_damp="-0.1" y="66" width="33" l_damp="-0.1" height="35" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="305" l_damp="-0.1" y="80" width="33" rotation="34" height="35" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="holePes" x="408" a_damp="-0.1" y="106" width="24" rotation="-6" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="406" l_damp="-0.1" y="142" width="24" rotation="-35" height="32" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="385" l_damp="-0.1" y="168" width="24" rotation="-35" height="32" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="350" a_damp="-0.1" y="178" width="24" rotation="-35" height="32" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="383" a_damp="-0.1" y="74" width="24" l_damp="-0.1" height="32" strength="0.1" friction="0.5"/>
				  <body name="holePes" x="292" a_damp="-0.1" y="149" width="26" rotation="41" height="34" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="287" a_damp="-0.1" y="110" width="22" l_damp="-0.1" height="31" strength="0.1" friction="0.5"/>
				  <body name="holePes" x="348" a_damp="-0.1" y="121" width="80" l_damp="-0.1" height="82" strength="0.1" friction="0.5"/>
				  <body name="holePes" x="345" a_damp="-0.1" y="65" width="25" rotation="-4" height="35" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="318" a_damp="-0.1" y="172" width="24" rotation="34" height="33" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="305" a_damp="-0.1" y="79" width="27" rotation="28" height="33" strength="0.1" friction="0.5" l_damp="-0.1"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="0" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 24_" yKonstruktor="0" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="477" a_damp="-0.1" y="415" width="70" rotation="-27" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="462" a_damp="-0.1" y="386" width="70" rotation="-27" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="518" a_damp="-0.1" y="340" width="70" rotation="-22" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="619" a_damp="-0.1" y="278" width="52" rotation="-56" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="577" a_damp="-0.1" y="313" width="70" rotation="-26" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="547" a_damp="-0.1" y="344" width="140" rotation="-32" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="176" a_damp="-0.1" y="283" width="55" rotation="75" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="111" y="282" width="100" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="170" a_damp="-0.1" y="242" width="46" rotation="89" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="131" a_damp="-0.1" y="314" width="100" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="270" a_damp="-0.1" y="358" width="26" rotation="79" height="24" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="260" a_damp="-0.1" y="336" width="40" rotation="37" height="12" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="226" a_damp="-0.1" y="334" width="40" rotation="11" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="172" a_damp="-0.1" y="351" width="184" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="194" a_damp="-0.1" y="388" width="182" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="188" a_damp="-0.1" y="312" width="55" rotation="53" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="71" a_damp="-0.1" y="220" width="60" rotation="37" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="119" a_damp="-0.1" y="236" width="70" rotation="4" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="103" a_damp="-0.1" y="254" width="100" l_damp="-0.1" height="22" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="552" l_damp="-0.1" y="365" width="140" rotation="-32" height="24" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="454" a_damp="-0.1" y="360" width="70" rotation="-12" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="578" a_damp="-0.1" y="380" width="150" rotation="-48" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="562" a_damp="-0.1" y="24" width="100" rotation="-145" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="65" a_damp="-0.1" y="322" width="44" rotation="173" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="101" a_damp="-0.1" y="383" width="30" rotation="99" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="60" l_damp="-0.1" y="390" width="100" rotation="90" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="143" a_damp="-0.1" y="394" width="28" rotation="116" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="173" a_damp="-0.1" y="403" width="28" rotation="98" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="211" a_damp="-0.1" y="406" width="28" rotation="87" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="234" a_damp="-0.1" y="403" width="28" rotation="73" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="276" a_damp="-0.1" y="402" width="20" rotation="46" height="52" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="273" a_damp="-0.1" y="440" width="100" rotation="-73" height="17" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="732" y="355" width="242" l_damp="-0.1" height="106" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="608" y="13" width="100" l_damp="-0.1" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="648" y="47" width="100" l_damp="-0.1" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="543" a_damp="-0.1" y="-27" width="100" rotation="-76" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="628" a_damp="-0.1" y="89" width="100" rotation="-127" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="653" a_damp="-0.1" y="185" width="100" rotation="-86" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="638" a_damp="-0.1" y="269" width="100" rotation="-75" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="154" a_damp="-0.1" y="-19" width="100" rotation="76" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="88" a_damp="-0.1" y="18" width="100" l_damp="-0.1" height="50" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="-13" y="28" width="242" l_damp="-0.1" height="106" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="5" a_damp="-0.1" y="226" width="100" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="135" a_damp="-0.1" y="32" width="100" rotation="145" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="59" a_damp="-0.1" y="106" width="100" rotation="127" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="35" a_damp="-0.1" y="202" width="100" rotation="86" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="48" a_damp="-0.1" y="259" width="100" rotation="75" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="150" a_damp="-0.1" y="448" width="242" l_damp="-0.1" height="106" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="89" a_damp="-0.1" y="362" width="28" rotation="144" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="272" a_damp="-0.1" y="390" width="28" rotation="70" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="694" y="229" width="100" l_damp="-0.1" height="500" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="667" y="427" width="242" l_damp="-0.1" height="106" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="501" a_damp="-0.1" y="475" width="100" rotation="3" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="510" a_damp="-0.1" y="441" width="100" rotation="-36" height="58" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="368" y="529" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="367" y="353" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="rev" density="1" x="226" a_damp="-0.1" y="177" width="100" l_damp="2" height="100" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="475" a_damp="-0.1" y="176" width="100" l_damp="2" height="100" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="277" y="106" width="32" l_damp="-0.1" height="32" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="295" y="128" width="32" l_damp="-0.1" height="32" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="279" y="153" width="32" l_damp="-0.1" height="32" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="314" y="152" width="32" l_damp="-0.1" height="32" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_3" density="1" x="475" a_damp="-0.1" y="176" width="74" l_damp="-0.1" height="65" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="millrot" density="0.1" x="475" a_damp="0" y="176" width="224" l_damp="0" height="226" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" strength="0.2" rotation="-90" density="1" friction="0.5" restitution="0.2" x="402" y="189" width="9" l_damp="-0.1" height="68" a_damp="-0.1"/>
				  <body name="bSpikes02_01" density="1" x="301" l_damp="-0.1" y="190" width="9" rotation="-90" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" density="1" x="488" l_damp="-0.1" y="100" width="9" rotation="180" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="488" y="249" width="9" l_damp="-0.1" height="68" a_damp="-0.1"/>
				  <body name="bCactus31" density="1" x="259" y="130" width="32" l_damp="-0.1" height="32" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" density="1" x="212" y="98" width="9" l_damp="-0.1" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" density="1" x="212" y="252" width="9" l_damp="-0.1" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" density="1" x="239" l_damp="-0.1" y="250" width="9" rotation="180" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_3" density="1" x="226" y="177" width="74" l_damp="-0.1" height="65" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="millrot" density="0.1" x="226" y="177" width="224" l_damp="0" height="226" a_damp="0" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" density="1" x="461" a_damp="-0.1" y="251" width="9" l_damp="-0.1" height="68" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bSpikes02_01" strength="0.2" rotation="90" density="1" friction="0.5" restitution="0.2" x="551" y="161" width="9" l_damp="-0.1" height="68" a_damp="-0.1"/>
				  <body name="bSpikes02_01" strength="0.2" rotation="-90" density="1" friction="0.5" restitution="0.2" x="553" y="189" width="9" l_damp="-0.1" height="68" a_damp="-0.1"/>
				  <body name="bSpikes02_01" density="1" x="150" l_damp="-0.1" y="191" width="9" rotation="-90" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="517" a_damp="-0.1" y="145" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="543" a_damp="-0.1" y="144" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="556" a_damp="-0.1" y="125" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="570" a_damp="-0.1" y="144" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="373" a_damp="-0.1" y="154" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="386" a_damp="-0.1" y="128" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="398" a_damp="-0.1" y="152" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="425" a_damp="-0.1" y="151" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bCactus31" density="1" x="442" a_damp="-0.1" y="136" width="32" l_damp="-0.1" height="32" strength="0.1" friction="0.5" restitution="0.3"/>
				  <body name="bSpikes02_01" density="1" x="148" l_damp="-0.1" y="163" width="9" rotation="90" height="68" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="star" x="130" y="129" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint_fixed" density="1" x="217" y="100" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="553" y="185" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="553" y="165" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="484" y="98" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="483" y="251" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="466" y="251" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="397" y="185" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="303" y="185" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="217" y="252" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="234" y="252" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="148" y="187" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="148" y="167" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="-361" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 25_" yKonstruktor="158" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="219" a_damp="-0.1" y="422" width="26" rotation="-9" height="80" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="210" a_damp="-0.1" y="121" width="20" rotation="9" height="80" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="209" a_damp="-0.1" y="349" width="20" rotation="-9" height="80" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="473" a_damp="-0.1" y="66" width="240" l_damp="-0.1" height="26" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="548" l_damp="-0.1" y="18" width="80" rotation="-4" height="12" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="542" a_damp="-0.1" y="76" width="80" rotation="4" height="12" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="399" l_damp="-0.1" y="19" width="80" rotation="4" height="12" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="399" a_damp="-0.1" y="76" width="80" rotation="-4" height="12" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="157" y="268" width="38" l_damp="-0.1" height="400" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="83" y="267" width="38" l_damp="-0.1" height="400" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="46" a_damp="-0.1" y="265" width="38" l_damp="-0.1" height="400" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="120" y="268" width="38" l_damp="-0.1" height="400" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="194" a_damp="-0.1" y="266" width="38" l_damp="-0.1" height="400" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="473" a_damp="-0.1" y="35" width="240" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="650" a_damp="-0.1" y="368" width="100" l_damp="-0.1" height="220" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="375" a_damp="-0.1" y="447" width="80" rotation="-117" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="352" l_damp="-0.1" y="377" width="80" rotation="-98" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="64" a_damp="-0.1" y="92" width="86" rotation="-34" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="244" a_damp="-0.1" y="466" width="48" rotation="114" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="301" a_damp="-0.1" y="462" width="98" l_damp="-0.1" height="150" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="14" a_damp="-0.1" y="365" width="80" rotation="-98" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="12" a_damp="-0.1" y="197" width="80" rotation="-84" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="24" a_damp="-0.1" y="156" width="80" rotation="-61" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="145" a_damp="-0.1" y="80" width="80" rotation="-4" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="199" a_damp="-0.1" y="74" width="80" rotation="-7" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="625" a_damp="-0.1" y="147" width="50" rotation="-87" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="613" a_damp="-0.1" y="96" width="50" rotation="-114" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="352" a_damp="-0.1" y="95" width="30" rotation="20" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="610" a_damp="-0.1" y="60" width="60" rotation="-81" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="611" a_damp="-0.1" y="9" width="60" rotation="-98" height="50" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="348" a_damp="-0.1" y="-9" width="30" rotation="-20" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="160" a_damp="-0.1" y="37" width="400" l_damp="-0.1" height="100" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="325" a_damp="-0.1" y="81" width="40" rotation="-141" height="36" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="347" a_damp="-0.1" y="399" width="36" l_damp="-0.1" height="128" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="2" a_damp="-0.1" y="287" width="50" l_damp="-0.1" height="400" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="612" a_damp="-0.1" y="453" width="48" rotation="68" height="56" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="604" a_damp="-0.1" y="417" width="48" rotation="86" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="619" l_damp="-0.1" y="290" width="48" rotation="111" height="56" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="610" a_damp="-0.1" y="329" width="48" rotation="96" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="600" a_damp="-0.1" y="372" width="48" rotation="113" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="599" a_damp="-0.1" y="395" width="48" rotation="70" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="659" a_damp="-0.1" y="78" width="100" l_damp="-0.1" height="182" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="348" a_damp="-0.1" y="126" width="36" l_damp="-0.1" height="54" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="336" a_damp="-0.1" y="109" width="60" rotation="-114" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="311" a_damp="-0.1" y="89" width="60" rotation="-141" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="268" a_damp="-0.1" y="73" width="60" rotation="-172" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="40" a_damp="-0.1" y="441" width="80" rotation="-119" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="254" l_damp="-0.1" y="422" width="48" rotation="96" height="56" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="334" a_damp="-0.1" y="357" width="40" rotation="104" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="327" a_damp="-0.1" y="393" width="40" rotation="96" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="yLimit" x="491" y="322" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="hero" density="1" x="474" y="388" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bFanMega02" x="666" a_damp="-0.1" y="213" width="180" l_damp="2" height="98" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.2" rotation="137" density="1" friction="0.5" restitution="0.2" x="441" y="138" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bBalloon" density="1" x="440" y="99" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="440" y="127" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="477" l_damp="-0.1" y="137" width="31" rotation="137" height="33" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="476" y="98" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="476" y="126" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="512" l_damp="-0.1" y="138" width="31" rotation="137" height="33" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="511" y="99" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="511" y="127" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="549" l_damp="-0.1" y="140" width="31" rotation="137" height="33" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="548" y="101" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="548" y="129" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="406" l_damp="-0.1" y="140" width="31" rotation="137" height="33" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="405" y="101" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="405" y="129" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBox01" x="346" a_damp="-0.1" y="305" width="60" rotation="90" height="55" strength="0.2" friction="0.5" l_damp="-0.1" restitution="0.2"/>
				  <body name="bBox01" x="346" l_damp="-0.1" y="245" width="60" rotation="90" height="55" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox01" x="345" l_damp="-0.1" y="186" width="60" rotation="90" height="55" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="swarm" density="1" x="266" a_damp="-0.1" y="209" width="118" l_damp="9" height="118" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bStone01" density="1" x="110" a_damp="-0.1" y="285" width="66" l_damp="-0.1" height="66" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="gFan01" x="271" a_damp="-0.1" y="412" width="96" rotation="90" height="101" strength="0.2" friction="0.5" l_damp="3" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="390" l_damp="-0.1" y="59" width="31" rotation="137" height="33" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="449" y="60" width="26" l_damp="-0.1" height="28" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="34" density="1" friction="0.5" restitution="0.2" x="513" y="62" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="44" density="1" friction="0.5" restitution="0.2" x="421" y="46" width="26" l_damp="-0.1" height="28" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="-23" density="1" friction="0.5" restitution="0.2" x="480" y="46" width="28" l_damp="-0.1" height="30" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="-15" density="1" friction="0.5" restitution="0.2" x="548" y="46" width="35" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="t_joint_fixed" density="1" x="440" y="133" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="476" y="132" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="511" y="133" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="548" y="135" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="405" y="135" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="holePes" x="109" a_damp="-0.1" y="285" width="75" l_damp="-0.1" height="77" strength="0.2" friction="0.5"/>
				  <body name="holePes" x="390" a_damp="-0.1" y="60" width="25" rotation="-28" height="32" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="421" a_damp="-0.1" y="46" width="23" rotation="36" height="31" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="449" a_damp="-0.1" y="61" width="21" l_damp="-0.1" height="27" strength="0.2" friction="0.5"/>
				  <body name="holePes" x="480" a_damp="-0.1" y="46" width="23" rotation="-11" height="31" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="513" a_damp="-0.1" y="62" width="23" rotation="36" height="31" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="holePes" x="549" a_damp="-0.1" y="46" width="23" rotation="-11" height="33" strength="0.1" friction="0.5" l_damp="-0.1"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="-33" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 26_" yKonstruktor="20" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pol" x="695" a_damp="-0.1" y="439" width="74" rotation="-97" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="696" a_damp="-0.1" y="375" width="74" rotation="-81" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="694" l_damp="-0.1" y="334" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="695" l_damp="-0.1" y="272" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="694" l_damp="-0.1" y="211" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-3" a_damp="-0.1" y="251" width="50" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="109" a_damp="-0.1" y="23" width="50" rotation="90" height="300" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="39" a_damp="-0.1" y="230" width="74" rotation="96" height="66" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="36" a_damp="-0.1" y="280" width="74" rotation="83" height="66" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="29" l_damp="-0.1" y="433" width="74" rotation="-97" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="31" l_damp="-0.1" y="418" width="74" rotation="-81" height="66" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="34" a_damp="-0.1" y="348" width="74" rotation="93" height="74" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="600" a_damp="-0.1" y="26" width="71" rotation="90" height="300" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="38" a_damp="-0.1" y="170" width="74" rotation="-2" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="40" a_damp="-0.1" y="105" width="74" rotation="4" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="51" a_damp="-0.1" y="52" width="74" rotation="23" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="89" a_damp="-0.1" y="15" width="74" rotation="60" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="664" a_damp="-0.1" y="131" width="74" rotation="-26" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="700" a_damp="-0.1" y="190" width="74" rotation="-37" height="76" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="694" y="251" width="50" l_damp="-0.1" height="500" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="631" a_damp="-0.1" y="45" width="74" rotation="-38" height="102" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="212" a_damp="-0.1" y="34" width="44" rotation="20" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="245" a_damp="-0.1" y="38" width="44" rotation="-8" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="253" a_damp="-0.1" y="25" width="30" rotation="-73" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="255" a_damp="-0.1" y="5" width="30" rotation="-98" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="446" a_damp="-0.1" y="2" width="30" rotation="-106" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="476" l_damp="-0.1" y="45" width="44" rotation="-8" height="40" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="464" a_damp="-0.1" y="47" width="30" rotation="-119" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="453" a_damp="-0.1" y="23" width="30" rotation="-110" height="40" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="257" a_damp="-0.1" y="400" width="20" l_damp="-0.1" height="200" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="619" a_damp="-0.1" y="739" width="20" rotation="-19" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="233" a_damp="-0.1" y="449" width="34" rotation="21" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="240" a_damp="-0.1" y="413" width="28" rotation="9" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="239" a_damp="-0.1" y="396" width="20" rotation="-2" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="246" a_damp="-0.1" y="352" width="20" rotation="20" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="251" a_damp="-0.1" y="327" width="20" rotation="12" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="266" a_damp="-0.1" y="449" width="29" rotation="-13" height="45" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="269" a_damp="-0.1" y="419" width="20" rotation="8" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="270" a_damp="-0.1" y="396" width="20" rotation="-2" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="268" a_damp="-0.1" y="368" width="20" rotation="-7" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="265" a_damp="-0.1" y="345" width="20" rotation="-3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="261" a_damp="-0.1" y="317" width="20" rotation="-12" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="449" l_damp="-0.1" y="320" width="20" rotation="-12" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="453" l_damp="-0.1" y="348" width="20" rotation="-3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="456" l_damp="-0.1" y="371" width="20" rotation="-7" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="458" l_damp="-0.1" y="399" width="20" rotation="-2" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="457" l_damp="-0.1" y="422" width="20" rotation="8" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="454" l_damp="-0.1" y="452" width="29" rotation="-13" height="45" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="439" l_damp="-0.1" y="330" width="20" rotation="12" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="434" l_damp="-0.1" y="355" width="20" rotation="20" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="427" l_damp="-0.1" y="399" width="20" rotation="-2" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="428" l_damp="-0.1" y="416" width="28" rotation="9" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="421" l_damp="-0.1" y="452" width="34" rotation="21" height="50" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="445" y="403" width="20" l_damp="-0.1" height="200" a_damp="-0.1" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="bBox01" x="147" a_damp="-0.1" y="267" width="77" l_damp="-0.1" height="69" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="345" a_damp="-0.1" y="526" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBox02_3" x="555" a_damp="-0.1" y="294" width="148" l_damp="-0.1" height="33" strength="0.1" friction="0.1" restitution="0.2"/>
				  <body name="bBalloon" density="5" x="146" a_damp="-0.1" y="319" width="34" l_damp="-0.1" height="40" strength="0.1" friction="0.2" restitution="0.2"/>
				  <body name="verevka" density="1" x="146" y="346" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="47" a_damp="-0.1" y="145" width="90" l_damp="-0.1" height="90" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bBar01" density="1" x="8" a_damp="0" y="148" width="161" l_damp="-4" height="23" strength="0.1" friction="0.2" restitution="0.2"/>
				  <body name="statObj_4" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="645" y="96" width="74" l_damp="-0.1" height="62" a_damp="-0.1"/>
				  <body name="bBar01" density="1" x="679" a_damp="4" y="98" width="161" l_damp="0" height="23" strength="0.1" friction="0.2" restitution="0.2"/>
				  <body name="bBalloon" density="5" x="555" y="327" width="34" l_damp="-0.1" height="40" a_damp="-0.1" friction="0.2" restitution="0.2"/>
				  <body name="verevka" density="1" x="555" y="354" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBox02_3" x="346" a_damp="-0.1" y="234" width="148" l_damp="-0.1" height="33" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="rev" density="1" x="641" y="95" width="90" l_damp="-0.1" height="90" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="statObj_2" strength="0.2" rotation="180" density="1" friction="0.5" restitution="0.2" x="48" y="148" width="73" l_damp="-0.1" height="62" a_damp="-0.1"/>
				  <body name="bSpikes01_3" x="544" y="62" width="88" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="bSpikes01_3" x="150" y="50" width="88" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="bSpikes01_4" x="210" a_damp="-0.1" y="56" width="24" rotation="25" height="23" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_4" x="485" a_damp="-0.1" y="65" width="24" rotation="-11" height="23" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="bSpikes01_4" x="473" l_damp="-0.1" y="68" width="24" rotation="-11" height="23" a_damp="-0.1" friction="0.5"/>
				  <body name="bSpikes01_4" x="93" a_damp="-0.1" y="61" width="24" rotation="-42" height="23" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="yLimit" x="347" a_damp="-0.1" y="334" width="96" l_damp="-0.1" height="15" strength="0.1" friction="0.5"/>
				  <body name="bCactusA05" strength="0.2" density="1" friction="0.5" restitution="0.2" x="556" y="400" width="48" l_damp="-0.1" height="77" mirrorShape="1" a_damp="-0.1"/>
				  <body name="bCactusA05" density="1" x="147" y="395" width="48" l_damp="undefined" height="77" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="70" density="1" friction="0.1" restitution="0.2" x="575" y="274" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="70" density="1" friction="0.1" restitution="0.2" x="503" y="275" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="70" density="1" friction="0.1" restitution="0.2" x="527" y="274" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="293" l_damp="-0.1" y="215" width="31" rotation="70" height="33" a_damp="-0.1" friction="0.1" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="74" density="1" friction="0.1" restitution="0.2" x="319" y="215" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="344" l_damp="-0.1" y="214" width="31" rotation="70" height="33" a_damp="-0.1" friction="0.1" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="-82" density="1" friction="0.1" restitution="0.2" x="370" y="215" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" density="1" x="395" l_damp="-0.1" y="215" width="31" rotation="70" height="33" a_damp="-0.1" friction="0.1" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="552" l_damp="-0.1" y="275" width="31" rotation="-82" height="33" a_damp="-0.1" friction="0.1" restitution="0.2"/>
				  <body name="bCactus01" density="1" x="601" l_damp="-0.1" y="276" width="31" rotation="-82" height="33" a_damp="-0.1" friction="0.1" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="146" y="357" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="555" y="368" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
  <jopa yKonstruktor="-300" selectedType="Stat" xKonstruktor="0" yL="0" nickLevel="Player" alphaKonstruktor="" fon="1" xL="0" numberLevel="0" nameLevel="Level 27_">
    <bodies>
      <body name="t_pol" a_damp="-0.1" x="713" y="255" width="53" rotation="47" height="60" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="708" y="234" width="53" rotation="99" height="60" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="711" y="202" width="53" rotation="92" height="60" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="707" y="156" width="53" rotation="82" height="60" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="697" y="122" width="53" rotation="70" height="60" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="672" y="76" width="53" rotation="54" height="60" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="100" y="48" width="53" rotation="-5" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="0" y="139" width="62" rotation="95" height="48" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="566" y="-159" width="95" rotation="-21" height="100" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="358" y="877" width="53" rotation="98" height="28" friction="0.5" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="593" y="469" width="200" rotation="90" height="28" friction="0.5" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="179" y="346" width="40" rotation="67" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="186" y="453" width="200" rotation="90" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="324" y="454" width="53" rotation="98" height="20" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="324" y="405" width="53" rotation="83" height="20" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="317" y="279" width="20" height="200" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="319" y="413" width="105" rotation="90" height="24" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="326" y="336" width="53" rotation="103" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="321" y="372" width="53" rotation="98" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="318" y="337" width="40" rotation="78" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="313" y="300" width="40" rotation="87" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="309" y="238" width="40" rotation="96" height="28" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="319" y="235" width="40" rotation="101" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="321" y="200" width="40" rotation="84" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="312" y="201" width="40" rotation="104" height="20" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="310" y="272" width="40" rotation="81" height="28" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="321" y="257" width="40" rotation="84" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="440" y="291" width="40" rotation="-78" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="446" y="251" width="40" rotation="-84" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="447" y="238" width="40" rotation="-101" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="445" y="202" width="40" rotation="-84" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="328" y="296" width="40" rotation="78" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="462" y="240" width="40" rotation="-96" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="455" y="203" width="40" rotation="-104" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="449" y="280" width="30" height="200" friction="0.5" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="440" y="323" width="40" rotation="-100" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="445" y="359" width="40" rotation="-95" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="444" y="385" width="40" rotation="-84" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="445" y="421" width="40" rotation="-98" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="448" y="446" width="40" rotation="-85" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="458" y="270" width="40" rotation="-71" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="454" y="292" width="40" rotation="-82" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="454" y="322" width="40" rotation="-94" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="452" y="357" width="40" rotation="-79" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="459" y="355" width="40" rotation="-111" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="465" y="418" width="100" rotation="90" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="108" y="27" width="400" height="62" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="148" y="47" width="53" rotation="5" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="196" y="46" width="53" rotation="-8" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="214" y="47" width="53" rotation="1" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="297" y="39" width="34" rotation="-81" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="300" y="22" width="34" rotation="-66" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="302" y="0" width="34" rotation="-103" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="259" y="45" width="53" rotation="-8" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="580" y="26" width="260" height="62" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="455" y="10" width="34" rotation="-83" height="28" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="458" y="37" width="34" rotation="-107" height="28" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="532" y="46" width="53" rotation="5" height="28" friction="0.5" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="579" y="44" width="53" rotation="-10" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="599" y="357" width="40" rotation="112" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="615" y="46" width="80" rotation="3" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="688" y="418" width="200" height="200" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="15" y="81" width="70" rotation="115" height="48" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="58" y="60" width="53" rotation="-23" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="640" y="46" width="53" rotation="32" height="60" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="1" y="199" width="62" rotation="82" height="48" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="16" y="251" width="62" rotation="63" height="48" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="77" y="414" width="226" height="200" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="52" y="277" width="53" rotation="21" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="72" y="319" width="53" rotation="30" height="28" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_pol" a_damp="-0.1" x="29" y="325" width="107" height="100" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="t_shap" a_damp="" x="-5" y="-5" width="5" height="5" friction="0.5" strength="0.1" l_damp=""/>
      <body name="dragLimit2" a_damp="undefined" x="711" y="296" width="40" height="38" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="bFanMega02" a_damp="-0.1" x="527" y="446" width="204" rotation="90" height="116" friction="0.5" strength="0.2" restitution="0.2" l_damp="-0.1"/>
      <body name="bFanMega02" a_damp="-0.1" x="253" y="447" width="204" rotation="90" height="116" friction="0.5" restitution="0.2" l_damp="-0.1"/>
      <body name="gBad06_3" a_damp="undefined" x="465" y="148" width="95" height="146" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="hero" a_damp="-0.1" x="384" y="521" width="95" height="146" friction="0.5" strength="0.1" restitution="0.2" l_damp="-0.1" density="1"/>
      <body name="yLimit" a_damp="-0.1" x="381" y="325" width="96" height="15" friction="0.5" strength="0.1" l_damp="-0.1"/>
      <body name="picStat_2" a_damp="undefined" x="627" y="298" width="320" height="5" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="bDrag09" a_damp="undefined" x="527" y="298" width="106" height="37" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="bDrag09" friction="0.5" restitution="0.2" mirrorShape="1" l_damp="-0.1" a_damp="-0.1" x="242" y="294" width="106" height="37" strength="0.1" density="1"/>
      <body name="dragLimit2" a_damp="undefined" x="451" y="297" width="40" height="38" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="dragLimit2" a_damp="undefined" x="316" y="294" width="40" height="38" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="statObj_14" a_damp="-0.1" x="639" y="360" width="96" rotation="4" height="72" friction="0.5" strength="0.2" l_damp="-0.1"/>
      <body name="gBad06_2" a_damp="-0.1" x="300" y="144" width="95" height="146" friction="0.5" strength="0.1" restitution="0.2" l_damp="-0.1" density="1"/>
      <body name="t_doska4" a_damp="undefined" x="236" y="73" width="30" height="16" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="t_doska4" a_damp="undefined" x="305" y="70" width="30" height="16" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="t_doska4" a_damp="undefined" x="528" y="66" width="30" height="16" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="t_doska4" a_damp="undefined" x="462" y="66" width="30" height="16" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="sRocketFg05" a_damp="undefined" x="70" y="367" width="123" height="111" friction="0.5" l_damp="undefined"/>
      <body name="picStat_2" a_damp="undefined" x="143" y="294" width="320" height="5" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="bSpinButton01" a_damp="-0.1" x="69" y="373" width="34" height="92" friction="0.5" strength="0.1" l_damp="9"/>
      <body name="gykffkhj" friction="0.5" restitution="0.2" rotation="90" l_damp="-0.1" a_damp="-0.1" x="70" y="355" width="110" height="14" strength="0.1" density="1"/>
      <body name="dragLimit2" a_damp="undefined" x="70" y="292" width="40" height="38" friction="0.5" restitution="0.2" l_damp="undefined" density="1"/>
      <body name="bSpinButton01" a_damp="-0.1" x="110" y="374" width="38" height="92" friction="0.5" strength="0.1" l_damp="7"/>
      <body name="bSpinButton01" a_damp="-0.1" x="29" y="374" width="38" height="92" friction="0.5" strength="0.1" l_damp="1"/>
    </bodies>
    <setting>
      <core list="LLL" num="1"/>
    </setting>
  </jopa>
</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="-288" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 28_" yKonstruktor="266" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="552" a_damp="-0.1" y="278" width="36" rotation="70" height="58" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="548" a_damp="-0.1" y="373" width="38" l_damp="-0.1" height="174" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="574" a_damp="-0.1" y="362" width="38" l_damp="-0.1" height="200" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="632" a_damp="-0.1" y="345" width="38" l_damp="-0.1" height="234" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="579" a_damp="-0.1" y="246" width="20" rotation="23" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="664" a_damp="-0.1" y="233" width="20" rotation="64" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="513" a_damp="-0.1" y="395" width="38" l_damp="-0.1" height="140" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="595" a_damp="-0.1" y="345" width="38" l_damp="-0.1" height="234" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="521" a_damp="-0.1" y="306" width="32" rotation="25" height="61" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="669" a_damp="-0.1" y="347" width="38" l_damp="-0.1" height="229" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="489" a_damp="-0.1" y="338" width="22" rotation="-69" height="14" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="472" a_damp="-0.1" y="572" width="44" l_damp="-0.1" height="180" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="150" a_damp="-0.1" y="1" width="44" rotation="-22" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="151" a_damp="-0.1" y="40" width="44" rotation="20" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="143" a_damp="-0.1" y="93" width="44" rotation="2" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="138" a_damp="-0.1" y="148" width="44" rotation="9" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="142" a_damp="-0.1" y="203" width="44" rotation="-12" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="137" a_damp="-0.1" y="409" width="44" rotation="25" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="162" l_damp="-0.1" y="315" width="44" rotation="18" height="60" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="442" a_damp="-0.1" y="435" width="44" rotation="-18" height="72" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="689" a_damp="-0.1" y="227" width="44" rotation="20" height="80" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="678" a_damp="-0.1" y="296" width="44" rotation="-2" height="80" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="691" a_damp="-0.1" y="367" width="44" rotation="-19" height="80" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="505" a_damp="-0.1" y="442" width="44" rotation="-32" height="80" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="484" a_damp="-0.1" y="373" width="44" rotation="-6" height="80" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="697" a_damp="-0.1" y="247" width="44" l_damp="-0.1" height="500" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="472" y="408" width="44" l_damp="-0.1" height="150" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="446" a_damp="-0.1" y="397" width="44" rotation="36" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="74" a_damp="-0.1" y="214" width="151" l_damp="-0.1" height="500" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="154" a_damp="-0.1" y="241" width="44" rotation="-27" height="60" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="152" a_damp="-0.1" y="359" width="44" rotation="7" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="457" a_damp="-0.1" y="368" width="44" rotation="18" height="60" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="456" a_damp="-0.1" y="338" width="24" rotation="51" height="10" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="bStone01" strength="0.1" rotation="-4" density="1" friction="0.5" restitution="0.2" x="623" y="184" width="100" l_damp="-0.1" height="96" a_damp="-0.1"/>
				  <body name="bBox02_5" x="320" a_damp="-0.1" y="70" width="168" l_damp="-0.1" height="33" strength="0.1" friction="0.8" restitution="0.2"/>
				  <body name="statObj_2" strength="0.1" rotation="180" density="1" friction="0.5" restitution="0.2" x="171" y="278" width="61" l_damp="-0.1" height="52" a_damp="-0.1"/>
				  <body name="rev" density="1" x="169" y="277" width="79" l_damp="undefined" height="79" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="355" y="344" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="hero" density="1" x="357" y="525" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBar01" density="1" x="143" a_damp="0" y="277" width="136" l_damp="-4" height="23" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="-62" density="1" friction="0.2" restitution="0.2" x="335" y="53" width="21" l_damp="-0.1" height="22" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="-62" density="1" friction="0.2" restitution="0.2" x="356" y="52" width="21" l_damp="-0.1" height="22" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="62" density="1" friction="0.2" restitution="0.2" x="377" y="52" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="62" density="1" friction="0.2" restitution="0.2" x="262" y="50" width="28" l_damp="-0.1" height="30" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="-77" density="1" friction="0.2" restitution="0.2" x="288" y="52" width="28" l_damp="-0.1" height="30" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="-62" density="1" friction="0.2" restitution="0.2" x="313" y="51" width="21" l_damp="-0.1" height="22" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="180" density="1" friction="0.2" restitution="0.2" x="263" y="148" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bBalloon" density="1" x="264" y="102" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="264" y="129" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="384" y="129" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="384" y="102" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="180" density="1" friction="0.2" restitution="0.2" x="383" y="148" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="verevka" density="1" x="343" y="129" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="343" y="102" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="180" density="1" friction="0.2" restitution="0.2" x="342" y="148" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="verevka" density="1" x="303" y="129" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="1" x="303" y="102" width="34" l_damp="undefined" height="40" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="180" density="1" friction="0.2" restitution="0.2" x="302" y="148" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="star" x="584" y="68" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="bBox10" strength="0.1" rotation="90" density="1" friction="0.2" restitution="0.2" x="473" y="246" width="171" l_damp="-0.1" height="24" a_damp="-0.1"/>
				  <body name="bNails21" strength="0.2" rotation="-90" density="1" friction="0.5" restitution="0.2" x="461" y="204" width="91" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="bNails21" strength="0.2" rotation="-90" density="1" friction="0.5" restitution="0.2" x="461" y="287" width="91" l_damp="-0.1" height="27" a_damp="-0.1"/>
				  <body name="swarm" density="1" x="599" a_damp="-0.1" y="374" width="103" l_damp="5" height="101" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="264" y="138" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="384" y="138" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="343" y="138" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="303" y="138" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="468" y="228" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="466" y="281" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="holePes" x="597" a_damp="-0.1" y="373" width="95" l_damp="-0.1" height="102" strength="0.1" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="0" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 29_" yKonstruktor="0" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="347" l_damp="-0.1" y="362" width="210" rotation="90" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="376" l_damp="-0.1" y="362" width="210" rotation="90" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" rotation="90" height="5" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="318" a_damp="-0.1" y="362" width="210" rotation="90" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="293" a_damp="-0.1" y="276" width="40" rotation="100" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="292" a_damp="-0.1" y="311" width="40" rotation="81" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="292" l_damp="-0.1" y="410" width="40" rotation="81" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="295" a_damp="-0.1" y="446" width="40" rotation="93" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="293" a_damp="-0.1" y="360" width="69" rotation="96" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="204" a_damp="-0.1" y="22" width="500" l_damp="-0.1" height="80" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="354" a_damp="-0.1" y="56" width="92" rotation="-4" height="20" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="108" l_damp="-0.1" y="56" width="80" rotation="3" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="116" l_damp="-0.1" y="56" width="80" rotation="-4" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="133" l_damp="-0.1" y="173" width="30" rotation="84" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="132" a_damp="-0.1" y="199" width="30" rotation="-81" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="29" a_damp="-0.1" y="207" width="30" rotation="-41" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="9" a_damp="-0.1" y="240" width="50" l_damp="-0.1" height="60" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="619" a_damp="-0.1" y="739" width="20" rotation="-19" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="36" a_damp="-0.1" y="371" width="160" l_damp="-0.1" height="220" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="96" a_damp="-0.1" y="267" width="100" l_damp="-0.1" height="12" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="640" y="21" width="100" l_damp="-0.1" height="98" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="665" a_damp="-0.1" y="317" width="154" l_damp="-0.1" height="318" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="106" a_damp="-0.1" y="446" width="40" rotation="77" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="105" a_damp="-0.1" y="428" width="40" rotation="88" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="106" a_damp="-0.1" y="401" width="40" rotation="99" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="113" a_damp="-0.1" y="373" width="40" rotation="114" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="96" a_damp="-0.1" y="277" width="100" rotation="-10" height="12" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="449" a_damp="-0.1" y="264" width="118" l_damp="-0.1" height="42" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="394" a_damp="-0.1" y="445" width="50" rotation="113" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="400" a_damp="-0.1" y="416" width="50" rotation="99" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="402" a_damp="-0.1" y="385" width="50" rotation="86" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="404" l_damp="-0.1" y="339" width="50" rotation="99" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="400" a_damp="-0.1" y="320" width="50" rotation="83" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="398" a_damp="-0.1" y="273" width="50" rotation="92" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="463" a_damp="-0.1" y="241" width="50" rotation="12" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="480" a_damp="-0.1" y="242" width="50" rotation="7" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="495" a_damp="-0.1" y="246" width="30" rotation="84" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="495" a_damp="-0.1" y="273" width="30" rotation="95" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="514" a_damp="-0.1" y="297" width="30" rotation="167" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="586" a_damp="-0.1" y="258" width="30" rotation="113" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="592" a_damp="-0.1" y="236" width="30" rotation="101" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="595" a_damp="-0.1" y="210" width="30" rotation="92" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="507" a_damp="-0.1" y="390" width="234" l_damp="-0.1" height="212" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="577" a_damp="-0.1" y="292" width="48" rotation="101" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="599" a_damp="-0.1" y="179" width="39" rotation="99" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="441" a_damp="-0.1" y="16" width="39" rotation="77" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="599" l_damp="-0.1" y="48" width="39" rotation="77" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="586" a_damp="-0.1" y="12" width="39" rotation="66" height="30" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="417" a_damp="-0.1" y="235" width="50" rotation="4" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="371" a_damp="-0.1" y="236" width="50" rotation="-8" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="348" a_damp="-0.1" y="240" width="50" rotation="10" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="303" a_damp="-0.1" y="239" width="50" rotation="-7" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="306" a_damp="-0.1" y="246" width="50" rotation="2" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="351" a_damp="-0.1" y="245" width="50" rotation="-4" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="383" a_damp="-0.1" y="253" width="50" rotation="22" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="391" a_damp="-0.1" y="243" width="234" l_damp="-0.1" height="28" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="22" a_damp="-0.1" y="265" width="30" rotation="41" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="60" a_damp="-0.1" y="190" width="170" l_damp="-0.1" height="54" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="24" a_damp="-0.1" y="170" width="80" rotation="-4" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="102" a_damp="-0.1" y="169" width="80" rotation="3" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="38" l_damp="-0.1" y="57" width="80" rotation="3" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="187" l_damp="-0.1" y="55" width="80" rotation="-4" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="191" a_damp="-0.1" y="56" width="80" rotation="-2" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="270" a_damp="-0.1" y="57" width="80" rotation="4" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="440" a_damp="-0.1" y="46" width="36" rotation="99" height="34" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="hero" density="1" x="200" y="526" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="201" y="387" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bAcidCloud01" density="1" x="213" a_damp="-0.1" y="114" width="123" l_damp="-0.1" height="70" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="t_doska4" x="142" a_damp="-0.1" y="240" width="30" rotation="90" height="16" strength="0.2" friction="0.5" l_damp="-0.1" restitution="0.2"/>
				  <body name="rev" x="637" a_damp="-0.1" y="110" width="120" l_damp="-0.1" height="120" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="statObj_3" density="1" x="639" a_damp="-0.1" y="112" width="100" l_damp="-0.1" height="86" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" strength="0.1" rotation="90" density="1" friction="0.5" restitution="0.2" x="531" y="131" width="306" l_damp="-0.1" height="5" a_damp="-0.1"/>
				  <body name="gFan01" x="105" a_damp="-0.1" y="321" width="116" l_damp="4" height="111" mirrorShape="1" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="picStat_2" density="1" x="154" a_damp="-0.1" y="240" width="265" l_damp="-0.1" height="5" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit2" density="1" x="20" y="239" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gykffkhj" strength="0.1" rotation="31" density="1" friction="0.5" restitution="0.2" x="476" y="271" width="124" l_damp="-0.1" height="14" a_damp="-0.1"/>
				  <body name="dragLimit2" density="1" x="531" y="295" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bDrag09" strength="0.1" density="1" friction="0.5" restitution="0.2" x="211" y="239" width="106" l_damp="-0.1" height="37" mirrorShape="1" a_damp="-0.1"/>
				  <body name="bDrag09" strength="0.2" rotation="90" density="1" friction="0.5" restitution="0.2" x="531" y="114" width="106" l_damp="-0.1" height="37" a_damp="-0.1"/>
				  <body name="timerFall" density="1" x="396" y="240" width="130" l_damp="undefined" height="43" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="dragLimit2" density="1" x="288" y="243" width="40" l_damp="undefined" height="38" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="gBar12" density="1" x="263" a_damp="9.2" y="114" width="953" l_damp="0" height="81" strength="0.1" friction="0.1" restitution="0.2"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="0" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 30_" yKonstruktor="-300" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="342" y="248" width="650" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="383" l_damp="-0.1" y="298" width="60" rotation="-5" height="14" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="325" l_damp="-0.1" y="299" width="60" rotation="2" height="14" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="367" a_damp="-0.1" y="159" width="60" rotation="2" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="35" a_damp="-0.1" y="15" width="50" rotation="99" height="15" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="33" a_damp="-0.1" y="65" width="50" rotation="85" height="15" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="30" a_damp="-0.1" y="113" width="50" rotation="101" height="15" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="16" a_damp="-0.1" y="74" width="148" rotation="90" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="353" y="285" width="650" l_damp="-0.1" height="38" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="583" l_damp="-0.1" y="291" width="92" rotation="3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="625" l_damp="-0.1" y="292" width="92" rotation="6" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="94" l_damp="-0.1" y="294" width="92" rotation="-6" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="138" l_damp="-0.1" y="292" width="92" rotation="-3" height="30" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pesok" x="342" a_damp="-0.1" y="211" width="650" l_damp="-0.1" height="38" strength="0.1" friction="0.5"/>
				  <body name="t_pesok" x="341" a_damp="-0.1" y="174" width="650" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="132" a_damp="-0.1" y="167" width="92" rotation="3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="90" a_damp="-0.1" y="165" width="92" rotation="6" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="575" a_damp="-0.1" y="168" width="92" rotation="-3" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="620" a_damp="-0.1" y="166" width="92" rotation="-6" height="30" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-5" a_damp="-0.1" y="-5" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="310" a_damp="-0.1" y="160" width="60" rotation="-5" height="14" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" l_damp="-0.1" height="5" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="404" l_damp="-0.1" y="258" width="70" rotation="86" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="254" l_damp="-0.1" y="257" width="70" rotation="86" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="287" l_damp="-0.1" y="188" width="70" rotation="86" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="429" l_damp="-0.1" y="302" width="24" rotation="-21" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="412" l_damp="-0.1" y="303" width="24" rotation="23" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="261" a_damp="-0.1" y="302" width="24" rotation="23" height="16" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="278" a_damp="-0.1" y="301" width="24" rotation="-21" height="16" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="412" l_damp="-0.1" y="156" width="24" rotation="-20" height="16" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-5" a_damp="-0.1" y="426" width="84" rotation="-86" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="687" a_damp="-0.1" y="406" width="52" rotation="-70" height="44" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="680" l_damp="-0.1" y="334" width="52" rotation="-99" height="35" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="691" l_damp="-0.1" y="382" width="52" rotation="-108" height="35" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="689" a_damp="-0.1" y="129" width="52" rotation="-61" height="35" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="692" a_damp="-0.1" y="107" width="52" rotation="-84" height="35" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="688" a_damp="-0.1" y="61" width="52" rotation="-108" height="35" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="677" a_damp="-0.1" y="13" width="52" rotation="-99" height="35" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="15" a_damp="-0.1" y="157" width="68" rotation="21" height="50" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="680" a_damp="-0.1" y="150" width="52" rotation="-29" height="35" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="421" l_damp="-0.1" y="229" width="152" rotation="90" height="48" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="727" a_damp="-0.1" y="233" width="165" rotation="90" height="134" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="663" a_damp="-0.1" y="301" width="10" rotation="29" height="28" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="-2" a_damp="-0.1" y="241" width="156" rotation="90" height="100" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="48" a_damp="-0.1" y="306" width="14" rotation="-29" height="22" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="271" a_damp="-0.1" y="229" width="152" rotation="90" height="48" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="673" l_damp="-0.1" y="448" width="52" rotation="-84" height="35" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="10" a_damp="-0.1" y="349" width="84" rotation="-74" height="56" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="428" a_damp="-0.1" y="157" width="24" rotation="27" height="16" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="264" a_damp="-0.1" y="157" width="24" rotation="-23" height="16" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="281" a_damp="-0.1" y="156" width="24" rotation="21" height="16" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="438" a_damp="-0.1" y="189" width="70" rotation="86" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="437" a_damp="-0.1" y="257" width="70" rotation="96" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="286" l_damp="-0.1" y="256" width="70" rotation="96" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="254" a_damp="-0.1" y="189" width="70" rotation="-86" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="404" l_damp="-0.1" y="189" width="70" rotation="-86" height="20" a_damp="-0.1" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="verevka" density="1" x="184" y="359" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="4" x="184" a_damp="-0.1" y="328" width="40" l_damp="-0.1" height="49" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="verevka" density="1" x="525" y="359" width="4" l_damp="undefined" height="29" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bBalloon" density="4" x="525" a_damp="-0.1" y="328" width="40" l_damp="-0.1" height="49" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="hero" density="1" x="343" a_damp="-0.1" y="405" width="95" l_damp="-0.1" height="146" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yLimit" x="343" y="339" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="bCactus31" density="1" x="94" y="239" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="162" y="262" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="208" y="221" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="152" y="194" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="484" y="232" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="548" y="193" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="542" y="262" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactus31" density="1" x="602" y="231" width="30" l_damp="-0.1" height="30" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="bBat02" density="1" x="347" a_damp="-0.1" y="70" width="104" l_damp="0" height="99" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="bCactusA05" strength="0.1" density="1" friction="0.5" restitution="0.2" x="524" y="403" width="48" l_damp="-0.2" height="77" mirrorShape="1" a_damp="-0.1"/>
				  <body name="bCactusA05" density="1" x="186" a_damp="-0.1" y="404" width="48" l_damp="-0.2" height="77" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="xdfths" density="1" x="186" a_damp="-0.1" y="430" width="29" l_damp="-0.1" height="8" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="xdfths" density="1" x="524" y="427" width="29" l_damp="-0.1" height="8" a_damp="-0.1" friction="0.5" restitution="0.2"/>
				  <body name="star" x="583" y="50" width="25" l_damp="undefined" height="24" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint" density="1" x="184" y="370" width="10" l_damp="undefined" height="10" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint" density="1" x="525" y="368" width="10" l_damp="undefined" height="10" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="186" y="429" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="t_joint_fixed" density="1" x="524" y="427" width="9" l_damp="undefined" height="9" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="holePes" x="92" a_damp="-0.1" y="238" width="34" l_damp="-0.1" height="34" strength="0.2" friction="0.5"/>
				  <body name="holePes" x="151" a_damp="-0.1" y="194" width="34" l_damp="-0.1" height="34" strength="0.1" friction="0.5"/>
				  <body name="holePes" x="207" a_damp="-0.1" y="221" width="34" l_damp="-0.1" height="34" strength="0.1" friction="0.5"/>
				  <body name="holePes" x="162" a_damp="-0.1" y="262" width="34" l_damp="-0.1" height="34" strength="0.1" friction="0.5"/>
				  <body name="holePes" x="483" y="231" width="34" l_damp="-0.1" height="34" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="547" y="193" width="34" l_damp="-0.1" height="34" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="600" y="230" width="34" l_damp="-0.1" height="34" a_damp="-0.1" friction="0.5"/>
				  <body name="holePes" x="541" y="262" width="34" l_damp="-0.1" height="34" a_damp="-0.1" friction="0.5"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa nickLevel="Player" xKonstruktor="0" yL="0" numberLevel="0" alphaKonstruktor="" xL="0" nameLevel="Level 31_" yKonstruktor="-300" fon="1" selectedType="Stat">
				<bodies>
				  <body name="t_pesok" x="341" a_damp="-0.1" y="263" width="134" rotation="95" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="346" a_damp="-0.1" y="237" width="134" rotation="119" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="530" a_damp="-0.1" y="61" width="80" rotation="-9" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="472" a_damp="-0.1" y="113" width="276" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="569" a_damp="-0.1" y="138" width="102" rotation="5" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="471" a_damp="-0.1" y="149" width="114" rotation="166" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="69" a_damp="-0.1" y="364" width="194" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="-50" a_damp="-0.1" y="-50" width="5" rotation="90" height="5" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="250" a_damp="-0.1" y="262" width="334" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="102" a_damp="-0.1" y="311" width="300" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="139" a_damp="-0.1" y="298" width="327" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="176" a_damp="-0.1" y="288" width="348" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="213" a_damp="-0.1" y="279" width="367" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="391" a_damp="-0.1" y="184" width="80" rotation="145" height="38" strength="0.1" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="469" a_damp="-0.1" y="76" width="260" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="402" a_damp="-0.1" y="150" width="124" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="361" a_damp="-0.1" y="184" width="38" l_damp="-0.1" height="38" strength="0.2" friction="0.5"/>
				  <body name="t_pesok" x="413" a_damp="-0.1" y="62" width="70" rotation="175" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="479" a_damp="-0.1" y="65" width="70" rotation="9" height="20" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="324" a_damp="-0.1" y="196" width="252" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pesok" x="287" a_damp="-0.1" y="226" width="320" rotation="90" height="38" strength="0.2" friction="0.5" l_damp="-0.1"/>
				  <body name="t_pol" x="652" y="381" width="186" l_damp="0" height="134" a_damp="0" friction="0.5"/>
				  <body name="t_pol" x="280" a_damp="0" y="437" width="84" rotation="-141" height="89" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="325" a_damp="0" y="420" width="36" l_damp="0" height="200" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="627" a_damp="0" y="183" width="42" rotation="-67" height="34" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="348" a_damp="0" y="343" width="20" l_damp="0" height="50" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="584" a_damp="0" y="335" width="44" rotation="-7" height="50" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="536" a_damp="0" y="394" width="20" rotation="10" height="56" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="545" l_damp="0" y="354" width="20" rotation="19" height="32" a_damp="0" friction="0.5"/>
				  <body name="t_pol" x="535" a_damp="0" y="445" width="20" rotation="-8" height="56" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="119" a_damp="0" y="83" width="146" rotation="-140" height="88" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="181" a_damp="0" y="70" width="106" rotation="-115" height="88" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="60" a_damp="0" y="123" width="164" rotation="-124" height="100" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="370" l_damp="0" y="23" width="32" rotation="-122" height="34" a_damp="0" friction="0.5"/>
				  <body name="t_pol" x="373" a_damp="0" y="36" width="30" rotation="-153" height="32" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="56" a_damp="0" y="265" width="56" rotation="-179" height="88" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="45" a_damp="0" y="344" width="56" rotation="-164" height="88" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="45" a_damp="0" y="405" width="20" rotation="19" height="32" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="660" a_damp="0" y="22" width="200" l_damp="0" height="50" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="358" a_damp="0" y="402" width="30" l_damp="0" height="134" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="181" a_damp="0" y="22" width="400" l_damp="0" height="50" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="24" a_damp="0" y="242" width="50" l_damp="0" height="500" strength="0.1" friction="0.5"/>
				  <body name="t_pol" x="768" y="158" width="300" l_damp="" height="324" a_damp="" friction="0.5"/>
				  <body name="t_pol" x="370" a_damp="0" y="405" width="20" rotation="-22" height="32" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="379" a_damp="0" y="445" width="20" rotation="-7" height="58" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="378" a_damp="0" y="351" width="20" l_damp="0" height="32" strength="0.2" friction="0.5"/>
				  <body name="t_pol" x="611" a_damp="0" y="324" width="44" rotation="-42" height="50" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="634" a_damp="0" y="288" width="44" rotation="-70" height="50" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="629" a_damp="0" y="136" width="60" rotation="-95" height="34" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="619" a_damp="0" y="102" width="60" rotation="-112" height="34" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="569" a_damp="0" y="30" width="32" rotation="-122" height="34" strength="0.1" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="557" a_damp="0" y="4" width="32" rotation="-109" height="34" strength="0.1" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="601" a_damp="0" y="59" width="60" rotation="-131" height="48" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="45" a_damp="0" y="446" width="20" rotation="-16" height="58" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="60" l_damp="0" y="215" width="56" rotation="-151" height="88" a_damp="0" friction="0.5"/>
				  <body name="t_pol" x="252" a_damp="0" y="70" width="56" rotation="-96" height="88" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="327" a_damp="0" y="50" width="56" rotation="-114" height="88" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="331" a_damp="0" y="328" width="56" rotation="-37" height="16" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="310" a_damp="0" y="372" width="56" rotation="-151" height="88" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="219" a_damp="0" y="476" width="30" rotation="-152" height="56" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="373" a_damp="0" y="379" width="20" rotation="19" height="32" strength="0.2" friction="0.5" l_damp="0"/>
				  <body name="t_pol" x="634" a_damp="0" y="402" width="186" l_damp="0" height="134" strength="0.2" friction="0.5"/>
				  <body name="t_shap" x="-5" a_damp="" y="-5" width="5" l_damp="" height="5" strength="0.1" friction="0.5"/>
				  <body name="bCactus01" strength="0.1" rotation="72" density="0.1" friction="0.5" restitution="0.2" x="472" y="306" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="72" density="0.1" friction="0.5" restitution="0.2" x="495" y="307" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="-90" density="0.1" friction="0.5" restitution="0.2" x="518" y="308" width="26" l_damp="-0.1" height="28" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="-90" density="0.1" friction="0.5" restitution="0.2" x="445" y="308" width="33" l_damp="-0.1" height="35" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="-90" density="0.1" friction="0.5" restitution="0.2" x="401" y="307" width="26" l_damp="-0.1" height="28" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.2" rotation="90" density="0.1" friction="0.5" restitution="0.2" x="422" y="307" width="28" l_damp="-0.1" height="30" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="-90" density="0.1" friction="0.5" restitution="0.2" x="414" y="292" width="26" l_damp="-0.1" height="28" a_damp="-0.1"/>
				  <body name="bCactus01" strength="0.1" rotation="72" density="0.1" friction="0.5" restitution="0.2" x="435" y="293" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				  <body name="swarm" density="1" x="455" a_damp="-0.1" y="237" width="118" l_damp="9" height="118" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="gFan01" x="631" a_damp="-0.1" y="234" width="116" l_damp="-0.1" height="111" strength="0.2" friction="0.5" restitution="0.2"/>
				  <body name="bBox10" density="0.2" x="458" a_damp="-0.1" y="322" width="190" l_damp="-0.1" height="20" strength="0.1" friction="0.5" restitution="0.2"/>
				  <body name="yMax" x="468" y="33" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="yLimit" x="455" y="368" width="96" l_damp="undefined" height="15" a_damp="undefined" friction="0.5"/>
				  <body name="hero" density="1" x="456" y="531" width="95" l_damp="undefined" height="146" a_damp="undefined" friction="0.5" restitution="0.2"/>
				  <body name="bCactus01" strength="0.1" rotation="72" density="1" friction="0.5" restitution="0.2" x="387" y="305" width="31" l_damp="-0.1" height="33" a_damp="-0.1"/>
				</bodies>
				<setting>
				  <core list="LLL" num="1"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         _loc1_ = <xml>
			  <jopa alphaKonstruktor="" nameLevel="Level 32_" yKonstruktor="0" yL="0" fon="1" nickLevel="Player" xL="0" xKonstruktor="0" numberLevel="0" selectedType="Stat">
				<bodies>
				  <body name="t_shap" x="-5" y="-5" width="5" height="5" l_damp="" strength="0.1" a_damp="" friction="0.5"/>
				  <body name="t_pol" x="47" y="-63" width="80" rotation="53" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="556" y="361" width="80" rotation="106" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="557" y="341" width="80" rotation="94" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="560" y="308" width="80" rotation="83" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="547" y="160" width="80" rotation="94" height="50" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="549" y="116" width="80" rotation="85" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="562" y="56" width="80" rotation="119" height="50" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="582" y="6" width="80" rotation="103" height="44" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="550" y="231" width="80" rotation="82" height="51" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="570" y="415" width="93" rotation="56" height="58" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="130" y="129" width="50" rotation="-15" height="40" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="86" y="69" width="80" rotation="66" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="103" y="105" width="80" rotation="32" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="71" y="-13" width="80" rotation="93" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="130" y="279" width="80" rotation="112" height="30" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="69" y="462" width="80" rotation="111" height="50" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="108" y="338" width="80" rotation="88" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="101" y="365" width="80" rotation="63" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="99" y="410" width="80" rotation="125" height="50" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="131" y="211" width="80" rotation="82" height="44" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="130" y="181" width="80" rotation="94" height="50" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="-7" y="235" width="200" height="500" l_damp="-0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="104" y="217" width="50" height="180" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="hero" restitution="0.2" x="259" density="1" y="520" width="95" height="146" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				  <body name="yLimit" x="262" y="-170" width="96" height="15" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				  <body name="yMax" x="260" y="224" width="96" height="15" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				  <body name="verevka" restitution="0.2" x="392" density="1" y="489" width="4" height="29" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				  <body name="verevka" restitution="0.2" x="463" density="1" y="489" width="4" height="29" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				  <body name="sInfo18" x="415" density="0.38" y="537" width="126" height="83" l_damp="-0.1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="bBalloon" restitution="0.2" x="392" density="1" y="462" width="34" height="40" l_damp="1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="bBalloon" restitution="0.2" x="463" density="1" y="462" width="34" height="40" l_damp="1" strength="0.1" a_damp="-0.1" friction="0.5"/>
				  <body name="t_pol" x="667" y="234" width="200" height="500" l_damp="-0.1" strength="0.2" a_damp="-0.1" friction="0.5"/>
				  <body name="t_joint_fixed" restitution="0.2" x="392" density="1" y="502" width="9" height="9" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				  <body name="t_joint_fixed" restitution="0.2" x="463" density="1" y="498" width="9" height="9" l_damp="undefined" a_damp="undefined" friction="0.5"/>
				</bodies>
				<setting>
				  <core num="1" list="LLL"/>
				</setting>
			  </jopa>
			</xml>;
         _loc2_.push(_loc1_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(ClassFlags.isSaveLevelsFromCodeToShara)
            {
               ClassSetDataGame.saveXMLLevelToShara(_loc2_[_loc3_],_loc3_ + 1);
            }
            _loc3_++;
         }
         ClassFlags.isSaveLevelsFromCodeToShara = false;
         return _loc2_;
      }
   }
}

