# Flag Hunters

**Author:** syreal

## Description
Lyrics jump from verses to the refrain kind of like a subroutine call. There's a hidden refrain this program doesn't print by default. Can you get it to print it? There might be something in it for you.

The program's source code can be downloaded here.

---

## Write-up

### Challenge Overview
The challenge provides a Python script, `lyric-reader.py`, which prints out song lyrics in a special way. The lyrics are split into sections (verses, refrains), and the program jumps between them using keywords like `REFRAIN` and `RETURN`, similar to subroutine calls in programming.

### Initial Exploration
When connecting to the challenge server with `nc verbal-sleep.picoctf.net 57090`, you receive snippets of lyrics and are prompted for input at certain points.

### Source Code Analysis
Reading through `lyric-reader.py`, I noticed this key section:

```python
for line in song_lines[lip].split(';'):
    ...
    elif re.match(r"RETURN [0-9]+", line):
        lip = int(line.split()[1])
```

This means if the program encounters a line like `RETURN 42`, it will jump to line 42 in the lyrics.

### Input Injection
The code also checks for lines starting with `CROWD`, which prompts the user for input. The input is then inserted into the lyrics at that point. Since the lyrics are split by `;`, if you enter a string like `RETURN 1`, it will be treated as a new command in the lyrics.

### Exploiting the Mechanism
By entering `RETURN 1` (or another valid line number) as your input when prompted, you can force the program to jump to any line in the lyrics, including the secret intro that contains the flag.

### Getting the Flag
When prompted for "Crowd:", enter:

```
RETURN 1
```

This will cause the program to jump to the first line, which contains the secret intro and the flag.

---

## Solution Steps

1. Connect to the challenge:
   ```
   nc verbal-sleep.picoctf.net 57090
   ```
2. When prompted for "Crowd:", enter:
   ```
   RETURN 1
   ```
3. The program will print the secret intro, revealing the flag.

---

## Takeaway
This challenge demonstrates how understanding program control flow and input handling can help you exploit unintended behaviors to reveal hidden information, such as a flag.
