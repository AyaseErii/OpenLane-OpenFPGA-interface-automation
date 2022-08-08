#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__2_ cby_0__1_ cby_1__1_ cby_2__1_ sb_0__0_ sb_0__1_ sb_0__2_ sb_1__0_ sb_1__1_ sb_1__2_ sb_2__0_ sb_2__1_ sb_2__2_ grid_clb"
#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__3_ cby_0__1_ cby_1__1_ cby_3__1_ sb_0__0_ sb_0__1_ sb_0__3_ sb_1__0_ sb_1__1_ sb_1__3_ sb_3__0_ sb_3__1_ sb_3__3_ grid_clb"
DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__4_ cby_0__1_ cby_1__1_ cby_4__1_ sb_0__0_ sb_0__1_ sb_0__4_ sb_1__0_ sb_1__1_ sb_1__4_ sb_4__0_ sb_4__1_ sb_4__4_ grid_clb"
#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__6_ cby_0__1_ cby_1__1_ cby_6__1_ sb_0__0_ sb_0__1_ sb_0__6_ sb_1__0_ sb_1__1_ sb_1__6_ sb_6__0_ sb_6__1_ sb_6__6_ grid_clb"
#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__8_ cby_0__1_ cby_1__1_ cby_8__1_ sb_0__0_ sb_0__1_ sb_0__8_ sb_1__0_ sb_1__1_ sb_1__8_ sb_8__0_ sb_8__1_ sb_8__8_ grid_clb"
#mkdir sub_macro_configs
for dd in $DESIGN_NAME2
do
    #GRID_CLB_SIZE_X=132
    #GRID_CLB_SIZE_Y=132

    #CBx_SIZE_X=92
    #CBx_SIZE_Y=107
    
    #CBy_SIZE_X=92
    #CBy_SIZE_Y=107

    #SB_SIZE_X=125
    #SB_SIZE_Y=125
    
    GRID_CLB_SIZE_X=250
    GRID_CLB_SIZE_Y=260

    CBx_SIZE_X=200
    CBx_SIZE_Y=210
    
    CBy_SIZE_X=200
    CBy_SIZE_Y=210

    SB_SIZE_X=200
    SB_SIZE_Y=210
    ./flow.tcl -design $dd -init_design_config -config_file config.tcl
    cd designs/$dd
    mv config.tcl config.txt
    sed -i 's/set ::env(CLOCK_PORT) "clk"/set ::env(CLOCK_PORT) "prog_clk"/g' config.txt
    #sed -i '/FP_CORE_UTIL/d' config.txt

    if [[ "$dd" = "grid_clb" ]]; then
    sed -i "/set ::env(CLOCK_PORT) \"prog_clk\"/a set ::env(FP_SIZING) \"absolute\"\nset ::env(DIE_AREA) \"0 0 $GRID_CLB_SIZE_X $GRID_CLB_SIZE_Y\"\nset ::env(DESIGN_IS_CORE) 0\nset ::env(FP_PDN_CORE_RING) 0\nset ::env(RT_MAX_LAYER) \"met4\"" config.txt
    mv config.txt config.tcl
    cd ../..
    #cp -r ./designs/$dd/config.tcl ./sub_macro_configs/$dd\_config.tcl   
    echo "  "
    echo "==============Start the design flow of" $dd "================="
    echo "  "
    ./flow.tcl -design $dd
    cp -r ./designs/$dd/runs/*/results/final/gds/$dd.gds ./designs/fpga_core/gds
    cp -r ./designs/$dd/runs/*/results/final/lef/$dd.lef ./designs/fpga_core/lef
    echo "  "
    echo "Finished the flow and the copying of .gds and .lef into the corresponding fpga_core directory!"
    echo "  "

    #elif [[ "$dd" = "cbx_1__0_" || "$dd" = "cbx_1__1_" || "$dd" = "cbx_1__2_" ]]; then
    #elif [[ "$dd" = "cbx_1__0_" || "$dd" = "cbx_1__1_" || "$dd" = "cbx_1__8_" ]]; then
    #elif [[ "$dd" = "cbx_1__0_" || "$dd" = "cbx_1__1_" || "$dd" = "cbx_1__6_" ]]; then
    #elif [[ "$dd" = "cbx_1__0_" || "$dd" = "cbx_1__1_" || "$dd" = "cbx_1__4_" ]]; then
    elif [[ "$dd" = "cbx_1__0_" || "$dd" = "cbx_1__1_" || "$dd" = "cbx_1__3_" ]]; then
    sed -i "/set ::env(CLOCK_PORT) \"prog_clk\"/a set ::env(FP_SIZING) \"absolute\"\nset ::env(DIE_AREA) \"0 0 $CBx_SIZE_X $CBx_SIZE_Y\"\nset ::env(DESIGN_IS_CORE) 0\nset ::env(FP_PDN_CORE_RING) 0\nset ::env(RT_MAX_LAYER) \"met4\"" config.txt
    mv config.txt config.tcl
    cd ../.. 
    #cp -r ./designs/$dd/config.tcl ./sub_macro_configs/$dd\_config.tcl
    echo "  "
    echo "==============Start the design flow of" $dd "================="
    echo "  "
    ./flow.tcl -design $dd
    cp -r ./designs/$dd/runs/*/results/final/gds/$dd.gds ./designs/fpga_core/gds
    cp -r ./designs/$dd/runs/*/results/final/lef/$dd.lef ./designs/fpga_core/lef
    echo "  "
    echo "Finished the flow and the copying of .gds and .lef into the corresponding fpga_core directory!"
    echo "  "
    
    #elif [[ "$dd" = "cby_0__1_" || "$dd" = "cby_1__1_" || "$dd" = "cby_2__1_" ]]; then
    #elif [[ "$dd" = "cby_0__1_" || "$dd" = "cby_1__1_" || "$dd" = "cby_8__1_" ]]; then
    #elif [[ "$dd" = "cby_0__1_" || "$dd" = "cby_1__1_" || "$dd" = "cby_6__1_" ]]; then
    #elif [[ "$dd" = "cby_0__1_" || "$dd" = "cby_1__1_" || "$dd" = "cby_4__1_" ]]; then
    elif [[ "$dd" = "cby_0__1_" || "$dd" = "cby_1__1_" || "$dd" = "cby_3__1_" ]]; then
    sed -i "/set ::env(CLOCK_PORT) \"prog_clk\"/a set ::env(FP_SIZING) \"absolute\"\nset ::env(DIE_AREA) \"0 0 $CBy_SIZE_X $CBy_SIZE_Y\"\nset ::env(DESIGN_IS_CORE) 0\nset ::env(FP_PDN_CORE_RING) 0\nset ::env(RT_MAX_LAYER) \"met4\"" config.txt
    mv config.txt config.tcl
    cd ../.. 
    #cp -r ./designs/$dd/config.tcl ./sub_macro_configs/$dd\_config.tcl
    echo "  "
    echo "==============Start the design flow of" $dd "================="
    echo "  "
    ./flow.tcl -design $dd
    cp -r ./designs/$dd/runs/*/results/final/gds/$dd.gds ./designs/fpga_core/gds
    cp -r ./designs/$dd/runs/*/results/final/lef/$dd.lef ./designs/fpga_core/lef
    echo "  "
    echo "Finished the flow and the copying of .gds and .lef into the corresponding fpga_core directory!"
    echo "  "


    else
    sed -i "/set ::env(CLOCK_PORT) \"prog_clk\"/a set ::env(FP_SIZING) \"absolute\"\nset ::env(DIE_AREA) \"0 0 $SB_SIZE_X $SB_SIZE_Y\"\nset ::env(DESIGN_IS_CORE) 0\nset ::env(FP_PDN_CORE_RING) 0\nset ::env(RT_MAX_LAYER) \"met4\"" config.txt
    mv config.txt config.tcl
    cd ../..
    #cp -r ./designs/$dd/config.tcl ./sub_macro_configs/$dd\_config.tcl
    echo "  "
    echo "==============Start the design flow of" $dd "================="
    echo "  "
    ./flow.tcl -design $dd
    cp -r ./designs/$dd/runs/*/results/final/gds/$dd.gds ./designs/fpga_core/gds
    cp -r ./designs/$dd/runs/*/results/final/lef/$dd.lef ./designs/fpga_core/lef
    echo "  "
    echo "Finished the flow and the copying of .gds and .lef into the corresponding fpga_core directory!"
    echo "  "

    fi

done
 