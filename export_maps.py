import zipfile
import re
import sys
import os
from PyQt5.QtCore import QRectF
from PyQt5.QtGui import QImage

z = zipfile.ZipFile("_data/pokered-master.zip", "r")

text_entries = {}
for text_filename in filter(lambda n: n.startswith("pokered-master/text/") and n.endswith(".asm"), z.namelist()):
    f = z.open(text_filename)
    for line in f:
        line = line.strip().decode('utf-8')
        if line.endswith("::"):
            current_label = line[:-2]
            line = f.readline().strip().decode('utf-8')
            if line.startswith("text "):
                text = []
                while not line.startswith("done") and not line.startswith("prompt") and line != "":
                    line = line.replace("#", "POKE")
                    if len(line) > 6:
                        if line[0:6] in ("text \"", "next \"", "cont \"", "line \"", "para \"") and line.endswith("\""):
                            text.append(line[6:-1])
                        #else:
                        #    print("Unknown text line:", current_label, line)
                        
                    line = f.readline().strip().decode('utf-8')
                text_entries[current_label] = "\n".join(text)
    f.close()

def copyTile(dst, src, tile_nr, x, y, *, tile_size=8, tile_count_width=16):
    tx = (tile_nr % tile_count_width) * tile_size
    ty = (tile_nr // tile_count_width) * tile_size
    if ty >= src.height():
        return
    for px in range(tile_size):
        for py in range(tile_size):
            dst.setPixel(x * tile_size + px, y * tile_size + py, src.pixel(tx + px, ty + py))

def applyPallete(image, pal_name):
    if pal_name not in palletes:
        return
    for n in range(1, 4): # We skip color 0, which is near white but slightly purple, and use white there instead.
        image.setColor(3 - n, palletes[pal_name][n])

palletes = {}

for line in z.open("pokered-master/data/super_palettes.asm"):
    line = line.strip()
    m = re.match(b"RGB ([0-9]+),([0-9]+),([0-9]+)", line)
    if b"; PAL_" in line:
        name = line[line.find(b"; PAL_") + 6:].strip()
        palletes[name] = []
        current_pallet = palletes[name]
    if m:
        color = 0xFF000000 | ((int(m.group(1)) * 255 // 31) << 16) | ((int(m.group(2)) * 255 // 31) << 8) | ((int(m.group(3)) * 255 // 31) << 0)
        current_pallet.append(color)

print(sorted(palletes.keys()))
blockset_pal_map = {
    "cavern": b"CAVE",
    "cemetery": b"GREYMON",
    "club": b"MEWMON",
    "facility": b"MEWMON",
    "forest": b"ROUTE",
    "gate": b"MEWMON",
    "gym": b"MEWMON",
    "house": b"REDMON",
    "interior": b"REDMON",
    "lab": b"REDMON",
    "lobby": b"MEWMON",
    "mansion": b"MEWMON",
    "overworld": b"ROUTE",
    "plateau": b"MEWMON",
    "pokecenter": b"MEWMON",
    "reds_house": b"MEWMON",
    "ship": b"MEWMON",
    "ship_port": b"ROUTE",
    "underground": b"CAVE",
}

global_tileset = {}
global_image = QImage(512, 512, QImage.Format_ARGB32)
block_sets = {}
collision_list = []
tile_count = 0
# Read the blocksets, these are 4x4 tile sets, we convert those to 2x2 tiles in a global tileset
for blockset_file in filter(lambda n: n.startswith("pokered-master/gfx/blocksets/") and n.endswith(".bst"), z.namelist()):
    base_name = re.match("pokered-master/gfx/blocksets/(.*)\.bst", blockset_file).group(1)
    #print(base_name)
    sys.stdout.flush()
    image = QImage.fromData(z.open("pokered-master/gfx/tilesets/%s.png" % (base_name)).read()).convertToFormat(QImage.Format_Indexed8)
    applyPallete(image, blockset_pal_map.get(base_name, b"REDBAR"))
    image = image.convertToFormat(QImage.Format_ARGB32)
    collision_data = z.open("pokered-master/gfx/tilesets/%s.tilecoll" % (base_name)).read()

    block_data = z.open(blockset_file).read()
    block_count = len(block_data) // 16
    block_set = []
    block_sets[base_name] = block_set
    for block_nr in range(block_count):
        block = block_data[block_nr*16:block_nr*16+16]
        for x in range(2):
            for y in range(2):
                idx = x * 2 * 4 + y * 2
                tile = (
                    base_name,
                    block[idx],
                    block[idx+1],
                    block[idx+4],
                    block[idx+5]
                )
                if tile not in global_tileset:
                    global_tileset[tile] = tile_count
                    if tile[3] in collision_data:
                        if tile[3] == 0x52 and base_name == "overworld":
                            collision_list.append(1) #grass
                        elif tile[3] == 0x20 and base_name == "forest":
                            collision_list.append(1) #grass
                        elif tile[3] == 0x45 and base_name == "plateau":
                            collision_list.append(1) #grass
                        elif tile[4] == 0x17 and base_name == "cavern":
                            collision_list.append(3) #collision
                        elif tile[1] == 0x29 and base_name == "cavern":
                            collision_list.append(5) #topcollision
                        elif tile[1] == 0x1e and base_name == "forest":
                            collision_list.append(5) #topcollision
                        elif tile[2] == 0x2F and base_name == "forest":
                            collision_list.append(3) #collision
                        else:
                            collision_list.append(0) #passible
                    else:
                        if tile[3] in [0x14, 0x32, 0x48] and base_name not in ["facility", "gate", "gym", "house", "interior", "mansion", "lab", "lobby", "pokecenter", "reds_house", "ship", "cemetery"]:
                            collision_list.append(2) #water
                        elif tile[3] in [0x14] and base_name in ["gym"]:
                            collision_list.append(2) #water
                        elif (tile[3] == 0x37 or tile[4] == 0x37) and tile[1] == tile[2] and tile[1] != 0x37 and base_name in ["overworld"]:
                            collision_list.append(4) #ledge
                        else:
                            collision_list.append(3) #collision
                    tx = (tile_count % 32) * 2
                    ty = (tile_count // 32) * 2
                    
                    copyTile(global_image, image, tile[1], tx, ty)
                    copyTile(global_image, image, tile[2], tx + 1, ty)
                    copyTile(global_image, image, tile[3], tx, ty + 1)
                    copyTile(global_image, image, tile[4], tx + 1, ty + 1)
                    if collision_list[-1] == 1:
                        for px in range(16):
                            for py in range(16):
                                if global_image.pixel(tx * 8 + px, ty * 8 + py) == 0xffffffff:
                                    global_image.setPixel(tx * 8 + px, ty * 8 + py, 0x00ffffff)
                    tile_count += 1
                block_set.append(global_tileset[tile])
global_image.save("resources/tiles.png")
f = open("resources/tilecollision.txt", "wt")
for n in range(32):
    f.write(",".join(map(str, collision_list[n*32: n*32+32])) + "\n")
f.close()

def getWildPokemonData(map_label):
    def readPokemonData(f, is_red):
        active = True
        encounters = []
        while len(encounters) < 11:
            line = f.readline().strip().decode('ascii')
            if line.upper() == "IF DEF(_BLUE)":
                active = not is_red
            elif line.upper() == "IF !DEF(_RED)":
                active = not is_red
            elif line.upper() == "IF DEF(_RED)":
                active = is_red
            elif line.upper() == "ENDC":
                active = True
            elif active:
                assert line.startswith("db ")
                line = line[3:]
                if len(encounters) == 0:
                    if line == "$00":
                        return []
                    line = int(line[1:], 16)
                else:
                    line = line.split(",")
                encounters.append(line)
        return encounters

    map_index = map_names.index(map_label)
    n = 0
    for line in z.open("pokered-master/data/wild_mons.asm"):
        if line.startswith(b"\tdw "):
            if n == map_index:
                line = line[4:line.find(b";")].strip()
                #print(map_index, map_label, line)
                for wild_pokemon_filename in filter(lambda n: n.startswith("pokered-master/data/wildPokemon/") and n.endswith(".asm"), z.namelist()):
                    f = z.open(wild_pokemon_filename)
                    if line == f.readline()[:-2]:
                        land_pokemon_red = readPokemonData(f, True)
                        water_pokemon_red = readPokemonData(f, True)
                    f.close()
                    f = z.open(wild_pokemon_filename)
                    if line == f.readline()[:-2]:
                        land_pokemon_blue = readPokemonData(f, False)
                        water_pokemon_blue = readPokemonData(f, False)
                    f.close()
            n += 1
    if land_pokemon_red == land_pokemon_blue and water_pokemon_red == water_pokemon_blue:
        if len(land_pokemon_red) < 1 and len(water_pokemon_red) < 1:
            return None
        return land_pokemon_red, water_pokemon_red
    return land_pokemon_red, water_pokemon_red, land_pokemon_blue, water_pokemon_blue

# Now we have a global tile set that we could use for any map.
# This contains 1017 tiles, which we can fit in a 512x512 texture (but there are still a few duplicates, however, we might want to color each tileset?)
# We also have our new block sets now, which contain 4 tiles per block entry into this global tileset.
print("tile_count", tile_count)

map_names = []
map_sizes = {}
for line in z.open("pokered-master/constants/map_constants.asm"):
    m = re.match(b"\tmapconst ([A-Z0-9_]*), +([0-9]+), +([0-9]+) ;", line)
    if m:
        name = m.group(1).decode('ascii')
        x, y = int(m.group(2)), int(m.group(3))
        if x < 1 or y < 1:
            map_names.append("UNUSED_MAP")
            continue
        map_sizes[name] = (x, y)
        map_names.append(name)

class OverworldMap:
    def __init__(self):
        self.__parts = {}
    
    def add(self, name, tilemap, connections):
        self.__parts[name] = {"tilemap": tilemap, "connections": connections}
    
    def finalize(self):
        first = sorted(self.__parts.keys())[0]
        self.__place(first, 0, 0)
        
        x_min = 0
        y_min = 0
        x_max = 0
        y_max = 0
        for name in sorted(self.__parts.keys()):
            if "x" in self.__parts[name]:
                x, y = self.__parts[name]["x"], self.__parts[name]["y"]
                x_min = min(x, x_min)
                y_min = min(y, y_min)
                x_max = max(x + len(self.__parts[name]["tilemap"][0]), x_max)
                y_max = max(y + len(self.__parts[name]["tilemap"]), y_max)
        for name in sorted(self.__parts.keys()):
            if "x" in self.__parts[name]:
                self.__parts[name]["x"] -= x_min
                self.__parts[name]["y"] -= y_min
        x_size = x_max - x_min
        y_size = y_max - y_min

        tilemap = []
        for y in range(y_size):
            tilemap.append([-1] * x_size)
        for name in sorted(self.__parts.keys()):
            map_data = self.__parts[name]
            xo, yo = map_data["x"], map_data["y"]
            for y in range(len(map_data["tilemap"])):
                tilemap[y_size - 1 - (yo + y)][xo:xo+len(map_data["tilemap"][y])] = map_data["tilemap"][len(map_data["tilemap"]) - 1 - y]

        size_line = "OVERWORLD"
        if not os.path.isdir("resources/map/%s" % (size_line)):
            os.mkdir("resources/map/%s" % (size_line))
        f = open("resources/map/%s/tilemap.txt" % (size_line), "wt")
        f.write("%d, %d\n" % (len(tilemap[0]), len(tilemap)))
        for y in range(len(tilemap)):
            f.write(", ".join(map(str, tilemap[y])))
            f.write("\n")
        f.close()
        
        if False:
            image = QImage(x_size * 16, y_size * 16, QImage.Format_ARGB32)
            for name in sorted(self.__parts.keys()):
                map_data = self.__parts[name]
                if "x" in map_data:
                    for y in range(len(map_data["tilemap"])):
                        for x in range(len(map_data["tilemap"][0])):
                            tile = map_data["tilemap"][y][x]
                            copyTile(image, global_image, tile, x + map_data["x"], map_data["y"] + len(map_data["tilemap"]) - 1 - y, tile_size=16, tile_count_width=32)
            image.save("resources/_worldmap.png")

    def __place(self, name, x, y):
        if "x" in self.__parts[name]:
            return
        self.__parts[name]["x"] = x
        self.__parts[name]["y"] = y
        for direction, cdata in self.__parts[name]["connections"].items():
            dst, xy, offset = cdata
            if direction == b'EAST_MAP_CONNECTION':
                self.__place(dst, x + len(self.__parts[name]["tilemap"][0]), y + xy - offset)
            if direction == b'WEST_MAP_CONNECTION':
                self.__place(dst, x - len(self.__parts[dst]["tilemap"][0]), y + xy - offset)
            if direction == b'NORTH_MAP_CONNECTION':
                self.__place(dst, x + xy - offset, y - len(self.__parts[dst]["tilemap"]))
            if direction == b'SOUTH_MAP_CONNECTION':
                self.__place(dst, x + xy - offset, y + len(self.__parts[name]["tilemap"]))

    def has(self, name):
        return name.encode('ascii') in self.__parts

    def getOffset(self, name):
        data = self.__parts[name.encode('ascii')]
        return data["x"], data["y"]

    def getSize(self):
        x_min = 0
        y_min = 0
        x_max = 0
        y_max = 0
        for name in sorted(self.__parts.keys()):
            if "x" in self.__parts[name]:
                x, y = self.__parts[name]["x"], self.__parts[name]["y"]
                x_min = min(x, x_min)
                y_min = min(y, y_min)
                x_max = max(x + len(self.__parts[name]["tilemap"][0]), x_max)
                y_max = max(y + len(self.__parts[name]["tilemap"]), y_max)
        x_size = x_max - x_min
        y_size = y_max - y_min
        return x_size, y_size

overworld_map = OverworldMap()
warp_data = {}
object_data = {}
wild_pokemon = {}
trainer_header_info = {}
main_asm = z.open("pokered-master/main.asm").read()
for map_header_file in filter(lambda n: n.startswith("pokered-master/data/mapHeaders/") and n.endswith(".asm"), z.namelist()):
    if map_header_file.endswith("copy.asm"):    # skip the unused map
        continue
    f = z.open(map_header_file)
    header_label = f.readline()
    tileset = re.match(b"\tdb ([A-Z0-9_]*) ;", f.readline()).group(1)
    size_line = re.match(b"\tdb ([A-Z0-9_]*)_HEIGHT", f.readline()).group(1).decode('ascii')
    size = map_sizes[size_line]
    size = (size[1], size[0])
    blocks_label, texts_label, scripts_label = re.match(b"\tdw ([A-Za-z0-9]*), ([A-Za-z0-9]*), ([A-Za-z0-9]*)", f.readline()).groups()
    offset = main_asm.find(b"\n" + blocks_label + b":")
    assert offset > 0
    offset = main_asm.find(b"INCBIN \"", offset)
    assert offset > 0
    end_offset = main_asm.find(b"\"\n", offset)
    assert end_offset > 0
    block_filename = main_asm[offset+8:end_offset]
    connection_header = re.match(b"\tdb ([A-Z\|\$0 ]+)", f.readline()).group(1).strip()
    connections = {}
    overworld_map_name = None
    if connection_header not in [b'0', b'$0', b'$00']:
        for direction in connection_header.split(b"|"):
            connection_data = f.readline().strip()
            connection_type, data = connection_data.split(b" ", 1)
            src, dst, xy, offset, _ = map(bytes.strip, data.split(b",", 4))
            assert src == overworld_map_name or overworld_map_name is None
            overworld_map_name = src
            assert connection_type not in connections
            connections[connection_type] = (dst, int(xy) * 2, int(offset) * 2)
    object_pointer = re.match(b"\tdw ([A-Za-z0-9_]+)", f.readline()).group(1)
    f.close()
    f = z.open(map_header_file.replace("/mapHeaders/", "/mapObjects/"))
    assert f.readline() == object_pointer + b":\n"
    border_block = re.match(b"\tdb (.[a-z0-9][a-z0-9]?) ;", f.readline()).group(1)
    assert f.readline() == b"\n"
    warp_count = int(re.match(b"\tdb ([0-9]+) ;", f.readline()).group(1))
    warps = []
    assert size_line not in warp_data
    warp_data[size_line] = warps
    for n in range(warp_count):
        x, y, target_index, target = re.match(b"\twarp ([0-9]+), ([0-9]+), ([0-9]+), ([A-Z0-9_\-]+)", f.readline()).groups()
        x, y, target_index = int(x), int(y), int(target_index)
        warps.append({"x": x, "y": y, "target": target.decode('ascii'), "target_index": target_index})
    assert f.readline() == b"\n"
    sign_count = int(re.match(b"\tdb ([0-9]+) ;", f.readline()).group(1))
    for n in range(sign_count):
        x, y, target_index, target_name = re.match(b"\tsign ([0-9]+), ([0-9]+), ([0-9]+) ; ([A-Za-z0-9_\-]+)", f.readline()).groups()
        x, y, target_index = int(x), int(y), int(target_index)
    assert f.readline() == b"\n"
    object_count = int(re.match(b"\tdb ([0-9]+) ;", f.readline()).group(1))
    objects = []
    object_data[size_line] = objects
    for n in range(object_count):
        sprite, x, y, movement, range_or_direction, other = re.match(b"\tobject ([A-Z0-9_]+), ([0-9]+), ([0-9]+), ([A-Z0-9_]+), ([0-9A-Z_]+), (.+)", f.readline()).groups()
        sprite, x, y, movement, range_or_direction, other = sprite.decode('ascii'), int(x), int(y), movement.decode('ascii'), range_or_direction.decode('ascii'), other.decode('ascii')
        objects.append({"x": x, "y": y, "sprite": sprite, "movement": movement, "range_or_direction": range_or_direction, "other": list(map(str.strip, other.split(",")))})

    if warp_count > 0:
        assert f.readline() == b"\n"
        assert f.readline() == b"\t; warp-to\n"
        for n in range(warp_count):
            x, y, source_width = re.match(b"\twarp_to ([0-9]+), ([0-9]+), ([A-Z0-9_\-]+)", f.readline()).groups()
            x, y = int(x), int(y)
            assert x == warps[n]["x"]
            assert y == warps[n]["y"]
    f.close()
    
    f = z.open(map_header_file.replace("/data/mapHeaders/", "/scripts/"))
    trainer_header_info[size_line] = []
    for line in f:
        if b'TrainerHeader' in line and line.endswith(b':\n'):
            assert f.readline().startswith(b'\tdbEventFlagBit EVENT_BEAT_')
            line = f.readline()
            if line == b'\tdb 0 ; view range\n':
                view_range = 0
            else:
                view_range = int(re.match(b"\tdb \\(\\$([0-9]+) << 4\\) ;", line).group(1))
            assert f.readline().startswith(b'\tdwEventFlagAddress EVENT_BEAT_')
            pre_battle_text_label = re.match(b'\tdw ([A-Za-z0-9]+) ;', f.readline()).group(1).decode('utf-8')
            post_battle_text_label = re.match(b'\tdw ([A-Za-z0-9]+) ;', f.readline()).group(1).decode('utf-8')
            done_battle_text_label = re.match(b'\tdw ([A-Za-z0-9]+) ;', f.readline()).group(1).decode('utf-8')
            done_battle_text_label_alt = re.match(b'\tdw ([A-Za-z0-9]+) ;', f.readline()).group(1).decode('utf-8')
            assert done_battle_text_label == done_battle_text_label_alt  # For some reason, this label is always the same.

            if post_battle_text_label == "RocketHideout3AfterBattleText3":
                post_battle_text_label = "RocketHide3AfterBattleText3"
            if post_battle_text_label == "RocketHideout4AfterBattleText2":
                post_battle_text_label = "RocketHide4AfterBattleText2"
            if post_battle_text_label == "RocketHideout4AfterBattleText3":
                post_battle_text_label = "RocketHide4AfterBattleText3"
            if post_battle_text_label == "RocketHideout4AfterBattleText4":
                post_battle_text_label = "RocketHideout4Text_455ec"
            if post_battle_text_label == "ViridianForestAfterBattleText1":
                post_battle_text_label = "ViridianFrstAfterBattleText1"
            if post_battle_text_label == "ViridianForestAfterBattleText2":
                post_battle_text_label = "ViridianFrstAfterBattleText2"
            if post_battle_text_label == "ViridianForestAfterBattleText3":
                post_battle_text_label = "ViridianFrstAfterBattleText3"
            
            trainer_header_info[size_line].append({
                "view_range": view_range,
                "pre_battle": text_entries["_" + pre_battle_text_label],
                "post_battle": text_entries["_" + post_battle_text_label],
                "done_battle": text_entries["_" + done_battle_text_label],
            })
    f.close()
    
    wild_pokemon[size_line] = getWildPokemonData(size_line)

    if tileset == b"MART": tileset = b"POKECENTER"
    if tileset == b"REDS_HOUSE_1": tileset = b"REDS_HOUSE"
    if tileset == b"REDS_HOUSE_2": tileset = b"REDS_HOUSE"
    if tileset == b"DOJO": tileset = b"GYM"
    if tileset == b"MUSEUM": tileset = b"GATE"
    if tileset == b"FOREST_GATE": tileset = b"GATE"
    if tileset == b"00": tileset = b"OVERWORLD"
    
    block_data = z.open("pokered-master/%s" % (block_filename.decode('ascii'))).read()
    if block_filename == b'maps/undergroundpathns.blk':
        block_data += b'\x01\x01\x01\x01'
    assert len(block_data) == size[0] * size[1] # this fails for "undergroundpathns", which seems 4 bytes too small...
    
    block_set = block_sets[tileset.lower().decode('ascii')]
    tilemap = []
    for y in range(size[1]):
        row0 = []
        row1 = []
        for x in range(size[0]):
            index = block_data[x + y * size[0]] * 4
            block = block_set[index:index+4]
            row0.append(block[0])
            row0.append(block[1])
            row1.append(block[2])
            row1.append(block[3])
        tilemap.insert(0, row0)
        tilemap.insert(0, row1)

    if overworld_map_name is not None:
        assert size_line == overworld_map_name.decode('ascii')
        overworld_map.add(overworld_map_name, tilemap, connections)
    else:
        os.makedirs("resources/map/%s" % (size_line), exist_ok=True)
        f = open("resources/map/%s/tilemap.txt" % (size_line), "wt")
        f.write("%d, %d\n" % (len(tilemap[0]), len(tilemap)))
        for y in range(len(tilemap)):
            f.write(", ".join(map(str, tilemap[y])))
            f.write("\n")
        f.close()

    if False:
        image = QImage(size[0] * 32, size[1] * 32, QImage.Format_ARGB32)
        h = size[1] * 2
        for y in range(h):
            for x in range(size[0] * 2):
                tile = tilemap[y][x]
                copyTile(image, global_image, tile, x, h - 1 - y, tile_size=16, tile_count_width=32)
        image.save("resources/__%s.png" % (size_line))

overworld_map.finalize()

trainer_name = '?'
trainer_parties = {}
for line in z.open("pokered-master/data/trainer_parties.asm"):
    if line.endswith(b"Data:\n"):
        trainer_name = line[:-6].decode('utf-8').upper()
        if trainer_name == "GREEN1":
            trainer_name = "SONY1"
        if trainer_name == "GREEN2":
            trainer_name = "SONY2"
        if trainer_name == "GREEN3":
            trainer_name = "SONY3"
        if trainer_name == "PSYCHIC":
            trainer_name = "PSYCHICTR"
        trainer_parties[trainer_name] = []
    if line.startswith(b"\tdb "):
        parts = line[4:].strip().split(b",")
        assert parts[-1] == b"0"
        parts.pop()
        party = []
        if parts[0] == b"$FF":
            for n in range(0, len(parts) - 1, 2):
                party.append((int(parts[n+1]), parts[n+2].decode('ascii')))
        else:
            level = int(parts[0])
            for name in parts[1:]:
                party.append((level, name.decode('ascii')))
        trainer_parties[trainer_name].append(party)

def getExportPosition(map_name, x, y):
    if overworld_map.has(map_name):
        x_offset, y_offset = overworld_map.getOffset(map_name)
        map_size = overworld_map.getSize()
        map_name = "OVERWORLD"
    else:
        x_offset, y_offset = 0, 0
        map_size = map_sizes[map_name][1] * 2, map_sizes[map_name][0] * 2
    return x + x_offset, map_size[1] - (y + y_offset + 1), map_name

def tempOrNot(map_name, filename):
    if os.path.exists("resources/map/%s/%s.lua" % (map_name, filename)):
        os.makedirs("resources/temp_map/%s" % (map_name), exist_ok=True)
        return "resources/temp_map/%s/%s.lua" % (map_name, filename)
    return "resources/map/%s/%s.lua" % (map_name, filename)

overworld_file = open(tempOrNot("OVERWORLD", "warps"), "wt")
for name in sorted(warp_data.keys()):
    if overworld_map.has(name):
        f = overworld_file
        f.write("--map: %s\n" % name)
    else:
        f = open(tempOrNot(name, "warps"), "wt")
    warps = warp_data[name]
    for data in warps:
        if data["target"] == "-1":
            possible_sources = []
            for source_name, source_warps in warp_data.items():
                if not overworld_map.has(source_name):
                    continue
                for n in range(len(source_warps)):
                    d = source_warps[n]
                    if d["target"] == name and data["target_index"] == n:
                        possible_sources.append((source_name, n, d))
            if name == "ROUTE_22_GATE" and len(possible_sources) == 2:  # ROUTE_22_GATE exits are controlled by a script for some reason...
                if data["y"] > 4:
                    possible_sources = list(filter(lambda n: n[0] == "ROUTE_22", possible_sources))
                else:
                    possible_sources = list(filter(lambda n: n[0] == "ROUTE_23", possible_sources))
            if len(possible_sources) == 1:
                assert data["target_index"] == possible_sources[0][1]
                target = possible_sources[0][2]
                x, y, _ = getExportPosition(name, data["x"], data["y"])
                if y == 0:
                    y = -1
                tx, ty, tmap = getExportPosition(possible_sources[0][0], target["x"], target["y"])
                f.write("map.createObject(%d, %d).onTouch(function(player) player.teleportTo(\"%s\", %d, %d) end)\n" % (x, y, tmap, tx, ty))
            else:
                print("---", warps.index(data), name, data)
                for source in possible_sources:
                    print(source)
        elif data["target"] not in warp_data:
            print("+++", name, data)
        else:
            target = warp_data[data["target"]][data["target_index"]]
            x, y, _ = getExportPosition(name, data["x"], data["y"])
            if y == 0:
                y = -1
            tx, ty, tmap = getExportPosition(data["target"], target["x"], target["y"])
            f.write("map.createObject(%d, %d).onTouch(function(player) player.teleportTo(\"%s\", %d, %d) end)\n" % (x, y, tmap, tx, ty))

trainer_name_map = {
    "BUG_CATCHER": "BUG CATCHER",
    "JR_TRAINER_M": "JR.TRAINER#MALE",
    "JR_TRAINER_F": "JR.TRAINER#FEMALE",
    "SUPER_NERD": "SUPER NERD",
    "CUE_BALL": "CUE BALL",
    "PSYCHIC_TR": "PSYCHIC",
    "BIRD_KEEPER": "BIRD KEEPER",
    "PROF_OAK": "PROF.OAK",
    "COOLTRAINER_M": "COOLTRAINER#MALE",
    "COOLTRAINER_F": "COOLTRAINER#FEMALE",
    "LT_SURGE": "LT.SURGE",
    "SONY1": "RIVAL",
}
trainer_image_map = {
    "jrtrainerm": "jr.trainerm",
    "jrtrainerf": "jr.trainerf",
    "sony1": "rival1",
    "psychictr": "psychic",
    "ltsurge": "lt.surge",
}
trainer_no_headers = {
    # We need to skip a whole bunch of trainers that are handled by scripts, and thus have no normal headers.
    # This includes gym leaders, and a few other scripted event related things.
    ("CELADON_GYM", "ERIKA"), # Gym leader
    ("CERULEAN_CITY", "ROCKET"),
    ("CERULEAN_GYM", "MISTY"), # Gym leader
    ("CINNABAR_GYM", "BLAINE"), # Gym leader
    ("CINNABAR_GYM", "SUPER NERD"), # Scripted to only attack on wrong awnser on a question
    ("CINNABAR_GYM", "BURGLAR"), # Scripted to only attack on wrong awnser on a question
    ("FIGHTING_DOJO", "BLACKBELT"), #TODO, this blocks all trainers here, but only 1 should be blocked.
    ("FUCHSIA_GYM", "KOGA"), # Gym leader
    ("GAME_CORNER", "ROCKET"),
    ("MT_MOON_3", "SUPER NERD"), # The one guarding the fossils
    ("OAKS_LAB", "RIVAL"),
    ("PEWTER_GYM", "BROCK"), # Gym leader
    ("ROCKET_HIDEOUT_4", "GIOVANNI"), # To get the Silph Scope
    ("ROUTE_24", "ROCKET"), # Gives you a Nugget before battle.
    ("SAFFRON_GYM", "SABRINA"), # Gym leader
    ("SILPH_CO_11F", "GIOVANNI"), # rescue the Silph Co. President
    ("SS_ANNE_2", "RIVAL"),
    ("VERMILION_GYM", "LT.SURGE"), # Gym leader
    ("VIRIDIAN_GYM", "GIOVANNI"), # Gym leader
}

def exportTrainer(f, map_name, x, y, object):
    trainer_name = object["other"][1][4:]
    trainer_image = trainer_name.lower().replace("_", "")
    trainer_name = trainer_name_map.get(trainer_name, trainer_name)
    trainer_image = trainer_image_map.get(trainer_image, trainer_image)
    pre_battle_text, post_battle_text, done_battle_text = "TODO", "TODO", "TODO"
    parties = trainer_parties[object["other"][1][4:].replace("_", "")]
    party = parties[int(object["other"][2])-1]
    flag_name = "%s_%d_%d" % (name, x, y)
    party = ", ".join(map(lambda n: "{%d, \"%s\"}" % (n[0], n[1]), party))

    # Get data from map script "[mapname]TrainerHeader[n]" in "scripts/[mapname].asm" for texts used, and trigger distance.
    if (map_name, trainer_name) in trainer_no_headers:
        f.write("--[[NO HEADER: ")
        header_info = {
            "view_range": 0,
            "pre_battle": "?",
            "post_battle": "?",
            "done_battle": "?",
        }
    else:
        header_info = trainer_header_info[map_name].pop(0)

    if header_info["view_range"] > 0:
        f.write(".onUse(function(player) possiblyBattle%s(player, true) end)" % (flag_name))
        if header_info["view_range"] > 0:
            if object["range_or_direction"] == "UP":
                dx, dy = 0, 1
            elif object["range_or_direction"] == "DOWN":
                dx, dy = 0, -1
            elif object["range_or_direction"] == "LEFT":
                dx, dy = -1, 0
            elif object["range_or_direction"] == "RIGHT":
                dx, dy = 1, 0
            for n in range(1, header_info["view_range"] + 1):
                f.write("\nmap.createObject(%d, %d)" % (x + dx * n, y + dy * n))
                f.write(".onTouch(function(player) possiblyBattle%s(player, false) end)" % (flag_name))
            f.write("\nfunction possiblyBattle%s(player, is_talked_to)" % (flag_name))
            f.write("\n    checkForTrainerBattle(player, is_talked_to, \"%s\", \"%s\", \"%s\", {%s}, %r, %r, %r)" % (flag_name, trainer_name, trainer_image, party, header_info["pre_battle"], header_info["post_battle"], header_info["done_battle"]))
            f.write("\nend")
    else:
        f.write(".onUse(function(player)\n    checkForTrainerBattle(player, true, \"%s\", \"%s\", \"%s\", {%s}, %r, %r, %r)\nend)"
            % (flag_name, trainer_name, trainer_image, party, header_info["pre_battle"], header_info["post_battle"], header_info["done_battle"]))
        if (map_name, trainer_name) in trainer_no_headers:
            f.write("--]]")

overworld_file = open(tempOrNot("OVERWORLD", "objects"), "wt")
for name in sorted(object_data.keys()):
    if overworld_map.has(name):
        f = overworld_file
        f.write("--map: %s\n" % name)
    else:
        f = open(tempOrNot(name, "objects"), "wt")
    objects = object_data[name]
    for object in objects:
        sprite = object["sprite"][7:].lower()
        if sprite == "gameboy_kid_copy": sprite = "gameboy_kid"
    
        assert object["sprite"].startswith("SPRITE_")
        x, y, _ = getExportPosition(name, object["x"], object["y"])
        f.write("map.createObject(%d, %d)" % (x, y))
        f.write(".setSprite(\"%s\")" % (sprite))
        if object["range_or_direction"] in ["UP", "DOWN", "LEFT", "RIGHT"]:
            f.write(".setDirection(\"%s\")" % (object["range_or_direction"]))
        if object["movement"] in ["WALK"]:
            f.write("--[[.enableWander()--]]")
        
        if len(object["other"]) == 3 and object["other"][1].startswith("OPP_"):
            exportTrainer(f, name, x, y, object)
        elif len(object["other"]) == 2 and name != "BLUES_HOUSE":
            flag_name = "%s_%d_%d" % (name, x, y)
            item_name = object["other"][1].replace("_", " ")
            f.write(".onUse(function(player) attemptToPickupObject(\"%s\", \"%s\") end)" % (flag_name, item_name))
        else:
            f.write("--[[%s--]]" % object["other"])
        f.write("\n")
    if wild_pokemon[name] is not None:
        if name in ["DIGLETTS_CAVE", "MANSION_1", "MANSION_2", "MANSION_3", "MANSION_4",
                    "MT_MOON_1", "MT_MOON_2", "MT_MOON_3",
                    "POKEMONTOWER_3", "POKEMONTOWER_4", "POKEMONTOWER_5", "POKEMONTOWER_6", "POKEMONTOWER_7", "POWER_PLANT",
                    "ROCK_TUNNEL_1", "ROCK_TUNNEL_2",
                    "SEAFOAM_ISLANDS_1", "SEAFOAM_ISLANDS_2", "SEAFOAM_ISLANDS_3", "SEAFOAM_ISLANDS_4", "SEAFOAM_ISLANDS_5",
                    "UNKNOWN_DUNGEON_1", "UNKNOWN_DUNGEON_2", "UNKNOWN_DUNGEON_3",
                    "VICTORY_ROAD_1", "VICTORY_ROAD_2", "VICTORY_ROAD_3"]:
            # Certain indoor maps have wild encounters everywhere, this is hardcoded in the game.
            f.write("map.setAlwaysWildEncounters()\n")

        xs, ys = map_sizes[name][1] * 2, map_sizes[name][0] * 2
        x0, y0, _ = getExportPosition(name, 0, ys - 1)
        x1, y1, _ = getExportPosition(name, xs - 1, 0)
        idx = 0
        for data in wild_pokemon[name]:
            if not data:
                idx += 1
                continue
            f.write("map.setWildPokemon({%d, %d}, {%d, %d}, %g)" % (x0, y0, x1, y1, data[0] / 255))
            if idx % 2 == 0:
                f.write(".type(\"LAND\")")
            else:
                f.write(".type(\"WATER\")")
            if len(wild_pokemon[name]) > 2:
                if idx < 2:
                    f.write(".mode(\"RED\")")
                else:
                    f.write(".mode(\"BLUE\")")
            n = 0
            chance_list = [51, 51, 39, 25, 25, 25, 13, 13, 11, 3]
            for entry in data[1:]:
                f.write(".add(%d, %d, \"%s\")" % (chance_list[n], int(entry[0]), entry[1]))
                n += 1
            f.write("\n")
            idx += 1

    if len(trainer_header_info[name]) > 0:
        f.write("--[[Leftover trainer headers:\n")
        for header in trainer_header_info[name]:
            f.write("%r\n" % (header))
        f.write("--]]\n")

sprites_colors = {
    'agatha': "PURPLEMON",
    'balding_guy': "BADGE",
    'ball': "REDBAR",
    'bike_shop_guy': "BROWNMON",
    'biker': "VERMILION",
    'bird': "YELLOWMON",
    'black_hair_boy_1': "REDBAR",
    'black_hair_boy_2': "GREENBAR",
    'blackbelt': "BROWNMON",
    'blue': "BADGE",
    'book_map_dex': "BROWNMON",
    'boulder': "YELLOWBAR",
    'brunette_girl': "BADGE",
    'bruno': "GREYMON",
    'bug_catcher': "GREENBAR",
    'cable_club_woman': "SLOTS1",
    'clefairy': "PINKMON",
    'clipboard': "BROWNMON",
    'cook': "MEWMON",
    'daisy': "BADGE",
    'erika': "GREENMON",
    'fat_bald_guy': "MEWMON",
    'fisher': "GREENBAR",
    'fisher2': "YELLOWBAR",
    'foulard_woman': "REDBAR",
    'gambler': "BROWNMON",
    'gameboy_kid': "LAVENDER",
    'gentleman': "GREENBAR",
    'giovanni': "REDBAR",
    'girl': "GREENBAR",
    'guard': "BADGE",
    'gym_helper': "PINKMON",
    'hiker': "MEWMON",
    'lance': "REDMON",
    'lapras_giver': "REDBAR",
    'lass': "GREENBAR",
    'little_girl': "YELLOWMON",
    'lorelei': "0F",
    'lying_old_man': "YELLOWMON",
    'mart_guy': "GREENBAR",
    'medium': "YELLOWBAR",
    'mom': "REDBAR",
    'mom_geisha': "BADGE",
    'mr_fuji': "GAMEFREAK",
    'mr_masterball': "GAMEFREAK",
    'nurse': "REDBAR",
    'oak': "REDBAR",
    'oak_aide': "BROWNMON",
    'old_amber': "REDMON",
    'old_medium_woman': "GREENBAR",
    'old_person': "YELLOWMON",
    'omanyte': "REDBAR",
    'paper_sheet': "BROWNMON",
    'red': "REDMON",
    'red.alt': "BADGE",
    'rocker': "REDBAR",
    'rocket': "BROWNMON",
    'sailor': "PALLET",
    'seel': "CYANMON",
    'slowbro': "MEWMON",
    'snorlax': "PINKMON",
    'ss_captain': "BADGE",
    'swimmer': "MEWMON",
    'waiter': "GAMEFREAK",
    'warden': "MEWMON",
    'white_player': "YELLOWBAR",
    'young_boy': "CAVE",
}

for name, color in sprites_colors.items():
    source_name = name
    if source_name.endswith(".alt"):
        source_name = source_name[:-4]
    image = QImage.fromData(z.open("pokered-master/gfx/sprites/%s.png" % (source_name)).read()).convertToFormat(QImage.Format_Indexed8)
    if color == "":
        for pal_name in palletes:
            applyPallete(image, pal_name)
            image.setColor(3, 0)
            image.save("resources/___temp/%s__%s.png" % (name, pal_name.decode('ascii')))
    else:
        applyPallete(image, color.encode('ascii'))
        image.setColor(3, 0)
        image.save("resources/gfx/sprite/%s.png" % (name))
        
        f = open("resources/gfx/sprite/%s.txt" % (name), "wt")
        f.write("{\n")
        f.write("    texture: gfx/sprite/%s.png\n" % (name))
        f.write("    texture_size: %d, %d\n" % (image.width(), image.height()))
        f.write("\n")
        f.write("    size: 1, 1\n")
        f.write("    frame_size: 16, 16\n")
        f.write("    line_length: 1\n")
        f.write("    delay: 0.15\n")
        f.write("    [Stand_down] {\n")
        f.write("        position: 0, 0\n")
        f.write("    }\n")
        f.write("    [Stand_up] {\n")
        if image.height() > 16:
            f.write("        position: 0, 16\n")
        else:
            f.write("        position: 0, 0\n")
        f.write("    }\n")
        f.write("    [Stand_left] {\n")
        if image.height() > 16:
            f.write("        position: 0, 32\n")
        else:
            f.write("        position: 0, 0\n")
        f.write("    }\n")
        f.write("    [Stand_right] {\n")
        if image.height() > 16:
            f.write("        position: 0, 32\n")
            f.write("        flip: H\n")
        else:
            f.write("        position: 0, 0\n")
        f.write("    }\n")
        if image.height() > 48:
            f.write("\n")
            f.write("    [Walk_down] {\n")
            f.write("        position: 0, 0\n")
            f.write("        frames: 0, 3, 0, 3\n")
            f.write("        flip: N, N, H, H\n")
            f.write("        loop: True\n")
            f.write("    }\n")
            f.write("    [Walk_up] {\n")
            f.write("        position: 0, 0\n")
            f.write("        frames: 1, 4, 1, 4\n")
            f.write("        flip: N, N, H, H\n")
            f.write("        loop: True\n")
            f.write("    }\n")
            f.write("    [Walk_left] {\n")
            f.write("        position: 0, 0\n")
            f.write("        frames: 2, 5\n")
            f.write("        loop: True\n")
            f.write("    }\n")
            f.write("    [Walk_right] {\n")
            f.write("        position: 0, 0\n")
            f.write("        frames: 2, 5\n")
            f.write("        flip: H\n")
            f.write("        loop: True\n")
            f.write("    }\n")
        f.write("}\n")
