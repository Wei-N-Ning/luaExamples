-- compile this source file to a binary (opcodes):
-- luac -o /tmp/prog.lc ./compilation.lua

-- then execute the binary:
-- lua /tmp/prog.lc


function loadSourceFileExpectSuccess()
    local _ =  [[
function run()
    print("called")
end

run()
    ]]
    local filePath = "/tmp/lua_compilation_success.lua"
    local f = assert(io.open(filePath, "w"))
    f:write(_)
    f:close()
    local func = assert(loadfile(filePath))
    func()
end


function loadSourceFileExpectFailure()
    local _ =  [[
function -- run()
    print("called")
end

run()
    ]]
        local filePath = "/tmp/lua_compilation_failure.lua"
    local f = assert(io.open(filePath, "w"))
    f:write(_)
    f:close()
    
    -- assert error
    --~ local func = assert(loadfile(filePath))
end


function run()
    loadSourceFileExpectSuccess()
    loadSourceFileExpectFailure()
end


run()
