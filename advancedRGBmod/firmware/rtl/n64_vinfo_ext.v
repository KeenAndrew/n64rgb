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
// Module Name:    n64_vinfo_ext
// Project Name:   N64 Advanced RGB/YPbPr DAC Mod
// Target Devices: universial
// Tool versions:  Altera Quartus Prime
// Description:    extracts video info from input
//
// Dependencies: vh/n64a_params.vh
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////


module n64_vinfo_ext(
  nCLK,
  nDSYNC,

  Sync_pre,
  Sync_cur,
  vinfo_o
);

`include "vh/n64a_params.vh"

input nCLK;
input nDSYNC;

input  [3:0] Sync_pre;
input  [3:0] Sync_cur;
output [4:0] vinfo_o;   // order: data_cnt,n64_480i,vmode,blurry_pixel_pos


// some pre-assignments

wire posedge_nVSYNC = !Sync_pre[3] &  Sync_cur[3];
wire negedge_nVSYNC =  Sync_pre[3] & !Sync_cur[3];
wire posedge_nHSYNC = !Sync_pre[1] &  Sync_cur[1];
wire negedge_nHSYNC =  Sync_pre[1] & !Sync_cur[1];
wire posedge_nCSYNC = !Sync_pre[0] &  Sync_cur[0];

// data counter for heuristic and de-mux
// =====================================

reg [1:0] data_cnt = 2'b00;

always @(negedge nCLK) begin // data register management
  if (!nDSYNC)
    data_cnt <= 2'b01;  // reset data counter
  else
    data_cnt <= data_cnt + 1'b1;  // increment data counter
end


// estimation of 240p/288p
// =======================

reg FrameID  = 1'b0; // 0 = even frame, 1 = odd frame; 240p: only even or odd frames; 480i: even and odd frames
reg n64_480i = 1'b1; // 0 = 240p/288p , 1= 480i/576i

always @(negedge nCLK) begin
  if (!nDSYNC) begin
    if (negedge_nVSYNC) begin    // negedge at nVSYNC
      if (negedge_nHSYNC) begin  // negedge at nHSYNC, too -> odd frame
        n64_480i <= ~FrameID;
        FrameID  <= 1'b1;
      end else begin                    // no negedge at nHSYNC -> even frame
        n64_480i <= FrameID;
        FrameID  <= 1'b0;
      end
    end
  end
end


// determine vmode and blurry pixel position
// =========================================

reg [1:0] line_cnt;         // PAL: line_cnt[1:0] == 0x ; NTSC: line_cnt[1:0] = 1x
reg       vmode = 1'b0;     // PAL: vmode == 1          ; NTSC: vmode == 0
reg       blurry_pixel_pos; // indicates position of a potential blurry pixel
                            // blurry_pixel_pos == 0 -> pixel at D_i
                            // blurry_pixel_pos == 1 -> pixel at previous RGB data

always @(negedge nCLK) begin
  if (!nDSYNC) begin
    if(posedge_nVSYNC) begin // posedge at nVSYNC detected - reset line_cnt and set vmode
      line_cnt <= 2'b00;
      vmode    <= ~line_cnt[1];
    end else if(posedge_nHSYNC) // posedge nHSYNC -> increase line_cnt
      line_cnt <= line_cnt + 1'b1;

    if(!n64_480i) begin // 240p
      if(posedge_nCSYNC) // posedge nCSYNC -> reset blanking
        blurry_pixel_pos <= ~vmode;
      else
        blurry_pixel_pos <= ~blurry_pixel_pos;
    end else
      blurry_pixel_pos <= 1'b1;
  end
end


// pack vinfo_o vector
// =================

assign vinfo_o = {data_cnt,n64_480i,vmode,blurry_pixel_pos};


endmodule 