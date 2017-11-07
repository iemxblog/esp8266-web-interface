for f in ./*.lua; do
    /tmp/luatool/luatool/luatool.py --ip $1 -f $f
done
for f in ./*.html; do
    /tmp/luatool/luatool/luatool.py --ip $1 -f $f
done
