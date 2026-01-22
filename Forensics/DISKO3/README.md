# DISKO 3 - picoCTF Forensics Challenge

**Author:** Darkraicg492

## Description
Can you find the flag in this disk image? This time, it's not as plain as you think it is!

> Download the disk image here.

**Debug info:** [u:968274 e: p: c:507 i:296562]

### Hints
- How will you search and extract files in a partition?

---

## Solution Walkthrough

### 1. Listing Files in the Disk Image
I started by listing all files and directories in the disk image using `fls`:

```sh
fls -r disko-3.dd
```
This revealed a complex file structure, including a file named `flag.gz` (ID: 522628).

### 2. Extracting the Flag File
To extract the file, I used `icat` to carve out the file from the disk image:

```sh
icat disko-3.dd 522628 > flag.gz
```

### 3. Decompressing the Flag
The extracted file was a gzip archive. I decompressed it using:

```sh
gunzip flag.gz
```

This produced a file named `flag`.

### 4. Retrieving the Flag
Finally, I read the contents of the `flag` file:

```
picoCTF{n3v3r_z1p_2_h1d3_654235e0}
```

---

## Summary of Steps
1. Used `fls` to recursively list files in the disk image.
2. Identified and extracted `flag.gz` using `icat`.
3. Decompressed the file with `gunzip`.
4. Retrieved the flag from the resulting file.

## Flag
```
picoCTF{n3v3r_z1p_2_h1d3_654235e0}
```
