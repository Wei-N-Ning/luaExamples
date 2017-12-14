
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
    for level = 1, math.huge do
        
    end
end


local function demoTraceback()
end


local function run()
    demoInspectFunction()
    demoInspectStackLevel()
    demoTraceback()
end


run()

