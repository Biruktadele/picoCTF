# Crack the Gate 2 - Writeup

**Author:** Yahaya Meddy

## Challenge Description
The login system has been upgraded with a basic rate-limiting mechanism that locks out repeated failed attempts from the same source. We’ve received a tip that the system might still trust user-controlled headers. Your objective is to bypass the rate-limiting restriction and log in using the known email address: `ctf-player@picoctf.org` and uncover the hidden secret.

## Approach

### 1. Initial Analysis
- The login endpoint is protected by rate-limiting. After a few failed attempts, further requests from the same source return HTTP 429 (Too Many Requests).
- The challenge hints that user-controlled headers may be trusted by the backend, suggesting a possible bypass using headers like `X-Forwarded-For`.

### 2. Using Burp Suite for Brute Force
- **Intercept the login request:**
  - Use Burp Suite's Proxy to capture the login POST request.
  - Example intercepted request:

    ```http
    POST /login HTTP/1.1
    Host: amiable-citadel.picoctf.net:63483
    Content-Length: 53
    Accept-Language: en-US,en;q=0.9
    User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36
    Content-Type: application/json
    Accept: */*
    Origin: http://amiable-citadel.picoctf.net:63483
    Referer: http://amiable-citadel.picoctf.net:63483/
    Accept-Encoding: gzip, deflate, br
    Connection: keep-alive

    {"email":"ctf-player@picoctf.org","password":"pass"}
    ```

- **Send to Intruder:**
  - Right-click the request and send it to Intruder.
  - Set the payload position on the `password` field.

- **Configure Attack:**
  - Start the attack. If you immediately get HTTP 429 responses, it means the rate limit is active.
  - To avoid this, reduce the number of concurrent requests to 1 and add a delay (e.g., 1 second) between requests in the Intruder resource pool settings.

### 3. Bypassing Rate Limiting
- The backend may use the `X-Forwarded-For` header to identify the client IP. By changing this header for each request, you can bypass the rate limit.
- In Burp Intruder, add a payload position for the `X-Forwarded-For` header and use a list of different values (e.g., random IPs).
- This tricks the backend into treating each request as coming from a different source, allowing you to brute-force passwords without hitting the rate limit.

### 4. Obtaining the Flag
- After successfully brute-forcing the password, the flag is revealed:

  **Flag:** `picoCTF{xff_byp4ss_brut3_ff36dbbc}`

## Summary
- The challenge demonstrates how rate-limiting can be bypassed if the backend trusts user-controlled headers like `X-Forwarded-For`.
- Using Burp Suite Intruder with header manipulation and proper resource pool settings allows for successful brute-forcing even with rate limits in place.
