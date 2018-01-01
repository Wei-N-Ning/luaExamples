
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
    
    -- each function constructed by incrFactory() has its own closure
    -- and upvalue. 
    -- I can take advantage of this feature and implement some object-
    -- like functors 
    incr2 = incrFactory()
    assert(1 == incr2())
    incr2()
    assert(3 == incr2())
    assert(5 == incr())
end


-- Lua Book P274 shows how to implement this object-like construct in C, 
-- I think that example is a bit of an overkill.
local function createObject()
    local state = {value=0}
    
    local function setter(v)  -- modify state
        state.value = v
    end
    
    local function getter()  -- read value from state
        return state.value
    end
    
    return {setter=setter, getter=getter}
end


local function run()
    demoClosureWithUpvalues()
    
    local obj = createObject()
    assert(0 == obj.getter())
    obj.setter(101)
    assert(101 == obj.getter())
    
    assert(nil == state)  -- state is fully encapsulated & insulated
end


run()
