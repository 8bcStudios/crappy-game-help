class_name SpawnArea

extends Area2D

@export var spawner: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if spawner == true:
		if Input.is_action_just_pressed("spawn"):
			Global.spawn(get_global_mouse_position())
	else:
		pass


func _on_spawn_zone_mouse_entered() -> void:
	spawner = true

func _on_spawn_zone_mouse_exited() -> void:
	spawner = false
