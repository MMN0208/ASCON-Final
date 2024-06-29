#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

#define ASCON128_IV 	(ap_uint<64>(0x80400c0600000000))
#define ASCONHASH_IV_a 	(ap_uint<64>(0xee9398aadb67f03d))
#define ASCONHASH_IV_b 	(ap_uint<64>(0x8bb21831c60f1002))
#define ASCONHASH_IV_c 	(ap_uint<64>(0xb48a92db98d5da62))
#define ASCONHASH_IV_d 	(ap_uint<64>(0x43189921b8f8e3e8))
#define ASCONHASH_IV_e 	(ap_uint<64>(0x348fa5c9d525e140))
#define ASCON128_A 		(12)
#define ASCON128_B 		(6)

typedef ap_axiu<64, 0, 0, 0> packet;

void permutation(ap_uint<320> &state, ap_uint<4> round);

void ascon128(ap_uint<128> key, ap_uint<128> nonce, ap_uint<2> mode, ap_uint<1> skip_asso,
		hls::stream<packet> &in_stream, ap_uint<128> in_tag,
		hls::stream<packet> &out_stream, ap_uint<128> *out_tag, ap_uint<1> *success,
		ap_uint<256> *hash) {
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=key
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=nonce
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=mode
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=skip_asso
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=in_tag
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=out_tag
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=success
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=hash
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128 port=return
#pragma HLS INTERFACE mode=axis register_mode=both port=in_stream register
#pragma HLS INTERFACE mode=axis register_mode=both port=out_stream register

	ap_uint<320> state;
	packet tmp;

	if (mode[1] == 0) {
		// initialization
		state = (ASCON128_IV, key, nonce);
		permutation(state, ASCON128_A);
		state(127, 0) = state(127, 0) ^ key;

		// process associated data
		if (!skip_asso) {
			associated_data_loop: do {
				in_stream.read(tmp);
				state(319, 256) = state(319, 256) ^ tmp.data;
				permutation(state, ASCON128_B);
			} while (!tmp.last);
		}
		state = state ^ ap_uint<320>(1);
	}
	else {
		state = (ASCONHASH_IV_a, ASCONHASH_IV_b, ASCONHASH_IV_c, ASCONHASH_IV_d, ASCONHASH_IV_e);
	}

	text_loop: do {
		in_stream.read(tmp);
		ap_uint<64> tmp_data = tmp.data;

		tmp.data = state(319, 256) ^ tmp.data;
		if(mode[1] == 0) {
			out_stream.write(tmp);
		}

		if (!tmp.last) {
			if (mode == 1) state(319, 256) = tmp_data;
			else state(319, 256) = tmp.data;

			if (mode[1] == 0) permutation(state, ASCON128_B);
			else permutation(state, ASCON128_A);
		}
		else {
			if (mode == 1) state(319, 256) = state(319, 256) ^ tmp.data;
			else state(319, 256) = tmp.data;
		}
	} while (!tmp.last);

	// finalization
	if (mode[1] == 0) {
		state(255, 128) = state(255, 128) ^ key;
		permutation(state, ASCON128_A);

		*out_tag = state(127, 0) ^ key;
		if (mode == 1) {
			*success = (in_tag == (state(127, 0) ^ key(127, 0)));
		}
		else {
			*success = 1;
		}
	}
	else {
		permutation(state, ASCON128_A);
		hash->range(255, 192) = state(319, 256);
		permutation(state, ASCON128_A);
		hash->range(191, 128) = state(319, 256);
		permutation(state, ASCON128_A);
		hash->range(127,  64) = state(319, 256);
		permutation(state, ASCON128_A);
		hash->range(63,    0) = state(319, 256);
		*success = 1;
	}
}
