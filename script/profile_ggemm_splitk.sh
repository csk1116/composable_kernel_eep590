#!/bin/bash
 
## GPU visibility
export HIP_VISIBLE_DEVICES=0
DRIVER="../build/bin/ckProfiler"
OP="grouped_gemm_two_stage"
DATATYPE="2" #1: bf16int8 2:bf16
LAYOUT="0"
VERIFY="0"
INIT="0"
LOG="0"
TIME="1"
 

 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	2048	8192   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	2048	65536  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	8192	1024   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	8192	8192   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	8192	65536  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 8	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 24	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 32	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 40	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 48	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 56	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 64	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 72	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 80	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 88	4096	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 8	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 24	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 40	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 32	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 56	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 48	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 72	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 64	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 88	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 80	4096	11008  -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 8	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 32	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 24	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 48	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 40	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 64	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 56	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 80	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 72	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 8	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 88	1228	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 24	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 16	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 40	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 32	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 56	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 48	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 72	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 64	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 88	2201	4096   -1 -1 -1 0
 $DRIVER $OP $DATATYPE $LAYOUT $VERIFY $INIT $LOG $TIME 80	2201	4096   -1 -1 -1 0