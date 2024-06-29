#include <iostream>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <iterator>
#include "ascon.h"

#if defined(__linux__) 
    #define prefix_path "/home/xilinx/ascon/ascon_img_processing/main/"
#elif _WIN32
    #define prefix_path "F:/Others/BK_CE2020/Capstone_Project/ascon_img_processing/main/"
#else
#endif


int main() {
    // Read hash input
    // auto cout_flags(std::cout.flags());

    std::string in_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/hash_in.dat");
    std::ifstream in_file(in_filepath, std::ios_base::binary);

    if (!in_file.is_open()) {
        std::cerr << "Error opening file: " << in_filepath << std::endl;
        return 1;
    }

    std::string hash_in(
        (std::istreambuf_iterator<char>(in_file)),
        std::istreambuf_iterator<char>()
    );

    // std::cout << "\nInput (hex): " << std::endl;
    // for (auto i : hash_in) {
    //     std::cout << std::hex << std::setw(2) << std::setfill('0') << (uint32_t)i;
    // }
    // std::cout.flags(cout_flags);
    // std::cout << std::endl;
    // std::cout << "\nLength = " << hash_in.size() << " bytes" << std::endl;
    
    in_file.close();
   

    // Invoke ascon_hash() to get output and write to .dat file
    auto hash_out = ascon_hash(hash_in);

    std::string hash_out_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/hash_out.dat");
    std::remove(hash_out_filepath.c_str());

    std::ofstream hash_out_file(hash_out_filepath, std::ios_base::binary | std::ios_base::app);
    // std::cout << "\nCiphertext (hex): " << std::endl;
    for (auto i: hash_out) {
        hash_out_file.write(to_big_endian_array(i).c_str(), sizeof(i));
    }
    // std::cout.flags(cout_flags);
    // std::cout << std::endl;
    // std::cout << "\nLength = " << hash_out.size() << " bytes" << std::endl;

    hash_out_file.close();

    return 0;
}