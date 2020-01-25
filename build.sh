#!/bin/sh
export ulx3sproj=oberon
export ulx3s_dist=/dist/

 git clone https://github.com/emard/oberon && \
 cd oberon/proj/lattice/ulx3s/ulx3s-v20 && \
 for size in 25 45 85; do make clean; make FPGA_SIZE=${size} ulx3s_${size}f_${ulx3sproj}.bit; make FPGA_SIZE=${size} ulx3s_${size}f_${ulx3sproj}.bit; cp -a project/project_project.bit $ulx3s_dist/ulx3s_${size}f_${ulx3sproj}.bit; done && \
 /opt/ulx3s/bin/ecpunpack --input $ulx3s_dist/ulx3s_25f_${ulx3sproj}.bit --textcfg /tmp/ulx3s_12f_${ulx3sproj}.config --idcode 0x41111043 && \
 /opt/ulx3s/bin/ecppack --input /tmp/ulx3s_12f_${ulx3sproj}.config --bit $ulx3s_dist/ulx3s_12f_${ulx3sproj}.bit --compress --idcode 0x21111043 && \
 echo "[Success]"
