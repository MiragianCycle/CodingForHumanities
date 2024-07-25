-- Function to generate a random character name
local function generateName()
    local names = {"Alice", "Bob", "Carol", "Dave", "Eve"}
    local index = math.random(#names)
    return names[index]
end

-- Generate and print 5 character names
for i = 1, 5 do
    print(generateName())
end

