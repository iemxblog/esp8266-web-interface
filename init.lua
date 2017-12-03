dofile("telnet_srv.lua")
dofile("wifi-led.lua")
if not file.exists("setup_done") then
    print("First time set-up...")
    wifi.sta.clearconfig()
    enduser_setup.start(function () 
        file.open("setup_done", "w")
        file.write("setup_done")
        file.close()
    end)
else
    wifi.setmode(wifi.STATION)
    wifi.sta.connect()
    dofile("esp8266-web-interface.lua")
end

