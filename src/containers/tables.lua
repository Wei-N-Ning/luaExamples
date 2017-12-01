
--~ this demo shows that table indices can be of different types
function createTable()
    t = {}
    t["ak74.damage"] = 30.2
    t["ak74.clipSize"] = 32
    t["id"] = 11
    t[0] = 0x11
    assert(t[0] == 0x11)
end


-- initialization list
function initTable()
    t = {"fxMotion", "bodyMotion"}
    assert(t[1] == "fxMotion")
    assert(#t == 2) -- a sequence's length is greater than 0
    t2 = {action = "publish"}
    assert(t2.action == "publish")
    t2.action = nil
    assert(t2.action == nil)
    t3 = {["+"] = "add", ["*"] = "mult"}
    assert(#t3 == 0) -- non-sequence's length is 0
    assert(t3["+"] == "add")
    t3["+"] = nil
    assert(t3["+"] == nil)
end


-- the definition of sequence
-- iterate over all the members of a sequence
function sequenceBasics()
    seq = {"imp01", "renderCam01", "archville01"}
    seq[#seq + 1] = "crate01" -- append new element to a sequence
    assert(#seq == 4)
    for k, v in pairs(seq) do
        --~ print(k, v)
    end
    for k, v in ipairs(seq) do
        --~ print(k, v)
    end
    for k=1, #seq do
        --~ print(k, seq[k])
    end
    table.insert(seq, "barrel01")
    assert(#seq == 5 and seq[5] == "barrel01")
    
    assert("barrel01" == table.remove(seq) and #seq == 4)
end


-- move elements in a sequence
-- use move operation to implement efficient insert and remove
function sequenceMove()
    
end


-- unpack a list to variables
function demoTableUnpack()
    a, b = table.unpack{10, 20, 30}
    assert(a == 10 and b == 20)
end


-- access the member using the dot-operator
function attributeStyleTable()
    local a = {
        name = "imp"
    }
    assert("imp" == a.name)
    print(a)
end


function run()
    createTable()
    initTable()
    sequenceBasics()
    sequenceMove()
    
    demoTableUnpack()
    attributeStyleTable()
end


run()
