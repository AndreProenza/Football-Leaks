import sys
from zipfile import ZipFile


def getPassword():
	with open('password.txt') as file:
		count = 0
		for line in file:
			if count == 12:
				password = line.split(": ")[1].split("\n")[0]
			count += 1

	file.close()
	# print("Unziped with password: ", password)
	print(password)


if __name__ == '__main__':
	if len(sys.argv) != 2:
		print("Usage: python3 crack_zip.py <zip_data_number>")
		print("Example: python3 crack_zip.py 1634412601")
	else:
		getPassword()
		# zip_name = "../Evidences/backup_disk/backup_" + str(sys.argv[1]) + ".zip"

		# with ZipFile(zip_name) as zf:
		# 	zf.extractall("../Evidences/backup_disk/", pwd=bytes(getPassword(),'utf-8'))