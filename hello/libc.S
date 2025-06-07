#    SPDX-FileCopyrightText: 2025 larissa <lari.casteluci@gmail.com>
#   
#    SPDX-License-Identifier: GPL-3.0-or-later
#
#  This file is a derivative of SYSeg (https://gitlab.com/monaco/syseg)
#  and includes modifications made by the following author(s):
#  larissa <lari.casteluci@gmail.com>

	/* Suppose we receive the argument in %cx. */

	.code16gcc
	.global my_printf
        
        .global get_time
        .global get_time_and_print


	.section .text

	
my_printf:	
	mov   %cx, %bx	
        mov   $0x0e,%ah        # Set TTY mode,by changing the AH register              
        mov   $0x0, %si        # Initialize the offset register to Zero                  
loop:                                 
        mov   (%bx, %si), %al  # Copy value pointed to by address (bx + si) to register al            
        cmp   $0x0, %al               
        je    end                    
        int   $0x10            # Call Bios service print         
        add   $0x1, %si               
        jmp   loop                    
end:
        mov %si, %ax
        ret     
get_time:
        mov $0x02,%ah        # Set to Read RTC Time
        int $0x1a            # Call service for reading RTC        
        shl $0x10, %ecx                         
        mov %dx,   %cx
        mov %ecx,  %eax 
        ret

get_time_and_print:
        mov $0x00,%ah        # Set to Read RTC Time
        int $0x1a            # Call service for reading RTC        

        mov $0x0e,%ah        # Set TTY mode
        
        mov %ch,   %bl
        and $0xf0, %bl
        shr $0x4,  %bl
        call print_hex
        mov %ch,   %bl
        and $0x0f, %bl
        call print_hex

        call print_space

        mov %cl,   %bl
        and $0xf0, %bl
        shr $0x4,  %bl
        call print_hex
        mov %cl,   %bl
        and $0x0f, %bl
        call print_hex

        call print_space

        mov %dh,   %bl
        and $0xf0, %bl
        shr $0x4,  %bl
        call print_hex
        mov %dh,   %bl
        and $0x0f, %bl
        call print_hex

        call print_space
        
        mov %dl,   %bl
        and $0xf0, %bl
        shr $0x4,  %bl
        call print_hex
        mov %dl,   %bl
        and $0x0f, %bl
        call print_hex

        ret
print_space:
        mov $0x20, %al
        int $0x10         
        ret
print_hex:
        cmp $0x09, %bl
        jg  print_alpha
        jmp print_number
        exit_print_hex:
        ret
print_alpha:
        add $0x57, %bl 
        mov %bl,   %al 
        int $0x10
        jmp exit_print_hex
print_number:
        add $0x30, %bl 
        mov %bl,   %al 
        int $0x10        
        jmp exit_print_hex
halt_debug:	
	hlt
	jmp halt_debug



