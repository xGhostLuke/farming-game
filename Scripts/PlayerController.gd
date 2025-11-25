class_name PlayerController extends CharacterBody2D
 
@onready var mapController : MapController = $"../Map"
@onready var hotbar: Hotbar_Script = $"../CanvasLayer/Hotbar"


@export var moveSpeed = 300.0
var currentItem : Item
var playerReach = 5
var currentToolbarIndex : int = 0
var maxToolbarIndex : int = 6

func _physics_process(delta: float) -> void:
	_playerMovement()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Mouse1"):
		mapController.processPlayerAction(currentItem)
		
	if Input.is_action_just_pressed("mousewheel_down"):
		currentToolbarIndex = (currentToolbarIndex + 1) % maxToolbarIndex
	if Input.is_action_just_pressed("mousewheel_up"):
		if currentToolbarIndex > 0:
			currentToolbarIndex = (currentToolbarIndex - 1) % maxToolbarIndex
	currentItem = hotbar.switchToNewHotbarFrame(currentToolbarIndex)
	
func _playerMovement() -> void:
	var directionX : float = Input.get_axis("move_left", "move_right")
	var directionY : float = Input.get_axis("move_up", "move_down")

	velocity = Vector2(directionX, directionY).normalized() * moveSpeed

	move_and_slide()

func getPlayerPos() -> Vector2:
	return position
