extends TileMapLayer

@export var mapSize : int
var tileArr : Array[Tile] = []
const TILESIZE : int = 32

const GRASS_TILE : Vector2i = Vector2i(0,0)
const DIRT_TILE : Vector2i = Vector2i(1,0)

const player : PlayerController = $"../Player"

func _ready() -> void:
	tile_set.tile_size = Vector2(TILESIZE,TILESIZE)
	_generateMap()

func _process(delta: float) -> void:
		if Input.is_action_just_pressed("Mouse1"):
			var cell : Vector2 = local_to_map(get_viewport().get_mouse_position() / scale) 
			set_cell(cell, 0, DIRT_TILE)

func _generateMap() -> void:
	for x in range(mapSize):
		for y in range(mapSize):
			tileArr.append(Tile.new(Vector2i(x, y), TileType.Type.GRASS))
	_displayTileMap()
	
func _displayTileMap() -> void:
	for tile in tileArr:
		_displayTile(tile)

func _displayTile(tile : Tile, ):
	var pos : Vector2i = tile.getPos()
	var type : TileType.Type = tile.getTileType()
	var typeOfTile : Vector2i
	match type:
		TileType.Type.GRASS:
			typeOfTile = GRASS_TILE
		TileType.Type.DIRT:
			typeOfTile = DIRT_TILE
	set_cell(pos, 0, typeOfTile)
