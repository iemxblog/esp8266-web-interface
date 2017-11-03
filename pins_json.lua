function pins_table()
    return {
        A0 = adc.read(0),
        D0 = gpio.read(0),
        D1 = gpio.read(1),
        D2 = gpio.read(2),
        D3 = gpio.read(3),
        D4 = gpio.read(4),
        D5 = gpio.read(5),
        D6 = gpio.read(6),
        D7 = gpio.read(7),
        D8 = gpio.read(8)
    }
end

function tojson(t)
    local ret = '{'
    local sep = ''
    for k, v in pairs(t) do
        ret = ret .. sep .. '"' .. k .. '"' .. " : " .. v
        sep = ', '
    end
    ret = ret .. '}'
    return ret
end

function pins_json()
    return tojson(pins_table())
end
