-- Finite Pumping
if data.raw.resource["crude-oil"] then

    data.raw["mining-drill"]["pumpjack"].mining_speed = 1

    data.raw.resource["crude-oil"].infinite = false
    data.raw.resource["crude-oil"].minimum = 25000
    data.raw.resource["crude-oil"].normal = 100000
    data.raw.resource["crude-oil"].infinite_depletion_amount = 10
    data.raw.resource["crude-oil"].minable =
        {
            mining_time = 1,
            results = {
                {
                    type = "fluid",
                    name = "crude-oil",
                    amount_min = 10,
                    amount_max = 10,
                    probability = 1
                }
            }
        }
	data.raw.resource["crude-oil"].map_color = {0, 0, 0}
end
if data.raw.resource["sulfuric-acid-geyser"] then

    data.raw["mining-drill"]["pumpjack"].mining_speed = 1

    data.raw.resource["sulfuric-acid-geyser"].infinite = false
    data.raw.resource["sulfuric-acid-geyser"].minimum = 60000
    data.raw.resource["sulfuric-acid-geyser"].normal = 300000
    data.raw.resource["sulfuric-acid-geyser"].infinite_depletion_amount = 10
    data.raw.resource["sulfuric-acid-geyser"].minable =
        {
            mining_time = 1,
            results = {
                {
                    type = "fluid",
                    name = "volcanic-gas",
                    amount_min = 10,
                    amount_max = 10,
                    probability = 1
                }
            }
        }
end
if data.raw.resource["fluorine-vent"] then

    data.raw["mining-drill"]["pumpjack"].mining_speed = 1

    data.raw.resource["fluorine-vent"].infinite = false
    data.raw.resource["fluorine-vent"].minimum = 20000
    data.raw.resource["fluorine-vent"].normal = 100000
    data.raw.resource["fluorine-vent"].infinite_depletion_amount = 10
    data.raw.resource["fluorine-vent"].minable =
        {
            mining_time = 1,
            results = {
                {
                    type = "fluid",
                    name = "fluorine",
                    amount_min = 1,
                    amount_max = 1,
                    probability = 1
                }
            }
        }
end

