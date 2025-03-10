module linear_layer (
	input[63:0] X0, X1, X2, X3, X4,
	output[63:0] Y0, Y1, Y2, Y3, Y4
);
	wire[319:0] s;
	assign s = {X0, X1, X2, X3, X4}; 

	assign Y0 = {(s[319] ^ s[300] ^ s[291]), (s[318] ^ s[299] ^ s[290]), (s[317] ^ s[298] ^ s[289]), (s[316] ^ s[297] ^ s[288]), (s[315] ^ s[296] ^ s[287]), (s[314] ^ s[295] ^ s[286]), (s[313] ^ s[294] ^ s[285]), (s[312] ^ s[293] ^ s[284]), 
			(s[311] ^ s[292] ^ s[283]), (s[310] ^ s[291] ^ s[282]), (s[309] ^ s[290] ^ s[281]), (s[308] ^ s[289] ^ s[280]), (s[307] ^ s[288] ^ s[279]), (s[306] ^ s[287] ^ s[278]), (s[305] ^ s[286] ^ s[277]), (s[304] ^ s[285] ^ s[276]), 
			(s[303] ^ s[284] ^ s[275]), (s[302] ^ s[283] ^ s[274]), (s[301] ^ s[282] ^ s[273]), (s[300] ^ s[281] ^ s[272]), (s[299] ^ s[280] ^ s[271]), (s[298] ^ s[279] ^ s[270]), (s[297] ^ s[278] ^ s[269]), (s[296] ^ s[277] ^ s[268]), 
			(s[295] ^ s[276] ^ s[267]), (s[294] ^ s[275] ^ s[266]), (s[293] ^ s[274] ^ s[265]), (s[292] ^ s[273] ^ s[264]), (s[291] ^ s[272] ^ s[263]), (s[290] ^ s[271] ^ s[262]), (s[289] ^ s[270] ^ s[261]), (s[288] ^ s[269] ^ s[260]), 
			(s[287] ^ s[268] ^ s[259]), (s[286] ^ s[267] ^ s[258]), (s[285] ^ s[266] ^ s[257]), (s[284] ^ s[265] ^ s[256]), (s[283] ^ s[264] ^ s[319]), (s[282] ^ s[263] ^ s[318]), (s[281] ^ s[262] ^ s[317]), (s[280] ^ s[261] ^ s[316]), 
			(s[279] ^ s[260] ^ s[315]), (s[278] ^ s[259] ^ s[314]), (s[277] ^ s[258] ^ s[313]), (s[276] ^ s[257] ^ s[312]), (s[275] ^ s[256] ^ s[311]), (s[274] ^ s[319] ^ s[310]), (s[273] ^ s[318] ^ s[309]), (s[272] ^ s[317] ^ s[308]), 
			(s[271] ^ s[316] ^ s[307]), (s[270] ^ s[315] ^ s[306]), (s[269] ^ s[314] ^ s[305]), (s[268] ^ s[313] ^ s[304]), (s[267] ^ s[312] ^ s[303]), (s[266] ^ s[311] ^ s[302]), (s[265] ^ s[310] ^ s[301]), (s[264] ^ s[309] ^ s[300]), 
			(s[263] ^ s[308] ^ s[299]), (s[262] ^ s[307] ^ s[298]), (s[261] ^ s[306] ^ s[297]), (s[260] ^ s[305] ^ s[296]), (s[259] ^ s[304] ^ s[295]), (s[258] ^ s[303] ^ s[294]), (s[257] ^ s[302] ^ s[293]), (s[256] ^ s[301] ^ s[292])};

	assign Y1 = {(s[255] ^ s[194] ^ s[216]), (s[254] ^ s[193] ^ s[215]), (s[253] ^ s[192] ^ s[214]), (s[252] ^ s[255] ^ s[213]), (s[251] ^ s[254] ^ s[212]), (s[250] ^ s[253] ^ s[211]), (s[249] ^ s[252] ^ s[210]), (s[248] ^ s[251] ^ s[209]), 
			(s[247] ^ s[250] ^ s[208]), (s[246] ^ s[249] ^ s[207]), (s[245] ^ s[248] ^ s[206]), (s[244] ^ s[247] ^ s[205]), (s[243] ^ s[246] ^ s[204]), (s[242] ^ s[245] ^ s[203]), (s[241] ^ s[244] ^ s[202]), (s[240] ^ s[243] ^ s[201]), 
			(s[239] ^ s[242] ^ s[200]), (s[238] ^ s[241] ^ s[199]), (s[237] ^ s[240] ^ s[198]), (s[236] ^ s[239] ^ s[197]), (s[235] ^ s[238] ^ s[196]), (s[234] ^ s[237] ^ s[195]), (s[233] ^ s[236] ^ s[194]), (s[232] ^ s[235] ^ s[193]), 
			(s[231] ^ s[234] ^ s[192]), (s[230] ^ s[233] ^ s[255]), (s[229] ^ s[232] ^ s[254]), (s[228] ^ s[231] ^ s[253]), (s[227] ^ s[230] ^ s[252]), (s[226] ^ s[229] ^ s[251]), (s[225] ^ s[228] ^ s[250]), (s[224] ^ s[227] ^ s[249]), 
			(s[223] ^ s[226] ^ s[248]), (s[222] ^ s[225] ^ s[247]), (s[221] ^ s[224] ^ s[246]), (s[220] ^ s[223] ^ s[245]), (s[219] ^ s[222] ^ s[244]), (s[218] ^ s[221] ^ s[243]), (s[217] ^ s[220] ^ s[242]), (s[216] ^ s[219] ^ s[241]), 
			(s[215] ^ s[218] ^ s[240]), (s[214] ^ s[217] ^ s[239]), (s[213] ^ s[216] ^ s[238]), (s[212] ^ s[215] ^ s[237]), (s[211] ^ s[214] ^ s[236]), (s[210] ^ s[213] ^ s[235]), (s[209] ^ s[212] ^ s[234]), (s[208] ^ s[211] ^ s[233]), 
			(s[207] ^ s[210] ^ s[232]), (s[206] ^ s[209] ^ s[231]), (s[205] ^ s[208] ^ s[230]), (s[204] ^ s[207] ^ s[229]), (s[203] ^ s[206] ^ s[228]), (s[202] ^ s[205] ^ s[227]), (s[201] ^ s[204] ^ s[226]), (s[200] ^ s[203] ^ s[225]), 
			(s[199] ^ s[202] ^ s[224]), (s[198] ^ s[201] ^ s[223]), (s[197] ^ s[200] ^ s[222]), (s[196] ^ s[199] ^ s[221]), (s[195] ^ s[198] ^ s[220]), (s[194] ^ s[197] ^ s[219]), (s[193] ^ s[196] ^ s[218]), (s[192] ^ s[195] ^ s[217])};

	assign Y2 = {(s[191] ^ s[190] ^ s[185]), (s[190] ^ s[189] ^ s[184]), (s[189] ^ s[188] ^ s[183]), (s[188] ^ s[187] ^ s[182]), (s[187] ^ s[186] ^ s[181]), (s[186] ^ s[185] ^ s[180]), (s[185] ^ s[184] ^ s[179]), (s[184] ^ s[183] ^ s[178]), 
			(s[183] ^ s[182] ^ s[177]), (s[182] ^ s[181] ^ s[176]), (s[181] ^ s[180] ^ s[175]), (s[180] ^ s[179] ^ s[174]), (s[179] ^ s[178] ^ s[173]), (s[178] ^ s[177] ^ s[172]), (s[177] ^ s[176] ^ s[171]), (s[176] ^ s[175] ^ s[170]), 
			(s[175] ^ s[174] ^ s[169]), (s[174] ^ s[173] ^ s[168]), (s[173] ^ s[172] ^ s[167]), (s[172] ^ s[171] ^ s[166]), (s[171] ^ s[170] ^ s[165]), (s[170] ^ s[169] ^ s[164]), (s[169] ^ s[168] ^ s[163]), (s[168] ^ s[167] ^ s[162]), 
			(s[167] ^ s[166] ^ s[161]), (s[166] ^ s[165] ^ s[160]), (s[165] ^ s[164] ^ s[159]), (s[164] ^ s[163] ^ s[158]), (s[163] ^ s[162] ^ s[157]), (s[162] ^ s[161] ^ s[156]), (s[161] ^ s[160] ^ s[155]), (s[160] ^ s[159] ^ s[154]), 
			(s[159] ^ s[158] ^ s[153]), (s[158] ^ s[157] ^ s[152]), (s[157] ^ s[156] ^ s[151]), (s[156] ^ s[155] ^ s[150]), (s[155] ^ s[154] ^ s[149]), (s[154] ^ s[153] ^ s[148]), (s[153] ^ s[152] ^ s[147]), (s[152] ^ s[151] ^ s[146]), 
			(s[151] ^ s[150] ^ s[145]), (s[150] ^ s[149] ^ s[144]), (s[149] ^ s[148] ^ s[143]), (s[148] ^ s[147] ^ s[142]), (s[147] ^ s[146] ^ s[141]), (s[146] ^ s[145] ^ s[140]), (s[145] ^ s[144] ^ s[139]), (s[144] ^ s[143] ^ s[138]), 
			(s[143] ^ s[142] ^ s[137]), (s[142] ^ s[141] ^ s[136]), (s[141] ^ s[140] ^ s[135]), (s[140] ^ s[139] ^ s[134]), (s[139] ^ s[138] ^ s[133]), (s[138] ^ s[137] ^ s[132]), (s[137] ^ s[136] ^ s[131]), (s[136] ^ s[135] ^ s[130]), 
			(s[135] ^ s[134] ^ s[129]), (s[134] ^ s[133] ^ s[128]), (s[133] ^ s[132] ^ s[191]), (s[132] ^ s[131] ^ s[190]), (s[131] ^ s[130] ^ s[189]), (s[130] ^ s[129] ^ s[188]), (s[129] ^ s[128] ^ s[187]), (s[128] ^ s[191] ^ s[186])};

	assign Y3 = {(s[127] ^ s[117] ^ s[110]), (s[126] ^ s[116] ^ s[109]), (s[125] ^ s[115] ^ s[108]), (s[124] ^ s[114] ^ s[107]), (s[123] ^ s[113] ^ s[106]), (s[122] ^ s[112] ^ s[105]), (s[121] ^ s[111] ^ s[104]), (s[120] ^ s[110] ^ s[103]), 
			(s[119] ^ s[109] ^ s[102]), (s[118] ^ s[108] ^ s[101]), (s[117] ^ s[107] ^ s[100]), (s[116] ^ s[106] ^ s[99]), (s[115] ^ s[105] ^ s[98]), (s[114] ^ s[104] ^ s[97]), (s[113] ^ s[103] ^ s[96]), (s[112] ^ s[102] ^ s[95]), 
			(s[111] ^ s[101] ^ s[94]), (s[110] ^ s[100] ^ s[93]), (s[109] ^ s[99] ^ s[92]), (s[108] ^ s[98] ^ s[91]), (s[107] ^ s[97] ^ s[90]), (s[106] ^ s[96] ^ s[89]), (s[105] ^ s[95] ^ s[88]), (s[104] ^ s[94] ^ s[87]), 
			(s[103] ^ s[93] ^ s[86]), (s[102] ^ s[92] ^ s[85]), (s[101] ^ s[91] ^ s[84]), (s[100] ^ s[90] ^ s[83]), (s[99] ^ s[89] ^ s[82]), (s[98] ^ s[88] ^ s[81]), (s[97] ^ s[87] ^ s[80]), (s[96] ^ s[86] ^ s[79]), 
			(s[95] ^ s[85] ^ s[78]), (s[94] ^ s[84] ^ s[77]), (s[93] ^ s[83] ^ s[76]), (s[92] ^ s[82] ^ s[75]), (s[91] ^ s[81] ^ s[74]), (s[90] ^ s[80] ^ s[73]), (s[89] ^ s[79] ^ s[72]), (s[88] ^ s[78] ^ s[71]), 
			(s[87] ^ s[77] ^ s[70]), (s[86] ^ s[76] ^ s[69]), (s[85] ^ s[75] ^ s[68]), (s[84] ^ s[74] ^ s[67]), (s[83] ^ s[73] ^ s[66]), (s[82] ^ s[72] ^ s[65]), (s[81] ^ s[71] ^ s[64]), (s[80] ^ s[70] ^ s[127]), 
			(s[79] ^ s[69] ^ s[126]), (s[78] ^ s[68] ^ s[125]), (s[77] ^ s[67] ^ s[124]), (s[76] ^ s[66] ^ s[123]), (s[75] ^ s[65] ^ s[122]), (s[74] ^ s[64] ^ s[121]), (s[73] ^ s[127] ^ s[120]), (s[72] ^ s[126] ^ s[119]), 
			(s[71] ^ s[125] ^ s[118]), (s[70] ^ s[124] ^ s[117]), (s[69] ^ s[123] ^ s[116]), (s[68] ^ s[122] ^ s[115]), (s[67] ^ s[121] ^ s[114]), (s[66] ^ s[120] ^ s[113]), (s[65] ^ s[119] ^ s[112]), (s[64] ^ s[118] ^ s[111])};

	assign Y4 = {(s[63] ^ s[56] ^ s[22]), (s[62] ^ s[55] ^ s[21]), (s[61] ^ s[54] ^ s[20]), (s[60] ^ s[53] ^ s[19]), (s[59] ^ s[52] ^ s[18]), (s[58] ^ s[51] ^ s[17]), (s[57] ^ s[50] ^ s[16]), (s[56] ^ s[49] ^ s[15]), 
			(s[55] ^ s[48] ^ s[14]), (s[54] ^ s[47] ^ s[13]), (s[53] ^ s[46] ^ s[12]), (s[52] ^ s[45] ^ s[11]), (s[51] ^ s[44] ^ s[10]), (s[50] ^ s[43] ^ s[9]), (s[49] ^ s[42] ^ s[8]), (s[48] ^ s[41] ^ s[7]), 
			(s[47] ^ s[40] ^ s[6]), (s[46] ^ s[39] ^ s[5]), (s[45] ^ s[38] ^ s[4]), (s[44] ^ s[37] ^ s[3]), (s[43] ^ s[36] ^ s[2]), (s[42] ^ s[35] ^ s[1]), (s[41] ^ s[34] ^ s[0]), (s[40] ^ s[33] ^ s[63]), 
			(s[39] ^ s[32] ^ s[62]), (s[38] ^ s[31] ^ s[61]), (s[37] ^ s[30] ^ s[60]), (s[36] ^ s[29] ^ s[59]), (s[35] ^ s[28] ^ s[58]), (s[34] ^ s[27] ^ s[57]), (s[33] ^ s[26] ^ s[56]), (s[32] ^ s[25] ^ s[55]), 
			(s[31] ^ s[24] ^ s[54]), (s[30] ^ s[23] ^ s[53]), (s[29] ^ s[22] ^ s[52]), (s[28] ^ s[21] ^ s[51]), (s[27] ^ s[20] ^ s[50]), (s[26] ^ s[19] ^ s[49]), (s[25] ^ s[18] ^ s[48]), (s[24] ^ s[17] ^ s[47]), 
			(s[23] ^ s[16] ^ s[46]), (s[22] ^ s[15] ^ s[45]), (s[21] ^ s[14] ^ s[44]), (s[20] ^ s[13] ^ s[43]), (s[19] ^ s[12] ^ s[42]), (s[18] ^ s[11] ^ s[41]), (s[17] ^ s[10] ^ s[40]), (s[16] ^ s[9] ^ s[39]), 
			(s[15] ^ s[8] ^ s[38]), (s[14] ^ s[7] ^ s[37]), (s[13] ^ s[6] ^ s[36]), (s[12] ^ s[5] ^ s[35]), (s[11] ^ s[4] ^ s[34]), (s[10] ^ s[3] ^ s[33]), (s[9] ^ s[2] ^ s[32]), (s[8] ^ s[1] ^ s[31]), 
			(s[7] ^ s[0] ^ s[30]), (s[6] ^ s[63] ^ s[29]), (s[5] ^ s[62] ^ s[28]), (s[4] ^ s[61] ^ s[27]), (s[3] ^ s[60] ^ s[26]), (s[2] ^ s[59] ^ s[25]), (s[1] ^ s[58] ^ s[24]), (s[0] ^ s[57] ^ s[23])};

endmodule