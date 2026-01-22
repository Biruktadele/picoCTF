# DISKO 2

**Author:** Darkraicg492

**Description:** Can you find the flag in this disk image? The right one is Linux! One wrong step and its all gone!

## Steps to Reproduce

1.  First, I downloaded the `disko-2.dd` file. The description mentions that it's a disk image with a Linux partition.

2.  I used the `mmls` command from the `sleuthkit` toolkit to list the partitions in the disk image. If you don't have it, you can install it using your package manager (e.g., `sudo pacman -S sleuthkit` or `sudo apt-get install sleuthkit`).

    ```bash
    mmls disko-2.dd
    ```

    This gave the following output, showing a Linux partition at offset 2048.

    ```
    DOS Partition Table
    Offset Sector: 0
    Units are in 512-byte sectors

          Slot      Start        End          Length       Description
    000:  Meta      0000000000   0000000000   0000000001   Primary Table (#0)
    001:  -------   0000000000   0000002047   0000002048   Unallocated
    002:  000:000   0000002048   0000053247   0000051200   Linux (0x83)
    003:  000:001   0000053248   0000118783   0000065536   Win95 FAT32 (0x0b)
    004:  -------   0000118784   0000204799   0000086016   Unallocated
    ```

3.  Next, I extracted the Linux partition from the disk image using the `dd` command. The `skip` parameter corresponds to the start sector, and `count` is the length of the partition.

    ```bash
    dd if=disko-2.dd of=linux_partition.dd bs=512 skip=2048 count=51200
    ```

4.  Finally, I ran the `strings` command on the extracted partition file and filtered for the flag format using `grep`.

    ```bash
    strings linux_partition.dd | grep "picoCTF"
    ```

    This revealed the flag.

## Flag

```
picoCTF{4_P4Rt_1t_i5_a93c3ba0}
```
