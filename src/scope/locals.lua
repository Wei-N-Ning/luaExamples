-- By default, variables in Lua are global


function setGlobalVersion(ver)
    global_version = ver
end


function checkGlobalVersion(expectedVer)
    assert(expectedVer == global_version)
end


function globalVariablesDemo()
    setGlobalVersion(1.1)
    checkGlobalVersion(1.1)
end


function scopedVariablesDemo()
    local ver = 1.1
    do
        local ver = 2.0
    end
    assert(1.1 == ver)
end


-- IMPORTANT: I must define the nested function as "local function"
-- otherwise it is leaked to the global scope
function nestedFunctionDemo()
    local function _formatElementName(baseName, num)
        return string.format("%s%03d", baseName, num)
    end
    assert("imp001" == _formatElementName("imp", 1))
end


function run()
    globalVariablesDemo()
    scopedVariablesDemo()
    nestedFunctionDemo()
end


run()
