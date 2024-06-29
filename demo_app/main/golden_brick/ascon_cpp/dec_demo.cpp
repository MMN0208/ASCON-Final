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
  
    //
    //------------------------------------//
    //
    char buffer[4];
    // auto cout_flags(std::cout.flags());

    // Get ad
    std::string ad_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/associated_data.dat");
    std::ifstream ad_file(ad_filepath, std::ios_base::binary);

    if (!ad_file.is_open()) {
        std::cerr << "\nError opening file: " << ad_filepath << std::endl;
        return 1;
    }
    std::string associated_data((std::istreambuf_iterator<char>(ad_file)), std::istreambuf_iterator<char>());

    ad_file.close();

    // Fetch the key
    ascon_key128_t key = {};

    std::string key_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/key.dat");
    std::ifstream key_file(key_filepath, std::ios_base::binary);
    
    if (!key_file.is_open()) {
        std::cerr << "\nError opening file: " << key_filepath << std::endl;
        return 1;
    }
    
    for (auto i = 0; i < 4; ++i) {
        key_file.read(buffer, 4);
        for (auto byte : buffer) {
            key[i] = (key[i] << 8) | (uint8_t)byte;
        }
    }

    key_file.close();
    
    // Fetch the nonce    
    ascon_nonce_t nonce = {};
    
    std::string nonce_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/nonce.dat");
    std::ifstream nonce_file(nonce_filepath, std::ios_base::binary);
    
    if (!nonce_file.is_open()) {
        std::cerr << "\nError opening file: " << nonce_filepath << std::endl;
        return 1;
    }

    for (auto i = 0; i < 4; ++i) {
        nonce_file.read(buffer, 4);
        for (auto byte : buffer) {
            nonce[i] = (nonce[i] << 8) | (uint8_t)byte;
        }
    }

    nonce_file.close();
    
    //
    //------------------------------------//
    //
    // Get tag & ciphertext
    ascon_encrypted_t encrypt_msg;

    // Fetch tag
    std::string tag_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/tag.dat");
    std::ifstream tag_file(tag_filepath, std::ios_base::binary);
    
    if (!tag_file.is_open()) {
        std::cerr << "\nError opening file: " << tag_filepath << std::endl;
        return 1;
    }

    for (auto i = 0; i < 4; ++i) {
        tag_file.read(buffer, 4);
        for (auto byte : buffer) {
            encrypt_msg.tag[i / 2] = (encrypt_msg.tag[i / 2] << 8) | (uint8_t)byte;
        }
    }

    tag_file.close();

    // Fetch ciphertext
    std::string enc_byte_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/encrypt.dat");
    std::ifstream enc_byte_file(enc_byte_filepath, std::ios_base::binary);
    
    if (!enc_byte_file.is_open()) {
        std::cerr << "\nError opening file: " << enc_byte_filepath << std::endl;
        return 1;
    }
    encrypt_msg.ciphertext.insert(encrypt_msg.ciphertext.begin(), std::istreambuf_iterator<char>(enc_byte_file), std::istreambuf_iterator<char>());

    enc_byte_file.close();

    //
    //------------------------------------//
    //
    // Invoke ascon128_decrypt() to get original text and write it to .dat file
    std::string decrypt_filepath = prefix_path + std::string("golden_brick/ascon_cpp_inout/decrypt.jpg");
    std::remove(decrypt_filepath.c_str());
    
    std::ofstream decrypt_file(decrypt_filepath, std::ios_base::binary);    
    
    auto decrypt_m = ascon128_decrypt(key, nonce, associated_data, encrypt_msg);
    if (decrypt_m){
        // std::cout << "\nDeciphered plaintext (hex): " << std::endl;
        // for (auto i : decrypt_m.value()) {
        //     std::cout << std::hex << std::setw(2) << std::setfill('0') << (uint32_t)i;
        // }
        // std::cout.flags(cout_flags);
        // std::cout << std::endl;
        // std::cout << "\nLength = " << decrypt_m.value().length() << " bytes" << std::endl;

        decrypt_file.write(decrypt_m.value().c_str(), static_cast<std::streamsize>(decrypt_m.value().length()));
    } else {
        std::cout << "Failed to decrypt message\n";
    }

    decrypt_file.close();


    // Debug
    // std::cout << "\nKey:";
    // for (auto key_i : key){
    //     std::cout << '\n' << (uint32_t) key_i;
    // }
    // std::cout << '\n';

    // std::cout << "\nNonce:";
    // for (auto nonce_i : nonce){
    //     std::cout << '\n' << (uint32_t) nonce_i;
    // }
    // std::cout << '\n';

    // std::cout << "\nTag:";
    // for (auto tag_i : encrypt_msg.tag){
    //     std::cout << '\n' << (uint64_t) tag_i;
    // }
    // std::cout << '\n';

    return 0;
}

