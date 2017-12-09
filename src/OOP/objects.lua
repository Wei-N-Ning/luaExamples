
function demoInstanceMethod()
    local imp = {name="imp", health=100}
    
    -- method doDamage is not accessible outside of the enclosing scope
    function imp:doDamage(target)
        target.health = target.health - 10
    end
    imp.doDamage(imp, imp)
    assert(90, imp.health)
end


function stateObject()
    local MPAA_RATING = {
        R="21",
        X="18",
        MA15="15",
        PG13="13",
        G="10"
    }
    local function getRating(p, standard)
        assert(standard == "MPAA", string.format("%s is not supported", standard))
        if p.title == "doom" then
            return MPAA_RATING.MA15
        end
        return MPAA_RATING.G
    end
    
    local doom = {
        title="doom", 
        developer="Id Software", 
        year=1992
    }
    assert(MPAA_RATING.MA15 == getRating(doom, "MPAA"))
    
    local commanderKeen = {
        title="commanderKeen",
        developer="Id Software",
        year=1990
    }
    assert(MPAA_RATING.G == getRating(commanderKeen, "MPAA"))
end


function run()
    demoInstanceMethod()
    stateObject()
end


run()
