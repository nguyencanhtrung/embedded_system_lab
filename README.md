####EMBEDDED SYSTEM LAB
_**TU Kaiserslautern - Winter Semester 2015/2016**_

####Contents

[1. Description](#part1)

[2. Requirements](#part2)

[3. Tools and tasks](#part3)

[4. Team members](#part4)

[Initial Setup](#part5)

####1. Description<a id="part1"></a>
   **_Embedded system lab_** includes _4 warm-up assignments_ and _1 final project_.
   The goal of this laboratory is to gain an understanding of the general design methodology of communicating embedded systems as they are employed in technical systems in various fields, such as automotive systems, production automation and control, and mobile communication.
   
   Through the lab, students are going to:
   - Make decision about hardware/software partition to achieve specific requirements.
   - Design, Implementation, Synthesis and Test of an embedded system
   
####2. Requirements<a id="part2"></a>
   - VHDL, Assembler
   - Knowledge of embedded system architecture
    - Polling, Interrupt mechanism
    - Memory-mapped I/O
    - Big Endian/ Little Endian
    - Etc.
  
####3. Tools and tasks<a id="part3"></a>
  - _**Tools and working platform**_
  Development board: Digilent Genesys (Xilinx FPGA virtex 5)
  Platform: Linux OS
  Synthesize tool: Xilinx ISE 14.7
  Simulation tool: ISIM
  Assembler for customized CPU

  - _**Tasks**_
    - Hardware implementation: Designing peripheral and interrupt controllers (written in VHDL)
     + Button and switch controller; 
     + Audio controller working with AC-97 codec
     + LCD controller working with st7066 LCD

    - Software is written in Assembly and executed on a customized CPU.
  
####4. Team members<a id="part4"></a>
  * [Trung C. Nguyen](mailto:nguyencanhtrung@me.com "Send an email to Trung")
  * [Waseem Hassan](mailto:waseemh40@gmail.com "Send an email to Hassan")
  
---
Initial Setup Tutorial<a id="part5"></a>
---
#####Setup git

1. Download and install git for linux/windows
2. Open terminal or git bash
3. Set your name $git config --global user.name "<name>"
4. Set your mail address $git conifg --global user.email email@xx.com

#####Get the current version

1. Open terminal or git bash
2. Go to a location of your choice
3. Clone repository $git clone https://github.com/nguyencanhtrung/embedded_system_lab.git
