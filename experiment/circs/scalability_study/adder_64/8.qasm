OPENQASM 2.0;
include "qelib1.inc";
qreg q[55];
h q[24];
cx q[27],q[26];
rz(pi*0.250000) q[26];
cx q[27],q[26];
rz(pi*1.750000) q[26];
cx q[26],q[24];
rz(pi*1.750000) q[24];
cx q[22],q[24];
rz(pi*0.250000) q[24];
cx q[26],q[24];
rz(pi*1.750000) q[24];
cx q[22],q[24];
cx q[22],q[26];
rz(pi*0.250000) q[24];
rz(pi*1.750000) q[26];
h q[24];
cx q[22],q[26];
h q[24];
rz(pi*0.250000) q[26];
h q[26];
cx q[29],q[26];
rz(pi*0.250000) q[26];
cx q[18],q[26];
rz(pi*1.750000) q[26];
cx q[29],q[26];
rz(pi*0.250000) q[26];
cx q[18],q[26];
cx q[18],q[29];
rz(pi*1.750000) q[26];
rz(pi*0.250000) q[29];
h q[26];
cx q[18],q[29];
h q[26];
rz(pi*1.750000) q[29];
cx q[29],q[26];
rz(pi*0.250000) q[26];
cx q[19],q[26];
rz(pi*1.750000) q[26];
cx q[29],q[26];
rz(pi*0.250000) q[26];
cx q[19],q[26];
cx q[19],q[29];
rz(pi*1.750000) q[26];
rz(pi*0.250000) q[29];
h q[26];
cx q[19],q[29];
h q[26];
rz(pi*1.750000) q[29];
h q[29];
cx q[17],q[29];
rz(pi*1.750000) q[29];
cx q[20],q[29];
rz(pi*0.250000) q[29];
cx q[17],q[29];
rz(pi*1.750000) q[29];
cx q[20],q[29];
cx q[20],q[17];
rz(pi*0.250000) q[29];
rz(pi*1.750000) q[17];
h q[29];
cx q[20],q[17];
h q[29];
rz(pi*0.250000) q[17];
cx q[17],q[29];
rz(pi*1.750000) q[29];
cx q[25],q[29];
rz(pi*0.250000) q[29];
cx q[17],q[29];
rz(pi*1.750000) q[29];
cx q[25],q[29];
cx q[25],q[17];
rz(pi*0.250000) q[29];
rz(pi*1.750000) q[17];
h q[29];
cx q[25],q[17];
h q[29];
rz(pi*0.250000) q[17];
h q[17];
cx q[23],q[17];
rz(pi*0.250000) q[17];
cx q[34],q[17];
rz(pi*1.750000) q[17];
cx q[23],q[17];
rz(pi*0.250000) q[17];
cx q[34],q[17];
cx q[34],q[23];
rz(pi*1.750000) q[17];
rz(pi*0.250000) q[23];
h q[17];
cx q[34],q[23];
h q[17];
rz(pi*1.750000) q[23];
cx q[23],q[17];
rz(pi*1.750000) q[17];
cx q[15],q[17];
rz(pi*0.250000) q[17];
cx q[23],q[17];
rz(pi*1.750000) q[17];
cx q[15],q[17];
cx q[15],q[23];
rz(pi*0.250000) q[17];
rz(pi*1.750000) q[23];
h q[17];
cx q[15],q[23];
h q[17];
rz(pi*0.250000) q[23];
h q[23];
cx q[14],q[23];
rz(pi*0.250000) q[23];
cx q[37],q[23];
rz(pi*1.750000) q[23];
cx q[14],q[23];
rz(pi*0.250000) q[23];
cx q[37],q[23];
cx q[37],q[14];
rz(pi*1.750000) q[23];
rz(pi*0.250000) q[14];
h q[23];
cx q[37],q[14];
h q[23];
rz(pi*1.750000) q[14];
cx q[14],q[23];
rz(pi*1.750000) q[23];
cx q[13],q[23];
rz(pi*0.250000) q[23];
cx q[14],q[23];
rz(pi*1.750000) q[23];
cx q[13],q[23];
cx q[13],q[14];
rz(pi*0.250000) q[23];
rz(pi*1.750000) q[14];
h q[23];
cx q[13],q[14];
h q[23];
rz(pi*0.250000) q[14];
h q[14];
cx q[21],q[14];
rz(pi*0.250000) q[14];
cx q[41],q[14];
rz(pi*1.750000) q[14];
cx q[21],q[14];
rz(pi*0.250000) q[14];
cx q[41],q[14];
cx q[41],q[21];
rz(pi*1.750000) q[14];
rz(pi*0.250000) q[21];
h q[14];
cx q[41],q[21];
h q[14];
rz(pi*1.750000) q[21];
cx q[21],q[14];
rz(pi*1.750000) q[14];
cx q[12],q[14];
rz(pi*0.250000) q[14];
cx q[21],q[14];
rz(pi*1.750000) q[14];
cx q[12],q[14];
cx q[12],q[21];
rz(pi*0.250000) q[14];
rz(pi*1.750000) q[21];
h q[14];
cx q[12],q[21];
h q[14];
rz(pi*0.250000) q[21];
h q[21];
cx q[16],q[21];
rz(pi*0.250000) q[21];
cx q[45],q[21];
rz(pi*1.750000) q[21];
cx q[16],q[21];
rz(pi*0.250000) q[21];
cx q[45],q[21];
cx q[45],q[16];
rz(pi*1.750000) q[21];
rz(pi*0.250000) q[16];
h q[21];
cx q[45],q[16];
h q[21];
rz(pi*1.750000) q[16];
cx q[16],q[21];
rz(pi*1.750000) q[21];
cx q[11],q[21];
rz(pi*0.250000) q[21];
cx q[16],q[21];
rz(pi*1.750000) q[21];
cx q[11],q[21];
cx q[11],q[16];
rz(pi*0.250000) q[21];
rz(pi*1.750000) q[16];
h q[21];
cx q[11],q[16];
h q[21];
rz(pi*0.250000) q[16];
h q[16];
cx q[31],q[16];
rz(pi*0.250000) q[16];
cx q[49],q[16];
rz(pi*1.750000) q[16];
cx q[31],q[16];
rz(pi*0.250000) q[16];
cx q[49],q[16];
cx q[49],q[31];
rz(pi*1.750000) q[16];
rz(pi*0.250000) q[31];
h q[16];
cx q[49],q[31];
h q[16];
rz(pi*1.750000) q[31];
cx q[31],q[16];
rz(pi*1.750000) q[16];
cx q[32],q[16];
rz(pi*0.250000) q[16];
cx q[31],q[16];
rz(pi*1.750000) q[16];
cx q[32],q[16];
cx q[32],q[31];
rz(pi*0.250000) q[16];
rz(pi*1.750000) q[31];
h q[16];
cx q[32],q[31];
h q[16];
rz(pi*0.250000) q[31];
h q[31];
cx q[33],q[31];
rz(pi*0.250000) q[31];
cx q[53],q[31];
rz(pi*1.750000) q[31];
cx q[33],q[31];
rz(pi*0.250000) q[31];
cx q[53],q[31];
cx q[53],q[33];
rz(pi*1.750000) q[31];
rz(pi*0.250000) q[33];
h q[31];
cx q[53],q[33];
h q[31];
rz(pi*1.750000) q[33];
cx q[33],q[31];
rz(pi*1.750000) q[31];
cx q[35],q[31];
rz(pi*0.250000) q[31];
cx q[33],q[31];
rz(pi*1.750000) q[31];
cx q[35],q[31];
cx q[35],q[33];
rz(pi*0.250000) q[31];
rz(pi*1.750000) q[33];
h q[31];
cx q[35],q[33];
h q[31];
rz(pi*0.250000) q[33];
h q[33];
cx q[36],q[33];
rz(pi*0.250000) q[33];
cx q[54],q[33];
rz(pi*1.750000) q[33];
cx q[36],q[33];
rz(pi*0.250000) q[33];
cx q[54],q[33];
cx q[54],q[36];
rz(pi*1.750000) q[33];
rz(pi*0.250000) q[36];
h q[33];
cx q[54],q[36];
h q[33];
rz(pi*1.750000) q[36];
cx q[36],q[33];
rz(pi*1.750000) q[33];
cx q[38],q[33];
rz(pi*0.250000) q[33];
cx q[36],q[33];
rz(pi*1.750000) q[33];
cx q[38],q[33];
cx q[38],q[36];
rz(pi*0.250000) q[33];
rz(pi*1.750000) q[36];
h q[33];
cx q[38],q[36];
h q[33];
rz(pi*0.250000) q[36];
h q[36];
cx q[39],q[36];
rz(pi*0.250000) q[36];
cx q[40],q[36];
rz(pi*1.750000) q[36];
cx q[39],q[36];
rz(pi*0.250000) q[36];
cx q[40],q[36];
cx q[40],q[39];
rz(pi*1.750000) q[36];
rz(pi*0.250000) q[39];
h q[36];
cx q[40],q[39];
h q[36];
rz(pi*1.750000) q[39];
cx q[39],q[36];
rz(pi*1.750000) q[36];
cx q[42],q[36];
rz(pi*0.250000) q[36];
cx q[39],q[36];
rz(pi*1.750000) q[36];
cx q[42],q[36];
cx q[42],q[39];
rz(pi*0.250000) q[36];
rz(pi*1.750000) q[39];
h q[36];
cx q[42],q[39];
h q[36];
rz(pi*0.250000) q[39];
h q[39];
cx q[43],q[39];
rz(pi*0.250000) q[39];
cx q[44],q[39];
rz(pi*1.750000) q[39];
cx q[43],q[39];
rz(pi*0.250000) q[39];
cx q[44],q[39];
cx q[44],q[43];
rz(pi*1.750000) q[39];
rz(pi*0.250000) q[43];
h q[39];
cx q[44],q[43];
h q[39];
rz(pi*1.750000) q[43];
cx q[43],q[39];
rz(pi*1.750000) q[39];
cx q[46],q[39];
rz(pi*0.250000) q[39];
cx q[43],q[39];
rz(pi*1.750000) q[39];
cx q[46],q[39];
cx q[46],q[43];
rz(pi*0.250000) q[39];
rz(pi*1.750000) q[43];
h q[39];
cx q[46],q[43];
h q[39];
rz(pi*0.250000) q[43];
h q[43];
cx q[47],q[43];
rz(pi*0.250000) q[43];
cx q[48],q[43];
rz(pi*1.750000) q[43];
cx q[47],q[43];
rz(pi*0.250000) q[43];
cx q[48],q[43];
cx q[48],q[47];
rz(pi*1.750000) q[43];
rz(pi*0.250000) q[47];
h q[43];
cx q[48],q[47];
h q[43];
rz(pi*1.750000) q[47];
cx q[47],q[43];
rz(pi*1.750000) q[43];
cx q[50],q[43];
rz(pi*0.250000) q[43];
cx q[47],q[43];
rz(pi*1.750000) q[43];
cx q[50],q[43];
cx q[50],q[47];
rz(pi*0.250000) q[43];
rz(pi*1.750000) q[47];
h q[43];
cx q[50],q[47];
h q[43];
rz(pi*0.250000) q[47];
h q[47];
cx q[51],q[47];
rz(pi*0.250000) q[47];
cx q[52],q[47];
rz(pi*1.750000) q[47];
cx q[51],q[47];
rz(pi*0.250000) q[47];
cx q[52],q[47];
cx q[52],q[51];
rz(pi*1.750000) q[47];
rz(pi*0.250000) q[51];
h q[47];
cx q[52],q[51];
h q[47];
rz(pi*1.750000) q[51];
cx q[51],q[47];
rz(pi*1.750000) q[47];
cx q[10],q[47];
rz(pi*0.250000) q[47];
cx q[51],q[47];
rz(pi*1.750000) q[47];
cx q[10],q[47];
cx q[10],q[51];
rz(pi*0.250000) q[47];
rz(pi*1.750000) q[51];
h q[47];
cx q[10],q[51];
h q[47];
rz(pi*0.250000) q[51];
h q[51];
cx q[9],q[51];
rz(pi*0.250000) q[51];
cx q[8],q[51];
rz(pi*1.750000) q[51];
cx q[9],q[51];
rz(pi*0.250000) q[51];
cx q[8],q[51];
cx q[8],q[9];
rz(pi*1.750000) q[51];
rz(pi*0.250000) q[9];
h q[51];
cx q[8],q[9];
h q[51];
rz(pi*1.750000) q[9];
cx q[9],q[51];
rz(pi*1.750000) q[51];
cx q[7],q[51];
rz(pi*0.250000) q[51];
cx q[9],q[51];
rz(pi*1.750000) q[51];
cx q[7],q[51];
cx q[7],q[9];
rz(pi*0.250000) q[51];
rz(pi*1.750000) q[9];
h q[51];
cx q[7],q[9];
h q[51];
rz(pi*0.250000) q[9];
h q[9];
cx q[6],q[9];
rz(pi*0.250000) q[9];
cx q[5],q[9];
rz(pi*1.750000) q[9];
cx q[6],q[9];
rz(pi*0.250000) q[9];
cx q[5],q[9];
cx q[5],q[6];
rz(pi*1.750000) q[9];
rz(pi*0.250000) q[6];
h q[9];
cx q[5],q[6];
h q[9];
rz(pi*1.750000) q[6];
cx q[6],q[9];
rz(pi*1.750000) q[9];
cx q[4],q[9];
rz(pi*0.250000) q[9];
cx q[6],q[9];
rz(pi*1.750000) q[9];
cx q[4],q[9];
cx q[4],q[6];
rz(pi*0.250000) q[9];
rz(pi*1.750000) q[6];
h q[9];
cx q[4],q[6];
h q[9];
rz(pi*0.250000) q[6];
h q[6];
cx q[3],q[6];
rz(pi*0.250000) q[6];
cx q[2],q[6];
rz(pi*1.750000) q[6];
cx q[3],q[6];
rz(pi*0.250000) q[6];
cx q[2],q[6];
cx q[2],q[3];
rz(pi*1.750000) q[6];
rz(pi*0.250000) q[3];
h q[6];
cx q[2],q[3];
h q[6];
rz(pi*1.750000) q[3];
cx q[3],q[6];
rz(pi*1.750000) q[6];
cx q[28],q[6];
rz(pi*0.250000) q[6];
cx q[3],q[6];
rz(pi*1.750000) q[6];
cx q[28],q[6];
cx q[28],q[3];
rz(pi*0.250000) q[6];
rz(pi*1.750000) q[3];
h q[6];
cx q[28],q[3];
h q[6];
rz(pi*0.250000) q[3];
h q[3];
cx q[1],q[3];
rz(pi*0.250000) q[3];
cx q[0],q[3];
rz(pi*1.750000) q[3];
cx q[1],q[3];
rz(pi*0.250000) q[3];
cx q[0],q[3];
cx q[0],q[1];
rz(pi*1.750000) q[3];
rz(pi*0.250000) q[1];
h q[3];
cx q[0],q[1];
h q[3];
rz(pi*1.750000) q[1];
cx q[1],q[3];
rz(pi*0.250000) q[3];
cx q[30],q[3];
rz(pi*1.750000) q[3];
cx q[1],q[3];
rz(pi*0.250000) q[3];
cx q[30],q[3];
cx q[30],q[1];
rz(pi*1.750000) q[3];
rz(pi*0.250000) q[1];
h q[3];
cx q[30],q[1];
h q[3];
rz(pi*1.750000) q[1];
