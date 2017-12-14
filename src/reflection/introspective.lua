
var = {}


local function funcToInspect(arg1, arg2)
end


local function demoInspectFunction()
    local info = debug.getinfo(funcToInspect)

    --~ isvararg	false
    --~ what	Lua
    --~ source	@introspective.lua
    --~ short_src	introspective.lua
    --~ lastlinedefined	4
    --~ currentline	-1
    --~ nups	0
    --~ namewhat
    --~ nparams	2
    --~ linedefined	3
    --~ istailcall	false
    --~ func	function: 0x17e9640
    for k, v in pairs(info) do
        --~ print(k, v)
    end
end


local function demoInspectStackLevel()
    local info = debug.getinfo(1)
    
    --~ short_src	introspective.lua
    --~ func	function: 0x16092c0
    --~ istailcall	false
    --~ nups	1
    --~ nparams	0
    --~ name	demoInspectStackLevel
    --~ isvararg	false
    --~ namewhat	upvalue
    --~ currentline	31
    --~ linedefined	30
    --~ lastlinedefined	36
    --~ source	@introspective.lua
    --~ what	Lua
    
    for k, v in pairs(info) do
        --~ print(k, v)
    end
end


local function traceback()
    local tb = {}

    local function tbCFunc(level, info)
        tb[#tb + 1] = string.format("%d\tC function", level)
    end
    
    local function tbLuaFunc(level, info)
        tb[#tb + 1] = string.format("%d\t[%s]:%d", 
            level, info.short_src, info.currentline)
    end

    for level = 1, math.huge do
        local info = debug.getinfo(level, "Sl")
        if not info then
            break
        end
        if info.what == "C" then
            tbCFunc(level, info)
        else
            tbLuaFunc(level, info)
        end
    end
    
    return tb
end


local function print_traceback(tb)
    for _, line in ipairs(tb) do
        print(line)
    end
end


local function demoTraceback()
    
    -- custom implementation
    --~ 1	[introspective.lua]:66
    --~ 2	[introspective.lua]:93
    --~ 3	[introspective.lua]:99
    --~ 4	[introspective.lua]:111
    --~ 5	[introspective.lua]:118
    --~ 6	[introspective.lua]:122
    --~ 7	C function
    
    -- official implementation
    --~ stack traceback:
        --~ introspective.lua:103: in upvalue 'callback'
        --~ introspective.lua:109: in local 'traveller'
        --~ introspective.lua:121: in upvalue 'demoTraceback'
        --~ introspective.lua:128: in local 'run'
        --~ introspective.lua:132: in main chunk
        --~ [C]: in ?
    
    local function callback(idx, n)
        assert(n)
        assert(n.name)
        if idx == 2 then
            --~ print_traceback(traceback())
            --~ print(debug.traceback())
        end
    end
    
    local function traveller(nodeList, cb)
        for idx, node in ipairs(nodeList) do
            callback(idx, node)
        end
    end
    
    local function nodeFactory(size)
        local t = {}
        for i = 1, size do
            t[#t + 1] = {name=string.format("node%s", i)}
        end
        return t
    end
    
    traveller(nodeFactory(3), callback)
end


local function run()
    demoInspectFunction()
    demoInspectStackLevel()
    demoTraceback()
end


run()

