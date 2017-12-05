
-- creates a reversed table (from k: v pairs to v: k pairs)
function reversed(t)
    local rt = {}
    for k, v in pairs(t) do
        rt[v] = k
    end
    return rt
end


function testCreateReversedTable()
    local t = {doom=1992, doom2=1993}
    local rt = reversed(t)
    assert("doom" == rt[1992])
    assert("doom2" == rt[1993])
end


function run()
    testCreateReversedTable()
end


run()
