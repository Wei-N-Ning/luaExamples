

local function demoMod()
    assert(1 == ((1 + 55) % 55))
end


local function rotation(codec, times)
    local _cursor = 1
            
    local function getCode()
        local _c = codec:sub(_cursor, _cursor)
        _cursor = _cursor % #codec + 1
        return _c
    end
    
    local _t = {}
    for i = 1, times do
        _t[i] = getCode()
    end
    return table.concat(_t)
end


local function run()
    demoMod()
    
    assert("iddqdiddqdiddqdiddqdi", rotation("iddqd", 21))
end


run()
