class_name Item extends Resource

@export var itemName : String = ""
@export var image : Texture2D
@export var action : ActionEnum.Action = ActionEnum.Action.NONE

func getItemName() -> String:
	return itemName

func getItemAction() -> ActionEnum.Action:
	return action

func getItemImage() -> Texture2D:
	return image
