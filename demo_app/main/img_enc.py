import base64
from .handlers.sw_handlers import *
from .handlers.hw_handlers import *

orig_img_path = prefix_path(host_machine) + '/img_data/webcam.jpg'

enc_dict = {
    'run_version': 0,
    'img_bytes_obj': 0,
    'base64_bit_str': 0, 
    'img_size': 0, 
    'sw_enc': 0, 
    'sw_enc_exe_time': 0, 
    'sw_enc_throughput': 0, 
    'sw_enc_size': 0,
    'hw_enc': 0,
    'hw_enc_exe_time': 0,
    'hw_enc_throughput': 0,
    'hw_enc_size': 0 
}

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

bp = Blueprint('img_enc', __name__, url_prefix='/img_enc')

@bp.route('/', methods=['GET', 'POST'])
async def img_enc():
    if request.method == 'POST':
        btn_value = request.form.get('submit_btn')

        if (host_machine == 'Linux'):
            os.system(f"fswebcam  --no-banner -r 1280x1024 --save {orig_img_path} -d /dev/video0 2> /dev/null")
        
        if os.path.exists(orig_img_path):
            with open(orig_img_path, 'rb') as jpg_file:                    
                enc_dict['img_bytes_obj'] = jpg_file.read()

            enc_dict['base64_bit_str'] = base64.b64encode(enc_dict['img_bytes_obj']).decode('utf-8')

            enc_dict['img_size'] = os.path.getsize(orig_img_path)
        else:
            return "Image not found"

        if (btn_value == 'Capture & Process with ASCON-128' or btn_value == 'ASCON-128'):
            enc_dict['run_version'] = 'ASCON-128'
            # CPP Version
            enc_dict['sw_enc'], enc_dict['sw_enc_exe_time'], enc_dict['sw_enc_throughput'], enc_dict['sw_enc_size'] = run_sw_enc(enc_dict['run_version'], enc_dict['img_size']) 
            
            # FPGA Overlay
            enc_dict['hw_enc'], enc_dict['hw_enc_exe_time'], enc_dict['hw_enc_throughput'], enc_dict['hw_enc_size'] = run_hw_enc(enc_dict['run_version'], enc_dict['img_size'], enc_dict['img_bytes_obj'])               
                            
        elif (btn_value == 'Capture & Process with ASCON-128a' or btn_value == 'ASCON-128a'):
            enc_dict['run_version'] = 'ASCON-128a'
            # CPP Version
            enc_dict['sw_enc'], enc_dict['sw_enc_exe_time'], enc_dict['sw_enc_throughput'], enc_dict['sw_enc_size'] = run_sw_enc(enc_dict['run_version'], enc_dict['img_size']) 

            # FPGA Overlay               
            enc_dict['hw_enc'], enc_dict['hw_enc_exe_time'], enc_dict['hw_enc_throughput'], enc_dict['hw_enc_size'] = run_hw_enc(enc_dict['run_version'], enc_dict['img_size'], enc_dict['img_bytes_obj']) 
        else:
            return "Invalid button clicked!"
        
        return render_template('img_enc.html', **enc_dict)
    
    # If it's a GET request or there's no image, just render the template initially
    return render_template('img_enc.html')
