

function constructSinglyLinkedList()
    local list = nil
    for i = 1, 5 do
        list = {next = list, value = i}
    end
    return list
end


-- cb: a callback function taking one value at a time
function iterateThroughSinglyLinkedList(sl, cb)
    while sl do
        cb(sl.value)
        sl = sl.next
    end
end


function callback(v)
    print(v)
end


function run()
    local sl = constructSinglyLinkedList()
    iterateThroughSinglyLinkedList(sl, callback)
end


run()
