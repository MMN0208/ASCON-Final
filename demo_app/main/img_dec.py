import base64
from .handlers.sw_handlers import *
from .handlers.hw_handlers import *

dec_dict = {
    'run_version': 0,
    'sw_dec': 0, 
    'base64_sw_str': 0,
    'sw_dec_exe_time': 0, 
    'sw_dec_throughput': 0, 
    'sw_dec_size': 0,
    'hw_dec': 0,
    'base64_hw_str': 0,
    'hw_dec_exe_time': 0,
    'hw_dec_throughput': 0,
    'hw_dec_size': 0 
}

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

bp = Blueprint('img_dec', __name__, url_prefix='/img_dec')

@bp.route('/', methods=['GET', 'POST'])
async def img_dec():
    if request.method == 'POST':
        btn_value = request.form.get('submit_btn')  

        if (btn_value == 'Process with ASCON-128'):
            dec_dict['run_version'] = 'ASCON-128'        
            # CPP Version
            dec_dict['sw_dec'], dec_dict['sw_dec_exe_time'], dec_dict['sw_dec_throughput'], dec_dict['sw_dec_size'] = run_sw_dec(dec_dict['run_version'])
            
            # FPGA Overlay
            dec_dict['hw_dec'], dec_dict['hw_dec_exe_time'], dec_dict['hw_dec_throughput'], dec_dict['hw_dec_size'] = run_hw_dec(dec_dict['run_version'])
            
        elif (btn_value == 'Process with ASCON-128a'):
            dec_dict['run_version'] = 'ASCON-128a'
            # CPP Version
            dec_dict['sw_dec'], dec_dict['sw_dec_exe_time'], dec_dict['sw_dec_throughput'], dec_dict['sw_dec_size'] = run_sw_dec(dec_dict['run_version'])
            
            # FPGA Overlay
            dec_dict['hw_dec'], dec_dict['hw_dec_exe_time'], dec_dict['hw_dec_throughput'], dec_dict['hw_dec_size'] = run_hw_dec(dec_dict['run_version'])

        else:
            return "Invalid button clicked!"
        
        # Render images
        dec_dict['base64_sw_str'] = base64.b64encode(dec_dict['sw_dec']).decode('utf-8')
        dec_dict['base64_hw_str'] = base64.b64encode(dec_dict['hw_dec']).decode('utf-8')
        
        return render_template('img_dec.html', **dec_dict)
    # If it's a GET request or there's no image, just render the template initially
    return render_template('img_dec.html')
