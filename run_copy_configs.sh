#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__2_ cby_0__1_ cby_1__1_ cby_2__1_ sb_0__0_ sb_0__1_ sb_0__2_ sb_1__0_ sb_1__1_ sb_1__2_ sb_2__0_ sb_2__1_ sb_2__2_ grid_clb"
DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__3_ cby_0__1_ cby_1__1_ cby_3__1_ sb_0__0_ sb_0__1_ sb_0__3_ sb_1__0_ sb_1__1_ sb_1__3_ sb_3__0_ sb_3__1_ sb_3__3_ grid_clb"
#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__4_ cby_0__1_ cby_1__1_ cby_4__1_ sb_0__0_ sb_0__1_ sb_0__4_ sb_1__0_ sb_1__1_ sb_1__4_ sb_4__0_ sb_4__1_ sb_4__4_ grid_clb"
#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__6_ cby_0__1_ cby_1__1_ cby_6__1_ sb_0__0_ sb_0__1_ sb_0__6_ sb_1__0_ sb_1__1_ sb_1__6_ sb_6__0_ sb_6__1_ sb_6__6_ grid_clb"
#DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__8_ cby_0__1_ cby_1__1_ cby_8__1_ sb_0__0_ sb_0__1_ sb_0__8_ sb_1__0_ sb_1__1_ sb_1__8_ sb_8__0_ sb_8__1_ sb_8__8_ grid_clb"
NAME_DIR="macro_tcls"
DIR="sub_gen"
mkdir $DIR
cd $DIR
mkdir $NAME_DIR
mkdir gds
mkdir lef
cd ..

for dd in $DESIGN_NAME2
do
    if [[ "$dd" = "grid_clb" ]]; then
        cp -r ./designs/$dd/config.tcl ./$DIR/$NAME_DIR/$dd\_config.tcl
    else
        cp -r ./designs/$dd/config.tcl ./$DIR/$NAME_DIR/$dd\config.tcl
    fi
done

cp -r ./designs/fpga_core/gds/*.gds ./$DIR/gds
cp -r ./designs/fpga_core/lef/*.lef ./$DIR/lef
cp -r ./designs/fpga_core/src/fpga_core.v ./$DIR
cp -r ./designs/fpga_core/config.tcl ./$DIR/fpga_core_config.tcl

cd ..
cp -r ./FPGA-Placement-Generator/*.py ./OpenLane/$DIR
cd OpenLane/$DIR/