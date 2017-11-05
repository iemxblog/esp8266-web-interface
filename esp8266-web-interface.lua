dofile("data_json.lua")

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
        print("(heap = ", node.heap(), ")")
        if method == "GET" and path == "/" then
            serve_static_file(client, "page.html")
        elseif method == "GET" and path == "/data.json" then
            client:on("sent", function(c) c:close() end)
            client:send(data_json())
        else
            serve_static_file(client, "page_not_found.html")
        end
        collectgarbage()
    end)
end)
