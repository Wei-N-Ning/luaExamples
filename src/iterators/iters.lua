

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


function run()
    demoIterateOverNumbers()
    demoIterateOverArbitraryElements()
    
end


run()

