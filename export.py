import zipfile
import re
from PyQt5.QtCore import QRectF
from PyQt5.QtGui import QImage

names = []
pallete_names = []
pokedex = {}
moves = {}
palletes = {}
type_vs_type = {}

z = zipfile.ZipFile("_data/pokered-master.zip", "r")
for line in z.open("pokered-master/constants/pokedex_constants.asm"):
    line = line.strip()
    m = re.match(b"const DEX_([A-Z_]+) ", line)
    if m:
        names.append(m.group(1))
assert len(names) == 151

f = z.open("pokered-master/data/pokedex_entries.asm")
for line in f:
    line = line.strip()
    m = re.match(b"([A-Za-z_]+)DexEntry:", line)
    if not m:
        continue
    name = m.group(1).upper().decode('utf-8')
    if name == "MISSINGNO":
        continue
    species = re.match("db \"([^\"@]+)@\"", f.readline().strip().decode('utf-8')).group(1)
    m = re.match("db ([0-9]+),([0-9]+)", f.readline().strip().decode('utf-8'))
    height = "%s#FEET%s#INCH" % (m.group(1), m.group(2))
    weight = "%.1flb" % (int(re.match("dw ([0-9]+)", f.readline().strip().decode('utf-8')).group(1)) / 10)
    pokedex[name] = {
        "species": species,
        "height": height,
        "weight": weight,
    }
f.close()
f = z.open("pokered-master/text/pokedex.asm")
for line in f:
    line = line.strip()
    m = re.match(b"_([A-Za-z_]+)DexEntry::", line)
    if not m:
        continue
    name = m.group(1).upper().decode('utf-8').upper()
    text = ""
    while True:
        line = f.readline().strip().decode('utf-8')
        if line == "dex":
            break
        if line == "":
            continue
        line = re.search("\"([^\"]+)\"", line).group(1).replace("#", "POKE")
        text += line + "\n"
    pokedex[name]["pokedex"] = text.strip()
f.close()

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

for line in z.open("pokered-master/data/mon_palettes.asm"):
    line = line.strip()
    m = re.match(b"db PAL_([A-Z]+) ", line)
    if m:
        assert m.group(1) in palletes
        pallete_names.append(m.group(1))
pallete_names.pop(0)
assert len(pallete_names) == 151

effect_types = {}
for line in z.open("pokered-master/data/moves.asm"):
    if line.startswith(b"\tmove "):
        data = list(map(bytes.strip, line[6:].split(b",")))
        moves[data[0]] = {
            "effect": data[1],
            "power": int(data[2]),
            "type": data[3],
            "accuracy": int(data[4]),
            "pp": int(data[5]),
        }
        if data[1] not in effect_types: effect_types[data[1]] = 0
        effect_types[data[1]] += 1
#list(map(print, sorted(effect_types.items(), key=lambda n: n[1])))

for line in z.open("pokered-master/data/type_effects.asm"):
    if line.startswith(b"\tdb "):
        data = list(map(bytes.strip, line[4:].split(b",")))
        if len(data) == 3:
            if data[0] not in type_vs_type:
                type_vs_type[data[0]] = {}
            type_vs_type[data[0]][data[1]] = int(data[2]) / 10

def floodFill(image):
    image.setColor(4, 0)
    w, h = image.width(), image.height()
    todo = set()
    for x in range(w):
        todo.add((x, 0))
        todo.add((x, h-1))
    for y in range(h):
        todo.add((0, y))
        todo.add((w-1, y))
    while len(todo) > 0:
        x, y = todo.pop()
        if image.pixelIndex(x, y) == 3:
            image.setPixel(x, y, 4)
            if x > 0: todo.add((x - 1, y))
            if y > 0: todo.add((x, y - 1))
            if x < w-1: todo.add((x + 1, y))
            if y < h-1: todo.add((x, y + 1))

