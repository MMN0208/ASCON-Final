import os
import platform
import time
import subprocess

# Get workspace path
host_machine = platform.system()

def prefix_path(machine_type):
    if (machine_type =='Windows'):    
        return 'F:/Others/BK_CE2020/Capstone_Project/ascon_img_processing/main'    
    elif (machine_type =='Linux'):    
        return '/home/xilinx/ascon/ascon_img_processing/main'

# File path for CPP version
sw_ad_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp_inout/associated_data.dat'

sw_key_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp_inout/key.dat'

sw_nonce_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp_inout/nonce.dat'

sw_ct_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp_inout/encrypt.dat'

sw_dec_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp_inout/decrypt.jpg'

sw_hash_out_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp_inout/hash_out.dat'

# CPP object files
enc_obj_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp/enc_demo'

dec_obj_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp/dec_demo'

enc128a_obj_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp/enc_128a_demo'

dec128a_obj_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp/dec_128a_demo'

hash_obj_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp/hash_demo'

hasha_obj_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp/hasha_demo'

# Run cmd
# ASCON-128
make_build_enc = 'cd ' + prefix_path(host_machine) + ' && make build_encrypt'

make_exe_enc = 'cd ' + prefix_path(host_machine) + ' && make exe_encrypt'

make_build_dec = 'cd ' + prefix_path(host_machine) + ' && make build_decrypt'

make_exe_dec = 'cd ' + prefix_path(host_machine) + ' && make exe_decrypt'

# ASCON-HASH
make_build_hash = 'cd ' + prefix_path(host_machine) + ' && make build_hash'

make_exe_hash = 'cd ' + prefix_path(host_machine) + ' && make exe_hash'

# ASCON-128a
make_build_enc128a = 'cd ' + prefix_path(host_machine) + ' && make build_encrypt_128a'

make_exe_enc128a = 'cd ' + prefix_path(host_machine) + ' && make exe_encrypt_128a'

make_build_dec128a = 'cd ' + prefix_path(host_machine) + ' && make build_decrypt_128a'

make_exe_dec128a = 'cd ' + prefix_path(host_machine) + ' && make exe_decrypt_128a'

# ASCON-HASHA
make_build_hasha = 'cd ' + prefix_path(host_machine) + ' && make build_hasha'

make_exe_hasha = 'cd ' + prefix_path(host_machine) + ' && make exe_hasha'

def run_sw_enc(run_version, img_size):
    try:
        if (run_version == 'ASCON-128'):
            if not os.path.exists(enc_obj_file_path):
                subprocess.run(make_build_enc, shell=True, check=True)
            sw_enc_start = time.time()
            subprocess.run(make_exe_enc, shell=True, check=True)
            sw_enc_end = time.time()
        else:
            if not os.path.exists(enc128a_obj_file_path):
                subprocess.run(make_build_enc128a, shell=True, check=True)
            sw_enc_start = time.time()
            subprocess.run(make_exe_enc128a, shell=True, check=True)
            sw_enc_end = time.time()
    except subprocess.CalledProcessError as e:
        return f"Error running software encryption: {e}"

    sw_enc_exe_time = round((sw_enc_end - sw_enc_start), 5)
    sw_enc_throughput = round((img_size / sw_enc_exe_time), 5)
    
    with open(sw_ct_file_path, 'rb') as sw_encrypt_file:                    
        sw_enc = sw_encrypt_file.read()
    sw_enc_size = os.path.getsize(sw_ct_file_path)

    return sw_enc, sw_enc_exe_time, sw_enc_throughput, sw_enc_size



def run_sw_dec(run_version):
    try:
        if (run_version == 'ASCON-128'):
            if not os.path.exists(dec_obj_file_path):
                subprocess.run(make_build_dec, shell=True, check=True)
            sw_dec_start = time.time()
            subprocess.run(make_exe_dec, shell=True, check=True)
            sw_dec_end = time.time()
        else:
            if not os.path.exists(dec128a_obj_file_path):
                subprocess.run(make_build_dec128a, shell=True, check=True)
            sw_dec_start = time.time()
            subprocess.run(make_exe_dec128a, shell=True, check=True)
            sw_dec_end = time.time()
    except subprocess.CalledProcessError as e:
        return f"Error running software decryption: {e}"
    
    sw_dec_exe_time = round((sw_dec_end - sw_dec_start), 5)
    sw_dec_throughput = round((os.path.getsize(sw_ct_file_path) / sw_dec_exe_time), 5)
    
    with open(sw_dec_file_path, 'rb') as sw_decrypt_file:
        sw_dec = sw_decrypt_file.read()

    sw_dec_size = os.path.getsize(sw_dec_file_path)

    return sw_dec, sw_dec_exe_time, sw_dec_throughput, sw_dec_size


def run_sw_hash(run_version, hash_input_size):
    try:
        if (run_version == 'ASCON-HASH'):
            if not os.path.exists(hash_obj_file_path):
                subprocess.run(make_build_hash, shell=True, check=True)
            sw_hash_start = time.time()
            subprocess.run(make_exe_hash, shell=True, check=True)
            sw_hash_end = time.time()
        else:
            if not os.path.exists(hasha_obj_file_path):
                subprocess.run(make_build_hasha, shell=True, check=True)
            sw_hash_start = time.time()
            subprocess.run(make_exe_hasha, shell=True, check=True)
            sw_hash_end = time.time()
    except subprocess.CalledProcessError as e:
        return f"Error running software hash: {e}"
    
    sw_hash_exe_time = round((sw_hash_end - sw_hash_start), 5)

    sw_hash_throughput = round((hash_input_size / sw_hash_exe_time), 5)
    
    with open(sw_hash_out_file_path, 'rb') as sw_hash_out_file:
        sw_hash = sw_hash_out_file.read()

    sw_hash_size = os.path.getsize(sw_hash_out_file_path)

    return sw_hash, sw_hash_exe_time, sw_hash_throughput, sw_hash_size