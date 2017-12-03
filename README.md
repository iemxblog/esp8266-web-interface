# ESP8266 Web Interface
This application allows to set pins states of the ESP8266 using a web interface. 


# Screenshot
![screenshot](screenshot.png "Screenshot")

# How to install it

## Install NodeMCU
First, follow the instructions [here](https://nodemcu.readthedocs.io/en/master/en/) on how to [build](https://nodemcu.readthedocs.io/en/master/en/build/) and how to [flash](https://nodemcu.readthedocs.io/en/master/en/flash/) NodeMCU on your ESP8266 board.

Include the following modules :
* ADC
* end user setup
* file
* GPIO
* net
* node
* timer
* UART
* WiFi

## Install the app 

~~~~~
$ git clone https://github.com/iemxblog/esp8266-web-interface
$ cd esp8266-web-interface
$ ./download-luatool.sh
$ ./install.sh
~~~~~

Restart the ESP. A new wifi network beginning with "SetupGadget_" is created. Connect to it, then go to http://192.168.4.1/.
Scan the the networks, choose yours, enter the password, connect to it, and the built-in led choose light show that you are connected. Restart the ESP again, and then the web interface is available at the ip address shown during the connection procedure.
