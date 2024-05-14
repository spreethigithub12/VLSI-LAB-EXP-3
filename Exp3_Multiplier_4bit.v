module halfadder(a,b,s,c);
input a,b;
output s,c;
xor (s,a,b);
and (c,a,b);
endmodule

module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;
xor g1(w1,a,b);
xor g2(sum,w1,c);
and g3(w2,a,b);
and g4(w3,w1,c);
or g5(carry,w3,w2);
endmodule

module mul(x,y,z);
input [3:0]x,y;
output [7:0]z;
wire [17:1]w;
and (z[0],x[0],y[0]);
ha ha1(x[1]&y[0],x[0]&y[1],z[1],w[1]);
fa fa1(x[2]&y[0],x[1]&y[1],w[1],w[5],w[2]);
fa fa2(x[3]&y[0],x[2]&y[1],w[2],w[6],w[3]);
ha ha2(x[3]&y[1],w[3],w[7],w[4]);
ha ha3(w[5],x[0]&y[2],z[2],w[8]);
fa fa3(w[6],x[1]&y[2],w[8],w[12],w[9]);
fa fa4(w[7],x[2]&y[2],w[9],w[13],w[10]);
fa fa5(w[4],x[3]&y[2],w[10],w[14],w[11]);
ha ha4(w[12],x[0]&y[3],z[3],w[15]);
fa fa6(w[13],x[1]&y[3],w[15],z[4],w[16]);
fa fa7(w[14],x[2]&y[3],w[16],z[5],w[17]);
fa fa8(w[11],x[3]&y[3],w[17],z[6],z[7]);
endmodule
