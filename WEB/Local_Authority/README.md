# Local Authority - picoCTF Writeup

**Author:** LT 'syreal' Jones

## Challenge Description
Can you get the flag?
Go to this website and see what you can discover.

---

## Solution Steps

1. **Initial Exploration**
   - Navigated to the provided website.
   - The site displayed a login page with fields for username and password.
   - Inspected the page source and elements but found nothing obvious.

2. **Brute Force Attempt**
   - Tried logging in with random usernames and passwords.
   - During this process, discovered a JavaScript file containing the login logic.

3. **Analyzing the JavaScript**
   - The JavaScript function for authentication was:
     ```javascript
     function checkPassword(username, password)
     {
       if( username === 'admin' && password === 'strongPassword098765' )
       {
         return true;
       }
       else
       {
         return false;
       }
     }
     ```
   - This revealed the correct credentials: 
     - **Username:** `admin`
     - **Password:** `strongPassword098765`

4. **Logging In**
   - Used the discovered credentials to log in.
   - Successfully logged in and obtained the flag.

---

## Flag

```
picoCTF{j5_15_7r4n5p4r3n7_b0c2c9cb}
```
