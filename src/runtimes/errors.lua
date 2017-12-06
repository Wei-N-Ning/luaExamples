

function errorHandlingDemo()
    
    -- Lua book:
    -- Suppose we want to run a piece of Lua code and to catch any 
    -- error raised while running that code. Our first step is to 
    -- encapsulate that piece of code in a function;
    
    -- annoymous function is executed automatically
    local ok, msg = pcall(
        function ()
            error("asd")
        end
    )
    print(ok)
    print(msg)
end


function run()
    errorHandlingDemo()
end


run()
