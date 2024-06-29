import os

FILE_PATH = 'hdl/permutation/linear_layer_theory.v'

def check_file_exist():     
     os.makedirs(os.path.dirname(FILE_PATH), exist_ok=True)

def write(str):
     with open(FILE_PATH, "a") as file:
          file.write(str)

def clear_file():
     with open('hdl/permutation/linear_layer_theory.v', 'w') as file:
          pass

def gen_linear_layer_v(register_size, state_size):
     check_file_exist()

     clear_file()
     
     str = f"""module linear_layer (
\tinput[{register_size-1}:0] X0, X1, X2, X3, X4,
\toutput[{register_size-1}:0] Y0, Y1, Y2, Y3, Y4
);
\twire[{state_size-1}:0] s;
\tassign s = {{X0, X1, X2, X3, X4}}; \n
"""
     write(str)

     for i in range(5):
          for j in range(register_size):
               if (i==0):
                    if(j==0):
                         str = f"""\tassign Y{i} = {{(s[{319-j%64}] ^ s[{319-(j+19)%64}] ^ s[{319-(j+28)%64}]), """
                    elif (j==register_size-1):
                         str = f"""(s[{319-j%64}] ^ s[{319-(j+19)%64}] ^ s[{319-(j+28)%64}])}};\n\n"""
                    else:
                         str = f"""(s[{319-j%64}] ^ s[{319-(j+19)%64}] ^ s[{319-(j+28)%64}]), """
               elif (i==1):
                    if (j==0):
                         str = f"""\tassign Y{i} = {{(s[{255-(j%64)}] ^ s[{255-(j+61)%64}] ^ s[{255-(j+39)%64}]), """
                    elif (j==register_size-1):
                         str = f"""(s[{255-(j%64)}] ^ s[{255-(j+61)%64}] ^ s[{255-(j+39)%64}])}};\n\n"""
                    else:
                         str = f"""(s[{255-(j%64)}] ^ s[{255-(j+61)%64}] ^ s[{255-(j+39)%64}]), """
               elif (i==2):
                    if (j==0):
                         str = f"""\tassign Y{i} = {{(s[{191-(j%64)}] ^ s[{191-(j+1)%64}] ^ s[{191-(j+6)%64}]), """
                    elif (j==register_size-1):
                         str = f"""(s[{191-(j%64)}] ^ s[{191-(j+1)%64}] ^ s[{191-(j+6)%64}])}};\n\n"""
                    else:
                         str = f"""(s[{191-(j%64)}] ^ s[{191-(j+1)%64}] ^ s[{191-(j+6)%64}]), """
               elif (i==3):
                    if (j==0):
                         str = f"""\tassign Y{i} = {{(s[{127-(j%64)}] ^ s[{127-(j+10)%64}] ^ s[{127-(j+17)%64}]), """
                    elif (j==register_size-1):
                         str = f"""(s[{127-(j%64)}] ^ s[{127-(j+10)%64}] ^ s[{127-(j+17)%64}])}};\n\n"""
                    else:
                         str = f"""(s[{127-(j%64)}] ^ s[{127-(j+10)%64}] ^ s[{127-(j+17)%64}]), """
               else:
                    if (j==0):
                         str = f"""\tassign Y{i} = {{(s[{63-(j%64)}] ^ s[{63-(j+7)%64}] ^ s[{63-(j+41)%64}]), """
                    elif (j==register_size-1):
                         str = f"""(s[{63-(j%64)}] ^ s[{63-(j+7)%64}] ^ s[{63-(j+41)%64}])}};\n\n"""
                    else:
                         str = f"""(s[{63-(j%64)}] ^ s[{63-(j+7)%64}] ^ s[{63-(j+41)%64}]), """
               write(str)
               
               if (j!=0 and j!=(register_size-1) and (j+1)%8 == 0):
                    str = "\n\t\t\t"
                    write(str)
     str = "endmodule"
     write(str)

if __name__ == "__main__":
     gen_linear_layer_v(64, 320)