--- TECH
data.raw.technology["electronics"].icon = "__outer_moons__/graphics/technology/electronic-circuit.png"
data.raw.technology["electronics"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "copper-cable"
  },
  {
	type = "unlock-recipe",
	recipe = "electronic-circuit"
  },
  {
	type = "unlock-recipe",
	recipe = "lab"
  },
  {
	type = "unlock-recipe",
	recipe = "small-electric-pole"
  }
}
data.raw.technology["steam-power"].research_trigger = { type = "craft-item", item = "lead-plate", count = 20 }
data.raw.technology["automation"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "assembling-machine-1"
  }
}
data.raw.technology["steel-processing"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "invar-plate"
  },
  {
	type = "unlock-recipe",
	recipe = "steel-plate"
  },
  {
	type = "unlock-recipe",
	recipe = "steel-chest"
  }
}
data.raw.technology["fast-inserter"].icon = "__outer_moons__/graphics/technology/fast-inserter.png"
data.raw.technology["fast-inserter"].prerequisites = {"logistic-science-pack", "inserter", "alumina-processing"}
data.raw.technology["fast-inserter"].effects = 
{
  {
	type = "unlock-recipe",
	recipe = "fast-inserter"
  },
  {
	type = "unlock-recipe",
	recipe = "fast-long-handed-inserter"
  }
}
data.raw.technology["fast-inserter"].unit =
{
  count = 100,
  ingredients = {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
  },
  time = 10
}
data.raw.technology["logistics-2"].prerequisites = {"logistics", "logistic-science-pack", "advanced-circuit"}
data.raw.technology["electric-energy-distribution-1"].prerequisites = {"steel-processing", "alumina-processing"}
data.raw.technology["bulk-inserter"].prerequisites = {"processing-unit", "fast-inserter", "alumina-processing"}
data.raw.technology["personal-laser-defense-equipment"]. prerequisites = {"laser-turret", "military-3", "power-armor", "solar-panel-equipment"}
data.raw.technology["uranium-mining"].hidden = true
data.raw.technology["uranium-processing"].prerequisites = {"chemical-science-pack", "concrete"}
data.raw.technology["advanced-material-processing-2"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "electric-furnace-new"
  }
}
data.raw.technology["bulk-inserter"].unit =
{
  count = 150,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1}
  },
  time = 30
}
data.raw.technology["bulk-inserter"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "bulk-inserter"
  },
  {
	type = "unlock-recipe",
	recipe = "bulk-long-handed-inserter"
  },
  {
	type = "bulk-inserter-capacity-bonus",
	modifier = 1
  }
}
data.raw.technology["inserter-capacity-bonus-1"].unit =
{
  count = 150,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 30
}
data.raw.technology["inserter-capacity-bonus-2"].unit =
{
  count = 200,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 30
}
data.raw.technology["inserter-capacity-bonus-3"].unit =
{
  count = 250,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 30
}
data.raw.technology["military"].unit =
{
  count = 10,
  ingredients = {{"automation-science-pack", 1}},
  time = 10
}
data.raw.technology["gun-turret"].prerequisites = { "military" }
data.raw.technology["gun-turret"].unit =
{
  count = 15,
  ingredients = {{"automation-science-pack", 1}},
  time = 10
}
data.raw.technology["advanced-material-processing"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "steel-furnace-new"
  }
}
data.raw.technology["engine"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "spark-plug"
  },
  {
	type = "unlock-recipe",
	recipe = "engine-unit"
  }
}
data.raw.technology["engine"].unit =
{
  count = 50,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1}
  },
  time = 15
}
data.raw.technology["fluid-handling"].prerequisites = {"automation", "engine"}
data.raw.technology["fluid-handling"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "small-storage-tank"
  },
  {
	type = "unlock-recipe",
	recipe = "storage-tank"
  },
  {
	type = "unlock-recipe",
	recipe = "large-storage-tank"
  },
  {
	type = "unlock-recipe",
	recipe = "pump"
  },
  {
	type = "unlock-recipe",
	recipe = "gas-vent"
  },
  {
	type = "unlock-recipe",
	recipe = "flare-stack"
  },
  {
	type = "unlock-recipe",
	recipe = "barrel"
  }
}
data.raw.technology["logistics-2"].prerequisites = {"logistics", "logistic-science-pack", "steel-processing"}
data.raw.technology["automation-2"].prerequisites = {"automation", "steel-processing", "advanced-circuit", "engine"}
data.raw.technology["automobilism"].prerequisites = {"logistics-2", "multicylinder-engine", "alumina-processing"}
data.raw.technology["railway"].prerequisites = {"logistics-2", "multicylinder-engine"}
data.raw.technology["concrete"].prerequisites = {"advanced-material-processing", "silicon-processing"}
data.raw.technology["laser"].prerequisites = {"battery", "chemical-science-pack"}
data.raw.technology["rocketry"].unit =
{
  count = 120,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"military-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 15
}
data.raw.technology["follower-robot-count-1"].unit =
{
  count = 100,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"military-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 30
}
data.raw.technology["follower-robot-count-2"].unit =
{
  count = 200,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"military-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 30
}
data.raw.technology["land-mine"].unit =
{
  count = 100,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"military-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 30
}
data.raw.technology["defender"].prerequisites = {"military-science-pack", "robotics"}
data.raw.technology["defender"].unit =
{
  count = 100,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"military-science-pack", 1},
	{"chemical-science-pack", 1}
  },
  time = 30
}
data.raw.technology["explosives"].prerequisites = {"sulfur-processing", "fracking"}
data.raw.technology["explosives"].unit =
{
  count = 100,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
  },
  time = 15
}
data.raw.technology["explosives"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "potassium-salt"
  },
  {
	type = "unlock-recipe",
	recipe = "ammonia"
  },
  {
	type = "unlock-recipe",
	recipe = "nitric-acid"
  },
  {
	type = "unlock-recipe",
	recipe = "niter"
  },
  {
	type = "unlock-recipe",
	recipe = "explosives"
  }
}
data.raw.technology["oil-processing"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "oil-refinery"
  },
  {
	type = "unlock-recipe",
	recipe = "chemical-plant"
  },
  {
	type = "unlock-recipe",
	recipe = "basic-oil-processing"
  },
  {
	type = "unlock-recipe",
	recipe = "solid-fuel"
  }
}
data.raw.technology["advanced-oil-processing"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "advanced-oil-processing"
  },
  {
	type = "unlock-recipe",
	recipe = "petroleum-gas-processing"
  },
  {
	type = "unlock-recipe",
	recipe = "heavy-oil-cracking"
  },
  {
	type = "unlock-recipe",
	recipe = "light-oil-cracking"
  }, 
}
data.raw.technology["low-density-structure"].prerequisites = {"alumina-processing", "chemical-science-pack", "plastics"}
data.raw.technology["circuit-network"].prerequisites = {"advanced-circuit"}
data.raw.technology["solar-energy"].prerequisites = {"steel-processing", "silicon-processing", "logistic-science-pack"}
data.raw.technology["laser-turret"].prerequisites = {"laser", "advanced-circuit", "military-science-pack"}
data.raw.technology["power-armor-mk2"].prerequisites = {"power-armor", "military-4", "space-science-pack"}
data.raw.technology["power-armor-mk2"].unit =
{
  count = 400,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"military-science-pack", 1},
	{"utility-science-pack", 1},
	{"space-science-pack", 1},
  },
  time = 30
}
data.raw.technology["kovarex-enrichment-process"].prerequisites = {"space-science-pack", "nuclear-science-pack"}
data.raw.technology["kovarex-enrichment-process"].unit =
{
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"space-science-pack", 1},
	{"nuclear-science-pack", 1},
  },
  time = 30,
  count = 1000
}
data.raw.technology["atomic-bomb"].unit =
{
  count = 5000,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"military-science-pack", 1},
	{"utility-science-pack", 1},
	{"space-science-pack", 1},
	{"nuclear-science-pack", 1},
  },
  time = 45
}
data.raw.technology["fission-reactor-equipment"].unit =
{
  count = 500,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"military-science-pack", 1},
	{"utility-science-pack", 1},
	{"nuclear-science-pack", 1},
  },
  time = 30
}
data.raw.technology["uranium-ammo"].prerequisites = {"nuclear-science-pack", "military-4"}
data.raw.technology["uranium-ammo"].unit =
{
  count = 1000,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"military-science-pack", 1},
	{"utility-science-pack", 1},
	{"nuclear-science-pack", 1},
  },
  time = 45
}
data.raw.technology["nuclear-fuel-reprocessing"].prerequisites = {"nuclear-power"}
data.raw.technology["nuclear-fuel-reprocessing"].unit =
{
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"nuclear-science-pack", 1}
  },
  time = 30,
  count = 50
}
data.raw.technology["sulfur-processing"].effects =
{  
  {
	type = "unlock-recipe",
	recipe = "sulfur"
  },
  {
	type = "unlock-recipe",
	recipe = "sulfur-dioxide"
  },
  {
	type = "unlock-recipe",
	recipe = "sulfane-oxygenation"
  },
  {
	type = "unlock-recipe",
	recipe = "sulfuric-acid"
  },
  {
	type = "mining-with-fluid",
	modifier = true
  }
}
data.raw.technology["lubricant"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "lubricant"
  },
  {
	type = "unlock-recipe",
	recipe = "NaK-lubricant"
  }
}
data.raw.technology["space-science-pack"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "space-science-pack"
  },
  {
	type = "unlock-recipe",
	recipe = "silicon-carbide"
  },
  {
	type = "unlock-recipe",
	recipe = "space-ammo"
  },
 }
data.raw.technology["space-platform"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "asteroid-collector"
  },
  {
	type = "unlock-recipe",
	recipe = "crusher"
  },
  {
	type = "unlock-recipe",
	recipe = "metallic-asteroid-crushing"
  },
  {
	type = "unlock-recipe",
	recipe = "carbonic-asteroid-crushing"
  },
  {
	type = "unlock-recipe",
	recipe = "silicaceous-asteroid-crushing"
  },
  {
	type = "unlock-recipe",
	recipe = "oxide-asteroid-crushing"
  },
  {
	type = "unlock-recipe",
	recipe = "cargo-bay"
  }
}
data.raw.technology["steel-plate-productivity"].effects =
{
  {
	type = "change-recipe-productivity",
	recipe = "invar-plate",
	change = 0.1
  },
  {
	type = "change-recipe-productivity",
	recipe = "steel-plate",
	change = 0.1
  },
  {
	type = "change-recipe-productivity",
	recipe = "casting-invar",
	change = 0.1
  },
  {
	type = "change-recipe-productivity",
	recipe = "casting-steel",
	change = 0.1
  }
}


