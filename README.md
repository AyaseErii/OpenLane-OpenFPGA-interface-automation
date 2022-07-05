# OpenLane-OpenFPGA-interface-automation
This is a file-transferring from OpenFPGA to OpenLane, and an OpenLane design flow automation regarding different type of small macros/blocks (grid_clb, cbx_x__y_, cby_x__y_, and sb_x__y_).

## Pre-requirements 
* Lastes OpenFPGA and OpenLane. Please make sure both tools are installed without any error.

## How to run
1. Make sure you generated a 2x2 FPGA fabric with OpenFPGA, i.e. you need to have `latest/your_design/.../SRC` directory containing `lb`, `routing` and `submodule` 3 sub-directories and `fpga_top.v` after running your task.
2. `git clone` the repo under `OpenLane` directory.
3. Set the path `FPGA_SRC_PATH` in `run_copy_fpga_fabric.sh` to set the path of source files of you generated FPGA fabric.
4. Run `run_flow.sh` and wait the entire flow.

### IMPORTANT NOTE
* In `run_flow.sh`, users can set absolute die area, such as `GRID_CLB_SIZE_X`, `GRID_CLB_SIZE_Y`, `CB_SIZE_X`, `CB_SIZE_Y`, `SB_SIZE_X` and `SB_SIZE_Y` ,for each small macro/block

* For a relatively large design, e.g. a 8x8 FPGA fabric. Remember to change the `DESIGN_NAME2` and `DESIGN_DESIGN`, e.g. change `sb_0__2_` to `sb_0__8_`. PLEASE change all the `2` of the elements in the both `DESIGN_NAME2` list and `DESIGN_DESIGN` list

* Make sure `runs` directory of each design/marco/block contains only one submodule. If there are multiple, please leave the latest one.
