

function demoSetGetMetatable()
    local t = {name="xerox"}
    local mt = {}
    setmetatable(t, mt)
    assert(mt == getmetatable(t))
    
    -- each table variable has its own metatable 
    assert(mt ~= getmetatable({name="slash"}))
end


function demoGetMetatableFromPrimitiveTypes()
    -- The string library sets a metatable for strings; all other types 
    -- by default have no metatable
    
    assert(getmetatable("asd") ~= nil)
    assert(getmetatable(1) == nil)
end


function demoOverloadedAddMethod()
    local function _addStringToOther(s, other)
        return string.format("%s%s", s, other)
    end
    local lhs, rhs = "doom", 1993
    local mt = getmetatable(lhs)
    mt.__add = _addStringToOther
    assert("doom1993" == _addStringToOther(lhs, rhs))
    assert("doom1993" == (lhs + rhs))
end


function run()
    demoSetGetMetatable()
    demoGetMetatableFromPrimitiveTypes()
    demoOverloadedAddMethod()
end


run()

