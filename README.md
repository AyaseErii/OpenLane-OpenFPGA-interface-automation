# OpenLane-OpenFPGA-interface-automation
This is a file-transferring utility. It helps you transfer an FPGA fabric from OpenFPGA to OpenLane. This tool also provides OpenLane design flow automation regarding different types of small macros/blocks (grid_clb, cbx_x__y_, cby_x__y_, and sb_x__y_). These modules are hardened individually, then combined later into a fabric.

## Pre-requirements 
* Requires OpenFPGA and OpenLane. Please make sure both tools are installed without any error.

## How to run
1. Make sure you generated a 2x2 FPGA fabric with OpenFPGA, i.e. you need to have `latest/your_design/.../SRC` directory containing `lb`, `routing` and `submodule` 3 sub-directories and `fpga_top.v` after running OpenFPGA.
2. `git clone` the repo under the `OpenLane` directory.
3. Edit `run_copy_fpga_fabric.sh`, modifying `FPGA_SRC_PATH` to set the path of source files describing your OpenFPGA-generated fabric. 
4. Run `run_copy_fpga_fabric.sh`.
5. Run `run_flow.sh` and wait for the entire flow to finish.

### IMPORTANT NOTE

* In `run_flow.sh`, users can set absolute die area, such as `GRID_CLB_SIZE_X`, `GRID_CLB_SIZE_Y`, `CB_SIZE_X`, `CB_SIZE_Y`, `SB_SIZE_X` and `SB_SIZE_Y`, for each small macro/block

* For a relatively large design, e.g. an 8x8 FPGA fabric, remember to change the `DESIGN_NAME2` and `DESIGN_DESIGN`. (i.e. change `sb_0__2_` to `sb_0__8_`). PLEASE change all the `2`'s of the elements in the both `DESIGN_NAME2` list and `DESIGN_DESIGN` list.

* Make sure the `runs` directory of each design/macro/block contains only one subdirectory. If there are multiple, remove all but the latest one.
