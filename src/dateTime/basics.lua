

function osTime()
    -- current time
    assert(os.time() > 0)
    
    -- convert the table repr to an integer
    assert(os.time({year=1, month=1, day=1, hour=1, min=1, sec=20}) > 
           os.time({year=1, month=1, day=1, hour=1, min=1, sec=19}))
end


function osDate()
    -- default string repr
    print(os.date())
    
    -- string formatter
    print(os.date("%Y_%m_%d"))
    
    -- table repr
    for k, v in pairs(os.date("*t")) do
        --~ print(k, v)
    end
end


function run()
    osTime()
    osDate()
end


run()

