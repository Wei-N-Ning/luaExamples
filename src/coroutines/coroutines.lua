
local function foo()
end


local function compute()
    
    -- From the coroutine's point of view, all activity that happens 
    -- while it is suspended is happening inside its call to yield. 
    -- When we resume the coroutine, this call to yield finally returns 
    -- and the coroutine continues
    
    coroutine.yield()
    local s = 0
    for i in 1, 10 do
        s = s + i
    end
    return s
end


local function demoCreateAndStartCoroutine()
    local cor = coroutine.create(foo)
    assert("thread" == type(cor))
    assert("suspended" == coroutine.status(cor))
    coroutine.resume(cor)
    assert("dead" == coroutine.status(cor))
end


local function demoSuspendAndResumeComputation()
    local cor = coroutine.create(compute)
    coroutine.resume(cor)
    assert("suspended" == coroutine.status(cor))
    coroutine.resume(cor)
    assert("dead" == coroutine.status(cor))
end


local function demoExchangeDataBetweenResumeAndYield()
    local function createFoo(num)
        for i = 1, num do
            coroutine.yield({id=i})
        end
    end
    
    local function eatFoo(foo)
        print(string.format("eat foo with id (%s)", foo.id))
    end
    
    local factory = coroutine.create(createFoo)
    local consumer = coroutine.create(eatFoo)
    coroutine.resume(consumer, {id=1})
    assert(true, 1 == coroutine.resume(factory, 1))
end


function run()
    demoCreateAndStartCoroutine()
    demoSuspendAndResumeComputation()
    demoExchangeDataBetweenResumeAndYield()
end


run()
