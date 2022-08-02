#DESIGN_DEISGN="cbx_1__0_ cbx_1__1_ cbx_1__2_ cby_0__1_ cby_1__1_ cby_2__1_ sb_0__0_ sb_0__1_ sb_0__2_ sb_1__0_ sb_1__1_ sb_1__2_ sb_2__0_ sb_2__1_ sb_2__2_ grid_clb"
DESIGN_DEISGN="cbx_1__0_ cbx_1__1_ cbx_1__4_ cby_0__1_ cby_1__1_ cby_4__1_ sb_0__0_ sb_0__1_ sb_0__4_ sb_1__0_ sb_1__1_ sb_1__4_ sb_4__0_ sb_4__1_ sb_4__4_ grid_clb"
for d in $DESIGN_DEISGN
do
    cd designs/$d
    rm -r runs
    cd ../..
done