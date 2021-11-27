from zipfile import ZipFile

# Get password from chantsZipPassword.txt file
def getPassword():
    file = open("../Evidences/chantsZipPassword.txt", "r")

    for line in file:
        if line != "\n":
            password = line.split(" == ")[1].split("\n")[0]

    file.close()
    return password

with ZipFile('../chants.zip') as zf:
  zf.extractall("../Evidences/", pwd=bytes(getPassword(),'utf-8'))
