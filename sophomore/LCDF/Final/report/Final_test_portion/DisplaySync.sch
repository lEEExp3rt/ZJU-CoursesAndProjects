<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="points(3:0)" />
        <signal name="LES(3:0)" />
        <signal name="SCAN(1:0)" />
        <signal name="HEXS(15:0)" />
        <signal name="HEXS(3:0)" />
        <signal name="HEXS(7:4)" />
        <signal name="HEXS(11:8)" />
        <signal name="HEXS(15:12)" />
        <signal name="points(0)" />
        <signal name="points(1)" />
        <signal name="points(2)" />
        <signal name="points(3)" />
        <signal name="LES(0)" />
        <signal name="LES(1)" />
        <signal name="LES(2)" />
        <signal name="LES(3)" />
        <signal name="V0" />
        <signal name="V1" />
        <signal name="V1,V1,V1,V0" />
        <signal name="V1,V0,V1,V1" />
        <signal name="V1,V1,V0,V1" />
        <signal name="V0,V1,V1,V1" />
        <signal name="HEX(3:0)" />
        <signal name="p" />
        <signal name="LE" />
        <signal name="AN(3:0)" />
        <port polarity="Input" name="points(3:0)" />
        <port polarity="Input" name="LES(3:0)" />
        <port polarity="Input" name="SCAN(1:0)" />
        <port polarity="Input" name="HEXS(15:0)" />
        <port polarity="Output" name="HEX(3:0)" />
        <port polarity="Output" name="p" />
        <port polarity="Output" name="LE" />
        <port polarity="Output" name="AN(3:0)" />
        <blockdef name="Mux4to1">
            <timestamp>2023-11-7T9:5:56</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="Mux4to1b4">
            <timestamp>2023-11-7T8:42:55</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="Mux4to1" name="XLXI_1">
            <blockpin signalname="SCAN(1:0)" name="S(1:0)" />
            <blockpin signalname="points(0)" name="D0" />
            <blockpin signalname="points(1)" name="D1" />
            <blockpin signalname="points(2)" name="D2" />
            <blockpin signalname="points(3)" name="D3" />
            <blockpin signalname="p" name="O1" />
        </block>
        <block symbolname="Mux4to1" name="XLXI_2">
            <blockpin signalname="SCAN(1:0)" name="S(1:0)" />
            <blockpin signalname="LES(0)" name="D0" />
            <blockpin signalname="LES(1)" name="D1" />
            <blockpin signalname="LES(2)" name="D2" />
            <blockpin signalname="LES(3)" name="D3" />
            <blockpin signalname="LE" name="O1" />
        </block>
        <block symbolname="Mux4to1b4" name="XLXI_3">
            <blockpin signalname="SCAN(1:0)" name="S(1:0)" />
            <blockpin signalname="HEXS(3:0)" name="D0(3:0)" />
            <blockpin signalname="HEXS(7:4)" name="D1(3:0)" />
            <blockpin signalname="HEXS(11:8)" name="D2(3:0)" />
            <blockpin signalname="HEXS(15:12)" name="D3(3:0)" />
            <blockpin signalname="HEX(3:0)" name="Y(3:0)" />
        </block>
        <block symbolname="Mux4to1b4" name="XLXI_4">
            <blockpin signalname="SCAN(1:0)" name="S(1:0)" />
            <blockpin signalname="V1,V1,V1,V0" name="D0(3:0)" />
            <blockpin signalname="V1,V0,V1,V1" name="D1(3:0)" />
            <blockpin signalname="V1,V1,V0,V1" name="D2(3:0)" />
            <blockpin signalname="V0,V1,V1,V1" name="D3(3:0)" />
            <blockpin signalname="AN(3:0)" name="Y(3:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="V0" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_6">
            <blockpin signalname="V1" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1904" y="1184" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1904" y="1760" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1904" y="624" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1904" y="2320" name="XLXI_4" orien="R0">
        </instance>
        <branch name="points(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="548" y="1024" type="branch" />
            <wire x2="544" y1="1024" y2="1024" x1="448" />
            <wire x2="800" y1="1024" y2="1024" x1="544" />
            <wire x2="800" y1="1024" y2="1072" x1="800" />
            <wire x2="800" y1="1072" y2="1136" x1="800" />
            <wire x2="800" y1="1136" y2="1200" x1="800" />
            <wire x2="800" y1="864" y2="928" x1="800" />
            <wire x2="800" y1="928" y2="992" x1="800" />
            <wire x2="800" y1="992" y2="1024" x1="800" />
        </branch>
        <branch name="LES(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="626" y="1552" type="branch" />
            <wire x2="624" y1="1552" y2="1552" x1="464" />
            <wire x2="816" y1="1552" y2="1552" x1="624" />
            <wire x2="816" y1="1552" y2="1616" x1="816" />
            <wire x2="816" y1="1616" y2="1664" x1="816" />
            <wire x2="816" y1="1664" y2="1728" x1="816" />
            <wire x2="816" y1="1392" y2="1456" x1="816" />
            <wire x2="816" y1="1456" y2="1520" x1="816" />
            <wire x2="816" y1="1520" y2="1552" x1="816" />
        </branch>
        <branch name="SCAN(1:0)">
            <wire x2="768" y1="112" y2="112" x1="512" />
            <wire x2="1328" y1="112" y2="112" x1="768" />
            <wire x2="1328" y1="112" y2="336" x1="1328" />
            <wire x2="1904" y1="336" y2="336" x1="1328" />
            <wire x2="1328" y1="336" y2="896" x1="1328" />
            <wire x2="1344" y1="896" y2="896" x1="1328" />
            <wire x2="1904" y1="896" y2="896" x1="1344" />
            <wire x2="1328" y1="896" y2="1424" x1="1328" />
            <wire x2="1328" y1="1424" y2="2032" x1="1328" />
            <wire x2="1904" y1="2032" y2="2032" x1="1328" />
            <wire x2="1616" y1="1424" y2="1424" x1="1328" />
            <wire x2="1616" y1="1424" y2="1472" x1="1616" />
            <wire x2="1904" y1="1472" y2="1472" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="512" y="112" name="SCAN(1:0)" orien="R180" />
        <branch name="HEXS(15:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="565" y="480" type="branch" />
            <wire x2="560" y1="480" y2="480" x1="368" />
            <wire x2="768" y1="480" y2="480" x1="560" />
            <wire x2="1040" y1="480" y2="480" x1="768" />
            <wire x2="1040" y1="480" y2="544" x1="1040" />
            <wire x2="1040" y1="544" y2="608" x1="1040" />
            <wire x2="1040" y1="608" y2="672" x1="1040" />
            <wire x2="1040" y1="288" y2="352" x1="1040" />
            <wire x2="1040" y1="352" y2="432" x1="1040" />
            <wire x2="1040" y1="432" y2="480" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="368" y="480" name="HEXS(15:0)" orien="R180" />
        <bustap x2="1136" y1="352" y2="352" x1="1040" />
        <bustap x2="1136" y1="432" y2="432" x1="1040" />
        <bustap x2="1136" y1="544" y2="544" x1="1040" />
        <bustap x2="1136" y1="608" y2="608" x1="1040" />
        <branch name="HEXS(3:0)">
            <wire x2="1520" y1="352" y2="352" x1="1136" />
            <wire x2="1520" y1="352" y2="400" x1="1520" />
            <wire x2="1904" y1="400" y2="400" x1="1520" />
        </branch>
        <branch name="HEXS(7:4)">
            <wire x2="1520" y1="432" y2="432" x1="1136" />
            <wire x2="1520" y1="432" y2="464" x1="1520" />
            <wire x2="1904" y1="464" y2="464" x1="1520" />
        </branch>
        <branch name="HEXS(11:8)">
            <wire x2="1520" y1="544" y2="544" x1="1136" />
            <wire x2="1520" y1="528" y2="544" x1="1520" />
            <wire x2="1904" y1="528" y2="528" x1="1520" />
        </branch>
        <branch name="HEXS(15:12)">
            <wire x2="1520" y1="608" y2="608" x1="1136" />
            <wire x2="1520" y1="592" y2="608" x1="1520" />
            <wire x2="1904" y1="592" y2="592" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="448" y="1024" name="points(3:0)" orien="R180" />
        <bustap x2="896" y1="928" y2="928" x1="800" />
        <bustap x2="896" y1="992" y2="992" x1="800" />
        <bustap x2="896" y1="1072" y2="1072" x1="800" />
        <bustap x2="896" y1="1136" y2="1136" x1="800" />
        <branch name="points(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1019" y="928" type="branch" />
            <wire x2="1024" y1="928" y2="928" x1="896" />
            <wire x2="1392" y1="928" y2="928" x1="1024" />
            <wire x2="1392" y1="928" y2="960" x1="1392" />
            <wire x2="1904" y1="960" y2="960" x1="1392" />
        </branch>
        <branch name="points(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="993" y="992" type="branch" />
            <wire x2="992" y1="992" y2="992" x1="896" />
            <wire x2="1392" y1="992" y2="992" x1="992" />
            <wire x2="1392" y1="992" y2="1024" x1="1392" />
            <wire x2="1904" y1="1024" y2="1024" x1="1392" />
        </branch>
        <branch name="points(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1074" y="1072" type="branch" />
            <wire x2="1072" y1="1072" y2="1072" x1="896" />
            <wire x2="1392" y1="1072" y2="1072" x1="1072" />
            <wire x2="1392" y1="1072" y2="1088" x1="1392" />
            <wire x2="1904" y1="1088" y2="1088" x1="1392" />
        </branch>
        <branch name="points(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1019" y="1136" type="branch" />
            <wire x2="1024" y1="1136" y2="1136" x1="896" />
            <wire x2="1392" y1="1136" y2="1136" x1="1024" />
            <wire x2="1392" y1="1136" y2="1152" x1="1392" />
            <wire x2="1904" y1="1152" y2="1152" x1="1392" />
        </branch>
        <iomarker fontsize="28" x="464" y="1552" name="LES(3:0)" orien="R180" />
        <bustap x2="912" y1="1456" y2="1456" x1="816" />
        <bustap x2="912" y1="1616" y2="1616" x1="816" />
        <bustap x2="912" y1="1664" y2="1664" x1="816" />
        <branch name="LES(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1008" y="1456" type="branch" />
            <wire x2="1008" y1="1456" y2="1456" x1="912" />
            <wire x2="1408" y1="1456" y2="1456" x1="1008" />
            <wire x2="1408" y1="1456" y2="1536" x1="1408" />
            <wire x2="1904" y1="1536" y2="1536" x1="1408" />
        </branch>
        <bustap x2="912" y1="1520" y2="1520" x1="816" />
        <branch name="LES(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1018" y="1520" type="branch" />
            <wire x2="1024" y1="1520" y2="1520" x1="912" />
            <wire x2="1392" y1="1520" y2="1520" x1="1024" />
            <wire x2="1392" y1="1520" y2="1600" x1="1392" />
            <wire x2="1904" y1="1600" y2="1600" x1="1392" />
        </branch>
        <branch name="LES(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1018" y="1616" type="branch" />
            <wire x2="1024" y1="1616" y2="1616" x1="912" />
            <wire x2="1408" y1="1616" y2="1616" x1="1024" />
            <wire x2="1408" y1="1616" y2="1664" x1="1408" />
            <wire x2="1904" y1="1664" y2="1664" x1="1408" />
        </branch>
        <branch name="LES(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1044" y="1664" type="branch" />
            <wire x2="1040" y1="1664" y2="1664" x1="912" />
            <wire x2="1392" y1="1664" y2="1664" x1="1040" />
            <wire x2="1392" y1="1664" y2="1728" x1="1392" />
            <wire x2="1904" y1="1728" y2="1728" x1="1392" />
        </branch>
        <instance x="400" y="2224" name="XLXI_5" orien="R0" />
        <instance x="560" y="2400" name="XLXI_6" orien="R0" />
        <branch name="V0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="1968" type="branch" />
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="464" y="2037" type="branch" />
            <wire x2="560" y1="1968" y2="1968" x1="464" />
            <wire x2="464" y1="1968" y2="2032" x1="464" />
            <wire x2="464" y1="2032" y2="2096" x1="464" />
        </branch>
        <branch name="V1">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="677" y="2480" type="branch" />
            <wire x2="624" y1="2400" y2="2480" x1="624" />
            <wire x2="672" y1="2480" y2="2480" x1="624" />
            <wire x2="720" y1="2480" y2="2480" x1="672" />
        </branch>
        <branch name="V1,V1,V1,V0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="800" y="2096" type="branch" />
            <wire x2="1904" y1="2096" y2="2096" x1="800" />
        </branch>
        <branch name="V1,V0,V1,V1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="800" y="2160" type="branch" />
            <wire x2="1904" y1="2160" y2="2160" x1="800" />
        </branch>
        <branch name="V1,V1,V0,V1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="800" y="2224" type="branch" />
            <wire x2="1904" y1="2224" y2="2224" x1="800" />
        </branch>
        <branch name="V0,V1,V1,V1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="800" y="2288" type="branch" />
            <wire x2="1904" y1="2288" y2="2288" x1="800" />
        </branch>
        <branch name="HEX(3:0)">
            <wire x2="2816" y1="336" y2="336" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2816" y="336" name="HEX(3:0)" orien="R0" />
        <branch name="p">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2514" y="896" type="branch" />
            <wire x2="2512" y1="896" y2="896" x1="2288" />
            <wire x2="2784" y1="896" y2="896" x1="2512" />
        </branch>
        <branch name="LE">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2433" y="1472" type="branch" />
            <wire x2="2432" y1="1472" y2="1472" x1="2288" />
            <wire x2="2784" y1="1472" y2="1472" x1="2432" />
        </branch>
        <branch name="AN(3:0)">
            <wire x2="2944" y1="2032" y2="2032" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2784" y="896" name="p" orien="R0" />
        <iomarker fontsize="28" x="2784" y="1472" name="LE" orien="R0" />
        <iomarker fontsize="28" x="2944" y="2032" name="AN(3:0)" orien="R0" />
    </sheet>
</drawing>