<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="RST" />
        <signal name="clkdiv(18:17)" />
        <signal name="LES(3:0)" />
        <signal name="HEXS(15:0)" />
        <signal name="HEX(3:0)" />
        <signal name="HEX(0)" />
        <signal name="HEX(3)" />
        <signal name="HEX(2)" />
        <signal name="HEX(1)" />
        <signal name="AN(3:0)" />
        <signal name="points(3:0)" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="segment(7:0)" />
        <signal name="segment(7)" />
        <signal name="segment(6)" />
        <signal name="segment(5)" />
        <signal name="segment(4)" />
        <signal name="segment(3)" />
        <signal name="segment(2)" />
        <signal name="segment(1)" />
        <signal name="segment(0)" />
        <signal name="clkdiv(31:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="LES(3:0)" />
        <port polarity="Input" name="HEXS(15:0)" />
        <port polarity="Output" name="AN(3:0)" />
        <port polarity="Input" name="points(3:0)" />
        <port polarity="Output" name="segment(7:0)" />
        <blockdef name="DisplaySync">
            <timestamp>2023-11-7T9:31:30</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MyMC14495">
            <timestamp>2023-10-31T10:25:50</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="clkdiv">
            <timestamp>2023-11-7T9:43:12</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="DisplaySync" name="XLXI_1">
            <blockpin signalname="points(3:0)" name="points(3:0)" />
            <blockpin signalname="LES(3:0)" name="LES(3:0)" />
            <blockpin signalname="clkdiv(18:17)" name="SCAN(1:0)" />
            <blockpin signalname="HEXS(15:0)" name="HEXS(15:0)" />
            <blockpin signalname="HEX(3:0)" name="HEX(3:0)" />
            <blockpin signalname="XLXN_19" name="p" />
            <blockpin signalname="XLXN_18" name="LE" />
            <blockpin signalname="AN(3:0)" name="AN(3:0)" />
        </block>
        <block symbolname="MyMC14495" name="XLXI_2">
            <blockpin signalname="XLXN_19" name="point" />
            <blockpin signalname="XLXN_18" name="LE" />
            <blockpin signalname="HEX(0)" name="D0" />
            <blockpin signalname="HEX(3)" name="D3" />
            <blockpin signalname="HEX(2)" name="D2" />
            <blockpin signalname="HEX(1)" name="D1" />
            <blockpin signalname="segment(7)" name="p" />
            <blockpin signalname="segment(6)" name="g" />
            <blockpin signalname="segment(5)" name="f" />
            <blockpin signalname="segment(4)" name="e" />
            <blockpin signalname="segment(3)" name="d" />
            <blockpin signalname="segment(2)" name="c" />
            <blockpin signalname="segment(1)" name="b" />
            <blockpin signalname="segment(0)" name="a" />
        </block>
        <block symbolname="clkdiv" name="XLXI_3">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="clkdiv(31:0)" name="clkdiv(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1120" y="1792" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2112" y="1232" name="XLXI_2" orien="R0">
        </instance>
        <instance x="912" y="848" name="XLXI_3" orien="R0">
        </instance>
        <branch name="clk">
            <wire x2="912" y1="752" y2="752" x1="656" />
        </branch>
        <branch name="RST">
            <wire x2="912" y1="816" y2="816" x1="640" />
        </branch>
        <branch name="clkdiv(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="784" y="1328" type="branch" />
            <wire x2="784" y1="1328" y2="1536" x1="784" />
            <wire x2="784" y1="1536" y2="1952" x1="784" />
            <wire x2="1376" y1="1328" y2="1328" x1="784" />
            <wire x2="1376" y1="752" y2="752" x1="1296" />
            <wire x2="1376" y1="752" y2="1328" x1="1376" />
        </branch>
        <branch name="LES(3:0)">
            <wire x2="1120" y1="1632" y2="1632" x1="608" />
        </branch>
        <branch name="HEXS(15:0)">
            <wire x2="1120" y1="1760" y2="1760" x1="624" />
        </branch>
        <bustap x2="880" y1="1536" y2="1536" x1="784" />
        <branch name="HEX(3:0)">
            <attrtext style="alignment:SOFT-VLEFT;fontsize:28;fontname:Arial" attrname="Name" x="1840" y="768" type="branch" />
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1840" y="928" type="branch" />
            <wire x2="1840" y1="1568" y2="1568" x1="1504" />
            <wire x2="1840" y1="768" y2="832" x1="1840" />
            <wire x2="1840" y1="832" y2="912" x1="1840" />
            <wire x2="1840" y1="912" y2="928" x1="1840" />
            <wire x2="1840" y1="928" y2="1008" x1="1840" />
            <wire x2="1840" y1="1008" y2="1072" x1="1840" />
            <wire x2="1840" y1="1072" y2="1168" x1="1840" />
            <wire x2="1840" y1="1168" y2="1568" x1="1840" />
        </branch>
        <bustap x2="1936" y1="832" y2="832" x1="1840" />
        <bustap x2="1936" y1="912" y2="912" x1="1840" />
        <bustap x2="1936" y1="1008" y2="1008" x1="1840" />
        <bustap x2="1936" y1="1072" y2="1072" x1="1840" />
        <branch name="HEX(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1993" y="832" type="branch" />
            <wire x2="2000" y1="832" y2="832" x1="1936" />
            <wire x2="2016" y1="832" y2="832" x1="2000" />
            <wire x2="2016" y1="832" y2="912" x1="2016" />
            <wire x2="2112" y1="912" y2="912" x1="2016" />
        </branch>
        <branch name="HEX(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="952" type="branch" />
            <wire x2="2000" y1="912" y2="912" x1="1936" />
            <wire x2="2000" y1="912" y2="960" x1="2000" />
            <wire x2="2000" y1="960" y2="992" x1="2000" />
            <wire x2="2112" y1="992" y2="992" x1="2000" />
        </branch>
        <branch name="HEX(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2016" y="1048" type="branch" />
            <wire x2="2016" y1="1008" y2="1008" x1="1936" />
            <wire x2="2016" y1="1008" y2="1056" x1="2016" />
            <wire x2="2016" y1="1056" y2="1072" x1="2016" />
            <wire x2="2112" y1="1072" y2="1072" x1="2016" />
        </branch>
        <branch name="HEX(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2011" y="1152" type="branch" />
            <wire x2="2000" y1="1072" y2="1072" x1="1936" />
            <wire x2="2000" y1="1072" y2="1152" x1="2000" />
            <wire x2="2016" y1="1152" y2="1152" x1="2000" />
            <wire x2="2112" y1="1152" y2="1152" x1="2016" />
        </branch>
        <branch name="AN(3:0)">
            <wire x2="2480" y1="1760" y2="1760" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="2480" y="1760" name="AN(3:0)" orien="R0" />
        <branch name="clkdiv(18:17)">
            <wire x2="992" y1="1536" y2="1536" x1="880" />
            <wire x2="992" y1="1536" y2="1696" x1="992" />
            <wire x2="1120" y1="1696" y2="1696" x1="992" />
        </branch>
        <branch name="points(3:0)">
            <wire x2="1120" y1="1568" y2="1568" x1="608" />
        </branch>
        <iomarker fontsize="28" x="624" y="1760" name="HEXS(15:0)" orien="R180" />
        <iomarker fontsize="28" x="608" y="1632" name="LES(3:0)" orien="R180" />
        <iomarker fontsize="28" x="608" y="1568" name="points(3:0)" orien="R180" />
        <branch name="XLXN_18">
            <wire x2="2096" y1="1696" y2="1696" x1="1504" />
            <wire x2="2096" y1="832" y2="1696" x1="2096" />
            <wire x2="2112" y1="832" y2="832" x1="2096" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="1808" y1="1632" y2="1632" x1="1504" />
            <wire x2="1808" y1="752" y2="1632" x1="1808" />
            <wire x2="2112" y1="752" y2="752" x1="1808" />
        </branch>
        <branch name="segment(7:0)">
            <attrtext style="alignment:SOFT-VLEFT;fontsize:28;fontname:Arial" attrname="Name" x="2896" y="720" type="branch" />
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2896" y="1035" type="branch" />
            <wire x2="2896" y1="720" y2="800" x1="2896" />
            <wire x2="2896" y1="800" y2="880" x1="2896" />
            <wire x2="2896" y1="880" y2="960" x1="2896" />
            <wire x2="2896" y1="960" y2="1040" x1="2896" />
            <wire x2="2896" y1="1040" y2="1120" x1="2896" />
            <wire x2="2896" y1="1120" y2="1184" x1="2896" />
            <wire x2="2896" y1="1184" y2="1264" x1="2896" />
            <wire x2="2896" y1="1264" y2="1328" x1="2896" />
            <wire x2="2896" y1="1328" y2="1360" x1="2896" />
            <wire x2="2896" y1="1360" y2="1440" x1="2896" />
            <wire x2="3200" y1="1440" y2="1440" x1="2896" />
        </branch>
        <bustap x2="2800" y1="800" y2="800" x1="2896" />
        <bustap x2="2800" y1="880" y2="880" x1="2896" />
        <bustap x2="2800" y1="960" y2="960" x1="2896" />
        <bustap x2="2800" y1="1040" y2="1040" x1="2896" />
        <bustap x2="2800" y1="1120" y2="1120" x1="2896" />
        <bustap x2="2800" y1="1184" y2="1184" x1="2896" />
        <bustap x2="2800" y1="1264" y2="1264" x1="2896" />
        <branch name="segment(7)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2751" y="800" type="branch" />
            <wire x2="2640" y1="752" y2="752" x1="2496" />
            <wire x2="2640" y1="752" y2="800" x1="2640" />
            <wire x2="2752" y1="800" y2="800" x1="2640" />
            <wire x2="2800" y1="800" y2="800" x1="2752" />
        </branch>
        <branch name="segment(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2742" y="880" type="branch" />
            <wire x2="2640" y1="816" y2="816" x1="2496" />
            <wire x2="2640" y1="816" y2="880" x1="2640" />
            <wire x2="2736" y1="880" y2="880" x1="2640" />
            <wire x2="2800" y1="880" y2="880" x1="2736" />
        </branch>
        <branch name="segment(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2776" y="960" type="branch" />
            <wire x2="2624" y1="880" y2="880" x1="2496" />
            <wire x2="2624" y1="880" y2="960" x1="2624" />
            <wire x2="2784" y1="960" y2="960" x1="2624" />
            <wire x2="2800" y1="960" y2="960" x1="2784" />
        </branch>
        <branch name="segment(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2752" y="1040" type="branch" />
            <wire x2="2608" y1="944" y2="944" x1="2496" />
            <wire x2="2608" y1="944" y2="1040" x1="2608" />
            <wire x2="2752" y1="1040" y2="1040" x1="2608" />
            <wire x2="2800" y1="1040" y2="1040" x1="2752" />
        </branch>
        <branch name="segment(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2660" y="1120" type="branch" />
            <wire x2="2592" y1="1008" y2="1008" x1="2496" />
            <wire x2="2592" y1="1008" y2="1120" x1="2592" />
            <wire x2="2656" y1="1120" y2="1120" x1="2592" />
            <wire x2="2800" y1="1120" y2="1120" x1="2656" />
        </branch>
        <branch name="segment(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2735" y="1184" type="branch" />
            <wire x2="2576" y1="1072" y2="1072" x1="2496" />
            <wire x2="2576" y1="1072" y2="1184" x1="2576" />
            <wire x2="2736" y1="1184" y2="1184" x1="2576" />
            <wire x2="2800" y1="1184" y2="1184" x1="2736" />
        </branch>
        <branch name="segment(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2713" y="1264" type="branch" />
            <wire x2="2560" y1="1136" y2="1136" x1="2496" />
            <wire x2="2560" y1="1136" y2="1264" x1="2560" />
            <wire x2="2720" y1="1264" y2="1264" x1="2560" />
            <wire x2="2800" y1="1264" y2="1264" x1="2720" />
        </branch>
        <bustap x2="2800" y1="1360" y2="1360" x1="2896" />
        <branch name="segment(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2655" y="1360" type="branch" />
            <wire x2="2544" y1="1200" y2="1200" x1="2496" />
            <wire x2="2544" y1="1200" y2="1360" x1="2544" />
            <wire x2="2656" y1="1360" y2="1360" x1="2544" />
            <wire x2="2800" y1="1360" y2="1360" x1="2656" />
        </branch>
        <iomarker fontsize="28" x="3200" y="1440" name="segment(7:0)" orien="R0" />
        <iomarker fontsize="28" x="656" y="752" name="clk" orien="R180" />
        <iomarker fontsize="28" x="640" y="816" name="RST" orien="R180" />
    </sheet>
</drawing>