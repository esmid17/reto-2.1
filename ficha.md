# Ficha del Dispositivo: Teclado

* **Tecnología de captura:** Son aquellos interruptores ubicados bajo cada tecla que cierran un circuito eléctrico al ser presionados, la estructura interna del dispositivo detecta la intersección activa en la matriz y envía un código de escaneo (*scancode*) hacia la computadora mediante interfaz USB.
* **Tipo de señal:** Digital, cada tecla solo registra dos estados discretos posibles: presionada (`1` / `true`) o suelta (`0` / `false`), sin valores intermedios de intensidad o recorrido.
* **Ventaja:** Ofrece una respuesta instantánea y alta accuracy para acciones discretas y simultáneas, además de contar con una gran cantidad de teclas independientes.
* **Limitación:** No posee sensibilidad gradual a la presión ni ejes continuos, por lo que no permite controlar velocidades variables o ángulos de movimiento suaves de forma nativa como lo hace un joystick.
* **Juego ejemplo:** *Touhou* (juego de plataformas de precisión donde las entradas digitales exactas determinan desplazamiento).
* **Fuente:** https://docs.godotengine.org/es/4.x/classes/class_inputeventkey.html