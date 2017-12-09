

function demoPrintAllGlobalVariables()
    
    -- lots of stuffs 
    for k, v in pairs(_G) do
        --~ print(k, v)
    end
end


function run()
    demoPrintAllGlobalVariables()
end


run()

