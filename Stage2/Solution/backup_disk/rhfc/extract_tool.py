"""
Forensics Cyber-Security 2019-2020
@Instituto Superior Tecnico

Simple tool to extract payload from a WAV file using the LSB algorithm.
This tool is fully compatible with the material delivered to students.
"""

import wave
from sys import argv

from bitstring import BitArray


def decompose(data):
    """
    Decompose binary into array of bits.
    :param data: Binary data.
    :return: Array of bits.
    """
    return list(BitArray(bytes=data).bin)


def usage(filepath):
    """
    Tell people how to use the tool.
    :param filepath: The filepath of the script
    :return: void
    """
    print("[-] Something bad happened.")
    print("[*] Usage:")
    print("\t%s <steg_wav_file> <password> <n_lsb> <out>" % filepath)
    print("\t[*] <steg_wav_file> The WAV file from which you want to recover the payload.")
    print("\t[*] <password> The displacement inside the file.")
    print("\t[*] <n_lsb> The number of LSB bits to consider.")
    print("\t[*] <out> The output file.")
    exit()


# The user should provide the steg file, the password and the number of LSB to extract.
if len(argv) != 5:
    usage(argv[0])

steg_wav_file = argv[1]
password = int(argv[2])
n_lsb = int(argv[3])
out = argv[4]

audio = wave.open(steg_wav_file, "rb")
sample_width = audio.getsampwidth()
sample_bits = sample_width * 8
n_channels = audio.getnchannels()

if n_channels != 1:
    print("[-] Currently, only wav files with one channel are supported. Try to convert your file.")
    exit()

if n_lsb > sample_bits:
    # Never going to work.
    print("[-] You cannot retrieve %d bits from a %d sample." % (n_lsb, sample_bits))
    exit()

# Get all frames.
frames = audio.readframes(audio.getnframes())
audio.close()

print("[+] Extracting payload (using password '%d')." % password)
frame_idx = 0
frame_idx_max = audio.getnframes() * sample_width

payload = ''
displacement = 0
header = 0
header_bits = ''
end = 0

while frame_idx < frame_idx_max:
    frame = frames[frame_idx:frame_idx + sample_width]
    frame_idx += sample_width

    # Get decimal representation for bit operation.
    frame_uint = BitArray(bytes=frame).uint
    for i in range(n_lsb - 1, -1, -1):
        if displacement < password:
            displacement += 1
            continue

        if header < 32:
            header_bits += str(((frame_uint >> i) & 0x1))
            header+=1
            if header == 32:
                frame_idx_max = int(header_bits,2) + 32 + password
            continue

        payload += str(((frame_uint >> i) & 0x1))

# Add padding to make sure we have bytes.
while len(payload) % 8:
    payload += '0'

# Get payload bytes and write it to file.
payload_bytes = BitArray(bin=payload).bytes

f = open(out, "wb")
f.write(payload_bytes)
f.close()