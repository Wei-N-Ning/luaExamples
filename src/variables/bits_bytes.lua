
function bitwiseOps()
    --~ print(string.format("%X", 0x0001 | 0x0010))
    --~ print(string.format("%X", 0x0001 & 0x0010))
end


function dataPacking()
    local d = string.pack("iii", 999, 120, 127)
    
    local val, idx  = string.unpack("i", d, nil)
    print(val, idx)
end


function dataUnpacking()
    local d = string.pack("iii", 999, 120, 127)
    local idx = 1
    while idx <= #d do
        val, idx = string.unpack("i", d, idx)
        print(val)
    end
end


function run()
    bitwiseOps()
    dataPacking()
    dataUnpacking()
end


run()


