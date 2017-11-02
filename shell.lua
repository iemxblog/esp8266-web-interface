function ls()
    for k, v in pairs(file.list()) do
        print(k, v)
    end
end

function cat(f)
    if(file.open(f)) then
        print(file.read())
        file.close()
    end
end

function rm(f)
    if(file.exists(f)) then
        file.remove(f)
    else
        print("File " .. f .. " doesn't exist.")
    end
end
