#include <iostream>
#include <ap_int.h>

void permutation(ap_uint<320> in, ap_uint<4> round, ap_uint<320>* out);

//int main() {
//	ap_uint<320> test = 0;
//
//	permutation(test, 12, &test);
//	if (test != ap_uint<320>("78ea7ae5cfebb1089b9bfb8513b560f76937f83e03d11a503fe53f36f2c1178c045d648e4def12c9", 16)) return 1;
//
//	permutation(test, 8, &test);
//	if (test != ap_uint<320>("a0e7ca6993d4f09b7b69157d1925064bc9cbd355a5f888085a45bb795b3b2e149dbe2674999cb1c6", 16)) return 1;
//
//	permutation(test, 8, &test);
//	if (test != ap_uint<320>("3b8de5a516b33a2fc83603a21d0df4a1d7439e54c2d201916de89b16c89e98ea269b9ec389c1a711", 16)) return 1;
//
//	std::cout << "Test permutation: Success" << std::endl;
//	return 0;
//}
