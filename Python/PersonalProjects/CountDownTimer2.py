
import datetime
import sys

# Function to validate user input for todo deadlines
def validate_todo_deadlines():
    print("Please enter your deadlines for each level of existential todos (YYYY-MM-DD):")
    while True:
        try:
            now_deadline = input("Now: ")
            now_deadline = datetime.datetime.strptime(now_deadline, "%Y-%m-%d")
            # Check if the deadline is less than 1 week from now
            if not (now_deadline - datetime.datetime.now() < datetime.timedelta(weeks=1)):
                raise ValueError("The Now deadline must be less than 1 week from now.")
            break
        except ValueError as e:
            print("Invalid input:", e)
            print("Please try again or press Ctrl+C to exit.")

    while True:
        try:
            short_term_deadline = input("Short Term: ")
            short_term_deadline = datetime.datetime.strptime(short_term_deadline, "%Y-%m-%d")
            # Check if the deadline is between 1 week and 1 year from now
            if not (short_term_deadline - datetime.datetime.now() >= datetime.timedelta(weeks=1) and short_term_deadline - datetime.datetime.now() < datetime.timedelta(weeks=52)):
                raise ValueError("The Short Term deadline must be between 1 week and 1 year from now.")
            break
        except ValueError as e:
            print("Invalid input:", e)
            print("Please try again or press Ctrl+C to exit.")

    while True:
        try:
            medium_term_deadline = input("Medium Term: ")
            medium_term_deadline = datetime.datetime.strptime(medium_term_deadline, "%Y-%m-%d")
            # Check if the deadline is between 1 year and 5 years from now
            if not (medium_term_deadline.year - datetime.datetime.now().year >= 1 and medium_term_deadline.year - datetime.datetime.now().year < 5):
                raise ValueError("The Medium Term deadline must be between 1 year and 5 years from now.")
            break
        except ValueError as e:
            print("Invalid input:", e)
            print("Please try again or press Ctrl+C to exit.")

    while True:
        try:
            long_term_deadline = input("Long Term: ")
            long_term_deadline = datetime.datetime.strptime(long_term_deadline, "%Y-%m-%d")
            # Check if the deadline is between 5 and 10 years from now
            if not (long_term_deadline.year - datetime.datetime.now().year >= 5 and long_term_deadline.year - datetime.datetime.now().year < 11):
                raise ValueError("The Long Term deadline must be between 5 and 10 years from now.")
            break
        except ValueError as e:
            print("Invalid input:", e)
            print("Please try again or press Ctrl+C to exit.")

    while True:
        try:
            ultra_long_term_deadline = input("Ultra Long Term: ")
            ultra_long_term_deadline = datetime.datetime.strptime(ultra_long_term_deadline, "%Y-%m-%d")
            # Check if the deadline is between 12 and 15 years from now
            if not (ultra_long_term_deadline.year - datetime.datetime.now().year >= 12 and ultra_long_term_deadline.year - datetime.datetime.now().year < 15):
                raise ValueError("The Ultra Long Term deadline must be between 12 and 15 years from now.")
            break
        except ValueError as e:
            print("Invalid input:", e)
            print("Please try again or press Ctrl+C to exit.")

    return now_deadline, short_term_deadline, medium_term_deadline, long_term_deadline, ultra_long_term_deadline

# Function to validate user input for todo items
def validate_todo_items(period):
    todo_items = []
    print(f"Please enter 5 todo items for {period}:")
    for i in range(5):
        todo_item = input(f"Todo item {i+1}: ")
        todo_items.append(todo_item)
    return todo_items

# Function to calculate remaining time until a specific date
def remaining_time(deadline):
    # Current system date and time
    current_date = datetime.datetime.now()

    # Calculate time difference
    time_difference = deadline - current_date

    # Extract years, months, and days from time difference
    years = time_difference.days // 365
    months = (time_difference.days % 365) // 30
    days = time_difference.days % 30

    return years, months, days

# Function to display remaining time for each level
def display_remaining_time(now_deadline, short_term_deadline, medium_term_deadline, long_term_deadline, ultra_long_term_deadline):
    # Calculate remaining time for each level
    now_days = now_deadline - datetime.datetime.now()
    short_term_years, short_term_months, short_term_days = remaining_time(short_term_deadline)
    medium_term_years, medium_term_months, medium_term_days = remaining_time(medium_term_deadline)
    long_term_years, long_term_months, long_term_days = remaining_time(long_term_deadline)
    ultra_long_term_years, ultra_long_term_months, ultra_long_term_days = remaining_time(ultra_long_term_deadline)

    # Display remaining time for each level
    print("Now:", now_days.days, "days")
    print("Short Term:", short_term_years, "years", short_term_months, "months", short_term_days, "days")
    print("Medium Term:", medium_term_years, "years", medium_term_months, "months", medium_term_days, "days")
    print("Long Term:", long_term_years, "years", long_term_months, "months", long_term_days, "days")
    print("Ultra Long Term:", ultra_long_term_years, "years", ultra_long_term_months, "months", ultra_long_term_days, "days")

try:
    # Get user input for todo deadlines with error checking
    now_deadline, short_term_deadline, medium_term_deadline, long_term_deadline, ultra_long_term_deadline = validate_todo_deadlines()

    # Get user input for todo items for each period
    now_todos = validate_todo_items("Now")
    short_term_todos = validate_todo_items("Short Term")
    medium_term_todos = validate_todo_items("Medium Term")
    long_term_todos = validate_todo_items("Long Term")
    ultra_long_term_todos = validate_todo_items("Ultra Long Term")

    # Display remaining time for each level
    display_remaining_time(now_deadline, short_term_deadline, medium_term_deadline, long_term_deadline, ultra_long_term_deadline)

    # Display todo items for each period
    print("\nTodo Items:")
    print("Now:", now_todos)
    print("Short Term:", short_term_todos)
    print("Medium Term:", medium_term_todos)
    print("Long Term:", long_term_todos)
    print("Ultra Long Term:", ultra_long_term_todos)

except KeyboardInterrupt:
    print("\nProgram exited gracefully.")
    sys.exit(0)