data.raw.technology["cliff-explosives"].prerequisites = {"explosives", "military-2", "lunar-science-pack"}
data.raw.technology["cliff-explosives"].unit =
{
  count = 500,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"space-science-pack", 1},
	{"lunar-science-pack", 1},
  },
  time = 30
}

data.raw.technology["space-science-pack"].icon = "__outer_moons__/graphics/technology/space-science-pack.png"
data.raw.recipe["space-science-pack"].icon = "__outer_moons__/graphics/icons/space-science-pack.png"

data.raw.technology["metallurgic-science-pack"].icon = "__outer_moons__/graphics/technology/metallurgic-science-pack.png"
data.raw.recipe["metallurgic-science-pack"].icon = "__outer_moons__/graphics/icons/metallurgic-science-pack.png"

data.raw.technology["agricultural-science-pack"].icon = "__outer_moons__/graphics/technology/agricultural-science-pack.png"
data.raw.recipe["agricultural-science-pack"].icon = "__outer_moons__/graphics/icons/agricultural-science-pack.png"

data.raw.technology["electromagnetic-science-pack"].icon = "__outer_moons__/graphics/technology/electromagnetic-science-pack.png"
data.raw.recipe["electromagnetic-science-pack"].icon = "__outer_moons__/graphics/icons/electromagnetic-science-pack.png"

data.raw.technology["cryogenic-science-pack"].icon = "__outer_moons__/graphics/technology/cryogenic-science-pack.png"
data.raw.recipe["cryogenic-science-pack"].icon = "__outer_moons__/graphics/icons/cryogenic-science-pack.png"

data.raw.technology["promethium-science-pack"].icon = "__outer_moons__/graphics/technology/deep-space-science-pack.png"
data.raw.recipe["promethium-science-pack"].icon = "__outer_moons__/graphics/icons/deep-space-science-pack.png"
-- Rocket Silo
data.raw.technology["rocket-silo"].prerequisites =
{
  "concrete",
  "rocket-fuel",
  "processing-unit-new",
  "low-density-structure",
  "advanced-material-processing-2",
  "logistic-robotics",
}
data.raw.technology["rocket-silo"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "rocket-silo"
  },
  {
	type = "unlock-recipe",
	recipe = "rocket-part"
  },
  {
	type = "unlock-recipe",
	recipe = "rocket-part-new"
  },
  {
	type = "unlock-recipe",
	recipe = "cargo-landing-pad"
  },
  {
	type = "unlock-recipe",
	recipe = "caelium-plate"
  },
  {
	type = "unlock-recipe",
	recipe = "space-platform-foundation"
  },
  {
	type = "unlock-recipe",
	recipe = "space-platform-starter-pack"
  },
  {
    type = "unlock-space-platforms",
    modifier = true,
    hidden = true
  },
}
-- Foundry
data.raw.technology["foundry"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "foundry"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-iron-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-copper-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-lead-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-nickel-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-aluminum-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-silicon-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-iron"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-copper"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-lead"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-nickel"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-aluminum"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-silicon"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-titanium"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-magnesium"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-tungsten"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-iron"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-copper"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-lead"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-nickel"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-aluminum"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-silicon"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-titanium"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-magnesium"
  },
  {
	type = "unlock-recipe",
	recipe = "tungsten-plate"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-invar"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-steel"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-duralumin"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-magnalium"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-caelium"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-iron-gear-wheel"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-iron-stick"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-copper-cable"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-aluminum-cable"
  },
  --{
	--type = "unlock-recipe",
	--recipe = "casting-fiber-optic"
  --},
  {
	type = "unlock-recipe",
	recipe = "casting-pipe"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-pipe-to-ground"
  },  
  {
	type = "unlock-recipe",
	recipe = "concrete-from-molten-iron"
  },{
	type = "unlock-recipe",
	recipe = "refined-concrete-from-molten-iron"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-low-density-structure"
  },
}
data.raw.technology["biochamber"].prerequisites = {"agriculture" }
data.raw.technology["biochamber"].research_trigger =
{
  type = "craft-item",
  item = "nutrients",
  count = 50
}
-- Planet discoveries
data.raw.technology["planet-discovery-vulcanus"].prerequisites =
{
  "space-platform-thruster",
  "lunar-science-pack"
}
data.raw.technology["planet-discovery-vulcanus"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["planet-discovery-gleba"].prerequisites =
{
  "space-platform-thruster",
  "lunar-science-pack"
}
data.raw.technology["planet-discovery-gleba"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["planet-discovery-fulgora"].prerequisites =
{
  "space-platform-thruster",
  "lunar-science-pack"
}
data.raw.technology["planet-discovery-fulgora"].effects =
{
  {
	type = "unlock-space-location",
	space_location = "fulgora",
	use_icon_overlay_constant = true
  },
  {
	type = "unlock-recipe",
	recipe = "lightning-rod",
  },
  {
	type = "unlock-recipe",
	recipe = "sludge-separation"
  },  
  {
	type = "unlock-recipe",
	recipe = "amalgamate-microplastic"
  },
}
data.raw.technology["power-armor-mk2"].prerequisites = { "lunar-science-pack", "power-armor", "military-4" }
data.raw.technology["electromagnetic-plant"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "electromagnetic-plant",
  },
  {
	type = "unlock-recipe",
	recipe = "superconductor",
  },
}
data.raw.technology["power-armor-mk2"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"utility-science-pack",         1},
   {"space-science-pack",           1},   
   {"lunar-science-pack",   	    1}
}
data.raw.technology["electromagnetic-science-pack"].prerequisites = { "solid-state-battery" }
data.raw["tile"]["oil-ocean-shallow"].fluid = "sludge"
data.raw["tile"]["oil-ocean-deep"].fluid = "sludge"
data.raw.technology["planet-discovery-fulgora"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["planet-discovery-aquilo"].prerequisites =
{
  "planet-discovery-cronus",
  "heating-tower"
}

-- Modules
data.raw.technology["speed-module-2"].prerequisites =
{
  "speed-module",
  "lunar-science-pack",
}
data.raw.technology["speed-module-2"].unit =
{
  count = 500,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"space-science-pack", 1},
	{"lunar-science-pack", 1}
  },
  time = 30
}

