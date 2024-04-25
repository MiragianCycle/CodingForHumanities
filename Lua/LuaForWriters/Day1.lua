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



-- The following are examples where I am reusing some of the variables ddeclared above - notice that (i think) i am going out of scope and against best practices with this method

local testFunction = function ()
  print(myNil)
end

testFunction()

local newName = "Theena Kumaragurunathan"
local newFunction = function ()
 print(newName)

end

newFunction()

-- CONTROL STRUCTURES IN LUA
-- IF statements
--
-- if condition then 
--   elseif another condition then
-- else
--   end

local x = resultAddition
if x > 100 then
  print("x is positive")
elseif x == 0 then
  print("x is zero")
else
  print("x is negative")
end





-- LOGICAL OPERATORS
-- The 'and' operator
-- 1. The 'and' operator only returns 'true' if both of its operands are 'true', otherwise it returns false
-- 2. It evaluates its second operand only if the first operand is true, else it short-circuits and returns 'false'
-- 3. the syntax = 'operand1 and operand2'
-- Example below
local a = true
local b = false
print(a and b)
print(a and true)
print(false and b)
--The 'or' Operator
--1. This returns true if one of its operands are true
--2. If both its operands are false then it returns a 'false'
--3. the syntax - 'operand1 or operand2'
--Example:
print(a or b)
print(false or b)
print(a or true)
-- The 'not' operator
-- 1. 'not' negates the value of its operand
-- 2. If operand is 'true' the not operator returns a 'false'
-- 3. If the operand is 'false' the not operator returns a 'true'
-- 4. The syntax - 'not operand2'
-- Example below:
print(not a)
print(not b)
--PRECEDENCE OF OPERATORS
--1. In lua, the operators have a precedence: 'not', 'and', and 'or'
--2. If we are using multiple operators, then its good practice to use paranteses.
--Example below:
local c = 2
local d = 5
local e = 6
local result = (c > 0) and (d < 10) or (e == 5)


-- In the example below we are going to use multiple operators. 
local function isValidNumber(number)
return (number > 0 and number <= 100) or (number < 0)
end

-- Testcases
print("LogicalOrderPrecedence")
print(isValidNumber(50))
print(isValidNumber(-10))
print(isValidNumber(150))
print(isValidNumber(0))
--
-- In this example, the isValidNumber function checks whether a given number meets certain criteria. The function uses multiple logical operators to define these criteria:
--
-- The number must be positive and less than or equal to 100, OR
-- The number can be negative.
-- The function returns true if either of these conditions is met, and false otherwise.
--
-- Here's a breakdown of the logical operations involved:
--
-- (number > 0 and number <= 100): Checks if the number is positive and falls within the range [1, 100].
-- (number < 0): Checks if the number is negative.
-- These two conditions are combined using the logical or operator, indicating that if either condition is true, the overall result is true.
--
-- LOOPS
-- The 'while' Loop
-- The while loop repeats a piece of code until a specified condition is true. This looks like so
-- Example syntax:
-- while condition do
--   --code to execute
-- end
print("This is a while Loop")
local i = 1
while i <= 5 do
print(i)
i = i + 1
end


--The 'for' Loop
-- The 'for' loop executes a block of code for a specified number of times
--Example syntax:
--for varaiable = startValue, endValue, stepValue do 
--execute some code
--end
--
print("This is a for Loop")
for y = 1, 5, 1 do
  print(y)
end

-- LOOP CONTROL STATEMENTS
-- Lua provides loop control statements that allow to alter the flow of loop execution. Here's an example
print("This is a break statement, part of loop control statements")
for z = 1, 10 do
if z == 5 then
  break
end
print(z)
end


-- EXERCISES
-- Problem 1: Print Even Numbers
-- Write a Lua script that prints all even numbers from 1 to 20 using a for loop.

print("Exercise 1: Print Even Numbers")
for isThisEven = 1, 20, 1 do
  if isThisEven % 2 == 0 then
  print(isThisEven)
  end
end



-- Problem 2: Factorial Calculation
-- Write a Lua function to calculate the factorial of a given positive integer using a while loop. Test your function with different input values.
-- Problem 3: Prime Number Check
-- Write a Lua function to check if a given number is prime or not. Use a nested loop to iterate through all possible divisors of the number.
-- Problem 4: Fibonacci Sequence
-- Write a Lua script to generate the Fibonacci sequence up to a specified number of terms using a for loop.
-- Problem 5: Pattern Printing
-- Write a Lua script to print the following pattern using nested loops:
-- markdown
-- Copy code
-- *
-- **
-- ***
-- ****
-- *****
