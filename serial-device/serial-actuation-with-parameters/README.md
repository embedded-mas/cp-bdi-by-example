# 1. Application overview
This example illustrates serial-based actuatons that require parameters.

# 2. Application Scenario
This application contains an [agent](https://github.com/embedded-mas/cp-bdi-by-example/blob/main/serial-device/serial-actuation-with-parameters/src/agt/sample_agent.asl) whose goal is to keep a light on. It perceives the light sate and executes the internal action `.lightOn(X)` to swith it and keep it on by `X`milliseconds.

The light is controlled by an Arduino device wich runs the program available [here](https://github.com/embedded-mas/cp-bdi-by-example/blob/main/serial-device/serial-actuation-with-parameters/arduino/lights/lights.ino).

# 2.1 Some notes on parameters management
In this example, the serial communication is managed by the [Embedded_Protocol_2](https://github.com/embedded-mas/embedded-mas/tree/master/src/arduino/Embedded_Protocol_2) library. It provides the following primitives to manage actuation instructions received through serial port:
- `actuationName(String input)`: returns the actuation identifier. Ex.: returns *test* if the received actuation instruction is *test(3,"hello", 3.14)*
- `paramStr(String s, int i)`: returns the string parameter at the $i^{th}$ position. Ex.: `paramStr(test(3,"hello", 3.14),1)` returns `hello`
- `paramInt(String s, int i)`: returns the integer parameter at the $i^{th}$ position. Ex.: `paramStr(test(3,"hello", 3.14),0)` returns 3
- `paramFloat(String s, int i)`: returns the float parameter at the $i^{th}$ position. Ex.: `paramStr(test(3,"hello", 3.14),2)` returns 3.14

# 3. Requirements
- Java JRE >= 21

# 4. Running the example
- type `./gradlew run`, to start tje JaCaMo application.
