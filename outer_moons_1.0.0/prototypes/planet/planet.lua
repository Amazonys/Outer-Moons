require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
require("__outer_moons__/prototypes/planet/planet-gleba-map-gen")
require("__space-age__/prototypes/planet/planet-fulgora-map-gen")
require("__space-age__/prototypes/planet/planet-aquilo-map-gen")
require("__outer_moons__/prototypes/planet/planet-selene-map-gen")
require("__outer_moons__/prototypes/planet/planet-mefitis-map-gen")
require("__outer_moons__/prototypes/planet/planet-aiolos-map-gen")
require("__outer_moons__/prototypes/planet/planet-feronia-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local planet_map_gen_new = require("__outer_moons__/prototypes/planet/planet-map-gen")

local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__outer_moons__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_nauvis = require("__outer_moons__.prototypes.planet.procession-catalogue-nauvis")
local planet_catalogue_selene = require("__outer_moons__.prototypes.planet.procession-catalogue-selene")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local planet_catalogue_gleba = require("__space-age__.prototypes.planet.procession-catalogue-gleba")
local planet_catalogue_fulgora = require("__space-age__.prototypes.planet.procession-catalogue-fulgora")
local planet_catalogue_mefitis = require("__outer_moons__.prototypes.planet.procession-catalogue-mefitis")
local planet_catalogue_aquilo = require("__space-age__.prototypes.planet.procession-catalogue-aquilo")
local planet_catalogue_aiolos = require("__outer_moons__.prototypes.planet.procession-catalogue-aiolos")
local planet_catalogue_feronia = require("__outer_moons__.prototypes.planet.procession-catalogue-feronia")

data:extend(
{
  {
    type = "planet",
    name = "nauvis",
    icon = "__base__/graphics/icons/nauvis.png",
    starmap_icon = "__base__/graphics/icons/starmap-planet-nauvis.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 15,
    orientation = 0.275,
    magnitude = 1,
    order = "a[nauvis]",
    subgroup = "planets",
    map_seed_offset = 0,
    map_gen_settings = planet_map_gen_new.nauvis(),
    pollutant_type = "pollution",
    solar_power_in_space = 300,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    surface_properties =
    {
      ["day-night-cycle"] = 7 * minute
    },
    surface_render_parameters =
    {
      clouds = effects.default_clouds_effect_properties()
    },	
	asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_selene, 0.1),
    persistent_ambient_sounds =
    {
      base_ambience = { filename = "__base__/sound/world/world_base_wind.ogg", volume = 0.3 },
      wind = { filename = "__base__/sound/wind/wind.ogg", volume = 0.8 },
      crossfade =
      {
        order = { "wind", "base_ambience" },
        curve_type = "cosine",
        from = { control = 0.35, volume_percentage = 0.0 },
        to = { control = 2, volume_percentage = 100.0 }
      }
    },
    procession_graphic_catalogue = planet_catalogue_nauvis,
  },
  {
    type = "planet",
    name = "vulcanus",
    icon = "__space-age__/graphics/icons/vulcanus.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-vulcanus.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 10,
    orientation = 0.1,
    magnitude = 1.25,
    order = "c[vulcanus]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.vulcanus(),
    pollutant_type = nil,
    solar_power_in_space = 600,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_vulcanus,
    surface_properties =
    {
      ["day-night-cycle"] = 3 * minute,
      ["magnetic-field"] = 75,
      ["solar-power"] = 400,
      pressure = 2000,
      gravity = 20
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-vulcanus.ogg", volume = 0.8},
      wind = {filename = "__space-age__/sound/wind/wind-vulcanus.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 0.5)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 0.6)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 7.0
        }
      }
    },
    surface_render_parameters =
    {
      fog = effects.default_fog_effect_properties(),
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.5, 0.2, 0.3, 1.0 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.3,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }
    }
  },
  {
    type = "planet",
    name = "gleba",
    icon = "__space-age__/graphics/icons/gleba.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-gleba.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 20,
    orientation = 0.175,
    magnitude = 1.5,
    label_orientation = 0.15,
    order = "d[gleba]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen_new.gleba(),
    pollutant_type = "spores",
    solar_power_in_space = 200,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_gleba,
    surface_properties =
    {
      ["day-night-cycle"] = 11 * minute,
      ["magnetic-field"] = 60,
      ["solar-power"] = 60,
      pressure = 2500,
      gravity = 25
    },
    surface_render_parameters=
    {
      fog =
      {
        fog_type = "gleba",
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        color1 = {255, 217, 139, 1.0},
        color2 = {183, 255, 169, 1.0},
        tick_factor = 0.000001,
      },
       clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.00, "__space-age__/graphics/lut/gleba-1-noon.png"},
        {0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png"},
        {0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png"},
        {0.35, "__space-age__/graphics/lut/gleba-4-sunset.png"},
        {0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png"},
        {0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png"},
        {0.65, "__space-age__/graphics/lut/gleba-7-dawn.png"},
        {0.75, "__space-age__/graphics/lut/gleba-8-morning.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.2, 0.4, 0.3, 0.15 },
        scale_u = { 1.85, 1.85, 1.85, 1.85 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.5,
        global_scale = 0.4,
        zoom_factor = 3.8,
        zoom_intensity = 0.75
      }
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience =
      {
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
      },
      wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.2},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound =
            {
              filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
              advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
            }
        },
        {
          sound =
            {
              variations = sound_variations("__space-age__/sound/world/semi-persistent/night-birds", 14, 0.4),
              advanced_volume_control =
              {
                fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
                darkness_threshold = 0.85
              }
            },
            delay_mean_seconds = 10,
            delay_variance_seconds = 5
        }
      }
    },
    player_effects =
    { -- TODO: replace with shader & find a way to have rain appear and disappear with weather system.
      type = "cluster",
      cluster_count = 10,
      distance = 8,
      distance_deviation = 8,
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "gleba-raindrops",
          speed = {-0.05, 0.5},
          initial_height = 1,
          speed_multiplier = 2,
          speed_multiplier_deviation = 0.05,
          starting_frame = 2,
          starting_frame_deviation = 2,
          offset_deviation = {{-96, -56}, {96, 40}},
          speed_from_center = 0.01,
          speed_from_center_deviation = 0.02
        }
      }
    },
    ticks_between_player_effects = 1
  },
  {
    type = "planet",
    name = "fulgora",
    icon = "__space-age__/graphics/icons/fulgora.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-fulgora.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 25,
    orientation = 0.325,
    magnitude = 0.9,
    label_orientation = 0.35,
    order = "e[fulgora]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.fulgora(),
    pollutant_type = nil,
    solar_power_in_space = 120,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_fulgora,
    surface_properties =
    {
      ["day-night-cycle"] = 4 * minute,
      ["magnetic-field"] = 99,
      ["solar-power"] = 20,
      pressure = 800,
      gravity = 8
    },
    lightning_properties =
    {
      lightnings_per_chunk_per_tick = 1 / (60 * 10), --cca once per chunk every 10 seconds (600 ticks)
      search_radius = 10.0,
      lightning_types = {"lightning"},
      priority_rules =
      {
        {
          type = "id",
          string = "lightning-collector",
          priority_bonus = 10000
        },
        {
          type = "prototype",
          string = "lightning-attractor",
          priority_bonus = 1000
        },
        {
          type = "id",
          string = "fulgoran-ruin-vault",
          priority_bonus = 95
        },
        {
          type = "id",
          string = "fulgoran-ruin-colossal",
          priority_bonus = 94
        },
        {
          type = "id",
          string = "fulgoran-ruin-huge",
          priority_bonus = 93
        },
        {
          type = "id",
          string = "fulgoran-ruin-big",
          priority_bonus = 92
        },
        {
          type = "id",
          string = "fulgoran-ruin-medium",
          priority_bonus = 91
        },
        {
          type = "prototype",
          string = "pipe",
          priority_bonus = 1
        },
        {
          type = "prototype",
          string = "pump",
          priority_bonus = 1
        },
        {
          type = "prototype",
          string = "offshore-pump",
          priority_bonus = 1
        },
        {
          type = "prototype",
          string = "electric-pole",
          priority_bonus = 10
        },
        {
          type = "prototype",
          string = "power-switch",
          priority_bonus = 10
        },
        {
          type = "prototype",
          string = "logistic-robot",
          priority_bonus = 100
        },
        {
          type = "prototype",
          string = "construction-robot",
          priority_bonus = 100
        },
        {
          type = "impact-soundset",
          string = "metal",
          priority_bonus = 1
        }
      },
      exemption_rules =
      {
        {
          type = "prototype",
          string = "rail-support",
        },
        {
          type = "prototype",
          string = "legacy-straight-rail",
        },
        {
          type = "prototype",
          string = "legacy-curved-rail",
        },
        {
          type = "prototype",
          string = "straight-rail",
        },
        {
          type = "prototype",
          string = "curved-rail-a",
        },
        {
          type = "prototype",
          string = "curved-rail-b",
        },
        {
          type = "prototype",
          string = "half-diagonal-rail",
        },
        {
          type = "prototype",
          string = "rail-ramp",
        },
        {
          type = "prototype",
          string = "elevated-straight-rail",
        },
        {
          type = "prototype",
          string = "elevated-curved-rail-a",
        },
        {
          type = "prototype",
          string = "elevated-curved-rail-b",
        },
        {
          type = "prototype",
          string = "elevated-half-diagonal-rail",
        },
        {
          type = "prototype",
          string = "rail-signal",
        },
        {
          type = "prototype",
          string = "rail-chain-signal",
        },
        {
          type = "prototype",
          string = "locomotive",
        },
        {
          type = "prototype",
          string = "artillery-wagon",
        },
        {
          type = "prototype",
          string = "cargo-wagon",
        },
        {
          type = "prototype",
          string = "fluid-wagon",
        },
        {
          type = "prototype",
          string = "land-mine",
        },
        {
          type = "prototype",
          string = "wall",
        },
        {
          type = "prototype",
          string = "tree",
        },
        {
          type = "countAsRockForFilteredDeconstruction",
          string = "true",
        },
      }
    },
    surface_render_parameters =
    {
      clouds =
      {
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },

        warp_sample_1 = { scale = 0.8 / 16 },
        warp_sample_2 = { scale = 3.75 * 0.8 / 32, wind_speed_factor = 0 },
        warped_shape_sample = { scale = 2 * 0.18 / 32 },
        additional_density_sample = { scale = 1.5 * 0.18 / 32, wind_speed_factor = 1.77 },
        detail_sample_1 = { scale = 1.709 / 32, wind_speed_factor = 0.2 / 1.709 },
        detail_sample_2 = { scale = 2.179 / 32, wind_speed_factor = 0.33 / 2.179 },

        scale = 1,
        movement_speed_multiplier = 0.75,
        opacity = 0.25,
        opacity_at_night = 0.25,
        density_at_night = 1,
        detail_factor = 1.5,
        detail_factor_at_night = 2,
        shape_warp_strength = 0.06,
        shape_warp_weight = 0.4,
        detail_sample_morph_duration = 0,
      },

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      -- On fulgora night looks a bit longer to look right with the lightning.
      day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/fulgora-1-noon.png"},
        {0.2, "__space-age__/graphics/lut/fulgora-1-noon.png"},
        {0.3, "__space-age__/graphics/lut/fulgora-2-afternoon.png"},
        {0.4, "__space-age__/graphics/lut/fulgora-3-after-sunset.png"},
        {0.6, "__space-age__/graphics/lut/fulgora-4-before-dawn.png"},
        {0.7, "__space-age__/graphics/lut/fulgora-5-morning.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.2, 0.4, 0.3, 0.25 },
        scale_u = { 1.85, 1.85, 1.85, 1.85 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.3,
        global_scale = 0.25,
        zoom_factor = 3.8,
        zoom_intensity = 0.75
      }
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-fulgora.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-fulgora.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-thunder", 4, 0.6)},
          delay_mean_seconds = 33,
          delay_variance_seconds = 7
        },
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/world/semi-persistent/sand-wind-gust", 5, 0.45),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
            }
          },
          delay_mean_seconds = 15,
          delay_variance_seconds = 9,
        },
      }
    }
  },
  {
    type = "planet",
    name = "aquilo",
    icon = "__space-age__/graphics/icons/aquilo.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-aquilo.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 39,
    orientation = 0.24,
    magnitude = 0.6,
	draw_orbit = false,
   -- label_orientation = 0.15,
    order = "h[aquilo]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen_new.aquilo(),
    pollutant_type = nil,
    solar_power_in_space = 50,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_aquilo,
    surface_properties =
    {
      ["day-night-cycle"] = 20 * minute,
      ["magnetic-field"] = 10,
      pressure = 300,
      ["solar-power"] = 25,
      gravity = 15
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/world/semi-persistent/ice-cracks", 5, 0.7),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}}
            }
          },
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 9
        }
      }
    },
    entities_require_heating = true,
    player_effects =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "aquilo-snow-smoke",
          speed = {0, 0.1},
          initial_height = 0.5,
          speed_multiplier = 1,
          speed_multiplier_deviation = 0.5,
          starting_frame = 8,
          starting_frame_deviation = 8,
          offset_deviation = {{-96, -48}, {96, 48}},
          speed_from_center = 0.04,
          speed_from_center_deviation = 0.2
        }
      }
    },
    ticks_between_player_effects = 2
  },
  -- Amyz
  {
    type = "planet",
    name = "selene",
    icon = "__outer_moons__/graphics/icons/selene.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-selene.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 15,
    orientation = 0.3,
    magnitude = 0.5,
	label_orientation = 0.7,
	draw_orbit = false,
    order = "b[selene]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen_new.selene(),
    pollutant_type = nil,
    solar_power_in_space = 300,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_aquilo,
    surface_properties =
    {
      ["day-night-cycle"] = 1.5 * minute,
      ["magnetic-field"] = 5,
      pressure = 150,
      ["solar-power"] = 300,
      gravity = 1.5
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_selene, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      }
    },
    --entities_require_heating = true,
  },
  {
    type = "planet",
    name = "mefitis",
    icon = "__outer_moons__/graphics/icons/mefitis.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-mefitis.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 37,
    orientation = 0.23,
    magnitude = 0.75,
	draw_orbit = false,
    order = "g[mefitis]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen_new.mefitis(),
    pollutant_type = nil,
    solar_power_in_space = 50,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_mefitis,
    surface_properties =
    {
      ["day-night-cycle"] = 30 * minute,
      ["magnetic-field"] = 10,
      pressure = 500,
      ["solar-power"] = 25,
      gravity = 5
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/world/semi-persistent/ice-cracks", 5, 0.7),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}}
            }
          },
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 9
        }
      }
    },
    --entities_require_heating = true,
    surface_render_parameters =
    {
      fog = effects.default_fog_effect_properties(),
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.5, 0.2, 0.3, 1.0 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.3,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }
    }
  },
  {
    type = "planet",
    name = "aiolos",
    icon = "__outer_moons__/graphics/icons/aiolos.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-aiolos.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 40,
    orientation = 0.26,
    magnitude = 1.35,
	draw_orbit = false,
    order = "i[aiolos]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen_new.aiolos(),
    pollutant_type = nil,
    solar_power_in_space = 50,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_aiolos,
    surface_properties =
    {
      ["day-night-cycle"] = 30 * minute,
      ["magnetic-field"] = 10,
      pressure = 5000,
      ["solar-power"] = 1,
      gravity = 25
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/world/semi-persistent/ice-cracks", 5, 0.7),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}}
            }
          },
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 9
        }
      }
    },
    --entities_require_heating = true,
    surface_render_parameters =
    {
      fog =
      {
        fog_type = "gleba",
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        color1 = {55, 17, 38, 1.0},
        color2 = {83, 55, 69, 1.0},
        tick_factor = 0.00001,
      },
      --clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
      },

    },
	player_effects =
    { -- TODO: replace with shader & find a way to have rain appear and disappear with weather system.
      type = "cluster",
      cluster_count = 5,
      distance = 8,
      distance_deviation = 11,
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "aiolos-wind",
          speed = {-0.5, 0},
          initial_height = 1,
          speed_multiplier = 2,
          speed_multiplier_deviation = 0.5,
          starting_frame = 1,
          starting_frame_deviation = 1,
          offset_deviation = {{-96, -56}, {96, 40}},
          speed_from_center = 0.01,
          speed_from_center_deviation = 0.02
        }
      }
    },
    ticks_between_player_effects = 1
  },
  {
    type = "planet",
    name = "feronia",
    icon = "__outer_moons__/graphics/icons/feronia.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-feronia.png",
    starmap_icon_size = 4096,
    gravity_pull = 10,
    distance = 39,
    orientation = 0.28,
    magnitude = 1.0,
	draw_orbit = false,
    order = "j[feronia]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen_new.feronia(),
    pollutant_type = nil,
    solar_power_in_space = 50,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_feronia,
    surface_properties =
    {
      ["day-night-cycle"] = 30 * minute,
      ["magnetic-field"] = 25,
      pressure = 1200,
      ["solar-power"] = 20,
      gravity = 12
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = { filename = "__base__/sound/world/world_base_wind.ogg", volume = 0.3 },
      wind = { filename = "__base__/sound/wind/wind.ogg", volume = 0.8 },
      crossfade =
      {
        order = { "wind", "base_ambience" },
        curve_type = "cosine",
        from = { control = 0.35, volume_percentage = 0.0 },
        to = { control = 2, volume_percentage = 100.0 }
      }
    },
    --entities_require_heating = true,
    surface_render_parameters =
    {
      --fog = effects.default_fog_effect_properties(),
      clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
	  day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/fulgora-1-noon.png"},
        {0.2, "__space-age__/graphics/lut/fulgora-1-noon.png"},
        {0.3, "__space-age__/graphics/lut/fulgora-2-afternoon.png"},
        {0.4, "__space-age__/graphics/lut/fulgora-3-after-sunset.png"},
        {0.6, "__space-age__/graphics/lut/fulgora-4-before-dawn.png"},
        {0.7, "__space-age__/graphics/lut/fulgora-5-morning.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.2, 0.4, 0.3, 0.25 },
        scale_u = { 1.85, 1.85, 1.85, 1.85 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.7,
        global_scale = 0.25,
        zoom_factor = 3.8,
        zoom_intensity = 0.75
      }
    }
  },
-------------------------------------------------------------------------- LOCATIONS
  {
    type = "space-location",
    name = "cronus",	
    icon = "__outer_moons__/graphics/icons/cronus.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-cronus.png",
    order = "f[cronus]",
    subgroup = "planets",
    starmap_icon_size = 4096,
    gravity_pull = -10,
    distance = 35,
    orientation = 0.25,
    magnitude = 3,
    label_orientation = 0.75,
    solar_power_in_space = 50,
    surface_properties =
    {
      ["day-night-cycle"] = 600 * minute,
      ["magnetic-field"] = 99,
      pressure = 10000,
      ["solar-power"] = 1,
      gravity = 25
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9)
  },
  {
    type = "space-location",
    name = "solar-system-edge",
    icon = "__space-age__/graphics/icons/solar-system-edge.png",
    order = "k[solar-system-edge]",
    subgroup = "planets",
    gravity_pull = -10,
    distance = 35,
    orientation = 0.5,
	label_orientation = -0.25,
    magnitude = 1.5,
    draw_orbit = false,
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge, 0.9)
  },
  {
    type = "space-location",
    name = "shattered-planet",
    icon = "__space-age__/graphics/icons/shattered-planet.png",
    starmap_icon = "__outer_moons__/graphics/icons/starmap-shattered-planet.png",
    starmap_icon_size = 4096,
    order = "l[shattered-planet]",
    subgroup = "planets",
    gravity_pull = -10,
    distance = 60,
    orientation = 0.5,
    magnitude = 2.0,
    draw_orbit = false,
    fly_condition = true,
    auto_save_on_first_trip = false,
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.shattered_planet_trip, 0.8)
  },
