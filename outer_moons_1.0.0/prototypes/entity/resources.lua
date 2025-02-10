local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__outer_moons__.prototypes.factoriopedia-simulations")

-- Initialize the core patch sets in a predictable order
--resource_autoplace.initialize_patch_set("saline-geyser", false, "selene")
--resource_autoplace.initialize_patch_set("titanium-ore", false, "selene")
--resource_autoplace.initialize_patch_set("chlorine-geyser", true, "selene")
resource_autoplace.initialize_patch_set("natural-gas", false, "aquilo")

local function create_tiles()
  return {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-inner-explosion",
          offsets = {{0.5, 0.5}}
        },
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-outer-explosion",
          offsets = {{0.5, 0.5}}
        }
      }
    }
  }
end

local function resource(resource_parameters, autoplace_parameters)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__outer_moons__/graphics/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
    autoplace = autoplace_parameters.probability_expression ~= nil and
    {
      --control = resource_parameters.name,
      order = resource_parameters.order,
      probability_expression = autoplace_parameters.probability_expression,
      richness_expression = autoplace_parameters.richness_expression
    }
    or resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      autoplace_control_name = resource_parameters.autoplace_control_name,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      has_starting_area_placement = autoplace_parameters.has_starting_area_placement,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__outer_moons__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end

