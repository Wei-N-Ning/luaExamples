-- Because of its emphasis on portability and embeddability, 
-- Lua itself does not offer much in terms of facilities to 
-- communicate with the external world. Most I/O in real Lua 
-- programs is done either by the host application or through 
-- external libraries not included in the main distribution

function demoFileWrite(text, filePath)
    local f = assert(io.open(filePath, "w"))
    f:write(text)
    f:close()
end


function demoFileRead(filePath)
    local f = assert(io.open(filePath, "r"))
    local t = f:read("a")
    f:close()
    return t
end


-- go-style: catch returned error object
function saveRead(filePath)
    local f, err = io.open(filePath, "r")
    if (f == nil) then
        return ""
    end
    local t = f:read("a")
    f:close()
    return t
end


function assertRead(filePath)
    local f = assert(io.open(filePath, "r"))
    local t = f:read("a")
    f:close()
    return t
end


function run()
    demoFileWrite("thereisnospoon\n", "/tmp/demo")
    assert("thereisnospoon\n" == demoFileRead("/tmp/demo"))
    assert("" == saveRead("/non/existing/file/path"))
    assert("thereisnospoon\n" == saveRead("/tmp/demo"))
    
    -- throw an assertion error with meaningful error messages
    --~ assertRead("asd")  
end


run()
