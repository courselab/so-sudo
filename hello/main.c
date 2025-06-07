/*
 *    SPDX-FileCopyrightText: 2021 Monaco F. J. <monaco@usp.br>
 *    SPDX-FileCopyrightText: 2025 larissa <lari.casteluci@gmail.com>
 *   
 *    SPDX-License-Identifier: GPL-3.0-or-later
 *
 *  This file is a derivative of SYSeg (https://gitlab.com/monaco/syseg)
 *  and includes modifications made by the following author(s):
 *  larissa <lari.casteluci@gmail.com>
 */

#include <my_stdio.h>
#define C_PRINT 1

register char *value asm ("edx");
unsigned int rtc_time;


int main(void)   
{
  my_printf ("RTC is: "); 
 
  if (C_PRINT) {  
      rtc_time = get_time();

      *value = (char)(((rtc_time & 0xf0000000) >> 7*4) + 0x30);
      my_printf(value);               
      *value = (char)(((rtc_time & 0x0f000000) >> 6*4) + 0x30);
      my_printf(value); 
      my_printf (":"); 
      *value = (char)(((rtc_time & 0x00f00000) >> 5*4) + 0x30);
      my_printf(value); 
      *value = (char)(((rtc_time & 0x000f0000) >> 4*4) + 0x30);
      my_printf(value); 
      my_printf (":"); 
      *value = (char)(((rtc_time & 0x0000f000) >> 3*4) + 0x30);
      my_printf(value); 
      *value = (char)(((rtc_time & 0x00000f00) >> 2*4) + 0x30);
      my_printf(value);
      my_printf ("D"); 
      *value = (char)(((rtc_time & 0x000000f0) >> 1*4) + 0x30);
      my_printf(value); 
      *value = (char)(((rtc_time & 0x0000000f) >> 0*4) + 0x30);
      my_printf(value); 
  } else {
    get_time_and_print();
  }
  return 0;
}





