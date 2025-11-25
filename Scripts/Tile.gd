class_name Tile

@export var _tileType : TileType.Type
@export var _watered : bool = false
@export var _pos : Vector2i
@export var _plantOnTile : PlantType.Plant
@export var _plantStateOnTile: PlantType.State
@export var _texture : Texture2D

func _init(pos : Vector2i, tileType: TileType.Type) -> void:
	_setPos(pos)
	setTileType(tileType)

func setTileType(tileType : TileType.Type):
	_tileType = tileType
func getTileType() -> TileType.Type:
	return _tileType
func setWatered(watered : bool):
	_watered = watered
func getWatered() -> bool:
	return _watered
func setPlantOnTile(plantOnTile : PlantType.Plant):
	_plantOnTile = plantOnTile
func getPlantOnTile() -> PlantType.Plant:
	return _plantOnTile
func _setPos(pos : Vector2i):
	_pos = pos
func getPos() -> Vector2i:
	return _pos
func setTexture(texture : Texture2D) -> void:
	_texture = texture
func getPlantState() -> PlantType.State:
	return _plantStateOnTile
func setPlantState() -> void:
	if getPlantState() == PlantType.State.THIRD:
		return
	_plantStateOnTile = _plantStateOnTile + 1
	
func actionOnTile(action : ActionEnum.Action) -> void:
	match action:
		ActionEnum.Action.HOE:
			setTileType(TileType.Type.HOED)
		ActionEnum.Action.WATER:
			if getTileType() == TileType.Type.HOED:
				setTileType(TileType.Type.WATERED)
		ActionEnum.Action.NONE:
			if getPlantOnTile() == PlantType.Plant.NONE:
				print("fail")
				return
			if getPlantState() == PlantType.State.THIRD: #idk this should be changed later
				print("harvest")
				setPlantOnTile(PlantType.Plant.NONE) 
			
