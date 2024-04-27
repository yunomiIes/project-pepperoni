alpha = 1
depth = -8
tiles[0] = array_create(0)
tiles[1] = array_create(0)
tiles[2] = array_create(0)
for (var i = 0; i < 3; i++)
{
    var lay_id = layer_get_id(concat("Tiles_Secret", (i + 1)))
    tilemap_sprite[i] = -4
    if ((lay_id != -1))
    {
        var map_id = layer_tilemap_get_id(lay_id)
        var ts = tilemap_get_tileset(map_id)
        var t = -4
        switch ts
        {
            case 75:
                t = tile_ruin
                break
            case 76:
                t = tile_ruin2
                break
            case 91:
                t = sprite_tile_beachtest
                break
            case 92:
                t = sprite_tile_beachtest2
                break
            case 95:
                t = sprite_tile_beachtest2dark
                break
            case 80:
                t = tile_chateau1
                break
            case 50:
                t = tile_desert
                break
            case 52:
                t = tile_ufo
                break
            case 51:
                t = tile_cavern
                break
            case 77:
                t = tile_dungeon
                break
            case 78:
                t = tile_dungeon2
                break
            case 79:
                t = tile_dungeon3
                break
            case 66:
                t = tile_entrance1
                break
            case 65:
                t = tile_tower
                break
            case 87:
                t = tile_farm
                break
            case 96:
                t = sprite_tile_forest
                break
            case 97:
                t = sprite_tile_forest1_shade
                break
            case 98:
                t = sprite_tile_forest2
                break
            case 124:
                t = bg_tilefreezer
                break
            case 24:
                t = tile_freezer2
                break
            case 84:
                t = tile_graveyard1
                break
            case 86:
                t = tile_graveyard3
                break
            case 85:
                t = tile_graveyard2
                break
            case 48:
                t = tile_factory
                break
            case 26:
                t = tile_factory2424
                break
            case 126:
                t = spr_kidspartytile
                break
            case 100:
                t = sprite_tile_kungfu
                break
            case 101:
                t = tile_kunfucity
                break
            case 102:
                t = sprite_tile_kungfustructure
                break
            case 13:
                t = spr_mansiontile2
                break
            case 56:
                t = tile_castle
                break
            case 72:
                t = tile_medieval
                break
            case 73:
                t = tile_medieval2
                break
            case 74:
                t = tile_medieval3
                break
            case 103:
                t = sprite_tile_minigolf
                break
            case 104:
                t = sprite_tile_minigolf2
                break
            case 105:
                t = sprite_tile_minigolf2_shad
                break
            case 71:
                t = tile_secret
                break
            case 14:
                t = sprite_tile_space1
                break
            case 116:
                t = sprite_tile_spaceback1
                break
            case 110:
                t = sprite_tile_space2
                break
            case 88:
                t = tile_pinball1
                break
            case 89:
                t = tile_pinball2
                break
            case 90:
                t = tile_pinball3
                break
            case 32:
                t = sprite_tile_war1
                break
            case 18:
                t = sprite_tile_war2
                break
            case 130:
                t = sprite_tile_war3
                break
            case 7:
                t = sprite_tile_war4
                break
            case 30:
                t = sprite_tile_war1shadow
                break
            case 8:
                t = sprite_tile_space2shadow
                break
            case 133:
                t = sprite_tile_citycarnival
                break
            case 17:
                t = sprite_tile_citydark
                break
            case 123:
                t = spr_medievalinterior
                break
            case 134:
                t = spr_medievallibrary
                break
            case 5:
                t = spr_interiortile
                break
            case 142:
                t = tilespr_towerentrancehall
                break
        }

        tilemap_sprite[i] = t
        var _w32 = (sprite_get_width(t) / 32)
        for (var yy = 0; yy < image_yscale; yy++)
        {
            for (var xx = 0; xx < image_xscale; xx++)
            {
                var _x = (x + (xx * 32))
                var _y = (y + (yy * 32))
                var data = tilemap_get_at_pixel(map_id, _x, _y)
                var _id = tile_get_index(data)
                var xi = 0
                var yi = 0
                for (var j = 0; j < _id; j++)
                {
                    xi++
                    if ((xi >= _w32))
                    {
                        xi = 0
                        yi++
                    }
                }
                array_push(tiles[i], [_x, _y, (xi * 32), (yi * 32)])
                data = tile_set_empty(data)
                tilemap_set_at_pixel(map_id, data, _x, _y)
            }
        }
    }
}
trace(tilemap_sprite)
if ((array_length(tiles[0]) <= 0) && (array_length(tiles[1]) <= 0) && (array_length(tiles[2]) <= 0))
    instance_destroy()
