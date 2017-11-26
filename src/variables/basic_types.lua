
print(1 == nil)
print(1 ~= nil)
print(true and false)
print(type(3.0e-1))
print(math.type(3.0))
print(3.0000000001 == 3.0)

print(string.format("0x%x", 0xDEADBEEF))
print(math.pi)

math.randomseed(os.time())
print(math.random(100))
print(string.format("0x%X", math.maxinteger))

print(math.tointeger(true))  -- returns nil
print(math.tointeger("100") == 100)  -- returns integer 100

