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

local feronia_base_tint = {1,1,1}

local purple_tint = {0.42, 0.13, 0.58}
local blue_tint = {0.14, 0.24, 0.49}



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
    name = "feronia_rock_huge",
    expression = "min(0.2, - 1.2 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + feronia_rock_noise + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_rock_big",
    expression = "min(0.25, - 1.0 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + feronia_rock_noise + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_rock_medium",
    expression = "min(0.5, - 0.8 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + feronia_rock_noise + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_rock_small",
    expression = "min(0.6, - 0.6 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + feronia_rock_noise + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_rock_tiny",
    expression = "min(0.75, - 0.5 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + feronia_rock_noise + 0.5 * feronia_decorative_knockout)"
  },

  ---- DECALS
  {
    type = "noise-expression",
    name = "feronia_crack_decal_large",
    expression = "min(0.2, range_select_base(feronia_elev, 20, 50, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_crack_decal",
    expression = "min(0.2, range_select_base(feronia_elev, 50, 90, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_crack_decal_huge_warm",
    expression = "feronia_basalts_biome * min(0.3, range_select_base(feronia_elev, 0, 10, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_crack_decal_warm",
    expression = "feronia_basalts_biome * min(0.2, range_select_base(feronia_elev, 10, 30, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * feronia_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "feronia_rock_decal_large",
    expression = "min(0.1, range_select_base(feronia_elev, 20, 50, 1, -10, 1) - 0.6 + 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * feronia_decorative_knockout)"
  },
  --- BUSHES
  {
	  name = "pink-flower-bush",
	  type = "optimized-decorative",
	  autoplace = {
		  order = "d[ground-surface]-h[bush]-a[huge]",
		  probability_expression = "feronia_rock_huge"
	  },
	  -- subgroup = "grass",
	  collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
	  order = "b[decorative]-g[fluff]-b[dry]-a[brown]",
	  pictures = {
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-00.png",
		  height = 44,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.1015625,
			-0.0625
		  },
		  width = 67
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-01.png",
		  height = 58,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.09375,
			-0.03125
		  },
		  width = 76
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-02.png",
		  height = 44,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0546875,
			-0.046875
		  },
		  width = 75
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-03.png",
		  height = 54,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0703125,
			-0.046875
		  },
		  width = 65
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-04.png",
		  height = 55,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.125,
			-0.1015625
		  },
		  width = 88
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-05.png",
		  height = 49,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0703125,
			-0.0234375
		  },
		  width = 63
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-06.png",
		  height = 50,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.109375,
			-0.078125
		  },
		  width = 74
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-07.png",
		  height = 53,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			-0.0546875,
			-0.1171875
		  },
		  width = 89
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-08.png",
		  height = 58,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.046875,
			-0.046875
		  },
		  width = 70
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-09.png",
		  height = 53,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0390625,
			-0.0078125
		  },
		  width = 83
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-10.png",
		  height = 61,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.078125,
			-0.0703125
		  },
		  width = 76
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-11.png",
		  height = 50,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0546875,
			-0.0625
		  },
		  width = 71
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-12.png",
		  height = 57,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.1171875,
			-0.0078125
		  },
		  width = 79
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-13.png",
		  height = 50,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.015625,
			-0.046875
		  },
		  width = 60
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-14.png",
		  height = 38,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0234375,
			-0.078125
		  },
		  width = 65
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-15.png",
		  height = 51,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0390625,
			-0.0390625
		  },
		  width = 65
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-17.png",
		  height = 38,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0546875,
			-0.03125
		  },
		  width = 49
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-blue-pink/flower-bush-18.png",
		  height = 35,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0390625,
			-0.0390625
		  },
		  width = 53
		},
	  },
	},
	{
	  name = "blue-flower-bush",
	  type = "optimized-decorative",
	  autoplace = {
		  order = "d[ground-surface]-i[bush]-a[big]",
		  probability_expression = "feronia_rock_big"
	  },
	  -- subgroup = "grass",
	  collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
	  order = "b[decorative]-g[fluff]-b[dry]-a[brown]",
	  pictures = {
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-00.png",
		  height = 44,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.1015625,
			-0.0625
		  },
		  width = 67
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-01.png",
		  height = 58,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.09375,
			-0.03125
		  },
		  width = 76
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-02.png",
		  height = 44,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0546875,
			-0.046875
		  },
		  width = 75
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-03.png",
		  height = 54,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0703125,
			-0.046875
		  },
		  width = 65
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-04.png",
		  height = 55,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.125,
			-0.1015625
		  },
		  width = 88
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-05.png",
		  height = 49,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0703125,
			-0.0234375
		  },
		  width = 63
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-06.png",
		  height = 50,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.109375,
			-0.078125
		  },
		  width = 74
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-07.png",
		  height = 53,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			-0.0546875,
			-0.1171875
		  },
		  width = 89
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-08.png",
		  height = 58,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.046875,
			-0.046875
		  },
		  width = 70
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-09.png",
		  height = 53,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0390625,
			-0.0078125
		  },
		  width = 83
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-10.png",
		  height = 61,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.078125,
			-0.0703125
		  },
		  width = 76
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-11.png",
		  height = 50,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0546875,
			-0.0625
		  },
		  width = 71
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-12.png",
		  height = 57,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.1171875,
			-0.0078125
		  },
		  width = 79
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-13.png",
		  height = 50,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.015625,
			-0.046875
		  },
		  width = 60
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-14.png",
		  height = 38,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0234375,
			-0.078125
		  },
		  width = 65
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-15.png",
		  height = 51,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0390625,
			-0.0390625
		  },
		  width = 65
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-17.png",
		  height = 38,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0546875,
			-0.03125
		  },
		  width = 49
		},
		{
		  filename = "__outer_moons__/graphics/decorative/flower-bush-red-blue/flower-bush-18.png",
		  height = 35,
		  line_length = 1,
		  priority = "extra-high",
		  scale = 0.5,
		  shift = {
			0.0390625,
			-0.0390625
		  },
		  width = 53
		},
	  },
	},
	{
	  name = "feronia-carpet-grass",
	  type = "optimized-decorative",
	  -- subgroup = "grass",
	  order = "b[decorative]-a[grass]-b[carpet]",
	  collision_box = {{-2, -2}, {2, 2}},
	  autoplace =
		{
		  order = "a[doodad]-f[grass]-a",
		  probability_expression = "-1.2 + rpi(0.6) + 0.8 * grass_noise - min(0, feronia_decorative_knockout) + region_box",
		  local_expressions =
		  {
			region_box = "range_select{input = moisture, from = 0.5, to = 1, slope = 0.05, min = -10, max = 1}"
		  }
		},
	  pictures =
	  {
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-08.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 252,
		  height = 241,
		  shift = util.by_pixel(-4, 12.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-09.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 260,
		  height = 135,
		  shift = util.by_pixel(0, 9.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-10.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 272,
		  height = 290,
		  shift = util.by_pixel(5, -7.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-11.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 267,
		  height = 253,
		  shift = util.by_pixel(0.75, -1.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-03.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 282,
		  height = 220,
		  shift = util.by_pixel(2, -15.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-04.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 264,
		  height = 146,
		  shift = util.by_pixel(2, -7.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-05.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 235,
		  height = 262,
		  shift = util.by_pixel(4.25, 2),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-06.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 260,
		  height = 257,
		  shift = util.by_pixel(-0.5, -6.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-07.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 244,
		  height = 255,
		  shift = util.by_pixel(5.5, 2.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-00.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 289,
		  height = 292,
		  shift = util.by_pixel(1.75, -3),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-01.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 273,
		  height = 264,
		  shift = util.by_pixel(0.25, -0.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-02.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 246,
		  height = 185,
		  shift = util.by_pixel(-4.5, 14.25),
		  scale = 0.5
		},
	  }
	},
	{
	  name = "feronia-blue-carpet-grass",
	  type = "optimized-decorative",
	  -- subgroup = "grass",
	  order = "b[decorative]-a[grass]-b[carpet]",
	  collision_box = {{-2, -2}, {2, 2}},
		autoplace =
		{
		  order = "a[doodad]-fb[grass-brown]-b",
		  probability_expression = "-1 + rpi(0.4) + pita_noise - 0.5 * min(0, feronia_decorative_knockout) + region_box",
		  local_expressions =
		  {
			region_box = "range_select{input = moisture, from = 0.35, to = 0.8, slope = 0.1, min = -10, max = 1}"
		  }
		},
	  pictures =
	  {
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-08.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 252,
		  height = 241,
		  shift = util.by_pixel(-4, 12.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-09.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 260,
		  height = 135,
		  shift = util.by_pixel(0, 9.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-10.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 272,
		  height = 290,
		  shift = util.by_pixel(5, -7.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-11.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 267,
		  height = 253,
		  shift = util.by_pixel(0.75, -1.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-03.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 282,
		  height = 220,
		  shift = util.by_pixel(2, -15.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-04.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 264,
		  height = 146,
		  shift = util.by_pixel(2, -7.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-05.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 235,
		  height = 262,
		  shift = util.by_pixel(4.25, 2),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-06.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 260,
		  height = 257,
		  shift = util.by_pixel(-0.5, -6.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-07.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 244,
		  height = 255,
		  shift = util.by_pixel(5.5, 2.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-00.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 289,
		  height = 292,
		  shift = util.by_pixel(1.75, -3),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-01.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 273,
		  height = 264,
		  shift = util.by_pixel(0.25, -0.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/carpet-grass/carpet-grass-02.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 246,
		  height = 185,
		  shift = util.by_pixel(-4.5, 14.25),
		  scale = 0.5
		},
	  }
	},
	{
	  name = "feronia-small-grass",
	  type = "optimized-decorative",
	  -- subgroup = "grass",
	  order = "b[decorative]-a[grass]-c[small]",
	  collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
	  autoplace =
		{
		  order = "a[doodad]-f[grass]-b",
		  probability_expression = "-1.2 + rpi(0.6) + grass_noise - min(0, feronia_decorative_knockout) + region_box",
		  local_expressions =
		  {
			region_box = "min(range_select{input = moisture, from = 0.35, to = 1, slope = 0.05, min = -10, max = 1},\z
							  range_select{input = aux, from = 0.3, to = 0.6, slope = 0.05, min = -10, max = 1},\z
							  range_select{input = temperature, from = 10, to = 16, slope = 0.5, min = -10, max = 1})"
		  }
		},
	  pictures =
	  {
		--greenSmall
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-00.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 122,
		  height = 84,
		  shift = util.by_pixel(6, -6),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-01.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 101,
		  height = 65,
		  shift = util.by_pixel(1.25, 0.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-02.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 86,
		  height = 74,
		  shift = util.by_pixel(3, -2.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-03.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 106,
		  height = 74,
		  shift = util.by_pixel(-3, -4),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-04.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 100,
		  height = 67,
		  shift = util.by_pixel(-2.5, -2.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-05.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 116,
		  height = 65,
		  shift = util.by_pixel(-2, -3.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-06.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 81,
		  height = 70,
		  shift = util.by_pixel(2.75, -3),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-07.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 95,
		  height = 54,
		  shift = util.by_pixel(-3.25, -1.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-08.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 91,
		  height = 56,
		  shift = util.by_pixel(-2.75, -2.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-09.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 77,
		  height = 54,
		  shift = util.by_pixel(0.25, -1.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-10.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 46,
		  height = 33,
		  shift = util.by_pixel(6, -1.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/small-grass/small-grass-11.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 39,
		  height = 26,
		  shift = util.by_pixel(3.25, 0),
		  scale = 0.5
		},
	  }
	},
    {
	  name = "feronia-pita",
	  type = "optimized-decorative",
	  -- subgroup = "grass",
	  order = "b[decorative]-c[pita]-a[blue]",
	  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
	  render_layer = "object",
	  autoplace =
		{
		  order = "a[doodad]-e[pita]-c",
		  probability_expression = "-1.9 + (rpi(0.7) + (pita_noise - min(0, feronia_decorative_knockout))) + region_box",
		  local_expressions =
		  {
			region_box = "clamp(min(range_select{input = moisture, from = 0.05, to = 0.3, slope = 0.05, min = -10, max = 1},\z
									range_select{input = temperature, from = 14, to = 20, slope = 0.5, min = -10, max = 1}),\z
								min(range_select{input = moisture, from = 0.8, to = 0.95, slope = 0.05, min = -10, max = 1},\z
									range_select{input = temperature, from = 16, to = 20, slope = 0.5, min = -10, max = 1}),\z
								range_select{input = aux, from = 0.5, to = 1, slope = 0.05, min = -10, max = 1})"
		  }
		},
	  pictures =
	  {
		--gpita
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-00.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 153,
		  height = 104,
		  shift = util.by_pixel(11.25, -5.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-01.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 146,
		  height = 104,
		  shift = util.by_pixel(11.5, -9.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-02.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 120,
		  height = 83,
		  shift = util.by_pixel(9.5, -6.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-03.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 121,
		  height = 84,
		  shift = util.by_pixel(10.25, -6),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-04.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 144,
		  height = 95,
		  shift = util.by_pixel(12.5, -9.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-05.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 140,
		  height = 92,
		  shift = util.by_pixel(8.5, -7.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-06.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 156,
		  height = 120,
		  shift = util.by_pixel(7, -7),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-07.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 155,
		  height = 123,
		  shift = util.by_pixel(10.25, -5.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-08.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 162,
		  height = 116,
		  shift = util.by_pixel(11.5, -6.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-09.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 123,
		  height = 78,
		  shift = util.by_pixel(6.25, -4.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-10.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 99,
		  height = 70,
		  shift = util.by_pixel(4.25, -4),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-11.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 98,
		  height = 64,
		  shift = util.by_pixel(6.5, -2.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-12.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 99,
		  height = 77,
		  shift = util.by_pixel(6.25, -5.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-13.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 109,
		  height = 71,
		  shift = util.by_pixel(8.25, -4.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita/pita-14.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = blue_tint,
		  width = 100,
		  height = 68,
		  shift = util.by_pixel(6.5, -5),
		  scale = 0.5
		},
	  }
	},
	{
	  name = "feronia-pita-mini",
	  type = "optimized-decorative",
	  -- subgroup = "grass",
	  order = "b[decorative]-d[pita-mini]-a[pink]",
	  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
	  render_layer = "decorative",
	  autoplace =
		{
		  order = "a[doodad]-e[pita]-b",
		  placement_density = 2,
		  probability_expression = "-1.7 + (rpi(0.7) + (pita_noise - min(0, feronia_decorative_knockout))) + region_box",
		  local_expressions =
		  {
			region_box = "min(range_select{input = moisture, from = 0.2, to = 0.4, slope = 0.05, min = -10, max = 1},\z
							  range_select{input = aux, from = 0, to = 0.5, slope = 0.05, min = -10, max = 1},\z
							  range_select{input = temperature, from = 15, to = 20, slope = 0.5, min = -10, max = 1})"
		  }
	  },
	  pictures =
	  {
		--pitaMini
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-00.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 83,
		  height = 52,
		  shift = util.by_pixel(4.25, -2),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-01.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 75,
		  height = 57,
		  shift = util.by_pixel(4.75, -3.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-02.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 87,
		  height = 57,
		  shift = util.by_pixel(4.75, -3.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-03.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 96,
		  height = 62,
		  shift = util.by_pixel(6, -3.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-04.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 87,
		  height = 68,
		  shift = util.by_pixel(3.75, -4.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-05.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 92,
		  height = 65,
		  shift = util.by_pixel(5.5, -3.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-06.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 64,
		  height = 45,
		  shift = util.by_pixel(3.5, -0.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-07.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 73,
		  height = 39,
		  shift = util.by_pixel(3.75, -3.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-08.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 66,
		  height = 46,
		  shift = util.by_pixel(5.5, -3.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-09.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 97,
		  height = 72,
		  shift = util.by_pixel(5.75, -3.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-10.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 101,
		  height = 71,
		  shift = util.by_pixel(4.75, -4.25),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-11.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 98,
		  height = 71,
		  shift = util.by_pixel(5.5, -3.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-12.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 90,
		  height = 63,
		  shift = util.by_pixel(6.5, -3.75),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-13.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 84,
		  height = 64,
		  shift = util.by_pixel(4.5, -4.5),
		  scale = 0.5
		},
		{
		  filename = "__outer_moons__/graphics/decorative/pita-mini/pita-mini-14.png",
		  priority = base_decorative_sprite_priority,
          tint_as_overlay = true,
          tint = purple_tint,
		  width = 79,
		  height = 58,
		  shift = util.by_pixel(2.75, -3),
		  scale = 0.5
		},
	  }
	},
  --- MEDIUM BLACK ROCKS
  {
    name = "medium-feronia-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-c[medium]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    render_layer = "decorative",
    autoplace = {
      order = "d[ground-surface]-i[rock]-a[medium]",
      probability_expression = "feronia_rock_medium"
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
        tint = purple_tint,
        scale = 0.5,
        shift = {0.078125, 0.109375}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 66,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.015625, 0.132812}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width = 92,
        height = 63,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.148438, 0.179688}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 59,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {-0.0078125, 0.1875}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width = 104,
        height = 72,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.203125, 0.179688}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width = 83,
        height = 82,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.015625, 0.21875}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width = 111,
        height = 65,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0625, 0.3125}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width = 79,
        height = 81,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.109375, 0.148438}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width = 98,
        height = 56,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.015625, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 68,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0, 0.132812}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width = 105,
        height = 71,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {-0.0234375, 0.125}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 80,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.078125, -0.015625}
      }
    }
  },
  --- SMALL BLACK ROCKS
  {
    name = "small-feronia-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-b[small]",
      probability_expression = "feronia_rock_small"
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
          tint = purple_tint,
          scale = 0.5,
          shift = {0.0546875, 0.117188}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-02.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 35,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0.0390625, 0.078125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-03.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 42,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {-0.0078125, 0.148438}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-04.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 33,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0.0234375, 0.15625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-05.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 46,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0.0390625, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 41,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {-0.03125, 0.09375}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-07.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 36,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {-0.015625, 0.0703125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-08.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 31,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {-0.71875, -0.164062}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-09.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 34,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.101562}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-10.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 34,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0.0078125, 0.125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-11.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 33,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.078125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-12.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 39,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0.078125, 0.117188}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-13.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0, 0.09375}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-14.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 30,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0.046875, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-15.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 37,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-16.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          tint_as_overlay = true,
          tint = purple_tint,
          scale = 0.5,
          shift = {0.0234375, 0.125}
        }
    }
  },
  --- TINY TINTABLE ROCKS
  {
    name = "tiny-feronia-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-d[tiny]",
      placement_density = 5,
      probability_expression = "feronia_rock_tiny"
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
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width =  30,
        height =  19,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  24,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width =  32,
        height =  20,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  25,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width =  36,
        height =  24,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width =  78,
        height =  34,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width =  35,
        height =  19,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width =  28,
        height =  20,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  22,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width =  26,
        height =  22,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  20,
        tint_as_overlay = true,
        tint = purple_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },
}
