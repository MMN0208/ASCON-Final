default:
	@echo "COMMANDS"
	@echo "make ascon ________________ Run ascon encryption + decryption testcase"
	@echo "make ascon_new ____________ Run ascon encryption + decryption 8-bit interface testcase"
	@echo "make encryption ___________ Run ascon encryption testcase"
	@echo "make encryption_new _______ Run ascon encryption 8-bit interface testcase"
	@echo "make decryption ___________ Run ascon decryption testcase"
	@echo "make decryption_new _______ Run ascon decryption 8-bit interface testcase"
	@echo "make hash _________________ Run ascon hash testcase"
	@echo "make wave _________________ Open gtkwave to view waveform"
	@echo "make clean ________________ Remove all output files"


ascon:
	@echo "Running ascon encryption + decryption testcase"
	@python3 run.py
	@iverilog -o output/test.out -c testbench/command_file.txt
	@cd output && \
	vvp test.out |& tee -a tests.log


ascon_new:
	@echo "Running ascon encryption + decryption 8-bit interface testcase"
	@python3 run.py
	@iverilog -o output/test.out -c testbench/command_file_new.txt
	@cd output && \
	vvp test.out |& tee -a tests.log
	

encryption:
	@echo "Running ascon encryption testcase"
	@python3 run.py
	@iverilog -o output/test.out -c testbench/command_file_enc.txt
	@cd output && \
	vvp test.out |& tee -a tests.log


encryption_new:
	@echo "Running ascon encryption 8-bit interface testcase"
	@python3 run.py
	@iverilog -o output/test.out -c testbench/command_file_enc_new.txt
	@cd output && \
	vvp test.out |& tee -a tests.log


decryption:
	@echo "Running ascon decryption testcase"
	@python3 run.py
	@iverilog -o output/test.out -c testbench/command_file_dec.txt
	@cd output && \
	vvp test.out |& tee -a tests.log

decryption_new:
	@echo "Running ascon decryption 8-bit interface testcase"
	@python3 run.py
	@iverilog -o output/test.out -c testbench/command_file_dec_new.txt
	@cd output && \
	vvp test.out |& tee -a tests.log

hash:
	@echo "Running ascon hash testcase"
	@python3 run.py
	@iverilog -o output/test.out -c testbench/command_file_hash.txt
	@cd output && \
	vvp test.out |& tee -a tests.log


wave:
	@echo "Opening gtkwave to view waveform"
	@cd output && \
	gtkwave test.vcd


clean:
	@echo "Removing all output files"
	@rm -rf output/*