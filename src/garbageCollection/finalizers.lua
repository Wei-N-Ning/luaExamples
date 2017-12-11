
global_lock = false


local function createRAIILock()
    local metatable = {
        __gc = function (o)
            global_lock = false
        end
    }
    global_lock = true
    local lock = {}
    setmetatable(lock, metatable)
end


local function demoRAIILock()
    assert(global_lock == false)
    do
        local lock = createRAIILock()
        assert(global_lock == true)
    end
    
    -- why it needs an explicit call to the garbage collector ??
    -- isn't scoped variable deleted automatically ??
    -- answer: Lua Book P204 - P205 (controlling the pace of collection)
    collectgarbage()
    assert(global_lock == false)
end


local function run()
    demoRAIILock()
end


run()

