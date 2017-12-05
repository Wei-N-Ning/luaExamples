

function testTableConcat()
    assert("" == table.concat({"", ""}))
    assert("a" == table.concat({"", "a"}))
    assert("1" == table.concat({1, ""}))
    assert("12" == table.concat({1, 2}))
    assert("1+2" == table.concat({1, 2}, "+"))
    
    -- invalid value (table) at index 1 in table for 'concat'
    --~ assert(table.concat({{1, 2}, {3, 4}}))
end


function concatStringFast()
    local _ = {}
    for i = 1, 10000 do
        _[i] = i
    end
    local s = table.concat(_)
    assert((9 + 90 * 2 + 900 * 3 + 9000 * 4 + 5)  == #s)
end


function run()
    testTableConcat()
    concatStringFast()
end


run()

