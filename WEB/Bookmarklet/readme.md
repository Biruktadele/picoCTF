clea# Bookmarklet - picoCTF Writeup

**Author:** Jeffery John

## Description
Why search for the flag when I can make a bookmarklet to print it for me? Browse here, and find the flag.

## Solution
1. I opened the challenge instance and found a bookmarklet containing some JavaScript code.
2. I saved the JavaScript code to a file named `flag_decrypt.js`.
3. I ran the file using Node.js with the command:
   ```bash
   node flag_decrypt.js
   ```
4. This printed the flag.

## Flag
```
picoCTF{p@g3_turn3r_1d1ba7e0}
```
