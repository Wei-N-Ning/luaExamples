

local function ClassA()
    local mt = {
        __tostring = function (a)
            return "<ClassA instance>"
        end
    }
    local t = {"shots", "darts", "slug", "HE"}
    setmetatable(t, mt)
    return t
end


local function demoToString()
    local a = ClassA()
    assert("<ClassA instance>" == string.format("%s", a))
end


local function demoArrayLikeAccess()
    local a  = ClassA()
    assert("slug" == a[3])
end


local function run()
    demoToString()
    demoArrayLikeAccess()
end


run()
