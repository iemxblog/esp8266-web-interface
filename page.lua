function pin(name, value, inert)
    local ret = '<td>' .. name .. '</td>\n' ..
        '<td id="pin_]]' .. name .. '">' .. value .. '</td>'
    if inert then
        ret = ret .. "<td></td>\n<td></td>\n<td></td>\n"
    else
        ret = ret .. [[<td><button>IN</button>
            <td><button>0</button>
            <td><button>1</button>]]
    end
    return ret
end

function row(pin1, pin2)
    return '<tr>\n' .. pin1 .. pin2 .. '\n</tr>'
end


page = [[<html>
    <head>
        <title>ESP8266</title>
    </head>
    <body>
        <table>
            <tr>
                <th>Name</th>
                <th>Val</th>
                <th>In</th>
                <th>Out 0</th>
                <th>Out 1</th>
                <th>Name</th>
                <th>Val</th>
                <th>In</th>
                <th>Out 0</th>
                <th>Out 1</th>
            </tr>]]
           .. row(pin('ADC0', '0', true), pin('D0', '0'))
           .. row(pin('RSV', '0', true), pin('D1', '0')) 
           .. row(pin('RSV', '0', true), pin('D2', '0')) 
           .. row(pin('RSV', '0', true), pin('D3', '0')) 
           .. row(pin('RSV', '0', true), pin('D4', '0')) 
           .. row(pin('RSV', '0', true), pin('3.3V', '0', true))
           .. row(pin('RSV', '0', true), pin('GND', '0', true)) 
           .. row(pin('GND', '0', true), pin('D5', '0'))
           .. row(pin('3.3V', '0', true), pin('D6', '0'))
           .. row(pin('GND', '0', true), pin('D7', '0')) 
           .. row(pin('3.3V', '0', true), pin('D8', '0')) 
           .. row(pin('EN', '0', true), pin('RX', '0', true)) 
           .. row(pin('RST', '0', true), pin('TX', '0', true)) 
           .. row(pin('GND', '0', true), pin('GND', '0', true)) 
           .. row(pin('5V', '0', true), pin('3.3V', '0', true)) .. [[
        </table>
        <p>
        Heap : ]] .. node.heap() .. [[
        </p>
    </body>
</html>
]]