data.raw.technology["speed-module-3"].prerequisites =
{
  --"computing-core",
  --"quantum-supercomputer",
  "speed-module-2",
  "lunar-science-pack",
  "pneumatic-science-pack", 
}
data.raw.technology["speed-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"lunar-science-pack", 1},
  {"pneumatic-science-pack", 1},
}

data.raw.technology["efficiency-module-2"].prerequisites =
{
  "efficiency-module",
  "agricultural-science-pack",
}
data.raw.technology["efficiency-module-2"].unit =
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
  time = 30
}

data.raw.technology["efficiency-module-3"].prerequisites =
{
  --"computing-core",
  --"quantum-supercomputer",  
  "efficiency-module-2",
  "agricultural-science-pack",
  "genetic-science-pack", 
}
data.raw.technology["efficiency-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"agricultural-science-pack", 1},
  {"genetic-science-pack", 1},
}

data.raw.technology["productivity-module-2"].prerequisites =
{
  "productivity-module",
  "metallurgic-science-pack",
}
data.raw.technology["productivity-module-2"].unit =
{
  count = 500,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"space-science-pack", 1},
	{"metallurgic-science-pack", 1}
  },
  time = 30
}

data.raw.technology["productivity-module-3"].prerequisites =
{
  --"computing-core",
  --"quantum-supercomputer",
  "productivity-module-2",
  "metallurgic-science-pack",
  "material-science-pack", 
}
data.raw.technology["productivity-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"metallurgic-science-pack", 1},
  {"material-science-pack", 1},
}
data.raw.technology["quality-module-2"].prerequisites =
{
  "quality-module",
  "electromagnetic-science-pack",
}
data.raw.technology["quality-module-2"].unit =
{
  count = 500,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"space-science-pack", 1},
	{"electromagnetic-science-pack", 1}
  },
  time = 30
}
data.raw.technology["quality-module-3"].prerequisites =
{
  --"computing-core",
  --"quantum-supercomputer",
  "quality-module-2",
  "electromagnetic-science-pack",
  "cryogenic-science-pack", 
}
data.raw.technology["quality-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"electromagnetic-science-pack", 1},
  {"cryogenic-science-pack", 1},
}
-- Stack inserter
data.raw.technology["stack-inserter"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "stack-inserter"
  },
  {
	type = "unlock-recipe",
	recipe = "stack-long-handed-inserter"
  },
  {
	type = "belt-stack-size-bonus",
	modifier = 1
  }
}
data.raw.technology["stack-inserter"].prerequisites =
{
  "bulk-inserter",
  "production-science-pack", 
  "utility-science-pack",
  "lunar-science-pack"
}
data.raw.technology["stack-inserter"].unit.ingredients =
{
  {"automation-science-pack",   1},
  {"logistic-science-pack",     1},
  {"chemical-science-pack",     1},
  {"production-science-pack",   1},
  {"utility-science-pack",      1},
  {"space-science-pack",        1},
  {"lunar-science-pack", 		1}
}
data.raw.technology["transport-belt-capacity-1"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"production-science-pack",      1},
   {"utility-science-pack",         1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["transport-belt-capacity-2"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"production-science-pack",      1},
   {"utility-science-pack",         1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   		1}
}

data.raw.technology["calcite-processing"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "acid-neutralisation"
  },
  {
	type = "unlock-recipe",
	recipe = "steam-condensation"
  },
  {
	type = "unlock-recipe",
	recipe = "simple-coal-liquefaction"
  }, 
  {
	type = "unlock-recipe",
	recipe = "volcanic-gas-separation"
  },
}


data.raw.technology["heating-tower"].research_trigger =
{
  type = "mine-entity",
  entity = "nickel-stromatolite"
}
data.raw.technology["biochamber"].prerequisites = { "planet-discovery-gleba" }
data.raw.technology["biochamber"].research_trigger =
{
  type = "mine-entity",
  entity = "copper-stromatolite"
}
data.raw.technology["biochamber"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "biochamber"
  },
  {
	type = "unlock-recipe",
	recipe = "pentapod-egg"
  }
}

-- Agricultural Science Pack doesn't spoil
data.raw.tool["agricultural-science-pack"].spoil_result = nil
data.raw.tool["agricultural-science-pack"].spoil_result = nil
data.raw.lab["lab"].inputs =
{
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "space-science-pack",
  "lunar-science-pack",
  "metallurgic-science-pack",
  "agricultural-science-pack",
  "electromagnetic-science-pack",
  "cryogenic-science-pack",
  "promethium-science-pack"
}
data.raw.lab["biolab"].inputs =
{
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "space-science-pack",
  "lunar-science-pack",
  "metallurgic-science-pack",
  "agricultural-science-pack",
  "electromagnetic-science-pack",
  "cryogenic-science-pack",
  "promethium-science-pack"
}

--order
data.raw.resource["crude-oil"].order = "a-b-a[crude-oil]"
data.raw.resource["sulfuric-acid-geyser"].order = "a-b-c[sulfuric-acid-geyser]"
data.raw.resource["lithium-brine"].order = "a-b-e[lithium-brine]"
data.raw.resource["fluorine-vent"].order = "a-b-f[fluorine-vent]"
data.raw.recipe["molten-iron-from-lava"].icon = "__outer_moons__/graphics/icons/fluid/molten-iron-from-lava.png"
data.raw.recipe["ice-melting"].subgroup = "phase-recipes"

data.raw.recipe["burner-inserter"].enabled = false
data.raw.recipe["iron-chest"].enabled = false

data.raw["cargo-wagon"]["cargo-wagon"].quality_affects_inventory_size = true
data.raw["fluid-wagon"]["fluid-wagon"].quality_affects_capacity = true

data.raw.module["speed-module"].subgroup = "speed-module"
data.raw.module["speed-module-2"].subgroup = "speed-module"
data.raw.module["speed-module-3"].subgroup = "speed-module"

data.raw.module["efficiency-module"].subgroup = "efficiency-module"
data.raw.module["efficiency-module-2"].subgroup = "efficiency-module"
data.raw.module["efficiency-module-3"].subgroup = "efficiency-module"

