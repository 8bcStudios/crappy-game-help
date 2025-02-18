extends Node

var spawnable = preload ("res://Art/Models/Block01.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn(pos) -> void:
		var instance = spawnable.instantiate()
		instance.position = pos
		add_child(instance)
