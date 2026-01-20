# heap 0

**Author:** Abrxs, pr1or1tyQ

## Description
Are overflows just a stack concern?

- [Download the binary here.](./chall)
- [Download the source here.](./chall.c)

Additional details will be available after launching your challenge instance.

---

## Solution Writeup

This problem demonstrates a heap overflow vulnerability. The key idea is that overflows are not limited to the stack; they can also occur on the heap.

### Exploit Strategy
- The challenge allocates a buffer on the heap.
- By providing an input that is too large, you can overflow the buffer and overwrite adjacent heap data.
- This overflow can be leveraged to manipulate program behavior and ultimately print the flag.

### Steps
1. Run the binary and provide an excessively large input to trigger the heap overflow.
2. The program will then print the flag as a result of the overflow.

### Flag
```
picoCTF{my_first_heap_overflow_76775c7c}
```
