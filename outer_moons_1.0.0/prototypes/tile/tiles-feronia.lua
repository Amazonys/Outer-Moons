local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")


local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition


local function lerp_color_no_alpha(a, b, amount)
  return
  {
    a[1] + amount * (b[1] - a[1]),
    a[2] + amount * (b[2] - a[2]),
    a[3] + amount * (b[3] - a[3])
  }
end

local snow_map_color_low = {156, 166, 181}
local snow_map_color_high = {190, 194, 197}


local grass_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,
    side_weights = { 1, 1, 1, 1,  0.25, 0.25, 1, 1,  1, 1, 0.125, 0.25,  1, 1, 1, 1 },

    spritesheet = "__base__/graphics/terrain/water-transitions/grass.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_8,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-grass-mask.png",
      o_transition_count = 1
    }
  },
  ground_to_out_of_map_transition
}

local grass_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/grass-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-grass-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition
  },

  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/grass-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/grass-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-grass-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  }
}


local water_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.15 * 0.09,
  mask_enabled = true,
  mask_layout =
  {
    spritesheet = "__base__/graphics/terrain/masks/water-edge-transition.png",
    count = 1,
    double_side_count = 0,
    scale = 0.5,
    outer_corner_x = 64,
    side_x = 128,
    u_transition_x = 192,
    o_transition_x = 256,
    y = 0
  }
}


local function material_background(picture, count)
  return
  {
    transition = tile_graphics.generic_masked_tile_transitions1,
    material_background =
    {
      picture = picture,
      count = count,
      scale = 0.5
    }
  }
end
--iodic_ocean.autoplace = {probability_expression = "iodic_ocean"}
--iodic_ocean_2.autoplace = {probability_expression = "iodic_ocean_2"}



data:extend({
  
  {
    name = "iodic-ocean",
    type = "tile",
    order = "a[feronia]-a[iodic-ocean]",
    collision_mask = tile_collision_masks.water(),
    subgroup = "feronia-tiles",
    fluid = "iodic-solution",
    autoplace = {probability_expression = "water_base(0, 100)"},
    effect = "water",
	effect_color = {65, 35, 95},
	effect_color_secondary = { 45, 30, 85 },
    particle_tints = tile_graphics.water_particle_tints,
    layer_group = "water",
    layer = 4,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 1,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water/water2.png",
          count = 1,
          scale = 0.5,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/water/water4.png",
          count = 1,
          scale = 0.5,
          size = 4
        }
      },
      empty_transitions = true
    },
    transitions = {water_to_out_of_map_transition},
	transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color={65, 35, 95},
    absorptions_per_second = tile_pollution.water,

    trigger_effect = tile_trigger_effects.water_trigger_effect(),

    default_cover_tile = "foundation",

    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.6 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  {
    type = "tile",
    name = "feronia-1",
    order = "b[feronia]-c[feronia-tiles]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "feronia_snow_patchy"},
    layer = 5,
    variants = tile_variations_template_with_transitions(
	  "__outer_moons__/graphics/terrain/vegetation-mauve-grass-1.png",
	  {
		max_size = 4,
		[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
	  }
	),
    subgroup = "feronia-tiles",

    
	transitions = grass_transitions,
	transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound = grass_sounds,
    driving_sound = grass_driving_sound,
    map_color = { 111, 77, 131 },
    scorch_mark_color = {0.318, 0.222, 0.152},
    vehicle_friction_modifier = snow_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "feronia-2",
    subgroup = "feronia-tiles",
    order = "b[feronia]-d[feronia-tiles]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "feronia_snow_crests"},
    layer = 6,
    variants = tile_variations_template_with_transitions(
	  "__outer_moons__/graphics/terrain/vegetation-violet-grass-1.png",
	  {
		max_size = 4,
		[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
	  }
	),

    transitions = grass_transitions,
	transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound = grass_sounds,
    driving_sound = grass_driving_sound,
    map_color = { 74, 77, 131 },
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    vehicle_friction_modifier = snow_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "feronia-3",
    subgroup = "feronia-tiles",
    order = "b[feronia]-e[feronia-tiles]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "feronia_snow_lumpy"},
    layer = 7,
    variants = tile_variations_template_with_transitions(
	  "__outer_moons__/graphics/terrain/vegetation-purple-grass-1.png",
	  {
		max_size = 4,
		[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
	  }
	),

    transitions = grass_transitions,
	transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound = grass_sounds,
    driving_sound = grass_driving_sound,
    map_color = { 54, 58, 128 },
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    vehicle_friction_modifier = snow_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  
})

table.insert(water_tile_type_names, "iodic-ocean")