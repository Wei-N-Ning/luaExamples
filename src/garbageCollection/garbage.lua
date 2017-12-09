
function demoFinalizer()
    local raii = {name="doom"}
    local function destructor(raii)
        print("called destructor")
    end
    setmetatable(raii, {__gc=destructor})
end


function run()
    demoFinalizer()
end


run()
