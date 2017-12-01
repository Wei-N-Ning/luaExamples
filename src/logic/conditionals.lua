

function formatElementName(baseName, typeName, num)
    if (typeName == "me") then
        return string.format("%sME%02d", baseName, num)
    elseif (typeName == "ws") then
        return string.format("%sWS%02d", baseName, num)
    end
    return ""
end


function switchCaseDemo()
    assert("impME01", formatElementName("imp", "me", 1))
    assert("impWS01", formatElementName("imp", "ws", 1))
end


function run()
    switchCaseDemo()
end


run()

