

local function demoConvertStringToInteger()
    assert(100 == tonumber(" 100"))
    assert(100 == tonumber(" 100.0 "))
    assert(100 == tonumber("0x64"))
    assert(nil == tonumber(" 10 0"))
end


local function demoAsciiCode()
    assert(97 == string.byte("a"))
    assert("a" == string.char(97))
end


local function run()
    demoConvertStringToInteger()
    demoAsciiCode()
end


run()
