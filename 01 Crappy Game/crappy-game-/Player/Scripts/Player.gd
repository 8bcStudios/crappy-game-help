class_name Player

extends CharacterBody2D

@export var speed: float = 150
@export var acceleration: float = .25
@export var gravity: float = 500
@export var jump_velocity: float = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_vector = get_input_vector()
	
	apply_movement(input_vector, delta)
	
	apply_gravity(delta)
	apply_velocity(delta)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		apply_jump()

func get_input_vector() -> Vector2:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("left", "right")
	return input_vector

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
	
func apply_movement(input_vector: Vector2, delta: float) -> void:
	velocity.x = lerp(velocity.x, input_vector.x * speed, acceleration)
	
func apply_velocity(delta: float) -> void:
	move_and_slide()

func apply_jump() -> void:
	velocity.y -= jump_velocity

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Block"):
		body.collision_layer = 1
		body.collision_mask = 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Block"):
		body.collision_layer = 2
		body.collision_mask = 2
		
