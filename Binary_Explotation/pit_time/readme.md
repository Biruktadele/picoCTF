# PIE TIME
Author: Darkraicg492

## Description
Can you try to get the flag? Beware we have PIE!

Connect to the program with netcat:
```
nc rescued-float.picoctf.net 62140
```
The program's source code can be downloaded here. The binary can be downloaded here.

---

## Solution Writeup


1. **Understanding PIE**
   - PIE (Position Independent Executable) means the binary is loaded at a random address each time, so function addresses change on each run.

2. **Finding Function Offsets**
   - We need to find the offset (difference) between the `main` and `win` functions in the binary.
   - Use `nm -C vuln` to list all function symbols and their offsets in the binary:
     ```
     nm -C vuln
     ```
   - Note the addresses for `main` and `win`. The difference between them is constant, even with PIE enabled.

3. **Exploiting Remotely**
   - In this challenge, the remote address of `main` is given directly.
   - Your task is to add the offset (difference) between `main` and `win` (found using `nm -C vuln`) to the given remote address of `main`.
   - This gives you the actual runtime address of `win` on the remote server.
   - Use this calculated address in your exploit (e.g., overwrite a return address or function pointer) to redirect execution to `win`.

4. **Tools Used**
   - `nm -C vuln` to get function offsets.
   - `nc` (netcat) to connect to the remote service.

---

## Flag

```
picoCTF{b4s1c_p051t10n_1nd3p3nd3nc3_6f4e7236}
```
