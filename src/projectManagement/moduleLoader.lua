
-- from Lua Book:
-- Nevertheless, currently I still prefer the original basic method. 
-- It may need more work, but the resulting code states clearly what it 
-- does. To avoid creating a global by mistake, I use the simple method 
-- of assigning nil to _ENV. After that, any assignment to a global name 
-- will raise an error. This approach has the extra advantage that it 
-- works without changes in older versions of Lua.


-- see src/environments/envs.lua for more details


local foobar = require "foobar"
local meat = require "packages.meat"


function expectSymbolsInModuleNamespace()
    foobar.initialize()
    foobar.test()
end


function expectSymbolsInSubModuleNamespace()
    assert(0xDEAD == meat.beaf)
end


function demoLoadfileUsingSandboxEnvironment()
    -- if "critical" is lower than 0, something crashes 
    local sb_env = {["critical"]=10}
    loadfile("foobar.lua", "t", sb_env)()
    
    -- verify that only the sandbox environment is affected by the
    -- malicious code
    assert(-1 == sb_env.critical)
end


function run()
    expectSymbolsInModuleNamespace()
    expectSymbolsInSubModuleNamespace()
end


run()
