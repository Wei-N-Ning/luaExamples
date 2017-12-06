
function Entry(...)
    print(table.concat(..., ", "))
end


function useLuaFileAsDataFile()
    -- Entry function must be visible to the file "example.dat", i.e.
    -- in the global scope
    dofile("example.dat")
end


function safeFormatNumericVariable()
    local fmt = {["integer"]="%d", ["float"]="%a"}
    local values = {3.1415926535897932384626, 0xDEADBEEF}
    for _, v in ipairs(values) do
        print(string.format(fmt[math.type(v)], v))
        print(string.format("%q", v))
    end
end


function safeFormatString()
    local a = 'a "problematic" \\string'
    print(string.format("%q", "os.execute1('rm1 *')"))
    print(string.format("%q", a))
end


function run()
    useLuaFileAsDataFile()
    safeFormatNumericVariable()
    safeFormatString()
end


run()
