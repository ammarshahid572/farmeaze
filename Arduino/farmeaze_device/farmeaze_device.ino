
#include <Arduino.h>
#if defined(ESP32)
  #include <WiFi.h>
  #define DHTPIN 21
#elif defined(ESP8266)
  #include <ESP8266WiFi.h>
  #define DHTPIN D1
#endif
#include <Firebase_ESP_Client.h>

//Provide the token generation process info.
#include "addons/TokenHelper.h"
//Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"

// Insert your network credentials
#define WIFI_SSID "WIFISSID"
#define WIFI_PASSWORD "WIFIPASSWORD"

// Insert Firebase project API Key
#define API_KEY "thisapiishiddencuzofsecurity"

// Insert RTDB URLefine the RTDB URL */
#define DATABASE_URL "https://database.off.firebase.app" 
#include <DHT.h>
#define DHTTYPE DHT11 
DHT dht(DHTPIN, DHTTYPE);

//Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;

void setup(){
  Serial.begin(115200);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  dht.begin();

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  /* Sign up */
  if (Firebase.signUp(&config, &auth, "", "")){
    Serial.println("ok");
    signupOK = true;
  }
  else{
    Serial.printf("%s\n", config.signer.signupError.message.c_str());
  }

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h
  
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
}

void loop(){
  if (Firebase.ready() && signupOK && (millis() - sendDataPrevMillis > 1000)){
    sendDataPrevMillis = millis();
    
    float t= dht.readTemperature();
    float h= dht.readHumidity();
    int m= analogRead(33);
    delay(2);
    Serial.print("temp:"+String(t));
    Serial.print("humid:"+String(h));
    Serial.print("moisture:"+String(m));
    Serial.println("light:"+String(analogRead(32)));
    
    
    
    // Write an Int number on the database path test/int
    if (isnan(h))h=0;
    else{
    if (Firebase.RTDB.setFloat(&fbdo, "device0/humidity", h)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
    }
    count++;
    
    // Write an Float number on the database path test/float
    if (isnan(t))t=0;
    else{
    if (Firebase.RTDB.setFloat(&fbdo, "device0/temperature",  t)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }}

    
    if (Firebase.RTDB.setInt(&fbdo, "device0/moisture", m)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
    if (Firebase.RTDB.setInt(&fbdo, "device0/light",  analogRead(32))){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
  }
}
