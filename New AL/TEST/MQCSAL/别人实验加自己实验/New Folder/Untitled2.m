p=3
C=[1,61,121,181,241]+p;
[mat2,result]=datacollect2(C)
[mat3,score_block,wlt_block,block_Z,block_R,block_B,block_X]=ttest2_block_invert(mat2,10,7,2);
BT=zb(mat3);