class_name hotbarFrame extends Sprite2D

var currentItem : Item
var oldItem : Item

@onready var currentItemSprite: Sprite2D = $currentItem

func setCurrentItem(newItem : Item) -> void:
	currentItem = newItem

func getCurrentItem() -> Item:
	return currentItem

func _ready() -> void:
	oldItem = currentItem

func _process(delta: float) -> void:
	if not oldItem == currentItem:
		oldItem = currentItem
		currentItemSprite.texture = currentItem.getItemImage()
