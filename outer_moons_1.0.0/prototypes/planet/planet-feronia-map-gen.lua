local resource_autoplace = require("resource-autoplace")

data:extend({
  {
    type = "noise-expression",
    name = "feronia_segmentation_multiplier",
    expression = "1"
  },
  {
    type = "noise-expression",
    name = "feronia_angle",
    expression = "map_seed_normalized * 3600"
  },
  {
    type = "noise-expression",
    name = "feronia_spot_size",
    expression = 30
  },
  {
    type = "noise-expression",
    name = "feronia_starting_island",
    expression = "1 - distance * (feronia_segmentation_multiplier / 100)"
  },
  {
    type = "noise-expression",
    name = "feronia_starting_crude_oil",
    expression = "starting_spot_at_angle{angle = feronia_angle, distance = 40, radius = feronia_spot_size * 0.8, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "feronia_starting_lithium_brine",
    expression = "starting_spot_at_angle{angle = feronia_angle + 120, distance = 80, radius = feronia_spot_size * 0.6, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "feronia_starting_flourine_vent",
    expression = "starting_spot_at_angle{angle = feronia_angle + 240, distance = 160, radius = feronia_spot_size * 0.6, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "feronia_starting_flourine_vent_tiny", -- single vent as a taste
    expression = "starting_spot_at_angle{angle = feronia_angle + 240, distance = 80, radius = 1, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "feronia_starting_mask",
    -- exclude random spots from the inner 300 tiles, 80 tile blur
    expression = "clamp((distance - 300) / 40, -1, 1)"
  },

  {
    type = "noise-function",
    name = "feronia_spot_noise",
    parameters = {"seed", "count", "skip_offset", "region_size", "density", "radius", "favorability"},
    expression = "spot_noise{x = x,\z
                             y = y,\z
                             seed0 = map_seed,\z
                             seed1 = seed,\z
                             candidate_spot_count = count,\z
                             suggested_minimum_candidate_point_spacing = 64,\z
                             skip_span = 3,\z
                             skip_offset = skip_offset,\z
                             region_size = region_size,\z
                             density_expression = density,\z
                             spot_quantity_expression = radius * radius,\z
                             spot_radius_expression = radius,\z
                             hard_region_target_quantity = 0,\z
                             spot_favorability_expression = favorability,\z
                             basement_value = -1,\z
                             maximum_spot_basement_radius = radius * 2}"
  },
  {
    type = "noise-expression",
    name = "feronia_crude_oil_spots",
    expression = "feronia_spot_noise{seed = 567,\z
                                    count = 4,\z
                                    skip_offset = 0,\z
                                    region_size = 600 + 400 / control:feronia_crude_oil:frequency,\z
                                    density = 1,\z
                                    radius = feronia_spot_size * sqrt(control:feronia_crude_oil:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "feronia_lithium_brine_spots",
    expression = "feronia_spot_noise{seed = 567,\z
                                    count = 3,\z
                                    skip_offset = 1,\z
                                    region_size = 600 + 400 / control:lithium_brine:frequency,\z
                                    density = 1,\z
                                    radius = feronia_spot_size * 1.2 * sqrt(control:lithium_brine:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "feronia_flourine_vent_spots",
    expression = "feronia_spot_noise{seed = 567,\z
                                    count = 2,\z
                                    skip_offset = 2,\z
                                    region_size = 600 + 400 / control:fluorine_vent:frequency,\z
                                    density = 1,\z
                                    radius = feronia_spot_size * 1.5 * sqrt(control:fluorine_vent:size),\z
                                    favorability = 1}"
  },

  {
    type = "noise-expression",
    name = "feronia_crude_oil_probability",
    expression = "(control:feronia_crude_oil:size > 0)\z
                  * (max(feronia_starting_crude_oil * 0.02,\z
                         min(feronia_starting_mask, feronia_crude_oil_spots) * 0.015))"
  },
  {
    type = "noise-expression",
    name = "feronia_crude_oil_richness",
    expression = "max(feronia_starting_crude_oil * 1800000,\z
                      feronia_crude_oil_spots * 1440000) * control:feronia_crude_oil:richness"
  },
  {
    type = "noise-expression",
    name = "feronia_lithium_brine_probability",
    expression = "(control:lithium_brine:size > 0)\z
                  * (max(feronia_starting_lithium_brine * 0.02,\z
                         min(feronia_starting_mask, feronia_lithium_brine_spots) * 0.012))"
  },
  {
    type = "noise-expression",
    name = "feronia_lithium_brine_richness",
    expression = "max(feronia_starting_lithium_brine * 480000,\z
                      feronia_lithium_brine_spots * 720000) * control:lithium_brine:richness"
  },
  {
    type = "noise-expression",
    name = "feronia_flourine_vent_probability",
    expression = "(control:fluorine_vent:size > 0)\z
                  * (max(feronia_starting_flourine_vent * 0.02,\z
                         feronia_starting_flourine_vent_tiny > 0,\z
                         min(feronia_starting_mask, feronia_flourine_vent_spots) * 0.008))"
  },
  {
    type = "noise-expression",
    name = "feronia_flourine_vent_richness",
    expression = "max(feronia_starting_flourine_vent * 420000,\z
                      (feronia_starting_flourine_vent_tiny > 0) * 420000,\z
                      feronia_flourine_vent_spots * 520000) * control:fluorine_vent:richness"
  },

  {
    type = "noise-expression",
    name = "feronia_island_peaks",
    -- before this point all spots should be in the -1 to 1 range
    expression = "max(1.7 * (0.3 + feronia_starting_island),\z
                      1.5 * (0.5 + max(feronia_starting_crude_oil, feronia_crude_oil_spots,\z
                                     feronia_starting_lithium_brine, feronia_lithium_brine_spots,\z
                                     feronia_starting_flourine_vent, feronia_flourine_vent_spots)))"
  },


  {
    type = "noise-function",
    name = "feronia_simple_billows",
    parameters = {"seed1", "octaves", "input_scale"},
    expression = "abs(quick_multioctave_noise{x = x,\z
                                              y = y,\z
                                              seed0 = map_seed,\z
                                              seed1 = seed1,\z
                                              input_scale = input_scale,\z
                                              output_scale = 1,\z
                                              offset_x = 10000,\z
                                              octaves = octaves,\z
                                              octave_input_scale_multiplier = 0.5,\z
                                              octave_output_scale_multiplier = 0.75})" -- octave_output_scale_multiplier is persistance
  },
  {
    type = "noise-expression",
    name = "feronia_elevation",
    --intended_property = "elevation",
    expression = "lerp(blended, maxed, 0.4)",
    local_expressions = {
      maxed = "max(formation_clumped, formation_broken)",
      blended = "lerp(formation_clumped, formation_broken, 0.4)",
      formation_clumped = "-25\z
                          + 12 * max(feronia_island_peaks, random_island_peaks)\z
                          + 15 * tri_crack",
      formation_broken  = "-20\z
                          + 8 * max(feronia_island_peaks * 1.1, min(0., random_island_peaks - 0.2))\z
                          + 13 * (pow(voronoi_large * max(0, voronoi_large_cell * 1.2 - 0.2) + 0.5 * voronoi_small * max(0, aux + 0.1), 0.5))",
      random_island_peaks = "abs(amplitude_corrected_multioctave_noise{x = x,\z
                                                                  y = y,\z
                                                                  seed0 = map_seed,\z
                                                                  seed1 = 1000,\z
                                                                  input_scale = segmentation_mult / 1.2,\z
                                                                  offset_x = -10000,\z
                                                                  octaves = 6,\z
                                                                  persistence = 0.8,\z
                                                                  amplitude = 1})",
      voronoi_large = "voronoi_facet_noise{   x = x + feronia_wobble_x * 2,\z
                                              y = y + feronia_wobble_y * 2,\z
                                              seed0 = map_seed,\z
                                              seed1 = 'feronia-cracks',\z
                                              grid_size = 256,\z
                                              distance_type = 'euclidean',\z
                                              jitter = 1}",
      voronoi_large_cell = "voronoi_cell_id{  x = x + feronia_wobble_x * 2,\z
                                              y = y + feronia_wobble_y * 2,\z
                                              seed0 = map_seed,\z
                                              seed1 = 'feronia-cracks',\z
                                              grid_size = 256,\z
                                              distance_type = 'euclidean',\z
                                              jitter = 1}",
      voronoi_small  = "voronoi_facet_noise{   x = x + feronia_wobble_x * 2,\z
                                              y = y + feronia_wobble_y * 2,\z
                                              seed0 = map_seed,\z
                                              seed1 = 'feronia-cracks',\z
                                              grid_size = 128,\z
                                              distance_type = 'euclidean',\z
                                              jitter = 1}",
      tri_crack = "min(feronia_simple_billows{seed1 = 2000, octaves = 3, input_scale = segmentation_mult / 1.5},\z
                       feronia_simple_billows{seed1 = 3000, octaves = 3, input_scale = segmentation_mult / 1.2},\z
                       feronia_simple_billows{seed1 = 4000, octaves = 3, input_scale = segmentation_mult})",
      segmentation_mult = "feronia_segmentation_multiplier / 25",
    }
  },
  {
    type = "noise-expression",
    name = "feronia_segmentation_multiplier",
    expression = 2
  },
  {
    type = "noise-expression",
    name = "feronia_aux_scale",
    expression = "feronia_segmentation_multiplier * 5.5"
  },
  {
    type = "noise-expression",
    name = "feronia_wobble_x",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 359911,\z
                                    octaves = 3,\z
                                    persistence = 0.65,\z
                                    input_scale = feronia_aux_scale / 100,\z
                                    output_scale = 0.35}"
  },
  {
    type = "noise-expression",
    name = "feronia_wobble_y",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 335591,\z
                                    octaves = 3,\z
                                    persistence = 0.65,\z
                                    input_scale = feronia_aux_scale / 100,\z
                                    output_scale = 0.35}"
  },
  {
    type = "noise-expression",
    name = "feronia_aux",
    --intended_property = "aux",
    expression = "0.5 + multioctave_noise{x = x + feronia_wobble_x * 555,\z
                                          y = y + feronia_wobble_y * 555,\z
                                          seed0 = map_seed,\z
                                          seed1 = 915341,\z
                                          octaves = 3,\z
                                          persistence = 0.7,\z
                                          input_scale = feronia_aux_scale / 11,\z
                                          output_scale = 2}",
  },
  { -- for rocks & icebergs
    type = "noise-expression",
    name = "feronia_high_frequency_peaks",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.85, seed0 = map_seed, seed1 = 1, octaves = 3, input_scale = 1/6})"
  },

  -- tiles
  {
    type = "noise-expression",
    name = "feronia_solid", -- -1 is liquid, +1 is solid
    expression = "-1 + 2 * elevation < 0"
  },
  {
    type = "noise-expression",
    name = "iodic_ocean", -- darker
    expression = "0.01 * (aux - 0.5)"
  },
  {
    type = "noise-expression",
    name = "iodic_ocean_2", -- brighter
    expression = "-0.01 * (aux - 0.5)"
  },

  {
    type = "noise-expression",
    name = "feronia_snow_ice", --negative is snow, positive is ice
    expression = "multioctave_noise{x = x, y = y, persistence = 0.85, seed0 = map_seed, seed1 = 519, octaves = 3, input_scale = 1/12}"
  },
  {
    type = "noise-expression",
    name = "feronia_tile_variant", -- low is rough or lumpy or patchy, high is flatter.
    expression = "multioctave_noise{x = x, y = y, persistence = 0.85, seed0 = map_seed, seed1 = 915, octaves = 3, input_scale = 1/6}"
  },

  {
    type = "noise-function",
    name = "feronia_min_elevation",
    parameters = {"min_elevation"},
    expression = "-38 + (elevation > min_elevation)"
  },


  {
    type = "noise-expression",
    name = "feronia_snow_flat",
    expression = "10 * feronia_min_elevation(38.5) - (feronia_snow_ice + 0.5) - abs(feronia_tile_variant - 0.5) + elevation / 11 + 1"
  },
  {
    type = "noise-expression",
    name = "feronia_snow_crests",
    expression = "10 * feronia_min_elevation(38) - abs(feronia_snow_ice - 0.2) - abs(feronia_tile_variant - 0.2) + elevation / 11 + 1.2"
  },
  {
    type = "noise-expression",
    name = "feronia_snow_lumpy",
    expression = "10 * feronia_min_elevation(40.5) - abs(feronia_snow_ice + 0.1) - abs(feronia_tile_variant + 0.3) + elevation / 11 + 1.2"
  },
  {
    type = "noise-expression",
    name = "feronia_snow_patchy",
    expression = "10 * feronia_min_elevation(40.5) - abs(feronia_snow_ice + 0.4) - abs(feronia_tile_variant + 0.6) + elevation / 11 + 1"
  },
  
  {
    type = "noise-expression",
    name = "feronia_decorative_knockout", -- small wavelength noise (5 tiles-ish) to make decoratives patchy
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/3}"
  },
  {
    type = "noise-expression",
    name = "feronia_rock_noise",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 137,\z
                                    octaves = 4,\z
                                    persistence = 0.65,\z
                                    input_scale = 0.1,\z
                                    output_scale = 0.4}"
    -- 0.1 / slider_rescale(var('control:rocks:frequency'), 2),\z
  }

})