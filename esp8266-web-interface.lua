dofile("page.lua")
dofile("pins_json.lua")
dofile("page_not_found.lua")

function delayed(t, f)
    tmr.create():alarm(t, tmr.ALARM_SINGLE, f)
end

srv = net.createServer(net.TCP)
srv:listen(80, function(conn)
    conn:on("receive", function(client, request)
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP")
        if method == nil then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP")
        end
        print("method = ", method)
        print("path = ", path)
        print("vars = ", vars)
        if method == "GET" and path == "/" then
            client:send(page())
        elseif method == "GET" and path == "/pins.json" then
            client:send(pins_json())
        else
            client:send(page_not_found())
        end
        delayed(100, function()
            print("closing socket")
            client:close()
        end)
        collectgarbage()
    end)
end)
