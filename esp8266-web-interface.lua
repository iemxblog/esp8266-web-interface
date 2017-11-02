dofile("page.lua")

function delayed(t, f)
    tmr.create():alarm(t, tmr.ALARM_SINGLE, f)
end

srv = net.createServer(net.TCP)
srv:listen(80, function(conn)
    conn:on("receive", function(client, request)
        print(request)
        client:send(page)
        delayed(100, function()
            print("closing socket")
            client:close()
        end)
        collectgarbage()
    end)
end)
    
