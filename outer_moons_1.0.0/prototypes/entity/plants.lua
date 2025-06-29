local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local seconds = 60
local minutes = 60*seconds

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}

local gleba_tree_static_influence = -0.8
local gleba_tree_probability_multiplier = 0.3

local leaf_sound = sounds.tree_leaves
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place

local function tree_stateless_visualisation(positions)
  -- high intensity so overlapping doesn't have much effect
  -- low max brightness to keep effect restrained.
  local max_brightness = 0.4
  return
  {
    min_count = 1,
    max_count = 2,
    offset_x = { -0.05, 0.05 }, -- will be random from range -0.05 to 0.05
    offset_y = { -0.05, 0.05 },
    positions = positions,

    render_layer = "object",
    adjust_animation_speed_by_base_scale = true,
    scale = { 0.2, 0.6 },

    light =
    {
      intensity = 0.7,
      size = 32,
      color = {0.5 * max_brightness, 0.75 * max_brightness, 1 * max_brightness},
      flicker_interval = 90,
      flicker_min_modifier = 0.8,
      flicker_max_modifier = 1.2,
      offset_flicker = true
    },
  }
end
local function make_offsets_on_tree(origin_x, origin_y, pixel_coords)
  local result = {}
  for i,coord in pairs(pixel_coords) do
    table.insert(result, { (coord[1] - origin_x) / 64, (coord[2] - origin_y) / 64 }) -- assumes high res -> 64 pixels per tile
  end
  return result
end

local leaf_sound_trigger =
{
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}

local spoilage_sound_trigger =
{
  {
    type = "play-sound",
    sound = spoilage_sound,
    damage_type_filters = "fire"
  }
}

local function plant_autoplace3(options)
  return
  {
    control = options.control or "gleba_plants",
    order = "a[tree]-b[forest]",
    tile_restriction = options.tile_restriction,
    probability_expression = "clamp((" .. (options.static_influence or -0.5) .. " + gleba_plants_noise) * control:gleba_plants:size, 0, 1)\z
                              * " .. (options.probability_multiplier or 0.5),
    richness_expression = "random_penalty_at(".. (options.max_richness or 3).. ", 1)",
    local_expressions = options.local_expressions
  }
end

local gleba_tree_underwater_things = {}

local function gleba_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local shift = shift or util.by_pixel(52, -40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        filenames =
        {
          "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__space-age__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      underwater       = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].underwater or nil,
      water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,

      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    if(name == "stingfrond-plant") then
      variation.leaves =
      {
        layers =
        {
          variation.leaves,
          {
            filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest-glow.png",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier,
            draw_as_light = true
          }
        }
      }
    end
    table.insert(variations, variation)
  end
  return variations
end

local ashland_lichen_tree_pictures = {
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_00",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_00",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_01",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_01",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_02",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_02",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_03",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_03",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_04",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_04",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_05",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_05",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_06",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_06",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_07",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_07",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_08",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_08",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_09",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_09",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_10",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_10",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_11",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_11",{ scale = 0.5, draw_as_shadow = true}),
    }
  }
}

local function razorgrass_variations()
  local variation_count = 8 --variation_count or 5
  local per_row = 4 -- per_row or 5
  local scale_multiplier = .2
  local width = 600
  local height = 800
  local variations = {}
  local shift = util.by_pixel(0,-32) -- shift or futil.by_pixel(52, -40)
  local sshift = util.by_pixel(22, -12)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local sx = ((i - 1) % per_row) * height -- Shadow images are rotated
    local sy = math.floor((i-1)/per_row) * width -- Shadow images are rotated
    local variation = {
      trunk = {
        filename = "__outer_moons__/graphics/entity/plant/razorgrass/razorgrass.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__outer_moons__/graphics/entity/plant/razorgrass/razorgrass-leaves.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__outer_moons__/graphics/entity/plant/razorgrass/razorgrass-normal.png",
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "gleba",
        filenames =
        {
          "__outer_moons__/graphics/entity/plant/razorgrass/razorgrass-shadow.png",
          "__outer_moons__/graphics/entity/plant/razorgrass/razorgrass-shadow2.png",
        },
        width = height,  --shadows are rotated
        height = width,  --shadows are rotated
        x = sx,
        y = sy,
        shift = sshift,
        scale = 0.33 * scale_multiplier
      },

      -- underwater       = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].underwater or nil,
      -- water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,
    }
    table.insert(variations, variation)
  end
  return variations
