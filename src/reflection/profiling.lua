
--~ For a timing profile, it is better to use the C interface:
--~ the overhead of a Lua call for each hook is too high and may 
--~ invalidate any measurement. However, for
--~ counting profiles, Lua code does a decent job.


local function prt(t)
    for k, v in pairs(t) do
        print(k, v)
    end
end


local function demoProfileFunctionCallCounts()
    local counters = {}
    local names = {}
    
    local function sut()
    end
    
    local function hook()
        local f = debug.getinfo(2, "f").func
        local count = counters[f]
        if count == nil then
            counters[f] = 1
            names[f] = debug.getinfo(2, "Sn").short_src
        else
            counters[f] = count + 1
        end
    end
    
    debug.sethook(hook, "c")
    for i = 1, 10 do
        sut()
    end
    debug.sethook()
    
    prt(counters)
    prt(names)
end


local function run()
    demoProfileFunctionCallCounts()
end


run()

