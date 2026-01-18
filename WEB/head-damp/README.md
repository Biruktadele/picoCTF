# head-damp Writeup

**Author:** Prince Niyonshuti N.

## Challenge Description
Welcome to the challenge! In this challenge, you will explore a web application and find an endpoint that exposes a file containing a hidden flag. The application is a simple blog website where you can read articles about various topics, including an article about API Documentation. Your goal is to explore the application and find the endpoint that generates files holding the server’s memory, where a secret flag is hidden.

## Solution Steps

1. **Access the Website**
   - I visited the provided website link and found a blog post page.

2. **Find API Documentation**
   - Among the list of blog articles, I found a link to backend documentation.
   - Clicking this link redirected me to the Swagger documentation for the API.

3. **Locate the Head-Dump Endpoint**
   - In the Swagger docs, I discovered an endpoint related to `head-damp`.
   - I executed this endpoint, which allowed me to download a file named `heapdump-1768714458522.heapsnapshot`.

4. **Extract the Flag from the Heapdump**
   - To search for the flag, I used the following command:
     
     ```sh
     grep -o "pico.\{0,50\}" heapdump-1768714458522.heapsnapshot
     ```
     - `-o`: Only output the matching part of the line.
     - `"pico.\{0,50\}"`: Match the word 'pico' followed by up to 50 characters (to capture the flag format).

5. **Retrieve the Flag**
   - The command output revealed the flag:
     
     ```
     picoCTF{Pat!3nt_15_Th3_K3y_8440331c}
     ```

## Flag

```
picoCTF{Pat!3nt_15_Th3_K3y_8440331c}
```