def resize(image, w, h):
    result = QImage(w, h, QImage.Format_Indexed8)
    result.setColorCount(image.colorCount())
    result.fill(4)
    xoffset = (w - image.width()) // 2
    yoffset = h - image.height()
    for n in range(image.colorCount()):
        result.setColor(n, image.color(n))
    for y in range(image.height()):
        for x in range(image.width()):
            result.setPixel(x + xoffset, y + yoffset, image.pixelIndex(x, y))
    return result

pokemon = {}
for stats_file in filter(lambda n: n.startswith("pokered-master/data/baseStats/") and n.endswith(".asm"), z.namelist()):
    f = z.open(stats_file, "r")
    line = f.readline()
    if line == b"MonBaseStats:\n": line = f.readline()
    if line == b"MewBaseStats:\n": line = f.readline()
    name = re.match(b"db DEX_([A-Z_]+) ", line).group(1)

    data = {}
    pokemon[name] = data
    data["index"] = names.index(name)
    data["name"] = name
    data["hp"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))
    data["attack"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))
    data["defense"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))
    data["speed"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))
    data["special"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))
    data["type1"] = re.match(b"db ([A-Z]+) ", f.readline()).group(1)
    data["type2"] = re.match(b"db ([A-Z]+) ", f.readline()).group(1)
    data["catch_rate"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))
    data["exp_rate"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))

    image_filename = re.match(b"INCBIN \"pic/bmon/([a-z\.]+).pic\",0,1", f.readline()).group(1).decode("ascii")
    front_image = QImage.fromData(z.open("pokered-master/pic/bmon/" + image_filename + ".png").read()).convertToFormat(QImage.Format_Indexed8)
    back_image = QImage.fromData(z.open("pokered-master/pic/monback/" + image_filename + "b.png").read()).convertToFormat(QImage.Format_Indexed8)
    for n in range(1, 4): # We skip color 0, which is near white but slightly purple, and use white there instead.
        front_image.setColor(3 - n, palletes[pallete_names[data["index"]]][n])
        back_image.setColor(3 - n, palletes[pallete_names[data["index"]]][n])
    floodFill(front_image)
    floodFill(back_image)
    if front_image.width() != 56 or front_image.height() != 56:
        front_image = resize(front_image, 56, 56)
    front_image.save("resources/gfx/front/%s.png" % (name.decode('ascii')))
    back_image.save("resources/gfx/back/%s.png" % (name.decode('ascii')))
    f.readline() # pointer to front image
    f.readline() # pointer to back image
    assert(f.readline() == b'; attacks known at lvl 0\n')
    data["start_moves"] = []
    data["start_moves"].append(re.match(b"db ([A-Z0_]+)\n", f.readline()).group(1))
    data["start_moves"].append(re.match(b"db ([A-Z0_]+)\n", f.readline()).group(1))
    data["start_moves"].append(re.match(b"db ([A-Z0_]+)\n", f.readline()).group(1))
    data["start_moves"].append(re.match(b"db ([A-Z0_]+)\n", f.readline()).group(1))
    data["start_moves"] = list(filter(lambda n: n != b'0', data["start_moves"]))
    for attack in data["start_moves"]:
        assert attack in moves
    
    data["grow_rate"] = int(re.match(b"db ([0-9]+) ", f.readline()).group(1))
    
    data["tm"] = []
    data["learn"] = []
    assert(f.readline() == b'; learnset\n')
    for n in range(7):
        line = f.readline().strip()
        assert(line.startswith(b'tmlearn '))
        line = line[line.find(b" ") + 1:]
        for tm in map(int, line.split(b",")):
            if tm == 0:
                continue
            assert((tm - 1) // 8 == n)
            data["tm"].append(tm)
    assert(f.readline() in [b'db 0 ; padding\n', b'db %11111111 ; usually spacing\n'])


current_pokemon = None
for line in z.open("pokered-master/data/evos_moves.asm"):
    if line.endswith(b"EvosMoves:\n"):
        name = line[:-11].upper()
        if name == b"NIDORANM": name = b"NIDORAN_M"
        if name == b"NIDORANF": name = b"NIDORAN_F"
        if name == b"MRMIME": name = b"MR_MIME"
        if name == b"FOSSILKABUTOPS": name = b"MISSINGNO"
        if name == b"FOSSILAERODACTYL": name = b"MISSINGNO"
        if name == b"MONGHOST": name = b"MISSINGNO"
        if name.startswith(b"MISSINGNO"):
            current_pokemon = None
            continue
        current_pokemon = pokemon[name]
        read_type = "EVO"
    if current_pokemon and line.startswith(b'\tdb '):
        if line == b'\tdb 0\n':
            if read_type == "EVO":
                read_type = "LEARN"
            elif read_type == "LEARN":
                read_type = "DONE"
        else:
            assert(read_type != "DONE")
            if read_type == "EVO":
                if line.startswith(b'\tdb EV_LEVEL, '):
                    assert "evolution" not in current_pokemon
                    current_pokemon["evolution"] = {
                        "level": int(line.split(b",")[1].strip()),
                        "target": line.split(b",")[2].strip()
                    }
                    assert current_pokemon["evolution"]["target"] in pokemon
                elif line.startswith(b'\tdb EV_ITEM, '):
                    if "evolution" not in current_pokemon:
                        current_pokemon["evolution"] = {"items": [], "targets": []}
                    current_pokemon["evolution"]["items"].append(line.split(b",")[1].strip())
                    current_pokemon["evolution"]["targets"].append(line.split(b",")[3].strip())
                    assert current_pokemon["evolution"]["targets"][-1] in pokemon
                elif line.startswith(b'\tdb EV_TRADE, '):
                    assert "evolution" not in current_pokemon
                    current_pokemon["evolution"] = {
                        "trade": 1,
                        "target": line.split(b",")[2].strip()
                    }
                    assert current_pokemon["evolution"]["target"] in pokemon
                else:
                    print(line)
                    assert(False)
            elif read_type == "LEARN":
                current_pokemon["learn"].append({
                    "level": int(line.split(b",")[0].split(b" ")[1].strip()),
                    "move": line.split(b",")[1].strip()
                })
                assert current_pokemon["learn"][-1]["move"] in moves

for trainer_image_filename in filter(lambda n: n.startswith("pokered-master/pic/trainer/") and n.endswith(".png"), z.namelist()):
    name = re.match("pokered-master/pic/trainer/([a-z0-9\._]+).png", trainer_image_filename).group(1)
    trainer_image = QImage.fromData(z.open(trainer_image_filename).read()).convertToFormat(QImage.Format_Indexed8)
    for n in range(1, 4): # We skip color 0, which is near white but slightly purple, and use white there instead.
        trainer_image.setColor(3 - n, palletes[b"MEWMON"][n])
    floodFill(trainer_image)
    trainer_image.save("resources/gfx/trainer/%s.png" % (name))




#print(pokemon[names[0]])
f = open("resources/stats.txt", "wt")
for name in names:
    data = pokemon[name]
    f.write("[%s] {\n" % (name.decode('ascii')))
    f.write("    index: %d\n" % (data["index"]))
    f.write("    hp: %d\n" % (data["hp"]))
    f.write("    attack: %d\n" % (data["attack"]))
    f.write("    defense: %d\n" % (data["defense"]))
    f.write("    speed: %d\n" % (data["speed"]))
    f.write("    special: %d\n" % (data["special"]))
    if data["type1"] != data["type2"]:
        f.write("    type: %s, %s\n" % (data["type1"].decode('ascii'), data["type2"].decode('ascii')))
    else:
        f.write("    type: %s\n" % (data["type1"].decode('ascii')))

    f.write("    catch_rate: %d\n" % (data["catch_rate"]))
    f.write("    base_exp: %d\n" % (data["exp_rate"]))
    f.write("    exp_table: %d\n" % (data["grow_rate"]))
    f.write("    tm: %s\n" % (', '.join(map(str, data["tm"]))))
    for n in range(100):
        tmp = []
        if n == 1:
            tmp = data["start_moves"]
        for learn in data["learn"]:
            if learn["level"] == n:
                tmp.append(learn["move"])
        if tmp:
            f.write("    moves_%d: %s\n" % (n, (b', '.join(tmp)).decode('ascii')))
    if "evolution" in data:
        if "level" in data["evolution"]:
            f.write("    evolution: %s, %d\n" % (data["evolution"]["target"].decode("ascii"), data["evolution"]["level"]))
        if "trade" in data["evolution"]:
            f.write("    evolution: %s, TRADE\n" % (data["evolution"]["target"].decode("ascii")))
        if "items" in data["evolution"]:
            pass # TODOf.write("    evolution: %s, TRADE\n" % (data["evolution"]["target"].decode("ascii")))
    dex = pokedex[name.decode('utf-8').replace("_", "")]
    f.write("    pokedex: %s\n" % (dex["pokedex"].replace("\n", "\\\n        ")))
    f.write("    species: %s\n" % (dex["species"]))
    f.write("    height: %s\n" % (dex["height"]))
    f.write("    weight: %s\n" % (dex["weight"]))
    f.write("}\n")
f.close()

unknown_effects = {}
f = open("resources/moves.txt", "wt")
for name, data in sorted(moves.items()):
    f.write("[%s] {\n" % (name.decode('ascii')))
    f.write("    type: %s\n" % (data["type"].decode('ascii')))
    if data["power"] > 0:
        f.write("    power: %d\n" % (data["power"]))
    f.write("    pp: %d\n" % (data["pp"]))
    f.write("    accuracy: %d\n" % (data["accuracy"]))

    # Hard coded data
    if name == b"TOXIC":
        data["effect"] = b'BADLY_POISON_EFFECT'
    if name == b"COUNTER":
        f.write("    priority: -1\n")
        f.write("    effect: COUNTER\n")
    if name == b"QUICK_ATTACK":
        f.write("    priority: 1\n")
    if name in [b"CRABHAMMER", b"KARATE_CHOP", b"RAZOR_LEAF", b"SLASH"]:
        f.write("    crit_rate: 4\n")

    effect = data["effect"].decode('ascii').replace("_EFFECT", "")
    if effect != 'NO_ADDITIONAL':
        if effect.endswith("_UP1") or effect.endswith("_UP_SIDE"):
            f.write("    effect: STAT_UP\n")
            f.write("    effect_power: 1\n")
            f.write("    effect_stat: %s\n" % effect[:effect.find("_")])
        elif effect.endswith("_UP2") or effect.endswith("_UP_SIDE2"):
            f.write("    effect: STAT_UP\n")
            f.write("    effect_power: 2\n")
            f.write("    effect_stat: %s\n" % effect[:effect.find("_")])
        elif effect.endswith("_DOWN1") or effect.endswith("_DOWN_SIDE"):
            f.write("    effect: STAT_DOWN\n")
            f.write("    effect_power: 1\n")
            f.write("    effect_stat: %s\n" % effect[:effect.find("_")])
        elif effect.endswith("_DOWN2") or effect.endswith("_DOWN_SIDE2"):
            f.write("    effect: STAT_DOWN\n")
            f.write("    effect_power: 2\n")
            f.write("    effect_stat: %s\n" % effect[:effect.find("_")])
        elif effect.endswith("_SIDE"):
            f.write("    effect: %s\n" % (effect[:-5]))
            f.write("    effect_power: 10\n")
        elif effect.endswith("_SIDE1"):
            f.write("    effect: %s\n" % (effect[:-6]))
            if effect[:-6] == "POISON":
                f.write("    effect_power: 20\n")
            else:
                f.write("    effect_power: 10\n")
        elif effect.endswith("_SIDE2"):
            f.write("    effect: %s\n" % (effect[:-6]))
            f.write("    effect_power: 30\n")
        elif effect == "PARALYZE":
            f.write("    effect: %s\n" % (effect))
            f.write("    effect_power: 100\n")
        elif effect == "SLEEP":
            f.write("    effect: %s\n" % (effect))
            f.write("    effect_power: 100\n")
        elif effect == "POISON":
            f.write("    effect: %s\n" % (effect))
            f.write("    effect_power: 100\n")
        elif effect == "CONFUSION":
            f.write("    effect: %s\n" % (effect))
            f.write("    effect_power: 100\n")
        elif effect == "FOCUS_ENERGY":
            f.write("    effect: STAT_UP\n")
            f.write("    effect_power: 4\n")
            f.write("    effect_stat: CRIT\n")
        elif effect == "TWO_TO_FIVE_ATTACKS":
            f.write("    effect: TWO_TO_FIVE_ATTACKS\n")
        elif effect == "SWIFT":
            f.write("    effect: SWIFT\n")
        elif effect == "HEAL":
            f.write("    effect: HEAL\n")
        elif effect == "SPLASH":
            f.write("    effect: SPLASH\n")
        elif effect == "ATTACK_TWICE":
            f.write("    attack_count: 2\n")
        elif effect == "TWINEEDLE":
            f.write("    attack_count: 2\n")
            f.write("    effect: POISON\n")
            f.write("    effect_power: 20\n")
        elif effect == "OHKO":
            f.write("    effect: OHKO\n")
        elif effect == "SWITCH_AND_TELEPORT":
            f.write("    effect: TELEPORT_OUT_OF_BATTLE\n")
        elif effect == "RECOIL":
            f.write("    effect: RECOIL\n")
            if name == "STRUGGLE":
                f.write("    effect_power: 50\n")
            else:
                f.write("    effect_power: 25\n")
        elif effect == "CHARGE" or effect == "FLY": # FLY has the side effect of also being able to fly to towns outside of battles.
            f.write("    effect: CHARGE\n")
        elif effect == "SPECIAL_DAMAGE":
            if name == b'NIGHT_SHADE' or name == b'SEISMIC_TOSS':
                f.write("    effect: DAMAGE_EQUALS_LEVEL\n")
                f.write("    effect_power: 100\n")
            if name == b'PSYWAVE':
                f.write("    effect: DAMAGE_RANDOM_TO_LEVEL\n")
                f.write("    effect_power: 150\n")
            if name == b'SONICBOOM':
                f.write("    effect: FIXED_DAMAGE\n")
                f.write("    effect_power: 20\n")
            if name == b'DRAGON_RAGE':
                f.write("    effect: FIXED_DAMAGE\n")
                f.write("    effect_power: 40\n")
        elif effect == "SUPER_FANG":
            f.write("    effect: DAMAGE_EQUALS_TARGET_HP\n")
            f.write("    effect_power: 50\n")
        elif effect == "HYPER_BEAM":
            f.write("    effect: POST_CHARGE\n")
        elif effect == "JUMP_KICK":
            f.write("    effect: CRASH_DAMAGE\n")
            f.write("    effect_power: 13\n") #Should do 1/8 of the damage, but we rounded it up.
        elif effect == "DRAIN_HP":
            f.write("    effect: DRAIN_HP\n")
            f.write("    effect_power: 50\n")
        else:
            unknown_effects[effect] = unknown_effects.get(effect, 0) + 1
            f.write("    effect: _%s\n" % (effect))

    f.write("}\n")
f.close()
print("Total moves:", len(moves))
print("Unknown effects: %d, moves with unknown effects: %d" % (len(unknown_effects), sum(unknown_effects.values())))
list(map(print, sorted(unknown_effects.items(), key=lambda n: n[1])))

f = open("resources/types.txt", "wt")
for type1, data in sorted(type_vs_type.items()):
    for type2, modifier in sorted(data.items()):
        f.write("%s,%s,%g\n" % (type1.decode('ascii'), type2.decode('ascii'), modifier))
f.close()
