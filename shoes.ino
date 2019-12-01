const int ledPin[4] = {13,12,11,10};//LED connected to digital pin 13
//const int ledPin2 = 12;
const int Sensor[2] = {A0,A1};// Sensor connected to analog pin A0
//const int Sensor2 = A1;
const int threshold = 100; // Threshold is set to 100
int sensorReading[4] = {0,0,0,0}; // variable to store the value read from the sensor pin
//int sensorReading2 = 0; 
int ledState[4] = {LOW,LOW,LOW,LOW};// variable used to store the last LED status, to toggle the light
//int ledState2 = LOW;

//int sensor_1=analogRead(Sensor[0])  

void setup()
{
  for(int i=0;i<4;i++)
  {
    pinMode(ledPin[i], OUTPUT);// declare the ledPin as OUTPUT
    //pinMode(ledPin[1], OUTPUT);
  }
  Serial.begin(9600);

}

void loop()
{
// read the sensor and store it in the variable sensorReading:
  for(int i=0;i<2;i++)
  { sensorReading[i] = analogRead(Sensor[i]);
  //sensorReading[1] = analogRead(Sensor[1]);
  // if the sensor reading is greater than the threshold:
    if (sensorReading[i] >= threshold)
    {
// toggle the status of the ledPin:
      ledState[i] = !ledState[i];
      ledState[i+2] = !ledState[i+2];
      
// update the LED pin :
      digitalWrite(ledPin[i], ledState[i]);
      delay(100);// delay
      digitalWrite(ledPin[i+2], ledState[i+2]);
      delay(100);
    }
     else
    {
      digitalWrite (ledPin[i], ledState[i]); // the init
      digitalWrite (ledPin[i+2], ledState[i+2]);
    }
//if (sensorReading2 >= threshold)
//{
// toggle the status of the ledPin:
//ledState2 = !ledState2;
// update the LED pin :
//digitalWrite(ledPin2, ledState2);
//delay(100); // delay
//}
//else
//{
//digitalWrite (ledPin2, ledState2); // the init
}
  //Serial.print("one ");
  Serial.println(sensorReading[0]);

  //Serial.print("  two ");
  Serial.println(sensorReading[1]);
  
 // //Serial.print("    three ");
 // Serial.println(sensorReading[2]);

  
 // //Serial.print("      four ");
 // Serial.println(sensorReading[3]);
  

}