data:extend({
  -- Usually earlier order takes priority, but there's some special
  -- case buried in the code about resources removing other things
  -- (though maybe there shouldn't be, and we should just place things in a different order).
  -- Trees are "a", and resources will delete trees when placed.
  -- Oil is "c" so won't be placed if another resource is already there.
  -- "d" is available for another resource, but isn't used for now.
    resource(
		{
		  name = "lead-ore",
		  order = "b",
		  map_color = {r = 69/256, g = 55/256, b = 75/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 1.5,
			  result = "lead-ore",
		  },
		  walking_sound = sounds.ore,
		  driving_sound = stone_driving_sound,
		  mining_visualisation_tint = {r = 69/256, g = 55/256, b = 75/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_lead_ore,
		},
		{
		  order = "d",
		  base_density = 3,
		  regular_rq_factor_multiplier = 1.6,
		  starting_rq_factor_multiplier = 1.9,
		  candidate_spot_count = 1,
		  base_spots_per_km = 1, -- To match 0.17.50 placement
		  has_starting_area_placement = true
		}
	),
	resource(
		{
		  name = "nickel-ore",
		  order = "b",
		  map_color = {r = 86/256, g = 130/256, b = 60/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 2,
			  result = "nickel-ore",
			 -- fluid_amount = 10,
			 -- required_fluid = "nitric-acid"
		  },
		  walking_sound = sounds.ore,
		  driving_sound = stone_driving_sound,
		  mining_visualisation_tint = {r = 86/256, g = 130/256, b = 60/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_nickel_ore,
		},
		{
		  order = "c",
		  base_density = 3,
		  regular_rq_factor_multiplier = 1.6,
		  starting_rq_factor_multiplier = 1.9,
		  candidate_spot_count = 1.5,
		  base_spots_per_km = 1.5, -- To match 0.17.50 placement
		  has_starting_area_placement = true
		}
	),    
    resource(
		{
		  name = "aluminum-ore",
		  order = "b",
		  map_color = {r = 171/256, g = 84/256, b = 78/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 2,
			  result = "aluminum-ore",
			 -- fluid_amount = 10,
			 -- required_fluid = "sulfuric-acid"
		  },
		  walking_sound = sounds.ore,
		  mining_visualisation_tint = {r = 171/256, g = 84/256, b = 78/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_aluminum_ore,
		},
		{
		  base_density = 4,
		  regular_rq_factor_multiplier = 1.5,
		  starting_rq_factor_multiplier = 1.75,
		  base_spots_per_km = 3,
		  candidate_spot_count = 11,
		  has_starting_area_placement = true
		}
	),
	resource(
		{
		  name = "silicon-ore",
		  order = "b",
		  map_color = {r = 204/256, g = 169/256, b = 42/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 4,
			  result = "silicon-ore",
			  fluid_amount = 5,
			  required_fluid = "sulfuric-acid"
		  },
		  walking_sound = sounds.ore,
		  driving_sound = stone_driving_sound,
		  mining_visualisation_tint = {r = 204/256, g = 169/256, b = 42/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_silicon_ore,
		},
		{
		  base_density = 3,
		  regular_rq_factor_multiplier = 1.5,
		  starting_rq_factor_multiplier = 1.75,
		  base_spots_per_km = 4,
		  candidate_spot_count = 11,
		  has_starting_area_placement = true
		}
	),
	--Selene
    resource(
		{
		  name = "metallic-regolith",
		  order = "b",
		  map_color = {r = 192/256, g = 186/256, b = 200/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 1,
			  result = "metallic-regolith",
		  },
		  walking_sound = sounds.ore,
		  mining_visualisation_tint = {r = 230/256, g = 247/256, b = 256/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_metallic_regolith,
		},
		{
		  probability_expression = 0
		}
	),
    resource(
		{
		  name = "ice",
		  order = "b",
		  map_color = {r = 84/256, g = 119/256, b = 141/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 1,
			  result = "ice",
		  },
		  walking_sound = sounds.ore,
		  mining_visualisation_tint = {r = 84/256, g = 119/256, b = 141/256, a = 1.000},
		  --category = "hard-solid",
		  factoriopedia_simulation = simulations.factoriopedia_ice_ore,
		},
		{
		  probability_expression = 0
		}
	),
	resource(
		{
		  name = "dry-ice",
		  order = "b",
		  map_color = {r = 157/256, g = 152/256, b = 119/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 1,
			  result = "dry-ice",
		  },
		  walking_sound = sounds.ore,
		  mining_visualisation_tint = {r = 157/256, g = 152/256, b = 119/256, a = 1.000},
		  --category = "hard-solid",
		  factoriopedia_simulation = simulations.factoriopedia_dry_ice_ore,
		},
		{
		  probability_expression = 0
		}
	),
    resource(
		{
		  name = "titanium-ore",
		  order = "b",
		  map_color = {r = 161/256, g = 126/256, b = 122/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 5,
			  result = "titanium-ore",
			  fluid_amount = 10,
			  required_fluid = "hydrochloric-acid"
		  },
		  walking_sound = sounds.ore,
		  mining_visualisation_tint = {r = 161/256, g = 126/256, b = 122/256, a = 1.000},
		  --category = "hard-solid",
		  factoriopedia_simulation = simulations.factoriopedia_titanium_ore,
		},
		{
		  probability_expression = 0
		}
	),
	resource(
		{
		  name = "phosphate",
		  order = "b",
		  map_color = {r = 158/256, g = 103/256, b = 75/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 1.5,
			  result = "phosphate",
			  fluid_amount = 10,
			  required_fluid = "sulfuric-acid"
		  },
		  walking_sound = sounds.ore,
		  mining_visualisation_tint = {r = 158/256, g = 103/256, b = 75/256, a = 1.000},
		  --category = "hard-solid",
		  factoriopedia_simulation = simulations.factoriopedia_phosphate_ore,
		},
		{
		  probability_expression = 0
		}
	),
	resource(
		{
		  name = "heavy-metal",
		  order = "b",
		  map_color = {r = 219/256, g = 219/256, b = 255/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 8,
			  result = "heavy-metal",
			 -- fluid_amount = 10,
			 -- required_fluid = "nitric-acid"
		  },
		  walking_sound = sounds.ore,
		  driving_sound = stone_driving_sound,
		  category = "hard-solid",
		  mining_visualisation_tint = {r = 219/256, g = 219/256, b = 255/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_heavy_metal,
		},
		{
			base_density = 2.5,
			base_spots_per_km = 57,
			has_starting_area_placement = true,
			regular_rq_factor_multiplier = 2.25,
			starting_rq_factor_multiplier = 2.5,
			candidate_spot_count = 38,	
		}
	), 
	resource(
		{
		  name = "beryllium-ore",
		  order = "b",
		  map_color = {r = 123/256, g = 150/256, b = 116/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 1.5,
			  result = "beryllium-ore",
			 -- fluid_amount = 10,
			 -- required_fluid = "nitric-acid"
		  },
		  walking_sound = sounds.ore,
		  driving_sound = stone_driving_sound,
		  --category = "hard-solid",
		  mining_visualisation_tint = {r = 123/256, g = 150/256, b = 116/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_beryllium_ore,
		},
		{
			base_density = 1.5,
			base_spots_per_km = 57,
			has_starting_area_placement = true,
		    regular_rq_factor_multiplier = 1.5,
		    starting_rq_factor_multiplier = 2,
			candidate_spot_count = 57,		
		}
	),    
	resource(
		{
		  name = "cobalt-ore",
		  order = "b",
		  map_color = {r = 68/256, g = 144/256, b = 240/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 4,
			  result = "cobalt-ore",
			 -- fluid_amount = 10,
			 -- required_fluid = "nitric-acid"
		  },
		  walking_sound = sounds.ore,
		  driving_sound = stone_driving_sound,
		  category = "hard-solid",
		  mining_visualisation_tint = {r = 68/256, g = 144/256, b = 240/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_cobalt_ore,
		},
		{
			base_density = 2.5,
			base_spots_per_km = 57,
			has_starting_area_placement = true,
		    regular_rq_factor_multiplier = 2.5,
		    starting_rq_factor_multiplier = 3.5,
			candidate_spot_count = 57,		
		}
	), 
	-- Fluids
	{
		type = "resource",
		name = "natural-gas",
		icon = "__outer_moons__/graphics/icons/natural-gas-resource.png",
		flags = {"placeable-neutral"},
		category = "basic-fluid",
		subgroup = "mineable-fluids",
		order="a-b-b",
		infinite = false,
		highlight = true,
		minimum = 100000,
		normal = 500000,
		infinite_depletion_amount = 10,
		resource_patch_search_radius = 12,
		tree_removal_probability = 0.7,
		tree_removal_max_distance = 32 * 32,
		minable =
		{
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "natural-gas",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
		},
		walking_sound = sounds.oil,
		driving_sound = oil_driving_sound,
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		created_effect = create_tiles("snow-flat"),
		autoplace = resource_autoplace.resource_autoplace_settings
		{
		  name = "natural-gas",
		  order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
		  base_density = 4,
		  base_spots_per_km2 = 1,
		  random_probability = 1/48,
		  random_spot_size_minimum = 1,
		  random_spot_size_maximum = 1, -- don't randomize spot size
		  additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
		  has_starting_area_placement = false,
		  regular_rq_factor_multiplier = 1
		},
		stage_counts = {0},
		stages =
		{
		  sheet = util.sprite_load("__outer_moons__/graphics/entity/natural-gas/natural-gas",
		  {
			priority = "extra-high",
			scale = 0.5,
			variation_count = 1,
			frame_count = 4,
		  })
		},
		draw_stateless_visualisation_under_building = false,
		stateless_visualisation =
		{
		  {
			count = 1,
			render_layer = "smoke",
			animation = {
			  filename = "__base__/graphics/entity/crude-oil/oil-smoke-outer.png",
			  frame_count = 47,
			  line_length = 16,
			  width = 90,
			  height = 188,
			  animation_speed = 0.3,
			  shift = util.by_pixel(-2, -75),
			  scale = 0.8,
			  tint = util.multiply_color({r=0.35, g=0.3, b=0.3}, 0.5)
			}
		  },
		  {
			count = 1,
			render_layer = "smoke",
			animation = {
			  filename = "__base__/graphics/entity/crude-oil/oil-smoke-inner.png",
			  frame_count = 47,
			  line_length = 16,
			  width = 40,
			  height = 84,
			  animation_speed = 0.3,
			  shift = util.by_pixel(0, -75),
			  scale = 0.8,
			  tint = util.multiply_color({r=0.45, g=0.4, b=0.4}, 0.5)
			}
		  }
		},
		map_color = {0.78, 0.2, 0.77},
		map_grid = false
	},
	{
		type = "resource",
		name = "saline-geyser",
		icon = "__outer_moons__/graphics/icons/saline-geyser.png",
		flags = {"placeable-neutral"},
		category = "basic-fluid",
		subgroup = "mineable-fluids",
		order="a-b-c[saline-geyser]",
		highlight = true,
		normal = 50000,
		resource_patch_search_radius = 16,
		tree_removal_probability = 0.7,
		tree_removal_max_distance = 32 * 32,
		minable =
		{
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "brine",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
		},
		walking_sound = sounds.oil,
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = {
		  order="c",
		  --default_enabled = false,
		  probability_expression = "selene_saline_geyser_probability",
		  richness_expression = "selene_saline_geyser_richness"
		},
		stage_counts = {0},
		stages =
		{
		  layers =
		  {
			util.sprite_load("__outer_moons__/graphics/entity/saline-geyser/saline-geyser",
			{
			  priority = "extra-high",
			  frame_count = 4,
			  scale = 0.5
			})
		  }
		},

		draw_stateless_visualisation_under_building = false,
		stateless_visualisation =
		{
		  {
			count = 1,
			render_layer = "smoke",
			animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1",
			{
			  priority = "extra-high",
			  frame_count = 64,
			  animation_speed = 0.35,
			  tint = util.multiply_color({r=0.52, g=0.58, b=0.69}, 1),
			  scale = 0.5
			  --shift = util.by_pixel( 0.5, -54.0)
			})
		  },
		  {
			count = 1,
			render_layer = "smoke",
			animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
			{
			  priority = "extra-high",
			  frame_count = 64,
			  animation_speed = 0.35,
			  tint = util.multiply_color({r=0.62, g=0.68, b=0.79}),
			  scale = 0.5
			  --shift = util.by_pixel( 0.5, -54.0)
			})
		  },
		  {
			count = 1,
			render_layer = "smoke",
			animation = {
			  filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-outer.png",
			  frame_count = 47,
			  line_length = 16,
			  width = 90,
			  height = 188,
			  animation_speed = 0.5,
			  shift = util.by_pixel(-2, -40),
			  scale = 0.5,
			  tint = util.multiply_color({r=0.57, g=0.63, b=0.74}, 0.1),
			}
		  }
		},

		map_color = {0.52, 0.58, 0.69},
		map_grid = false
	},
	{
		type = "resource",
		name = "chlorine-geyser",
		icon = "__outer_moons__/graphics/icons/chlorine-geyser.png",
		flags = {"placeable-neutral"},
		category = "basic-fluid",
		subgroup = "mineable-fluids",
		order="a-b-d[saline-geyser]",
		highlight = true,
		minimum = 25000,
		normal = 100000,
		resource_patch_search_radius = 12,
		tree_removal_probability = 0.7,
		tree_removal_max_distance = 32 * 32,
		draw_stateless_visualisation_under_building = false,
		minable =
		{
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "chlorine",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
		},
		walking_sound = sounds.oil,
		working_sound =
		{
		  sound =
		  {
			category = "world-ambient", variations = sound_variations("__space-age__/sound/world/resources/sulfuric-acid-geyser", 1, 0.3),
			advanced_volume_control =
			{
			  fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
			}
		  },
		  max_sounds_per_type = 3,
		  audible_distance_modifier = 0.3,
		},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = {
		  order="c",
		  probability_expression = "mefitis_chlorine_geyser_probability",
		  richness_expression = "mefitis_chlorine_geyser_richness"
		},
		stage_counts = {0},
		stages =
		{
		  layers =
		  {
			util.sprite_load("__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser",
			{
			  priority = "high",
			  frame_count = 4,
			  scale = 0.5,
			})
		  }
		},
		stateless_visualisation =
		{
		  -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
		  {
			count = 1,
			render_layer = "smoke",
			animation =
			{
			  filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-outer.png",
			  frame_count = 47,
			  line_length = 16,
			  width = 90,
			  height = 188,
			  animation_speed = 0.3,
			  shift = util.by_pixel(-6, -89),
			  scale = 1,
			  tint = util.multiply_color({r=0.15, g=0.65, b=0.1}, 0.3)
			}
		  },
		  {
			count = 1,
			render_layer = "smoke",
			animation =
			{
			   filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-inner.png",
			   frame_count = 47,
			   line_length = 16,
			   width = 40,
			   height = 84,
			   animation_speed = 0.4,
			   shift = util.by_pixel(-4, -30),
			   scale = 1,
			   tint = util.multiply_color({r=0.15, g=0.85, b=0.1}, 0.5)
			}
		  }
		},
		map_color = {0.36, 0.62, 0.36},
		map_grid = false
	},
	
})