end

local function lerp_color(a, b, amount)
  return {
    r = a.r + (b.r - a.r) * amount,
    g = a.g + (b.g - a.g) * amount,
    b = a.b + (b.b - a.b) * amount
  }
end

local function lerp_colors(a_set, b, amount)
  local new_colors = {}
  for i, a in pairs(a_set) do
    new_colors[i] = lerp_color(a, b, amount)
  end
  return new_colors
end

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end

data:extend(
{
  {
    type = "noise-expression",
    name = "gleba_plants_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/20 * control:gleba_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 200000, octaves = 3, input_scale = 1/6 * control:gleba_plants:frequency })"
  },
  {
    type = "noise-expression",
    name = "aiolos_plants_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/20 * control:aiolos_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 200000, octaves = 3, input_scale = 1/6 * control:aiolos_plants:frequency })"
  },
  {
    type = "noise-expression",
    name = "feronia_plants_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/20 * control:feronia_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 200000, octaves = 3, input_scale = 1/6 * control:feronia_plants:frequency })"
  },
  --overwrite removal
  {
    type = "tree",
    name = "funneltrunk",
	icon = "__space-age__/graphics/icons/funneltrunk.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = nil,
	colors = minor_tints(),
	variations = gleba_tree_variations("funneltrunk", 5, 4),
	autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-h",
      probability_expression = "0",
      richness_expression = "0"
    },
  },
  {
    type = "tree",
    name = "slipstack", -- lubricant
    icon = "__space-age__/graphics/icons/slipstack.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = "slipstack-plant",
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "slipstack-polyp", amount = 20},
        {type = "item", name = "calcite", amount = 4},
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-slipstack", 5, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-slipstack", 7, 0.4),
    emissions_per_second = plant_emissions,
    max_health = 100,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "c[gleba]-b[normal]-a[slipstack]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_slipstack,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.05, 0.1 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
	  --placement_density = 0.5,
      richness_expression = "random_penalty_at(1, 3)",
      tile_restriction = {"wetland-dead-skin"}
    },
    variations = gleba_tree_variations("slipstack", 8, 5),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/slipstack", 9, 0.6),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 7
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "coral-stunted",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "coral-water",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          },
          {
            type = "create-decorative",
            decorative = "coral-land",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          }
        }
      }
    },	
    map_color = {255, 255, 255},
  },
  {
    type = "tree",
    name = "lickmaw",
    icon = "__space-age__/graphics/icons/lickmaw.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = "lickmaw-plant",
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "mawpouch", amount = 20},
        {type = "item", name = "calcite", amount = 4},
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-lickmaw", 5, 0.45),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-lickmaw", 5, 0.4),
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
	collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "c[gleba]-b[normal]-e[lickmaw]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_lickmaw,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-e",
      probability_expression = "min(0.05, 0.1 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
	  --placement_density = 0.5,
      richness_expression = "random_penalty_at(1, 3)",
      tile_restriction = {"wetland-jellynut"}
    },
    variations = gleba_tree_variations("lickmaw", nil, nil, nil, nil, nil, util.by_pixel(52, -50)),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/lickmaw", 8, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 1,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 7
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "curly-roots-grey",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "pink-lichen-decal",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 4
          },
          {
            type = "create-decorative",
            decorative = "pale-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 3
          },
          {
            type = "create-decorative",
            decorative = "split-gill-1x1",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 3
          },
        }
      }
    },	
    map_color = {255, 255, 255},
  },
  {
    type = "tree",
    name = "cuttlepop", -- in water. decorative
    icon = "__space-age__/graphics/icons/cuttlepop.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = "cuttlepop-plant",
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "cuttlepod", amount = 20},
        {type = "item", name = "calcite", amount = 4},
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/mining-cuttlepop", 6, 0.8),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-cuttlepop", 5, 0.7),
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "c[gleba]-b[normal]-i[cuttlepop]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_cuttlepop,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.05, 0.1 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
	  --placement_density = 0.5,
      richness_expression = "random_penalty_at(1, 3)",
      tile_restriction = {"wetland-yumako"}
    },
    variations = gleba_tree_variations("cuttlepop", 5, 4),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/cuttlepop", 7, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 3,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 13
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "curly-roots-grey",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "pale-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 3
          }
        }
      }
    },
	map_color = {255, 255, 255},
  },
  {
    type = "tree",
    name = "stingfrond",
	icon = "__space-age__/graphics/icons/stingfrond.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = nil,
	colors = minor_tints(),
	variations = gleba_tree_variations("stingfrond", 10, 5, 1.1, nil, nil, util.by_pixel(52, -60)),
	autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-h",
      probability_expression = "0",
      richness_expression = "0"
    },
  },
  {
    type = "tree",
    name = "boompuff",
	icon = "__space-age__/graphics/icons/boompuff.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = nil,
	colors = minor_tints(),
	variations = gleba_tree_variations("boompuff", 14, 5, 0.9),
	autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-h",
      probability_expression = "0",
      richness_expression = "0"
    },
  },
  {
    type = "tree",
    name = "sunnycomb",
	icon = "__space-age__/graphics/icons/sunnycomb.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = nil,
	colors = minor_tints(),
	variations = gleba_tree_variations("sunnycomb", 10, 5, nil, 3200/5, 1120/2),
	autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-h",
      probability_expression = "0",
      richness_expression = "0"
    },
  },
  {
    type = "tree",
    name = "hairyclubnub",
	icon = "__space-age__/graphics/icons/hairyclubnub.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = nil,
	colors = minor_tints(),	
    variations = gleba_tree_variations("hairyclubnub", 10, 5),
	autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-h",
      probability_expression = "0",
      richness_expression = "0"
    },
  },
  {
    type = "tree",
    name = "teflilly",
	icon = "__space-age__/graphics/icons/teflilly.png",
    flags = plant_flags,
	hidden_in_factoriopedia = true,
	factoriopedia_alternative = nil,
	colors = minor_tints(),
	variations = gleba_tree_variations("teflilly"),
	autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-h",
      probability_expression = "0",
      richness_expression = "0"
    },
  },
  -- replace
  {
    type = "plant",
    name = "ashland-lichen-plant",
    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "ashwood", amount = 4}
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-ashland-lichen-tree", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-ashland-lichen-tree", 5, 0.4),
	growth_ticks = 5 * minutes,
    max_health = 50,
    collision_box = {{-0.5, -0.6}, {0.5, 0.4}},
    selection_box = {{-0.9, -2.4}, {0.9, 0.3}},
    subgroup = "plants",
    order = "b[vulcanus]-a[ashland-lichen-plant]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_ashland_lichen_tree,
    autoplace =
    {
      order = "b[tree]-b[normal]",
      --control = "trees", -- makes it appear on Nauvis
      probability_expression = "0",
	  tile_restriction = { "volcanic-soil-dark", "volcanic-soil-light", "volcanic-ash-soil", "volcanic-ash-flats", "volcanic-ash-light", "volcanic-ash-dark"}
    },
    map_color = {255, 255, 255},
    pictures = ashland_lichen_tree_pictures,
  },
   {
    type = "plant",
    name = "fulgurite-plant",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    icon = "__space-age__/graphics/icons/fulgurite.png",
    subgroup = "plants",
    order = "d[fulgora]-a[fulgurite]",
    collision_box = {{-1.0, -0.9}, {1.0, 0.9}},
    selection_box = {{-1.2, -1.1}, {1.2, 1.1}},
    drawing_box_vertical_extension = 1,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "holmium-ore", amount = 8}
      }
    },
    map_color = {255, 255, 255},
	growth_ticks = 5 * minutes,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
   -- render_layer = "object",
    max_health = 200,
    resistances =
    {
      { type = "fire",  percent = 100 },
      { type = "electric", percent = 100 }
    },
    autoplace =
    {
      probability_expression = "0",
	  tile_restriction = { "fulgoran-rock", "fulgoran-dust", "fulgoran-sand", "fulgoran-dunes", "fulgoran-walls", "fulgoran-paving", "fulgoran-conduit", "fulgoran-machinery" },
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/fulgurite/fulgurite", frame_count = 6}})
  },
  {
    type = "plant",
    name = "funneltrunk-plant", -- wood
    icon = "__space-age__/graphics/icons/funneltrunk.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "funnelwood", amount = 20},
        {type = "item", name = "wood", amount = 4},
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-funneltrunk", 5, 0.9),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-funneltrunk", 5, 0.7),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 200,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-d[funneltrunk]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_funneltrunk,
    autoplace =
   {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.2, 0.25 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      richness_expression = "random_penalty_at(1, 3)",
      tile_restriction = {"natural-yumako-soil", "artificial-yumako-soil", "overgrowth-yumako-soil"}
    },
    variations = gleba_tree_variations("funneltrunk", 5, 4),
    colors = minor_tints(),
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/funneltrunk", 7, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 3,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 12
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "nerve-roots-dense",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "knobbly-roots",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          }
        }
      }
    },
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "slipstack-plant", -- lubricant
    icon = "__space-age__/graphics/icons/slipstack.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "slipstack-polyp", amount = 20},
        {type = "item", name = "calcite", amount = 4},
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-slipstack", 5, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-slipstack", 7, 0.4),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 100,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
	--collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-a[slipstack]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_slipstack,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
     -- probability_expression = "min(0.05, 0.1 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      probability_expression = "0",
	  --placement_density = 0.5,
      richness_expression = "0",
    --  richness_expression = "random_penalty_at(1, 3)",
      tile_restriction = {"artificial-cuticle-soil", "overgrowth-cuticle-soil"}
    },
    variations = gleba_tree_variations("slipstack", 8, 5),
    colors = minor_tints(),
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/slipstack", 9, 0.6),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 7
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "coral-stunted",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "coral-water",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          },
          {
            type = "create-decorative",
            decorative = "coral-land",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          }
        }
      }
    },
    map_color = {255, 255, 255},
  },
  
  
  {
    type = "plant",
    name = "yumako-tree", -- food
    icon = "__space-age__/graphics/icons/yumako-tree.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results = {
		{type = "item", name = "yumako", amount = 20},
        {type = "item", name = "wood", amount = 4},
	  },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-f[yumako-tree]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-b",
      probability_expression = "min(0.1, 0.15 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      richness_expression = "random_penalty_at(1, 3)",
      tile_restriction = {"natural-jellynut-soil", "artificial-jellynut-soil", "overgrowth-jellynut-soil"}
    },
    variations = gleba_tree_variations("yumako-tree", 8, 4, 1.3),
    colors = minor_tints(),
    agricultural_tower_tint =
    {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-yumako-soil", "artificial-yumako-soil"}, remove_on_collision = true} },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "lickmaw-plant",
    icon = "__space-age__/graphics/icons/lickmaw.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "mawpouch", amount = 20},
        {type = "item", name = "calcite", amount = 4},
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-lickmaw", 5, 0.45),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-lickmaw", 5, 0.4),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
	--collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-e[lickmaw]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_lickmaw,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-b",
      --probability_expression = "min(0.05, 0.1 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      probability_expression = "0",
	  --placement_density = 0.5,
      --richness_expression = "random_penalty_at(1, 3)",
      richness_expression = "0",
      tile_restriction = {"artificial-jellynut-soil", "overgrowth-jellynut-soil"}
    },
    variations = gleba_tree_variations("lickmaw", nil, nil, nil, nil, nil, util.by_pixel(52, -50)),
    colors = minor_tints(),
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/lickmaw", 8, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 1,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 7
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "curly-roots-grey",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "pink-lichen-decal",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 4
          },
          {
            type = "create-decorative",
            decorative = "pale-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 3
          },
          {
            type = "create-decorative",
            decorative = "split-gill-1x1",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 3
          },
        }
      }
    },
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "cuttlepop-plant", -- jelly
    icon = "__space-age__/graphics/icons/cuttlepop.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "cuttlepod", amount = 20},
        {type = "item", name = "calcite", amount = 4},
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/mining-cuttlepop", 6, 0.8),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-cuttlepop", 5, 0.7),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
	--collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-c[cuttlepop]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_cuttlepop,
	autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      --probability_expression = "min(0.05, 0.1 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      probability_expression = "0",
	  --placement_density = 0.5,
      --richness_expression = "random_penalty_at(1, 3)",
      richness_expression = "0",
      tile_restriction = {"artificial-yumako-soil", "overgrowth-yumako-soil"}
    },
    variations = gleba_tree_variations("cuttlepop", 5, 4),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 240, g = 255, b =  255},
      {r = 255, g = 240, b =  255},
      {r = 240, g = 240, b =  255},
      {r = 240, g = 255, b =  240},
    },
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/cuttlepop", 7, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 3,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 13
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "curly-roots-grey",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "pale-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 3
          }
        }
      }
    },
    map_color = {255, 255, 255},
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-jellynut-soil", "artificial-jellynut-soil"}, remove_on_collision = true} },
  },
  {
    type = "plant",
    name = "stingfrond-plant", -- frondstrand
    icon = "__space-age__/graphics/icons/stingfrond.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "frondstalk", amount = 20},
        {type = "item", name = "wood", amount = 4},
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-stingfrond", 5, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-stingfrond", 5, 0.4),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-h[stingfrond]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_stingfrond,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      richness_expression = "random_penalty_at(2, 2)",
      tile_restriction = {"midland-turquoise-bark", "artificial-cerulean-soil", "overgrowth-cerulean-soil"}
    },
    stateless_visualisation_variations =
    {
      tree_stateless_visualisation(make_offsets_on_tree(320, 280, {{306, 197}, {306, 197}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 260, {{306, 210}, {306, 210}})),
      tree_stateless_visualisation(make_offsets_on_tree(300, 265, {{290, 196}, {290, 196}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 280, {{305, 210}, {305, 210}})),
      tree_stateless_visualisation(make_offsets_on_tree(280, 280, {{305, 194}, {305, 194}})),
      tree_stateless_visualisation(make_offsets_on_tree(280, 290, {{297, 199}, {297, 199}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 230, {{295, 197}, {295, 197}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 240, {{303, 200}, {303, 200}})),
      tree_stateless_visualisation(make_offsets_on_tree(280, 260, {{292, 197}, {292, 197}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 240, {{294, 191}, {294, 191}})),
    },
    variations = gleba_tree_variations("stingfrond", 10, 5, 1.1, nil, nil, util.by_pixel(52, -60)),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 240, g = 255, b =  255},
      {r = 255, g = 240, b =  255},
      {r = 240, g = 240, b =  255},
      {r = 240, g = 255, b =  240},
    },
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/stingfrond", 7, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 8
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "white-carpet-grass",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 1,
            probability = 0.4
          },
          {
            type = "create-decorative",
            decorative = "wispy-lichen",
            spawn_min = 1,
            spawn_max = 4,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "mycelium",
            spawn_min = 0,
            spawn_max = 3,
            spawn_min_radius = 0,
            spawn_max_radius = 4
          }
        }
      }
    },
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "boompuff-plant", -- rocket-fuel
    icon = "__space-age__/graphics/icons/boompuff.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "boompuff-bulb", amount = 20},
        {type = "item", name = "wood", amount = 4},
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-boompuff", 5, 0.6),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-g[boompuff]",
    impact_category = "tree",
    --dying_explosion = { name = "boompuff-explosion" },
    --remains_when_mined = "boompuff-explosion",
    factoriopedia_simulation = simulations.factoriopedia_boompuff,
	autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"midland-yellow-crust-2", "artificial-ochre-soil", "overgrowth-ochre-soil"}
    },
    variations = gleba_tree_variations("boompuff", 14, 5, 0.9),
    colors = lerp_colors({
      {r = 255, g = 255, b =  255},
      {r = 220, g = 255, b =  255},
      {r = 255, g = 220, b =  255},
      {r = 255, g = 255, b =  220},
      {r = 255, g = 220, b =  220},
      {r = 255, g = 200, b =  200},
      {r = 255, g = 200, b =  180},
      {r = 230, g = 230, b =  230},
      {r = 240, g = 200, b =  200},
      {r = 220, g = 150, b =  180},
      {r = 230, g = 190, b =  240},
    }, {r = 255, g = 255, b = 255}, 0.5),
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/boompuff", 5, 0.8),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 8
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "dark-mud-decal",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "knobbly-roots-orange",
            spawn_min = 2,
            spawn_max = 4,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          },
          {
            type = "create-decorative",
            decorative = "pale-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "yellow-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 2
          }
        }
      }
    },
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "teflilly-plant", 
    icon = "__space-age__/graphics/icons/teflilly.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "teflilly", amount = 20},
        {type = "item", name = "wood", amount = 4}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-teflilly", 5, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-teflilly", 5, 0.5),
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
	growth_ticks = 5 * minutes,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "c[gleba]-b[teflilly]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_teflilly,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      richness_expression = "random_penalty_at(2, 2)",
      tile_restriction = {"lowland-dead-skin", "artificial-cuticle-soil", "overgrowth-cuticle-soil"}
    },
    map_color = {255, 255, 255},
    variations = gleba_tree_variations("teflilly"),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 220, g = 255, b =  255},
      {r = 255, g = 220, b =  255},
      {r = 255, g = 255, b =  220},
      {r = 220, g = 220, b =  255},
      {r = 255, g = 220, b =  220},
      {r = 220, g = 255, b =  220},
      {r = 200, g = 200, b =  255},
      {r = 200, g = 220, b =  255},
      {r = 220, g = 200, b =  255},
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/teflilly", 8, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 8
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "knobbly-roots",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 0,
            spawn_max_radius = 1.5
          },
          {
            type = "create-decorative",
            decorative = "brown-cup",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "fuchsia-pita",
            spawn_min = 1,
            spawn_max = 2,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          }
        }
      }
    }
  },
  
  {
    type = "tree",
    name = "water-cane", -- wood
    icon = "__outer_moons__/graphics/icons/water-cane.png",
    flags = plant_flags,
    minable =
    {
      count = 1,
      mining_particle = "wooden-particle",
      mining_time = 0.1,
      result = "wood",
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-teflilly", 5, 0.8),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-teflilly", 5, 0.8),
    emissions_per_second = plant_emissions,
    max_health = 10,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.3, -1}, {0.3, 0.3}},
    collision_mask = {layers={ground_tile=true, train=true, is_object=true, is_lower_object=true}}, -- not player
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "c[gleba]-i[water-cane]",
    impact_category = "tree",
    autoplace =
    {
        control = "gleba_plants",
        order = "a[tree]-d[decorative]-a[water-cane]",
        probability_expression = "min(0.8, (min(1, 1.5 * gleba_water_plant_ramp) + 0.5 * gleba_decal_noise - gleba_plants_noise - 0.5 * gleba_select(gleba_aux, 0.45, 0.55, 0.2, 0, 1) - 0.7) * control:gleba_plants:size)",
		richness_expression = 1,
    },
    variations = gleba_tree_variations("water-cane", 16, 3, 1, 340, 290, util.by_pixel(30, -28)),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/sunnycomb", 8, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 10
    }
  },
  
  -- Aiolos
  {
    type = "plant",
    name = "sunnycomb-plant", -- sulfur
    icon = "__space-age__/graphics/icons/sunnycomb.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "sunnycomb", amount = 20},
        {type = "item", name = "calcite", amount = 4},
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-sunnycomb", 5, 0.7),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-sunnycomb", 5, 0.6),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "e[aiolos]-a[sunnycomb]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_sunnycomb,
	autoplace =
    {
      control = "aiolos_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.1, 0.2 * (1 - aiolos_plants_noise) * control:aiolos_plants:size)",
      richness_expression = "random_penalty_at(2, 2)",
      tile_restriction = {"aiolos-dust-1"}
    },
    variations = gleba_tree_variations("sunnycomb", 10, 5, nil, 3200/5, 1120/2),
    colors = minor_tints(),
    agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/sunnycomb", 8, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 10
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "polycephalum-balloon",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          },
          {
            type = "create-decorative",
            decorative = "polycephalum-slime",
            spawn_min = 0,
            spawn_max = 3,
            spawn_min_radius = 0,
            spawn_max_radius = 4
          }
        }
      }
    },
    map_color = {255, 255, 255},
  },
  
  
  -- Feronia
  {
    type = "plant",
    name = "hairyclubnub-plant", -- Feronia
    icon = "__space-age__/graphics/icons/hairyclubnub.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "spoilage", amount = 5},
        {type = "item", name = "wood", amount = 5}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-hairyclubnub", 5, 0.32),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-hairyclubnub", 5, 0.32),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 200,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    collision_mask = {layers={player=true, train=true, is_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "f[feronia]-b[hairyclubnub]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_hairyclubnub,
    autoplace =
    {
      control = "feronia_plants",
      order = "a[tree]-b[forest]-a",
      richness_expression = "random_penalty_at(1, 3)",	  
      --probability_expression = "min(0.1, 0.2 * (1 - gleba_plants_noise) * control:feronia_plants:size)",
      probability_expression = "min(0.45, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.6, from_top=0.7, to_top=1, to_bottom=2})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + control:feronia_plants:size\z
                      + tree_small_noise\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'clubnub',\z
                                          octaves = 3,\z
                                          input_scale = 1/2.2 * control:feronia_plants:frequency,\z
                                          output_scale = 0.9})",
      tile_restriction = {"feronia-1", "feronia-2", "feronia-3"}
    },
    variations = gleba_tree_variations("hairyclubnub", 10, 5),
    colors = minor_tints(),
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "nerve-roots-sparse",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
		}
	  },
	},
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "jellystem", -- Brainstem tree
    icon = "__space-age__/graphics/icons/jellystem.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results = {{type = "item", name = "jellynut", amount = 20}},
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-jellystem", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-jellystem", 6, 0.35),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    collision_mask = {layers={player=true, train=true, is_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "f[feronia]-c[jellystem]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_jellystem,
    autoplace =
    {
      control = "feronia_plants",
      order = "a[tree]-b[forest]-b",
      --probability_expression = "min(0.01, 0.02 * (1 - gleba_plants_noise) * control:feronia_plants:size)",
	  probability_expression = "min(0.45, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.6, from_top=0.7, to_top=1, to_bottom=2})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + control:feronia_plants:size\z
                      + tree_small_noise\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'brainstem',\z
                                          octaves = 3,\z
                                          input_scale = 1/2.5 * control:feronia_plants:frequency,\z
                                          output_scale = 0.75})",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"feronia-1", "feronia-2", "feronia-3"}
    },
    variations = gleba_tree_variations("jellystem", 8, 4, 1.3),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 233, g = 218, b =  225},
      --{r = 207, g = 202, b =  235},
      {r = 255, g = 235, b =  235},
      {r = 230, g = 217, b =  235},
      {r = 242, g = 202, b =  235},
      {r = 230, g = 235, b =  235},
      --{r = 194, g = 165, b  =  208},
      --{r = 215, g = 185, b =  208},
      --{r = 194, g = 185, b =  208},
      {r = 252, g = 186, b =  209}
    },
    agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/jellystem", 8, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 7
    },
    map_color = {255, 255, 255},
	created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "nerve-roots-sparse",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
        }
      }
	}
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-jellynut-soil", "artificial-jellynut-soil"}, remove_on_collision = true} },
  },
  
  {
    type = "plant",
    name = "razorgrass-plant",
    icon = "__outer_moons__/graphics/icons/razorgrass-icon.png",
    agricultural_tower_tint = {primary = {.2, .7, .7}, secondary = {.4, .9, .9}},
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "wood", amount = 50}
      },
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-sunnycomb", 5, 0.7),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-sunnycomb", 5, 0.6),
	growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "plants",
    order = "f[feronia]-a[razorgrass]",
    impact_category = "tree",
    factoriopedia_simulation = {
      planet = "feronia",
      hide_factoriopedia_gradient = true,
      init =
      [[
        game.simulation.camera_zoom = 1.4
        game.simulation.camera_position = {-0.5, 0}
        for x = -10, 9, 1 do
          for y = -4, 4 do
            game.surfaces[1].set_tiles{{position = {x, y}, name = "feronia-1"}}
          end
        end

        game.surfaces[1].create_entity{name = "razorgrass-plant", position = {x=-2.54, y=-0.76}, tick_grown = 100}
        game.surfaces[1].create_entity{name = "razorgrass-plant", position = {x=2.87, y=-0.37}, tick_grown = 8000}
        game.surfaces[1].create_entity{name = "razorgrass-plant", position = {x=-4.68, y=1.83}, tick_grown = 1000}
        game.surfaces[1].create_entity{name = "razorgrass-plant", position = {x=-0.10, y=0.67}, tick_grown = 10000}
        game.surfaces[1].create_entity{name = "razorgrass-plant", position = {x=4.80, y=1.69}, tick_grown = 100}
      ]]
    },
    autoplace =
    {
      control = "feronia_plants",
      order = "a[tree]-b[forest]-b",
      --probability_expression = "min(0.1, 0.15 * (1 - gleba_plants_noise) * control:feronia_plants:size)",
      probability_expression = "min(0.45, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.6, from_top=0.7, to_top=1, to_bottom=2})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + control:feronia_plants:size\z
                      + tree_small_noise\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'razorgrass',\z
                                          octaves = 3,\z
                                          input_scale = 1/1.1 * control:feronia_plants:frequency,\z
                                          output_scale = 1})",
      richness_expression = "random_penalty_at(2, 2)",
      tile_restriction = {"feronia-1", "feronia-2", "feronia-3"}
    },
    variations = razorgrass_variations(),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 233, g = 218, b =  225},
      {r = 207, g = 202, b =  235},
      {r = 255, g = 235, b =  235},
      {r = 230, g = 217, b =  235},
      {r = 242, g = 202, b =  235},
      {r = 230, g = 235, b =  235},
      {r = 194, g = 165, b  =  208},
      {r = 215, g = 185, b =  208},
      {r = 194, g = 185, b =  208},
      {r = 252, g = 186, b =  209}
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/sunnycomb", 8, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 10
    },
  },
})

