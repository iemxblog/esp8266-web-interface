dofile("page.lua")
dofile("pins_json.lua")

function delayed(t, f)
    tmr.create():alarm(t, tmr.ALARM_SINGLE, f)
end

function serve_static_file(socket, path)
    if file.open(path) then

        local function send(localSocket)
            local line = file.readline()
            if line == nil then
                file.close()
                localSocket:close()    
            else
                localSocket:send(line)
            end
        end

        socket:on("sent", send)
        send(socket)

    end
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
            serve_static_file(client, "page.html")
        elseif method == "GET" and path == "/pins.json" then
            client:send(pins_json(), function() client:close() end)
        else
            serve_static_file(client, "page_not_found.html")
        end
        collectgarbage()
    end)
end)
