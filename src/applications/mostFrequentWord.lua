
function resourcesDir()
    local pwd = io.popen("pwd"):read()
    local firstIdx, lastIdx = string.find(pwd, "luaExamples")
    return string.sub(pwd, 0, lastIdx).."/resources"
end


function resourceFile(fileName)
    return resourcesDir().."/"..fileName
end


function testResourceFile(fileName)
    local filePath = resourceFile(fileName)
    local f = io.open(filePath, "r")
    assert(f)
    f:close()
end


-- f is a file object typically returned from io.open(), 
-- it can also be a file-like object that implements the file interface, 
-- callback is a function that takes one string argument (one line) 
function iterateWords(f, callback)
    for line in f:lines() do
        callback(line)
    end
end


-- sortMethod is a string token; the valid options are: 
-- "count" "alphabetic"
-- numOrWord is an integer that controls how many words to print out
function processText(filePath, sortMethod, numOfWord)
    local numPerWord = {}
    local wordList = {}
    
    local function countWords(line)
        local num = nil
        for word in string.gmatch(line, "%w+") do
            num = numPerWord[word]
            if (num == nil) then
                wordList[#wordList + 1] = word
                numPerWord[word] = 1
            else
                numPerWord[word] = num + 1
            end
        end
    end
    
    local function compareWordByNum(lhs, rhs)
        if numPerWord[lhs] > numPerWord[rhs] then
            return true
        end
        return false
    end
    
    local function compareWordByAlphabeticOrder(lhs, rhs)
        return lhs > rhs
    end
    
    local f = io.open(filePath, "r")
    iterateWords(f, countWords)
    f:close()
    
    if sortMethod == "count" then
        table.sort(wordList, compareWordByNum)
    elseif sortMethod == "alphabetic" then
        table.sort(wordList, compareWordByAlphabeticOrder)
    end
    
    for i = 1, numOfWord do
        io.write(wordList[i], "    ", numPerWord[wordList[i]], "\n")
    end
end


function run()
    testResourceFile("texts/COPYING.GPL")
    
    local filePath = resourceFile("texts/COPYING.GPL")
    processText(filePath, "alphabetic",5)
end


run()
