#include <iostream>
#include <iomanip>
#include <fstream>
#include <iterator>
#include <random>
#include "ascon.h"


#if defined(__linux__) 
    #define prefix_path "/home/xilinx/ascon/ascon_img_processing/main/"
#elif _WIN32
    #define prefix_path "F:/Others/BK_CE2020/Capstone_Project/ascon_img_processing/main/"
#else
#endif

template <class T>
typename std::enable_if<std::is_integral<T>::value,std::string>::type
to_big_endian_array(T n){
    std::string ret;
    for (auto i = 0; i < sizeof(n); ++i){
        ret += (n >> ((sizeof(n) - 1 - i) * 8)) & 0xFF;
    }
    return ret;
}

int main() {
     //
    //------------------------------------//
    //
    // Read the plaintext from .dat file
    // Save original cout flags
    auto cout_flags(std::cout.flags());

    std::string in_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/plain_text.dat");
    std::ifstream in_file(in_filepath, std::ios_base::binary);

    if (!in_file.is_open()) {
        std::cerr << "Error opening file: " << in_filepath << std::endl;
        return 1;
    }

    std::string plaintext(
        (std::istreambuf_iterator<char>(in_file)),
        std::istreambuf_iterator<char>()
    );

    std::cout << "\nPlaintext (hex): " << std::endl;
    for (auto i : plaintext) {
        std::cout << std::hex << std::setw(2) << std::setfill('0') << (uint32_t)i;
    }
    std::cout.flags(cout_flags);
    std::cout << std::endl;
    std::cout << "Length = " << plaintext.size() << " bytes" << std::endl;
    
    in_file.close();

    //
    //------------------------------------//
    //
    // Generate ad
    std::string associated_data = "Run encryption + decryption procedure";
    std::string ad_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/associated_data_128a.dat");
    std::remove(ad_filepath.c_str());

    std::ofstream ad_file(ad_filepath, std::ios_base::binary);
    ad_file.write(associated_data.c_str(), static_cast<std::streamsize>(associated_data.length()));
    ad_file.close();

    // Initiate Random Engine
    std::random_device rd;
    std::default_random_engine gen(rd());
    std::uniform_int_distribution<uint32_t> dist(0, std::numeric_limits<uint32_t>::max());

    // Generate key randomly    
    std::array<uint32_t, 4> key = {};

    std::string key_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/key_128a.dat");
    std::remove(key_filepath.c_str());
    
    std::ofstream key_file(key_filepath, std::ios_base::binary | std::ios_base::app);
    for (auto& key_i : key) {
        key_i = dist(gen);
        key_file.write(to_big_endian_array(key_i).c_str(), sizeof(uint32_t));
    }
    key_file.close();

    // Generate nonce randomly     
    std::array<uint32_t, 4> nonce = {};

    std::string nonce_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/nonce_128a.dat");
    std::remove(nonce_filepath.c_str());

    std::ofstream nonce_file(nonce_filepath, std::ios_base::binary | std::ios_base::app);

    for (auto& nonce_i : nonce){
        nonce_i = dist(gen);
        nonce_file.write(to_big_endian_array(nonce_i).c_str(), sizeof(uint32_t));
    }

    nonce_file.close();
    
    //
    //------------------------------------//
    //
    // Invoke ascon128_encrypt() to get ciphertext and write it to .dat file
    auto m = ascon128a_encrypt(key, nonce, associated_data, plaintext);
    
    std::string enc_byte_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/encrypt_byte_vector.dat");
    std::remove(enc_byte_filepath.c_str());

    std::string enc_str_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/encrypt_str.dat");
    std::remove(enc_str_filepath.c_str());

    std::ofstream enc_byte_file(enc_byte_filepath, std::ios_base::binary | std::ios_base::app);
    std::ofstream enc_str_file(enc_str_filepath, std::ios_base::binary | std::ios_base::app);

    std::cout << "Ciphertext (hex): " << std::endl;
    for (auto i: m.ciphertext) {
        std::cout << std::hex << std::setw(2) << std::setfill('0') << (uint32_t)i;
        enc_byte_file.write(to_big_endian_array(i).c_str(), sizeof(i));
        enc_str_file << std::hex << std::setw(2) << std::setfill('0') << (uint32_t)i;
    }
    std::cout.flags(cout_flags);
    std::cout << std::endl;
    std::cout << "Length = " << plaintext.size() << " bytes" << std::endl;

    enc_byte_file.close();
    enc_str_file.close();

    // Get tag and write it to .dat file
    std::string tag_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/tag.dat");
    std::remove(tag_filepath.c_str());

    std::ofstream tag_file(tag_filepath, std::ios_base::binary | std::ios_base::app);

    std::cout << "\n\nTag (hex): ";
    for (auto i: m.tag) {
        std::cout << std::hex << std::setw(16) << std::setfill('0') << (uint64_t) i;
        tag_file.write(to_big_endian_array(i).c_str(), sizeof(i));
    }

    tag_file.close();


    //
    //------------------------------------//
    //
    // Invoke ascon128_decrypt() to get original text and write it to .dat file
    std::string decrypt_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/decrypt.dat");
    std::remove(decrypt_filepath.c_str());
    
    std::ofstream decrypt_file(decrypt_filepath);    
    
    auto decrypt_m = ascon128a_decrypt(key, nonce, associated_data, m);
    if (decrypt_m){
        std::cout << "Deciphered plaintext (hex): " << std::endl;
        for (auto i : decrypt_m.value()) {
            std::cout << std::hex << std::setw(2) << std::setfill('0') << (uint32_t)i;
        }
        std::cout.flags(cout_flags);
        std::cout << std::endl;
        std::cout << "Length = " << decrypt_m.value().length() << " bytes" << std::endl;

        decrypt_file.write(decrypt_m.value().c_str(), static_cast<std::streamsize>(decrypt_m.value().length()));
    } else {
        std::cout << "Failed to decrypt message\n";
    }

    decrypt_file.close();

    return 0;
}

