/* -*- mode: jde; c-basic-offset: 2; indent-tabs-mode: nil -*- */

/*
  Part of the Wiring project - http://wiring.uniandes.edu.co

  Copyright (c) 2004-05 Hernando Barragan

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
  
  Modified 24 November 2006 by David A. Mellis
  Modified 1 August 2010 by Mark Sproul
*/

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <stdio.h>

#include "wiring_private.h"

static volatile voidFuncPtr intFunc[EXTERNAL_NUM_INTERRUPTS];
// volatile static voidFuncPtr twiIntFunc;

void attachInterrupt(uint8_t interruptNum, void (*userFunc)(void), int mode) {
  if(interruptNum < EXTERNAL_NUM_INTERRUPTS) {
    intFunc[interruptNum] = userFunc;
    
    // Configure the interrupt mode (trigger on low input, any change, rising
    // edge, or falling edge).  The mode constants were chosen to correspond
    // to the configuration bits in the hardware register, so we simply shift
    // the mode into place.
      
    // Enable the interrupt.
      
    switch (interruptNum) {
		case 0:	// INT6 (pin 2)
			EICRB = (EICRB & ~((1 << ISC60) | (1 << ISC61))) | (mode << ISC60);
			EIMSK |= (1 << INT6);
			break;
		case 1: // INT5 (pin 3)
			EICRB = (EICRB & ~((1 << ISC50) | (1 << ISC51))) | (mode << ISC50);
			EIMSK |= (1 << INT5);
			break;
		case 2: // INT4 (pin 6)
			EICRB = (EICRB & ~((1 << ISC40) | (1 << ISC41))) | (mode << ISC40);
			EIMSK |= (1 << INT4);
			break;
		case 3: // INT7 (pin 7)
			EICRB = (EICRB & ~((1 << ISC70) | (1 << ISC71))) | (mode << ISC70);
			EIMSK |= (1 << INT7);
			break;
		case 4: // INT0 (pin SCL)
			EICRA = (EICRA & ~((1 << ISC00) | (1 << ISC01))) | (mode << ISC00);
			EIMSK |= (1 << INT0);
			break;
		case 5: // INT1 (pin SDA)
			EICRA = (EICRA & ~((1 << ISC10) | (1 << ISC11))) | (mode << ISC10);
			EIMSK |= (1 << INT1);
			break;
		case 6: // INT2 (unconnected on Zigduino r1, pin 0 on the Zigduino r2)
			EICRA = (EICRA & ~((1 << ISC20) | (1 << ISC21))) | (mode << ISC20);
			EIMSK |= (1 << INT2);
			break;
		case 7: // INT3 (unconnected on Zigduino r1, pin 1 on the Zigduino r2)
			EICRA = (EICRA & ~((1 << ISC30) | (1 << ISC31))) | (mode << ISC30);
			EIMSK |= (1 << INT3);
			break;
    }
  }
}

void detachInterrupt(uint8_t interruptNum) {
  if(interruptNum < EXTERNAL_NUM_INTERRUPTS) {
    // Disable the interrupt.  (We can't assume that interruptNum is equal
    // to the number of the EIMSK bit to clear, as this isn't true on the 
    // ATmega8.  There, INT0 is 6 and INT1 is 7.)
    switch (interruptNum) {
		case 0:	// INT6 (pin 2)
			EIMSK &= ~(1 << INT6);
			break;
		case 1: // INT5 (pin 3)
			EIMSK &= ~(1 << INT5);
			break;
		case 2: // INT4 (pin 6)
			EIMSK &= ~(1 << INT4);
			break;
		case 3: // INT7 (pin 7)
			EIMSK &= ~(1 << INT7);
			break;
		case 4: // INT0 (pin SCL)
			EIMSK &= ~(1 << INT0);
			break;
		case 5: // INT1 (pin SDA)
			EIMSK &= ~(1 << INT1);
			break;
		case 6: // INT2 (unconnected on Zigduino r1, pin 0 on the Zigduino r2)
			EIMSK &= ~(1 << INT2);
			break;
		case 7: // INT3 (unconnected on Zigduino r1, pin 1 on the Zigduino r2)
			EIMSK &= ~(1 << INT3);
			break;
    }
      
    intFunc[interruptNum] = 0;
  }
}

/*
void attachInterruptTwi(void (*userFunc)(void) ) {
  twiIntFunc = userFunc;
}
*/

SIGNAL(INT6_vect) {
  if(intFunc[EXTERNAL_INT_0])
    intFunc[EXTERNAL_INT_0]();
}
SIGNAL(INT5_vect) {
  if(intFunc[EXTERNAL_INT_1])
    intFunc[EXTERNAL_INT_1]();
}
SIGNAL(INT4_vect) {
  if(intFunc[EXTERNAL_INT_2])
    intFunc[EXTERNAL_INT_2]();
}
SIGNAL(INT7_vect) {
  if(intFunc[EXTERNAL_INT_3])
    intFunc[EXTERNAL_INT_3]();
}
SIGNAL(INT0_vect) {
  if(intFunc[EXTERNAL_INT_4])
    intFunc[EXTERNAL_INT_4]();
}
SIGNAL(INT1_vect) {
  if(intFunc[EXTERNAL_INT_5])
    intFunc[EXTERNAL_INT_5]();
}
SIGNAL(INT2_vect) {
  if(intFunc[EXTERNAL_INT_6])
    intFunc[EXTERNAL_INT_6]();
}
SIGNAL(INT3_vect) {
  if(intFunc[EXTERNAL_INT_7])
    intFunc[EXTERNAL_INT_7]();
}
