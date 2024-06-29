import os
import time
from .ascon_overlay import *
from .sw_handlers import host_machine, prefix_path, sw_ad_file_path, sw_key_file_path,  sw_nonce_file_path

# File path for fpga overlay
overlay_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_vitis/ascon.bit'

overlay128a_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_vitis/ascon_a.bit'

hw_key_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_ol_inout/key.npy'

hw_nonce_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_ol_inout/nonce.npy' 

hw_tag_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_ol_inout/tag.npy'

hw_ct_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_ol_inout/ct.npy'

hw_ct_bytes_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_ol_inout/ct_bytes.dat'

hw_dec_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_ol_inout/dec_pt.jpg'

hw_hash_out_file_path = prefix_path(host_machine) + '/fpga_overlay/ascon_ol_inout/hash_out.dat'

def run_hw_enc(run_version, img_size, img_bytes_obj): 
    # Synchronize ad, key, nonce with SW
    with open(sw_ad_file_path, 'r') as sw_ad_file:
        enc_ad = sw_ad_file.read()
    ad_orig = np.frombuffer(bytes(enc_ad, 'utf-8'), dtype=np.uint8)
    if (run_version == 'ASCON-128'):
        hw_ad = input_padding64(ad_orig) if len(ad_orig) > 0 else ad_orig
    else:
        hw_ad = input_padding128(ad_orig) if len(ad_orig) > 0 else ad_orig
    
    if (run_version == 'ASCON-128'):
        hw_enc_input = input_padding64(np.frombuffer(img_bytes_obj, dtype=np.uint8))
    else:
        hw_enc_input = input_padding128(np.frombuffer(img_bytes_obj, dtype=np.uint8))
        
    hw_key_arr = np.array([], dtype=np.uint8)
    with open(sw_key_file_path, 'rb') as sw_key_file:
       for i in range(4):
           buffer = sw_key_file.read(4)
           for byte in buffer:
               key_i = np.array([byte], dtype=np.uint8)
               hw_key_arr = np.append(hw_key_arr, key_i)
    hw_key = bytes(hw_key_arr)

    hw_nonce_arr = np.array([], dtype=np.uint8)
    with open(sw_nonce_file_path, 'rb') as sw_nonce_file:
       for i in range(4):
           buffer = sw_nonce_file.read(4)
           for byte in buffer:
               nonce_i = np.array([byte], dtype=np.uint8)
               hw_nonce_arr = np.append(hw_nonce_arr, nonce_i)
    hw_nonce = bytes(hw_nonce_arr)
    
    # Create overlay instance
    print("Creating AsconOverlay instance...")                         
    try:
        if (run_version == 'ASCON-128'):               
            hw_enc_ol = Ascon128Overlay(overlay_file_path)
        else:
            hw_enc_ol = Ascon128aOverlay(overlay128a_file_path)
    except Exception as e:
        return f"Error overlaying design: {e}"
    print("Done creating :-)")
    
    # Invoke encryption process
    if (run_version == 'ASCON-128'):
        print("Running hw_ascon128_encrypt process...")
    else:
        print("Running hw_ascon128a_encrypt process...")
    try:
        hw_enc_start = time.time()
        hw_ct, hw_tag, hw_enc_valid = hw_enc_ol.ascon.encryption(hw_key, hw_nonce, hw_ad, hw_enc_input)
        hw_enc_end = time.time()
    except Exception as e:
        if (run_version == 'ASCON-128'):
            return f"Error running hw_ascon128_encrypt process: {e}"
        else:
            return f"Error running hw_ascon128a_encrypt process: {e}"   
    
    if (hw_enc_valid == 1):
        print("Done processing :-)")
    else:
        print("Encryption fail :-(")

    hw_enc_exe_time = round((hw_enc_end - hw_enc_start), 5)
    hw_enc_throughput = round((img_size / hw_enc_exe_time), 5)

    # Write data for decryption process
    #Tag
    with open(hw_tag_file_path, 'wb') as hw_tag_file:
        np.save(hw_tag_file, list(hw_tag))
    #Key
    with open(hw_key_file_path, 'wb') as hw_key_file:
        np.save(hw_key_file, list(hw_key))
    
    #Nonce
    with open(hw_nonce_file_path, 'wb') as hw_nonce_file:
        np.save(hw_nonce_file, list(hw_nonce))
    
    #CT
    hw_enc_u8 = array_u64_to_array_u8(hw_ct)
    hw_enc = bytes(hw_enc_u8[:img_size])

    with open(hw_ct_bytes_file_path, 'wb') as hw_ct_bytes_file:
        hw_ct_bytes_file.write(hw_enc)
    hw_enc_size = os.path.getsize(hw_ct_bytes_file_path)          
    
    with open(hw_ct_file_path, 'wb') as hw_ct_file:
        np.save(hw_ct_file, np.frombuffer(hw_ct, dtype=np.uint64))

    return hw_enc, hw_enc_exe_time, hw_enc_throughput, hw_enc_size


