#!/usr/bin/env python3

import sys, wave, struct
from bitstring import *

def decompose(data):
    return list(map(lambda x: 1 if x else 0, list(BitArray(bytes=data))))

def recover(audio_path, n_lsb, password):
    audio = wave.open(audio_path, 'rb')
    audio_params = audio.getparams()
    n_frames = audio.getnframes()
    sample_width = audio.getsampwidth()
    sample_bits = sample_width * 8
    n_channels = audio.getnchannels()
    
    frames = audio.readframes(n_frames)
    audio.close()
    frames = [frames[i:i + sample_width] for i in range(0, len(frames), sample_width)]

    displacement = 0
    recovered_bits_in_string = ""

    for frame in frames:
        frame_bits = decompose(frame)
        for j in range(n_lsb):
            if displacement < password:
                    displacement += 1
            else:
                recovered_bits_in_string += str(frame_bits[sample_bits - n_lsb + j])

    file_name = "lsb" + str(n_lsb) + "-" + str(password) + ".txt"

    i = 0
    buffer = bytearray()
    while i < len(recovered_bits_in_string):
        buffer.append( int(recovered_bits_in_string[i:i+8], 2) )
        i += 8

    # now write your buffer to a file
    with open(file_name, 'bw') as f:
        f.write(buffer)
    f.close()

    # print('[+] Payload recovered successfully!')


def usage(prog_name):
    print('Ciber-Segurança Forense - Instituto Superior Técnico / Universidade Lisboa')
    print('LSB steganography recoverWav.py: recover files within least significant bits of mono (1 channel) wav sound files.\n')
    print('')
    print('Usage:')
    print('  %s recover <wav_file> <n_lsb> [password]' % prog_name)
    sys.exit()

if __name__ == '__main__':
    #run: python3 recoverWav.py recover hbfs.wav n_lsb password
    if len(sys.argv) < 3:
        usage(sys.argv[0])
    password = int(sys.argv[4]) % 13 if len(sys.argv) > 4 else 0
    if sys.argv[1] == 'recover':
        recover(sys.argv[2], int(sys.argv[3]), password)
    else:
        print('[-] Invalid operation specified.')