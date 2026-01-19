# CanYouSee - picoCTF Forensics Challenge Writeup

**Author:** Mubarak Mikail

## Description
How about some hide and seek?

## Challenge Steps

1. **Unzipping the File**
   - I unzipped the provided file using:
     ```sh
     unzip <filename>
     ```
   - This extracted an image file.

2. **Viewing the Image**
   - I viewed the image in the terminal using `viu`:
     ```sh
     viu <imagefile>
     ```
   - Nothing suspicious was visible in the image itself.

3. **Checking Metadata**
   - I used `exiftool` to inspect the image's metadata:
     ```sh
     exiftool <imagefile>
     ```
   - I found a base64-encoded attribute:
     ```
     cGljb0NURntNRTc0RDQ3QV9ISUREM05fZGVjYTA2ZmJ9Cg==
     ```

4. **Decoding the Flag**
   - I decoded the base64 string:
     ```sh
     echo cGljb0NURntNRTc0RDQ3QV9ISUREM05fZGVjYTA2ZmJ9Cg== | base64 -d
     ```
   - The decoded flag is:
     ```
     picoCTF{ME74D47A_HIDD3N_deca06fb}
     ```

## Flag
```
picoCTF{ME74D47A_HIDD3N_deca06fb}
```
