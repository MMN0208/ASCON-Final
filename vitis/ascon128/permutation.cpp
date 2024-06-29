#include <ap_int.h>
#define RR64(n, r) ((n >> r) | (n << (64 - r)))

void permutation(ap_uint<320> &state, ap_uint<4> round) {
	static const ap_uint<8> ROUND_CONSTANTS[12] = {
			0xf0, 0xe1, 0xd2, 0xc3,
			0xb4, 0xa5, 0x96, 0x87,
			0x78, 0x69, 0x5a, 0x4b
	};

	ap_uint<64> tmp[5];
	permutation_rounds: while (round) {
		// addition of constant
		state(135, 128) = state(135, 128) ^ ROUND_CONSTANTS[12 - round];

		// substitution layer
		state(319, 256) = state(319, 256) 	^ state(63, 0);
		state(63, 0) 	= state(63, 0) 		^ state(127, 64);
		state(191, 128) = state(191, 128) 	^ state(255, 192);

		tmp[0] = ~state(319, 256) 	& state(255, 192);
		tmp[1] = ~state(255, 192) 	& state(191, 128);
		tmp[2] = ~state(191, 128) 	& state(127, 64);
		tmp[3] = ~state(127, 64) 	& state(63, 0);
		tmp[4] = ~state(63, 0) 		& state(319, 256);

		state(319, 256) = state(319, 256) 	^ tmp[1];
		state(255, 192) = state(255, 192) 	^ tmp[2];
		state(191, 128) = state(191, 128) 	^ tmp[3];
		state(127, 64) 	= state(127, 64) 	^ tmp[4];
		state(63, 0) 	= state(63, 0) 		^ tmp[0];

		state(255, 192) = state(255, 192) 	^ state(319, 256);
		state(319, 256) = state(319, 256) 	^ state(63, 0);
		state(127, 64) 	= state(127, 64) 	^ state(191, 128);

		state(191, 128) = ~state(191, 128);

		// linear diffusion
		state(319, 256) = state(319, 256) 	^ RR64(state(319, 256), 19) 	^ RR64(state(319, 256), 28);
		state(255, 192) = state(255, 192) 	^ RR64(state(255, 192), 61) 	^ RR64(state(255, 192), 39);
		state(191, 128) = state(191, 128) 	^ RR64(state(191, 128), 1) 		^ RR64(state(191, 128), 6);
		state(127, 64) 	= state(127, 64) 	^ RR64(state(127, 64), 10) 		^ RR64(state(127, 64), 17);
		state(63, 0) 	= state(63, 0) 		^ RR64(state(63, 0), 7) 		^ RR64(state(63, 0), 41);

		// decrement loop
		round--;
	}
}
