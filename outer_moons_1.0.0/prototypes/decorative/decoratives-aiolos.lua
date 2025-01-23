local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local base_decorative_sprite_priority = "extra-high"
local decal_tile_layer = 255

local function combine_tint(table_1, table_2)
  local t1 = table_1[1]-(1-table_2[1])
  local t2 = table_1[2]-(1-table_2[2])
  local t3 = table_1[3]-(1-table_2[3])
  return {t1,t2,t3}
end

local aiolos_base_tint = {1,1,1}

local tintable_rock_tint = {0.56, 0.42, 0.25}



data:extend{
  {
    type = "noise-function",
    name = "uneven_select_range",
    parameters = {"input", "from", "from_slope", "to", "to_slope"},
    expression = "min(0, (input - from) / from_slope, (to - input) / to_slope)"
  },

  ---- ROCKS
  -- reduce density in ashlands
  {
    type = "noise-expression",
    name = "aiolos_rock_huge",
    expression = "min(0.2 * (1 - 0.75 * aiolos_peaks_biome), - 1.2 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + aiolos_rock_noise + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_rock_big",
    expression = "min(0.2 * (1 - 0.5 * aiolos_peaks_biome), - 1.0 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + aiolos_rock_noise + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_rock_medium",
    expression = "min(0.5 * (1 - 0.5 * aiolos_peaks_biome), - 0.8 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + aiolos_rock_noise + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_rock_cluster",
    expression = "min(0.2 * (1 - 0.5 * aiolos_peaks_biome), - 0.7 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + aiolos_rock_noise + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_rock_small",
    expression = "min(0.6 * (1 - 0.5 * aiolos_peaks_biome), - 0.6 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + aiolos_rock_noise + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_rock_tiny",
    expression = "min(0.75 * (1 - 0.5 * aiolos_peaks_biome), - 0.5 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + aiolos_rock_noise + 0.5 * aiolos_decorative_knockout)"
  },

  ---- DECALS
  {
    type = "noise-expression",
    name = "aiolos_crack_decal_large",
    expression = "min(0.2, range_select_base(aiolos_elev, 20, 50, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_crack_decal",
    expression = "min(0.2, range_select_base(aiolos_elev, 50, 90, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_crack_decal_huge_warm",
    expression = "aiolos_peaks_biome * min(0.3, range_select_base(aiolos_elev, 0, 10, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_crack_decal_warm",
    expression = "aiolos_peaks_biome * min(0.2, range_select_base(aiolos_elev, 10, 30, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * aiolos_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "aiolos_rock_decal_large",
    expression = "min(0.1, range_select_base(aiolos_elev, 20, 50, 1, -10, 1) - 0.6 + 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * aiolos_decorative_knockout)"
  },

  {
    type = "noise-expression",
    name = "aiolos_sand_decal",
    expression = "(1 - aux - moisture) * 0.05 * aiolos_peaks_biome"
  },
  {
    type = "noise-expression",
    name = "aiolos_dune_decal",
    expression = "(1 - aux - moisture) * 0.05 * aiolos_peaks_biome"
  },
  
  ---ROCKY DECALS
  {
    name = "aiolos-rock-decal-large",
    type = "optimized-decorative",
    order = "a[aiolos]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -1,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-f[cracked-rock]-b[cold]",
      probability_expression = "aiolos_rock_decal_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-rock-decal/vulcanus-rock-decal-", "large-", 256, 5)
  },
  --- CRACK DECALS
  {
    name = "aiolos-crack-decal",
    type = "optimized-decorative",
    order = "a[aiolos]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = decal_tile_layer -5,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-b[small]",
      probability_expression = "aiolos_crack_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks-cold/vulcanus-cracks-cold-", "large-", 128, 20)
  },
  --- LARGE CRACK DECALS
  {
    name = "aiolos-crack-decal-large",
    type = "optimized-decorative",
    order = "a[aiolos]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -4,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-a[large]",
      probability_expression = "aiolos_crack_decal_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks-cold/vulcanus-cracks-cold-", "huge-", 256, 20)
  },
  --- HUGE WARM CRACK DECALS
  {
    name = "aiolos-crack-decal-huge-warm",
    type = "optimized-decorative",
    order = "a[aiolos]-b[decorative]-b[sand]",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -3,
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-g[cracks]-a[warm]-a[large]",
      probability_expression = "aiolos_crack_decal_huge_warm"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks/vulcanus-cracks-hot-", "huge-", 256, 20)
  },
  --- WARM CRACK DECALS
  {
    name = "aiolos-crack-decal-warm",
    type = "optimized-decorative",
    order = "a[aiolos]-b[decorative]-b[sand]",
    collision_box = {{-.8, -.8}, {.8, .8}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -3,
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-g[cracks]-a[warm]-b[small]",
      probability_expression = "aiolos_crack_decal_warm"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks/vulcanus-cracks-hot-", "large-", 128, 18)
  },
  --- TINTABLE ROCKS
  {
	  name = "aiolos-asterisk",
	  type = "optimized-decorative",
	  order = "b[decorative]-b[asterisk-mini]-b[yellow]",
	  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
	  render_layer = "decorative",
	  autoplace =
		{
		  order = "a[doodad]-fb[grass-brown]-b",
		  probability_expression = "-1 + rpi(0.1) + pita_noise - 0.5 * min(0, aiolos_decorative_knockout) + region_box",
		  local_expressions =
		  {
			region_box = "range_select{input = moisture, from = 0.35, to = 0.8, slope = 0.1, min = -10, max = 1}"
		  }
	  },
	  pictures =
	  {
		--gAst
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-00.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 120,
		  height = 80,
		  shift = util.by_pixel(5, -4),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-01.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 130,
		  height = 95,
		  shift = util.by_pixel(1, -5.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-02.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 122,
		  height = 76,
		  shift = util.by_pixel(0, 1),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-03.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 121,
		  height = 75,
		  shift = util.by_pixel(5.75, -0.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-04.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 85,
		  height = 77,
		  shift = util.by_pixel(3.75, -3.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-05.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 132,
		  height = 77,
		  shift = util.by_pixel(-0.5, -1.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-06.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 84,
		  height = 92,
		  shift = util.by_pixel(3, -4),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-07.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 118,
		  height = 79,
		  shift = util.by_pixel(6, -2.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-08.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 104,
		  height = 78,
		  shift = util.by_pixel(3.5, 0.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-09.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 88,
		  height = 61,
		  shift = util.by_pixel(-1, -2.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-10.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 89,
		  height = 63,
		  shift = util.by_pixel(2.75, -9.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-11.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 91,
		  height = 58,
		  shift = util.by_pixel(13.75, -1),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-12.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 90,
		  height = 64,
		  shift = util.by_pixel(-7.5, 2),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-13.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 89,
		  height = 73,
		  shift = util.by_pixel(4.25, -4.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-14.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 78,
		  height = 56,
		  shift = util.by_pixel(1, -3),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-15.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 85,
		  height = 51,
		  shift = util.by_pixel(3.25, -0.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-16.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 92,
		  height = 71,
		  shift = util.by_pixel(8, -1.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-17.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 90,
		  height = 65,
		  shift = util.by_pixel(3, -0.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-18.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 117,
		  height = 69,
		  shift = util.by_pixel(4.25, -4.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/asterisk/asterisk-19.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
		  width = 82,
		  height = 64,
		  shift = util.by_pixel(0.5, -2),
		  scale = 0.5
		},
	  }
	},
  --- BIG ROCKS
  {
    name = "huge-aiolos-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__outer_moons__/graphics/icons/huge-aiolos-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-f[huge-aiolos-rock]",
    collision_box = {{-1.5, -1.1}, {1.5, 1.1}},
    selection_box = {{-1.7, -1.3}, {1.7, 1.3}},
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results =
      {
        {type = "item", name = "stone", amount_min = 9, amount_max = 27},
        {type = "item", name = "beryllium-ore", amount_min = 6, amount_max = 18},
        {type = "item", name = "carbon", amount_min = 3, amount_max = 15}
      },
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace = {
      order = "a[landscape]-c[rock]-a[huge]",
      probability_expression = "aiolos_rock_huge"
    },
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-05.png",
        width = 201,
        height = 179,
        scale = 0.5,
        shift = {0.25, 0.0625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-06.png",
        width = 233,
        height = 171,
        scale = 0.5,
        shift = {0.429688, 0.046875},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-07.png",
        width = 240,
        height = 192,
        scale = 0.5,
        shift = {0.398438, 0.03125},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-08.png",
        width = 219,
        height = 175,
        scale = 0.5,
        shift = {0.148438, 0.132812},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-09.png",
        width = 240,
        height = 208,
        scale = 0.5,
        shift = {0.3125, 0.0625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-10.png",
        width = 243,
        height = 190,
        scale = 0.5,
        shift = {0.1875, 0.046875},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-11.png",
        width = 249,
        height = 185,
        scale = 0.5,
        shift = {0.398438, 0.0546875},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-12.png",
        width = 273,
        height = 163,
        scale = 0.5,
        shift = {0.34375, 0.0390625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-13.png",
        width = 275,
        height = 175,
        scale = 0.5,
        shift = {0.273438, 0.0234375},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-14.png",
        width = 241,
        height = 215,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-15.png",
        width = 318,
        height = 181,
        scale = 0.5,
        shift = {0.523438, 0.03125},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-16.png",
        width = 217,
        height = 224,
        scale = 0.5,
        shift = {0.0546875, 0.0234375},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-17.png",
        width = 332,
        height = 228,
        scale = 0.5,
        shift = {0.226562, 0.046875},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-18.png",
        width = 290,
        height = 243,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-19.png",
        width = 349,
        height = 225,
        scale = 0.5,
        shift = {0.609375, 0.0234375},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-20.png",
        width = 287,
        height = 250,
        scale = 0.5,
        shift = {0.132812, 0.03125},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      }
    }
  },
  {
    name = "big-aiolos-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__outer_moons__/graphics/icons/big-aiolos-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-f[big-aiolos-rock]",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {
      order = "a[landscape]-c[rock]-b[big]",
      probability_expression = "aiolos_rock_big"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "stone", amount_min = 6, amount_max = 12},
        {type = "item", name = "beryllium-ore", amount_min = 5, amount_max = 9},
        {type = "item", name = "carbon", amount_min = 3, amount_max = 7},
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-01.png",
        width =  188 ,
        height =  127 ,
        shift = {0.304688, -0.4},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-02.png",
        width =  195 ,
        height =  135 ,
        shift = {0.0, 0.0390625},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-03.png",
        width =  205 ,
        height =  132 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-04.png",
        width =  144 ,
        height =  142 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-05.png",
        width =  130 ,
        height =  107 ,
        shift = {0.390625, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-06.png",
        width =  165 ,
        height =  109 ,
        shift = {0.328125, 0.0703125},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-07.png",
        width =  150 ,
        height =  133 ,
        shift = {0.16875, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-08.png",
        width =  156 ,
        height =  111 ,
        shift = {0.3, -0.2},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-09.png",
        width =  187 ,
        height =  120 ,
        shift = {0.0, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-10.png",
        width =  225 ,
        height =  128 ,
        shift = {0.1, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-11.png",
        width =  183 ,
        height =  144 ,
        shift = {0.325, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-12.png",
        width =  158 ,
        height =  138 ,
        shift = {0.453125, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-13.png",
        width =  188 ,
        height =  150 ,
        shift = {0.539062, -0.015625},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-14.png",
        width =  186 ,
        height =  160 ,
        shift = {0.0703125, 0.179688},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-15.png",
        width =  181 ,
        height =  174 ,
        shift = {0.160938, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-16.png",
        width =  212 ,
        height =  150 ,
        shift = {0.242188, -0.195312},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-17.png",
        width =  155 ,
        height =  117 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-18.png",
        width =  141 ,
        height =  128 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-19.png",
        width =  176 ,
        height =  114 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-20.png",
        width =  120 ,
        height =  125 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      }
    }
  },
  --- MEDIUM BLACK ROCKS
  {
    name = "medium-aiolos-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-c[medium]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    render_layer = "decorative",
    autoplace = {
      order = "d[ground-surface]-i[rock]-a[medium]",
      probability_expression = "aiolos_rock_medium"
    },
    trigger_effect = decorative_trigger_effects.medium_rock(),
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 63,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.078125, 0.109375}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 66,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.132812}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width = 92,
        height = 63,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.148438, 0.179688}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 59,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {-0.0078125, 0.1875}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width = 104,
        height = 72,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.203125, 0.179688}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width = 83,
        height = 82,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.21875}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width = 111,
        height = 65,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0625, 0.3125}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width = 79,
        height = 81,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.109375, 0.148438}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width = 98,
        height = 56,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 68,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0, 0.132812}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width = 105,
        height = 71,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {-0.0234375, 0.125}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 80,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.078125, -0.015625}
      }
    }
  },
  --- SMALL BLACK ROCKS
  {
    name = "small-aiolos-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-b[small]",
      probability_expression = "aiolos_rock_small"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-01.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0546875, 0.117188}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-02.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 35,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.078125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-03.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 42,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0078125, 0.148438}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-04.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.15625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-05.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 46,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 41,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.03125, 0.09375}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-07.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 36,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.015625, 0.0703125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-08.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 31,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.71875, -0.164062}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-09.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.101562}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-10.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0078125, 0.125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-11.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.078125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-12.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 39,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.078125, 0.117188}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-13.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0, 0.09375}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-14.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 30,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.046875, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-15.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-16.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.125}
        }
    }
  },
  --- TINY TINTABLE ROCKS
  {
    name = "tiny-aiolos-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-d[tiny]",
      placement_density = 5,
      probability_expression = "aiolos_rock_tiny"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width =  30,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width =  32,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  25,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width =  36,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width =  78,
        height =  34,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width =  35,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width =  28,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width =  26,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },
}
