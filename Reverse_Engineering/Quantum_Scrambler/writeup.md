# Quantum Scrambler (picoCTF Reverse Engineering)

**Author:** Michael Crotty

## Description

The challenge presents a custom cipher called "quantum entanglement" to encode the flag. The goal is to reverse the encryption and recover the original flag.

---

## Approach

### 1. Obtaining the Encrypted Data
- After launching the challenge instance, I connected to the provided service using netcat and saved the output to a file:
  ```
  nc verbal-sleep.picoctf.net 56947 > enc.txt
  ```
- The file contained a long, encrypted Python list.

### 2. Understanding the Encryption
- The main encryption logic is in the `scramble` function in quantum_scrambler.py:
  ```python
  def scramble(L):
      A = L
      i = 2
      while (i < len(A)): 
          A[i-2] += A.pop(i-1)
          A[i-1].append(A[:i-2])
          i += 1
      return L
  ```
- The flag is first converted to a list of hex strings, then scrambled using this function.

### 3. Reverse Engineering the Scramble
- I analyzed how the scramble function mutates the list. Each element is a list containing hex strings.
- To decode, I needed to extract the original hex values and convert them back to characters.

### 4. Decoding the Scrambled Data
- I wrote a descramble.py script to reverse the process:
  ```python
  def hex_decoder(hex_str):
      if hex_str.startswith('0x'):
          hex_str = hex_str[2:]
      return bytes.fromhex(hex_str).decode()

  flag = "" 
  for i in scrambled[:-2]:
      flag += hex_decoder(i[0])
      flag += hex_decoder(i[-1])
  flag += hex_decoder(scrambled[-2][0])
  flag += hex_decoder(scrambled[-1][-1])
  print(flag)
  ```
- This script iterates through the scrambled list, decodes the hex strings, and reconstructs the flag.

---

## Summary



If you need more details or want the full descramble.py code, let me know!
  
## Flag

**picoCTF{python_is_weirde67fae57}**
