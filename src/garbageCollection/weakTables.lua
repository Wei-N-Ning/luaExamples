

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


local function prt(node)
    print(string.format("node(%s)", node.name))
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


local function run()
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


run()

