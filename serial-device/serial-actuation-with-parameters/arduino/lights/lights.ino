#include<Embedded_Protocol_2.h>
#include<ArduinoJson.h>

Communication communication;


const int LIGHT = 13;

int light_state = 1;

void setup() 
{
  pinMode(LIGHT,OUTPUT);
  digitalWrite(LIGHT,1);  //light starts on
     
  Serial.begin(9600);
  Serial.print("iniciando....");
  /* Build perception that the lihgt is on and send it to the upper layers */
  communication.startBelief("light_state");
  communication.beliefAdd(1);
  communication.endBelief();
  communication.sendMessage();
  delay(5000); //wait 5 second to launch the MAS application
  digitalWrite(LIGHT,0);  //light starts on
  communication.startBelief("light_state");
  communication.beliefAdd(0);
  communication.endBelief();
  communication.sendMessage();
  
}

void loop() 
{
  while(Serial.available() > 0){ //check whether there is some information from the serial (possibly from the agent)
     String s = Serial.readString();     
     Serial.println(communication.actuationName(s));
     String actuationName = communication.actuationName(s);
     int delay_time = communication.paramInt(s,0); //the delay time is the 1st parameter 
     if(actuationName.equals("light_on")){ //if the agent sends "light_on", then switch the light on
        Serial.println(delay_time);
        digitalWrite(LIGHT,1); 
        light_state = 1; 
        communication.startBelief("light_state");
        communication.beliefAdd(light_state);
        communication.endBelief();
        communication.sendMessage();
        delay(delay_time);

        digitalWrite(LIGHT,0);
        light_state = 0;
        communication.startBelief("light_state");
        communication.beliefAdd(light_state);
        communication.endBelief();
        communication.sendMessage();      

        
     } 
   }  
  
  
  
  
    
}
