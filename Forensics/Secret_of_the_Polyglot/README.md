# Secret of the Polyglot

**Author:** syreal

## Description
The Network Operations Center (NOC) of your local institution picked up a suspicious file, but they're getting conflicting information on what type of file it is. As an external expert, your task is to examine the file and extract all possible information from it.

## Writeup

1. **Initial Analysis**
   - I started by opening the provided file as a PDF. This revealed half of the flag hidden within the document.

2. **Strings Analysis**
   - I used the `strings` command to search for readable text within the file, but did not find anything useful.

3. **Metadata Inspection**
   - Upon inspecting the file's metadata, I noticed a comment: `Created with GIMP`.
   - GIMP is an image editing tool, which suggested the file might also be an image or contain hidden image data.

4. **File Type Change**
   - Based on the GIMP reference, I changed the file extension to `.png` and opened it as an image.
   - This revealed the other half of the flag.

## Conclusion
By analyzing the file as both a PDF and an image, I was able to extract both halves of the flag. The polyglot nature of the file allowed it to be interpreted as multiple file types, each revealing different information.
