# picoCTF Write-up: Transformation

## Challenge Description
I wonder what this really is...

Given: enc = ''.join([chr((ord(flag[i]) << 8) + ord(flag[i + 1])) for i in range(0, len(flag), 2)])

## Provided File
The challenge provided an encoded string in a file, which was encrypted using the above transformation (encoding pairs of flag characters into a single Unicode character).

## Approach
1. I examined the encoding logic, which combines two 8-bit characters into one 16-bit Unicode character.
2. To reverse this, I wrote a Python script to split each Unicode character back into two original bytes:

```python
s = "灩捯䍔䙻ㄶ形楴獟楮獴㌴摟潦弸形㝦㘲捡㕽"
flag = ""
for char in s:
    flag += chr(ord(char) >> 8)
    flag += chr(ord(char) & 0xFF)
print(flag)
```

## Solution
Running the script revealed the flag:

```
picoCTF{16_bits_inst34d_of_8_b7f62ca5}
```

## Lessons Learned
Always pay close attention to the details in the problem statement. Understanding the encoding logic is key to reversing it efficiently.