#!

echo "/* Generated file, do not edit */" > all.h
echo "" >> all.h
export count=`ls -1 [0-9][0-9]* | wc -l`
echo "#define IMPULSES $count" >> all.h
echo "" >> all.h
ls -1 [0-9][0-9]* | awk '{print "#include \"impulses/" $0 "\""}' >> all.h
echo "" >> all.h
echo "inline void mk_imps(fftw_real **impulse_freq)" >> all.h
echo "{" >> all.h
echo "	int c = 0;" >> all.h
ls -1 [0-9][0-9]* | sed 's/...//;s/\.h//;s/-/_/g' | awk '{print "\tMK_IMP(" $0 ");"}' >> all.h
echo "};" >> all.h
