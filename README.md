## Rotary Encoder FPGA design with VHDL
## Soal
1. Buatlah resume tentang rotary encoder. Macam-macam rotary encoder dan cara kerjanya. 
2. Buatlah rangkaian digital dengan kode vhdl untuk membaca incremental rotary encoder dengan menggunakan board DE10 Lite yang ditampilkan dalam 3 buah 7-segment. 
3. Buatlah kode testbech vhdl untuk kebutuhan pengujian point 2. 
4. Buatlah laporan pengujian untuk rangkaian yang telah dibuat. 
5. Tugas dikumpulkan dalam laporan yang berisi point 1 sampai 4.
![Rotary Encoder](https://i.ibb.co/Pc447hY/image.png)
## Jawaban
1. Project file di https://github.com/nakbaral21/rotary-encoder/blob/main/rotary_encoder/rotary_encoder.qpf
2. VHDL file di https://github.com/nakbaral21/rotary-encoder/blob/main/rotary_encoder/rotary_encoder.vhd
3. do testbench file :
   - [ ] Searah Jarum Jam di https://github.com/nakbaral21/rotary-encoder/blob/main/rotary_encoder/simulation/modelsim/tb_rotaryenc1.do
   - [ ] Berlawanan Arah Jarum Jam di https://github.com/nakbaral21/rotary-encoder/blob/main/rotary_encoder/simulation/modelsim/tb_rotaryenc2.do
4. Laporan di https://github.com/nakbaral21/rotary-encoder/blob/main/Laporan.pdf