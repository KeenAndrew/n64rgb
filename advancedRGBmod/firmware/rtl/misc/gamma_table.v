//////////////////////////////////////////////////////////////////////////////////
//
// This file is part of the N64 RGB/YPbPr DAC project.
//
// Copyright (C) 2016-2018 by Peter Bartmann <borti4938@gmx.de>
//
// N64 RGB/YPbPr DAC is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//////////////////////////////////////////////////////////////////////////////////
//
// Company:  Circuit-Board.de
// Engineer: borti4938
//
// Module Name:    gamma_table
// Project Name:   N64 Advanced RGB/YPbPr DAC Mod
// Target Devices: Max10, Cyclone IV and Cyclone 10 LP devices
// Tool versions:  Altera Quartus Prime
// Description:    simple line-multiplying
//
// Features: ip independent implementation of gamma rom
//
// This file is auto generated by script/gamma2rom.m
//
//////////////////////////////////////////////////////////////////////////////////


module gamma_table(
  VCLK,
  gamma_val,
  vdata_in,
  nbypass,
  vdata_out
);

`include "vh/n64adv_vparams.vh"

input                     VCLK;
input [              2:0] gamma_val;
input [color_width_i-1:0] vdata_in;
input                     nbypass;

output reg [color_width_i-1:0] vdata_out;


reg [color_width_i+2:0] addr_r = {(color_width_i+3){1'b0}};
reg                  nbypass_r =  1'b0;

always @(posedge VCLK) begin
  addr_r <= {gamma_val,vdata_in};
  nbypass_r <= nbypass;

  case (addr_r)
    0000: vdata_out <= 000;
    0001: vdata_out <= 003;
    0002: vdata_out <= 006;
    0003: vdata_out <= 008;
    0004: vdata_out <= 009;
    0005: vdata_out <= 011;
    0006: vdata_out <= 013;
    0007: vdata_out <= 014;
    0008: vdata_out <= 016;
    0009: vdata_out <= 017;
    0010: vdata_out <= 019;
    0011: vdata_out <= 020;
    0012: vdata_out <= 022;
    0013: vdata_out <= 023;
    0014: vdata_out <= 024;
    0015: vdata_out <= 026;
    0016: vdata_out <= 027;
    0017: vdata_out <= 028;
    0018: vdata_out <= 029;
    0019: vdata_out <= 031;
    0020: vdata_out <= 032;
    0021: vdata_out <= 033;
    0022: vdata_out <= 034;
    0023: vdata_out <= 035;
    0024: vdata_out <= 036;
    0025: vdata_out <= 038;
    0026: vdata_out <= 039;
    0027: vdata_out <= 040;
    0028: vdata_out <= 041;
    0029: vdata_out <= 042;
    0030: vdata_out <= 043;
    0031: vdata_out <= 044;
    0032: vdata_out <= 045;
    0033: vdata_out <= 046;
    0034: vdata_out <= 047;
    0035: vdata_out <= 048;
    0036: vdata_out <= 049;
    0037: vdata_out <= 050;
    0038: vdata_out <= 051;
    0039: vdata_out <= 052;
    0040: vdata_out <= 053;
    0041: vdata_out <= 054;
    0042: vdata_out <= 055;
    0043: vdata_out <= 056;
    0044: vdata_out <= 057;
    0045: vdata_out <= 058;
    0046: vdata_out <= 059;
    0047: vdata_out <= 060;
    0048: vdata_out <= 061;
    0049: vdata_out <= 062;
    0050: vdata_out <= 063;
    0051: vdata_out <= 064;
    0052: vdata_out <= 065;
    0053: vdata_out <= 066;
    0054: vdata_out <= 067;
    0055: vdata_out <= 068;
    0056: vdata_out <= 069;
    0057: vdata_out <= 070;
    0058: vdata_out <= 071;
    0059: vdata_out <= 071;
    0060: vdata_out <= 072;
    0061: vdata_out <= 073;
    0062: vdata_out <= 074;
    0063: vdata_out <= 075;
    0064: vdata_out <= 076;
    0065: vdata_out <= 077;
    0066: vdata_out <= 078;
    0067: vdata_out <= 079;
    0068: vdata_out <= 079;
    0069: vdata_out <= 080;
    0070: vdata_out <= 081;
    0071: vdata_out <= 082;
    0072: vdata_out <= 083;
    0073: vdata_out <= 084;
    0074: vdata_out <= 085;
    0075: vdata_out <= 086;
    0076: vdata_out <= 086;
    0077: vdata_out <= 087;
    0078: vdata_out <= 088;
    0079: vdata_out <= 089;
    0080: vdata_out <= 090;
    0081: vdata_out <= 091;
    0082: vdata_out <= 091;
    0083: vdata_out <= 092;
    0084: vdata_out <= 093;
    0085: vdata_out <= 094;
    0086: vdata_out <= 095;
    0087: vdata_out <= 096;
    0088: vdata_out <= 096;
    0089: vdata_out <= 097;
    0090: vdata_out <= 098;
    0091: vdata_out <= 099;
    0092: vdata_out <= 100;
    0093: vdata_out <= 101;
    0094: vdata_out <= 101;
    0095: vdata_out <= 102;
    0096: vdata_out <= 103;
    0097: vdata_out <= 104;
    0098: vdata_out <= 105;
    0099: vdata_out <= 105;
    0100: vdata_out <= 106;
    0101: vdata_out <= 107;
    0102: vdata_out <= 108;
    0103: vdata_out <= 109;
    0104: vdata_out <= 109;
    0105: vdata_out <= 110;
    0106: vdata_out <= 111;
    0107: vdata_out <= 112;
    0108: vdata_out <= 112;
    0109: vdata_out <= 113;
    0110: vdata_out <= 114;
    0111: vdata_out <= 115;
    0112: vdata_out <= 116;
    0113: vdata_out <= 116;
    0114: vdata_out <= 117;
    0115: vdata_out <= 118;
    0116: vdata_out <= 119;
    0117: vdata_out <= 119;
    0118: vdata_out <= 120;
    0119: vdata_out <= 121;
    0120: vdata_out <= 122;
    0121: vdata_out <= 122;
    0122: vdata_out <= 123;
    0123: vdata_out <= 124;
    0124: vdata_out <= 125;
    0125: vdata_out <= 125;
    0126: vdata_out <= 126;
    0127: vdata_out <= 127;
    0128: vdata_out <= 000;
    0129: vdata_out <= 003;
    0130: vdata_out <= 005;
    0131: vdata_out <= 006;
    0132: vdata_out <= 008;
    0133: vdata_out <= 010;
    0134: vdata_out <= 011;
    0135: vdata_out <= 012;
    0136: vdata_out <= 014;
    0137: vdata_out <= 015;
    0138: vdata_out <= 017;
    0139: vdata_out <= 018;
    0140: vdata_out <= 019;
    0141: vdata_out <= 021;
    0142: vdata_out <= 022;
    0143: vdata_out <= 023;
    0144: vdata_out <= 024;
    0145: vdata_out <= 025;
    0146: vdata_out <= 027;
    0147: vdata_out <= 028;
    0148: vdata_out <= 029;
    0149: vdata_out <= 030;
    0150: vdata_out <= 031;
    0151: vdata_out <= 032;
    0152: vdata_out <= 033;
    0153: vdata_out <= 035;
    0154: vdata_out <= 036;
    0155: vdata_out <= 037;
    0156: vdata_out <= 038;
    0157: vdata_out <= 039;
    0158: vdata_out <= 040;
    0159: vdata_out <= 041;
    0160: vdata_out <= 042;
    0161: vdata_out <= 043;
    0162: vdata_out <= 044;
    0163: vdata_out <= 045;
    0164: vdata_out <= 046;
    0165: vdata_out <= 047;
    0166: vdata_out <= 048;
    0167: vdata_out <= 049;
    0168: vdata_out <= 050;
    0169: vdata_out <= 051;
    0170: vdata_out <= 052;
    0171: vdata_out <= 053;
    0172: vdata_out <= 054;
    0173: vdata_out <= 055;
    0174: vdata_out <= 056;
    0175: vdata_out <= 057;
    0176: vdata_out <= 058;
    0177: vdata_out <= 059;
    0178: vdata_out <= 060;
    0179: vdata_out <= 061;
    0180: vdata_out <= 062;
    0181: vdata_out <= 063;
    0182: vdata_out <= 064;
    0183: vdata_out <= 065;
    0184: vdata_out <= 066;
    0185: vdata_out <= 067;
    0186: vdata_out <= 068;
    0187: vdata_out <= 069;
    0188: vdata_out <= 070;
    0189: vdata_out <= 071;
    0190: vdata_out <= 072;
    0191: vdata_out <= 072;
    0192: vdata_out <= 073;
    0193: vdata_out <= 074;
    0194: vdata_out <= 075;
    0195: vdata_out <= 076;
    0196: vdata_out <= 077;
    0197: vdata_out <= 078;
    0198: vdata_out <= 079;
    0199: vdata_out <= 080;
    0200: vdata_out <= 081;
    0201: vdata_out <= 082;
    0202: vdata_out <= 082;
    0203: vdata_out <= 083;
    0204: vdata_out <= 084;
    0205: vdata_out <= 085;
    0206: vdata_out <= 086;
    0207: vdata_out <= 087;
    0208: vdata_out <= 088;
    0209: vdata_out <= 089;
    0210: vdata_out <= 089;
    0211: vdata_out <= 090;
    0212: vdata_out <= 091;
    0213: vdata_out <= 092;
    0214: vdata_out <= 093;
    0215: vdata_out <= 094;
    0216: vdata_out <= 095;
    0217: vdata_out <= 096;
    0218: vdata_out <= 096;
    0219: vdata_out <= 097;
    0220: vdata_out <= 098;
    0221: vdata_out <= 099;
    0222: vdata_out <= 100;
    0223: vdata_out <= 101;
    0224: vdata_out <= 102;
    0225: vdata_out <= 102;
    0226: vdata_out <= 103;
    0227: vdata_out <= 104;
    0228: vdata_out <= 105;
    0229: vdata_out <= 106;
    0230: vdata_out <= 107;
    0231: vdata_out <= 107;
    0232: vdata_out <= 108;
    0233: vdata_out <= 109;
    0234: vdata_out <= 110;
    0235: vdata_out <= 111;
    0236: vdata_out <= 112;
    0237: vdata_out <= 112;
    0238: vdata_out <= 113;
    0239: vdata_out <= 114;
    0240: vdata_out <= 115;
    0241: vdata_out <= 116;
    0242: vdata_out <= 116;
    0243: vdata_out <= 117;
    0244: vdata_out <= 118;
    0245: vdata_out <= 119;
    0246: vdata_out <= 120;
    0247: vdata_out <= 121;
    0248: vdata_out <= 121;
    0249: vdata_out <= 122;
    0250: vdata_out <= 123;
    0251: vdata_out <= 124;
    0252: vdata_out <= 125;
    0253: vdata_out <= 125;
    0254: vdata_out <= 126;
    0255: vdata_out <= 127;
    0256: vdata_out <= 000;
    0257: vdata_out <= 002;
    0258: vdata_out <= 004;
    0259: vdata_out <= 005;
    0260: vdata_out <= 007;
    0261: vdata_out <= 008;
    0262: vdata_out <= 009;
    0263: vdata_out <= 011;
    0264: vdata_out <= 012;
    0265: vdata_out <= 013;
    0266: vdata_out <= 015;
    0267: vdata_out <= 016;
    0268: vdata_out <= 017;
    0269: vdata_out <= 018;
    0270: vdata_out <= 019;
    0271: vdata_out <= 021;
    0272: vdata_out <= 022;
    0273: vdata_out <= 023;
    0274: vdata_out <= 024;
    0275: vdata_out <= 025;
    0276: vdata_out <= 026;
    0277: vdata_out <= 028;
    0278: vdata_out <= 029;
    0279: vdata_out <= 030;
    0280: vdata_out <= 031;
    0281: vdata_out <= 032;
    0282: vdata_out <= 033;
    0283: vdata_out <= 034;
    0284: vdata_out <= 035;
    0285: vdata_out <= 036;
    0286: vdata_out <= 037;
    0287: vdata_out <= 038;
    0288: vdata_out <= 039;
    0289: vdata_out <= 040;
    0290: vdata_out <= 041;
    0291: vdata_out <= 042;
    0292: vdata_out <= 043;
    0293: vdata_out <= 045;
    0294: vdata_out <= 046;
    0295: vdata_out <= 047;
    0296: vdata_out <= 048;
    0297: vdata_out <= 049;
    0298: vdata_out <= 050;
    0299: vdata_out <= 051;
    0300: vdata_out <= 052;
    0301: vdata_out <= 053;
    0302: vdata_out <= 054;
    0303: vdata_out <= 055;
    0304: vdata_out <= 056;
    0305: vdata_out <= 057;
    0306: vdata_out <= 058;
    0307: vdata_out <= 058;
    0308: vdata_out <= 059;
    0309: vdata_out <= 060;
    0310: vdata_out <= 061;
    0311: vdata_out <= 062;
    0312: vdata_out <= 063;
    0313: vdata_out <= 064;
    0314: vdata_out <= 065;
    0315: vdata_out <= 066;
    0316: vdata_out <= 067;
    0317: vdata_out <= 068;
    0318: vdata_out <= 069;
    0319: vdata_out <= 070;
    0320: vdata_out <= 071;
    0321: vdata_out <= 072;
    0322: vdata_out <= 073;
    0323: vdata_out <= 074;
    0324: vdata_out <= 075;
    0325: vdata_out <= 076;
    0326: vdata_out <= 077;
    0327: vdata_out <= 077;
    0328: vdata_out <= 078;
    0329: vdata_out <= 079;
    0330: vdata_out <= 080;
    0331: vdata_out <= 081;
    0332: vdata_out <= 082;
    0333: vdata_out <= 083;
    0334: vdata_out <= 084;
    0335: vdata_out <= 085;
    0336: vdata_out <= 086;
    0337: vdata_out <= 087;
    0338: vdata_out <= 088;
    0339: vdata_out <= 088;
    0340: vdata_out <= 089;
    0341: vdata_out <= 090;
    0342: vdata_out <= 091;
    0343: vdata_out <= 092;
    0344: vdata_out <= 093;
    0345: vdata_out <= 094;
    0346: vdata_out <= 095;
    0347: vdata_out <= 096;
    0348: vdata_out <= 097;
    0349: vdata_out <= 097;
    0350: vdata_out <= 098;
    0351: vdata_out <= 099;
    0352: vdata_out <= 100;
    0353: vdata_out <= 101;
    0354: vdata_out <= 102;
    0355: vdata_out <= 103;
    0356: vdata_out <= 104;
    0357: vdata_out <= 105;
    0358: vdata_out <= 105;
    0359: vdata_out <= 106;
    0360: vdata_out <= 107;
    0361: vdata_out <= 108;
    0362: vdata_out <= 109;
    0363: vdata_out <= 110;
    0364: vdata_out <= 111;
    0365: vdata_out <= 112;
    0366: vdata_out <= 112;
    0367: vdata_out <= 113;
    0368: vdata_out <= 114;
    0369: vdata_out <= 115;
    0370: vdata_out <= 116;
    0371: vdata_out <= 117;
    0372: vdata_out <= 118;
    0373: vdata_out <= 118;
    0374: vdata_out <= 119;
    0375: vdata_out <= 120;
    0376: vdata_out <= 121;
    0377: vdata_out <= 122;
    0378: vdata_out <= 123;
    0379: vdata_out <= 124;
    0380: vdata_out <= 124;
    0381: vdata_out <= 125;
    0382: vdata_out <= 126;
    0383: vdata_out <= 127;
    0384: vdata_out <= 000;
    0385: vdata_out <= 002;
    0386: vdata_out <= 003;
    0387: vdata_out <= 004;
    0388: vdata_out <= 006;
    0389: vdata_out <= 007;
    0390: vdata_out <= 008;
    0391: vdata_out <= 009;
    0392: vdata_out <= 011;
    0393: vdata_out <= 012;
    0394: vdata_out <= 013;
    0395: vdata_out <= 014;
    0396: vdata_out <= 015;
    0397: vdata_out <= 016;
    0398: vdata_out <= 017;
    0399: vdata_out <= 019;
    0400: vdata_out <= 020;
    0401: vdata_out <= 021;
    0402: vdata_out <= 022;
    0403: vdata_out <= 023;
    0404: vdata_out <= 024;
    0405: vdata_out <= 025;
    0406: vdata_out <= 026;
    0407: vdata_out <= 027;
    0408: vdata_out <= 028;
    0409: vdata_out <= 029;
    0410: vdata_out <= 030;
    0411: vdata_out <= 032;
    0412: vdata_out <= 033;
    0413: vdata_out <= 034;
    0414: vdata_out <= 035;
    0415: vdata_out <= 036;
    0416: vdata_out <= 037;
    0417: vdata_out <= 038;
    0418: vdata_out <= 039;
    0419: vdata_out <= 040;
    0420: vdata_out <= 041;
    0421: vdata_out <= 042;
    0422: vdata_out <= 043;
    0423: vdata_out <= 044;
    0424: vdata_out <= 045;
    0425: vdata_out <= 046;
    0426: vdata_out <= 047;
    0427: vdata_out <= 048;
    0428: vdata_out <= 049;
    0429: vdata_out <= 050;
    0430: vdata_out <= 051;
    0431: vdata_out <= 052;
    0432: vdata_out <= 053;
    0433: vdata_out <= 054;
    0434: vdata_out <= 055;
    0435: vdata_out <= 056;
    0436: vdata_out <= 057;
    0437: vdata_out <= 058;
    0438: vdata_out <= 059;
    0439: vdata_out <= 060;
    0440: vdata_out <= 061;
    0441: vdata_out <= 062;
    0442: vdata_out <= 063;
    0443: vdata_out <= 064;
    0444: vdata_out <= 065;
    0445: vdata_out <= 066;
    0446: vdata_out <= 067;
    0447: vdata_out <= 068;
    0448: vdata_out <= 069;
    0449: vdata_out <= 070;
    0450: vdata_out <= 070;
    0451: vdata_out <= 071;
    0452: vdata_out <= 072;
    0453: vdata_out <= 073;
    0454: vdata_out <= 074;
    0455: vdata_out <= 075;
    0456: vdata_out <= 076;
    0457: vdata_out <= 077;
    0458: vdata_out <= 078;
    0459: vdata_out <= 079;
    0460: vdata_out <= 080;
    0461: vdata_out <= 081;
    0462: vdata_out <= 082;
    0463: vdata_out <= 083;
    0464: vdata_out <= 084;
    0465: vdata_out <= 085;
    0466: vdata_out <= 086;
    0467: vdata_out <= 087;
    0468: vdata_out <= 088;
    0469: vdata_out <= 088;
    0470: vdata_out <= 089;
    0471: vdata_out <= 090;
    0472: vdata_out <= 091;
    0473: vdata_out <= 092;
    0474: vdata_out <= 093;
    0475: vdata_out <= 094;
    0476: vdata_out <= 095;
    0477: vdata_out <= 096;
    0478: vdata_out <= 097;
    0479: vdata_out <= 098;
    0480: vdata_out <= 099;
    0481: vdata_out <= 100;
    0482: vdata_out <= 101;
    0483: vdata_out <= 101;
    0484: vdata_out <= 102;
    0485: vdata_out <= 103;
    0486: vdata_out <= 104;
    0487: vdata_out <= 105;
    0488: vdata_out <= 106;
    0489: vdata_out <= 107;
    0490: vdata_out <= 108;
    0491: vdata_out <= 109;
    0492: vdata_out <= 110;
    0493: vdata_out <= 111;
    0494: vdata_out <= 112;
    0495: vdata_out <= 113;
    0496: vdata_out <= 113;
    0497: vdata_out <= 114;
    0498: vdata_out <= 115;
    0499: vdata_out <= 116;
    0500: vdata_out <= 117;
    0501: vdata_out <= 118;
    0502: vdata_out <= 119;
    0503: vdata_out <= 120;
    0504: vdata_out <= 121;
    0505: vdata_out <= 122;
    0506: vdata_out <= 122;
    0507: vdata_out <= 123;
    0508: vdata_out <= 124;
    0509: vdata_out <= 125;
    0510: vdata_out <= 126;
    0511: vdata_out <= 127;
    0512: vdata_out <= 000;
    0513: vdata_out <= 001;
    0514: vdata_out <= 002;
    0515: vdata_out <= 004;
    0516: vdata_out <= 005;
    0517: vdata_out <= 006;
    0518: vdata_out <= 007;
    0519: vdata_out <= 008;
    0520: vdata_out <= 009;
    0521: vdata_out <= 010;
    0522: vdata_out <= 011;
    0523: vdata_out <= 012;
    0524: vdata_out <= 014;
    0525: vdata_out <= 015;
    0526: vdata_out <= 016;
    0527: vdata_out <= 017;
    0528: vdata_out <= 018;
    0529: vdata_out <= 019;
    0530: vdata_out <= 020;
    0531: vdata_out <= 021;
    0532: vdata_out <= 022;
    0533: vdata_out <= 023;
    0534: vdata_out <= 024;
    0535: vdata_out <= 025;
    0536: vdata_out <= 026;
    0537: vdata_out <= 027;
    0538: vdata_out <= 028;
    0539: vdata_out <= 029;
    0540: vdata_out <= 030;
    0541: vdata_out <= 031;
    0542: vdata_out <= 032;
    0543: vdata_out <= 033;
    0544: vdata_out <= 034;
    0545: vdata_out <= 035;
    0546: vdata_out <= 036;
    0547: vdata_out <= 037;
    0548: vdata_out <= 038;
    0549: vdata_out <= 039;
    0550: vdata_out <= 040;
    0551: vdata_out <= 041;
    0552: vdata_out <= 042;
    0553: vdata_out <= 043;
    0554: vdata_out <= 044;
    0555: vdata_out <= 045;
    0556: vdata_out <= 046;
    0557: vdata_out <= 047;
    0558: vdata_out <= 048;
    0559: vdata_out <= 049;
    0560: vdata_out <= 050;
    0561: vdata_out <= 051;
    0562: vdata_out <= 052;
    0563: vdata_out <= 053;
    0564: vdata_out <= 054;
    0565: vdata_out <= 055;
    0566: vdata_out <= 056;
    0567: vdata_out <= 057;
    0568: vdata_out <= 058;
    0569: vdata_out <= 059;
    0570: vdata_out <= 060;
    0571: vdata_out <= 061;
    0572: vdata_out <= 062;
    0573: vdata_out <= 063;
    0574: vdata_out <= 064;
    0575: vdata_out <= 065;
    0576: vdata_out <= 066;
    0577: vdata_out <= 067;
    0578: vdata_out <= 068;
    0579: vdata_out <= 069;
    0580: vdata_out <= 070;
    0581: vdata_out <= 071;
    0582: vdata_out <= 072;
    0583: vdata_out <= 073;
    0584: vdata_out <= 074;
    0585: vdata_out <= 075;
    0586: vdata_out <= 076;
    0587: vdata_out <= 077;
    0588: vdata_out <= 078;
    0589: vdata_out <= 079;
    0590: vdata_out <= 080;
    0591: vdata_out <= 081;
    0592: vdata_out <= 082;
    0593: vdata_out <= 083;
    0594: vdata_out <= 084;
    0595: vdata_out <= 085;
    0596: vdata_out <= 086;
    0597: vdata_out <= 087;
    0598: vdata_out <= 088;
    0599: vdata_out <= 089;
    0600: vdata_out <= 090;
    0601: vdata_out <= 091;
    0602: vdata_out <= 092;
    0603: vdata_out <= 093;
    0604: vdata_out <= 093;
    0605: vdata_out <= 094;
    0606: vdata_out <= 095;
    0607: vdata_out <= 096;
    0608: vdata_out <= 097;
    0609: vdata_out <= 098;
    0610: vdata_out <= 099;
    0611: vdata_out <= 100;
    0612: vdata_out <= 101;
    0613: vdata_out <= 102;
    0614: vdata_out <= 103;
    0615: vdata_out <= 104;
    0616: vdata_out <= 105;
    0617: vdata_out <= 106;
    0618: vdata_out <= 107;
    0619: vdata_out <= 108;
    0620: vdata_out <= 109;
    0621: vdata_out <= 110;
    0622: vdata_out <= 111;
    0623: vdata_out <= 112;
    0624: vdata_out <= 113;
    0625: vdata_out <= 114;
    0626: vdata_out <= 115;
    0627: vdata_out <= 116;
    0628: vdata_out <= 117;
    0629: vdata_out <= 117;
    0630: vdata_out <= 118;
    0631: vdata_out <= 119;
    0632: vdata_out <= 120;
    0633: vdata_out <= 121;
    0634: vdata_out <= 122;
    0635: vdata_out <= 123;
    0636: vdata_out <= 124;
    0637: vdata_out <= 125;
    0638: vdata_out <= 126;
    0639: vdata_out <= 127;
    0640: vdata_out <= 000;
    0641: vdata_out <= 001;
    0642: vdata_out <= 002;
    0643: vdata_out <= 002;
    0644: vdata_out <= 003;
    0645: vdata_out <= 004;
    0646: vdata_out <= 005;
    0647: vdata_out <= 006;
    0648: vdata_out <= 007;
    0649: vdata_out <= 008;
    0650: vdata_out <= 009;
    0651: vdata_out <= 010;
    0652: vdata_out <= 011;
    0653: vdata_out <= 012;
    0654: vdata_out <= 013;
    0655: vdata_out <= 013;
    0656: vdata_out <= 014;
    0657: vdata_out <= 015;
    0658: vdata_out <= 016;
    0659: vdata_out <= 017;
    0660: vdata_out <= 018;
    0661: vdata_out <= 019;
    0662: vdata_out <= 020;
    0663: vdata_out <= 021;
    0664: vdata_out <= 022;
    0665: vdata_out <= 023;
    0666: vdata_out <= 024;
    0667: vdata_out <= 025;
    0668: vdata_out <= 026;
    0669: vdata_out <= 027;
    0670: vdata_out <= 028;
    0671: vdata_out <= 029;
    0672: vdata_out <= 030;
    0673: vdata_out <= 031;
    0674: vdata_out <= 032;
    0675: vdata_out <= 033;
    0676: vdata_out <= 034;
    0677: vdata_out <= 035;
    0678: vdata_out <= 036;
    0679: vdata_out <= 037;
    0680: vdata_out <= 038;
    0681: vdata_out <= 039;
    0682: vdata_out <= 040;
    0683: vdata_out <= 041;
    0684: vdata_out <= 042;
    0685: vdata_out <= 043;
    0686: vdata_out <= 044;
    0687: vdata_out <= 045;
    0688: vdata_out <= 046;
    0689: vdata_out <= 047;
    0690: vdata_out <= 048;
    0691: vdata_out <= 049;
    0692: vdata_out <= 050;
    0693: vdata_out <= 051;
    0694: vdata_out <= 052;
    0695: vdata_out <= 053;
    0696: vdata_out <= 054;
    0697: vdata_out <= 055;
    0698: vdata_out <= 056;
    0699: vdata_out <= 057;
    0700: vdata_out <= 058;
    0701: vdata_out <= 059;
    0702: vdata_out <= 060;
    0703: vdata_out <= 061;
    0704: vdata_out <= 062;
    0705: vdata_out <= 063;
    0706: vdata_out <= 064;
    0707: vdata_out <= 065;
    0708: vdata_out <= 066;
    0709: vdata_out <= 067;
    0710: vdata_out <= 068;
    0711: vdata_out <= 069;
    0712: vdata_out <= 070;
    0713: vdata_out <= 071;
    0714: vdata_out <= 072;
    0715: vdata_out <= 073;
    0716: vdata_out <= 074;
    0717: vdata_out <= 075;
    0718: vdata_out <= 076;
    0719: vdata_out <= 077;
    0720: vdata_out <= 078;
    0721: vdata_out <= 079;
    0722: vdata_out <= 080;
    0723: vdata_out <= 081;
    0724: vdata_out <= 082;
    0725: vdata_out <= 083;
    0726: vdata_out <= 084;
    0727: vdata_out <= 085;
    0728: vdata_out <= 086;
    0729: vdata_out <= 087;
    0730: vdata_out <= 088;
    0731: vdata_out <= 089;
    0732: vdata_out <= 091;
    0733: vdata_out <= 092;
    0734: vdata_out <= 093;
    0735: vdata_out <= 094;
    0736: vdata_out <= 095;
    0737: vdata_out <= 096;
    0738: vdata_out <= 097;
    0739: vdata_out <= 098;
    0740: vdata_out <= 099;
    0741: vdata_out <= 100;
    0742: vdata_out <= 101;
    0743: vdata_out <= 102;
    0744: vdata_out <= 103;
    0745: vdata_out <= 104;
    0746: vdata_out <= 105;
    0747: vdata_out <= 106;
    0748: vdata_out <= 107;
    0749: vdata_out <= 108;
    0750: vdata_out <= 109;
    0751: vdata_out <= 110;
    0752: vdata_out <= 111;
    0753: vdata_out <= 112;
    0754: vdata_out <= 113;
    0755: vdata_out <= 114;
    0756: vdata_out <= 115;
    0757: vdata_out <= 117;
    0758: vdata_out <= 118;
    0759: vdata_out <= 119;
    0760: vdata_out <= 120;
    0761: vdata_out <= 121;
    0762: vdata_out <= 122;
    0763: vdata_out <= 123;
    0764: vdata_out <= 124;
    0765: vdata_out <= 125;
    0766: vdata_out <= 126;
    0767: vdata_out <= 127;
    0768: vdata_out <= 000;
    0769: vdata_out <= 001;
    0770: vdata_out <= 001;
    0771: vdata_out <= 002;
    0772: vdata_out <= 003;
    0773: vdata_out <= 004;
    0774: vdata_out <= 004;
    0775: vdata_out <= 005;
    0776: vdata_out <= 006;
    0777: vdata_out <= 007;
    0778: vdata_out <= 008;
    0779: vdata_out <= 009;
    0780: vdata_out <= 009;
    0781: vdata_out <= 010;
    0782: vdata_out <= 011;
    0783: vdata_out <= 012;
    0784: vdata_out <= 013;
    0785: vdata_out <= 014;
    0786: vdata_out <= 015;
    0787: vdata_out <= 016;
    0788: vdata_out <= 017;
    0789: vdata_out <= 018;
    0790: vdata_out <= 018;
    0791: vdata_out <= 019;
    0792: vdata_out <= 020;
    0793: vdata_out <= 021;
    0794: vdata_out <= 022;
    0795: vdata_out <= 023;
    0796: vdata_out <= 024;
    0797: vdata_out <= 025;
    0798: vdata_out <= 026;
    0799: vdata_out <= 027;
    0800: vdata_out <= 028;
    0801: vdata_out <= 029;
    0802: vdata_out <= 030;
    0803: vdata_out <= 031;
    0804: vdata_out <= 032;
    0805: vdata_out <= 033;
    0806: vdata_out <= 034;
    0807: vdata_out <= 035;
    0808: vdata_out <= 036;
    0809: vdata_out <= 037;
    0810: vdata_out <= 038;
    0811: vdata_out <= 039;
    0812: vdata_out <= 040;
    0813: vdata_out <= 041;
    0814: vdata_out <= 042;
    0815: vdata_out <= 043;
    0816: vdata_out <= 044;
    0817: vdata_out <= 045;
    0818: vdata_out <= 046;
    0819: vdata_out <= 047;
    0820: vdata_out <= 048;
    0821: vdata_out <= 049;
    0822: vdata_out <= 050;
    0823: vdata_out <= 051;
    0824: vdata_out <= 052;
    0825: vdata_out <= 053;
    0826: vdata_out <= 054;
    0827: vdata_out <= 055;
    0828: vdata_out <= 056;
    0829: vdata_out <= 057;
    0830: vdata_out <= 058;
    0831: vdata_out <= 059;
    0832: vdata_out <= 060;
    0833: vdata_out <= 061;
    0834: vdata_out <= 062;
    0835: vdata_out <= 063;
    0836: vdata_out <= 064;
    0837: vdata_out <= 065;
    0838: vdata_out <= 066;
    0839: vdata_out <= 067;
    0840: vdata_out <= 068;
    0841: vdata_out <= 069;
    0842: vdata_out <= 070;
    0843: vdata_out <= 071;
    0844: vdata_out <= 072;
    0845: vdata_out <= 073;
    0846: vdata_out <= 074;
    0847: vdata_out <= 075;
    0848: vdata_out <= 076;
    0849: vdata_out <= 077;
    0850: vdata_out <= 078;
    0851: vdata_out <= 080;
    0852: vdata_out <= 081;
    0853: vdata_out <= 082;
    0854: vdata_out <= 083;
    0855: vdata_out <= 084;
    0856: vdata_out <= 085;
    0857: vdata_out <= 086;
    0858: vdata_out <= 087;
    0859: vdata_out <= 088;
    0860: vdata_out <= 089;
    0861: vdata_out <= 090;
    0862: vdata_out <= 091;
    0863: vdata_out <= 092;
    0864: vdata_out <= 093;
    0865: vdata_out <= 094;
    0866: vdata_out <= 095;
    0867: vdata_out <= 097;
    0868: vdata_out <= 098;
    0869: vdata_out <= 099;
    0870: vdata_out <= 100;
    0871: vdata_out <= 101;
    0872: vdata_out <= 102;
    0873: vdata_out <= 103;
    0874: vdata_out <= 104;
    0875: vdata_out <= 105;
    0876: vdata_out <= 106;
    0877: vdata_out <= 107;
    0878: vdata_out <= 108;
    0879: vdata_out <= 110;
    0880: vdata_out <= 111;
    0881: vdata_out <= 112;
    0882: vdata_out <= 113;
    0883: vdata_out <= 114;
    0884: vdata_out <= 115;
    0885: vdata_out <= 116;
    0886: vdata_out <= 117;
    0887: vdata_out <= 118;
    0888: vdata_out <= 119;
    0889: vdata_out <= 120;
    0890: vdata_out <= 122;
    0891: vdata_out <= 123;
    0892: vdata_out <= 124;
    0893: vdata_out <= 125;
    0894: vdata_out <= 126;
    0895: vdata_out <= 127;
    0896: vdata_out <= 000;
    0897: vdata_out <= 000;
    0898: vdata_out <= 001;
    0899: vdata_out <= 002;
    0900: vdata_out <= 002;
    0901: vdata_out <= 003;
    0902: vdata_out <= 004;
    0903: vdata_out <= 005;
    0904: vdata_out <= 005;
    0905: vdata_out <= 006;
    0906: vdata_out <= 007;
    0907: vdata_out <= 008;
    0908: vdata_out <= 008;
    0909: vdata_out <= 009;
    0910: vdata_out <= 010;
    0911: vdata_out <= 011;
    0912: vdata_out <= 012;
    0913: vdata_out <= 013;
    0914: vdata_out <= 013;
    0915: vdata_out <= 014;
    0916: vdata_out <= 015;
    0917: vdata_out <= 016;
    0918: vdata_out <= 017;
    0919: vdata_out <= 018;
    0920: vdata_out <= 019;
    0921: vdata_out <= 020;
    0922: vdata_out <= 020;
    0923: vdata_out <= 021;
    0924: vdata_out <= 022;
    0925: vdata_out <= 023;
    0926: vdata_out <= 024;
    0927: vdata_out <= 025;
    0928: vdata_out <= 026;
    0929: vdata_out <= 027;
    0930: vdata_out <= 028;
    0931: vdata_out <= 029;
    0932: vdata_out <= 030;
    0933: vdata_out <= 031;
    0934: vdata_out <= 032;
    0935: vdata_out <= 033;
    0936: vdata_out <= 034;
    0937: vdata_out <= 035;
    0938: vdata_out <= 036;
    0939: vdata_out <= 037;
    0940: vdata_out <= 038;
    0941: vdata_out <= 039;
    0942: vdata_out <= 040;
    0943: vdata_out <= 040;
    0944: vdata_out <= 041;
    0945: vdata_out <= 042;
    0946: vdata_out <= 043;
    0947: vdata_out <= 044;
    0948: vdata_out <= 045;
    0949: vdata_out <= 046;
    0950: vdata_out <= 047;
    0951: vdata_out <= 049;
    0952: vdata_out <= 050;
    0953: vdata_out <= 051;
    0954: vdata_out <= 052;
    0955: vdata_out <= 053;
    0956: vdata_out <= 054;
    0957: vdata_out <= 055;
    0958: vdata_out <= 056;
    0959: vdata_out <= 057;
    0960: vdata_out <= 058;
    0961: vdata_out <= 059;
    0962: vdata_out <= 060;
    0963: vdata_out <= 061;
    0964: vdata_out <= 062;
    0965: vdata_out <= 063;
    0966: vdata_out <= 064;
    0967: vdata_out <= 065;
    0968: vdata_out <= 066;
    0969: vdata_out <= 067;
    0970: vdata_out <= 068;
    0971: vdata_out <= 069;
    0972: vdata_out <= 070;
    0973: vdata_out <= 071;
    0974: vdata_out <= 073;
    0975: vdata_out <= 074;
    0976: vdata_out <= 075;
    0977: vdata_out <= 076;
    0978: vdata_out <= 077;
    0979: vdata_out <= 078;
    0980: vdata_out <= 079;
    0981: vdata_out <= 080;
    0982: vdata_out <= 081;
    0983: vdata_out <= 082;
    0984: vdata_out <= 083;
    0985: vdata_out <= 084;
    0986: vdata_out <= 085;
    0987: vdata_out <= 087;
    0988: vdata_out <= 088;
    0989: vdata_out <= 089;
    0990: vdata_out <= 090;
    0991: vdata_out <= 091;
    0992: vdata_out <= 092;
    0993: vdata_out <= 093;
    0994: vdata_out <= 094;
    0995: vdata_out <= 095;
    0996: vdata_out <= 096;
    0997: vdata_out <= 098;
    0998: vdata_out <= 099;
    0999: vdata_out <= 100;
    1000: vdata_out <= 101;
    1001: vdata_out <= 102;
    1002: vdata_out <= 103;
    1003: vdata_out <= 104;
    1004: vdata_out <= 105;
    1005: vdata_out <= 107;
    1006: vdata_out <= 108;
    1007: vdata_out <= 109;
    1008: vdata_out <= 110;
    1009: vdata_out <= 111;
    1010: vdata_out <= 112;
    1011: vdata_out <= 113;
    1012: vdata_out <= 114;
    1013: vdata_out <= 116;
    1014: vdata_out <= 117;
    1015: vdata_out <= 118;
    1016: vdata_out <= 119;
    1017: vdata_out <= 120;
    1018: vdata_out <= 121;
    1019: vdata_out <= 122;
    1020: vdata_out <= 124;
    1021: vdata_out <= 125;
    1022: vdata_out <= 126;
    1023: vdata_out <= 127;
  endcase

  if (!nbypass_r)
    vdata_out <= addr_r[color_width_i-1:0];
end

endmodule
