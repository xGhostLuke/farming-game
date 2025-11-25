class_name Hotbar_Script extends Node2D

@onready var hotbar_frame_1: hotbarFrame = $HotbarFrame1
@onready var hotbar_frame_2: hotbarFrame = $HotbarFrame2
@onready var hotbar_frame_3: hotbarFrame = $HotbarFrame3
@onready var hotbar_frame_4: hotbarFrame = $HotbarFrame4
@onready var hotbar_frame_5: hotbarFrame = $HotbarFrame5
@onready var hotbar_frame_6: hotbarFrame = $HotbarFrame6

var HOE : Item = load("uid://euhd2aghvcem")
var NONE : Item = load("uid://bufgryshx4oes")
var WEEDBAG : Item = load("res://Items/WeedSeedBack.tres")


@onready var hotbarFrameArr : Array[hotbarFrame] = [ 
		hotbar_frame_1,
		hotbar_frame_2,
		hotbar_frame_3,
		hotbar_frame_4,
		hotbar_frame_5,
		hotbar_frame_6,
	]
	
func _ready() -> void:
	hotbar_frame_1.setCurrentItem(HOE)
	hotbar_frame_2.setCurrentItem(WEEDBAG)
	hotbar_frame_3.setCurrentItem(NONE)
	hotbar_frame_4.setCurrentItem(NONE)
	hotbar_frame_5.setCurrentItem(NONE)
	hotbar_frame_6.setCurrentItem(NONE)
	

func switchToNewHotbarFrame(frame : int) -> Item:
	var currentHotbarFrame : hotbarFrame = hotbarFrameArr[frame]
	var currentHotbarFrameItem : Item = currentHotbarFrame.getCurrentItem()
	
	for frames : hotbarFrame in hotbarFrameArr:
		frames.scale = Vector2(1,1)
		
	currentHotbarFrame.scale = currentHotbarFrame.scale*1.5
	
	return currentHotbarFrameItem
	
