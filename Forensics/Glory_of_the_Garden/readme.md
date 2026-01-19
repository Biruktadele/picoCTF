# Glory of the Garden - Writeup

**Author:** jedavis/Danny

## Description
This file contains more than it seems. Get the flag from `garden.jpg`.

## Solution
1. The challenge provides a file named `garden.jpg` and hints that there is hidden information within it.
2. To investigate, I used the `strings` command to extract readable text from the image file:
   
   ```bash
   strings garden.jpg
   ```
3. Scrolling through the output, I found the flag at the bottom:
   
   **Flag:** `picoCTF{more_than_m33ts_the_3y398ee229a}`

## Flag
```
picoCTF{more_than_m33ts_the_3y398ee229a}
```
