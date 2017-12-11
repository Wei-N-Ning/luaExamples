

-- name: str
-- parentNode (optional): Node
-- return: Node
-- .name
-- .parent
local function createNode(name, parentNode)
    local node = {
        ["name"]=name,
        ["parentNode"]=parentNode,
        ["childNodes"]={},
    }
    setmetatable(node.childNodes, {__mode="v"})
    if parentNode ~= nil then
        parentNode.childNodes[#parentNode.childNodes + 1] = node 
    end
    return node
end


-- visit every node in the graph using bfs, 
-- cb: a callback function taking one node object as the only argument 
local function iterNodeGraph(node, cb)
    
    local function createEmptyQueue()
        return {first = 0, last = -1}
    end
    
    local function qsize(q)
        return q.last - q.first + 1
    end
    
    local function append(q, value)
        local last = q.last + 1
        q.last = last
        q[last] = value
    end
    
    local function pop(q)
        local last = q.last
        if q.first > last then
            error("Queue is empty")
        end
        local v = q[last]
        q[last] = nil
        q.last = last - 1
        return v
    end
    
    local nodes = createEmptyQueue()
    append(nodes, node)
    while qsize(nodes) > 0 do
        local oneNode = pop(nodes)
        cb(oneNode)
        local childNodes = oneNode.childNodes or {}
        for _, childNode in ipairs(childNodes) do
            append(nodes, childNode)
        end
    end
    
end


local function createCapturePackage()
    local capturePackage = createNode("e1m1")
    local clip = createNode("clip", capturePackage)
    local imp01 = createNode("imp01", capturePackage)
    local gun01 = createNode("gun01", capturePackage)
    local imp01Media = createNode("imp01Media", clip)
    local gun01Media = createNode("gun01Media", clip)
    return capturePackage
end


local function demoSceneGraph()
    local function prt(node)
        --~ print(string.format("node(%s)", node.name))
    end
    
    local capturePackage = createCapturePackage()
    
    iterNodeGraph(capturePackage, prt)
    
    local nodes = {}
    
    local function addNodeToList(n)
        nodes[#nodes + 1] = n
    end
    assert(0 == #nodes)
    iterNodeGraph(capturePackage, addNodeToList)
    assert(6 == #nodes)
end


-- this demo uses a table with weak-keys
-- as the Lua Book explains, this scenario can implement classic
-- memoize (function return value cache)
local function demoTableWithWeakKeys()
    local metatable = {__mode="k"}
    local l = {}
    setmetatable(l, metatable)
    local function size()
        local s = 0
        for k, v in pairs(l) do
            if k.name ~= nil then
                s = s + 1
            end
        end
        return s
    end
    l[createNode("imp01")] = 1
    assert(1 == size())
    
    -- no reference remains to the annoymous node
    collectgarbage()
    assert(0 == size())
    
    -- Lua Book:
    -- consider an entry (k,v) in an ephemeron table.
    -- The reference to v is only strong if there is some other external 
    -- reference to k. Otherwise, the collector will eventually collect 
    -- k and remove the entry from the table, even if v refers 
    -- (directly or indirectly) to k
end


local function demoTableWithWeakValues()
    local function findChild(n, childName)
        for _, childNode in pairs(n.childNodes) do
            if childNode.name == childName then
                return childNode
            end
        end
        return nil
    end
    
    local p = createCapturePackage()
    local n = findChild(p, "gun01")
    assert(n)
    
    -- equivalent to "del n" in Python
    n = nil
    collectgarbage()
    local n = findChild(p, "gun01")
    assert(n == nil)
    
    -- however because other nodes, imp01, clip and its child nodes 
    -- do not have any named-references either, after the call to
    -- collectgarbage() they will also be recycled!
    assert(findChild(p, "imp01") == nil)
end


local function run()
    demoSceneGraph()
    demoTableWithWeakKeys()
    demoTableWithWeakValues()
end


run()

