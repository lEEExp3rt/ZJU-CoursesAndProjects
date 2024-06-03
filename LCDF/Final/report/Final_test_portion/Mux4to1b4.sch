<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S(1:0)" />
        <signal name="XLXN_6" />
        <signal name="XLXN_14" />
        <signal name="S(0)" />
        <signal name="S(1)" />
        <signal name="D0(3:0)" />
        <signal name="D1(3:0)" />
        <signal name="D2(3:0)" />
        <signal name="D3(3:0)" />
        <signal name="XLXN_24" />
        <signal name="XLXN_32" />
        <signal name="XLXN_36" />
        <signal name="XLXN_40" />
        <signal name="D0(0)" />
        <signal name="D1(0)" />
        <signal name="D2(0)" />
        <signal name="D3(0)" />
        <signal name="D0(1)" />
        <signal name="D1(1)" />
        <signal name="D2(1)" />
        <signal name="D3(1)" />
        <signal name="D0(2)" />
        <signal name="D1(2)" />
        <signal name="D2(2)" />
        <signal name="D3(2)" />
        <signal name="D0(3)" />
        <signal name="D1(3)" />
        <signal name="D2(3)" />
        <signal name="D3(3)" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64" />
        <signal name="XLXN_65" />
        <signal name="XLXN_66" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_74" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="Y(3:0)" />
        <signal name="Y(0)" />
        <signal name="Y(1)" />
        <signal name="Y(2)" />
        <signal name="Y(3)" />
        <port polarity="Input" name="S(1:0)" />
        <port polarity="Input" name="D0(3:0)" />
        <port polarity="Input" name="D1(3:0)" />
        <port polarity="Input" name="D2(3:0)" />
        <port polarity="Input" name="D3(3:0)" />
        <port polarity="Output" name="Y(3:0)" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="XLXN_14" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="XLXN_24" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="XLXN_14" name="I0" />
            <blockpin signalname="S(0)" name="I1" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="S(1)" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="XLXN_36" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="S(1)" name="I0" />
            <blockpin signalname="S(0)" name="I1" />
            <blockpin signalname="XLXN_40" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="D0(0)" name="I0" />
            <blockpin signalname="XLXN_24" name="I1" />
            <blockpin signalname="XLXN_63" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="D2(0)" name="I0" />
            <blockpin signalname="XLXN_36" name="I1" />
            <blockpin signalname="XLXN_65" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="D3(0)" name="I0" />
            <blockpin signalname="XLXN_40" name="I1" />
            <blockpin signalname="XLXN_66" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="D1(1)" name="I0" />
            <blockpin signalname="XLXN_32" name="I1" />
            <blockpin signalname="XLXN_68" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_9">
            <blockpin signalname="D3(1)" name="I0" />
            <blockpin signalname="XLXN_40" name="I1" />
            <blockpin signalname="XLXN_70" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="D0(2)" name="I0" />
            <blockpin signalname="XLXN_24" name="I1" />
            <blockpin signalname="XLXN_71" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_11">
            <blockpin signalname="D1(2)" name="I0" />
            <blockpin signalname="XLXN_32" name="I1" />
            <blockpin signalname="XLXN_72" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="D2(2)" name="I0" />
            <blockpin signalname="XLXN_36" name="I1" />
            <blockpin signalname="XLXN_73" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_13">
            <blockpin signalname="D2(1)" name="I0" />
            <blockpin signalname="XLXN_36" name="I1" />
            <blockpin signalname="XLXN_69" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_14">
            <blockpin signalname="D0(1)" name="I0" />
            <blockpin signalname="XLXN_24" name="I1" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_15">
            <blockpin signalname="D1(0)" name="I0" />
            <blockpin signalname="XLXN_32" name="I1" />
            <blockpin signalname="XLXN_64" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_16">
            <blockpin signalname="D3(2)" name="I0" />
            <blockpin signalname="XLXN_40" name="I1" />
            <blockpin signalname="XLXN_74" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_17">
            <blockpin signalname="D0(3)" name="I0" />
            <blockpin signalname="XLXN_24" name="I1" />
            <blockpin signalname="XLXN_75" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_18">
            <blockpin signalname="D1(3)" name="I0" />
            <blockpin signalname="XLXN_32" name="I1" />
            <blockpin signalname="XLXN_76" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_19">
            <blockpin signalname="D2(3)" name="I0" />
            <blockpin signalname="XLXN_36" name="I1" />
            <blockpin signalname="XLXN_77" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_20">
            <blockpin signalname="D3(3)" name="I0" />
            <blockpin signalname="XLXN_40" name="I1" />
            <blockpin signalname="XLXN_78" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_21">
            <blockpin signalname="XLXN_66" name="I0" />
            <blockpin signalname="XLXN_65" name="I1" />
            <blockpin signalname="XLXN_64" name="I2" />
            <blockpin signalname="XLXN_63" name="I3" />
            <blockpin signalname="Y(0)" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_22">
            <blockpin signalname="XLXN_70" name="I0" />
            <blockpin signalname="XLXN_69" name="I1" />
            <blockpin signalname="XLXN_68" name="I2" />
            <blockpin signalname="XLXN_67" name="I3" />
            <blockpin signalname="Y(1)" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_23">
            <blockpin signalname="XLXN_74" name="I0" />
            <blockpin signalname="XLXN_73" name="I1" />
            <blockpin signalname="XLXN_72" name="I2" />
            <blockpin signalname="XLXN_71" name="I3" />
            <blockpin signalname="Y(2)" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_24">
            <blockpin signalname="XLXN_78" name="I0" />
            <blockpin signalname="XLXN_77" name="I1" />
            <blockpin signalname="XLXN_76" name="I2" />
            <blockpin signalname="XLXN_75" name="I3" />
            <blockpin signalname="Y(3)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_25">
            <blockpin signalname="S(0)" name="I" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="S(1)" name="I" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="1008" y="384" name="XLXI_1" orien="R0" />
        <instance x="1008" y="704" name="XLXI_2" orien="R0" />
        <instance x="1008" y="944" name="XLXI_3" orien="R0" />
        <instance x="1008" y="1232" name="XLXI_4" orien="R0" />
        <instance x="2336" y="352" name="XLXI_5" orien="R0" />
        <instance x="2320" y="656" name="XLXI_6" orien="R0" />
        <instance x="2320" y="896" name="XLXI_7" orien="R0" />
        <instance x="2336" y="1216" name="XLXI_8" orien="R0" />
        <instance x="2336" y="1712" name="XLXI_9" orien="R0" />
        <instance x="2336" y="1968" name="XLXI_10" orien="R0" />
        <instance x="2336" y="2240" name="XLXI_11" orien="R0" />
        <instance x="2368" y="2512" name="XLXI_12" orien="R0" />
        <instance x="2336" y="1456" name="XLXI_13" orien="R0" />
        <instance x="2336" y="1056" name="XLXI_14" orien="R0" />
        <instance x="2336" y="496" name="XLXI_15" orien="R0" />
        <instance x="2384" y="2752" name="XLXI_16" orien="R0" />
        <instance x="2368" y="2960" name="XLXI_17" orien="R0" />
        <instance x="2368" y="3136" name="XLXI_18" orien="R0" />
        <instance x="2352" y="3312" name="XLXI_19" orien="R0" />
        <instance x="2384" y="3488" name="XLXI_20" orien="R0" />
        <instance x="3360" y="736" name="XLXI_21" orien="R0" />
        <instance x="3376" y="1440" name="XLXI_22" orien="R0" />
        <instance x="3392" y="2368" name="XLXI_23" orien="R0" />
        <instance x="3392" y="3024" name="XLXI_24" orien="R0" />
        <branch name="S(1:0)">
            <wire x2="416" y1="240" y2="240" x1="288" />
            <wire x2="416" y1="240" y2="320" x1="416" />
            <wire x2="416" y1="320" y2="432" x1="416" />
            <wire x2="416" y1="432" y2="544" x1="416" />
        </branch>
        <bustap x2="512" y1="320" y2="320" x1="416" />
        <bustap x2="512" y1="432" y2="432" x1="416" />
        <iomarker fontsize="28" x="288" y="240" name="S(1:0)" orien="R180" />
        <instance x="640" y="352" name="XLXI_25" orien="R0" />
        <instance x="656" y="464" name="XLXI_26" orien="R0" />
        <branch name="XLXN_6">
            <wire x2="896" y1="320" y2="320" x1="864" />
            <wire x2="928" y1="320" y2="320" x1="896" />
            <wire x2="896" y1="272" y2="320" x1="896" />
            <wire x2="992" y1="272" y2="272" x1="896" />
            <wire x2="992" y1="272" y2="816" x1="992" />
            <wire x2="1008" y1="816" y2="816" x1="992" />
            <wire x2="928" y1="256" y2="320" x1="928" />
            <wire x2="1008" y1="256" y2="256" x1="928" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="896" y1="432" y2="432" x1="880" />
            <wire x2="944" y1="432" y2="432" x1="896" />
            <wire x2="896" y1="432" y2="640" x1="896" />
            <wire x2="1008" y1="640" y2="640" x1="896" />
            <wire x2="944" y1="320" y2="432" x1="944" />
            <wire x2="1008" y1="320" y2="320" x1="944" />
        </branch>
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="530" y="320" type="branch" />
            <wire x2="528" y1="320" y2="320" x1="512" />
            <wire x2="544" y1="320" y2="320" x1="528" />
            <wire x2="640" y1="320" y2="320" x1="544" />
            <wire x2="544" y1="320" y2="576" x1="544" />
            <wire x2="1008" y1="576" y2="576" x1="544" />
            <wire x2="544" y1="576" y2="1104" x1="544" />
            <wire x2="1008" y1="1104" y2="1104" x1="544" />
        </branch>
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="533" y="432" type="branch" />
            <wire x2="528" y1="432" y2="432" x1="512" />
            <wire x2="592" y1="432" y2="432" x1="528" />
            <wire x2="592" y1="432" y2="880" x1="592" />
            <wire x2="1008" y1="880" y2="880" x1="592" />
            <wire x2="592" y1="880" y2="1168" x1="592" />
            <wire x2="1008" y1="1168" y2="1168" x1="592" />
            <wire x2="656" y1="432" y2="432" x1="592" />
        </branch>
        <branch name="D0(3:0)">
            <wire x2="672" y1="1392" y2="1392" x1="512" />
            <wire x2="672" y1="1392" y2="1424" x1="672" />
            <wire x2="672" y1="1424" y2="1456" x1="672" />
            <wire x2="672" y1="1456" y2="1488" x1="672" />
            <wire x2="672" y1="1248" y2="1312" x1="672" />
            <wire x2="672" y1="1312" y2="1360" x1="672" />
            <wire x2="672" y1="1360" y2="1392" x1="672" />
        </branch>
        <branch name="D1(3:0)">
            <wire x2="672" y1="1792" y2="1792" x1="512" />
            <wire x2="672" y1="1792" y2="1840" x1="672" />
            <wire x2="672" y1="1840" y2="1888" x1="672" />
            <wire x2="672" y1="1888" y2="1936" x1="672" />
            <wire x2="672" y1="1664" y2="1696" x1="672" />
            <wire x2="672" y1="1696" y2="1760" x1="672" />
            <wire x2="672" y1="1760" y2="1792" x1="672" />
        </branch>
        <branch name="D2(3:0)">
            <wire x2="672" y1="2176" y2="2176" x1="528" />
            <wire x2="672" y1="2176" y2="2208" x1="672" />
            <wire x2="672" y1="2208" y2="2256" x1="672" />
            <wire x2="672" y1="2256" y2="2304" x1="672" />
            <wire x2="672" y1="2080" y2="2128" x1="672" />
            <wire x2="672" y1="2128" y2="2160" x1="672" />
            <wire x2="672" y1="2160" y2="2176" x1="672" />
        </branch>
        <branch name="D3(3:0)">
            <wire x2="688" y1="2688" y2="2688" x1="512" />
            <wire x2="688" y1="2688" y2="2720" x1="688" />
            <wire x2="688" y1="2720" y2="2784" x1="688" />
            <wire x2="688" y1="2784" y2="2832" x1="688" />
            <wire x2="688" y1="2512" y2="2576" x1="688" />
            <wire x2="688" y1="2576" y2="2640" x1="688" />
            <wire x2="688" y1="2640" y2="2688" x1="688" />
        </branch>
        <iomarker fontsize="28" x="512" y="1792" name="D1(3:0)" orien="R180" />
        <iomarker fontsize="28" x="512" y="1392" name="D0(3:0)" orien="R180" />
        <iomarker fontsize="28" x="528" y="2176" name="D2(3:0)" orien="R180" />
        <iomarker fontsize="28" x="512" y="2688" name="D3(3:0)" orien="R180" />
        <bustap x2="768" y1="1312" y2="1312" x1="672" />
        <bustap x2="768" y1="1360" y2="1360" x1="672" />
        <bustap x2="768" y1="1424" y2="1424" x1="672" />
        <bustap x2="768" y1="1456" y2="1456" x1="672" />
        <bustap x2="768" y1="1696" y2="1696" x1="672" />
        <bustap x2="768" y1="1760" y2="1760" x1="672" />
        <bustap x2="768" y1="1840" y2="1840" x1="672" />
        <bustap x2="768" y1="1888" y2="1888" x1="672" />
        <bustap x2="768" y1="2128" y2="2128" x1="672" />
        <bustap x2="768" y1="2160" y2="2160" x1="672" />
        <bustap x2="768" y1="2208" y2="2208" x1="672" />
        <bustap x2="768" y1="2256" y2="2256" x1="672" />
        <bustap x2="784" y1="2576" y2="2576" x1="688" />
        <bustap x2="784" y1="2640" y2="2640" x1="688" />
        <bustap x2="784" y1="2720" y2="2720" x1="688" />
        <bustap x2="784" y1="2784" y2="2784" x1="688" />
        <branch name="XLXN_24">
            <wire x2="1792" y1="288" y2="288" x1="1264" />
            <wire x2="1792" y1="288" y2="928" x1="1792" />
            <wire x2="2336" y1="928" y2="928" x1="1792" />
            <wire x2="1792" y1="928" y2="1840" x1="1792" />
            <wire x2="2336" y1="1840" y2="1840" x1="1792" />
            <wire x2="1792" y1="1840" y2="2832" x1="1792" />
            <wire x2="2368" y1="2832" y2="2832" x1="1792" />
            <wire x2="1792" y1="224" y2="288" x1="1792" />
            <wire x2="2336" y1="224" y2="224" x1="1792" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="1776" y1="608" y2="608" x1="1264" />
            <wire x2="1776" y1="608" y2="1088" x1="1776" />
            <wire x2="2336" y1="1088" y2="1088" x1="1776" />
            <wire x2="1776" y1="1088" y2="2112" x1="1776" />
            <wire x2="2336" y1="2112" y2="2112" x1="1776" />
            <wire x2="1776" y1="2112" y2="3008" x1="1776" />
            <wire x2="2368" y1="3008" y2="3008" x1="1776" />
            <wire x2="1776" y1="368" y2="608" x1="1776" />
            <wire x2="2336" y1="368" y2="368" x1="1776" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="1808" y1="848" y2="848" x1="1264" />
            <wire x2="1808" y1="848" y2="1328" x1="1808" />
            <wire x2="2336" y1="1328" y2="1328" x1="1808" />
            <wire x2="1808" y1="1328" y2="2384" x1="1808" />
            <wire x2="2368" y1="2384" y2="2384" x1="1808" />
            <wire x2="1808" y1="2384" y2="3184" x1="1808" />
            <wire x2="2352" y1="3184" y2="3184" x1="1808" />
            <wire x2="1808" y1="528" y2="848" x1="1808" />
            <wire x2="2320" y1="528" y2="528" x1="1808" />
        </branch>
        <branch name="XLXN_40">
            <wire x2="1760" y1="1136" y2="1136" x1="1264" />
            <wire x2="1760" y1="1136" y2="1584" x1="1760" />
            <wire x2="2336" y1="1584" y2="1584" x1="1760" />
            <wire x2="1760" y1="1584" y2="2624" x1="1760" />
            <wire x2="2384" y1="2624" y2="2624" x1="1760" />
            <wire x2="1760" y1="2624" y2="3360" x1="1760" />
            <wire x2="2384" y1="3360" y2="3360" x1="1760" />
            <wire x2="1760" y1="768" y2="1136" x1="1760" />
            <wire x2="2320" y1="768" y2="768" x1="1760" />
        </branch>
        <branch name="D0(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="919" y="1312" type="branch" />
            <wire x2="912" y1="1312" y2="1312" x1="768" />
            <wire x2="1872" y1="1312" y2="1312" x1="912" />
            <wire x2="1872" y1="288" y2="1312" x1="1872" />
            <wire x2="2336" y1="288" y2="288" x1="1872" />
        </branch>
        <branch name="D1(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="861" y="1696" type="branch" />
            <wire x2="864" y1="1696" y2="1696" x1="768" />
            <wire x2="1552" y1="1696" y2="1696" x1="864" />
            <wire x2="1552" y1="432" y2="1696" x1="1552" />
            <wire x2="2336" y1="432" y2="432" x1="1552" />
        </branch>
        <branch name="D2(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="909" y="2128" type="branch" />
            <wire x2="912" y1="2128" y2="2128" x1="768" />
            <wire x2="1536" y1="2128" y2="2128" x1="912" />
            <wire x2="1536" y1="592" y2="2128" x1="1536" />
            <wire x2="2320" y1="592" y2="592" x1="1536" />
        </branch>
        <branch name="D3(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="908" y="2576" type="branch" />
            <wire x2="912" y1="2576" y2="2576" x1="784" />
            <wire x2="1520" y1="2576" y2="2576" x1="912" />
            <wire x2="1520" y1="832" y2="2576" x1="1520" />
            <wire x2="2320" y1="832" y2="832" x1="1520" />
        </branch>
        <branch name="D0(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="870" y="1360" type="branch" />
            <wire x2="864" y1="1360" y2="1360" x1="768" />
            <wire x2="1504" y1="1360" y2="1360" x1="864" />
            <wire x2="1504" y1="992" y2="1360" x1="1504" />
            <wire x2="2336" y1="992" y2="992" x1="1504" />
        </branch>
        <branch name="D1(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="861" y="1760" type="branch" />
            <wire x2="864" y1="1760" y2="1760" x1="768" />
            <wire x2="1568" y1="1760" y2="1760" x1="864" />
            <wire x2="1568" y1="1152" y2="1760" x1="1568" />
            <wire x2="2336" y1="1152" y2="1152" x1="1568" />
        </branch>
        <branch name="D2(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="817" y="2160" type="branch" />
            <wire x2="816" y1="2160" y2="2160" x1="768" />
            <wire x2="1584" y1="2160" y2="2160" x1="816" />
            <wire x2="1584" y1="1392" y2="2160" x1="1584" />
            <wire x2="2336" y1="1392" y2="1392" x1="1584" />
        </branch>
        <branch name="D3(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="856" y="2640" type="branch" />
            <wire x2="864" y1="2640" y2="2640" x1="784" />
            <wire x2="1600" y1="2640" y2="2640" x1="864" />
            <wire x2="1600" y1="1648" y2="2640" x1="1600" />
            <wire x2="2336" y1="1648" y2="1648" x1="1600" />
        </branch>
        <branch name="D0(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="916" y="1424" type="branch" />
            <wire x2="912" y1="1424" y2="1424" x1="768" />
            <wire x2="1504" y1="1424" y2="1424" x1="912" />
            <wire x2="1504" y1="1424" y2="1904" x1="1504" />
            <wire x2="2336" y1="1904" y2="1904" x1="1504" />
        </branch>
        <branch name="D1(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="903" y="1840" type="branch" />
            <wire x2="896" y1="1840" y2="1840" x1="768" />
            <wire x2="1552" y1="1840" y2="1840" x1="896" />
            <wire x2="1552" y1="1840" y2="2176" x1="1552" />
            <wire x2="2336" y1="2176" y2="2176" x1="1552" />
        </branch>
        <branch name="D2(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="880" y="2208" type="branch" />
            <wire x2="880" y1="2208" y2="2208" x1="768" />
            <wire x2="1568" y1="2208" y2="2208" x1="880" />
            <wire x2="1568" y1="2208" y2="2448" x1="1568" />
            <wire x2="2368" y1="2448" y2="2448" x1="1568" />
        </branch>
        <branch name="D3(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="863" y="2720" type="branch" />
            <wire x2="864" y1="2720" y2="2720" x1="784" />
            <wire x2="1584" y1="2720" y2="2720" x1="864" />
            <wire x2="1584" y1="2688" y2="2720" x1="1584" />
            <wire x2="2384" y1="2688" y2="2688" x1="1584" />
        </branch>
        <branch name="D0(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="872" y="1456" type="branch" />
            <wire x2="880" y1="1456" y2="1456" x1="768" />
            <wire x2="1616" y1="1456" y2="1456" x1="880" />
            <wire x2="1616" y1="1456" y2="2896" x1="1616" />
            <wire x2="2368" y1="2896" y2="2896" x1="1616" />
        </branch>
        <branch name="D1(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="896" y="1888" type="branch" />
            <wire x2="896" y1="1888" y2="1888" x1="768" />
            <wire x2="1488" y1="1888" y2="1888" x1="896" />
            <wire x2="1488" y1="1888" y2="3072" x1="1488" />
            <wire x2="2368" y1="3072" y2="3072" x1="1488" />
        </branch>
        <branch name="D2(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="835" y="2256" type="branch" />
            <wire x2="832" y1="2256" y2="2256" x1="768" />
            <wire x2="1552" y1="2256" y2="2256" x1="832" />
            <wire x2="1552" y1="2256" y2="3248" x1="1552" />
            <wire x2="2352" y1="3248" y2="3248" x1="1552" />
        </branch>
        <branch name="D3(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="856" y="2784" type="branch" />
            <wire x2="864" y1="2784" y2="2784" x1="784" />
            <wire x2="1584" y1="2784" y2="2784" x1="864" />
            <wire x2="1584" y1="2784" y2="3424" x1="1584" />
            <wire x2="2384" y1="3424" y2="3424" x1="1584" />
        </branch>
        <branch name="XLXN_63">
            <wire x2="3360" y1="256" y2="256" x1="2592" />
            <wire x2="3360" y1="256" y2="480" x1="3360" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="2976" y1="400" y2="400" x1="2592" />
            <wire x2="2976" y1="400" y2="544" x1="2976" />
            <wire x2="3360" y1="544" y2="544" x1="2976" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="2960" y1="560" y2="560" x1="2576" />
            <wire x2="2960" y1="560" y2="608" x1="2960" />
            <wire x2="3360" y1="608" y2="608" x1="2960" />
        </branch>
        <branch name="XLXN_66">
            <wire x2="3360" y1="800" y2="800" x1="2576" />
            <wire x2="3360" y1="672" y2="800" x1="3360" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="3376" y1="960" y2="960" x1="2592" />
            <wire x2="3376" y1="960" y2="1184" x1="3376" />
        </branch>
        <branch name="XLXN_68">
            <wire x2="2976" y1="1120" y2="1120" x1="2592" />
            <wire x2="2976" y1="1120" y2="1248" x1="2976" />
            <wire x2="3376" y1="1248" y2="1248" x1="2976" />
        </branch>
        <branch name="XLXN_69">
            <wire x2="2976" y1="1360" y2="1360" x1="2592" />
            <wire x2="2976" y1="1312" y2="1360" x1="2976" />
            <wire x2="3376" y1="1312" y2="1312" x1="2976" />
        </branch>
        <branch name="XLXN_70">
            <wire x2="3376" y1="1616" y2="1616" x1="2592" />
            <wire x2="3376" y1="1376" y2="1616" x1="3376" />
        </branch>
        <branch name="XLXN_71">
            <wire x2="3392" y1="1872" y2="1872" x1="2592" />
            <wire x2="3392" y1="1872" y2="2112" x1="3392" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="2992" y1="2144" y2="2144" x1="2592" />
            <wire x2="2992" y1="2144" y2="2176" x1="2992" />
            <wire x2="3392" y1="2176" y2="2176" x1="2992" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="3008" y1="2416" y2="2416" x1="2624" />
            <wire x2="3008" y1="2240" y2="2416" x1="3008" />
            <wire x2="3392" y1="2240" y2="2240" x1="3008" />
        </branch>
        <branch name="XLXN_74">
            <wire x2="3392" y1="2656" y2="2656" x1="2640" />
            <wire x2="3392" y1="2304" y2="2656" x1="3392" />
        </branch>
        <branch name="XLXN_75">
            <wire x2="3008" y1="2864" y2="2864" x1="2624" />
            <wire x2="3008" y1="2768" y2="2864" x1="3008" />
            <wire x2="3392" y1="2768" y2="2768" x1="3008" />
        </branch>
        <branch name="XLXN_76">
            <wire x2="3024" y1="3040" y2="3040" x1="2624" />
            <wire x2="3024" y1="2832" y2="3040" x1="3024" />
            <wire x2="3392" y1="2832" y2="2832" x1="3024" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="3040" y1="3216" y2="3216" x1="2608" />
            <wire x2="3040" y1="2896" y2="3216" x1="3040" />
            <wire x2="3392" y1="2896" y2="2896" x1="3040" />
        </branch>
        <branch name="XLXN_78">
            <wire x2="3392" y1="3392" y2="3392" x1="2640" />
            <wire x2="3392" y1="2960" y2="3392" x1="3392" />
        </branch>
        <branch name="Y(3:0)">
            <wire x2="4368" y1="400" y2="400" x1="4176" />
            <wire x2="4176" y1="400" y2="560" x1="4176" />
            <wire x2="4176" y1="560" y2="672" x1="4176" />
            <wire x2="4176" y1="672" y2="800" x1="4176" />
            <wire x2="4176" y1="800" y2="1072" x1="4176" />
            <wire x2="4176" y1="1072" y2="1344" x1="4176" />
        </branch>
        <iomarker fontsize="28" x="4368" y="400" name="Y(3:0)" orien="R0" />
        <bustap x2="4080" y1="560" y2="560" x1="4176" />
        <bustap x2="4080" y1="672" y2="672" x1="4176" />
        <bustap x2="4080" y1="800" y2="800" x1="4176" />
        <bustap x2="4080" y1="1072" y2="1072" x1="4176" />
        <branch name="Y(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3970" y="560" type="branch" />
            <wire x2="3840" y1="576" y2="576" x1="3616" />
            <wire x2="3840" y1="560" y2="576" x1="3840" />
            <wire x2="3968" y1="560" y2="560" x1="3840" />
            <wire x2="4080" y1="560" y2="560" x1="3968" />
        </branch>
        <branch name="Y(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3954" y="672" type="branch" />
            <wire x2="3856" y1="1280" y2="1280" x1="3632" />
            <wire x2="3856" y1="672" y2="1280" x1="3856" />
            <wire x2="3952" y1="672" y2="672" x1="3856" />
            <wire x2="4080" y1="672" y2="672" x1="3952" />
        </branch>
        <branch name="Y(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3994" y="800" type="branch" />
            <wire x2="3872" y1="2208" y2="2208" x1="3648" />
            <wire x2="3872" y1="800" y2="2208" x1="3872" />
            <wire x2="4000" y1="800" y2="800" x1="3872" />
            <wire x2="4080" y1="800" y2="800" x1="4000" />
        </branch>
        <branch name="Y(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3972" y="1072" type="branch" />
            <wire x2="3888" y1="2864" y2="2864" x1="3648" />
            <wire x2="3888" y1="1072" y2="2864" x1="3888" />
            <wire x2="3968" y1="1072" y2="1072" x1="3888" />
            <wire x2="4080" y1="1072" y2="1072" x1="3968" />
        </branch>
    </sheet>
</drawing>