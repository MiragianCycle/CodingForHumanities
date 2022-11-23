import requests
from bs4 import BeautifulSoup


def download_image(url, file_name, headers):
    # Send GET request
    response = requests.get(url, headers=headers)

    # Save the image
    if response.status_code == 200:
        with open(file_name, "wb") as f:
            f.write(response.content)
    else:
        print(response.status_code)


def extract_image_links(webpage, headers):
    # Send GET request
    response = requests.get(webpage, headers=headers)

    # Check if the status_code is 200
    if response.status_code == 200:

        # Parse the HTML content of the webpage
        soup = BeautifulSoup(response.content, 'html.parser')

        # Find all of the image tags:
        images = soup.findAll('img')

        # Extract 'src' attribute of every image
        image_links = []
        for image in images:
            image_links.append(image.attrs['src'])

        # Filter for PNG format image links
        image_links = [image for image in image_links if image.endswith('.png')]

        return image_links


if __name__ == "__main__":

    # Define HTTP Headers
    headers = {
        "User-Agent": "Chrome/51.0.2704.103",
    }

    # Define URL of the webpage
    webpage = 'https://up-for-grabs.net/#/'

    # Extract image links
    image_links = extract_image_links(webpage, headers)

    # Download all images
    for i, url in enumerate(image_links):
        file_name = f'image_{i}.png'
        download_image(url, file_name, headers)