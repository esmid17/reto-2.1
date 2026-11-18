extends CharacterBody2D

@export var velocidad: float = 300.0

func _physics_process(delta: float) -> void:
	var direccion := Input.get_axis("move_left", "move_right")
	
	velocity.x = direccion * velocidad
	move_and_slide()
	
