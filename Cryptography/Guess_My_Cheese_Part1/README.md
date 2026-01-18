# Guess My Cheese (Part 1) Writeup

**Author:** aditin

## Description
Try to decrypt the secret cheese password to prove you're not the imposter!

Challenge link: Connect to the program on our server: `nc verbal-sleep.picoctf.net 53662`

---

## Solution Steps

1. **Challenge Overview:**
   - The program first shows an encrypted text and asks you to guess the cheese (the password).
   - If you don't know how to decrypt, you can choose the option to encrypt a cheese name instead.

2. **Analyzing the Encryption:**
   - By choosing the encrypt option, you can see how the encryption works for different cheese names.
   - This helps to understand the encryption method used by the challenge.

3. **Identifying the Cipher:**
   - By comparing the encrypted outputs, I suspected it was an Affine cipher.
   - I used [dcode.fr's Affine Cipher tool](https://www.dcode.fr/affine-cipher) to brute-force the key.
   - The correct parameters were found: `a = 5`, `b = 19`.

4. **Decrypting the Password:**
   - Using these parameters, I decrypted the given encrypted cheese password.

## Flag

```
picoCTF{ChEeSy7df82c21}
```
