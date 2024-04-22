-- Basic hello world

print("Hello World")

-- Declaring variables and assigning values

local age = 30
local name = "John"
local isStudent = true
local message = "Hello,"
local message1 = "You are one of us now"
print(message,name)
print(message1)
print(age)
print(name)
print(isStudent)

-- In Lua, the local keyword is used to declare variables as local to the current scope. This means that the variable is only accessible within the block of code where it is declared.
-- Using local is considered a best practice in Lua for several reasons:
	-- Scope Management: It helps in managing variable scope more effectively. Variables declared as local are limited to the scope in which they are defined, preventing accidental name clashes and unintended side effects.
	-- Performance: Accessing local variables is generally faster than accessing global variables. Lua looks up local variables directly in the current scope without having to traverse the global environment.
	-- Encapsulation: Local variables promote encapsulation by restricting access to variables outside their scope. This helps in writing modular and maintainable code.
--
--
-- variables and data types
--Lua has eight basic data types:
--
	-- nil Represents the absence of a value.
	-- boolean: Represents true or false.
	-- number: Represents real numbers.
	-- string: Represents sequences of characters enclosed within single or double quotes.
	-- table: Represents a collection of key-value pairs.
	-- function: Represents executable code.
	-- userdata: Represents arbitrary C data stored in Lua variables.
	-- thread: Represents independent threads of executio

local myNil = nil
local myBool = true
local myNumber = 42
local myString = "Hello, World!"
local myTable = {1, 2, 3, 4}
print(myString)
print(myNumber)

local myFunction = function()
	print("Hello Theena")
end

myFunction()


-- Arithmetic operations
local resultAddition = 10 + 5
print(resultAddition)
local resultSubtraction = 10 - 5
print(resultSubtraction)
local resultMultiplication = 10 * 5
print(resultMultiplication)
local resultDivision = 10 / 5
print(resultDivision)
local resultModulus = 10 % 3
print(resultModulus)
--
-- -- Comparison operations
local isEqual = (10 == 5) -- false
print(isEqual)
local isNotEqual = (10 ~= 5) -- true
print(isNotEqual)
local isGreaterThan = (10 > 5) -- true
print(isGreaterThan)
local isLessThan = (10 < 5) -- false
print(isLessThan)
--
--
-- -- Logical operations
local logicalAnd = true and false -- false
print(logicalAnd)
local logicalOr = true or false -- true
print(logicalOr)
local logicalNot = not true -- false
print(logicalNot)
--


