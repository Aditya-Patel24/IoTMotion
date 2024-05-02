<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Motion Catcher
</title>
<%@include file="all_component/all_css.jsp"%>
 <style>
      /* .hidden {
        display: none;
      } */

      .code-container {
    position: relative;
    background: #f7f7f7;
    border: 1px solid #ddd;
    padding: 10px;
    overflow: auto;
  }
  .copy-btn {
    position: absolute;
    right: 10px;
    top: 10px;
    padding: 5px 10px;
    background: #007bff;
    color: white;
    border: none;
    cursor: pointer;
  }
    </style>
</head>
<body>
<%@include file="all_component/navbar2.jsp"%>
<div class="container" id="about">
        <h3>Circuit Diagram</h3>
       
        <div class="row" style="margin-top: 50px;">
            <div class="col-md-5 py-3 py-md-0">
                <div class="card">
                    <img src="all_component/img/Circuit.jpg" alt="">
                </div>
            </div>
            <div class="col-md-7 py-3 py-md-0">
              <hr><strong>Steps</strong>
              <ul>
                <li>Gather Materials</li>
                <li>Setup NodeMCU</li>
                <li>Connect PIR Sensor</li>
                <li>Connect Buzzer and LED</li>
                <li>Write Code</li>
                <li>Test the System</li>          
                <li>Refine and Adjust</li>          
      
              </ul>
              <hr>
              <p id="moreText" class="hidden">
                <div class="code-container">
                  <pre id="code">#include <ESP8266WiFi.h>

                    const char* ssid     = "yourNetwork"; // your network SSID (name)
                    const char* password = "yourPassword"; // your network password
                    
                    WiFiClient client;
                    
                    int motionSensor = D1;
                    int buzzerPin = D2;  // Buzzer connected to pin D4
                    
                    void setup() {
                        Serial.begin(9600);
                        pinMode(LED_BUILTIN, OUTPUT);
                        digitalWrite(LED_BUILTIN, HIGH);
                    
                        pinMode(motionSensor, INPUT);
                        pinMode(buzzerPin, OUTPUT);  // Set buzzer pin as output
                        delay(1500);
                    
                        Serial.println("Motion sensor test.");
                    
                        // Connect to WiFi network
                        Serial.println();
                        Serial.println();
                        Serial.print("Connecting to ");
                        Serial.println(ssid);
                    
                        WiFi.begin(ssid, password);
                    
                        while (WiFi.status() != WL_CONNECTED) {
                            delay(500);
                            Serial.print(".");
                        }
                        Serial.println("");
                        Serial.println("WiFi connected");
                    
                        // Connect to the server
                        client.connect("server ip", 8080);
                    }
                    
                    unsigned long currentTime;
                    const unsigned long motionCheckInterval = 150UL;
                    unsigned long previousMotionCheckTime = 0;
                    
                    void loop() {
                        currentTime = millis();
                    
                        if (currentTime - previousMotionCheckTime >= motionCheckInterval) {
                            int isMotionDetected = digitalRead(motionSensor);
                    
                            if (isMotionDetected == 0) {
                                Serial.println("Motion ended!");
                                digitalWrite(LED_BUILTIN, HIGH);
                                digitalWrite(buzzerPin, LOW);
                            } else {
                                Serial.println("Motion detected!");
                                digitalWrite(LED_BUILTIN, LOW);
                                digitalWrite(buzzerPin, HIGH);
                                delay(20000);  // Siren will play for 20 seconds
                    
                                // If motion is detected, send a message to the server
                                client.println("Motion detected!");
                            }
                    
                            previousMotionCheckTime = currentTime;
                        }
                    }</pre>
                  <button class="copy-btn" onclick="copyCode()">Copy</button>
                </div>
              </p>
              <!-- Button to show/hide the additional text -->
              <!-- <div class="btn">
                <button onclick="toggleText()">Code</button>
              </div> -->
            </div>
            </div>
        </div>
    </div>








    <!-- offer -->
    <div class="container" id="offer">
      <div class="row">
        <div class="col-md-3 py-3 py-md-0">
          <i class="fa-solid fa-house-signal"></i>
          <h3>IoT</h3>
          <p>Internet of Things</p>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <i class="fa-solid fa-code"></i>
          <h3>WP</h3>
          <p>Web Programming</p>
        </div>
        <div class="col-md-3 py-3 py-md-0">
          <i class="fa-solid fa-server"></i>
          <h3>AJP</h3>
          <p>Advance Java Programming</p>
        </div>
      
      </div>
    </div>
    <!-- offer -->



	<%@include file="all_component/footer.jsp"%>
	<a href="#" class="arrow"><i><img
			src="all_component/img/arrow.png" alt=""></i></a>
			
			   <script>
      function copyCode() {
        const code = document.getElementById('code').innerText;
        navigator.clipboard.writeText(code).then(() => {
          alert('Code copied to clipboard!');
        });
      }
    </script>
    
</body>
</html>