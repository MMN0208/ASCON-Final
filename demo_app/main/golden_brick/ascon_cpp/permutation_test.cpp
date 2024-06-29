#include "ascon-util.h"


#if defined(__linux__) 
    #define prefix_path "/home/xilinx/ascon/ascon_img_processing/main/"
#elif _WIN32
    #define prefix_path "F:/Others/BK_CE2020/Capstone_Project/ascon_img_processing/main/"
#else
#endif



int main() {
  
    ascon_state_t test_arr = {123, 456, 789, 234, 567};

    ascon_permutation(test_arr, 3);

    return 0;
}

