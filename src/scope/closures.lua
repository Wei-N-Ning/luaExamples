
function functionIsFirstClass()
    local function _()
    end
    print(_)  -- function: 0xABCD...
end


function lambdaFunction()
    local products = {}
    local function _publish()
        for i = 1, 3 do
            products[#products + 1] = string.format("impME%02d", i)
        end
    end
    _publish()
    assert(3 == #products)
    assert("impME03" == products[3])
end


function run()
    functionIsFirstClass()
    lambdaFunction()
end


run()
