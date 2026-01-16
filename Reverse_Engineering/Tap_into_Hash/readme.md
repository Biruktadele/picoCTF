# Tap into Hash

**Author:** NGIRIMANA Schadrack

## Description
This challenge provides a source code file and an encrypted file. The goal is to analyze the source code and write a function to decode the encrypted file content. The encrypted file is provided, and analyzing the source code is key to retrieving the flag.

## Solution Steps

1. **Analyzing block_chain.py**
   - The script takes an input from the command line and inserts it into the middle of a blockchain string.
   - The `encrypt` function pads the string and encrypts it using a simple XOR operation with a SHA-256 hash of the key.
   - The key is hardcoded in the script, making decryption possible by reversing the process.

2. **Decryption Approach**
   - I created a script (`decrypt_the_flag.py`) to reverse the encryption.
   - By understanding the encryption logic, I was able to extract the flag by applying the same XOR method used in encryption.


## Flag

```
picoCTF{block_3SRhViRbT1qcX_XUjM0r49cH_qCzmJZzBK_842cf83a}
```
