-- Caeser cypher and decoy


-- Example: 
-- {closeS}XYZ{openS}
-- XYZ is the passcode
-- param s: text with decoy
-- param openS: sequence of chars that mark the opening of the passcode
-- param closeS: sequence of chars that mark the closing of the passcode
local function removeDecoy(s, openS, closeS)
    assert(openS ~= closeS)
    local s_ = string.find(s, openS)
    assert(s_ ~= nil)
    s_ = s_ + #openS
    local e_ = string.find(s, closeS)
    assert(e_ ~= nil)
    e_ = e_ - 1
    return string.sub(s, s_, e_)
end


-- param s: text to process
-- param codec: Caeser codec
-- param toEncode: 1 to encode the given text; 0 to decode
local function process(s, codec, toEncode)
    local t = {}
    local _cursor = 1
    local _magic = 127
    
    local function getCode()
        local _c = codec:sub(_cursor, _cursor)
        _cursor = _cursor % #codec + 1
        return _c
    end
    
    local function encoder(c)
        local _ = string.byte(getCode())
        local c_ = string.char((string.byte(c) + _) % _magic)
        t[#t + 1] = c_
    end
    
    local function decoder(c)
        local _ = string.byte(getCode())
        local c_ = string.char((string.byte(c) - _) % _magic)
        t[#t + 1] = c_
    end
    
    if (toEncode == 1) then
        s:gsub(".", encoder)
    else
        s:gsub(".", decoder)
    end
    return table.concat(t)
end


local function testRemovingDecoy()
    local _s = ""
    
    _s = removeDecoy("i1d9d9q2dpowi1d9k9f3a", "i1d9d9q2d", "i1d9k9f3a")
    assert("pow" == _s)
end


local function testCypherRoundTrip()
    local _s = ""
    _s = process("iddqd", "idkfa", 1)
    assert("SIPXF" == _s)
    _s = process("SIPXF", "idkfa", 0)
    assert("iddqd" == _s)
end


local function test()
    testRemovingDecoy()
    testCypherRoundTrip()
end


local function main()
end


main()
