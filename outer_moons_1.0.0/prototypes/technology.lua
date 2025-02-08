data:extend(
{
  {
    type = "technology",
    name = "logistics",
    icon = "__base__/graphics/technology/logistics-1.png",
    icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "splitter"
      },
	  --{
      --  type = "unlock-recipe",
      --  recipe = "solder"
      --},
	  {
        type = "unlock-recipe",
        recipe = "burner-inserter"
      },
	  {
        type = "unlock-recipe",
        recipe = "iron-chest"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "iron-plate",
      count = 30
    }
  },
  {
    type = "technology",
    name = "inserter",
    icon = "__outer_moons__/graphics/technology/inserter.png",
    icon_size = 256,
	prerequisites = {"electronics", "logistics"},
	effects =
    {
      {
        type = "unlock-recipe",
        recipe = "inserter"
      },
	  {
        type = "unlock-recipe",
        recipe = "long-handed-inserter"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "nickel-plate",
      count = 10
    }
  },  
  {
    type = "technology",
    name = "multicylinder-engine",
    icon = "__outer_moons__/graphics/technology/multicylinder-engine.png",
    icon_size = 256,
    prerequisites = {"engine", "logistic-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "multicylinder-engine-unit"
      }
    }
  },
  {
    type = "technology",
    name = "electrolysis",
    icon = "__outer_moons__/graphics/technology/electrolysis.png",
    icon_size = 256,
    essential = true,
    effects =
    {	  
	  {
        type = "unlock-recipe",
        recipe = "electrolytic-plant"
      },
	  {
        type = "unlock-recipe",
        recipe = "water-electrolysis"
      },
	  {
        type = "unlock-recipe",
        recipe = "carbon-dioxide-electrolysis"
      },	  
	  {
		type = "unlock-recipe",
		recipe = "coal-carbon-capture"
	  },
    },
    prerequisites = {"oil-processing"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "electric-boiler",
    icon = "__outer_moons__/graphics/technology/electric-boiler.png",
    icon_size = 256,
    essential = true,
    effects =
    {	  
	  {
        type = "unlock-recipe",
        recipe = "electric-boiler"
      },
    },
    prerequisites = {"electrolysis"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "silicon-processing",
    icon = "__outer_moons__/graphics/technology/silicon-processing.png",
    icon_size = 256,
    essential = true,
    effects =
    {	  
	  {
        type = "unlock-recipe",
        recipe = "silicon-wafer"
      },
	  {
        type = "unlock-recipe",
        recipe = "hydrochloric-acid"
      },
	  {
        type = "unlock-recipe",
        recipe = "silica-extraction"
      },
    },
    prerequisites = {"sulfur-processing", "electrolysis"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "silicon-ore"
    }
  },
  
  {
    type = "technology",
    name = "chloralkali-processing",
    icon = "__outer_moons__/graphics/technology/chloralkali-process.png",
    icon_size = 256,
    essential = true,
    effects =
    {		  
	  {
        type = "unlock-recipe",
        recipe = "salt"
      },
	  {
        type = "unlock-recipe",
        recipe = "chloralkali-process"
      },
    },
    prerequisites = {"electrolysis"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "alumina-processing",
    icon = "__outer_moons__/graphics/technology/alumina-processing.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "aluminate"
      },
	  --{
      --  type = "unlock-recipe",
      --  recipe = "red-mud-reprocessing"
      --},
      {
        type = "unlock-recipe",
        recipe = "alumina"
      },
	  {
        type = "unlock-recipe",
        recipe = "aluminum-plate"
      },
	  {
        type = "unlock-recipe",
        recipe = "aluminum-cable"
      },
	  {
        type = "unlock-recipe",
        recipe = "duralumin-plate"
      },
    },
    prerequisites = {"chloralkali-processing"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "aluminum-ore"
    }
  },
  {
    type = "technology",
    name = "advanced-circuit",
    icon = "__base__/graphics/technology/advanced-circuit.png",
    icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "transistor"
      },
      {
        type = "unlock-recipe",
        recipe = "integrated-circuit"
      }
    },
    prerequisites = {"silicon-processing"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "plastics",
    icon = "__outer_moons__/graphics/technology/polyethylene-plastic.png",
    icon_size = 256,
    prerequisites = {"advanced-oil-processing"},
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "hydrogen-peroxide"
      },
      {
        type = "unlock-recipe",
        recipe = "polyethlyene-plastic"
      },
    },
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "polystyrene-plastics",
    icon = "__outer_moons__/graphics/technology/polystyrene-plastic.png",
    icon_size = 256,
    prerequisites = {"plastics"},
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "olefins-reforming"
      },
      {
        type = "unlock-recipe",
        recipe = "polystyrene-plastic"
      },
    },
    unit =
    {
      count = 200,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "processing-unit",
    icon = "__base__/graphics/technology/processing-unit.png",
    icon_size = 256,
    prerequisites = { "battery", "plastics"},
    effects =
    {	  
	  {
        type = "unlock-recipe",
        recipe = "fiber-optic"
      },
	  {
        type = "unlock-recipe",
        recipe = "capacitor"
      },
	  {
        type = "unlock-recipe",
        recipe = "peripheral-interface"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-circuit"
      }
    },
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "processing-unit-new",
    icon = "__outer_moons__/graphics/technology/processing-unit.png",
    icon_size = 256,
    prerequisites = {"processing-unit", "electric-engine"},
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "microprocessor"
      },
	  {
        type = "unlock-recipe",
        recipe = "memory-stick"
      },
	  {
        type = "unlock-recipe",
        recipe = "storage-drive"
      },
      {
        type = "unlock-recipe",
        recipe = "processing-unit"
      }
    },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "fracking",
    icon = "__outer_moons__/graphics/technology/fracking.png",
    icon_size = 256,
    prerequisites = {"advanced-oil-processing"},
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "natural-gas-cracking"
      },
	  {
        type = "unlock-recipe",
        recipe = "methane-reforming"
      },
	  {
        type = "unlock-recipe",
        recipe = "methanol-processing"
      }
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "natural-gas"
    }
  },
  {
    type = "technology",
    name = "wood-gasification",
    icon = "__outer_moons__/graphics/technology/wood-gasification.png",
    icon_size = 256,
    prerequisites = {"fracking"},
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "wood-gasification"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  
  {
    type = "technology",
    name = "uranium-mining",
    icon = "__base__/graphics/technology/uranium-mining.png",
    icon_size = 256,
    effects =
    {
      {
        type = "mining-with-fluid",
        modifier = true
      }
    },
    prerequisites = {"chemical-science-pack", "concrete"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "planet-discovery-selene",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/selene.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "selene",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {"space-platform-thruster"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "titanium-plate",
    icon = "__outer_moons__/graphics/technology/titanium-plate.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "red-mud-reprocessing"
      },
	  {
        type = "unlock-recipe",
        recipe = "titanium-plate"
      },
    },
    prerequisites = {"chloralkali-processing",},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "adv-assembler",
    icon = "__outer_moons__/graphics/technology/adv-assembler.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "adv-assembling-machine"
      },
    },
    prerequisites = {"planet-discovery-selene"},
    research_trigger =
    {
      type = "craft-item",
      item = "magnalium-plate"
    }
  },
  {
    type = "technology",
    name = "liquid-oxygen-fuel",
    icon = "__outer_moons__/graphics/technology/liquid-ox-fuel.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-aluminum"
      },
	  {
        type = "unlock-recipe",
        recipe = "oxygen-rocket-fuel"
      },	  
    },
    prerequisites = {"planet-discovery-selene"},
    research_trigger =
    {
      type = "craft-item",
      item = "magnesium-plate"
    }
  },
  
  {
    type = "technology",
    name = "lunar-science-pack",
    icon = "__outer_moons__/graphics/technology/lunar-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lunar-science-pack"
      },
    },
    prerequisites = {"adv-assembler"},
    research_trigger =
    {
      type = "craft-item",
      item = "adv-assembling-machine"
    }
  },
  {
    type = "technology",
    name = "slipstack",
    icon = "__outer_moons__/graphics/technology/slipstack.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "slipstack-polyp-processing"
      },
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "slipstack"
    }
  },
  {
    type = "technology",
    name = "teflilly",
    icon = "__outer_moons__/graphics/technology/teflilly.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "teflilly-processing"
      },
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "teflilly-plant"
    }
  },
  {
    type = "technology",
    name = "cuttlepop",
    icon = "__outer_moons__/graphics/technology/cuttlepop.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "jellynut-processing"
      },
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "cuttlepop"
    }
  },
  {
    type = "technology",
    name = "funneltrunk",
    icon = "__outer_moons__/graphics/technology/funneltrunk.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "funnelwood-processing"
      },
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "funneltrunk-plant"
    }
  },
  {
    type = "technology",
    name = "lickmaw",
    icon = "__outer_moons__/graphics/technology/lickmaw.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mawpouch-processing"
      },
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "lickmaw"
    }
  },
  {
    type = "technology",
    name = "yumako",
    icon = "__outer_moons__/graphics/technology/yumako.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "yumako-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-bacteria"
      }
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "yumako-tree"
    }
  },
  {
    type = "technology",
    name = "boompuff",
    icon = "__outer_moons__/graphics/technology/boompuff.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "boompuff-bulb-processing"
      },
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "boompuff-plant"
    }
  },
  {
    type = "technology",
    name = "stingfrond",
    icon = "__outer_moons__/graphics/technology/stingfrond.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "frondstalk-processing"
      },
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "stingfrond-plant"
    }
  },
  {
    type = "technology",
    name = "artificial-soil",
    icon = "__space-age__/graphics/technology/artificial-soil.png",
    icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "artificial-cuticle-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "artificial-yumako-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "artificial-jellynut-soil"
      },
	  {
        type = "unlock-recipe",
        recipe = "artificial-ochre-soil"
      },
	  {
        type = "unlock-recipe",
        recipe = "artificial-cerulean-soil"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "nutrients",
      count = 500
    },
    prerequisites = { "slipstack", "teflilly", "cuttlepop", "funneltrunk", "lickmaw", "yumako", "boompuff", "stingfrond"}
  },
  {
    type = "technology",
    name = "overgrowth-soil",
    icon = "__space-age__/graphics/technology/overgrowth-soil.png",
    icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "overgrowth-cuticle-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "overgrowth-yumako-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "overgrowth-jellynut-soil"
      },
	  {
        type = "unlock-recipe",
        recipe = "overgrowth-ochre-soil"
      },
	  {
        type = "unlock-recipe",
        recipe = "overgrowth-cerulean-soil"
      },
    },
    prerequisites = { "artificial-soil", "production-science-pack", "utility-science-pack"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },
  
  {
    type = "technology",
    name = "carbon-fiber",
    icon = "__space-age__/graphics/technology/carbon-fiber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "carbon-fiber",
      },
    },
    prerequisites = {"agricultural-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },
  
  {
    type = "technology",
    name = "planet-discovery-cronus",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/cronus.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "cronus",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"rocket-turret", 
		"advanced-asteroid-processing", 
		"asteroid-reprocessing", 
		"metallurgic-science-pack",
		"agricultural-science-pack",
		"electromagnetic-science-pack"
	},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-mefitis",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/mefitis.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "mefitis",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"planet-discovery-cronus"
	},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-aiolos",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/aiolos.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "aiolos",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"planet-discovery-cronus"
	},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-feronia",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/feronia.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "feronia",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"planet-discovery-cronus"
	},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  
  {
    type = "technology",
    name = "jellynut",
    icon = "__space-age__/graphics/technology/jellynut.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "jellynut-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-bacteria"
      }
    },
    prerequisites = {"planet-discovery-feronia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "jellystem"
    }
  },
}
)
