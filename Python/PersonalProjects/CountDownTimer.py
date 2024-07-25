# Import necessary modules
import datetime
import time
import platform
import subprocess
import signal
import sys

# Calculate the remaining time until the target deadline
def remaining_time():
    """
    Calculate the remaining time until May 7th, 2040.

    Returns:
        days (int): Number of days remaining
        hours (int): Number of hours remaining
        minutes (int): Number of minutes remaining
        seconds (int): Number of seconds remaining
    """
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

# Send a system notification with the given message
def send_notification(message):
    """
    Send a system notification with the given message.

    Args:
        message (str): The message to display in the notification
    """
    # Check the platform
    if platform.system() == "Darwin":  # macOS
        # Use osascript to display a notification on macOS
        subprocess.run(['osascript', '-e', f'display notification "{message}" with title "Countdown Timer"'])
    elif platform.system() == "Linux":  # Linux
        # Use notify-send to display a notification on Linux
        subprocess.run(['notify-send', 'Countdown Timer', message])

# Handle keyboard interrupt (Ctrl+C)
def signal_handler(sig, frame):
    """
    Handle keyboard interrupt (Ctrl+C) by exiting the program.
    """
    print("\nExiting program.")
    sys.exit(0)

# Display the remaining time and send notifications
def display_remaining_time():
    """
    Display the remaining time until the target deadline and send notifications.
    """
    signal.signal(signal.SIGINT, signal_handler)  # Register signal handler for keyboard interrupt
    while True:
        # Get remaining time
        days, hours, minutes, seconds = remaining_time()

        # Format the message
        message = f"May 7th, 2040 is {days} days, {hours} hours, {minutes} minutes, {seconds} seconds. Get to work!"

        # Display remaining time
        print(message)

        # Send system notification
        send_notification(message)

        # Wait for an hour before displaying the next reminder
        time.sleep(3600)  # 3600 seconds = 1 hour

# Call the countdown timer function to start displaying the remaining time and sending notifications
display_remaining_time()

