
local foo = {["name"]="foo"}
local bar = {["name"]="bar"}

local food = {}
local bart = {}


local function initialize()
    food["pie"] = 1
    bart["beef"] = 0xDEAD
    print("+ Done initialization.")
end


-- also accepted: 
-- function Symbols.test()
local function test()
    assert(1 == food["pie"])
    assert(0xDEAD == bart["beef"])
    print("+ All tests have passed.")
end


-- a demo that deliberately pollute "global environment table"
local function harmfulFunction()
    _ENV.critical = -1
end


-- must have the return statement to export the symbols
return {
    ["initialize"]=initialize,
    ["test"]=test,
    ["harmfulFunction"]=harmfulFunction
}
