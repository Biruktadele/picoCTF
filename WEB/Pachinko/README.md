## Pachinko Writeup

**Author:** notdeghost

### Description
History has failed us, but no matter.

There are two flags in this challenge. Submit flag one here, and flag two in Pachinko Revisited.

**Server source is provided.**

Additional details are available after launching your challenge instance.

---

## Solution Steps

1. **Open the Challenge Instance:**
	- Launch the provided picoCTF instance for Pachinko.

2. **Access the Website:**
	- Open the challenge website in your browser.

3. **Intercept Requests with Burp Suite:**
	- Use Burp Suite to intercept the HTTP requests between your browser and the server.

4. **Send Request to Intruder:**
	- In Burp, send the intercepted request to the Intruder tool.

5. **Automate Requests:**
	- Configure Intruder to send many requests, fuzzing the parameters as needed.

6. **Analyze Responses:**
	- Review the responses for any that contain the flag.

7. **Retrieve the Flag:**
	- The flag is revealed in one of the responses.

---

### Flag 1

`picoCTF{p4ch1nk0_f146_0n3_e947b9d7}`