local tree_plant = util.table.deepcopy(data.raw["tree"]["tree-08"])
tree_plant.type = "plant"
tree_plant.name = "tree-plant"
tree_plant.subgroup = "plants"
tree_plant.flags = plant_flags
tree_plant.hidden_in_factoriopedia = false
tree_plant.factoriopedia_alternative = nil
tree_plant.map_color = {0.19, 0.39, 0.19, 0.40}
tree_plant.agricultural_tower_tint =
{
  primary = {r = 0.7, g =  1.0, b = 0.2,a =  1},
  secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
}
tree_plant.minable =
{
  mining_particle = "wooden-particle",
  mining_time = 0.5,
  results = {{type = "item", name = "wood", amount = 4}},
}
tree_plant.variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.0, 0.0}
tree_plant.growth_ticks = 10 * minutes
tree_plant.surface_conditions = { {property = "pressure", min = 1000, max = 1000}}  -- only Nauvis (doesn't work yet)
tree_plant.autoplace =
{
  probability_expression = 0,
  -- required to show agricultural tower plots
  tile_restriction =
  {
    "grass-1", "grass-2", "grass-3", "grass-4",
    "dry-dirt", "dirt-1", "dirt-2", "dirt-3", "dirt-4", "dirt-5", "dirt-6", "dirt-7",
    "red-desert-0", "red-desert-1", "red-desert-2", "red-desert-3"
  }
}

data:extend({tree_plant})
