`timescale 1ns / 1ps

module MyMC14495(D0, 
                 D1, 
                 D2, 
                 D3, 
                 LE, 
                 point, 
                 a, 
                 b, 
                 c, 
                 d, 
                 e, 
                 f, 
                 g, 
                 p);

    input D0;
    input D1;
    input D2;
    input D3;
    input LE;
    input point;
   output a;
   output b;
   output c;
   output d;
   output e;
   output f;
   output g;
   output p;
   
   wire XLXN_18;
   wire XLXN_25;
   wire XLXN_29;
   wire XLXN_30;
   wire XLXN_31;
   wire XLXN_32;
   wire XLXN_33;
   wire XLXN_34;
   wire XLXN_54;
   wire XLXN_55;
   wire XLXN_67;
   wire XLXN_72;
   wire XLXN_73;
   wire XLXN_74;
   wire XLXN_75;
   wire XLXN_76;
   wire XLXN_79;
   wire XLXN_80;
   wire XLXN_82;
   wire XLXN_83;
   wire XLXN_84;
   wire XLXN_85;
   wire XLXN_86;
   wire XLXN_87;
   wire XLXN_88;
   wire XLXN_89;
   wire XLXN_90;
   wire XLXN_91;
   wire XLXN_92;
   wire XLXN_93;
   wire XLXN_129;
   wire XLXN_130;
   
   AND4  XLXI_60 (.I0(D3), 
                 .I1(D2), 
                 .I2(XLXN_67), 
                 .I3(XLXN_129), 
                 .O(XLXN_33));
   AND4  XLXI_61 (.I0(XLXN_55), 
                 .I1(D2), 
                 .I2(D1), 
                 .I3(D0), 
                 .O(XLXN_34));
   AND4  XLXI_69 (.I0(D3), 
                 .I1(XLXN_130), 
                 .I2(D1), 
                 .I3(XLXN_129), 
                 .O(XLXN_83));
   AND4  XLXI_73 (.I0(XLXN_55), 
                 .I1(XLXN_130), 
                 .I2(D1), 
                 .I3(XLXN_129), 
                 .O(XLXN_87));
   AND4  XLXI_77 (.I0(D3), 
                 .I1(XLXN_130), 
                 .I2(D1), 
                 .I3(D0), 
                 .O(XLXN_93));
   AND4  XLXI_78 (.I0(D3), 
                 .I1(D2), 
                 .I2(XLXN_67), 
                 .I3(D0), 
                 .O(XLXN_76));
   AND4  XLXI_79 (.I0(XLXN_55), 
                 .I1(D2), 
                 .I2(XLXN_67), 
                 .I3(XLXN_129), 
                 .O(XLXN_85));
   AND4  XLXI_80 (.I0(XLXN_55), 
                 .I1(XLXN_67), 
                 .I2(XLXN_130), 
                 .I3(D0), 
                 .O(XLXN_54));
   OR2  XLXI_88 (.I0(XLXN_18), 
                .I1(LE), 
                .O(g));
   OR2  XLXI_89 (.I0(XLXN_31), 
                .I1(LE), 
                .O(f));
   OR2  XLXI_90 (.I0(XLXN_32), 
                .I1(LE), 
                .O(e));
   OR2  XLXI_91 (.I0(XLXN_30), 
                .I1(LE), 
                .O(d));
   OR2  XLXI_92 (.I0(XLXN_29), 
                .I1(LE), 
                .O(c));
   OR2  XLXI_93 (.I0(XLXN_25), 
                .I1(LE), 
                .O(b));
   OR2  XLXI_94 (.I0(XLXN_92), 
                .I1(LE), 
                .O(a));
   INV  XLXI_95 (.I(D3), 
                .O(XLXN_55));
   INV  XLXI_97 (.I(D1), 
                .O(XLXN_67));
   INV  XLXI_98 (.I(D0), 
                .O(XLXN_129));
   INV  XLXI_99 (.I(point), 
                .O(p));
   OR3  XLXI_101 (.I0(XLXN_72), 
                 .I1(XLXN_34), 
                 .I2(XLXN_33), 
                 .O(XLXN_18));
   OR3  XLXI_110 (.I0(XLXN_88), 
                 .I1(XLXN_87), 
                 .I2(XLXN_86), 
                 .O(XLXN_29));
   OR3  XLXI_114 (.I0(XLXN_82), 
                 .I1(XLXN_80), 
                 .I2(XLXN_79), 
                 .O(XLXN_32));
   AND3  XLXI_115 (.I0(XLXN_55), 
                  .I1(XLXN_130), 
                  .I2(XLXN_67), 
                  .O(XLXN_72));
   AND3  XLXI_116 (.I0(XLXN_55), 
                  .I1(D1), 
                  .I2(D0), 
                  .O(XLXN_73));
   OR4  XLXI_118 (.I0(XLXN_76), 
                 .I1(XLXN_75), 
                 .I2(XLXN_74), 
                 .I3(XLXN_73), 
                 .O(XLXN_31));
   OR4  XLXI_119 (.I0(XLXN_54), 
                 .I1(XLXN_85), 
                 .I2(XLXN_84), 
                 .I3(XLXN_83), 
                 .O(XLXN_30));
   OR4  XLXI_120 (.I0(XLXN_91), 
                 .I1(XLXN_90), 
                 .I2(XLXN_88), 
                 .I3(XLXN_89), 
                 .O(XLXN_25));
   AND3  XLXI_121 (.I0(XLXN_55), 
                  .I1(XLXN_130), 
                  .I2(D1), 
                  .O(XLXN_74));
   AND3  XLXI_122 (.I0(XLXN_55), 
                  .I1(XLXN_130), 
                  .I2(D0), 
                  .O(XLXN_75));
   AND3  XLXI_124 (.I0(XLXN_130), 
                  .I1(XLXN_67), 
                  .I2(D0), 
                  .O(XLXN_79));
   AND3  XLXI_125 (.I0(XLXN_55), 
                  .I1(D2), 
                  .I2(XLXN_67), 
                  .O(XLXN_80));
   AND2  XLXI_127 (.I0(XLXN_55), 
                  .I1(D0), 
                  .O(XLXN_82));
   AND3  XLXI_128 (.I0(D2), 
                  .I1(D1), 
                  .I2(D0), 
                  .O(XLXN_84));
   AND3  XLXI_129 (.I0(D3), 
                  .I1(D2), 
                  .I2(D1), 
                  .O(XLXN_86));
   AND3  XLXI_130 (.I0(D3), 
                  .I1(D1), 
                  .I2(D0), 
                  .O(XLXN_89));
   AND3  XLXI_131 (.I0(D3), 
                  .I1(D2), 
                  .I2(XLXN_129), 
                  .O(XLXN_88));
   AND3  XLXI_132 (.I0(D2), 
                  .I1(D1), 
                  .I2(XLXN_129), 
                  .O(XLXN_90));
   AND4  XLXI_133 (.I0(XLXN_55), 
                  .I1(D2), 
                  .I2(XLXN_67), 
                  .I3(D0), 
                  .O(XLXN_91));
   OR4  XLXI_134 (.I0(XLXN_54), 
                 .I1(XLXN_85), 
                 .I2(XLXN_76), 
                 .I3(XLXN_93), 
                 .O(XLXN_92));
   INV  XLXI_135 (.I(D2), 
                 .O(XLXN_130));
endmodule
