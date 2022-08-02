cd designs
mkdir fpga_core
cd fpga_core
mkdir blackboxs
mkdir gds
mkdir lef
mkdir src
cd ../..

#DESIGN_DEISGN="cbx_1__0_ cbx_1__1_ cbx_1__2_ cby_0__1_ cby_1__1_ cby_2__1_ sb_0__0_ sb_0__1_ sb_0__2_ sb_1__0_ sb_1__1_ sb_1__2_ sb_2__0_ sb_2__1_ sb_2__2_ grid_clb"
DESIGN_DEISGN="cbx_1__0_ cbx_1__1_ cbx_1__3_ cby_0__1_ cby_1__1_ cby_3__1_ sb_0__0_ sb_0__1_ sb_0__3_ sb_1__0_ sb_1__1_ sb_1__3_ sb_3__0_ sb_3__1_ sb_3__3_ grid_clb"
#DESIGN_DEISGN="cbx_1__0_ cbx_1__1_ cbx_1__4_ cby_0__1_ cby_1__1_ cby_4__1_ sb_0__0_ sb_0__1_ sb_0__4_ sb_1__0_ sb_1__1_ sb_1__4_ sb_4__0_ sb_4__1_ sb_4__4_ grid_clb"
#DESIGN_DEISGN="cbx_1__0_ cbx_1__1_ cbx_1__6_ cby_0__1_ cby_1__1_ cby_6__1_ sb_0__0_ sb_0__1_ sb_0__6_ sb_1__0_ sb_1__1_ sb_1__6_ sb_6__0_ sb_6__1_ sb_6__6_ grid_clb"
#DESIGN_DEISGN="cbx_1__0_ cbx_1__1_ cbx_1__8_ cby_0__1_ cby_1__1_ cby_8__1_ sb_0__0_ sb_0__1_ sb_0__8_ sb_1__0_ sb_1__1_ sb_1__8_ sb_8__0_ sb_8__1_ sb_8__8_ grid_clb"


FPGA_SRC_PATH="OpenFPGA/openfpga_flow/tasks/basic_tests/generate_fabric/latest/vpr_arch/and2/MIN_ROUTE_CHAN_WIDTH/SRC"

