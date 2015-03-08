// **
// * LED on/off Flip-Flop
// * Demonstration of digital input and digital output
// * Press the button to switch the led on.
// * Press the button again to switch the led off.
// **

// set port numbers:
const int button = 3;    // the number of the pushbutton D3 (hardware-pin SV1:4)
const int led =  4;      // the number of the LED D4 (hardware-pin SV1:5)

void setup() {

    // initialize the LED pin as an digital output:
    pinMode(led, OUTPUT);
    digitalWrite(led, HIGH);  // switch led off

    // initialize the pushbutton pin as an digital input:
    pinMode(button, INPUT);
}

// predefine variables
int buttonState = 0;         // variable for reading the pushbutton status (0: not pressed, 1: pressed)
int lastButtonState = 0;     // variable for storing the last state of the button
int ledState = 0;            // variable for status off the led (0: off, 1: on)

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

          } else {

             digitalWrite(led, HIGH);  // switch led off
             ledState = 0;            // store ledState

          } // end if else

       } // end if

    } // end if

    // store buttonState for the next programm cycle
    lastButtonState = buttonState;

} // end loop