data.raw.module["productivity-module"].subgroup = "productivity-module"
data.raw.module["productivity-module-2"].subgroup = "productivity-module"
data.raw.module["productivity-module-3"].subgroup = "productivity-module"

data.raw.module["quality-module"].subgroup = "quality-module"
data.raw.module["quality-module-2"].subgroup = "quality-module"
data.raw.module["quality-module-3"].subgroup = "quality-module"

data.raw.item["underground-belt"].subgroup = "underground"
data.raw.item["fast-underground-belt"].subgroup = "underground"
data.raw.item["express-underground-belt"].subgroup = "underground"

data.raw.item["splitter"].subgroup = "splitter"
data.raw.item["fast-splitter"].subgroup = "splitter"
data.raw.item["express-splitter"].subgroup = "splitter"

data.raw.item["loader"].subgroup = "loader"
data.raw.item["fast-loader"].subgroup = "loader"
data.raw.item["express-loader"].subgroup = "loader"

data.raw.item["engine-unit"].order = "c[advanced-intermediates]-b[engine-unit]"
data.raw.item["flying-robot-frame"].order = "c[advanced-intermediates]-e[flying-robot-frame]"
data.raw.item["copper-cable"].subgroup = "circuit-parts"
data.raw.item["centrifuge"].icon = "__outer_moons__/graphics/icons/centrifuge.png"
data.raw.item["tungsten-plate"].icon = "__outer_moons__/graphics/icons/tungsten-plate.png"
data.raw.item["tungsten-carbide"].icon = "__outer_moons__/graphics/icons/tungsten-carbide.png"

data.raw.recipe["small-lamp"].category = "electronics-or-assembling"

data.raw.item["substation"].stack_size = 50
data.raw.item["substation"].weight = 20 * kg

data.raw.item["lab"].subgroup = "labs"
data.raw.item["biolab"].subgroup = "labs"

data.raw.lab["lab"].inputs = {
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack",
	"nuclear-science-pack",
	"space-science-pack",
	"lunar-science-pack",
	"metallurgic-science-pack",
	"agricultural-science-pack",
	"electromagnetic-science-pack",
	"material-science-pack",
	"cryogenic-science-pack",
	"pneumatic-science-pack",
	"genetic-science-pack",
	"particle-science-pack",
	"promethium-science-pack"
}
data.raw.lab["biolab"].inputs = {
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack",
	"nuclear-science-pack",
	"space-science-pack",
	"lunar-science-pack",
	"metallurgic-science-pack",
	"agricultural-science-pack",
	"electromagnetic-science-pack",
	"material-science-pack",
	"cryogenic-science-pack",
	"pneumatic-science-pack",
	"genetic-science-pack",
	"particle-science-pack",
	"promethium-science-pack"
}

data.raw.item["stack-inserter"].default_import_location = "selene"
data.raw.capsule["cliff-explosives"].default_import_location = "selene"
data.raw.item["nuclear-fuel"].stack_size = 5

data.raw.item["oil-refinery"].subgroup = "fluid-machine"
data.raw.item["oil-refinery"].order = "b[oil-refinery]"
data.raw.item["chemical-plant"].subgroup = "fluid-machine"
data.raw.item["chemical-plant"].order = "c[chemical-plant]"
data.raw.item["cryogenic-plant"].subgroup = "fluid-machine"
data.raw.item["cryogenic-plant"].order = "d[cryogenic-plant]"

data.raw["heat-pipe"]["heat-pipe"].heating_radius = 2

data.raw.item["accumulator"].subgroup = "energy-production"
data.raw.item["solar-panel"].subgroup = "energy-production"
data.raw.item["steam-engine"].subgroup = "energy-production"
--data.raw.item["nuclear-reactor"].subgroup = "energy-production"
data.raw.item["nuclear-reactor"].order = "e[nuclear-reactor]"
data.raw.item["steam-turbine"].subgroup = "energy-production"
--data.raw.item["fusion-reactor"].subgroup = "energy-production"
data.raw.item["fusion-generator"].subgroup = "energy-production"

data.raw.item["storage-tank"].order = "b[fluid]-b[storage-tank]"
data.raw.item["heat-exchanger"].order = "c[heat-exchanger]"
data.raw.item["heat-pipe"].order = "d[heat-pipe]"

data.raw.recipe["plastic-bar"].hidden = true

data.raw.item["metallic-asteroid-chunk"].stack_size = 5
data.raw.item["carbonic-asteroid-chunk"].stack_size = 5
data.raw.item["oxide-asteroid-chunk"].stack_size = 5
data.raw.item["promethium-asteroid-chunk"].stack_size = 5

data.raw.item["uranium-ore"].subgroup = "uranium-processing"
data.raw.item["uranium-ore"].order = "a[uranium-processing]-a[uranium-ore]"

data.raw.item["steel-plate"].subgroup = "alloy"
data.raw.item["steel-plate"].order = "b[steel-plate]"

data.raw.item["carbon"].subgroup = "chemical"
data.raw.item["carbon"].order = "a[carbon]"
data.raw.item["sulfur"].subgroup = "chemical"
data.raw.item["sulfur"].order = "b[sulfur]"


data.raw.item["solid-fuel"].subgroup = "chemical-product"
data.raw.item["solid-fuel"].order = "a[solid-fuel]"
data.raw.item["plastic-bar"].subgroup = "chemical-product"
data.raw.item["plastic-bar"].order = "b[plastic-bar]"
data.raw.item["explosives"].subgroup = "chemical-product"
data.raw.item["explosives"].order = "c[explosives]"


data.raw.item["low-density-structure"].subgroup = "space-parts"
data.raw.recipe["rocket-fuel"].category = "chemistry-or-cryogenics"
data.raw.item["rocket-fuel"].subgroup = "space-parts"
data.raw.item["rocket-part"].subgroup = "space-parts"

data.raw.item["ice"].subgroup = "selene-resources"
data.raw.item["ice"].order = "b[ice]"


data.raw.capsule["raw-fish"].subgroup = "nauvis-agriculture"
data.raw.capsule["raw-fish"].order = "b[nauvis-agriculture]-b[fish-breeding]"
data.raw.item["tree-seed"].subgroup = "nauvis-agriculture"
data.raw.item["tree-seed"].order = "b[nauvis-agriculture]-a[wood-processing]"
data.raw.item["biter-egg"].subgroup = "nauvis-agriculture"
data.raw.item["biter-egg"].order = "b[nauvis-agriculture]-d[nutrients-from-biter-egg]"
data.raw.tree["water-cane"].minable.results = { {type = "item", name = "wood", amount = 1}, {type = "item", name = "nutrients", amount = 1}, }

