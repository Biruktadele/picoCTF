# Crack the Power

**Author:** Yahaya Meddy

## Description

We received an encrypted message. The modulus is built from primes large enough that factoring them isn’t an option, at least not today. See if you can make sense of the numbers and reveal the flag.

---

## Solution Write-up

### Challenge Analysis

The challenge provides an RSA-encrypted message with a very large modulus, making traditional factorization attacks infeasible. However, the public exponent $e$ is unusually small ($e = 20$), which is a critical weakness.

### Coppersmith's Attack

Coppersmith's attack is a cryptanalytic technique that allows finding small roots of modular polynomial equations efficiently. In RSA, if the public exponent $e$ is small and the plaintext $m$ is also small enough such that $m^e < N$ (where $N$ is the modulus), then the ciphertext $c = m^e$ (mod $N$) is simply $m^e$. This means the encryption is not actually using the modulus, and the ciphertext is just the message raised to the power $e$. In this case, we can recover the plaintext by simply taking the $e$-th root of $c$.

### Solution Script (`finder.py`)

The provided script leverages this vulnerability:

- Imports the `gmpy2` library for efficient large integer arithmetic.
- Sets the exponent `e` and ciphertext `c` as provided.
- Computes the integer $e$-th root of $c$ using `gmpy2.iroot(c, e)`.
- Converts the integer root to bytes and decodes it to reveal the original message (the flag).

```python
import gmpy2

e = 20
c = ... # (very large integer)

# Compute the integer e-th root of c
m, exact = gmpy2.iroot(c, e)

print("m:", m)
print("Exact root:", exact)

try:
    message = int(m).to_bytes((m.bit_length() + 7) // 8, 'big').decode()
    print("Decoded message:", message)
except Exception as ex:
    print("Decoding failed:", ex)
```

### Tool: gmpy2

`gmpy2` is a Python library for arbitrary-precision arithmetic, ideal for cryptography and number theory. It provides efficient functions like `iroot` for computing integer roots of large numbers.

---

## Flag

``` 
picoCTF{t1ny_e_46e014ec}
```
