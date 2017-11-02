for f in ./*.lua; do
    /tmp/luatool/luatool/luatool.py --ip 192.168.1.20 -f $f
done
