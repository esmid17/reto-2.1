# Respuestas

### 1. Mantén D dos segundos y suéltala: ¿qué contador subió más y por qué?
Subió mucho más el contador de **cuadros pulsados sondeo, mientras que el contador de eventos recibidos subió únicamente en 1. Esto pasa porque porque `_physics_process()` consulta el estado de la acción continuamente en cada fotograma físico mientras la tecla permanezca presionada; en cambio, `_input()` solo se ejecuta una vez en el instante exacto en que ocurre el cambio de estado al presionar la tecla.

### 2. Mantén A: ¿qué valor muestran `get_axis` y `get_action_strength("move_right")`, y por qué difieren?
`get_axis("move_left", "move_right")` muestra -1.00, mientras que `get_action_strength("move_right")` muestra 0.00. Difieren porque `get_axis()` calcula la diferencia entre la acción positiva que vale 0.00 y la acción negativa , que vale 1.00, devolviendo un valor direccional entre -1.0 y 1.0, por el contrario, `get_action_strength("move_right")` evalúa de forma aislada únicamente la intensidad de la tecla derecha, la cual al no estar presionada es 0.00.

### 3. Gira la rueda del ratón: ¿qué clase de evento aparece y por qué su rama va antes que la del clic?
Aparece la clase `InputEventMouseButton`. Se debe colocar antes que la del clic normal porque en Godot tanto los botones físicos del ratón (izquierdo, derecho, central) como los pasos de la rueda (`MOUSE_BUTTON_WHEEL_UP` y `MOUSE_BUTTON_WHEEL_DOWN`) pertenecen a la misma clase `InputEventMouseButton`, si se evaluara primero una condición general de botón presionado sin filtrar el `button_index`, el giro de la rueda sería capturado por la rama del clic tradicional.