
function runCmdLine(cmdLine)
    success, signal = os.execute(cmdLine)
    if (success ~= true) then
        io.write("Fail to run: "..cmdLine.."    "..signal.."\n")
    end
    return success
end


function listdir(dirPath)
    local f = io.popen("ls /tmp", "r")
    local dir = {}
    for entry in f:lines() do
        dir[#dir + 1] = entry
    end
    return dir
end


function run()
    runCmdLine("lsll -a --full-time /tmp")
    local dir = listdir("/aaa")
    print(dir[1])
end


run()
