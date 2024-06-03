<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="p" />
        <signal name="point" />
        <signal name="g" />
        <signal name="f" />
        <signal name="e" />
        <signal name="d" />
        <signal name="c" />
        <signal name="b" />
        <signal name="a" />
        <signal name="XLXN_18" />
        <signal name="LE" />
        <signal name="XLXN_25" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_67" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_74" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_82" />
        <signal name="XLXN_83" />
        <signal name="XLXN_84" />
        <signal name="XLXN_85" />
        <signal name="XLXN_86" />
        <signal name="XLXN_87" />
        <signal name="XLXN_88" />
        <signal name="XLXN_89" />
        <signal name="XLXN_90" />
        <signal name="XLXN_91" />
        <signal name="XLXN_92" />
        <signal name="XLXN_93" />
        <signal name="D0" />
        <signal name="D3" />
        <signal name="D2" />
        <signal name="D1" />
        <signal name="XLXN_129" />
        <signal name="XLXN_130" />
        <port polarity="Output" name="p" />
        <port polarity="Input" name="point" />
        <port polarity="Output" name="g" />
        <port polarity="Output" name="f" />
        <port polarity="Output" name="e" />
        <port polarity="Output" name="d" />
        <port polarity="Output" name="c" />
        <port polarity="Output" name="b" />
        <port polarity="Output" name="a" />
        <port polarity="Input" name="LE" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="D3" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="D1" />
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
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
        <block symbolname="and4" name="XLXI_60">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_67" name="I2" />
            <blockpin signalname="XLXN_129" name="I3" />
            <blockpin signalname="XLXN_33" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_61">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D1" name="I2" />
            <blockpin signalname="D0" name="I3" />
            <blockpin signalname="XLXN_34" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_69">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="XLXN_130" name="I1" />
            <blockpin signalname="D1" name="I2" />
            <blockpin signalname="XLXN_129" name="I3" />
            <blockpin signalname="XLXN_83" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_73">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="XLXN_130" name="I1" />
            <blockpin signalname="D1" name="I2" />
            <blockpin signalname="XLXN_129" name="I3" />
            <blockpin signalname="XLXN_87" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_77">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="XLXN_130" name="I1" />
            <blockpin signalname="D1" name="I2" />
            <blockpin signalname="D0" name="I3" />
            <blockpin signalname="XLXN_93" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_78">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_67" name="I2" />
            <blockpin signalname="D0" name="I3" />
            <blockpin signalname="XLXN_76" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_79">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_67" name="I2" />
            <blockpin signalname="XLXN_129" name="I3" />
            <blockpin signalname="XLXN_85" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_80">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="XLXN_67" name="I1" />
            <blockpin signalname="XLXN_130" name="I2" />
            <blockpin signalname="D0" name="I3" />
            <blockpin signalname="XLXN_54" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_88">
            <blockpin signalname="XLXN_18" name="I0" />
            <blockpin signalname="LE" name="I1" />
            <blockpin signalname="g" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_89">
            <blockpin signalname="XLXN_31" name="I0" />
            <blockpin signalname="LE" name="I1" />
            <blockpin signalname="f" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_90">
            <blockpin signalname="XLXN_32" name="I0" />
            <blockpin signalname="LE" name="I1" />
            <blockpin signalname="e" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_91">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="LE" name="I1" />
            <blockpin signalname="d" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_92">
            <blockpin signalname="XLXN_29" name="I0" />
            <blockpin signalname="LE" name="I1" />
            <blockpin signalname="c" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_93">
            <blockpin signalname="XLXN_25" name="I0" />
            <blockpin signalname="LE" name="I1" />
            <blockpin signalname="b" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_94">
            <blockpin signalname="XLXN_92" name="I0" />
            <blockpin signalname="LE" name="I1" />
            <blockpin signalname="a" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_95">
            <blockpin signalname="D3" name="I" />
            <blockpin signalname="XLXN_55" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_97">
            <blockpin signalname="D1" name="I" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_98">
            <blockpin signalname="D0" name="I" />
            <blockpin signalname="XLXN_129" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_99">
            <blockpin signalname="point" name="I" />
            <blockpin signalname="p" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_101">
            <blockpin signalname="XLXN_72" name="I0" />
            <blockpin signalname="XLXN_34" name="I1" />
            <blockpin signalname="XLXN_33" name="I2" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_110">
            <blockpin signalname="XLXN_88" name="I0" />
            <blockpin signalname="XLXN_87" name="I1" />
            <blockpin signalname="XLXN_86" name="I2" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_114">
            <blockpin signalname="XLXN_82" name="I0" />
            <blockpin signalname="XLXN_80" name="I1" />
            <blockpin signalname="XLXN_79" name="I2" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_115">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="XLXN_130" name="I1" />
            <blockpin signalname="XLXN_67" name="I2" />
            <blockpin signalname="XLXN_72" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_116">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D0" name="I2" />
            <blockpin signalname="XLXN_73" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_118">
            <blockpin signalname="XLXN_76" name="I0" />
            <blockpin signalname="XLXN_75" name="I1" />
            <blockpin signalname="XLXN_74" name="I2" />
            <blockpin signalname="XLXN_73" name="I3" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_119">
            <blockpin signalname="XLXN_54" name="I0" />
            <blockpin signalname="XLXN_85" name="I1" />
            <blockpin signalname="XLXN_84" name="I2" />
            <blockpin signalname="XLXN_83" name="I3" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_120">
            <blockpin signalname="XLXN_91" name="I0" />
            <blockpin signalname="XLXN_90" name="I1" />
            <blockpin signalname="XLXN_88" name="I2" />
            <blockpin signalname="XLXN_89" name="I3" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_121">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="XLXN_130" name="I1" />
            <blockpin signalname="D1" name="I2" />
            <blockpin signalname="XLXN_74" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_122">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="XLXN_130" name="I1" />
            <blockpin signalname="D0" name="I2" />
            <blockpin signalname="XLXN_75" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_124">
            <blockpin signalname="XLXN_130" name="I0" />
            <blockpin signalname="XLXN_67" name="I1" />
            <blockpin signalname="D0" name="I2" />
            <blockpin signalname="XLXN_79" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_125">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_67" name="I2" />
            <blockpin signalname="XLXN_80" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_127">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="D0" name="I1" />
            <blockpin signalname="XLXN_82" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_128">
            <blockpin signalname="D2" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D0" name="I2" />
            <blockpin signalname="XLXN_84" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_129">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D1" name="I2" />
            <blockpin signalname="XLXN_86" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_130">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D0" name="I2" />
            <blockpin signalname="XLXN_89" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_131">
            <blockpin signalname="D3" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_129" name="I2" />
            <blockpin signalname="XLXN_88" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_132">
            <blockpin signalname="D2" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_129" name="I2" />
            <blockpin signalname="XLXN_90" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_133">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_67" name="I2" />
            <blockpin signalname="D0" name="I3" />
            <blockpin signalname="XLXN_91" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_134">
            <blockpin signalname="XLXN_54" name="I0" />
            <blockpin signalname="XLXN_85" name="I1" />
            <blockpin signalname="XLXN_76" name="I2" />
            <blockpin signalname="XLXN_93" name="I3" />
            <blockpin signalname="XLXN_92" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_135">
            <blockpin signalname="D2" name="I" />
            <blockpin signalname="XLXN_130" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="1472" y="3280" name="XLXI_60" orien="M90" />
        <instance x="1712" y="3280" name="XLXI_61" orien="M90" />
        <instance x="5472" y="3264" name="XLXI_77" orien="M90" />
        <instance x="5712" y="3264" name="XLXI_78" orien="M90" />
        <instance x="5952" y="3264" name="XLXI_79" orien="M90" />
        <instance x="6176" y="3264" name="XLXI_80" orien="M90" />
        <instance x="1504" y="4480" name="XLXI_88" orien="M90" />
        <instance x="2080" y="4496" name="XLXI_89" orien="M90" />
        <instance x="2768" y="4464" name="XLXI_90" orien="M90" />
        <instance x="3472" y="4432" name="XLXI_91" orien="M90" />
        <instance x="4256" y="4448" name="XLXI_92" orien="M90" />
        <instance x="5008" y="4416" name="XLXI_93" orien="M90" />
        <instance x="5712" y="4480" name="XLXI_94" orien="M90" />
        <instance x="752" y="2752" name="XLXI_99" orien="M90" />
        <branch name="p">
            <wire x2="720" y1="2976" y2="4400" x1="720" />
        </branch>
        <iomarker fontsize="28" x="720" y="4400" name="p" orien="R90" />
        <branch name="point">
            <wire x2="720" y1="1392" y2="2752" x1="720" />
        </branch>
        <iomarker fontsize="28" x="720" y="1392" name="point" orien="R270" />
        <branch name="g">
            <wire x2="1408" y1="4736" y2="4768" x1="1408" />
        </branch>
        <iomarker fontsize="28" x="1408" y="4768" name="g" orien="R90" />
        <branch name="f">
            <wire x2="1984" y1="4752" y2="4784" x1="1984" />
        </branch>
        <iomarker fontsize="28" x="1984" y="4784" name="f" orien="R90" />
        <branch name="e">
            <wire x2="2672" y1="4720" y2="4752" x1="2672" />
        </branch>
        <iomarker fontsize="28" x="2672" y="4752" name="e" orien="R90" />
        <branch name="d">
            <wire x2="3376" y1="4688" y2="4720" x1="3376" />
        </branch>
        <iomarker fontsize="28" x="3376" y="4720" name="d" orien="R90" />
        <branch name="c">
            <wire x2="4160" y1="4704" y2="4736" x1="4160" />
        </branch>
        <iomarker fontsize="28" x="4160" y="4736" name="c" orien="R90" />
        <branch name="b">
            <wire x2="4912" y1="4672" y2="4704" x1="4912" />
        </branch>
        <iomarker fontsize="28" x="4912" y="4704" name="b" orien="R90" />
        <branch name="a">
            <wire x2="5616" y1="4736" y2="4768" x1="5616" />
        </branch>
        <iomarker fontsize="28" x="5616" y="4768" name="a" orien="R90" />
        <branch name="XLXN_18">
            <wire x2="1440" y1="4320" y2="4480" x1="1440" />
            <wire x2="1600" y1="4320" y2="4320" x1="1440" />
            <wire x2="1600" y1="4160" y2="4320" x1="1600" />
        </branch>
        <branch name="LE">
            <wire x2="496" y1="1392" y2="4288" x1="496" />
            <wire x2="1376" y1="4288" y2="4288" x1="496" />
            <wire x2="1376" y1="4288" y2="4480" x1="1376" />
            <wire x2="1952" y1="4288" y2="4288" x1="1376" />
            <wire x2="1952" y1="4288" y2="4496" x1="1952" />
            <wire x2="2640" y1="4288" y2="4288" x1="1952" />
            <wire x2="2640" y1="4288" y2="4464" x1="2640" />
            <wire x2="3344" y1="4288" y2="4288" x1="2640" />
            <wire x2="3344" y1="4288" y2="4432" x1="3344" />
            <wire x2="4128" y1="4288" y2="4288" x1="3344" />
            <wire x2="4128" y1="4288" y2="4448" x1="4128" />
            <wire x2="4880" y1="4288" y2="4288" x1="4128" />
            <wire x2="5584" y1="4288" y2="4288" x1="4880" />
            <wire x2="5584" y1="4288" y2="4480" x1="5584" />
            <wire x2="4880" y1="4288" y2="4416" x1="4880" />
        </branch>
        <iomarker fontsize="28" x="496" y="1392" name="LE" orien="R270" />
        <branch name="XLXN_25">
            <wire x2="4944" y1="4304" y2="4416" x1="4944" />
            <wire x2="5072" y1="4304" y2="4304" x1="4944" />
            <wire x2="5072" y1="4192" y2="4304" x1="5072" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="4192" y1="4304" y2="4448" x1="4192" />
            <wire x2="4304" y1="4304" y2="4304" x1="4192" />
            <wire x2="4304" y1="4160" y2="4304" x1="4304" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="3408" y1="4272" y2="4432" x1="3408" />
            <wire x2="3520" y1="4272" y2="4272" x1="3408" />
            <wire x2="3520" y1="4144" y2="4272" x1="3520" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="2016" y1="4320" y2="4496" x1="2016" />
            <wire x2="2144" y1="4320" y2="4320" x1="2016" />
            <wire x2="2144" y1="4144" y2="4320" x1="2144" />
        </branch>
        <instance x="1728" y="3904" name="XLXI_101" orien="M90" />
        <instance x="4432" y="3904" name="XLXI_110" orien="M90" />
        <instance x="2864" y="3856" name="XLXI_114" orien="M90" />
        <branch name="XLXN_32">
            <wire x2="2704" y1="4272" y2="4464" x1="2704" />
            <wire x2="2736" y1="4272" y2="4272" x1="2704" />
            <wire x2="2736" y1="4112" y2="4272" x1="2736" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="1312" y1="3536" y2="3904" x1="1312" />
            <wire x2="1536" y1="3904" y2="3904" x1="1312" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="1552" y1="3536" y2="3712" x1="1552" />
            <wire x2="1600" y1="3712" y2="3712" x1="1552" />
            <wire x2="1600" y1="3712" y2="3904" x1="1600" />
        </branch>
        <branch name="XLXN_54">
            <wire x2="6016" y1="3744" y2="3744" x1="3616" />
            <wire x2="6016" y1="3744" y2="3936" x1="6016" />
            <wire x2="3616" y1="3744" y2="3888" x1="3616" />
            <wire x2="6016" y1="3936" y2="3936" x1="5888" />
            <wire x2="6016" y1="3520" y2="3744" x1="6016" />
        </branch>
        <branch name="XLXN_55">
            <wire x2="1648" y1="2864" y2="3280" x1="1648" />
            <wire x2="1808" y1="2864" y2="2864" x1="1648" />
            <wire x2="1808" y1="2864" y2="3280" x1="1808" />
            <wire x2="2016" y1="2864" y2="2864" x1="1808" />
            <wire x2="2016" y1="2864" y2="3280" x1="2016" />
            <wire x2="2224" y1="2864" y2="2864" x1="2016" />
            <wire x2="2224" y1="2864" y2="3280" x1="2224" />
            <wire x2="2432" y1="2864" y2="2864" x1="2224" />
            <wire x2="2432" y1="2864" y2="3280" x1="2432" />
            <wire x2="2896" y1="2864" y2="2864" x1="2432" />
            <wire x2="2896" y1="2864" y2="3248" x1="2896" />
            <wire x2="3168" y1="2864" y2="2864" x1="2896" />
            <wire x2="3168" y1="2864" y2="3216" x1="3168" />
            <wire x2="4320" y1="2864" y2="2864" x1="3168" />
            <wire x2="4320" y1="2864" y2="3216" x1="4320" />
            <wire x2="5152" y1="2864" y2="2864" x1="4320" />
            <wire x2="5152" y1="2864" y2="3216" x1="5152" />
            <wire x2="5888" y1="2864" y2="2864" x1="5152" />
            <wire x2="6336" y1="2864" y2="2864" x1="5888" />
            <wire x2="6336" y1="2864" y2="3264" x1="6336" />
            <wire x2="5888" y1="2864" y2="3264" x1="5888" />
            <wire x2="6336" y1="3264" y2="3264" x1="6112" />
            <wire x2="6336" y1="2160" y2="2864" x1="6336" />
        </branch>
        <instance x="6368" y="1936" name="XLXI_95" orien="M90" />
        <instance x="5840" y="1888" name="XLXI_97" orien="M90" />
        <instance x="5568" y="1904" name="XLXI_98" orien="M90" />
        <branch name="XLXN_67">
            <wire x2="1280" y1="2896" y2="3280" x1="1280" />
            <wire x2="1680" y1="2896" y2="2896" x1="1280" />
            <wire x2="1680" y1="2896" y2="3280" x1="1680" />
            <wire x2="2608" y1="2896" y2="2896" x1="1680" />
            <wire x2="2608" y1="2896" y2="3248" x1="2608" />
            <wire x2="2768" y1="2896" y2="2896" x1="2608" />
            <wire x2="2768" y1="2896" y2="3248" x1="2768" />
            <wire x2="5024" y1="2896" y2="2896" x1="2768" />
            <wire x2="5024" y1="2896" y2="3216" x1="5024" />
            <wire x2="5520" y1="2896" y2="2896" x1="5024" />
            <wire x2="5520" y1="2896" y2="3264" x1="5520" />
            <wire x2="5760" y1="2896" y2="2896" x1="5520" />
            <wire x2="5760" y1="2896" y2="3264" x1="5760" />
            <wire x2="5808" y1="2896" y2="2896" x1="5760" />
            <wire x2="6048" y1="2896" y2="2896" x1="5808" />
            <wire x2="6048" y1="2896" y2="3264" x1="6048" />
            <wire x2="5808" y1="2112" y2="2896" x1="5808" />
        </branch>
        <instance x="1872" y="3280" name="XLXI_115" orien="M90" />
        <instance x="2080" y="3280" name="XLXI_116" orien="M90" />
        <instance x="2304" y="3888" name="XLXI_118" orien="M90" />
        <instance x="3680" y="3888" name="XLXI_119" orien="M90" />
        <instance x="5232" y="3936" name="XLXI_120" orien="M90" />
        <instance x="2288" y="3280" name="XLXI_121" orien="M90" />
        <instance x="2496" y="3280" name="XLXI_122" orien="M90" />
        <instance x="2736" y="3248" name="XLXI_124" orien="M90" />
        <instance x="2960" y="3248" name="XLXI_125" orien="M90" />
        <instance x="3584" y="3232" name="XLXI_69" orien="M90" />
        <instance x="3776" y="3232" name="XLXI_128" orien="M90" />
        <instance x="4048" y="3232" name="XLXI_129" orien="M90" />
        <instance x="4384" y="3216" name="XLXI_73" orien="M90" />
        <instance x="4592" y="3216" name="XLXI_130" orien="M90" />
        <instance x="4768" y="3200" name="XLXI_131" orien="M90" />
        <instance x="4976" y="3200" name="XLXI_132" orien="M90" />
        <instance x="5216" y="3216" name="XLXI_133" orien="M90" />
        <branch name="XLXN_72">
            <wire x2="1744" y1="3904" y2="3904" x1="1664" />
            <wire x2="1744" y1="3536" y2="3904" x1="1744" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="1952" y1="3536" y2="3888" x1="1952" />
            <wire x2="2048" y1="3888" y2="3888" x1="1952" />
        </branch>
        <branch name="XLXN_74">
            <wire x2="2112" y1="3712" y2="3888" x1="2112" />
            <wire x2="2160" y1="3712" y2="3712" x1="2112" />
            <wire x2="2160" y1="3536" y2="3712" x1="2160" />
        </branch>
        <branch name="XLXN_75">
            <wire x2="2176" y1="3712" y2="3888" x1="2176" />
            <wire x2="2368" y1="3712" y2="3712" x1="2176" />
            <wire x2="2368" y1="3536" y2="3712" x1="2368" />
        </branch>
        <branch name="XLXN_76">
            <wire x2="2240" y1="3680" y2="3888" x1="2240" />
            <wire x2="5472" y1="3680" y2="3680" x1="2240" />
            <wire x2="5552" y1="3680" y2="3680" x1="5472" />
            <wire x2="5472" y1="3680" y2="3808" x1="5472" />
            <wire x2="5760" y1="3808" y2="3808" x1="5472" />
            <wire x2="5760" y1="3808" y2="3936" x1="5760" />
            <wire x2="5552" y1="3520" y2="3680" x1="5552" />
        </branch>
        <branch name="XLXN_79">
            <wire x2="2608" y1="3504" y2="3856" x1="2608" />
            <wire x2="2672" y1="3856" y2="3856" x1="2608" />
        </branch>
        <branch name="XLXN_80">
            <wire x2="2736" y1="3664" y2="3856" x1="2736" />
            <wire x2="2832" y1="3664" y2="3664" x1="2736" />
            <wire x2="2832" y1="3504" y2="3664" x1="2832" />
        </branch>
        <instance x="3232" y="3216" name="XLXI_127" orien="M90" />
        <branch name="XLXN_82">
            <wire x2="3136" y1="3856" y2="3856" x1="2800" />
            <wire x2="3136" y1="3472" y2="3856" x1="3136" />
        </branch>
        <branch name="XLXN_83">
            <wire x2="3424" y1="3488" y2="3888" x1="3424" />
        </branch>
        <branch name="XLXN_84">
            <wire x2="3488" y1="3664" y2="3888" x1="3488" />
            <wire x2="3648" y1="3664" y2="3664" x1="3488" />
            <wire x2="3648" y1="3488" y2="3664" x1="3648" />
        </branch>
        <branch name="XLXN_85">
            <wire x2="3552" y1="3696" y2="3888" x1="3552" />
            <wire x2="5728" y1="3696" y2="3696" x1="3552" />
            <wire x2="5792" y1="3696" y2="3696" x1="5728" />
            <wire x2="5728" y1="3696" y2="3792" x1="5728" />
            <wire x2="5824" y1="3792" y2="3792" x1="5728" />
            <wire x2="5824" y1="3792" y2="3936" x1="5824" />
            <wire x2="5792" y1="3520" y2="3696" x1="5792" />
        </branch>
        <branch name="XLXN_86">
            <wire x2="3920" y1="3488" y2="3904" x1="3920" />
            <wire x2="4240" y1="3904" y2="3904" x1="3920" />
        </branch>
        <branch name="XLXN_87">
            <wire x2="4224" y1="3472" y2="3664" x1="4224" />
            <wire x2="4304" y1="3664" y2="3664" x1="4224" />
            <wire x2="4304" y1="3664" y2="3904" x1="4304" />
        </branch>
        <branch name="XLXN_88">
            <wire x2="4640" y1="3904" y2="3904" x1="4368" />
            <wire x2="5040" y1="3904" y2="3904" x1="4640" />
            <wire x2="5040" y1="3904" y2="3936" x1="5040" />
            <wire x2="4640" y1="3456" y2="3904" x1="4640" />
        </branch>
        <branch name="XLXN_89">
            <wire x2="4464" y1="3472" y2="3936" x1="4464" />
            <wire x2="4976" y1="3936" y2="3936" x1="4464" />
        </branch>
        <branch name="XLXN_90">
            <wire x2="4848" y1="3456" y2="3664" x1="4848" />
            <wire x2="5104" y1="3664" y2="3664" x1="4848" />
            <wire x2="5104" y1="3664" y2="3936" x1="5104" />
        </branch>
        <branch name="XLXN_91">
            <wire x2="5056" y1="3472" y2="3648" x1="5056" />
            <wire x2="5168" y1="3648" y2="3648" x1="5056" />
            <wire x2="5168" y1="3648" y2="3936" x1="5168" />
        </branch>
        <instance x="5952" y="3936" name="XLXI_134" orien="M90" />
        <branch name="XLXN_92">
            <wire x2="5648" y1="4336" y2="4480" x1="5648" />
            <wire x2="5792" y1="4336" y2="4336" x1="5648" />
            <wire x2="5792" y1="4192" y2="4336" x1="5792" />
        </branch>
        <branch name="XLXN_93">
            <wire x2="5312" y1="3520" y2="3936" x1="5312" />
            <wire x2="5696" y1="3936" y2="3936" x1="5312" />
        </branch>
        <branch name="D3">
            <wire x2="1408" y1="1760" y2="3280" x1="1408" />
            <wire x2="3536" y1="1760" y2="1760" x1="1408" />
            <wire x2="3536" y1="1760" y2="3232" x1="3536" />
            <wire x2="3968" y1="1760" y2="1760" x1="3536" />
            <wire x2="3984" y1="1760" y2="1760" x1="3968" />
            <wire x2="4544" y1="1760" y2="1760" x1="3984" />
            <wire x2="4544" y1="1760" y2="3216" x1="4544" />
            <wire x2="4688" y1="1760" y2="1760" x1="4544" />
            <wire x2="4704" y1="1760" y2="1760" x1="4688" />
            <wire x2="4720" y1="1760" y2="1760" x1="4704" />
            <wire x2="4864" y1="1760" y2="1760" x1="4720" />
            <wire x2="4912" y1="1760" y2="1760" x1="4864" />
            <wire x2="5408" y1="1760" y2="1760" x1="4912" />
            <wire x2="5408" y1="1760" y2="3264" x1="5408" />
            <wire x2="5648" y1="1760" y2="1760" x1="5408" />
            <wire x2="6336" y1="1760" y2="1760" x1="5648" />
            <wire x2="6336" y1="1760" y2="1936" x1="6336" />
            <wire x2="5648" y1="1760" y2="3264" x1="5648" />
            <wire x2="4720" y1="1760" y2="3200" x1="4720" />
            <wire x2="3968" y1="1760" y2="1888" x1="3968" />
            <wire x2="3984" y1="1888" y2="1888" x1="3968" />
            <wire x2="3984" y1="1888" y2="3232" x1="3984" />
            <wire x2="3536" y1="3232" y2="3232" x1="3520" />
            <wire x2="4544" y1="3216" y2="3216" x1="4528" />
            <wire x2="4720" y1="3200" y2="3200" x1="4704" />
            <wire x2="6336" y1="1488" y2="1760" x1="6336" />
        </branch>
        <branch name="D2">
            <wire x2="1344" y1="2192" y2="3280" x1="1344" />
            <wire x2="1584" y1="2192" y2="2192" x1="1344" />
            <wire x2="1584" y1="2192" y2="3280" x1="1584" />
            <wire x2="2832" y1="2192" y2="2192" x1="1584" />
            <wire x2="2832" y1="2192" y2="3248" x1="2832" />
            <wire x2="3712" y1="2192" y2="2192" x1="2832" />
            <wire x2="3712" y1="2192" y2="3232" x1="3712" />
            <wire x2="3920" y1="2192" y2="2192" x1="3712" />
            <wire x2="3920" y1="2192" y2="3232" x1="3920" />
            <wire x2="4640" y1="2192" y2="2192" x1="3920" />
            <wire x2="4848" y1="2192" y2="2192" x1="4640" />
            <wire x2="4912" y1="2192" y2="2192" x1="4848" />
            <wire x2="4912" y1="2192" y2="3200" x1="4912" />
            <wire x2="5072" y1="2192" y2="2192" x1="4912" />
            <wire x2="5088" y1="2192" y2="2192" x1="5072" />
            <wire x2="5584" y1="2192" y2="2192" x1="5088" />
            <wire x2="5584" y1="2192" y2="3264" x1="5584" />
            <wire x2="5824" y1="2192" y2="2192" x1="5584" />
            <wire x2="6032" y1="2192" y2="2192" x1="5824" />
            <wire x2="5824" y1="2192" y2="3264" x1="5824" />
            <wire x2="5072" y1="2192" y2="2704" x1="5072" />
            <wire x2="5088" y1="2704" y2="2704" x1="5072" />
            <wire x2="5088" y1="2704" y2="3216" x1="5088" />
            <wire x2="4640" y1="2192" y2="3200" x1="4640" />
            <wire x2="6032" y1="1888" y2="2192" x1="6032" />
            <wire x2="6096" y1="1888" y2="1888" x1="6032" />
            <wire x2="6096" y1="1440" y2="1888" x1="6096" />
            <wire x2="6176" y1="1440" y2="1440" x1="6096" />
            <wire x2="6176" y1="1440" y2="1504" x1="6176" />
            <wire x2="6192" y1="1440" y2="1440" x1="6176" />
            <wire x2="6192" y1="1248" y2="1440" x1="6192" />
        </branch>
        <branch name="D0">
            <wire x2="1456" y1="1696" y2="3280" x1="1456" />
            <wire x2="1888" y1="1696" y2="1696" x1="1456" />
            <wire x2="1888" y1="1696" y2="3280" x1="1888" />
            <wire x2="2304" y1="1696" y2="1696" x1="1888" />
            <wire x2="2528" y1="1696" y2="1696" x1="2304" />
            <wire x2="2528" y1="1696" y2="3248" x1="2528" />
            <wire x2="2544" y1="3248" y2="3248" x1="2528" />
            <wire x2="3104" y1="1696" y2="1696" x1="2528" />
            <wire x2="3104" y1="1696" y2="3216" x1="3104" />
            <wire x2="3584" y1="1696" y2="1696" x1="3104" />
            <wire x2="3584" y1="1696" y2="3232" x1="3584" />
            <wire x2="4400" y1="1696" y2="1696" x1="3584" />
            <wire x2="4400" y1="1696" y2="3216" x1="4400" />
            <wire x2="4800" y1="1696" y2="1696" x1="4400" />
            <wire x2="4960" y1="1696" y2="1696" x1="4800" />
            <wire x2="5216" y1="1696" y2="1696" x1="4960" />
            <wire x2="5456" y1="1696" y2="1696" x1="5216" />
            <wire x2="5456" y1="1696" y2="3264" x1="5456" />
            <wire x2="5536" y1="1696" y2="1696" x1="5456" />
            <wire x2="5920" y1="1696" y2="1696" x1="5536" />
            <wire x2="5920" y1="1696" y2="3264" x1="5920" />
            <wire x2="5536" y1="1696" y2="1904" x1="5536" />
            <wire x2="5216" y1="1696" y2="3264" x1="5216" />
            <wire x2="4960" y1="1696" y2="3216" x1="4960" />
            <wire x2="2304" y1="1696" y2="3280" x1="2304" />
            <wire x2="5536" y1="1504" y2="1696" x1="5536" />
        </branch>
        <branch name="D1">
            <wire x2="1520" y1="1824" y2="3280" x1="1520" />
            <wire x2="1952" y1="1824" y2="1824" x1="1520" />
            <wire x2="1952" y1="1824" y2="3280" x1="1952" />
            <wire x2="2096" y1="1824" y2="1824" x1="1952" />
            <wire x2="3392" y1="1824" y2="1824" x1="2096" />
            <wire x2="3392" y1="1824" y2="3232" x1="3392" />
            <wire x2="3648" y1="1824" y2="1824" x1="3392" />
            <wire x2="3648" y1="1824" y2="3232" x1="3648" />
            <wire x2="3840" y1="1824" y2="1824" x1="3648" />
            <wire x2="3840" y1="1824" y2="3232" x1="3840" />
            <wire x2="3856" y1="3232" y2="3232" x1="3840" />
            <wire x2="3984" y1="1824" y2="1824" x1="3840" />
            <wire x2="4208" y1="1824" y2="1824" x1="3984" />
            <wire x2="4208" y1="1824" y2="2512" x1="4208" />
            <wire x2="4464" y1="1824" y2="1824" x1="4208" />
            <wire x2="4464" y1="1824" y2="3216" x1="4464" />
            <wire x2="4624" y1="1824" y2="1824" x1="4464" />
            <wire x2="4640" y1="1824" y2="1824" x1="4624" />
            <wire x2="4832" y1="1824" y2="1824" x1="4640" />
            <wire x2="4832" y1="1824" y2="2512" x1="4832" />
            <wire x2="4848" y1="2512" y2="2512" x1="4832" />
            <wire x2="4848" y1="2512" y2="3200" x1="4848" />
            <wire x2="5296" y1="1824" y2="1824" x1="4832" />
            <wire x2="5808" y1="1824" y2="1824" x1="5296" />
            <wire x2="5808" y1="1824" y2="1888" x1="5808" />
            <wire x2="5296" y1="1824" y2="2544" x1="5296" />
            <wire x2="2096" y1="1824" y2="3280" x1="2096" />
            <wire x2="4192" y1="2512" y2="3216" x1="4192" />
            <wire x2="4208" y1="2512" y2="2512" x1="4192" />
            <wire x2="5280" y1="2544" y2="3264" x1="5280" />
            <wire x2="5296" y1="2544" y2="2544" x1="5280" />
            <wire x2="5808" y1="1504" y2="1824" x1="5808" />
        </branch>
        <branch name="XLXN_129">
            <wire x2="1216" y1="2720" y2="3280" x1="1216" />
            <wire x2="3328" y1="2720" y2="2720" x1="1216" />
            <wire x2="3328" y1="2720" y2="3232" x1="3328" />
            <wire x2="4128" y1="2720" y2="2720" x1="3328" />
            <wire x2="4128" y1="2720" y2="3216" x1="4128" />
            <wire x2="4576" y1="2720" y2="2720" x1="4128" />
            <wire x2="4576" y1="2720" y2="3200" x1="4576" />
            <wire x2="4784" y1="2720" y2="2720" x1="4576" />
            <wire x2="4784" y1="2720" y2="3200" x1="4784" />
            <wire x2="5616" y1="2720" y2="2720" x1="4784" />
            <wire x2="5696" y1="2720" y2="2720" x1="5616" />
            <wire x2="5696" y1="2720" y2="3264" x1="5696" />
            <wire x2="5536" y1="2128" y2="2416" x1="5536" />
            <wire x2="5616" y1="2416" y2="2416" x1="5536" />
            <wire x2="5616" y1="2416" y2="2720" x1="5616" />
        </branch>
        <instance x="6208" y="1504" name="XLXI_135" orien="M90" />
        <branch name="XLXN_130">
            <wire x2="1744" y1="2640" y2="3280" x1="1744" />
            <wire x2="2160" y1="2640" y2="2640" x1="1744" />
            <wire x2="2368" y1="2640" y2="2640" x1="2160" />
            <wire x2="2368" y1="2640" y2="3280" x1="2368" />
            <wire x2="2688" y1="2640" y2="2640" x1="2368" />
            <wire x2="2688" y1="2640" y2="2928" x1="2688" />
            <wire x2="3456" y1="2640" y2="2640" x1="2688" />
            <wire x2="3456" y1="2640" y2="3232" x1="3456" />
            <wire x2="4256" y1="2640" y2="2640" x1="3456" />
            <wire x2="4256" y1="2640" y2="3216" x1="4256" />
            <wire x2="4800" y1="2640" y2="2640" x1="4256" />
            <wire x2="5344" y1="2640" y2="2640" x1="4800" />
            <wire x2="5344" y1="2640" y2="3264" x1="5344" />
            <wire x2="5952" y1="2640" y2="2640" x1="5344" />
            <wire x2="5984" y1="2640" y2="2640" x1="5952" />
            <wire x2="5984" y1="2640" y2="3264" x1="5984" />
            <wire x2="2160" y1="2640" y2="3280" x1="2160" />
            <wire x2="2688" y1="2928" y2="2928" x1="2672" />
            <wire x2="2672" y1="2928" y2="3248" x1="2672" />
            <wire x2="5952" y1="2368" y2="2640" x1="5952" />
            <wire x2="6096" y1="2368" y2="2368" x1="5952" />
            <wire x2="6096" y1="2112" y2="2368" x1="6096" />
            <wire x2="6176" y1="2112" y2="2112" x1="6096" />
            <wire x2="6176" y1="1728" y2="2112" x1="6176" />
        </branch>
        <iomarker fontsize="28" x="5536" y="1504" name="D0" orien="R270" />
        <iomarker fontsize="28" x="5808" y="1504" name="D1" orien="R270" />
        <iomarker fontsize="28" x="6192" y="1248" name="D2" orien="R270" />
        <iomarker fontsize="28" x="6336" y="1488" name="D3" orien="R270" />
    </sheet>
</drawing>