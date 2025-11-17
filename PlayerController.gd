class_name PlayerController extends CharacterBody2D

@export var moveSpeed = 300.0
var playerReach = 5

func _physics_process(delta: float) -> void:
	_playerMovement()
	
func _playerMovement() -> void:
	var directionX : float = Input.get_axis("move_left", "move_right")
	var directionY : float = Input.get_axis("move_up", "move_down")

	velocity = Vector2(directionX, directionY).normalized() * moveSpeed

	move_and_slide()

func getPlayerPos() -> Vector2:
	return position