def run_hw_dec(run_version):
    # Get associated data
    with open(sw_ad_file_path, 'r') as sw_ad_file:
        enc_ad = sw_ad_file.read()
    ad_orig = np.frombuffer(bytes(enc_ad, 'utf-8'), dtype=np.uint8)
    if (run_version == 'ASCON-128'):
        hw_ad = input_padding64(ad_orig) if len(ad_orig) > 0 else ad_orig
    else:
        hw_ad = input_padding128(ad_orig) if len(ad_orig) > 0 else ad_orig
    
    # Get tag
    with open(hw_tag_file_path, 'rb') as hw_tag_file:
        hw_tag_tmp = np.load(hw_tag_file)
    hw_tag = np.array(hw_tag_tmp, dtype=np.uint32) 
    
    # Get key
    hw_key_arr = np.array([], dtype=np.uint8)
    with open(sw_key_file_path, 'rb') as sw_key_file:
       for i in range(4):
           buffer = sw_key_file.read(4)
           for byte in buffer:
               key_i = np.array([byte], dtype=np.uint8)
               hw_key_arr = np.append(hw_key_arr, key_i)
    hw_key = bytes(hw_key_arr)
    
    # Get nonce
    hw_nonce_arr = np.array([], dtype=np.uint8)
    with open(sw_nonce_file_path, 'rb') as sw_nonce_file:
       for i in range(4):
           buffer = sw_nonce_file.read(4)
           for byte in buffer:
               nonce_i = np.array([byte], dtype=np.uint8)
               hw_nonce_arr = np.append(hw_nonce_arr, nonce_i)
    hw_nonce = bytes(hw_nonce_arr)

    # Get ciphertext
    with open(hw_ct_file_path, 'rb') as hw_ct_file:
        hw_ct_arr = np.load(hw_ct_file)        
    
    hw_ct = pynq.allocate(hw_ct_arr.shape, dtype=np.uint64)
    hw_ct[:] = hw_ct_arr
    
    # Create overlay instance
    print("Creating AsconOverlay instance...")                            
    try:
        if (run_version == 'ASCON-128'):               
            hw_dec_ol = Ascon128Overlay(overlay_file_path)
        else:               
            hw_dec_ol = Ascon128aOverlay(overlay128a_file_path)
    except Exception as e:
        return f"Error overlaying design: {e}"
    print("Done creating :-)")

    # Invoke decryption process  
    if (run_version == 'ASCON-128'): 
        print("Running hw_ascon128_decrypt process...")
    else: 
        print("Running hw_ascon128a_decrypt process...")
    try:
        hw_dec_start = time.time()
        hw_dec_untrim, hw_dec_tag, hw_dec_valid = hw_dec_ol.ascon.decryption(hw_key, hw_nonce, hw_tag, hw_ad, hw_ct)
        hw_dec_end = time.time()
    except Exception as e:
        if (run_version == 'ASCON-128'):
            return f"Error running hw_ascon128_decrypt process: {e}"
        else:
            return f"Error running hw_ascon128a_decrypt process: {e}"
    if (hw_dec_valid == 1):
        print("Done processing :-)")
    else:
        print("Decryption fail :-(")

    hw_dec_exe_time = round((hw_dec_end - hw_dec_start), 5)

    hw_dec_throughput = round((os.path.getsize(hw_ct_file_path) / hw_dec_exe_time), 5)       
    
    hw_dec_u8 = array_u64_to_array_u8(hw_dec_untrim)

    hw_dec = bytes(output_trimming(hw_dec_u8))

    # hw_dec = bytes(array_u64_to_array_u8(hw_dec_untrim))

    with open(hw_dec_file_path, 'wb') as hw_dec_file:
        hw_dec_file.write(hw_dec)
    hw_dec_size = os.path.getsize(hw_dec_file_path)

    return hw_dec, hw_dec_exe_time, hw_dec_throughput, hw_dec_size


def run_hw_hash(run_version, hash_input, hash_input_size):
    print("Creating AsconOverlay instance...")                            
    try:
        if (run_version == 'ASCON-HASH'):               
            hw_hash_ol = Ascon128Overlay(overlay_file_path)
        else:
            hw_hash_ol = Ascon128aOverlay(overlay128a_file_path)
    except Exception as e:
        return f"Error overlaying design: {e}"
    print("Done creating :-)")       
    
    hw_hash_input = np.frombuffer(bytes(hash_input, 'utf-8'), dtype=np.uint8)

    hw_hash_input_padd = input_padding64(hw_hash_input) if len(hw_hash_input) > 0 else hw_hash_input
    
    if (run_version == 'ASCON-HASH'):
        print("Running hw_ascon_hash process...")
    else:
        print("Running hw_ascon_hasha process...")
    try:
        hw_hash_start = time.time()
        hw_hash_arr, hw_hash_valid = hw_hash_ol.ascon.hash(hw_hash_input_padd)
        hw_hash_end = time.time()
    except Exception as e:
        if (run_version == 'ASCON-HASH'):
            return f"Error running hw_ascon_hash process: {e}"
        else:
            return f"Error running hw_ascon_hasha process: {e}"
    
    if (hw_hash_valid == 1):
        print("Done processing :-)")
    else:
        print("Decryption fail :-(")

    hw_hash_exe_time = round((hw_hash_end - hw_hash_start), 5)

    hw_hash_throughput = round((hash_input_size / hw_hash_exe_time), 5)

    hw_hash = bytes(array_u32_to_array_u8(hw_hash_arr))
    
    with open(hw_hash_out_file_path, 'wb') as hw_hash_out_file:
        hw_hash_out_file.write(hw_hash)

    hw_hash_size = os.path.getsize(hw_hash_out_file_path)

    return hw_hash, hw_hash_exe_time, hw_hash_throughput, hw_hash_size