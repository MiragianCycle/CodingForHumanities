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

-- Pseudocode Factorial Calculation:
-- 1. Input: a positive integer "n"
-- 2. Initialize a variable "result" to 1
-- 3. Initialize a variable "i" to 1
-- 4. While "i" is less than or equal to "n", do the following:
--      a. Multiply "result" by "i"
--      b. Increment "i" by 1
-- 5. Output the value of "result" as the factorial of "n"
--
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

-- Function to check if a given number is prime
local function isPrime(n)
    -- Check if n is less than 2
    if n < 2 then
        return false  -- Numbers less than 2 are not prime
    end
    
    -- Iterate through all possible divisors of n from 2 up to the square root of n
    for i = 2, math.sqrt(n) do
        -- Check if n is divisible evenly by i
        if n % i == 0 then
            return false  -- If n is divisible by i without remainder, it's not prime
        end
    end
    
    return true  -- If no divisors are found, n is prime
end

-- Main function to handle user input and call the isPrime function
local function main()
    -- Prompt the user to enter a positive integer to check if it's prime
    print("Enter a positive integer to check if it's prime:")
    
    -- Read user input and convert it to a number
    local inputStr = io.read()
    local inputNumber = tonumber(inputStr)
    
    -- Check if input is a valid number
    if not inputNumber then
        print("Invalid input. Please enter a valid positive integer.")
        return  -- Exit the function
    end
    
    -- Call the isPrime function with inputNumber as the argument
    local isPrimeResult = isPrime(inputNumber)
    
    -- Print the result indicating whether the input number is prime or not
    if isPrimeResult then
        print(inputNumber .. " is a prime number.")
    else
        print(inputNumber .. " is not a prime number.")
    end
end

-- Call the main function to start the program
main()








-- Prime Number Check:
--
-- 1. Define a function isPrime(n) that takes a positive integer n as input and returns true if n is a prime number, and false otherwise.
--
--    Function isPrime(n):
--    1.1. Check if n is less than 2:
--         1.1.1. If n < 2, return false since numbers less than 2 are not prime.
--    1.2. Iterate through all possible divisors of n from 2 up to the square root of n:
--         1.2.1. For each divisor i, check if n is divisible evenly by i:
--                1.2.1.1. If n is divisible by i without any remainder, return false since n is not prime.
--    1.3. If no divisors are found within the range [2, sqrt(n)], return true, indicating that n is prime.
--
-- 2. Define a function main() to handle user input and call the isPrime function.
--
--    Function main():
--    2.1. Print a prompt asking the user to enter a positive integer to check if it's prime.
--    2.2. Read user input from the standard input and store it in a variable inputStr.
--    2.3. Convert the input string to a number using the tonumber() function and store it in a variable inputNumber.
--    2.4. Check if inputNumber is nil (indicating that the input was not a valid number):
--         2.4.1. If inputNumber is nil, print an error message indicating that the input was invalid and exit the function.
--    2.5. Call the isPrime function with inputNumber as the argument and store the result in a variable isPrimeResult.
--    2.6. Print the result indicating whether the input number is prime or not based on the value of isPrimeResult.
--
--





-- PROBLEM 4: =ns
