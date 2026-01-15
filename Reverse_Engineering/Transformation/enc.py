s = "灩捯䍔䙻ㄶ形楴獟楮獴㌴摟潦弸形㝦㘲捡㕽"

flag = ""
for char in s:
    flag += chr(ord(char) >> 8)
    flag += chr(ord(char) & 0xFF)
print(flag)