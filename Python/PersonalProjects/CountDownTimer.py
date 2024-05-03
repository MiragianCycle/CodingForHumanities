import datetime
import time
import platform
import subprocess
import signal
import sys

# Function to calculate remaining time until May 7th, 2040
def remaining_time():
    # Target deadline: May 7th, 2040
    deadline = datetime.datetime(2040, 5, 7)

    # Current system date and time
    current_date = datetime.datetime.now()

    # Calculate time difference
    time_difference = deadline - current_date

    # Extract days, hours, minutes, and seconds from time difference
    days = time_difference.days
    hours, remainder = divmod(time_difference.seconds, 3600)
    minutes, seconds = divmod(remainder, 60)

    return days, hours, minutes, seconds

# Function to send system notification
def send_notification(message):
    # Check the platform
    if platform.system() == "Darwin":  # macOS
        subprocess.run(['osascript', '-e', f'display notification "{message}" with title "Countdown Timer"'])
    elif platform.system() == "Linux":  # Linux
        subprocess.run(['notify-send', 'Countdown Timer', message])

# Function to handle keyboard interrupt
def signal_handler(sig, frame):
    print("\nExiting program.")
    sys.exit(0)

# Function to display remaining time and send notifications
def display_remaining_time():
    signal.signal(signal.SIGINT, signal_handler)  # Register signal handler for keyboard interrupt
    while True:
        # Get remaining time
        days, hours, minutes, seconds = remaining_time()

        # Format the message
        message = f"May 7th, 2040 is {days} days, {hours} hours, {minutes} minutes, {seconds} seconds. Get to work, motherfucker"

        # Display remaining time
        print(message)

        # Send system notification
        send_notification(message)

        # Wait for an hour before displaying the next reminder
        time.sleep(3600)  # 3600 seconds = 1 hour

# Call the countdown timer function to start displaying the remaining time and sending notifications
display_remaining_time()

