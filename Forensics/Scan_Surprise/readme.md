# Scan Surprise

**Author:** Jeffery John

## Description
I've gotten bored of handing out flags as text. Wouldn't it be cool if they were an image instead?

You can download the challenge files here: `challenge.zip`

Additional details will be available after launching your challenge instance.

---

## Solution Steps

1. **Unzip the Challenge File**
   - Download and unzip `challenge.zip`.
   - Inside, you will find a file named `flag.png`.

2. **Scan the Image for the Flag**
   - Use the tool `zbarimg` to scan the image for any embedded data (such as a QR code or barcode).
   - Command used:
     ```
     zbarimg flag.png
     ```

3. **Retrieve the Flag**
   - The output from `zbarimg` reveals the flag:
     
     **Flag:**
     ```
     picoCTF{p33k_@_b00_19eccd10}
     ```
