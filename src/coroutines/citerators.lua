
local numbers = {}


local function initializeNumbers(size)
    for i = 1, size do
        numbers[#numbers + 1] = i
    end
end


local function iter()
    local function _()
        for i = 1, #numbers do
            coroutine.yield(numbers[i])
        end
    end
    return coroutine.wrap(_)
end


local function run()
    initializeNumbers(4)
    for i in iter() do
        print(i)
    end
end


run()
