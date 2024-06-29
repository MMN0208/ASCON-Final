from .handlers.sw_handlers import *
from .handlers.hw_handlers import *

hash_in_file_path = prefix_path(host_machine) + '/golden_brick/ascon_cpp_inout/hash_in.dat'

hash_dict = {
    'run_version': 0,
    'hash_input_size': 0,
    'sw_hash': 0,
    'sw_hash_exe_time': 0,
    'sw_hash_throughput': 0,
    'sw_hash_size': 0,
    'hw_hash': 0,
    'hw_hash_exe_time': 0,
    'hw_hash_throughput': 0,
    'hw_hash_size': 0,
}

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

bp = Blueprint('hash', __name__, url_prefix='/hash')

@bp.route('/', methods=['GET', 'POST'])
async def hash():
    if request.method == 'POST':    
        hash_input = request.form['hash_input']
        with open(hash_in_file_path, 'w') as hash_in_file:
            hash_in_file.write(hash_input)

        hash_dict['hash_input_size'] = os.path.getsize(hash_in_file_path)

        btn_value = request.form.get('submit_btn')

        if (btn_value == 'Process with ASCON-HASH'):
            hash_dict['run_version'] = 'ASCON-HASH'
            # CPP Version
            hash_dict['sw_hash'], hash_dict['sw_hash_exe_time'], hash_dict['sw_hash_throughput'], hash_dict['sw_hash_size'] = run_sw_hash(hash_dict['run_version'], hash_dict['hash_input_size'])

            # FPGA Overlay
            hash_dict['hw_hash'], hash_dict['hw_hash_exe_time'], hash_dict['hw_hash_throughput'], hash_dict['hw_hash_size'] = run_hw_hash(hash_dict['run_version'], hash_input, hash_dict['hash_input_size'])

        elif (btn_value == 'Process with ASCON-HASHA'):
            hash_dict['run_version'] = 'ASCON-HASHA'
            # CPP Version
            hash_dict['sw_hash'], hash_dict['sw_hash_exe_time'], hash_dict['sw_hash_throughput'], hash_dict['sw_hash_size'] = run_sw_hash(hash_dict['run_version'], hash_dict['hash_input_size'])

            # FPGA Overlay
            hash_dict['hw_hash'], hash_dict['hw_hash_exe_time'], hash_dict['hw_hash_throughput'], hash_dict['hw_hash_size'] = run_hw_hash(hash_dict['run_version'], hash_input, hash_dict['hash_input_size'])
        else:
            return "Invalid button clicked!"
        
        return render_template('hash.html', **hash_dict)

    # If it's a GET request or there's no image, just render the template initially
    return render_template('hash.html')