for d in $DESIGN_DEISGN
do
    cd designs
    mkdir $d
    cd $d
    mkdir src
    cd src
    echo $d

    # CLB file
    if [[ "$d" = "grid_clb" ]]; then
        cp -r ../../../../${FPGA_SRC_PATH}/sub_module ./
        cp -r ../../../../${FPGA_SRC_PATH}/lb/*.v ./
        #cp -r ../../../../SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_Verilog/SRC/sub_module {digital_io_hd}.v        
        cd sub_module
        rm -rf {arch_encoder,local_encoder,mux_primitives,fpga_top,user_project_wrapper}.v
        #rm -rf {digital_io_hd,arch_encoder,luts,local_encoder,mux_primitives,fpga_top,user_project_wrapper}.v
        cd ..
        rm -rf {grid_io_bottom_bottom,grid_io_left_left,grid_io_right_right,grid_io_top_top,logical_tile_io_mode_io_,logical_tile_io_mode_physical__iopad}.v
        #continue
        cp -r ./sub_module/*.v ./
        rm -r sub_module
        cd ../../..

        cp -r ./designs/$d/src/$d.v ./designs/fpga_core/blackboxs
    
    # Center block files
    elif [[ "$d" = "cbx_1__1_" || "$d" = "cby_1__1_" || "$d" = "sb_1__1_" ]]; then
        cp -r ../../../../${FPGA_SRC_PATH}/sub_module ./
        cp -r ../../../../${FPGA_SRC_PATH}/routing/$d.v ./
        cd sub_module
        rm -rf {arch_encoder,luts,local_encoder,mux_primitives,fpga_top,user_project_wrapper}.v
        #rm -rf {digital_io_hd,arch_encoder,luts,local_encoder,mux_primitives,fpga_top,user_project_wrapper}.v
        cd ..

        #continue
        cp -r ./sub_module/*.v ./
        rm -r sub_module
        cd ../../..

        cp -r ./designs/$d/src/$d.v ./designs/fpga_core/blackboxs        
    
    # Edge block files
    else
        cp -r ../../../../${FPGA_SRC_PATH}/sub_module ./
        cp -r ../../../../${FPGA_SRC_PATH}/routing/$d.v ./
        cp -r ../../../../${FPGA_SRC_PATH}/lb/{logical_tile_io_mode_io_,logical_tile_io_mode_physical__iopad}.v ./
        #cp -r ../../../../SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_Verilog/SRC/sub_module {digital_io_hd}.v
        cd sub_module
        rm -rf {arch_encoder,luts,local_encoder,mux_primitives,fpga_top,user_project_wrapper}.v
        #rm -rf {digital_io_hd,arch_encoder,luts,local_encoder,mux_primitives,fpga_top,user_project_wrapper}.v
        cd ..

        #continue
        cp -r ./sub_module/*.v ./
        rm -r sub_module
        cd ../../..

        cp -r ./designs/$d/src/$d.v ./designs/fpga_core/blackboxs

    fi
    
    #cp -r ../../../../OpenFPGA/openfpga_flow/tasks/basic_tests/full_testbench/configuration_chain/latest/k6_frac_N10_tileable_40nm/and2/MIN_ROUTE_CHAN_WIDTH/SRC/lb/*.v ./
    #cp -r ../../../../OpenFPGA/openfpga_flow/tasks/basic_tests/full_testbench/configuration_chain/latest/k6_frac_N10_tileable_40nm/and2/MIN_ROUTE_CHAN_WIDTH/SRC/sub_module ./
    #cp -r ../../../../OpenFPGA/openfpga_flow/tasks/basic_tests/full_testbench/configuration_chain/latest/k6_frac_N10_tileable_40nm/and2/MIN_ROUTE_CHAN_WIDTH/SRC/routing/${DESIGN_DEISGN}.v ./
    #cp -r ../../../../OpenFPGA/openfpga_flow/tasks/basic_tests/full_testbench/configuration_chain/latest/k6_frac_N10_tileable_40nm/and2/MIN_ROUTE_CHAN_WIDTH/SRC/lb/{logical_tile_io_mode_io_,logical_tile_io_mode_physical__iopad,gpio}.v ./

    #cp -r ../../../../OpenFPGA/openfpga_flow/tasks/basic_tests/generate_fabric/latest/vpr_arch/and2/MIN_ROUTE_CHAN_WIDTH/SRC/lb/*.v ./



    # For OpenFPGA-EF project 8x8
    #cp -r ../../../../Caravel-OpenFPGA-EF/verilog/rtl/user_project/SRC/lb/{logical_tile_io_mode_io_,logical_tile_io_mode_physical__iopad}.v ./
    #cp -r ../../../../Caravel-OpenFPGA-EF/verilog/rtl/user_project/SRC/sub_module ./
    #cp -r ../../../../Caravel-OpenFPGA-EF/verilog/rtl/user_project/SRC/routing/${DESIGN_DEISGN}.v ./
    #cp -r ../../../../Desktop/user_defined_templates.v ./

    # For SOFA 12x12
    #cp -r ../../../../SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_Verilog/SRC/lb/*.v ./
    #cp -r ../../../../SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_Verilog/SRC/lb/{logical_tile_io_mode_io_,logical_tile_io_mode_physical__iopad}.v ./
    #cp -r ../../../../SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_Verilog/SRC/sub_module ./
    #cp -r ../../../../SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_Verilog/SRC/routing/${DESIGN_DEISGN}.v ./
    #cp -r ../../../../Desktop/user_defined_templates.v ./

    #using these if you are building cb or sb

done
cp -r ../$FPGA_SRC_PATH/fpga_top.v ./designs/fpga_core/src/fpga_core.v
echo " "
echo "Finish copying! "
echo " "
echo "Now launching the openlane docker!"
echo " "

make mount