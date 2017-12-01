
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


-- expecting the signature of f() to be f(double) -> double 
function derivative(f, delta)
    delta = delta or 1e-8
    local function _(x)
        return (f(x + delta) - f(x)) / delta
    end
    return _
end


function derivativeDemo()
    local function f(x)
        return 2 * x * x + 10  -- 2 * x^2 + 10, whose derivative is 4x
    end
    local d = derivative(f, 1e-10)  -- beware of the precision limit
    print(f(10))
    print(d(10)) -- 4 * 10
    
    print(math.cos(5.2))
    print(derivative(math.sin)(5.2))
end


-- Lua's OO programming
function methodStyleLocalFunctions()
    local operation = {}
    function operation.setUp()
    end
    function operation.tearDown()
    end
    operation.setUp()
    operation.tearDown()
end


function run()
    functionIsFirstClass()
    lambdaFunction()
    
    derivativeDemo()
    methodStyleLocalFunctions()
end


run()
