DESIGN_DEISGN="cby_1__3_"
cd designs
mkdir ${DESIGN_DEISGN}
cd ${DESIGN_DEISGN}
mkdir src
cd src
#cp -r ../../../../OpenFPGA/openfpga_flow/tasks/fpga_verilog/flatten_routing/latest/k6_frac_N10_tileable_40nm/and2/MIN_ROUTE_CHAN_WIDTH/SRC/lb ./
cp -r ../../../../OpenFPGA/openfpga_flow/tasks/fpga_verilog/flatten_routing/latest/k6_frac_N10_tileable_40nm/and2/MIN_ROUTE_CHAN_WIDTH/SRC/sub_module ./
cp -r ../../../../OpenFPGA/openfpga_flow/tasks/fpga_verilog/flatten_routing/latest/k6_frac_N10_tileable_40nm/and2/MIN_ROUTE_CHAN_WIDTH/SRC/routing/${DESIGN_DEISGN}.v ./

# For OpenFPGA-EF project 8x8
#cp -r ../../../../Caravel-OpenFPGA-EF/verilog/rtl/user_project/SRC/lb/{logical_tile_io_mode_io_,logical_tile_io_mode_physical__iopad}.v ./
#cp -r ../../../../Caravel-OpenFPGA-EF/verilog/rtl/user_project/SRC/sub_module ./
#cp -r ../../../../Caravel-OpenFPGA-EF/verilog/rtl/user_project/SRC/routing/${DESIGN_DEISGN}.v ./
#cp -r ../../../../Desktop/user_defined_templates.v ./


#using these if you are building cb or sb
cd sub_module
rm -rf {arch_encoder,luts,mux_primitives}.v
cd ..

#continue
cp -r ./sub_module/*.v ./
rm -r sub_module
cd ../../..

echo " "
echo "Finish copying! "
echo " "
echo "Now launching the openlane docker!"
echo " "
make mount