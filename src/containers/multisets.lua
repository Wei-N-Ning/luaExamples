

function createMultiset(l)
    local ms = {}
    for _, k in pairs(l) do
        ms[k] = 1
    end
    return ms
end


function reduce(ms, e)
    local v = ms[e]
    if v ~= nil then
        v = v - 1
        if v > 0 then
            ms[e] = v
        else
            ms[e] = nil
        end
    end 
end


function add(ms, e)
    local v = ms[e]
    ms[e] = (v or 0) + 1
end


function testCreateMultiset()
    local ms = createMultiset({"doom", "duke3d", "wolf3d"})
    assert(ms["doom"])
end


function testReduceElement()
    local ms = createMultiset({"doom", "duke3d", "wolf3d"})
    assert(ms["doom"])
    reduce(ms, "doom")
    assert(ms["doom"] == nil)
    add(ms, "doom")
    add(ms, "doom")
    assert(ms["doom"] == 2)
    reduce(ms, "doom")
    reduce(ms, "doom")
    assert(ms["doom"] == nil)
end


function run()
    testCreateMultiset()
    testReduceElement()
end


run()
