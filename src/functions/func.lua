
-- if the caller does not set the value of these 
-- two arguments, their values will be nil
function undefinedArguments(notSet1, notSet2)
    --~ print(notSet1, notSet2)
end


-- an ungraded version of the above demo to show how to set default
-- argument values
function defaultArguments(a, b)
    a = a or 1
    b = b or "size"
    assert(a ~= nil and b ~= nil)
end


-- this demo shows how Lua assigns the function return values to
-- caller supplied variables
--
-- Lua always adjusts the number of results  from a function to the 
-- circumstances of the call
--
-- it reminds me Golang!!
-- and I attempt to reuse the Golang pattern here
function multipleReturnValues()
    function sut()
        return 1, 2
    end
    assert(sut() == 1)
    a, b = sut()
    assert(a == 1 and b == 2)
    a, b, c = sut()
    assert(a == 1 and b == 2 and c == nil)
    
    -- return:
    -- an int and an optional error msg
    -- if there is no error, the second argument will be nil
    function compute(i)
        if i ~= 0 then
            return 100 / i 
        end
        return 0, "error: divide by zero"
    end
    ret, _ = compute(0)
    if (_ ~= nil) then
        print(_)
    end
    ret, _ = compute(1)
    assert(_ == nil)
end


-- beware that there is no type check per-v
function variadicAdd(...)
    local s = 0
    for _, v in ipairs{...} do
        s = s + v
    end
    return s
end


function run()
    undefinedArguments()
    undefinedArguments(1, 2)
    
    defaultArguments()
    defaultArguments(10, "radius")
    
    multipleReturnValues()
    
    assert(variadicAdd(-1, 1, -10, 11) == 1)
end

run()
