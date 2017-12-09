
function foo()
end


function demoCreateCoroutine()
    local cor = coroutine.create(foo)
end


function trace(event, line)
    print(event, line)
end


function run()
    debug.sethook(trace, "l")
    demoCreateCoroutine()
end


run()
