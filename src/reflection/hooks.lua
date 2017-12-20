

-- note that the hook is triggered EVERYTIME a function is called
local function demoHookFunctionCall()
    local function sut(arg)
    end
    
    local function hook(arg)
        print(arg)
    end
    
    debug.sethook(hook, "c")
    sut(1)
    debug.sethook()
end


local function demoHookFunctionReturn()
    local function sut(arg)
    end
    
    local function hook(arg)
        print(arg)
    end
    
    debug.sethook(hook, "r")
    sut(1)
    debug.sethook()
end


local function run()
    demoHookFunctionCall()
    demoHookFunctionReturn()
end


run()
