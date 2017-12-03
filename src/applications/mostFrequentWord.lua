
function resourcesDir()
    local pwd = io.popen("pwd"):read()
    local firstIdx, lastIdx = string.find(pwd, "luaExamples")
    return string.sub(pwd, 0, lastIdx).."/resources"
end


function resourceFile(fileName)
end


function run()
    print(resourceFile("texts/mostFrequentWords"))
end


run()


