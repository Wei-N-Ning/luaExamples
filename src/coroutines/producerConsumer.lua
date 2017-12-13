
-- alternatively the producer consumer model could be implemented using: 

-- chain of responsibility (handler)
-- factory and callback 
-- builders
-- ...

-- in these cases it is very clear who the boss is


local goods = {}
local cargo = {}


local function initializeGoods()
    for i = 1, 10 do
        goods[#goods + 1] = i
    end
end


local function emptyCargo()
    cargo = {}
end


local function send(x)
    coroutine.yield(x)
end


local function receive(p)
    local status, value = coroutine.resume(p)
    
    -- this is not strictly necessary, but will make the code 
    -- cleaner; if any error happens in the producer routine, the  
    -- status variable will be false
    if status == false then
        return nil
    end
    return value
end


local function producerFunc()
    for i = 1, #goods do
        send(i)
        
        -- try deliberately throw an error here and observe how the 
        -- consumer coroutine (the receive() function) handles that
        --~ error("something wrong happens")
    end
end


-- p for producer coroutine
local function consumerFunc(p)
    while true do
        local value = receive(p)
        if value == nil then
            break
        end
        cargo[#cargo + 1] = value * -1
    end
end


-- p for producer coroutine
-- this function create another coroutine: a filter coroutine
-- the filter logic could also be implemented as a callback or a policy 
-- object that is injected in the producer
local function createFilter(p)
    local function _()
        while true do
            local value = receive(p)
            if value == nil then
                break
            end
            if value % 4 == 0 then
                send(value)
            end
        end
    end
    return coroutine.create(_)
end


local function demoProducerConsumer()
    local p = coroutine.create(producerFunc)
    consumerFunc(p)
    assert(10 == #cargo)
end


local function demoProducerConsumerFilter()
    local p = coroutine.create(producerFunc)
    consumerFunc(createFilter(p))
    assert(2 == #cargo)
end


local function run()
    initializeGoods()
    demoProducerConsumer()
    emptyCargo()
    demoProducerConsumerFilter()
end


run()

