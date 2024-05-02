// #include <ESP8266WiFi.h>
// #include <ESP8266HTTPClient.h>
// #include <WiFiClient.h>

// const char* ssid = "LAPTOP-A49IGV84 0057"; // Replace with your WiFi SSID
// const char* password = "11111111"; // Replace with your WiFi password

// const char* serverName = "http://192.168.137.1:8080/motiontemp/motionServlet"; // Replace with the IP address and port of your servlet
// const int pirPin = D2; // GPIO pin connected to the PIR sensor's output
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

const char* ssid = "LAPTOP-A49IGV84 0057"; // Replace with your WiFi SSID
const char* password = "11111111"; // Replace with your WiFi password

const char* serverName = "http://192.168.137.1:8080/motiontemp/motionServlet"; // Replace with the IP address and port of your servlet

const int motionSensor = D1;
const int buzzerPin = D2;

WiFiClient client;

void setup() {
  Serial.begin(9600);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, HIGH);

  pinMode(motionSensor, INPUT);
  pinMode(buzzerPin, OUTPUT);
  
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");
}

void loop() {
  int motionStatus = digitalRead(motionSensor);
  if (motionStatus == HIGH) {
    digitalWrite(LED_BUILTIN, LOW);
    digitalWrite(buzzerPin, HIGH);
    Serial.println("Motion detected!");

    if (WiFi.status() == WL_CONNECTED) {
      HTTPClient http;
      http.begin(client, serverName);
      http.addHeader("Content-Type", "application/x-www-form-urlencoded");
      String httpRequestData = "motionDetected=true";
      int httpResponseCode = http.POST(httpRequestData);

      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);

      http.end();
    }
    delay(2000); // Active for 2 seconds
  } else {
     HTTPClient http;
      http.begin(client, serverName);
      http.addHeader("Content-Type", "application/x-www-form-urlencoded");
      String httpRequestData = "motionDetected=false";
      int httpResponseCode = http.POST(httpRequestData);
    digitalWrite(LED_BUILTIN, HIGH);
    digitalWrite(buzzerPin, LOW);
    // Serial.println("No motion.");
  }
  delay(100); // Short delay to stabilize sensor
}
