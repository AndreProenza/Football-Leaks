import urllib.request
import urllib.parse
import http.client
import subprocess
import sys
import base64
import os
from Crypto import Random
from Crypto.Cipher import AES
import hashlib

password = "Fj39@vF4@54&8dE@!)(*^+-pL;'dK3J2"

def decrypt(enc, password):
    private_key = hashlib.sha256(password.encode("utf-8")).digest()
    enc = base64.b64decode(enc)
    iv = enc[:16]
    cipher = AES.new(private_key, AES.MODE_CFB, iv)
    return cipher.decrypt(enc[16:])

def decrypt_file(file_name):
    new_file_name = ""
    
    with open(file_name, 'r') as f:
        if file_name.split("-")[1] == "exec":
            new_file_name += file_name + ".txt"
            data = f.read()
            data_decrypted = str(decrypt(data, password), 'utf-8')
            with open(new_file_name, 'w') as f1:
                f1.write(data_decrypted)
        else:
            url = f.read()
            data = urllib.parse.unquote(url)
            if data[:3] == "cmd": #cmd=....
                data = data[4:]
                new_file_name += file_name + ".txt"
            elif data[:4] == "file": #file=....
                data = data[5:]
                new_file_name += file_name + ".pdf"
            data_decrypted = decrypt(data, password)
            with open(new_file_name, 'wb') as f1:
                f1.write(data_decrypted)
    f.close()
    f1.close()


if __name__ == '__main__':
	if len(sys.argv) != 2:
		print("Usage: python3 decrypt.py <file_name>")
		print("Example: python3 decrypt.py 141113-file")
	else:
		decrypt_file(sys.argv[1])