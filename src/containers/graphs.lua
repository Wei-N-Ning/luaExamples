
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


-- g.root; g.nodes
function createGraph()
    local g = {}
    return g
end


function parseNodeLine(line, graph)
    local node = {id=nil, name=nil, adj={}}
    for t in string.gmatch(line, "[^,]+") do
        if string.match(t, "^%d+$") then
            node["id"] = t
        else
            -- %s space characters
            -- The pattern '.-' will expand the least amount
            node["name"] = string.match(t, "^%s*(.-)%s*$")
        end
    end
    local nodes = graph["nodes"] or {}
    nodes[#nodes + 1] = node
    graph["nodes"] = nodes
end


function parseConnectionLine(line, graph)
    local nodes = graph["nodes"]
    if nodes == nil then
        return
    end
    local nodeIds = {}
    for nodeId in string.gmatch(line, "%d+") do
        nodeIds[#nodeIds + 1] = nodeId
    end
    if #nodeIds <= 1 then
        return
    end
    local from = nodes[tonumber(nodeIds[1]) + 1]
    for i, nodeId in ipairs(nodeIds) do
        if i > 1 then
            local adj = from["adj"]
            adj[#adj + 1] = nodeId
        end
    end
end


function parseCommentLine(line, graph)
    --~ print("Comment", line)
end


function parseGraphDocument(fileName)
    local filePath = resourceFile(fileName)
    local f = io.open(filePath, 'r')
    
    -- section parsers are functions whose interface is:
    -- func(line, graph)
    local sectionParsers = {
        ["node"]=parseNodeLine, 
        ["conn"]=parseConnectionLine,
    }
    local currentSection = ""
    local graph = {}
    
    for line in f:lines() do
        if string.match(line, "^:Node") then
            currentSection = "node"
        elseif string.match(line, "^:Connection") then
            currentSection = "conn"
        elseif string.match(line, "^%#") then
            currentSection = "comm"
            parseCommentLine(line, graph)
        elseif string.match(line, "%w+") == nil then
        else
            sectionParsers[currentSection](line, graph)
        end
    end
    
    return graph
end


function iterateNodes(g, callback)
    local nodes = g["nodes"]
    if nodes ~= nil then
        for _, n in ipairs(nodes) do
            callback(n)
        end
    end
end


function printNode(n)
    print("Node: ", n["id"], n["name"])
    print("    Connected to: ", table.concat(n["adj"], "; "))
end


function run()
    testResourceFile("documents/simpleGraph.txt")
    local g = parseGraphDocument("documents/simpleGraph.txt")
    iterateNodes(g, printNode)
end


run()
