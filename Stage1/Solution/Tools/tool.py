# decompyle3 version 3.7.6
# Python bytecode 3.8 (3413)
# Decompiled from: Python 3.8.10 (default, Jun  2 2021, 10:49:15) 
# [GCC 9.4.0]
# Embedded file name: csfsteg.header.py
# Compiled at: 2021-09-15 11:06:27
# Size of source mod 2**32: 4499 bytes
import sys, wave
from bitstring import *

def print_progress_bar(iteration, total, prefix='', suffix='', decimals=2, length=100, fill='█', print_end='\r'):
    percent = ('{0:.' + str(decimals) + 'f}').format(100 * (iteration / float(total)))
    filled_length = int(length * iteration // total)
    bar = fill * filled_length + '-' * (length - filled_length)
    print(('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix)), end=print_end)
    if iteration == total:
        print()


def decompose(data):
    return list(map(lambda x: 1 if x else 0, list(BitArray(bytes=data))))


def embed(audio_path, payload_path, n_lsb, password):
    audio = wave.open(audio_path, 'rb')
    audio_params = audio.getparams()
    n_frames = audio.getnframes()
    sample_width = audio.getsampwidth()
    sample_bits = sample_width * 8
    n_channels = audio.getnchannels()
    if n_channels != 1:
        print('[-] Currently, only wav files with one channel are supported. Try to convert your file.')
        exit()
    if n_lsb > sample_bits:
        print('[-] The sample width must not be smaller than the LSB to use.')
        sys.exit()
    usable_space = n_frames * n_lsb / 8 / 1024
    print('[*] Usable space in audio file: %.2f KB.' % usable_space)
    payload_data = memoryview(open(payload_path, 'rb').read())
    print('[*] Payload size: %.2f KB.' % (len(payload_data) / 1024))
    if len(payload_data) / 1024 > usable_space:
        print('[-] Cannot embed. File too large.')
        sys.exit()
    else:
        print("[+] Embedding payload into audio file (using password '%d')." % password)
    payload_bits_no_header = decompose(payload_data.tobytes())
    payload_bits = list(map(lambda x: 1 if x == '1' else 0, list('{:032b}'.format(len(payload_bits_no_header))))) + payload_bits_no_header
    n_used_frames = len(payload_bits) / n_lsb
    print('[+] Using %d frames out of %d (%.2f %%, give or take).' % (
     n_used_frames, n_frames, n_used_frames / n_frames * 100))
    frames = audio.readframes(n_frames)
    audio.close()
    frames = [frames[i:i + sample_width] for i in range(0, len(frames), sample_width)]
    displacement = 0
    frame_id = 1
    idx = 0
    stego_bits = []
    new_audio = wave.open(audio_path + '-stego.wav', 'w')
    new_audio.setparams(audio_params)
    print_progress_bar(0, n_frames)
    for frame in frames:
        frame_bits = decompose(frame)
        if idx < len(payload_bits):
            for j in range(n_lsb):
                if displacement < password:
                    displacement += 1
                else:
                    if idx < len(payload_bits):
                        frame_bits[sample_bits - n_lsb + j] = payload_bits[idx]
                        idx += 1

        stego_bits += frame_bits
        if frame_id % 500000 == 0:
            print_progress_bar(frame_id, n_frames)
        else:
            frame_id += 1
    else:
        new_audio.writeframes(BitArray(stego_bits).bytes)
        new_audio.close()
        print_progress_bar(n_frames, n_frames)
        print('[+] Payload embedded successfully!')


def usage(prog_name):
    print('Ciber-Segurança Forense - Instituto Superior Técnico / Universidade Lisboa')
    print('LSB steganography tool: hide files within least significant bits of mono (1 channel) wav sound files.\n')
    print('')
    print('Usage:')
    print('  %s hide <wav_file> <payload_file> <n_lsb> [password]' % prog_name)
    print('')
    print('  The password is optional and must be a number.')
    sys.exit()


if __name__ == '__main__':
    if len(sys.argv) < 4:
        usage(sys.argv[0])
    password = int(sys.argv[5]) % 13 if len(sys.argv) > 5 else 0
    if sys.argv[1] == 'hide':
        embed(sys.argv[2], sys.argv[3], int(sys.argv[4]), password)
    else:
        print('[-] Invalid operation specified.')
# okay decompiling tool.pyc
