

function forLoopDemo()
    for i=1, 8 do
        if (i % 2 == 1) then
            --~ print(i)
        end
    end
end


function whileLoopDemo(t)
    local idx = 1
    while t[idx]  ~= nil do
        print(t[idx])
        idx = idx + 1
    end
end


function run()
    forLoopDemo()
    whileLoopDemo({1, 2, 3})
end


run()
