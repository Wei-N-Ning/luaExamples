

-- factory for iterators
-- takes a "sequence" (borrowing Python's terminology)
-- returns an iterator
function iter(sequence)
    local idx = 0
    local function _()
        idx = idx + 1
        return sequence[idx]
    end
    return _
end


function range(...)
    local arg1, arg2, arg3 = ...
    assert(arg1 ~= nil, "require at least one numeric value")
    local start_ = 1
    local end_ = -1
    if arg1 ~= nil and arg2 ~= nil then
        start_ = arg1
        end_ = arg2
    else
        end_ = arg1
    end
    local inc_ = arg3 or 1
    local list = {}
    if inc_ > 0 then
        while start_ < end_ do
            list[#list + 1] = start_
            start_ = start_ + inc_
        end
    else
        while start_ > end_ do
            list[#list + 1] = start_
            start_ = start_ + inc_
        end
    end
    return list
end


function demoIterateOverNumbers()
    -- also works with floating point values - a side effect of this 
    -- iterator
    local l = range(16, 13, -2)
    local i = iter(l)
    for element in i do
        print(element)
    end
end


function demoIterateOverArbitraryElements()
    local s = {"this", "is", "awesome"}
    local i = iter(s)
    for element in i do
        print(element)
    end
end


function demoIteratorInternals()
    -- see Lua book P158
    -- if our iterator function is f, the invariant state is s, and the 
    -- initial value for the control variable is a 0 , the control 
    -- variable will loop over the values 
    -- a 1 = f(s, a 0 ), 
    -- a 2 = f(s, a 1 ), 
    -- and so on, until a i is nil
    
    local _f, _s, _var, _ = pairs({name="crash", age=13})
    
    -- the order of the k-v pairs can be different for each run!
    -- name crash 
    _var, _ = _f(_s, _var)
    --~ print(_var, _)  
    -- age 13
    _var, _ = _f(_s, _var)
    --~ print(_var, _)  
    -- nil nil
    _var, _ = _f(_s, _var)
    --~ print(_var, _)  
end


function demoIteratorRollForward()
    local t = {name="wreck", height=6.3, weight=230.0}
    
    -- the first k-v pair in arbitrary order
    local k, v = next(t, nil)
    --~ print(k, v)
    
    -- the second k-v pair in arbitrary order
    k, v = next(t, k)
    --~ print(k, v)
end


function run()
    demoIterateOverNumbers()
    demoIterateOverArbitraryElements()
    demoIteratorInternals()
    demoIteratorRollForward()
end


run()

