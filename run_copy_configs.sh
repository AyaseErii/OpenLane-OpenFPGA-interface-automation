DESIGN_NAME2="cbx_1__0_ cbx_1__1_ cbx_1__2_ cby_0__1_ cby_1__1_ cby_2__1_ sb_0__0_ sb_0__1_ sb_0__2_ sb_1__0_ sb_1__1_ sb_1__2_ sb_2__0_ sb_2__1_ sb_2__2_ grid_clb"
NAME_DIR="macro_tcls"
DIR="sub_gen"
mkdir $DIR
cd $DIR
mkdir $NAME_DIR
cd ..

for dd in $DESIGN_NAME2
do
    if [[ "$dd" = "grid_clb" ]]; then
        cp -r ./designs/$dd/config.tcl ./$DIR/$NAME_DIR/$dd\_config.tcl
    else
        cp -r ./designs/$dd/config.tcl ./$DIR/$NAME_DIR/$dd\config.tcl
    fi
done

cp -r ./designs/fpga_core/gds/*.gds ./$DIR
cp -r ./designs/fpga_core/lef/*.lef ./$DIR
cp -r ./designs/fpga_core/src/fpga_core.v ./$DIR
cp -r ./designs/fpga_core/config.tcl ./$DIR/fpga_core_config.tcl