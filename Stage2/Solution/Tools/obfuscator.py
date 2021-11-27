# decompyle3 version 3.7.6
# Python bytecode (3, 8, 0) (3413)
# Decompiled from: Python 3.8.10 (default, Sep 28 2021, 16:10:42) 
# [GCC 9.3.0]
# Embedded file name: obfuscator.py
# Compiled at: 2021-10-16 13:34:12
# Size of source mod 2**32: 295 bytes
import hashlib, sys
with open('seeds.txt', 'r') as f:
    lines = f.readlines()
with open('seeds.txt', 'w') as f:
    for line in lines[1:]:
        f.write(line)
    else:
        f.write(lines[0])

pw = hashlib.sha256(str(lines[0] + str(sys.argv[1])).encode('utf-8'))
print(pw.hexdigest())
# okay decompiling obfuscator.pyc