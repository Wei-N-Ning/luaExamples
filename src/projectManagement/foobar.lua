
local foo = {["name"]="foo"}
local bar = {["name"]="bar"}

local food = {}
local bart = {}


local function initialize()
    food["pie"] = 1
    bart["beef"] = 0xDEAD
    print("+ Done initialization.")
end


local function test()
    assert(1 == food["pie"])
    assert(0xDEAD == bart["beef"])
    print("+ All tests have passed.")
end


initialize()
test()
