#include <iostream>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

typedef ap_axiu<64, 0, 0, 0> packet;

void ascon128a(ap_uint<128> key, ap_uint<128> nonce, ap_uint<2> mode, ap_uint<1> skip_asso,
		hls::stream<packet> &in_stream, ap_uint<128> in_tag,
		hls::stream<packet> &out_stream, ap_uint<128> *out_tag, ap_uint<1> *success,
		ap_uint<256> *hash);

int main() {
	hls::stream<packet> test_in, test_out;
	ap_uint<128> test_itag, test_otag;
	ap_uint<1> test_success;
	ap_uint<256> hash;

	packet p;

	// generate in_stream packet
	p.data = 0x6290701000200300;
	p.last = 0;
	test_in << p;

	// generate in_stream packet
	p.data = 0x6180F00000500400;
	p.last = 1;
	test_in << p;

	// call
	ascon128a(0, 0, 0, 1, test_in, test_itag, test_out, &test_otag, &test_success, &hash);

	// read out_stream;
	p = test_out.read();

	// generate in_stream packet (for decryption)
	test_in << p;

	std::cout << std::hex << p.data << std::endl;

	// read out_stream;
	p = test_out.read();

	// generate in_stream packet (for decryption)
	test_in << p;

	std::cout << std::hex << p.data << std::endl;
	std::cout << std::hex << test_otag << std::endl;
	std::cout << std::hex << test_success << std::endl;

	// set input tag
	test_itag = test_otag;

	ascon128a(0, 0, 1, 1, test_in, test_itag, test_out, &test_otag, &test_success, &hash);

	// read out_stream;
	p = test_out.read();

	// generate in_stream packet (for hash)
	test_in << p;

	std::cout << std::hex << p.data << std::endl;

	// read out_stream;
	p = test_out.read();

	// generate in_stream packet (for hash)
	test_in << p;

	std::cout << std::hex << p.data << std::endl;
	std::cout << std::hex << test_otag << std::endl;
	std::cout << std::hex << test_success << std::endl;

	ascon128a(0, 0, 2, 0, test_in, test_itag, test_out, &test_otag, &test_success, &hash);

	// read hash;
	std::cout << std::hex << hash << std::endl;
	std::cout << std::hex << test_success << std::endl;
	std::cout << "Test ascon128a_three_mode: Success" << std::endl;
	return 0;
}
