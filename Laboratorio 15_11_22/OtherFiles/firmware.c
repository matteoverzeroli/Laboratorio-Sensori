//import libreria accelerometro
#include "Nano33BLEAccelerometer.h"

//creiamo la struttura per dati accelerometro
Nano33BLEAccelerometerData accelerometerData;

//stringa di supporto per visualizzare i dati
char str[60];

void setup() {
  //apertura comunnicazione seriale
  Serial.begin(115200);
  while(!Serial);

  //inizializzazione accelerometro
  Accelerometer.begin();
}

void loop() {
  //se e disponibile una misura la estraggo
  if (Accelerometer.pop(accelerometerData)){
    //inserisci nella stringa str i valori misurati nel formato "x y z"
    sprintf(str, "%.3f %.3f %.3f", accelerometerData.x,accelerometerData.y,accelerometerData.z);
    //scrivi sulla porta seriale la stringa str
    Serial.println(str);
  }
  //pausa di 100ms
  delay(100);
}