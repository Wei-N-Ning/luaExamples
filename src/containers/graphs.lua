
function resourcesDir()
    local pwd = io.popen("pwd"):read()
    local firstIdx, lastIdx = string.find(pwd, "luaExamples")
    return string.sub(pwd, 0, lastIdx).."/resources"
end


function resourceFile(fileName)
    return resourcesDir().."/"..fileName
end


function testResourceFile(fileName)
    local filePath = resourceFile(fileName)
    local f = io.open(filePath, "r")
    assert(f)
    f:close()
end


function parseNodeLine(line)
    print("Node", line)
end


function parseConnectionLine(line)
    print("Connection", line)
end


function parseCommentLine(line)
end


function parseGraphDocument(fileName)
    local filePath = resourceFile(fileName)
    local f = io.open(filePath, 'r')
    local sectionParsers = {
        ["node"]=parseNodeLine, 
        ["conn"]=parseConnectionLine,
    }
    local currentSection = ""
    for line in f:lines() do
        if string.match(line, "^:Node") then
            currentSection = "node"
        elseif string.match(line, "^:Connection") then
            currentSection = "conn"
        elseif string.match(line, "^%#") then
            parseCommentLine(line)
        elseif string.match(line, "%w+") == nil then
        else
            sectionParsers[currentSection](line)
        end
    end
end


function run()
    testResourceFile("documents/simpleGraph.txt")
    local n = parseGraphDocument("documents/simpleGraph.txt")
end


run()
