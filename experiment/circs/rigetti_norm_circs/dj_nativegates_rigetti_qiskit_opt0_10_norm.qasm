OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
creg c[9];
rz(pi/2) q[0];
rx1 q[0];
rz(pi/2) q[0];
x q[0];
rz(pi/2) q[1];
rx1 q[1];
rz(pi/2) q[1];
x q[1];
rz(pi/2) q[2];
rx1 q[2];
rz(pi/2) q[2];
x q[2];
rz(pi/2) q[3];
rx1 q[3];
rz(pi/2) q[3];
rz(pi/2) q[4];
rx1 q[4];
rz(pi/2) q[4];
rz(pi/2) q[5];
rx1 q[5];
rz(pi/2) q[5];
rz(pi/2) q[6];
rx1 q[6];
rz(pi/2) q[6];
x q[6];
rz(pi/2) q[7];
rx1 q[7];
rz(pi/2) q[7];
x q[7];
rz(pi/2) q[8];
rx1 q[8];
rz(pi/2) q[8];
x q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[0],q[9];
x q[0];
rz(pi/2) q[0];
rx1 q[0];
rz(pi/2) q[0];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[1],q[9];
x q[1];
rz(pi/2) q[1];
rx1 q[1];
rz(pi/2) q[1];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[2],q[9];
x q[2];
rz(pi/2) q[2];
rx1 q[2];
rz(pi/2) q[2];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[3],q[9];
rz(pi/2) q[3];
rx1 q[3];
rz(pi/2) q[3];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[4],q[9];
rz(pi/2) q[4];
rx1 q[4];
rz(pi/2) q[4];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[5],q[9];
rz(pi/2) q[5];
rx1 q[5];
rz(pi/2) q[5];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[6],q[9];
x q[6];
rz(pi/2) q[6];
rx1 q[6];
rz(pi/2) q[6];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[7],q[9];
x q[7];
rz(pi/2) q[7];
rx1 q[7];
rz(pi/2) q[7];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[8],q[9];
rz(pi/2) q[8];
rx1 q[8];
rz(pi/2) q[8];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
