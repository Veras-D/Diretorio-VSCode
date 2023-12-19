#define canal 2

const int PULSO_UNICO = 1;
const int PULSO_PERIODICO = 2;

int opc, pul = 0;
float tempo1, tempo2 = 0;

void setup() {
  Serial.begin(9600);
  pinMode(canal, OUTPUT);
  digitalWrite(canal, LOW);
}
void loop() {
  Serial.println("Escolha uma opção:");
  Serial.println("[ 1 ] - Pulso Único");
  Serial.println("[ 2 ] - Pulso Periodico");

  while (opc == 0) {
    opc = Serial.parseInt();
  }
  switch (opc) {
    case PULSO_UNICO:
      Serial.println("Defina o tempo do pulso (Em segundos): ");
      while (tempo1 == 0.0) {
        tempo1 = Serial.parseFloat() * 1000;
      }
      Serial.println(tempo1 / 1000);
      if (tempo1 > 0) {
        Serial.println("Pulso Único");
        digitalWrite(canal, HIGH);
        delay(tempo1);
        digitalWrite(canal, LOW);
      } else {
        Serial.println("O tempo não pode ser igual a 0.");
      }
      break;
    case PULSO_PERIODICO:
      Serial.println("Pulso periodico");
      Serial.println("Defina o tempo do pulso (Em segundos): ");
      while (tempo1 == 0.0) {
        tempo1 = Serial.parseFloat() * 1000;
      }
      Serial.println(tempo1 / 1000);
      Serial.println("Defina o tempo de pausa (Em segundos): ");
      while (tempo2 == 0.0) {
        tempo2 = Serial.parseFloat() * 1000;
      }
      Serial.println(tempo2 / 1000);
      Serial.println("Defina a quantidade de pulsos: ");
      while (pul == 0) {
        pul = Serial.parseInt();
      }
      Serial.println(pul);
      if (tempo1 > 0.0 && tempo2 > 0.0 && pul > 0) {
        for (int i = 0; i < pul; i++) {
          digitalWrite(canal, HIGH);
          delay(tempo1);
          digitalWrite(canal, LOW);
          delay(tempo2);
        }
      } else {
        Serial.println("O tempo não pode ser igual a 0.");
      }
      break;
    default:
      Serial.println("Insira uma opção valida!");
      break;
  }
  opc = 0;
  tempo1 = 0.0;
  tempo2 = 0.0;
  pul = 0;
}
