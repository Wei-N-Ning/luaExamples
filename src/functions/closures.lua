
-- see: https://www.lua.org/pil/6.1.html


local function incrFactory()
    local i = 0
    local function incr()
        i = i + 1
        return i
    end
    return incr
end


local function demoClosureWithUpvalues()
    incr = incrFactory()
    assert(1 == incr())
    incr()
    incr()
    assert(4 == incr())
    
    -- one can access to the upvalue explicitly via debug.getupvalue()
    -- but this BREAKS ENCAPSULATION !!
    -- see: https://www.lua.org/pil/23.1.2.html
    var, value = debug.getupvalue(incr, 1)
    assert(4 == value)
end


local function run()
    demoClosureWithUpvalues()
end


run()
