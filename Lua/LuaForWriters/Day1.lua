-- Basic hello world
local message = "hello world"
print(message)

print("Hello World")

-- variables and data types
-- Declaring variables and assigning values

local age = 30
local name = "John"
local isStudent = true


-- In Lua, the local keyword is used to declare variables as local to the current scope. This means that the variable is only accessible within the block of code where it is declared.
--
-- Using local is considered a best practice in Lua for several reasons:
--
-- Scope Management: It helps in managing variable scope more effectively. Variables declared as local are limited to the scope in which they are defined, preventing accidental name clashes and unintended side effects.
-- Performance: Accessing local variables is generally faster than accessing global variables. Lua looks up local variables directly in the current scope without having to traverse the global environment.
-- Encapsulation: Local variables promote encapsulation by restricting access to variables outside their scope. This helps in writing modular and maintainable code.
--

