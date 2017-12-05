
function createEmptyQueue()
    return {first = 0, last = -1}
end


function pushLeft(q, value)
    local first = q.first - 1
    q.first = first
    q[first] = value
end


function append(q, value)
    local last = q.last + 1
    q.last = last
    q[last] = value
end


function popLeft(q)
    local first = q.first
    if first > q.last then
        error("Queue is empty")
    end
    local v = q[first]
    q[first] = nil
    q.first = first + 1
    return v
end


function pop(q)
    local last = q.last
    if q.first > last then
        error("Queue is empty")
    end
    local v = q[last]
    q[last] = nil
    q.last = last - 1
    return v
end


function qsize(q)
    return q.last - q.first + 1
end


function iterateQueue(q, cb)
    for idx = q.first, q.last do
        cb(q[idx])
    end
end


function callback(v)
    print(v)
end


function testAddNewElements()
    local q = createEmptyQueue()
    pushLeft(q, 121)
    append(q, 312)
    assert(2 == qsize(q))
    iterateQueue(q, callback)
end


function testRemoveElements()
    local q  = createEmptyQueue()
    
    -- Error: Queue is empty
    --~ popLeft(q)
    --~ pop(q)
    
    assert(0 == qsize(q))
    
    for i = 1, 5 do
        append(q, i)
    end
    
    assert(5 == qsize(q))
    assert(1 == popLeft(q))
    assert(2 == popLeft(q))
    assert(3 == popLeft(q))
    assert(2 == qsize(q))
    
    for i = 10, 13 do
        pushLeft(q, i)
    end
    
    assert(6 == qsize(q))
    assert(5 == pop(q))
    assert(4 == pop(q))
    assert(10 == pop(q))
    assert(3 == qsize(q))
    
end


function run()
    testAddNewElements()
    testRemoveElements()
end


run()

