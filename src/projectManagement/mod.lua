

function displayLoadedModules()
    --~ string	table: 0x1f45df0
    --~ _G	table: 0x1f459f0
    --~ math	table: 0x1f49cc0
    --~ table	table: 0x1f48140
    --~ bit32	table: 0x1f4b830
    --~ package	table: 0x1f47470
    --~ debug	table: 0x1f48e00
    --~ os	table: 0x1f480b0
    --~ utf8	table: 0x1f4aba0
    --~ io	table: 0x1f48410
    --~ coroutine	table: 0x1f45770
    
    for k, v in pairs(package.loaded) do
        --~ print(k, v)
    end
end


function displayPackagePath()
    --~ /usr/local/share/lua/5.3/
    --~ .lua
    --~ /usr/local/share/lua/5.3/
    --~ /init.lua
    --~ /usr/local/lib/lua/5.3/
    --~ .lua
    --~ /usr/local/lib/lua/5.3/
    --~ /init.lua
    --~ /usr/share/lua/5.3/
    --~ .lua
    --~ /usr/share/lua/5.3/
    --~ /init.lua
    --~ ./
    --~ .lua
    --~ ./
    --~ /init.lua

    for k in string.gmatch(package.path, "[^?;]+") do
        print(k)
    end
end


function run()
    displayLoadedModules()
    displayPackagePath()
end


run()
