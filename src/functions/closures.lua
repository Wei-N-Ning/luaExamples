
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
end


local function run()
    demoClosureWithUpvalues()
end


run()
