## Verify
**Author:** Jeffery John

### Description
People keep trying to trick my players with imitation flags. I want to make sure they get the real thing! I'm going to provide the SHA-256 hash and a decrypt script to help you know that my flags are legitimate.

### Challenge Details
- **SSH Connection:**
	- Connect using: `ssh -p 49967 ctf-player@rhea.picoctf.net`
	- Password: `*********`
	- Accept the fingerprint with `yes`.
	- Once connected, run `ls` to list files. (Note: Passwords are hidden in the shell.)
- **Checksum to verify:**
	- `b09c99c555e2b39a7e97849181e8996bc6a62501f0149c32447d8e65e205d6d2`
- **Decrypt script:**
	- To decrypt a file after verifying its hash, run: `./decrypt.sh files/<file>`


### Instance Status
This challenge launches an instance on demand.
Current status: **RUNNING**

---

## Solution Steps
1. **List all files and calculate their SHA-256 checksums:**
	 ```bash
	 sha256sum files/* >> check.txt
	 ```
	 This command saves the checksums of all files in the `files` directory to `check.txt`.

2. **Find the file with the provided checksum:**
	 ```bash
	 grep "b09c99c555e2b39a7e97849181e8996bc6a62501f0149c32447d8e65e205d6d2" check.txt
	 ```
	 This will show the filename that matches the legitimate flag's checksum.

3. **Decrypt the flag file:**
	 ```bash
	 ./decrypt.sh files/<flag_file>
	 ```
	 Replace `<flag_file>` with the actual filename found in the previous step. This will reveal the real flag.

---

### Summary
By verifying the SHA-256 hash and using the provided decrypt script, you can ensure you obtain the legitimate flag and not an imitation.

## Flag
picoCTF{trust_but_verify_451fd69b}
