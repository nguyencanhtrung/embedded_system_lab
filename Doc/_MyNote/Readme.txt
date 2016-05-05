By Trung Nguyen - 26-11-2015
Important notes for Embedded Systems Lab
The correctness is verified by running test_endianess program
This conclusion may be just valid for Embedded System Lab in WS15/16
--------------------------------------------------
Big Endian means: 
	Least Significant Byte (granuality = 8) (LSB)/ LSHalfWord (gran = 16) will be store in the highest address
	If: access size = 1 byte	
		From Register point of view:     MSB | MSB -1 | ... | LSB +1| LSB
		From Memory point of view  :     LSB | LSB +1 | ... | MSB -1| MSB     
	If: access size = 2 byte	
		From Register point of view:     MSHalfword | MSHalfword -1| ... | LSHalfword +1 | LSHalfword
		From Memory point of view  :     LSHalfword | LSHalfword +1| ... | MSHalfword -1 | MSHalfword 
	
	So: Before sending data from register to the memory: Data must be re-arranged as memory point of view, 
		using encode_function in wishbone;
	    After receiving data from memory (wishbone bus), data must be re-arranged as Register point of view 
		before storing in register, using decode_function in wishbone file

-- LOAD and STORE in this architecture
	cơ chế của lệnh store là sẽ store từ địa chỉ thấp -> cao (make sense)
//	DATA [ 31-24 | 23-16 | 15-8 | 7-0 ]    --- HW point of view
//	st08 DATA, xx     		=> xx is put on DATA(7-0); 
//	st16 DATA, xxab			=> xxab is put on DATA(15 - 0)
//	st32 DATA, xxab_cdef		=> xxab_cdef is put on DATA(31 - 0)
//	--------------------
	cơ chế của lệnh load là sẽ load từ địa chỉ cao -> thấp (make sense)
//	ld08 r0, DATA			=> DATA(31-24) is put on r0; 
//  	ld16 r0, DATA			=> DATA(31-16) is put on r0
//	ld32 r0, DATA			=> DATA(31-0) is put on r0
//  --------------------
Memory ORGNIZATION (Read in config.vhd)
		__________________  0x0000_0000 (base address)
		Instruction memory
		   (256 bytes)
		__________________  0x0000_0400 (base address)
		   Data memory
		   (256 bytes)
		__________________  0x000F_0000 (base address)
		       LED
		     (1 byte)
		__________________  0x000F_0004 (base address)
		    SW_BTN(FOO)
		     (4 bytes)
		__________________  0x000F_0008 (base address)
		       LCD
		     (4 bytes)
		------------------

How to determine the mask_address? what is the purpose of mask address?
 - The mask address is used to determine the range of individual memory segment
 - CPU doesn't need to know about 256 bytes or 1 byte of range, it just need to know the MASK_addr and BASE_addr
 - Programmer is the one who need to define the range in byte and then calculate the MASK_addr
 - CPU uses 2 informations: BASE_addr and MASK_addr to work with DATA segment in load, store data, 
	OR to work with peripherals (memory-mapped base) in their memory segments.
 
 - How to work with BASE_addr and MASK_addr; We know the basic principle

	BASE_addr AND MASK_addr

	=> position of bit '1' in mask means that position in BASE is untouchable, cannot be changed by any mean 
	=> vice versal, position of bit '0' in mask means that position in BASE can be changed. 
	   and by changing those bits in BASE_addr we can jump to different mem location in that segment.

 - How to determine the mask_address if we know the range and base address;
	Some initial values:
		Each memory location is 1 byte or Moi mot address chi den 1 memory location co' size la 1 byte
		__________   0x00000
		1byte
		__________   0x00001
		1 byte
		----------

	Assume: at the beginning we want to mask(dont want to change any bit) whole bits => MASK_Addr = 0xFFFF_FFFF
		NOW we want to have a "mem segment size" of 256 bytes => 256 memory locations
		vay ta phai duoc thay doi 8 LSbits => unmask 8 LSbits => MASK_Addr = 0xFFFF_FF00 = 0xFFFF_FFFF - (256 -1)
 



