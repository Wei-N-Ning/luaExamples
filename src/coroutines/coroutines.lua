
function foo()
end


function demoCreateCoroutine()
    local cor = coroutine.create(foo)
    assert("thread" == type(cor))
    assert("suspended" == coroutine.status(cor))
end


function run()
    demoCreateCoroutine()
end


run()