data.raw.item["ice-platform"].order = "c[landfill]-i[ice-platform]"
data.raw.item["foundation"].order = "c[landfill]-j[foundation]"

data.raw.item["steam-turbine"].weight = 100 * kg
data.raw.item["rocket-silo"].weight = 1 * tons
data.raw.recipe["uranium-fuel-cell"].category = "centrifuging"

data.raw.recipe["molten-iron"].subgroup = "vulcanus-fluid"
data.raw.recipe["molten-copper"].subgroup = "vulcanus-fluid"
data.raw.recipe["casting-iron"].icon = "__outer_moons__/graphics/icons/fluid/casting-iron.png"
data.raw.recipe["casting-iron"].subgroup = "vulcanus-casting"
data.raw.recipe["casting-copper"].icon = "__outer_moons__/graphics/icons/fluid/casting-copper.png"
data.raw.recipe["casting-copper"].subgroup = "vulcanus-casting"
data.raw.recipe["casting-iron-gear-wheel"].icon = "__outer_moons__/graphics/icons/fluid/casting-iron-gear-wheel.png"
data.raw.recipe["casting-iron-gear-wheel"].subgroup = "vulcanus-products"
data.raw.recipe["casting-iron-gear-wheel"].order = "d[casting]-a[casting-iron-gear-wheel]"
data.raw.recipe["casting-iron-stick"].icon = "__outer_moons__/graphics/icons/fluid/casting-iron-stick.png"
data.raw.recipe["casting-iron-stick"].subgroup = "vulcanus-products"
data.raw.recipe["casting-iron-stick"].order = "d[casting]-b[casting-iron-stick]"
data.raw.recipe["casting-copper-cable"].icon = "__outer_moons__/graphics/icons/fluid/casting-copper-cable.png"
data.raw.recipe["casting-copper-cable"].subgroup = "vulcanus-products"
data.raw.recipe["casting-copper-cable"].order = "d[casting]-c[casting-copper-cable]"

data.raw.recipe["nutrients-from-spoilage"].subgroup = "agriculture-processes"
data.raw.recipe["nutrients-from-spoilage"].order = "c[nutrients]-b[nutrients-from-spoilage]"
data.raw.recipe["nutrients-from-bioflux"].subgroup = "agriculture-processes"
data.raw.recipe["nutrients-from-bioflux"].order = "c[nutrients]-a[nutrients-from-bioflux]"
--data.raw.item["nutrients"].subgroup = "agriculture-products"
data.raw.item["nutrients"].order = "a[agriculture]-h[nutrients]"
--data.raw.item["spoilage"].subgroup = "agriculture-products"
data.raw.item["spoilage"].order = "a[agriculture]-i[spoilage]"
data.raw.item["copper-bacteria"].subgroup = "bacteria"
data.raw.item["copper-bacteria"].order = "b[copper-bacteria]"
data.raw.item["iron-bacteria"].subgroup = "bacteria"
data.raw.item["iron-bacteria"].order = "a[iron-bacteria]"
data.raw.recipe["iron-bacteria-cultivation"].subgroup = "bacteria"
data.raw.recipe["iron-bacteria-cultivation"].order = "b[bacteria]"
data.raw.recipe["copper-bacteria-cultivation"].subgroup = "bacteria"
data.raw.recipe["copper-bacteria-cultivation"].order = "d[bacteria]"
--data.raw.item["carbon-fiber"].hidden_in_factoriopedia = true
--data.raw.item["iron-bacteria"].hidden_in_factoriopedia = true
--data.raw.item["copper-bacteria"].hidden_in_factoriopedia = true
data.raw.item["carbon-fiber"].subgroup = "bioflux-intermediates"
data.raw.item["carbon-fiber"].order = "h[carbon-fiber]"



data.raw.item["foundry"].order = "f[recycler]"
data.raw.item["recycler"].order = "h[recycler]"


data.raw.item["quantum-processor"].subgroup = "circuit-parts-2"
data.raw.item["quantum-processor"].order = "h[quantum-processor]"

data.raw.item["superconductor"].icon = "__outer_moons__/graphics/icons/superconductor.png"
data.raw.item["supercapacitor"].icon = "__outer_moons__/graphics/icons/supercapacitor.png"

data.raw.item["beacon"].weight = 50 * kg

data.raw.inserter["long-handed-inserter"].next_upgrade = "fast-long-handed-inserter"
data.raw.inserter["stack-inserter"].default_import_location = "selene"

data.raw.cliff["cliff-selene"].order = "c"
data.raw.cliff["cliff-vulcanus"].order = "d"
data.raw.cliff["cliff-gleba"].order = "e"
data.raw.cliff["cliff-fulgora"].order = "f"
data.raw.cliff["cliff-mefitis"].order = "g"
data.raw.cliff["cliff-aiolos"].order = "h"
data.raw.cliff["cliff-feronia"].order = "i"
data.raw.cliff["selene-crater-cliff"].order = "j"
data.raw.cliff["crater-cliff"].order = "k"

data.raw["space-platform-starter-pack"]["space-platform-starter-pack"].subgroup = "space-platform"
data.raw["space-platform-starter-pack"]["space-platform-starter-pack"].order = "a"
data.raw["space-platform-hub"]["space-platform-hub"].subgroup = "planets"
data.raw["space-platform-hub"]["space-platform-hub"].order = "z"

--Flamethrower
data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids = { {type = "crude-oil"},  {type = "heavy-oil", damage_modifier = 1.05}, {type = "light-oil", damage_modifier = 1.1}, {type = "ethanol", damage_modifier = 1.1} }
data.raw.item["flamethrower-turret"].order = "b[turret]-b[flamethrower-turret]"
data.raw.item["laser-turret"].order = "b[turret]-c[laser-turret]"

--Pressure fix
data.raw.recipe["metallurgic-science-pack"].surface_conditions = { { property = "pressure", min = 2000, max = 2000 } }


