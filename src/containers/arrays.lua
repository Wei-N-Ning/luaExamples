

function constructArray()
    local nums = {-1, 2, 1234, 0x13}
    assert(4 == #nums)
end


function constructSparseArray()
    local nums = {}
    for i = 1, 20 do
        if i % 2 == 0 then
            nums[i] = 1
        end
    end
    for i in pairs(nums) do
        --~ print(i)
    end
end


function createIdentity4x4Matrix()
    local imt = {}
    for rowIdx = 1, 4 do
        local row = {}
        for columnIdx = 1, 4 do
            row[columnIdx] = 0
        end
        imt[rowIdx] = row
    end
    for idx = 1, 4 do
        imt[idx][idx] = 1.0
    end
    return mt
end


function run()
    constructArray()
    constructSparseArray()
    createIdentity4x4Matrix()
end


run()

