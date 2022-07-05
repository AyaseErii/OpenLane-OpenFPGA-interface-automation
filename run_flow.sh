DENSIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__2_ cby_0__1_ cby_1__1_ cby_2__1_ sb_0__0_ sb_0__1_ sb_0__2_ sb_1__0_ sb_1__1_ sb_1__2_ sb_2__0_ sb_2__1_ sb_2__2_ grid_clb"

for dd in $DENSIGN_NAME2
do
    GRID_CLB_SIZE_X=250
    GRID_CLB_SIZE_Y=260

    CB_SIZE_X=200
    CB_SIZE_Y=210

    SB_SIZE_X=200
    SB_SIZE_Y=210
    ./flow.tcl -design $dd -init_design_config
    cd designs/$dd
    mv config.tcl config.txt
    sed -i 's/set ::env(CLOCK_PORT) "clk"/set ::env(CLOCK_PORT) "prog_clk"/g' config.txt
    #sed -i '/FP_CORE_UTIL/d' config.txt

    if [[ "$dd" = "grid_clb" ]]; then
    sed -i "/set ::env(CLOCK_PORT) \"prog_clk\"/a set ::env(FP_SIZING) absolute\nset ::env(DIE_AREA) \"0 0 $GRID_CLB_SIZE_X $GRID_CLB_SIZE_Y\"\nset ::env(DESIGN_IS_CORE) 0\nset ::env(FP_PDN_CORE_RING) 0\nset ::env(RT_MAX_LAYER) \"met4\"" config.txt
    mv config.txt config.tcl
    cd ../..   
    echo "\n==============Start the design flow of" $dd "=================\n"
    ./flow.tcl -design $dd
    cp -r ./designs/$dd/runs/*/results/final/gds/$dd.gds ./designs/fpga_core/gds
    cp -r ./designs/$dd/runs/*/results/final/lef/$dd.lef ./designs/fpga_core/lef
    echo "\nFinished the flow and the copying of .gds and .lef into the corresponding fpga_core directory!\n"

    elif [[ "$dd" = "cbx_1__0_" || "$dd" = "cbx_1__1_" || "$dd" = "cbx_1__2_" || "$dd" = "cby_0__1_" || "$dd" = "cby_1__1_" || "$dd" = "cby_2__1_" ]]; then
    sed -i "/set ::env(CLOCK_PORT) \"prog_clk\"/a set ::env(FP_SIZING) absolute\nset ::env(DIE_AREA) \"0 0 $CB_SIZE_X $CB_SIZE_Y\"\nset ::env(DESIGN_IS_CORE) 0\nset ::env(FP_PDN_CORE_RING) 0\nset ::env(RT_MAX_LAYER) \"met4\"" config.txt
    mv config.txt config.tcl
    cd ../..  
    echo "\n==============Start the design flow of" $dd "=================\n"
    ./flow.tcl -design $dd
    cp -r ./designs/$dd/runs/*/results/final/gds/$dd.gds ./designs/fpga_core/gds
    cp -r ./designs/$dd/runs/*/results/final/lef/$dd.lef ./designs/fpga_core/lef
    echo "\nFinished the flow and the copying of .gds and .lef into the corresponding fpga_core directory!\n"

    else
    sed -i "/set ::env(CLOCK_PORT) \"prog_clk\"/a set ::env(FP_SIZING) absolute\nset ::env(DIE_AREA) \"0 0 $SB_SIZE_X $SB_SIZE_Y\"\nset ::env(DESIGN_IS_CORE) 0\nset ::env(FP_PDN_CORE_RING) 0\nset ::env(RT_MAX_LAYER) \"met4\"" config.txt
    mv config.txt config.tcl
    cd ../.. 
    echo "\n==============Start the design flow of" $dd "=================\n"
    ./flow.tcl -design $dd
    cp -r ./designs/$dd/runs/*/results/final/gds/$dd.gds ./designs/fpga_core/gds
    cp -r ./designs/$dd/runs/*/results/final/lef/$dd.lef ./designs/fpga_core/lef
    echo "\nFinished the flow and the copying of .gds and .lef into the corresponding fpga_core directory!\n"

    fi

done
 