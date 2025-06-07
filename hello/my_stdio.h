/*
 *    SPDX-FileCopyrightText: 2025 larissa <lari.casteluci@gmail.com>
 *   
 *    SPDX-License-Identifier: GPL-3.0-or-later
 *
 *  This file is a derivative of SYSeg (https://gitlab.com/monaco/syseg)
 *  and includes modifications made by the following author(s):
 *  larissa <lari.casteluci@gmail.com>
 */

#ifndef E8_H
#define E8_H

void __attribute__((fastcall, naked)) my_printf(const char *); 
void __attribute__((fastcall, naked)) get_time_and_print(void); 
int  __attribute__((fastcall, naked)) get_time(void); 

#endif	
