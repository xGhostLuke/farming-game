class_name MapController extends TileMapLayer

@export var mapSize : int
const TILESIZE : int = 32

var tileDic : Dictionary[Vector2i, Tile] = {}
var tileDicWithPlant : Dictionary[Vector2i, Tile] = {}

@onready var player : PlayerController = $"../CharacterBody2D"

func _ready() -> void:
	tile_set.tile_size = Vector2(TILESIZE,TILESIZE)
	_generateMap()

func _process(delta: float) -> void:
	for pos in tileDicWithPlant:
		_growPlant(tileDicWithPlant.get(pos))

### Should take an abs value cause player Action might be negative 
func processPlayerAction(item : Item) -> void:
	var playerPos : Vector2i = player.getPlayerPos() / TILESIZE
	var cell : Vector2i = (local_to_map(get_global_mouse_position()))
	var tile : Tile = tileDic.get(cell)
	var action : ActionEnum.Action = item.getItemAction()
	
	var dif : Vector2 = cell - playerPos
	var triedReach = sqrt(dif.x*dif.x + dif.y*dif.y)
	
	if not triedReach <= player.playerReach:
		return
	
	if item is SeedBag:
		tile.setPlantOnTile(item.getPlantType())
		tileDicWithPlant[tile.getPos()] = tile
	else:
		tile.actionOnTile(action)
	
	_displayTile(tile)

func _generateMap() -> void:
	var usedCells : Array = get_used_cells()
	
	for pos in usedCells:
		tileDic[pos] = Tile.new(pos, TileType.Type.GRASS)
		
	_displayTileMap()
	
func _displayTileMap() -> void:
	for tile in tileDic:
		_displayTile(tileDic.get(tile))

func _growPlant(tile : Tile) -> void: 
	if tile.getPlantOnTile() == PlantType.Plant.NONE:
		return
	
	var rnd : int = randf_range(0, 1000) as int
	if rnd <= 1: ##maybe this would be better with a timer idk
		tile.setPlantState()
		_displayTile(tile)
		if tile.getPlantState() == PlantType.State.THIRD:
			tileDicWithPlant.erase(tile.getPos())
		print("next plant state")

func _displayTile(tile : Tile ):
	var pos : Vector2i = tile.getPos()
	var type : TileType.Type = tile.getTileType()
	var typeOfTile : int
	var plantOnTile : PlantType.Plant = tile.getPlantOnTile()
	match type:
		TileType.Type.GRASS:
			typeOfTile = 0
		TileType.Type.DIRT:
			typeOfTile = 0
		TileType.Type.HOED:
			typeOfTile = 1
		TileType.Type.WATERED:
			typeOfTile = 1

	if typeOfTile == 1:
		_renderPlantOnTile(tile)
		match plantOnTile:
			PlantType.Plant.NONE:
				pass
			PlantType.Plant.WEED:
				pass
				#set_cell(pos, 0, Vector2i(6,5))

func _renderPlantOnTile(tile : Tile) -> void:
	if tile.getPlantOnTile() == PlantType.Plant.NONE:
		set_cells_terrain_connect([tile.getPos()], 0, 1)
		return
		
	var tileSetOfSetToEnumValue : int = 11
	var vec : Vector2i = Vector2i(tile.getPlantState(), tile.getPlantOnTile() + tileSetOfSetToEnumValue)
	
	set_cell(tile.getPos(), 0, vec)
