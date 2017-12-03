/tmp/luatool/luatool/luatool.py -p /dev/ttyUSB0 -b 115200 -f /tmp/luatool/luatool/telnet_srv.lua

for f in ./*.lua; do
    /tmp/luatool/luatool/luatool.py -p /dev/ttyUSB0 -b 115200 -f $f
done

for f in ./*.html; do
    /tmp/luatool/luatool/luatool.py -p /dev/ttyUSB0 -b 115200 -f $f
done

echo "Install is complete. Please restart the ESP8266."
