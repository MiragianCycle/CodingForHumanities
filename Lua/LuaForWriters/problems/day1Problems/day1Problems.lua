-- Day 1 Problems 

-- PROBLEM 1: Even Numbers
-- Find Even numbers between 1 and 20
print("Exercise 1: Even Numbers Between 1 and 20")
for isThisEven = 1, 20, 1 do
if isThisEven % 2 == 0 then
  print(isThisEven)
end
end

-- PROBLEM 2: Factorial
--Using a 'for' loop, write a program that accepts a user input for a number, checks if the number is a positive number, and if so calculates this userinputNumber's factorial

-- Function to calculate the factorial of a given positive integer
local function factorial(n)
    -- Check if n is a positive integer
    if n < 0 then
        return "Error: Input must be a non-negative integer"
    end

    -- Initialize the result variable to 1
    local result = 1

    -- Initialize the loop counter
    local i = 1

    -- While loop to calculate the factorial
    while i <= n do
        -- Multiply the result by the current value of i
        result = result * i

        -- Increment the loop counter
        i = i + 1
    end

    -- Return the calculated factorial
    return result
end

-- Main function to handle user input and call the factorial function
local function main()
    -- Prompt the user to enter a positive integer
    print("Enter a positive integer to calculate its factorial:")

    -- Read user input
    local inputStr = io.read()

    -- Convert input string to a number
    local inputNumber = tonumber(inputStr)

    -- Check if input is a valid number
    if not inputNumber then
        print("Invalid input. Please enter a valid positive integer.")
        return  -- Exit the function
    end

    -- Calculate the factorial of the input number
    local result = factorial(inputNumber)

    -- Print the result
    print("The factorial of " .. inputNumber .. " is: " .. result)
end

-- Call the main function to start the program
main()





-- PROBLEM 3: Prime Number Check






-- PROBLEM 4: Patterns
