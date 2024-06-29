import numpy as np
from pynq import allocate, Overlay, DefaultIP, DefaultHierarchy
import pynq.lib.dma
# from functools import reduce

# register map offset
CTRL = 0x0

key_1 = 0x10

debug_key_1 = 0xdc

nonce_1 = 0x24

mode = 0x38

skip_asso = 0x40

in_tag_1 = 0x48

out_tag_1 = 0x5c

debug_read_1 = 0x94

success = 0x84

hash_1 = 0x94

def output_trimming(input_arr):
    dec_bytes = input_arr

    trim = 0
    for i in dec_bytes[::-1]:
        if i == 0:
            trim -= 1
        else:
            if i == 0x80:
                trim -= 1
            break
    if trim:
        dec_bytes = dec_bytes[:trim]
    
    return dec_bytes

def input_padding(input_arr, length):
    # input_length = input_arr.size
    # block_count = (input_length + length) // 8
    # data = np.zeros(block_count, dtype=np.uint64)
    # for i in range(block_count):
    #     tmp = 0
        
    #     for j in range(8):
    #         tmp <<= 8
    #         if 8 * i + j < input_length:
    #             tmp |= input_arr[8 * i + j]
    #         elif 8 * i + j == input_length:
    #             tmp |= 0x80    
                
    #     data[i] = tmp
    # return data
    padded_len = (len(input_arr) + length) // length * length
    tmp = [0] * (padded_len // 8)
    for idx in range(padded_len):
        tmp[idx // 8] = tmp[idx // 8] << 8
        if idx < len(input_arr):    
            tmp[idx // 8] |= input_arr[idx]
        elif idx == len(input_arr):
            tmp[idx // 8] |= 0x80

    return np.array(tmp , dtype=np.uint64)

def input_padding64(input_arr):
    return input_padding(input_arr, 8)

def input_padding128(input_arr):
    return input_padding(input_arr, 16)

def array_u64_to_array_u8(input_arr):
    ret_arr = np.array([], dtype=np.uint8)
    for i in input_arr:
        u8_arr = np.array([i],dtype=np.uint64).view(dtype=np.uint8)
        for j in reversed(u8_arr):
            ret_arr = np.append(ret_arr, j)
    return ret_arr

def array_u32_to_array_u8(input_arr):
    ret_arr = np.array([], dtype=np.uint8)
    for i in input_arr:
        u8_arr = np.array([i],dtype=np.uint32).view(dtype=np.uint8)
        for j in reversed(u8_arr):
            ret_arr = np.append(ret_arr, j)
    return ret_arr

def array_u8_to_array_u32(input_arr):
    data = [0] * input_arr.size()
    for idx, ele in enumerate(input_arr.tolist()):
        data[idx // 4] <<= 8
        if idx < input_arr.size():    
            data[idx // 4] |= input_arr[idx]
            
    return np.array(data, dtype=np.uint32)

def array_u8_to_array_u64(input_arr):
    data = [0] * input_arr.size()
    for idx, ele in enumerate(input_arr.tolist()):
        data[idx // 8] <<= 8
        if idx < input_arr.size():    
            data[idx // 8] |= input_arr[idx]
            
    return np.array(data, dtype=np.uint64)


class AsconCoreDriver(DefaultIP):
    def __init__(self, description):
        super().__init__(description=description)
    
    def start(self):
        self.write(CTRL, 0x01)
    
    @property
    def debug_key(self):
        debug_key = []
        debug_key.append(self.read(debug_key_1+0x0))
        debug_key.append(self.read(debug_key_1+0x4))
        debug_key.append(self.read(debug_key_1+0x8))
        debug_key.append(self.read(debug_key_1+0xc))
        return np.array(debug_key, dtype=np.uint32)
    
    @property
    def out_tag(self):
        out_tag = []
        out_tag.append(self.read(out_tag_1+0xc))
        out_tag.append(self.read(out_tag_1+0x8))
        out_tag.append(self.read(out_tag_1+0x4))
        out_tag.append(self.read(out_tag_1+0x0))
        return np.array(out_tag, dtype=np.uint32)
    
    @property
    def success(self):
        return self.read(success)
    
    @property
    def hash(self):
        hash = []
        hash.append(self.read(hash_1+0x1c))
        hash.append(self.read(hash_1+0x18))
        hash.append(self.read(hash_1+0x14))
        hash.append(self.read(hash_1+0x10))
        hash.append(self.read(hash_1+0x0c))
        hash.append(self.read(hash_1+0x08))
        hash.append(self.read(hash_1+0x04))
        hash.append(self.read(hash_1+0x00))
        return np.array(hash, dtype=np.uint32)
    
    @property
    def debug_read(self):
        debug_read = []
        debug_read.append(self.read(debug_read_1+0x0))
        debug_read.append(self.read(debug_read_1+0x4))
        return debug_read
    
    @property
    def key(self):
        raise AttributeError("Cannot access write-only attribute")
        
    @property
    def nonce(self):
        raise AttributeError("Cannot access write-only attribute")
        
    @property
    def mode(self):
        raise AttributeError("Cannot access write-only attribute")
        
    @property
    def skip_asso(self):
        raise AttributeError("Cannot access write-only attribute")
        
    @property
    def in_tag(self):
        raise AttributeError("Cannot access write-only attribute")

    @key.setter
    def key(self, value):
        self.write(key_1+0xc, int.from_bytes(value[0:4], "big"))
        self.write(key_1+0x8, int.from_bytes(value[4:8], "big"))
        self.write(key_1+0x4, int.from_bytes(value[8:12], "big"))
        self.write(key_1+0x0, int.from_bytes(value[12:16], "big"))
    
    @nonce.setter
    def nonce(self, value):
        self.write(nonce_1+0xc, int.from_bytes(value[0:4], "big"))
        self.write(nonce_1+0x8, int.from_bytes(value[4:8], "big"))
        self.write(nonce_1+0x4, int.from_bytes(value[8:12], "big"))
        self.write(nonce_1+0x0, int.from_bytes(value[12:16], "big"))
       
    @mode.setter
    def mode(self, value):
        self.write(mode, value) # 0 for enc128, 1 for dec128
        
    @skip_asso.setter
    def skip_asso(self, value):
        self.write(skip_asso, value) # 1 for skip_asso, 0 for not skip_asso
        
    @in_tag.setter
    def in_tag(self, value):
        self.write(in_tag_1+0xc, int(value[0]))
        self.write(in_tag_1+0x8, int(value[1]))
        self.write(in_tag_1+0x4, int(value[2]))
        self.write(in_tag_1+0x0, int(value[3]))

class Ascon128Driver(AsconCoreDriver):
    bindto = ['xilinx.com:hls:ascon128:1.0']
    
class Ascon128aDriver(AsconCoreDriver):
    bindto = ['xilinx.com:hls:ascon128a:1.0']
        
class AsconDriver(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)

    def encryption(self, key, nonce, ad, pt):
        self.ascon_core.key = key
        self.ascon_core.nonce = nonce
        self.ascon_core.mode = 0
        self.ascon_core.skip_asso = 1 if ad.size == 0 else 0        
        self.ascon_core.start()
        
        if ad.size > 0:
            data_buffer_in = allocate(shape=(len(ad),), dtype=np.uint64)
            np.copyto(data_buffer_in, ad)
            self.ascon_dma.sendchannel.transfer(data_buffer_in)
    
        text_buffer_in = allocate(shape=(len(pt),), dtype=np.uint64)
        np.copyto(text_buffer_in, pt)
        self.ascon_dma.sendchannel.transfer(text_buffer_in)
        
        text_buffer_out = allocate(shape=(len(pt),), dtype=np.uint64)
        self.ascon_dma.recvchannel.transfer(text_buffer_out)
        
        self.ascon_dma.sendchannel.wait()
        self.ascon_dma.recvchannel.wait()
        result = text_buffer_out.copy()
        
        if ad.size > 0:
            del data_buffer_in
                
        del text_buffer_in, text_buffer_out
        
        return result, self.ascon_core.out_tag, self.ascon_core.success, self.ascon_core.debug_key
    
    def decryption(self, key, nonce, in_tag, ad, ct):
        self.ascon_core.key = key
        self.ascon_core.nonce = nonce
        self.ascon_core.mode = 1
        self.ascon_core.in_tag = in_tag
        self.ascon_core.skip_asso = 1 if ad.size == 0 else 0
        
        self.ascon_core.start()
        
        if ad.size > 0:
            data_buffer_in = allocate(shape=(len(ad),), dtype=np.uint64)
            np.copyto(data_buffer_in, ad)
            self.ascon_dma.sendchannel.transfer(data_buffer_in)
    
        text_buffer_in = allocate(shape=(len(ct),), dtype=np.uint64)
        np.copyto(text_buffer_in, ct)
        self.ascon_dma.sendchannel.transfer(text_buffer_in)
        
        text_buffer_out = allocate(shape=(len(ct),), dtype=np.uint64)
        self.ascon_dma.recvchannel.transfer(text_buffer_out)
        
        self.ascon_dma.sendchannel.wait()
        self.ascon_dma.recvchannel.wait()
        result = text_buffer_out.copy()
        
        if ad.size > 0:
            del data_buffer_in
                
        del text_buffer_in, text_buffer_out
        
        return result, self.ascon_core.out_tag, self.ascon_core.success
    
    def hash(self, message):
        self.ascon_core.mode = 2
        
        self.ascon_core.start()
        
        text_buffer_in = allocate(shape=(len(message),), dtype=np.uint64)
        np.copyto(text_buffer_in, message)
        self.ascon_dma.sendchannel.transfer(text_buffer_in)
        
        self.ascon_dma.sendchannel.wait()
                
        del text_buffer_in
        
        return self.ascon_core.hash, self.ascon_core.success


    @staticmethod
    def checkhierarchy(description):
        if 'ascon_dma' in description['ip'] \
           and 'ascon_core' in description['ip']:
            return True
        return False
    
class Ascon128Overlay(Overlay):
    def __init__(self, bitfile, **kwargs):
        super().__init__(bitfile, **kwargs)

    def input_padding(self, input_arr):
        byte_128 = np.array([0x80], dtype=np.uint8)
        padded_arr = np.append(input_arr, byte_128)
        padded_arr = np.append(padded_arr, np.frombuffer(bytearray(8 - (len(padded_arr) % 8)), dtype=np.uint8))
        return padded_arr

    def enc_proc(self, key, nonce, padded_ad, padded_pt):
        ct, enc_tag, enc_valid, debug_key = self.ascon.encryption(key, nonce, padded_ad, padded_pt)
        return ct, enc_tag, enc_valid, debug_key

    def dec_proc(self, key, nonce, enc_tag, padded_ad, ct):
        dec_pt, dec_tag, dec_valid = self.ascon.decryption(key, nonce, enc_tag, padded_ad, ct)
        return dec_pt, dec_tag, dec_valid
    
    def hash_proc(self, message):
        padded_msg = self.input_padding(message)
        hash_val, hash_valid = self.ascon.hash(padded_msg)
        return hash_val, hash_valid
    
class Ascon128aOverlay(Ascon128Overlay):
    def input_padding(self, input_arr):
        byte_128 = np.array([0x80], dtype=np.uint8)
        padded_arr = np.append(input_arr, byte_128)
        padded_arr = np.append(padded_arr, np.frombuffer(bytearray(16 - (len(padded_arr) % 16)), dtype=np.uint8))
        return padded_arr
