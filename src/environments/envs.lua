

function demoPrintAllGlobalVariables()
    
    -- lots of stuffs 
    for k, v in pairs(_G) do
        --~ print(k, v)
    end
    
    -- even more stuffs
    for k, v in pairs(_ENV) do
        --~ print(k, v)
    end
end


function demoAccessENVFields()
    -- verify that the built-in symbols are stored in the global table
    assert(_ENV.pairs)
    
    
    -- verify that a newly created "free varible" is stored in _ENV
    -- The Lua compiler translates any free name x in the chunk to _ENV.x
    assert(_ENV_abobo == nil)
    abobo = 10
    assert(_ENV.abobo == 10)
    
end


function demoGAndEnv()
    
    -- Usually, _G and _ENV refer to the same table but, despite that, 
    -- they are quite different entities. _ENV is a local variable, and 
    -- all accesses to “global variables” in reality are accesses to it. 
    -- _G is a global variable with no special status whatsoever. 
    -- By definition, _ENV always refers to the current environment; _G 
    -- usually refers to the global environment, provided it is visible 
    -- and no one changed its value.
    
    abobo = 10
    assert(_G.abobo == _ENV.abobo)
    
    -- eliminate the free variable
    _G.abobo = nil
    assert(_G.abobo == nil)
    
    -- eliminate the local reference to the global table;
    -- after that _G becomes inaccessible meaning that
    -- ALL the built-in symbols are no longer available!!
    _ENV = nil
    
    local a = 1
end


function run()
    demoPrintAllGlobalVariables()
    demoAccessENVFields()
    demoGAndEnv()
end


run()

