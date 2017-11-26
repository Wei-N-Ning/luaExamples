
function stringSubstitution()
    local text = "doom"
    t2 = string.gsub(text, "d", "D")
    assert(t2 == "Doom")
end


function stringLength()
    local text = "doom"
    assert(#text == 4) -- get the length of string variable t2
end


function stringConcatenation()
    local text = "doom"
    text = text .. 2
    assert(text == "doom2")
end


function longTextDemo()
    local longText = 
        "int main(int argc, char** argv) {\n" ..
        "   return 0;\n" ..
        "}\n"
    assert(#longText > 10)
end


function longerTextBracketDemo()
    local longerText = [[
    def deploy(codeObj):
        b = build(codeObj)
        assert b, "fail to build {}".format(codeObj.toShortStr())
        s = Shipper()
        assert s.ship(b), "fail to ship code, reason: {}".format(s.msg())
        return s.receipt()
    ]]
    assert(#longerText > 10)
end


function bytesAsString()
    local funkyText = [[
    \xDE\xAD\xBE\xEF
    DEADBEEF
    \x00\x16\x61
    ]]
    assert(string.byte(funkyText, 1) == 0xDE)
    assert(string.char(97) == "a")
    assert(string.byte(funkyText, -1) == 0x61)
end


function run()
    stringLength()
    stringSubstitution()
    stringConcatenation()
    longTextDemo()
end


run()

