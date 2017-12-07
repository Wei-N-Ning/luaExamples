

local foobar = require "foobar"


function expectSymbolsInModuleNamespace()
    foobar.initialize()
    foobar.test()
end


function run()
    expectSymbolsInModuleNamespace()
end


run()
