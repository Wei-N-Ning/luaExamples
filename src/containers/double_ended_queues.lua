
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


function iterateQueue(q, cb)
    for idx = q.first, q.last do
        cb(q[idx])
    end
end


function callback(v)
    print(v)
end


function run()
    local q = createEmptyQueue()
    pushLeft(q, 121)
    append(q, 312)
    iterateQueue(q, callback)
end


run()

