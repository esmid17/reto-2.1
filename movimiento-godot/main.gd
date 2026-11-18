extends Node2D

@onready var hud: Label = $Hud

# Contadores para move_right
var cuadros_pulsados := 0
var eventos_recibidos := 0

# Variables
var ultima_clase := "Ninguna"
var ultimo_dispositivo := "Teclado"
var tipo_senal := "Digital"

func _physics_process(_delta: float) -> void:
	# Sondeo de cuadros con move_right
	if Input.is_action_pressed("move_right"):
		cuadros_pulsados += 1
	
	# Estado booleano de jump
	var saltando := Input.is_action_pressed("jump")
	var eje := Input.get_axis("move_left", "move_right")
	var fuerza_derecha := Input.get_action_strength("move_right")
	
	# Actualización del texto en pantalla
	hud.text = (
		"--- ESTADO ---\n" +
		"Jump: %s\n" % str(saltando) +
		"Eje (get_axis): %.2f\n" % eje +
		"Fuerza move_right: %.2f\n\n" % fuerza_derecha +
		"--- ÚLTIMO EVENTO ---\n" +
		"Clase: %s\n" % ultima_clase +
		"Dispositivo: %s\n" % ultimo_dispositivo +
		"Tipo de señal: %s\n\n" % tipo_senal +
		"--- CONTADORES move_right ---\n" +
		"Cuadros pulsados (Sondeo): %d\n" % cuadros_pulsados +
		"Eventos recibidos (_input): %d" % eventos_recibidos
	)

func _input(event: InputEvent) -> void:
	# Ignorar eco del teclado
	if event.is_echo():
		return
	
	# Contar eventos de move_right al presionar
	if event.is_action_pressed("move_right"):
		eventos_recibidos += 1
	
	# Identificar clase, dispositivo y señal
	if event is InputEventKey and event.is_pressed():
		ultima_clase = event.get_class()
		ultimo_dispositivo = "Teclado"
		tipo_senal = "Digital"
	elif event is InputEventMouseButton and event.is_pressed():
		ultima_clase = event.get_class()
		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			ultimo_dispositivo = "Ratón (Rueda)"
			tipo_senal = "Digital (pasos)"
		else:
			ultimo_dispositivo = "Ratón (Clic)"
			tipo_senal = "Digital"
	elif event is InputEventMouseMotion:
		ultima_clase = event.get_class()
		ultimo_dispositivo = "Ratón (Movimiento)"
		tipo_senal = "Posición / Relativa"
	elif event is InputEventJoypadMotion:
		ultima_clase = event.get_class()
		ultimo_dispositivo = "Mando (Joystick/Gatillo)"
		tipo_senal = "Analógica"
