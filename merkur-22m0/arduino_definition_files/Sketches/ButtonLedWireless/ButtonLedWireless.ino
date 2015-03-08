// **
// * LED on/off Flip-Flop
// * Demonstration of digital input and digital output
// * Press the button to switch the led on.
// * Press the button again to switch the led off.
// **

#include "RadioFunctions.h"

// set port numbers:
const int button = 3;    // the number of the pushbutton D3 (hardware-pin SV1:4)
const int led =  4;      // the number of the LED D4 (hardware-pin SV1:5)

void setup() {

    // initialize the LED pin as an digital output:
    pinMode(led, OUTPUT);
    digitalWrite(led, HIGH);  // switch led off

    // initialize the pushbutton pin as an digital input:
    pinMode(button, INPUT);
    
    Serial.begin(9600);  // Start up serial
    Serial1.begin(115200);
    rfBegin(24);  // Initialize ATmega128RFA1 radio on channel 11 (can be 11-26)
}

// predefine variables
int buttonState = 0;         // variable for reading the pushbutton status (0: not pressed, 1: pressed)
int lastButtonState = 0;     // variable for storing the last state of the button
int ledState = 0;            // variable for status off the led (0: off, 1: on)
char message = 0;

void loop(){

    // read the state of the pushbutton value:
    buttonState = digitalRead(button);

    // check if buttonState has changed
    if (buttonState != lastButtonState) {

       // check if the button is pressed
       if (buttonState == HIGH) {

          // check if the led is off
          if (ledState == 0) {

             digitalWrite(led, LOW); // switch led on
             ledState = 1;            // store ledState
             rfWrite('1'); // ...send it out the radio.

          } else {
             digitalWrite(led, HIGH);  // switch led off
             ledState = 0;            // store ledState
             rfWrite('0'); // ...send it out the radio.
          } // end if else

       } // end if

    } // end if

    // store buttonState for the next programm cycle
    lastButtonState = buttonState;

   if (rfAvailable())  // If data receievd on radio...
   {
     message=rfRead();
     Serial.print(message);  // ... send it out serial.
     if(message=='0'){
        digitalWrite(led, HIGH);  // switch led off
        ledState = 0;            // store ledState
     }
     if(message=='1'){
        digitalWrite(led, LOW);  // switch led off
        ledState = 1;            // store ledState
     }
   }
} // end loop