data.raw.recipe["iron-bacteria-cultivation"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.recipe["copper-bacteria-cultivation"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.recipe["pentapod-egg"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.item["pentapod-egg"].subgroup = "agriculture-processes"
data.raw.item["pentapod-egg"].order = "f[pentapod-egg]"
data.raw.recipe["agricultural-science-pack"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }

--Decal gathering fix
data.raw["simple-entity"]["huge-volcanic-rock"].minable =
{
  mining_particle = "stone-particle",
  mining_time = 3,
  results =
  {
	{type = "item", name = "iron-ore", amount_min = 9, amount_max = 27},
	{type = "item", name = "copper-ore", amount_min = 6, amount_max = 18},
	{type = "item", name = "tungsten-ore", amount_min = 5, amount_max = 15},
	{type = "item", name = "nickel-ore", amount_min = 4, amount_max = 12},
	{type = "item", name = "lead-ore", amount_min = 3, amount_max = 9},
	{type = "item", name = "stone", amount_min = 3, amount_max = 30},
  },
}

data.raw["simple-entity"]["big-volcanic-rock"].minable =
{
  mining_particle = "stone-particle",
  mining_time = 2,
  results =
  {
	{type = "item", name = "iron-ore", amount_min = 5, amount_max = 10},
	{type = "item", name = "copper-ore", amount_min = 4, amount_max = 8},
	{type = "item", name = "tungsten-ore", amount_min = 3, amount_max = 6},
	{type = "item", name = "nickel-ore", amount_min = 2, amount_max = 4},
	{type = "item", name = "lead-ore", amount_min = 1, amount_max = 2},
	{type = "item", name = "stone", amount_min = 3, amount_max = 12},
  }
}

--Equipment fix
data.raw["night-vision-equipment"]["night-vision-equipment"].shape = { width = 1, height = 1, type = "full"  }

--disable
data.raw.recipe["lubricant"].hide_from_player_crafting = true
data.raw.recipe["ice-melting"].hide_from_player_crafting = true

data.raw.item["stone-furnace"].hidden = true
data.raw.item["stone-furnace"].subgroup = "other"
data.raw.recipe["stone-furnace"].hidden = true
data.raw.recipe["stone-furnace"].subgroup = "other"
data.raw.furnace["stone-furnace"].hidden = true
data.raw.furnace["stone-furnace"].next_upgrade = nil
data.raw.furnace["stone-furnace"].subgroup = "other"
data.raw.furnace["stone-furnace"].order = "z[stone-furnace]"

data.raw.item["steel-furnace"].hidden = true
data.raw.item["steel-furnace"].subgroup = "other"
data.raw.recipe["steel-furnace"].hidden = true
data.raw.recipe["steel-furnace"].subgroup = "other"
data.raw.furnace["steel-furnace"].hidden = true
data.raw.furnace["steel-furnace"].next_upgrade = nil
data.raw.furnace["steel-furnace"].subgroup = "other"
data.raw.furnace["steel-furnace"].order = "z[steel-furnace]"

data.raw.item["electric-furnace"].hidden = true
data.raw.item["electric-furnace"].subgroup = "other"
data.raw.recipe["electric-furnace"].hidden = true
data.raw.recipe["electric-furnace"].subgroup = "other"
data.raw.furnace["electric-furnace"].hidden = true
data.raw.furnace["electric-furnace"].subgroup = "other"
data.raw.furnace["electric-furnace"].order = "z[electric-furnace]"

data.raw.recipe["carbon"].hidden = true
data.raw.recipe["solid-fuel-from-petroleum-gas"].hidden = true

data.raw.recipe["nutrients-from-yumako-mash"].hidden = true
data.raw.recipe["coal-synthesis"].hidden = true
data.raw.recipe["solid-fuel-from-heavy-oil"].hidden = true
data.raw.recipe["solid-fuel-from-light-oil"].hidden = true

data.raw.recipe["casting-low-density-structure"].hidden = true

data.raw["combat-robot"]["defender"].time_to_live = 60 * 180
data.raw["combat-robot"]["distractor"].time_to_live = 60 * 240
data.raw["combat-robot"]["destroyer"].time_to_live = 60 * 300

--Barrels

local function get_item(name)
  for typeName in pairs(defines.prototypes.item) do
    local items = data.raw[typeName]
    if items and items[name] then
      return items[name]
    end
  end
  return
end

-- This auto-generates barrel items and fill/empty recipes for every fluid defined that doesn't have "auto_barrel = false".

-- The technology the barrel unlocks will be added to
local technology_name = "fluid-handling"
-- The base empty barrel item
local empty_barrel_name = "barrel"

-- Item icon masks
local barrel_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-side-mask.png"
local barrel_hoop_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-hoop-top-mask.png"

-- Recipe icon masks
local barrel_empty_icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png"
local barrel_empty_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png"
local barrel_empty_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png"
local barrel_fill_icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png"
local barrel_fill_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png"
local barrel_fill_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png"

-- Alpha used for barrel masks
local side_alpha = 0.75
local top_hoop_alpha = 0.75
-- Fluid required per barrel recipe
local fluid_per_barrel = 50
-- Crafting energy per barrel fill recipe
local energy_per_fill = 0.2
-- Crafting energy per barrel empty recipe
local energy_per_empty = 0.2

local function get_technology(name)
  local technologies = data.raw["technology"]
  if technologies then
    return technologies[name]
  end
  return nil
end

local function get_recipes_for_barrel(name)
  local recipes = data.raw["recipe"]
  if recipes then
    return recipes[name], recipes["empty-" .. name]
  end
  return nil
end

local function generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
  return
  {
    {
      icon = base_icon.icon or base_icon,
      icon_size = base_icon.icon_size or defines.default_icon_size,
    },
    {
      icon = side_mask,
      icon_size = defines.default_icon_size, -- these need to be explicit, because of "global" icon_size might be different
      tint = util.get_color_with_alpha(fluid.base_color, side_alpha, true)
    },
    {
      icon = top_mask,
      icon_size = defines.default_icon_size, -- these need to be explicit, because of "global" icon_size might be different
      tint = util.get_color_with_alpha(fluid.flow_color, top_hoop_alpha, true)
    }
  }
end

-- Generates a barrel item with the provided name and fluid definition using the provided empty barrel stack size
local function create_barrel_item(name, fluid, empty_barrel_item)

  local result =
  {
    type = "item",
    name = name,
    localised_name = {"item-name.filled-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    icons = generate_barrel_icons(fluid, empty_barrel_item, barrel_side_mask, barrel_hoop_top_mask),
    icon_size = empty_barrel_item.icon_size or defines.default_icon_size,
    subgroup = "barrel",
    order = fluid.order,
    weight = 10*kg,
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    stack_size = empty_barrel_item.stack_size,
    factoriopedia_alternative = "barrel"
  }

  if name == "fluoroketone-cold-barrel" then
    result.default_import_location = "aquilo"
  end

  data:extend({result})
  return result
end

local function get_or_create_barrel_item(name, fluid, empty_barrel_item)
  local existing_item = get_item(name)
  if existing_item then
    return existing_item
  end

  return create_barrel_item(name, fluid, empty_barrel_item)
end

local function generate_barrel_recipe_icons(fluid, base_icon, side_mask, top_mask, fluid_icon_shift)
  local icons = generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
  if fluid.icon then
    table.insert(icons,
    {
      icon = fluid.icon,
      icon_size = (fluid.icon_size or defines.default_icon_size),
      scale = 16.0 / (fluid.icon_size or defines.default_icon_size), -- scale = 0.5 * 32 / icon_size simplified
      shift = fluid_icon_shift
    }
    )
  elseif fluid.icons then
    icons = util.combine_icons(icons, fluid.icons, {scale = 0.5, shift = fluid_icon_shift}, fluid.icon_size)
  end

  return icons
end

-- Creates a recipe to fill the provided barrel item with the provided fluid
local function create_fill_barrel_recipe(item, fluid)
  local recipe_name = item.name
  local recipe =
  {
    type = "recipe",
    name = recipe_name,
    localised_name = {"recipe-name.fill-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_fill,
    subgroup = "fill-barrel",
    order = fluid.order,
    enabled = false,
    icons = generate_barrel_recipe_icons(fluid, barrel_fill_icon, barrel_fill_side_mask, barrel_fill_top_mask, {-8, -8}),
    ingredients =
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel, ignored_by_stats = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1, ignored_by_stats = 1}
    },
    results =
    {
      {type = "item", name = item.name, amount = 1, ignored_by_stats = 1}
    },
    allow_quality = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
    factoriopedia_alternative = "barrel",
    hide_from_signal_gui = false
  }

  data:extend({recipe})
  return recipe
end

-- Creates a recipe to empty the provided full barrel item producing the provided fluid
local function create_empty_barrel_recipe(item, fluid)
  local recipe_name = "empty-" .. item.name
  local recipe =
  {
    type = "recipe",
    name = recipe_name,
    localised_name = {"recipe-name.empty-filled-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_empty,
    subgroup = "empty-barrel",
    order = fluid.order,
    enabled = false,
    icons = generate_barrel_recipe_icons(fluid, barrel_empty_icon, barrel_empty_side_mask, barrel_empty_top_mask, {7, 8}),
    ingredients =
    {
      {type = "item", name = item.name, amount = 1, ignored_by_stats = 1}
    },
    results =
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel, ignored_by_stats = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1, ignored_by_stats = 1}
    },
    allow_quality = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
    factoriopedia_alternative = "barrel",
    hide_from_signal_gui = false
  }

  data:extend({recipe})
  return recipe
end

local function get_or_create_barrel_recipes(item, fluid)
  local fill_recipe, empty_recipe = get_recipes_for_barrel(item.name)

  if not fill_recipe then
    fill_recipe = create_fill_barrel_recipe(item, fluid)
  end
  if not empty_recipe then
    empty_recipe = create_empty_barrel_recipe(item, fluid)
  end

  return fill_recipe, empty_recipe
end

-- Adds the provided barrel recipe and fill/empty recipes to the technology as recipe unlocks if they don't already exist
local function add_barrel_to_technology(fill_recipe, empty_recipe, technology)
  local unlock_key = "unlock-recipe"
  local effects = technology.effects

  if not effects then
    technology.effects = {}
    effects = technology.effects
  end

  local add_fill_recipe = true
  local add_empty_recipe = true

  for k,v in pairs(effects) do
    if k == unlock_key then
      local recipe = v.recipe
      if recipe == fill_recipe.name then
        add_fill_recipe = false
      elseif recipe == empty_recipe.name then
        add_empty_recipe = false
      end
    end
  end

  if add_fill_recipe then
    table.insert(effects, {type = unlock_key, recipe = fill_recipe.name})
  end
  if add_empty_recipe then
    table.insert(effects, {type = unlock_key, recipe = empty_recipe.name})
  end
end

local function log_barrel_error(string)
  log("Auto barrel generation is disabled: " .. string .. ".")
end

local function can_process_fluids(fluids, technology, empty_barrel_item)

  if not fluids then
    log_barrel_error("there are no fluids")
    return
  end

  if not technology then
    log_barrel_error("the " .. technology_name .. " technology doesn't exist")
    return
  end

  if not empty_barrel_item then
    log_barrel_error("the " .. empty_barrel_name .. " item doesn't exist")
    return
  end

  if not empty_barrel_item.icon then
    log_barrel_error("the " .. empty_barrel_name .. " item singular-icon definition doesn't exist")
    return
  end

  return true
end

local function process_fluid(fluid, technology, empty_barrel_item)

  -- Allow fluids to opt-out
  if fluid.auto_barrel == false then return end

  if not (fluid.icon or fluid.icons) then
    log("Can't make barrel recipe for "..fluid.name..", it doesn't have any icon or icons.")
    return
  end

  local barrel_name = fluid.name .. "-barrel"

  -- check if a barrel already exists for this fluid if not - create one
  local barrel_item = get_or_create_barrel_item(barrel_name, fluid, empty_barrel_item)

  -- check if the barrel has a recipe if not - create one
  local barrel_fill_recipe, barrel_empty_recipe = get_or_create_barrel_recipes(barrel_item, fluid)

  -- check if the barrel recipe exists in the unlock list of the technology if not - add it
  add_barrel_to_technology(barrel_fill_recipe, barrel_empty_recipe, technology)

end

local function process_fluids(fluids, technology, empty_barrel_item)

  if not can_process_fluids(fluids, technology, empty_barrel_item) then return end

  for name, fluid in pairs(fluids) do
    process_fluid(fluid, technology, empty_barrel_item)
  end

end

process_fluids(data.raw["fluid"], get_technology(technology_name), get_item(empty_barrel_name))