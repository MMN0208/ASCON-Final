#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

#define ASCON128A_IV 		(ap_uint<64>(0x80800c0800000000))
#define ASCONHASHA_IV_a 	(ap_uint<64>(0x01470194fc6528a6))
#define ASCONHASHA_IV_b 	(ap_uint<64>(0x738ec38ac0adffa7))
#define ASCONHASHA_IV_c 	(ap_uint<64>(0x2ec8e3296c76384c))
#define ASCONHASHA_IV_d 	(ap_uint<64>(0xd6f6a54d7f52377d))
#define ASCONHASHA_IV_e 	(ap_uint<64>(0xa13c42a223be8d87))
#define ASCON128A_A 		(12)
#define ASCON128A_B 		(8)

typedef ap_axiu<64, 0, 0, 0> packet;

void permutation(ap_uint<320> &state, ap_uint<4> round);

void ascon128a(ap_uint<128> key, ap_uint<128> nonce, ap_uint<2> mode, ap_uint<1> skip_asso,
		hls::stream<packet> &in_stream, ap_uint<128> in_tag,
		hls::stream<packet> &out_stream, ap_uint<128> *out_tag, ap_uint<1> *success,
		ap_uint<256> *hash) {
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=key
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=nonce
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=mode
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=skip_asso
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=in_tag
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=out_tag
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=success
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=hash
#pragma HLS INTERFACE mode=s_axilite bundle=ASCON128A port=return
#pragma HLS INTERFACE mode=axis register_mode=both port=in_stream register
#pragma HLS INTERFACE mode=axis register_mode=both port=out_stream register

	ap_uint<320> state;
	packet tmp0, tmp1;

	if (mode(1, 1) == 0) {
		// initialization
		state = (ASCON128A_IV, key, nonce);
		permutation(state, ASCON128A_A);
		state(127, 0) = state(127, 0) ^ key;

		// process associated data
		if (!skip_asso) {
			associated_data_loop: do {
				in_stream.read(tmp0);
				in_stream.read(tmp1);
				state(319, 256) = state(319, 256) ^ tmp0.data;
				state(255, 192) = state(255, 192) ^ tmp1.data;
				permutation(state, ASCON128A_B);
			} while (!tmp1.last);
		}
		state = state ^ ap_uint<320>(1);
	}
	else {
		state = (ASCONHASHA_IV_a, ASCONHASHA_IV_b, ASCONHASHA_IV_c, ASCONHASHA_IV_d, ASCONHASHA_IV_e);
	}

	text_loop: do {
		in_stream.read(tmp0);
		ap_uint<64> tmp0_data = tmp0.data;
		in_stream.read(tmp1);
		ap_uint<64> tmp1_data = tmp1.data;

		tmp0.data = state(319, 256) ^ tmp0.data;
		tmp1.data = state(255, 192) ^ tmp1.data;
		if(mode(1, 1) == 0) {
			out_stream.write(tmp0);
			out_stream.write(tmp1);
		}

		if (!tmp1.last) {
			if (mode == 1) {
				state(319, 256) = tmp0_data;
				state(255, 192) = tmp1_data;
			}
			else {
				state(319, 256) = tmp0.data;
				state(255, 192) = tmp1.data;
			}

			permutation(state, ASCON128A_B);
		}
		else {
			if (mode == 1) {
				state(319, 256) = state(319, 256) ^ tmp0.data;
				state(255, 192) = state(255, 192) ^ tmp1.data;
			}
			else {
				state(319, 256) = tmp0.data;
				state(255, 192) = tmp1.data;
			}
		}
	} while (!tmp1.last);

	// finalization
	if (mode(1, 1) == 0) {
		state(255, 128) = state(255, 128) ^ key;
		permutation(state, ASCON128A_A);

		*out_tag = state(127, 0) ^ key;
		if (mode == 1) {
			*success = (in_tag == (state(127, 0) ^ key(127, 0)));
		}
		else {
			*success = 1;
		}
	}
	else {
		permutation(state, ASCON128A_A);
		hash->range(255, 192) = state(319, 256);
		permutation(state, ASCON128A_B);
		hash->range(191, 128) = state(319, 256);
		permutation(state, ASCON128A_B);
		hash->range(127,  64) = state(319, 256);
		permutation(state, ASCON128A_B);
		hash->range(63,    0) = state(319, 256);
		*success = 1;
	}
}
