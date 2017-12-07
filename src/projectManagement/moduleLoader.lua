

local foobar = require "foobar"
local meat = require "packages.meat"


function expectSymbolsInModuleNamespace()
    foobar.initialize()
    foobar.test()
end


function expectSymbolsInSubModuleNamespace()
    assert(0xDEAD == meat.beaf)
end


function run()
    expectSymbolsInModuleNamespace()
    expectSymbolsInSubModuleNamespace()
end


run()