-------------------------------------------------------------------------- PLANET CONNECTIONS
  {
    type = "space-connection",
    name = "nauvis-selene",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "selene",
    order = "a",
    length = 5000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_selene)
  },
  {
    type = "space-connection",
    name = "nauvis-vulcanus",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "vulcanus",
    order = "b",
    length = 20000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  {
    type = "space-connection",
    name = "nauvis-gleba",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "gleba",
    order = "c",
    length = 20000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
  },
  {
    type = "space-connection",
    name = "nauvis-fulgora",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "fulgora",
    order = "d",
    length = 25000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora)
  },
  {
    type = "space-connection",
    name = "vulcanus-gleba",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "gleba",
    order = "e",
    length = 25000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
  },
  {
    type = "space-connection",
    name = "gleba-fulgora",
    subgroup = "planet-connections",
    from = "gleba",
    to = "fulgora",
    order = "f",
    length = 20000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
  },
  {
    type = "space-connection",
    name = "gleba-aquilo",
    subgroup = "planet-connections",
    from = "gleba",
    to = "cronus",
    order = "g",
    length = 60000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
  },
  {
    type = "space-connection",
    name = "fulgora-aquilo",
    subgroup = "planet-connections",
    from = "fulgora",
    to = "cronus",
    order = "h",
    length = 50000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "cronus-mefitis",
    subgroup = "planet-connections",
    from = "cronus",
    to = "mefitis",
    order = "i",
    length = 500,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "cronus-aquilo",
    subgroup = "planet-connections",
    from = "cronus",
    to = "aquilo",
    order = "j",
    length = 1000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "cronus-aiolos",
    subgroup = "planet-connections",
    from = "cronus",
    to = "aiolos",
    order = "k",
    length = 1500,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "cronus-feronia",
    subgroup = "planet-connections",
    from = "cronus",
    to = "feronia",
    order = "l",
    length = 2000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "mefitis-aquilo",
    subgroup = "planet-connections",
    from = "mefitis",
    to = "aquilo",
    order = "m",
    length = 500,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "aquilo-aiolos",
    subgroup = "planet-connections",
    from = "aquilo",
    to = "aiolos",
    order = "n",
    length = 500,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "aiolos-feronia",
    subgroup = "planet-connections",
    from = "aiolos",
    to = "feronia",
    order = "o",
    length = 500,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "aquilo-solar-system-edge",
    subgroup = "planet-connections",
    from = "cronus",
    to = "solar-system-edge",
    order = "s",
    length = 50000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
  },
  {
    type = "space-connection",
    name = "solar-system-edge-shattered-planet",
    subgroup = "planet-connections",
    from = "solar-system-edge",
    to = "shattered-planet",
    order = "t",
    length = 4000000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.shattered_planet_trip)
  }
})