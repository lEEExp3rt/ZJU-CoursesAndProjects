<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S(1:0)" />
        <signal name="S(0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="S(1)" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="D0" />
        <signal name="D1" />
        <signal name="D2" />
        <signal name="D3" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="O1" />
        <port polarity="Input" name="S(1:0)" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="D3" />
        <port polarity="Output" name="O1" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="XLXN_8" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="S(0)" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="S(1)" name="I0" />
            <blockpin signalname="XLXN_8" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="S(1)" name="I0" />
            <blockpin signalname="S(0)" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="D2" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="XLXN_16" name="I1" />
            <blockpin signalname="XLXN_24" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="S(0)" name="I" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="S(1)" name="I" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_11">
            <blockpin signalname="XLXN_24" name="I0" />
            <blockpin signalname="XLXN_23" name="I1" />
            <blockpin signalname="XLXN_22" name="I2" />
            <blockpin signalname="XLXN_21" name="I3" />
            <blockpin signalname="O1" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1104" y="576" name="XLXI_1" orien="R0" />
        <instance x="1120" y="832" name="XLXI_2" orien="R0" />
        <instance x="1120" y="1072" name="XLXI_3" orien="R0" />
        <instance x="1136" y="1360" name="XLXI_4" orien="R0" />
        <instance x="2096" y="624" name="XLXI_5" orien="R0" />
        <instance x="2112" y="848" name="XLXI_6" orien="R0" />
        <instance x="2112" y="1072" name="XLXI_7" orien="R0" />
        <instance x="2112" y="1328" name="XLXI_8" orien="R0" />
        <branch name="S(1:0)">
            <wire x2="464" y1="432" y2="432" x1="272" />
            <wire x2="464" y1="432" y2="496" x1="464" />
            <wire x2="464" y1="496" y2="576" x1="464" />
            <wire x2="464" y1="576" y2="672" x1="464" />
        </branch>
        <bustap x2="560" y1="496" y2="496" x1="464" />
        <bustap x2="560" y1="576" y2="576" x1="464" />
        <iomarker fontsize="28" x="272" y="432" name="S(1:0)" orien="R180" />
        <instance x="720" y="512" name="XLXI_9" orien="R0" />
        <instance x="720" y="608" name="XLXI_10" orien="R0" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="572" y="496" type="branch" />
            <wire x2="576" y1="496" y2="496" x1="560" />
            <wire x2="592" y1="496" y2="496" x1="576" />
            <wire x2="640" y1="496" y2="496" x1="592" />
            <wire x2="592" y1="496" y2="704" x1="592" />
            <wire x2="1120" y1="704" y2="704" x1="592" />
            <wire x2="592" y1="704" y2="1232" x1="592" />
            <wire x2="1136" y1="1232" y2="1232" x1="592" />
            <wire x2="640" y1="480" y2="496" x1="640" />
            <wire x2="720" y1="480" y2="480" x1="640" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="992" y1="576" y2="576" x1="944" />
            <wire x2="1024" y1="576" y2="576" x1="992" />
            <wire x2="992" y1="576" y2="768" x1="992" />
            <wire x2="1120" y1="768" y2="768" x1="992" />
            <wire x2="1024" y1="512" y2="576" x1="1024" />
            <wire x2="1104" y1="512" y2="512" x1="1024" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="976" y1="480" y2="480" x1="944" />
            <wire x2="1024" y1="480" y2="480" x1="976" />
            <wire x2="976" y1="480" y2="944" x1="976" />
            <wire x2="1120" y1="944" y2="944" x1="976" />
            <wire x2="1024" y1="448" y2="480" x1="1024" />
            <wire x2="1104" y1="448" y2="448" x1="1024" />
        </branch>
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="626" y="576" type="branch" />
            <wire x2="624" y1="576" y2="576" x1="560" />
            <wire x2="656" y1="576" y2="576" x1="624" />
            <wire x2="672" y1="576" y2="576" x1="656" />
            <wire x2="720" y1="576" y2="576" x1="672" />
            <wire x2="672" y1="576" y2="1008" x1="672" />
            <wire x2="1120" y1="1008" y2="1008" x1="672" />
            <wire x2="672" y1="1008" y2="1296" x1="672" />
            <wire x2="1136" y1="1296" y2="1296" x1="672" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1728" y1="480" y2="480" x1="1360" />
            <wire x2="1728" y1="480" y2="496" x1="1728" />
            <wire x2="2096" y1="496" y2="496" x1="1728" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1744" y1="736" y2="736" x1="1376" />
            <wire x2="1744" y1="720" y2="736" x1="1744" />
            <wire x2="2112" y1="720" y2="720" x1="1744" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1744" y1="976" y2="976" x1="1376" />
            <wire x2="1744" y1="944" y2="976" x1="1744" />
            <wire x2="2112" y1="944" y2="944" x1="1744" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1744" y1="1264" y2="1264" x1="1392" />
            <wire x2="1744" y1="1200" y2="1264" x1="1744" />
            <wire x2="2112" y1="1200" y2="1200" x1="1744" />
        </branch>
        <branch name="D0">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="543" y="1552" type="branch" />
            <wire x2="544" y1="1552" y2="1552" x1="464" />
            <wire x2="592" y1="1552" y2="1552" x1="544" />
            <wire x2="1408" y1="1552" y2="1552" x1="592" />
            <wire x2="1408" y1="560" y2="1552" x1="1408" />
            <wire x2="2096" y1="560" y2="560" x1="1408" />
        </branch>
        <branch name="D1">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="537" y="1712" type="branch" />
            <wire x2="544" y1="1712" y2="1712" x1="480" />
            <wire x2="592" y1="1712" y2="1712" x1="544" />
            <wire x2="1424" y1="1712" y2="1712" x1="592" />
            <wire x2="1424" y1="784" y2="1712" x1="1424" />
            <wire x2="2112" y1="784" y2="784" x1="1424" />
        </branch>
        <branch name="D2">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="546" y="1840" type="branch" />
            <wire x2="544" y1="1840" y2="1840" x1="480" />
            <wire x2="608" y1="1840" y2="1840" x1="544" />
            <wire x2="1440" y1="1840" y2="1840" x1="608" />
            <wire x2="1440" y1="1008" y2="1840" x1="1440" />
            <wire x2="2112" y1="1008" y2="1008" x1="1440" />
        </branch>
        <branch name="D3">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="535" y="1968" type="branch" />
            <wire x2="528" y1="1968" y2="1968" x1="496" />
            <wire x2="624" y1="1968" y2="1968" x1="528" />
            <wire x2="1808" y1="1968" y2="1968" x1="624" />
            <wire x2="1808" y1="1264" y2="1968" x1="1808" />
            <wire x2="2112" y1="1264" y2="1264" x1="1808" />
        </branch>
        <iomarker fontsize="28" x="464" y="1552" name="D0" orien="R180" />
        <iomarker fontsize="28" x="480" y="1712" name="D1" orien="R180" />
        <iomarker fontsize="28" x="480" y="1840" name="D2" orien="R180" />
        <iomarker fontsize="28" x="496" y="1968" name="D3" orien="R180" />
        <instance x="2688" y="1072" name="XLXI_11" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="2688" y1="528" y2="528" x1="2352" />
            <wire x2="2688" y1="528" y2="816" x1="2688" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="2528" y1="752" y2="752" x1="2368" />
            <wire x2="2528" y1="752" y2="880" x1="2528" />
            <wire x2="2688" y1="880" y2="880" x1="2528" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="2528" y1="976" y2="976" x1="2368" />
            <wire x2="2528" y1="944" y2="976" x1="2528" />
            <wire x2="2688" y1="944" y2="944" x1="2528" />
        </branch>
        <branch name="XLXN_24">
            <wire x2="2688" y1="1232" y2="1232" x1="2368" />
            <wire x2="2688" y1="1008" y2="1232" x1="2688" />
        </branch>
        <branch name="O1">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3122" y="912" type="branch" />
            <wire x2="3120" y1="912" y2="912" x1="2944" />
            <wire x2="3168" y1="912" y2="912" x1="3120" />
        </branch>
        <iomarker fontsize="28" x="3168" y="912" name="O1" orien="R0" />
    </sheet>
</drawing>