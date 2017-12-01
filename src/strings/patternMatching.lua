
function recap()
    assert(string.find("arm x86 x64", "x86"))
    assert("arm x87 x64" == string.gsub("arm x86 x64", "x86", "x87"))
end


function run()
    recap()
end


run()
