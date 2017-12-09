
local text = [[
  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
them if you wish), that you receive source code or can get it if you
want it, that you can change the software or use pieces of it in new
free programs, and that you know you can do these things.
]]


-- returns a table whose keys are "phrases" - two adjacent words in the 
-- original text - and whose values are all the possible next word  
local function buildChain()
    local chain = {}
    local function add(firstWord, secondWord, thirdWord)
        local k = firstWord.." "..secondWord
        local t = chain[k]
        if t == nil then
            chain[k] = {thirdWord}
        else
            t[#t + 1] = thirdWord
        end
    end
    local firstWord, secondWord = "\n", "\n"
    for thirdWord in string.gmatch(text, "%w+[,;.:]?") do
        add(firstWord, secondWord, thirdWord)
        firstWord = secondWord
        secondWord = thirdWord
    end
    return chain
end


local function buildText(chain)
end


function run()
    local chain = buildChain()
end


run()
