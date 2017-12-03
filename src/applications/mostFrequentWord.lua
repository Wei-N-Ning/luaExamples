
function resourcesDir()
    local pwd = io.popen("pwd"):read()
    local firstIdx, lastIdx = string.find(pwd, "luaExamples")
    return string.sub(pwd, 0, lastIdx).."/resources"
end


function testResourceFile(fileName)
    local filePath = resourcesDir().."/"..fileName
    local f = io.open(filePath, "r")
    assert(f)
end


function run()
    testResourceFile("texts/COPYING.GPL")
end


run()


