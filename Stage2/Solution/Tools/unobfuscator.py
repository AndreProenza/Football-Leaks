#!/bin/env python3

import hashlib, sys

def createWordlist(date_value):
	with open('seeds.txt', 'r') as s:
		lines = s.readlines()
	with open('wordlist.txt', 'w') as f:
		for seed in lines:
			pw = hashlib.sha256(str(seed + str(date_value)).encode('utf-8'))
			f.write(pw.hexdigest() + "\n")
	s.close()
	f.close()

if __name__ == '__main__':
	if len(sys.argv) != 2:
		print("Usage: python3 unobfuscator.py <zip_data_number>")
		print("Example: python3 unobfuscator.py 1635117278")
	else:
		createWordlist(sys.argv[1])