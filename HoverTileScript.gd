extends Sprite2D

const TILE_SIZE = 32

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	
	var snapped_x = (int(mouse_pos.x / TILE_SIZE) * TILE_SIZE) + TILE_SIZE / 2
	var snapped_y = (int(mouse_pos.y / TILE_SIZE) * TILE_SIZE) + TILE_SIZE / 2
	
	position = Vector2(snapped_x, snapped_y)
