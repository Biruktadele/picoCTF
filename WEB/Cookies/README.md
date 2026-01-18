# picoCTF 2026 - Cookies Writeup

## Challenge: Cookies
**Author:** madStacks

### Description
Who doesn't love cookies? Try to figure out the best one.

Challenge URL: [http://wily-courier.picoctf.net:63073/](http://wily-courier.picoctf.net:63073/)

---

## Solution

The challenge hints that the flag is related to cookies. By inspecting the requests, it was found that the server responds differently based on the value of a cookie named `name`.

To automate the process of finding the correct cookie value, I wrote a Python script that iterates through possible values for the `name` cookie and checks the response for the flag:

```python
import requests

url = "http://wily-courier.picoctf.net:63073/"

for i in range(100):
    cookies = {'name': str(i)}
    response = requests.get(url, cookies=cookies)
    if "pico" in response.text:
        print(response.text)
        break
```

When the correct value is found, the server returns the flag in the response.

---

## Flag

```
picoCTF{3v3ry1_l0v3s_c00k135_a4dadb49}
```
