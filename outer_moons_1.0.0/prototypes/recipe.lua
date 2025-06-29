data:extend({
	--- Logistics
	-- Pipes
	{
		type = "recipe",
		name = "pipe",
		ingredients = {
			{type = "item", name = "lead-plate", amount = 2},
			--{type = "item", name = "iron-plate", amount = 1},
		},
		results = {{type="item", name="pipe", amount=2}},
		enabled = false
	},
	{
		type = "recipe",
		name = "pipe-to-ground",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "pipe", amount = 10},
		  {type = "item", name = "lead-plate", amount = 4},
		  --{type = "item", name = "iron-plate", amount = 1}
		},
		results = {{type="item", name="pipe-to-ground", amount=2}}
	},
	{
		type = "recipe",
		name = "pump",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 2},
		  {type = "item", name = "pipe", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 1},
		 -- {type = "item", name = "spark-plug", amount = 1},
		},
		results = {{type="item", name="pump", amount=1}}
	},
	{
		type = "recipe",
		name = "gas-vent",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 1},
		  {type = "item", name = "pipe", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 2}
		},
		results = {{type="item", name="gas-vent", amount=1}}
	},
	{
		type = "recipe",
		name = "flare-stack",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "spark-plug", amount = 1},
		  {type = "item", name = "pump", amount = 1},
		  {type = "item", name = "invar-plate", amount = 4},
		  {type = "item", name = "pipe", amount = 4}
		},
		results = {{type="item", name="flare-stack", amount=1}}
	},
	{
		type = "recipe",
		name = "small-storage-tank",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "pipe", amount = 2},
		  {type = "item", name = "lead-plate", amount = 8},
		  {type = "item", name = "steel-plate", amount = 4}
		},
		results = {{type="item", name="small-storage-tank", amount=1}}
	},
	{
		type = "recipe",
		name = "storage-tank",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "lead-plate", amount = 16},
		  {type = "item", name = "pipe", amount = 4},
		  {type = "item", name = "steel-plate", amount = 8}
		},
		results = {{type="item", name="storage-tank", amount=1}}
	},
	{
		type = "recipe",
		name = "large-storage-tank",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "lead-plate", amount = 24},
		  {type = "item", name = "pipe", amount = 8},
		  {type = "item", name = "steel-plate", amount = 12}
		},
		results = {{type="item", name="large-storage-tank", amount=1}}
	},
	-- Power
	{
		type = "recipe",
		name = "medium-electric-pole",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "iron-stick", amount = 4},
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "aluminum-cable", amount = 2}
		},
		results = {{type="item", name="medium-electric-pole", amount=1}}
	},
	{
		type = "recipe",
		name = "big-electric-pole",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "iron-stick", amount = 8},
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "aluminum-cable", amount = 4}
		},
		results = {{type="item", name="big-electric-pole", amount=1}}
	},
	{
		type = "recipe",
		name = "substation",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 10},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "fiber-optic", amount = 3},
		  {type = "item", name = "aluminum-cable", amount = 6}
		},
		results = {{type="item", name="substation", amount=1}}
	},
	-- Power production
	{
		type = "recipe",
		name = "fusion-reactor",
		category = "cryogenics",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 300,
			max = 300
		  }
		},
		energy_required = 60,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-plate", amount = 200},
		  {type = "item", name = "superconductor", amount = 200},
		  {type = "item", name = "quantum-supercomputer", amount = 250},
		},
		results = {{type="item", name="fusion-reactor", amount=1}},
		requester_paste_multiplier = 1,
		crafting_machine_tint =
		{
		  primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
		  secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
		  tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
		  quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
		}
	},
	{
		type = "recipe",
		name = "fusion-generator",
		category = "cryogenics",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 300,
			max = 300
		  }
		},
		energy_required = 30,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-plate", amount = 100},
		  {type = "item", name = "superconductor", amount = 100},
		  {type = "item", name = "quantum-supercomputer", amount = 50},
		},
		results = {{type="item", name="fusion-generator", amount=1}},
		requester_paste_multiplier = 1,
		crafting_machine_tint =
		{
		  primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
		  secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
		  tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
		  quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
		}
	},
	-- Bots
	{
		type = "recipe",
		name = "logistic-robot",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "flying-robot-frame", amount = 1},
		  {type = "item", name = "advanced-circuit", amount = 2},
		  --{type = "item", name = "duralumin-plate", amount = 1}
		  {type = "item", name = "titanium-plate", amount = 1}
		},
		results = {{type="item", name="logistic-robot", amount=1}}
	},
	{
		type = "recipe",
		name = "construction-robot",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "flying-robot-frame", amount = 1},
		  {type = "item", name = "advanced-circuit", amount = 2},
		  --{type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "titanium-plate", amount = 1},
		},
		results = {{type="item", name="construction-robot", amount=1}}
	},
	{
		type = "recipe",
		name = "passive-provider-chest",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "integrated-circuit", amount = 1}
		},
		results = {{type="item", name="passive-provider-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "active-provider-chest",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "advanced-circuit", amount = 1}
		},
		results = {{type="item", name="active-provider-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "storage-chest",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "integrated-circuit", amount = 1}
		},
		results = {{type="item", name="storage-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "buffer-chest",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "advanced-circuit", amount = 1}
		},
		results = {{type="item", name="buffer-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "requester-chest",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "advanced-circuit", amount = 1}
		},
		results = {{type="item", name="requester-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "roboport",
		category = "assembly-or-robotics",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 45},
		  {type = "item", name = "iron-gear-wheel", amount = 45},
		  {type = "item", name = "advanced-circuit", amount = 25}
		},
		results = {{type="item", name="roboport", amount=1}}
	},
	--
	{
		type = "recipe",
		name = "offshore-pump",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "pipe", amount = 3},
		  {type = "item", name = "iron-gear-wheel", amount = 2},
		  {type = "item", name = "electronic-circuit", amount = 1},
		},
		results = {{type="item", name="offshore-pump", amount=1}}
	},
	{
		type = "recipe",
		name = "pumpjack",
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "pump", amount = 1}
		},
		results = {{type="item", name="pumpjack", amount=1}},
		enabled = false
	},
	-- Trains
	{
		type = "recipe",
		name = "train-stop",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "nickel-plate", amount = 6},
		  {type = "item", name = "iron-stick", amount = 6},
		 -- {type = "item", name = "steel-plate", amount = 3}
		},
		results = {{type="item", name="train-stop", amount=1}}
	},
	{
		type = "recipe",
		name = "rail-signal",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 5}
		},
		results = {{type="item", name="rail-signal", amount=1}}
	},
	{
		type = "recipe",
		name = "rail-chain-signal",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 5}
		},
		results = {{type="item", name="rail-chain-signal", amount=1}}
	},
	{
		type = "recipe",
		name = "locomotive",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "multicylinder-engine-unit", amount = 8},
		  {type = "item", name = "electronic-circuit", amount = 10},
		  {type = "item", name = "steel-plate", amount = 30},
		  {type = "item", name = "iron-gear-wheel", amount = 20}
		},
		results = {{type="item", name="locomotive", amount=1}}
	},
	{
		type = "recipe",
		name = "artillery-wagon",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "multicylinder-engine-unit", amount = 24},
		  {type = "item", name = "iron-gear-wheel", amount = 40},
		  {type = "item", name = "tungsten-plate", amount = 60},
		  {type = "item", name = "refined-concrete", amount = 60},
		  {type = "item", name = "processing-unit", amount = 10}
		},
		results = {{type="item", name="artillery-wagon", amount=1}}
	},
	{
		type = "recipe",
		name = "cargo-wagon",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  --{type = "item", name = "iron-plate", amount = 20},
		  {type = "item", name = "steel-plate", amount = 24}
		},
		results = {{type="item", name="cargo-wagon", amount=1}}
	},
	
	--Concrete
	{
		type = "recipe",
		name = "concrete",
		energy_required = 10,
		enabled = false,
		auto_recycle = false,
		category = "crafting-with-fluid",
		ingredients =
		{
		  {type = "item", name = "stone-brick", amount = 5},
		  {type = "item", name = "silicon-ore", amount = 1},
		  {type = "fluid", name = "water", amount = 100}
		},
		results = {{type="item", name="concrete", amount=10}}
	},
	---Chemistry
	--Basic
	{
		type = "recipe",
		name = "basic-oil-processing",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "crude-oil", amount = 100}
		},
		results =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 90},
		  {type = "fluid", name = "sulfane", amount = 70}
		},
		allow_productivity = true,
		icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-a[basic-oil-processing]",
		main_product = ""
	},
	--Advanced
	{
		type = "recipe",
		name = "advanced-oil-processing",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "crude-oil", amount = 100}
		},
		results =
		{
		  {type = "fluid", name = "heavy-oil", amount = 35},
		  {type = "fluid", name = "light-oil", amount = 55},
		  {type = "fluid", name = "sulfane", amount = 65}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/advanced-oil-processing.png",
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-b[advanced-oil-processing]"
	},	
	{
		type = "recipe",
		name = "petroleum-gas-processing",
		icon = "__outer_moons__/graphics/icons/fluid/petroleum-gas-processing.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-a[petroleum-gas-processing]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "heavy-oil", amount = 20},
		  {type = "fluid", name = "light-oil", amount = 30}
		},
		results =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 50}
		},		
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.764, g = 0.596, b = 0.780, a = 1.000}, -- #c298c6ff
		  secondary = {r = 0.762, g = 0.551, b = 0.844, a = 1.000}, -- #c28cd7ff
		  tertiary = {r = 0.895, g = 0.773, b = 0.596, a = 1.000}, -- #e4c597ff
		  quaternary = {r = 1.000, g = 0.734, b = 0.290, a = 1.000}, -- #ffbb49ff
		}
	},
	{
		type = "recipe",
		name = "heavy-oil-cracking",
		category = "chemistry-or-cryogenics",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "heavy-oil", amount = 40}
		},
		results =
		{
		  {type = "fluid", name = "light-oil", amount = 35}
		},
		allow_productivity = true,
		main_product = "",
		icon = "__outer_moons__/graphics/icons/fluid/heavy-oil-cracking.png",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-b[heavy-oil-cracking]",
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
		  secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
		  tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
		  quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
		}
	},
	{
		type = "recipe",
		name = "light-oil-cracking",
		category = "chemistry-or-cryogenics",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "light-oil", amount = 30 },
		 -- {type = "item", name = "nickel-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "olefins", amount = 25 },
		},
		allow_productivity = true,
		main_product = "",
		icon = "__outer_moons__/graphics/icons/fluid/light-oil-cracking.png",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-c[light-oil-cracking]",
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}		
	},
	{
		type = "recipe",
		name = "olefins-reforming",
		icon = "__outer_moons__/graphics/icons/fluid/olefins-reforming.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-d[olefins-reforming]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50 },
		  {type = "fluid", name = "olefins", amount = 25 },
		  {type = "item", name = "nickel-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "aromatics", amount = 20 },
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	-- Natural Gas	
	{
		type = "recipe",
		name = "natural-gas-cracking",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "natural-gas", amount = 100},
		  {type = "fluid", name = "water", amount = 50},
		  --{type = "item", name = "silicon-ore", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "sulfane", amount = 40},
		  {type = "fluid", name = "methane", amount = 60},
		  {type = "fluid", name = "nitrogen", amount = 25}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/natural-gas-cracking.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-a[natural-gas-cracking]"
	},		
	-- Wood 
	{
		type = "recipe",
		name = "wood-gasification",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "item", name = "wood", amount = 10},
		  {type = "item", name = "nickel-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "hydrogen", amount = 30},
		  {type = "fluid", name = "carbon-monoxide", amount = 50},
		  {type = "fluid", name = "nitrogen", amount = 35}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/wood-gasification.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-b[wood-gasification]"
	},
	{
		type = "recipe",
		name = "carbon-gasification",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "item", name = "carbon", amount = 50},
		},
		results =
		{
		  {type = "fluid", name = "hydrogen", amount = 50},
		  {type = "fluid", name = "carbon-monoxide", amount = 50},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/carbon-gasification.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-d[carbon-gasification]"
	},
	{
		type = "recipe",
		name = "spoilage-gasification",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "item", name = "spoilage", amount = 40},
		  {type = "item", name = "lanthanum-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "carbon-dioxide", amount = 45},
		  {type = "fluid", name = "sulfane", amount = 40},
		  {type = "fluid", name = "ammonia", amount = 25}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/spoilage-gasification.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-d[spoilage-gasification]"
	},
	{
		type = "recipe",
		name = "methane-reforming",
		category = "chemistry-or-cryogenics",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "methane", amount = 35},
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "item", name = "nickel-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "carbon-monoxide", amount = 30},
		  {type = "fluid", name = "hydrogen", amount = 120}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/methane-reforming.png",
		
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-c[methane-reforming]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "methanol",
		category = "chemistry-or-cryogenics",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "carbon-monoxide", amount = 20},
		  {type = "fluid", name = "hydrogen", amount = 80},
		  {type = "item", name = "copper-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "methanol", amount = 20},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/methanol.png",
		
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-b[methanol]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "methanol-processing",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "methanol", amount = 30},
		  {type = "fluid", name = "steam", amount = 80},
		  {type = "item", name = "aluminum-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "heavy-oil", amount = 40},
		  {type = "fluid", name = "light-oil", amount = 30},
		  {type = "fluid", name = "olefins", amount = 25},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/methanol-processing.png",
		
		subgroup = "fluid-recipes",
		order = "z[methanol-processing]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "hydrogen-peroxide",
		category = "chemistry-or-cryogenics",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "hydrogen", amount = 15},
		  {type = "fluid", name = "oxygen", amount = 15},
		  {type = "item", name = "nickel-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "hydrogen-peroxide", amount = 15},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/hydrogen-peroxide.png",
		
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-z[hydrogen-peroxide]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.79, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.96, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.868, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.500, g = 0.500, b = 0.500, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "formaldehyde",
		category = "chemistry-or-cryogenics",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "methanol", amount = 20},
		  {type = "item", name = "iron-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "formaldehyde", amount = 20},
		  --{type = "fluid", name = "hydrogen", amount = 10},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/formaldehyde.png",
		main_product = "",
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-f[formaldehyde]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "phenol",
		category = "chemistry-or-cryogenics",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "aromatics", amount = 30},
		  {type = "fluid", name = "oxygen", amount = 15},
		  {type = "item", name = "iron-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "phenol", amount = 30},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/phenol.png",
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-g[phenol]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	-- Liquefaction
	{
		type = "recipe",
		name = "simple-coal-liquefaction",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "coal", amount = 10},
		  {type = "item", name = "calcite", amount = 2},
		  {type = "fluid", name = "sulfuric-acid", amount = 25},
		},
		results=
		{
		  {type="fluid", name="heavy-oil", amount=50}
		},
		allow_productivity = true,
		icon = "__space-age__/graphics/icons/fluid/simple-coal-liquefaction.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-c[coal-liquefaction]",
		allow_decomposition = false,
		show_amount_in_title = false
	},
	{
		type = "recipe",
		name = "coal-liquefaction",
		category = "oil-processing",
		enabled = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "coal", amount = 10},
		  {type = "item", name = "iron-plate", amount = 1},
		  {type = "fluid", name = "steam", amount = 50}
		},
		results =
		{
		  {type = "fluid", name = "carbon-monoxide", amount = 90},
		  {type = "fluid", name = "sulfane", amount = 55},
		  {type = "fluid", name = "nitrogen", amount = 20},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/coal-liquefaction.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-cd[coal-liquefaction]",
		allow_decomposition = false
	},
	
	-- Sulfur chemistry
	{
		type = "recipe",
		name = "sulfur",
		category = "chemistry-or-cryogenics",
        subgroup = "chemical",
		order = "a[sulfur]",
		icon = "__base__/graphics/icons/sulfur.png",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "sulfane", amount = 40},
		  {type = "item", name = "iron-plate", amount = 1}
		},
		results =
		{
		  {type = "fluid", name = "hydrogen", amount = 40},
		  {type = "item", name = "sulfur", amount = 4}
		},
		allow_productivity = true,
		main_product = "sulfur",
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
		  secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
		  tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
		  quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
		}
	},
	{
		type = "recipe",
		name = "sulfur-dioxide",
		category = "chemistry-or-cryogenics",
		subgroup = "sulfur-recipes",
		order = "c[sulfur]-a[sulfur-dioxide]",
		energy_required = 1,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "item", name = "sulfur", amount = 5},
		  {type = "fluid", name = "oxygen", amount = 50}
		},
		results =
		{
		  {type = "fluid", name = "sulfur-dioxide", amount = 50},
		},
		main_product = "sulfur-dioxide",
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.908, b = 0.000, a = 1.000}, -- #fff400ff
		  secondary = {r = 1.000, g = 0.802, b = 0.122, a = 1.000}, -- #ffd92bff
		  tertiary = {r = 0.816, g = 0.809, b = 0.547, a = 1.000}, -- #dfdd98ff
		  quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
		}
	},	
	{
		type = "recipe",
		name = "sulfane-oxygenation",
		category = "chemistry-or-cryogenics",
		subgroup = "phase-recipes",
		icon = "__outer_moons__/graphics/icons/fluid/sulfane-oxygenation.png",
		order = "c[sulfur]-a[sulfur-dioxide]",
		energy_required = 1,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "sulfane", amount = 50},
		  {type = "fluid", name = "oxygen", amount = 50}
		},
		results =
		{
		  {type = "fluid", name = "sulfur-dioxide", amount = 50},
		  {type = "fluid", name = "hydrogen", amount = 50 },
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.908, b = 0.000, a = 1.000}, -- #fff400ff
		  secondary = {r = 1.000, g = 0.802, b = 0.122, a = 1.000}, -- #ffd92bff
		  tertiary = {r = 0.816, g = 0.809, b = 0.547, a = 1.000}, -- #dfdd98ff
		  quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
		}
	},	
	{
		type = "recipe",
		name = "sulfuric-acid",
		category = "chemistry-or-cryogenics",
		subgroup = "sulfur-recipes",
		order = "c[sulfur]-b[sulfuric-acid]",
		energy_required = 1,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "sulfur-dioxide", amount = 50},
		  {type = "fluid", name = "water", amount = 50},
		  {type = "item", name = "iron-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "sulfuric-acid", amount = 50}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000}, -- #fff400ff
		  secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000}, -- #ffd92bff
		  tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000}, -- #dfdd98ff
		  quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
		}
	},
	-- Nitrogen chemistry
	{
		type = "recipe",
		name = "ammonia",
		icon = "__outer_moons__/graphics/icons/fluid/ammonia.png",
		category = "chemistry-or-cryogenics",
		subgroup = "nitrogen-recipes",
		order = "d[nitrogen]-a[ammonia]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "nitrogen", amount = 10 },
		  {type = "fluid", name = "hydrogen", amount = 30 },
		  {type = "item", name = "iron-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "ammonia", amount = 10 },
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "nitric-acid",
		icon = "__outer_moons__/graphics/icons/fluid/nitric-acid.png",
		category = "chemistry-or-cryogenics",
		subgroup = "nitrogen-recipes",
		order = "d[nitrogen]-b[nitric-acid]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "ammonia", amount = 15 },
		  {type = "fluid", name = "oxygen", amount = 30 },
		  {type = "item", name = "iron-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "nitric-acid", amount = 15 },
		  --{type = "fluid", name = "water", amount = 15 },
		},
		allow_productivity = true,
		main_product = "nitric-acid",
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	-- Chlorine chemistry
	{
		type = "recipe",
		name = "hydrochloric-acid",
		icon = "__outer_moons__/graphics/icons/fluid/hydrochloric-acid.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chlorine-recipes",
		order = "e[chlorine]-a[hydrochloric-acid]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "chlorine", amount = 10 },
		  {type = "fluid", name = "hydrogen", amount = 10 },
		  --{type = "item", name = "copper-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "hydrochloric-acid", amount = 20 },
		},
		allow_productivity = true,
		main_product = "hydrochloric-acid",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "vinyl-chloride",
		icon = "__outer_moons__/graphics/icons/fluid/vinyl-chloride.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chlorine-recipes",
		order = "e[chlorine]-b[vinyl-chloride]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 20 },
		  {type = "fluid", name = "hydrochloric-acid", amount = 10 },
		  {type = "item", name = "copper-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "vinyl-chloride", amount = 20 },
		},
		allow_productivity = true,
		main_product = "vinyl-chloride",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "chloroform",
		icon = "__outer_moons__/graphics/icons/fluid/chloroform.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chlorine-recipes",
		order = "e[chlorine]-c[chloroform]",
		energy_required = 4,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "methane", amount = 10},
		  {type = "fluid", name = "chlorine", amount = 30}
		},
		results =
		{
		  {type = "fluid", name = "chloroform", amount = 10},
		  {type = "fluid", name = "hydrochloric-acid", amount = 30},
		},
		allow_productivity = true,
		main_product = "chloroform",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	-- Fluorine recipes
	{
		type = "recipe",
		name = "hydrofluoric-acid",
		icon = "__outer_moons__/graphics/icons/fluid/hydrofluoric-acid.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluorine-recipes",
		order = "f[fluorine]-a[hydrofluoric-acid]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "fluorine", amount = 10 },
		  {type = "fluid", name = "hydrogen", amount = 10 },
		  --{type = "item", name = "copper-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "hydrofluoric-acid", amount = 20 },
		},
		allow_productivity = true,
		main_product = "hydrofluoric-acid",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "tetrafluoroethylene",
		icon = "__outer_moons__/graphics/icons/fluid/tetrafluoroethylene.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluorine-recipes",
		order = "f[fluorine]-c[tetrafluoroethylene]",
		energy_required = 4,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "fluoroform", amount = 20},
		},
		results =
		{
		  {type = "fluid", name = "tetrafluoroethylene", amount = 10},
		  {type = "fluid", name = "hydrofluoric-acid", amount = 20},
		},
		allow_productivity = true,
		main_product = "tetrafluoroethylene",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "fluoroform",
		icon = "__outer_moons__/graphics/icons/fluid/fluoroform.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluorine-recipes",
		order = "f[fluorine]-d[fluoroform]",
		energy_required = 4,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "chloroform", amount = 10},
		  {type = "fluid", name = "hydrofluoric-acid", amount = 30}
		},
		results =
		{
		  {type = "fluid", name = "fluoroform", amount = 10},
		  {type = "fluid", name = "hydrochloric-acid", amount = 30},
		},
		allow_productivity = true,
		main_product = "fluoroform",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	-- Chemical products
	{
		type = "recipe",
		name = "polyethlyene-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/polyethylene-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "a[polyethlyene-plastic]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 20 },
		  {type = "fluid", name = "hydrogen-peroxide", amount = 10 },
		  {type = "item", name = "aluminum-plate", amount = 1 }
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 2}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "polystyrene-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/polystyrene-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "b[polystyrene-plastic]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 10 },
		  {type = "fluid", name = "aromatics", amount = 10 },
		  {type = "item", name = "iron-plate", amount = 1 }
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 3}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "polyvinyl-chloride-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/polyvinyl-chloride-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "c[polyvinyl-chloride-plastic]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "vinyl-chloride", amount = 15 },
		  {type = "fluid", name = "hydrogen-peroxide", amount = 10 },
		  {type = "item", name = "magnesium-plate", amount = 1 }
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 4}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "phenolic-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/phenolic-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "d[phenolic-plastic]",
		energy_required = 2,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "phenol", amount = 25 },
		  {type = "fluid", name = "formaldehyde", amount = 25 },
		  {type = "item", name = "iridium-plate", amount = 1 },
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 6}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "coal-carbon-capture",
		icon = "__outer_moons__/graphics/icons/fluid/coal-carbon-capture.png",
		category = "chemistry",
		subgroup = "phase-recipes",
		order = "a[coal-carbon-capture]",
		energy_required = 1,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "item", name = "coal", amount = 10 },
		},
		results =
		{
		  {type = "fluid", name = "carbon-dioxide", amount = 20}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
		  secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
		  tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
		  quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
		}
	},
	{
		type = "recipe",
		name = "solid-fuel",
		category = "chemistry-or-cryogenics",
		subgroup = "chemical-product",
		order = "a",
		energy_required = 1,
		ingredients =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 10}
		},
		results =
		{
		  {type = "item", name = "solid-fuel", amount = 1}
		},
		allow_productivity = true,
		icon = "__base__/graphics/icons/solid-fuel-from-petroleum-gas.png",
		enabled = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
		  secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
		  tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
		  quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
		}
	},
	{
		type = "recipe",
		name = "niter",
		category = "chemistry-or-cryogenics",
        subgroup = "chemical",
		order = "b[niter]",
		crafting_machine_tint =
		{
		  primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
		  secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
		  tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
		  quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
		},
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "ammonia", amount = 5},
		  {type = "fluid", name = "nitric-acid", amount = 5},
		  {type = "item", name = "potassium-salt", amount = 2}
		},
		results = {{type="item", name="niter", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "explosives",
		category = "chemistry-or-cryogenics",
		crafting_machine_tint =
		{
		  primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
		  secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
		  tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
		  quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
		},
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "sulfur", amount = 1},
		  {type = "item", name = "coal", amount = 2},
		  {type = "item", name = "niter", amount = 10}
		},
		results = {{type="item", name="explosives", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "battery",
		category = "electronics-with-fluid",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "sulfuric-acid", amount = 20},
		  {type = "item", name = "lead-plate", amount = 2},
		},
		results = {{type="item", name="battery", amount=1}},
		crafting_machine_tint =
		{
		  primary = {r = 0.965, g = 0.482, b = 0.338, a = 1.000}, -- #f67a56ff
		  secondary = {r = 0.831, g = 0.560, b = 0.222, a = 1.000}, -- #d38e38ff
		  tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000}, -- #b9d070ff
		  quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}, -- #efc230ff
		},
		allow_productivity = true
	},
	-- Smelting
	{
		type = "recipe",
		name = "lead-plate",
		category = "smelting",
		auto_recycle = false,
		energy_required = 3.2,
		ingredients = {
			{type = "item", name = "lead-ore", amount = 1},
		},
		results = {{type="item", name="lead-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "nickel-plate",
		category = "smelting",
		auto_recycle = false,
		energy_required = 3.2,
		ingredients = {
			{type = "item", name = "nickel-ore", amount = 1},
		},
		results = {{type="item", name="nickel-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "silicon-wafer",
		icon = "__outer_moons__/graphics/icons/silicon-wafer.png",
		category = "electrolysis",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "silicon-ore", amount = 4},
			{type = "item", name = "carbon", amount = 4},
			{type = "fluid", name = "hydrochloric-acid", amount = 4},
		},
		results = {
			{type="item", name="silicon-wafer", amount=3},
			{type="fluid", name="carbon-dioxide", amount=4, ignored_by_productivity = 4 },
		},
		allow_productivity = true,
		main_product = "silicon-wafer"
	},
	{
		type = "recipe",
		name = "aluminum-plate",
		icon = "__outer_moons__/graphics/icons/aluminum-plate.png",
		category = "electrolysis",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "alumina", amount = 2},
			{type = "item", name = "carbon", amount = 3},
		},
		results = {
			{type="item", name="aluminum-plate", amount=4},
			{type="fluid", name="carbon-dioxide", amount=3, ignored_by_productivity = 3 },
		},
		allow_productivity = true,
		main_product = "aluminum-plate"
	},
	{
		type = "recipe",
		name = "titanium-plate",
		icon = "__outer_moons__/graphics/icons/titanium-plate.png",
		category = "electrolysis",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "titanium-ore", amount = 4},
			{type = "item", name = "carbon", amount = 4},
		},
		results = {
			{type="item", name="titanium-plate", amount=4},
			{type="fluid", name="carbon-dioxide", amount=4, ignored_by_productivity = 4 },
		},
		allow_productivity = true,
		main_product = "titanium-plate"
	},	
	{
		type = "recipe",
		name = "magnesium-plate",
		icon = "__outer_moons__/graphics/icons/magnesium-plate.png",
		category = "electrolysis",
		order = "e[magnesium-plate]",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "magnesium-ore", amount = 4},
			{type = "item", name = "carbon", amount = 2},
		},
		results = {
			{type="item", name="magnesium-plate", amount=4},
			{type="fluid", name="carbon-dioxide", amount=2, ignored_by_productivity = 2 },
			--{type="fluid", name="chlorine", amount=4},
		},
		allow_productivity = true,
		main_product = "magnesium-plate"
	},
	--Alloys
	{
		type = "recipe",
		name = "invar-plate",
		category = "alloying",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "iron-plate", amount = 6},
			{type = "item", name = "nickel-plate", amount = 4},
		},
		results = {{type="item", name="invar-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "steel-plate",
		category = "alloying",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "iron-plate", amount = 5},
			{type = "item", name = "nickel-plate", amount = 4},
			{type = "item", name = "copper-plate", amount = 1},
		},
		results = {{type="item", name="steel-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "steel-titanium-plate",
		icon = "__outer_moons__/graphics/icons/steel-titanium-plate.png",
		category = "alloying",
		subgroup = "selene-resources",
		order = "g",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "iron-plate", amount = 8},
			{type = "item", name = "titanium-plate", amount = 2},
		},
		results = {{type="item", name="steel-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "duralumin-plate",
		category = "alloying",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "aluminum-plate", amount = 7},
			{type = "item", name = "copper-plate", amount = 3},
		},
		results = {{type="item", name="duralumin-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "caelium-plate",
		category = "advanced-smelting",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "aluminum-plate", amount = 6},
			{type = "item", name = "titanium-plate", amount = 4},
		},
		results = {{type="item", name="caelium-plate", amount=5}},
		allow_productivity = true
	},	
	{
		type = "recipe",
		name = "magnalium-plate",
		category = "advanced-smelting",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "magnesium-plate", amount = 5},
			{type = "item", name = "aluminum-plate", amount = 5},
		},
		results = {{type="item", name="magnalium-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "selene-caelium-plate",
		icon = "__outer_moons__/graphics/icons/selene-caelium-plate.png",
		category = "advanced-smelting",
		subgroup = "selene-resources",
		order = "h",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "magnesium-plate", amount = 6},
			{type = "item", name = "titanium-plate", amount = 4},
		},
		results = {{type="item", name="caelium-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "mischmetal-plate",
		category = "advanced-smelting",
		enabled = false,
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "cerium-plate", amount = 6},
			{type = "item", name = "lanthanum-plate", amount = 3},
			{type = "item", name = "neodymium-plate", amount = 1},
		},
		results = {{type="item", name="mischmetal-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "magnesium-ore",
		icon = "__outer_moons__/graphics/icons/magnesium-ore.png",
		category = "electrolysis",
		subgroup = "selene-resources",
		order = "d[magnesium-ore]",
		auto_recycle = false,
		energy_required = 20,
		main_product = "magnesium-ore",
		ingredients =
		{
		  {type = "fluid", name = "brine", amount = 20},
		},
		results = {
			{type = "item", name = "magnesium-ore", amount = 5},
			{type = "fluid", name = "hydrogen", amount = 5},
			{type = "fluid", name = "chlorine", amount = 10},
		},
		allow_productivity = true,
		enabled = false,
	},
	{
		type = "recipe",
		name = "lithium",
		category = "electrolysis",
		subgroup = "aquilo-processes",
		order = "c[lithium]-a[lithium]",
		auto_recycle = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "fluid", name = "lithium-brine", amount = 50},
		  {type = "fluid", name = "ammonia", amount = 50}
		},
		results = {
			{type = "item", name = "lithium", amount = 5}
		},
		allow_productivity = true,
		enabled = false,
	},
	{
		type = "recipe",
		name = "lithium-plate",
		category = "smelting",
		subgroup = "aquilo-processes",
		order = "c[lithium]-b[lithium-plate]",
		auto_recycle = false,
		energy_required = 6.4,
		ingredients = {{type = "item", name = "lithium", amount = 1}},
		results = {{type="item", name="lithium-plate", amount=1}},
		allow_productivity = true,
		enabled = false
	},
	--Space
	{
		type = "recipe",
		name = "silicon-carbide",
		icon = "__outer_moons__/graphics/icons/silicon-carbide.png",
		category = "advanced-smelting",
		order = "a",
		enabled = false,
		auto_recycle = false,
		energy_required = 1,
		surface_conditions = {
			{
				property = "pressure",
				min = 0,
				max = 0
			}
		},
		ingredients = {
			{type = "item", name = "silicon-ore", amount = 1},
			{type = "item", name = "carbon", amount = 1},
		},
		results = {{type="item", name="silicon-carbide", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "space-ammo",
		icon = "__outer_moons__/graphics/icons/PDC-ammo.png",
		category = "advanced-crafting",
		subgroup = "space-rocket",
		order = "b",
		enabled = false,
		auto_recycle = false,
		energy_required = 1,
		surface_conditions = {
			{
				property = "pressure",
				min = 0,
				max = 0
			}
		},
		ingredients = {
			{type = "item", name = "silicon-carbide", amount = 1},
			{type = "item", name = "iron-plate", amount = 1},
		},
		results = {{type="item", name="firearm-magazine", amount=2}},
		allow_productivity = true
	},
	--Metal Chemistry
	{
		type = "recipe",
		name = "aluminate",
		icon = "__outer_moons__/graphics/icons/aluminate.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chemical",
		order = "c[aluminate]",
		auto_recycle = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "aluminum-ore", amount = 4 },
		  {type = "item", name = "lye", amount = 2 },
		},
		results =
		{
		  {type = "item", name = "aluminate", amount = 3},
		  {type = "fluid", name = "red-mud", amount = 2},
		},
		allow_productivity = true,
		enabled = false,
		main_product = "aluminate"
	},
	{
		type = "recipe",
		name = "alumina",
		icon = "__outer_moons__/graphics/icons/alumina.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chemical",
		order = "d[alumina]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "aluminate", amount = 1},
		  {type = "fluid", name = "water", amount = 10},
		},
		results =
		{
		  {type = "item", name = "alumina", amount = 1},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		show_amount_in_title = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	--Phase shift
	{
		type = "recipe",
		name = "dry-ice-sublimation",
		icon = "__outer_moons__/graphics/icons/fluid/dry-ice-sublimation.png",
		category = "chemistry",
		subgroup = "phase-recipes",
		order = "d[other-chemistry]-d[dry-ice-sublimation]",
		auto_recycle = false,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients = {{type = "item", name = "dry-ice", amount = 1}},
		energy_required = 1,
		results = {{type = "fluid", name = "carbon-dioxide", amount = 20}},
		allow_productivity = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.982, g = 1, b = 0.758, a = 1.000}, -- #6ec5ffff
		  secondary = {r = 1, g = 0.982, b = 0.758, a = 1.000}, -- #96daffff
		  tertiary = {r = 0.381, g = 0.428, b = 0.436, a = 0.502}, -- #616d6f80
		  quaternary = {r = 0.653, g = 0.726, b = 0.726, a = 0.733}, -- #7fcbcabb
		},
		show_amount_in_title = false
	},
	-- Products
	--{
	--	type = "recipe",
	--	name = "solder",
	--	category = "electronics-or-assembling",
	--	enabled = false,
	--	ingredients = {
	--		{type = "item", name = "lead-plate", amount = 1},
	--		{type = "item", name = "copper-plate", amount = 1},		
	--	},
	--	results = {{type="item", name="solder", amount=1}},
	--	allow_productivity = true
	--},
	{
		type = "recipe",
		name = "aluminum-cable",		
		category = "hand-assembly-electronics-quantum",
		enabled = false,
		ingredients = {{type = "item", name = "aluminum-plate", amount = 1}},
		results = {{type="item", name="aluminum-cable", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "fiber-optic",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients = {
			{type = "item", name = "plastic-bar", amount = 1},
			--{type = "item", name = "sulfur", amount = 1},
		},
		results = {{type="item", name="fiber-optic", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "cobalt-cable",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients = {{type = "item", name = "cobalt-plate", amount = 1}},
		results = {{type="item", name="cobalt-cable", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "spark-plug",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients = {
			{type = "item", name = "copper-cable", amount = 1},
			--{type = "item", name = "silicon-ore", amount = 1},
			{type = "item", name = "nickel-plate", amount = 1},
		},
		results = {{type="item", name="spark-plug", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "engine-unit",
		energy_required = 10,
		category = "assembly-or-robotics",
		ingredients =
		{
		  {type = "item", name = "invar-plate", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 1},
		  {type = "item", name = "pipe", amount = 2},
		  {type = "item", name = "spark-plug", amount = 1},
		},
		results = {{type="item", name="engine-unit", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "multicylinder-engine-unit",
		energy_required = 10,
		category = "assembly-or-robotics",
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 8},
		  {type = "item", name = "invar-plate", amount = 4},
		  --{type = "fluid", name = "lubricant", amount = 10},
		  {type = "item", name = "electronic-circuit", amount = 2},
		  {type = "item", name = "spark-plug", amount = 2},
		},
		results = {{type="item", name="multicylinder-engine-unit", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "electric-engine-unit",
		category = "fluid-assembly-or-robotics",
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "iron-stick", amount = 1},
		  {type = "item", name = "aluminum-cable", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 20},
		  {type = "item", name = "integrated-circuit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 2}
		},
		results = {{type="item", name="electric-engine-unit", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "flying-robot-frame",
		category = "assembly-or-robotics",
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "electric-engine-unit", amount = 1},
		  {type = "item", name = "battery", amount = 2},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  --{type = "item", name = "titanium-plate", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 2}
		},
		results = {{type="item", name="flying-robot-frame", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	-- Nuclear
	{
		type = "recipe",
		name = "uranium-processing",
		energy_required = 12,
		enabled = false,
		category = "centrifuging",
		ingredients = {{type = "item", name = "uranium-ore", amount = 10}},
		icon = "__base__/graphics/icons/uranium-processing.png",
		subgroup = "uranium-processing",
		order = "a[uranium-processing]-a[uranium-processing]",
		results =
		{
		  {
			type = "item",
			name = "uranium-235",
			probability = 0.007,
			amount = 1
		  },
		  {
			type = "item",
			name = "uranium-238",
			probability = 0.993,
			amount = 1
		  }
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
			primary = {r = 0, g = 1, b = 0, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "kovarex-enrichment-process",
		energy_required = 60,
		enabled = false,
		category = "centrifuging",
		icon = "__base__/graphics/icons/kovarex-enrichment-process.png",
		subgroup = "uranium-processing",
		order = "b[uranium-products]-c[kovarex-enrichment-process]",
		ingredients =
		{
		  {type = "item", name = "uranium-235", amount = 40, ignored_by_stats = 40},
		  {type = "item", name = "uranium-238", amount = 5, ignored_by_stats = 2}
		},
		results =
		{
		  {type = "item", name = "uranium-235", amount = 41, ignored_by_stats = 40, ignored_by_productivity = 40},
		  {type = "item", name = "uranium-238", amount = 2, ignored_by_stats = 2, ignored_by_productivity = 2}
		},
		main_product = "",
		allow_decomposition = false,
		allow_productivity = true,
		allow_quality = false,
		crafting_machine_tint =
		{
			primary = {r = 0, g = 1, b = 0, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "nuclear-fuel",
		energy_required = 90,
		enabled = false,
		category = "centrifuging",
		subgroup = "uranium-processing",
		order = "b[uranium-products]-d[nuclear-fuel]",
		ingredients = {{type = "item", name = "uranium-235", amount = 1}, {type = "item", name = "rocket-fuel", amount = 1}},
		results = {{type="item", name="nuclear-fuel", amount=1}},
		allow_productivity = true,
		crafting_machine_tint =
		{
			primary = {r = 0, g = 1, b = 0, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "nuclear-fuel-reprocessing",
		energy_required = 60,
		enabled = false,
		category = "centrifuging",
		ingredients = {{type = "item", name = "depleted-uranium-fuel-cell", amount = 5}},
		icon = "__base__/graphics/icons/nuclear-fuel-reprocessing.png",
		subgroup = "uranium-processing",
		order = "b[uranium-products]-b[nuclear-fuel-reprocessing]",
		main_product = "",
		results = {{type="item", name="uranium-238", amount=3}},
		allow_decomposition = false,
		allow_productivity = true,
		crafting_machine_tint =
		{
			primary = {r = 0, g = 1, b = 0, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "uranium-fuel-cell",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "lead-plate", amount = 10},
		  {type = "item", name = "uranium-235", amount = 1},
		  {type = "item", name = "uranium-238", amount = 9}
		},
		results = {{type="item", name="uranium-fuel-cell", amount=10}},
		subgroup = "uranium-processing",
		allow_productivity = true,
		crafting_machine_tint =
		{
			primary = {r = 0, g = 1, b = 0, a = 1.000},
		}
	},
	--Circuit parts
	{
		type = "recipe",
		name = "transistor",
		category = "electronics-or-assembling",
		ingredients =
		{
		  {type = "item", name = "silicon-wafer", amount = 1},
		  --{type = "item", name = "plastic-bar", amount = 1},
		  {type = "item", name = "copper-cable", amount = 3},
		},
		results = {{type="item", name="transistor", amount=4}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "capacitor",
		category = "electronics-or-assembling",
		ingredients =
		{	  
		  {type = "item", name = "plastic-bar", amount = 1},
		  {type = "item", name = "aluminum-cable", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 2},
		  {type = "item", name = "battery", amount = 2},
		},
		results = {{type="item", name="capacitor", amount=2}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "peripheral-interface",
		category = "electronics-or-assembling",
		ingredients =
		{	  
		  {type = "item", name = "plastic-bar", amount = 2},
		  {type = "item", name = "aluminum-cable", amount = 2},
		  {type = "item", name = "electronic-circuit", amount = 4},
		},
		results = {{type="item", name="peripheral-interface", amount=4}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "microprocessor",
		category = "electronics-or-assembling",
		ingredients =
		{	  
		  {type = "item", name = "plastic-bar", amount = 2},
		  {type = "item", name = "aluminum-plate", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 2},
		},
		results = {{type="item", name="microprocessor", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "memory-stick",
		category = "electronics-or-assembling",
		ingredients =
		{	  
		 -- {type = "item", name = "transistor", amount = 8},
		  {type = "item", name = "copper-plate", amount = 2},
		  {type = "item", name = "integrated-circuit", amount = 1},
		  {type = "item", name = "plastic-bar", amount = 1},
		},
		results = {{type="item", name="memory-stick", amount=2}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "storage-drive",
		category = "electronics-or-assembling",
		ingredients =
		{	  
		  {type = "item", name = "duralumin-plate", amount = 2},
		  --{type = "item", name = "copper-cable", amount = 2},
		  {type = "item", name = "electric-engine-unit", amount = 1},
		  {type = "item", name = "plastic-bar", amount = 1},
		},
		results = {{type="item", name="storage-drive", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "motherboard",
		category = "electronics-or-assembling",
		ingredients =
		{	  
		  {type = "item", name = "tungsten-carbide", amount = 8},
		  {type = "item", name = "carbon-fiber", amount = 4},
		  {type = "item", name = "superconductor", amount = 6},
		},
		results = {{type="item", name="motherboard", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "cooling-system",
		category = "electronics-or-assembling",
		ingredients =
		{	  
		  {type = "item", name = "plastic-bar", amount = 2},
		  {type = "item", name = "electric-engine-unit", amount = 1},
		  {type = "item", name = "magnesium-plate", amount = 1},
		},
		results = {{type="item", name="cooling-system", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	
	{
		type = "recipe",
		name = "osmium-superconductor",
		category = "electromagnetics",
		subgroup = "mefitis-processes",
		order = "d[osmium-superconductor]",
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "osmium-plate", amount = 1},
		  {type = "item", name = "aluminum-plate", amount = 1},
		  {type = "item", name = "plastic-bar", amount = 1},
		  {type = "item", name = "arsenene", amount = 5},
		},
		results = {{type = "item", name = "osmium-superconductor", amount = 2}},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "quantum-processor",
		category = "quantum",
		subgroup = "outer-processes",
		order = "c[quantum-processor]",
		energy_required = 30,
		ingredients =
		{
		  {type = "item", name = "indium-wafer", amount = 4},
		  {type = "item", name = "osmium-superconductor", amount = 8},
		  {type = "item", name = "graphene", amount = 12},
		  {type = "fluid", name = "hydroiodic-acid", amount = 10, ignored_by_stats = 5},
		  {type = "fluid", name = "fluoroketone-cold", amount = 20, ignored_by_stats = 5},
		},
		results = {
		  {type = "item", name = "quantum-processor", amount = 1},
		  {type = "fluid", name = "fluoroketone-hot", amount = 10, temperature = 180, ignored_by_stats = 5, ignored_by_productivity = 5}
		},
		allow_productivity = true,
		main_product = "quantum-processor",
		enabled = false,
	},
	{
		type = "recipe",
		name = "quantum-tube",
		category = "quantum",
		subgroup = "outer-processes",
		order = "d[quantum-tube]",
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "lithium-plate", amount = 2},
		  {type = "item", name = "cobalt-cable", amount = 4},
		  {type = "item", name = "nanotube", amount = 20},
		  {type = "fluid", name = "hydroiodic-acid", amount = 10, ignored_by_stats = 5},
		  {type = "fluid", name = "fluoroketone-cold", amount = 10, ignored_by_stats = 5},
		},
		results = {
		  {type = "item", name = "quantum-tube", amount = 1},
		  {type = "fluid", name = "fluoroketone-hot", amount = 5, temperature = 180, ignored_by_stats = 5, ignored_by_productivity = 5}
		},
		allow_productivity = true,
		main_product = "quantum-tube",
		enabled = false,
	},
	{
		type = "recipe",
		name = "altermagnet",
		category = "quantum",
		subgroup = "outer-processes",
		order = "e[altermagnet]",
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "neodymium-plate", amount = 4},
		  {type = "item", name = "aluminum-plate", amount = 2},
		  {type = "item", name = "nickel-plate", amount = 2},
		  {type = "item", name = "cobalt-cable", amount = 8},
		},
		results = {
		  {type = "item", name = "altermagnet", amount = 1},
		},
		allow_productivity = true,
		main_product = "altermagnet",
		enabled = false,
	},
	--Circuits
	{
		type = "recipe",
		name = "electronic-circuit",
		category = "hand-assembly-electronics-quantum",
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 1},
		  {type = "item", name = "copper-cable", amount = 3},
		  --{type = "item", name = "solder", amount = 1},
		  --{type = "item", name = "lead-plate", amount = 1},
		},
		results = {{type="item", name="electronic-circuit", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "integrated-circuit",
		category = "assembly-electronics-quantum",
		enabled = false,
		energy_required = 6,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 2},
		  {type = "item", name = "silicon-wafer", amount = 1},
		  {type = "item", name = "aluminum-cable", amount = 3},
		  {type = "item", name = "transistor", amount = 8},
		},
		results = {{type="item", name="integrated-circuit", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "advanced-circuit",
		category = "assembly-electronics-quantum",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 2},
		  {type = "item", name = "fiber-optic", amount = 4},
		  {type = "item", name = "peripheral-interface", amount = 4},
		  {type = "item", name = "capacitor", amount = 2}
		},
		results = {{type="item", name="advanced-circuit", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "processing-unit",
		category = "assembly-electronics-quantum",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 2},
		  {type = "item", name = "microprocessor", amount = 1},
		  {type = "item", name = "memory-stick", amount = 4},
		  {type = "item", name = "storage-drive", amount = 1},
		},
		results = {{type="item", name="processing-unit", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "computing-core",
		category = "electronics-quantum",
		enabled = false,
		energy_required = 35,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 2},
		  {type = "item", name = "motherboard", amount = 3},
		  {type = "item", name = "cooling-system", amount = 8},
		  {type = "item", name = "supercapacitor", amount = 4},
		},
		results = {{type="item", name="computing-core", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "quantum-supercomputer",
		category = "quantum",
		enabled = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "item", name = "computing-core", amount = 2},
		  {type = "item", name = "quantum-processor", amount = 10},
		  {type = "item", name = "quantum-tube", amount = 20},
		  {type = "item", name = "altermagnet", amount = 12},
		},
		results = {{type="item", name="quantum-supercomputer", amount=1}},
		allow_productivity = true
	},
	--Rocket parts
	{
		type = "recipe",
		name = "low-density-structure",
		category = "assembly-or-robotics",
        icon = "__outer_moons__/graphics/icons/duralumin-low-density-structure.png",
		energy_required = 15,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "duralumin-plate", amount = 5},
		  {type = "item", name = "plastic-bar", amount = 10}
		},
		results = {{type="item", name="low-density-structure", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "magnalium-low-density-structure",
		category = "assembly-or-robotics",
        icon = "__outer_moons__/graphics/icons/magnalium-low-density-structure.png",
		subgroup = "selene-resources",
		order = "j",
		energy_required = 15,
		enabled = false,
		auto_recycle = false,
		ingredients =
		{
		  {type = "item", name = "magnalium-plate", amount = 5},
		  {type = "item", name = "plastic-bar", amount = 10}
		},
		results = {{type="item", name="low-density-structure", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "rocket-part-new",
		energy_required = 3,
		enabled = false,
		category = "assembly-or-robotics",
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 1},
		  {type = "item", name = "low-density-structure", amount = 2},
		  {type = "item", name = "rocket-fuel", amount = 3}
		},
		results = {{type="item", name="rocket-part-new", amount=3}},
		allow_productivity = true
	},
	-- Space
	{
		type = "recipe",
		name = "rocket-silo",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "invar-plate", amount = 1000},
		  {type = "item", name = "concrete", amount = 1000},
		  {type = "item", name = "pipe", amount = 100},
		  {type = "item", name = "processing-unit", amount = 20},
		  {type = "item", name = "electric-engine-unit", amount = 200}
		},
		energy_required = 30,
		results = {{type="item", name="rocket-silo", amount=1}},
		requester_paste_multiplier = 1
	},
	{
		type = "recipe",
		name = "cargo-landing-pad",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "concrete", amount = 200},
		  {type = "item", name = "invar-plate", amount = 25},
		  {type = "item", name = "processing-unit", amount = 10}
		},
		energy_required = 30,
		results = {{type="item", name="cargo-landing-pad", amount=1}}
	},
	{
		type = "recipe",
		name = "space-platform-foundation",
		category = "assembly-or-robotics",
		energy_required = 10,
		enabled = false,
		category = "crafting",
		ingredients =
		{
		  {type = "item", name = "caelium-plate", amount = 20},
		  {type = "item", name = "lead-plate", amount = 10},
		  {type = "item", name = "fiber-optic", amount = 20},
		},
		results = {{type="item", name="space-platform-foundation", amount=2}}
	},
	{
		type = "recipe",
		name = "space-platform-starter-pack",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "space-platform-foundation", amount = 60},
		  {type = "item", name = "caelium-plate", amount = 20},
		  {type = "item", name = "processing-unit", amount = 20}
		},
		energy_required = 60,
		results = {{type="item", name="space-platform-starter-pack", amount=1}}
	},
	{
		type = "recipe",
		name = "cargo-bay",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "caelium-plate", amount = 20},
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 10,
		results = {{type="item", name="cargo-bay", amount=1}}
	},
	{
		type = "recipe",
		name = "asteroid-collector",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "electric-engine-unit", amount = 8},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 10,
		results = {{type="item", name="asteroid-collector", amount=1}}
	},
	{
		type = "recipe",
		name = "crusher",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "caelium-plate", amount = 10},
		  {type = "item", name = "electric-engine-unit", amount = 10}
		},
		energy_required = 10,
		results = {{type="item", name="crusher", amount=1}}
	},
	{
		type = "recipe",
		name = "thruster",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "caelium-plate", amount = 10},
		  {type = "item", name = "processing-unit", amount = 10},
		  {type = "item", name = "electric-engine-unit", amount = 5}
		},
		energy_required = 10,
		results = {{type="item", name="thruster", amount=1}}
	},
	{
		type = "recipe",
		name = "thruster-fuel",
		category = "chemistry",
		subgroup="space-processing",
		order = "a[thruster-fuel]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  --{type = "item", name = "carbon", amount = 2},
		  {type = "fluid", name = "hydrogen", amount = 20}
		},
		surface_conditions =
		{
		  {
			property = "gravity",
			min = 0,
			max = 0
		  }
		},
		energy_required = 2,
		results = {{type = "fluid", name = "thruster-fuel", amount = 75}},
		allow_productivity = true,
		show_amount_in_title = false,
		always_show_products = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.881, g = 0.100, b = 0.000, a = 0.502}, -- #e0190080
		  secondary = {r = 0.930, g = 0.767, b = 0.605, a = 0.502}, -- #edc39a80
		  tertiary = {r = 0.873, g = 0.649, b = 0.542, a = 0.502}, -- #dea58a80
		  quaternary = {r = 0.629, g = 0.174, b = 0.000, a = 0.502}, -- #a02c0080
		}
	},
	{
		type = "recipe",
		name = "thruster-oxidizer",
		category = "chemistry",
		subgroup="space-processing",
		order = "c[thruster-oxidizer]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  --{type = "item", name = "iron-ore", amount = 2},
		  {type = "fluid", name = "oxygen", amount = 10}
		},
		surface_conditions =
		{
		  {
			property = "gravity",
			min = 0,
			max = 0
		  }
		},
		energy_required = 2,
		results = {{type = "fluid", name = "thruster-oxidizer", amount = 75}},
		allow_productivity = true,
		show_amount_in_title = false,
		always_show_products = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.082, g = 0.396, b = 0.792, a = 0.502}, -- #1565ca80
		  secondary = {r = 0.161, g = 0.553, b = 0.796, a = 0.502}, -- #298dcb80
		  tertiary = {r = 0.059, g = 0.376, b = 0.545, a = 0.502}, -- #0f5f8a80
		  quaternary = {r = 0.683, g = 0.915, b = 1.000, a = 0.502}, -- #aee9ff80
		}
	},
	{
		type = "recipe",
		name = "tungsten-carbide",
		category = "advanced-smelting",
		subgroup = "vulcanus-processes",
		order = "c[tungsten]-b[tungsten-carbide]",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-ore", amount = 1},
		  {type = "item", name = "carbon", amount = 1}
		},
		energy_required = 1,
		results = {{type="item", name="tungsten-carbide", amount=1}},
		allow_productivity = true
	 },
	 {
		type = "recipe",
		name = "acid-neutralisation",
		icon = "__space-age__/graphics/icons/fluid/acid-neutralisation.png",
		category = "chemistry-or-cryogenics",
		subgroup = "phase-recipes",
		order = "d[other-chemistry]-a[acid-neutralisation]",
		auto_recycle = false,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "item", name = "calcite", amount = 1},
		  {type = "fluid", name = "sulfuric-acid", amount = 100},
		},
		energy_required = 5,
		results =
		{
		  {type = "fluid", name = "steam", amount = 200, temperature = 500}
		},
		allow_productivity = false,
		always_show_products = true,
		show_amount_in_title = false,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.912, b = 0.036, a = 1.000}, -- #ffe809ff
		  secondary = {r = 0.707, g = 0.797, b = 0.335, a = 1.000}, -- #b4cb55ff
		  tertiary = {r = 0.681, g = 0.635, b = 0.486, a = 1.000}, -- #ada17bff
		  quaternary = {r = 1.000, g = 0.804, b = 0.000, a = 1.000}, -- #ffcd00ff
		}
	},
	{
		type = "recipe",
		name = "steam-condensation",
		icon = "__space-age__/graphics/icons/fluid/steam-condensation.png",
		localised_name = {"recipe-name.steam-condensation"},
		category = "chemistry-or-cryogenics",
		subgroup = "phase-recipes",
		order = "d[other-chemistry]-b[steam-condensation]",
		auto_recycle = false,
		enabled = false,
		hide_from_player_crafting = true,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 500},
		},
		energy_required = 1,
		results =
		{
		  {type = "fluid", name = "water", amount = 100},
		},
		always_show_products = true,
		show_amount_in_title = false,
		allow_decomposition = false,
		allow_quality = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.409, g = 0.694, b = 0.895, a = 1.000}, -- #68b0e4ff
		  secondary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fffefeff
		  tertiary = {r = 0.540, g = 0.520, b = 0.520, a = 1.000}, -- #898484ff
		  quaternary = {r = 0.750, g = 0.750, b = 0.750, a = 1.000}, -- #bfbfbfff
		}
	},
	--Vulcanus fluids
	{
      type = "recipe",
      name = "volcanic-gas-separation",
      category = "oil-processing",
      icon = "__outer_moons__/graphics/icons/fluid/volcanic-gas-separation.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "fluid", name = "volcanic-gas", amount = 150, fluidbox_multiplier = 10},
        {type = "item", name = "calcite", amount = 1},
      },
      results =
      {
        {type = "fluid", name = "sulfur-dioxide", amount = 20},
        {type = "fluid", name = "steam", amount = 100},
        {type = "fluid", name = "carbon-dioxide", amount = 30},
      },
      subgroup = "separation-recipes",
      order = "a[separation]-a[volcanic-gas-separation]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.5, g = 0.4, b = 0.25, a = 1.000},
        secondary = {r = 0, g = 0, b = 0, a = 1.000},
        tertiary = {r = 0.75, g = 0.5, b = 0.25},
        quaternary = {r = 0.54, g = 0.48, b = 0.42}
      }
    },
	{
		type = "recipe",
		name = "molten-iron-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-iron-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "b[melting]-a[lava-a]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 2},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-iron", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-copper-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-copper-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "b[melting]-a[lava-b]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 2},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-copper", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-lead-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-lead-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "b[melting]-a[lava-c]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 2},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-lead", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-nickel-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-nickel-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "b[melting]-a[lava-d]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 2},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-nickel", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-aluminum-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-aluminum-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "b[melting]-a[lava-e]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 2},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-silicon-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-silicon-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "b[melting]-a[lava-e]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 2},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-silicon", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	
	
	{
		type = "recipe",
		name = "molten-lead",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "b[melting]-d[molten-lead]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "lead-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-lead", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-lead"
	},
	{
		type = "recipe",
		name = "molten-nickel",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "b[melting]-e[molten-nickel]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "nickel-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-nickel", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-nickel"
	},
	{
		type = "recipe",
		name = "molten-aluminum",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "b[melting]-f[molten-aluminum]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "alumina", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-aluminum"
	},
	{
		type = "recipe",
		name = "molten-silicon",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "b[melting]-g[molten-silicon]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "silicon-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-silicon", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-silicon"
	},
	{
		type = "recipe",
		name = "molten-titanium",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "b[melting]-h[molten-titanium]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "titanium-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-titanium", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-titanium"
	},
	{
		type = "recipe",
		name = "molten-magnesium",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "b[melting]-i[molten-magnesium]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "magnesium-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-magnesium", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-magnesium"
	},
	{
		type = "recipe",
		name = "molten-tungsten",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "b[melting]-j[molten-tungsten]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-tungsten", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-tungsten"
	},
	
	
	{
		type = "recipe",
		name = "casting-lead",
		category = "metallurgy",
		subgroup = "vulcanus-casting",
		order = "b[casting]-c[casting-lead]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-lead.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-lead", amount = 20, fluidbox_multiplier = 10},
		},
		energy_required = 3.2,
		allow_decomposition = false,
		results = {{type = "item", name = "lead-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-nickel",
		category = "metallurgy",
		subgroup = "vulcanus-casting",
		order = "b[casting]-d[casting-nickel]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-nickel.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-nickel", amount = 20, fluidbox_multiplier = 10},
		},
		energy_required = 3.2,
		allow_decomposition = false,
		results = {{type = "item", name = "nickel-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-aluminum",
		category = "metallurgy",
		subgroup = "vulcanus-casting",
		order = "b[casting]-e[casting-aluminum]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-aluminum.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 20, fluidbox_multiplier = 10},
		},
		energy_required = 3.2,
		allow_decomposition = false,
		results = {{type = "item", name = "aluminum-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-silicon",
		category = "metallurgy",
		subgroup = "vulcanus-casting",
		order = "b[casting]-f[casting-silicon]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-silicon.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-silicon", amount = 20, fluidbox_multiplier = 10},
		  --{type = "fluid", name = "hydrochloric-acid", amount = 8, fluidbox_multiplier = 10},
		},
		energy_required = 3.2,
		allow_decomposition = false,
		results = {{type = "item", name = "silicon-wafer", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-titanium",
		icon = "__outer_moons__/graphics/icons/fluid/casting-titanium.png",
		category = "metallurgy",
		subgroup = "vulcanus-casting",
		order = "b[casting]-g[casting-titanium]",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-titanium", amount = 20, fluidbox_multiplier = 10},
		},
		energy_required = 3.2,
		results = {{type="item", name="titanium-plate", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-magnesium",
		icon = "__outer_moons__/graphics/icons/fluid/casting-magnesium.png",
		category = "metallurgy",
		subgroup = "vulcanus-casting",
		order = "b[casting]-h[casting-magnesium]",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-magnesium", amount = 20, fluidbox_multiplier = 10},
		},
		energy_required = 3.2,
		results = {{type="item", name="magnesium-plate", amount=2}},
		allow_productivity = true
	},
	
	{
		type = "recipe",
		name = "tungsten-plate",
		category = "metallurgy",
		subgroup = "vulcanus-casting",
		order = "b[casting]-i[titanium-plate]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-tungsten.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-tungsten", amount = 20},
		},
		energy_required = 3.2,
		results = {{type="item", name="tungsten-plate", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-invar",
		category = "metallurgy",
		subgroup = "vulcanus-alloys",
		order = "c[casting]-a[casting-invar]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-invar.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-iron", amount = 12, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-nickel", amount = 8, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "invar-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-steel",
		category = "metallurgy",
		subgroup = "vulcanus-alloys",
		order = "c[casting]-b[casting-steel]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-steel.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-iron", amount = 20, fluidbox_multiplier = 10},
		  {type = "item", name = "carbon", amount = 1, fluidbox_multiplier = 10},
		  --{type = "fluid", name = "molten-tungsten", amount = 5, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "steel-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-duralumin",
		category = "metallurgy",
		subgroup = "vulcanus-alloys",
		order = "c[casting]-c[casting-duralumin]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-duralumin.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-copper", amount = 6, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-aluminum", amount = 14, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "duralumin-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-caelium",
		category = "metallurgy",
		subgroup = "vulcanus-alloys",
		order = "c[casting]-e[casting-caelium]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-caelium.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 16, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-titanium", amount = 4, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "caelium-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-magnalium",
		category = "metallurgy",
		subgroup = "vulcanus-alloys",
		order = "c[casting]-d[casting-magnalium]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-magnalium.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 10, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-magnesium", amount = 10, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "magnalium-plate", amount = 2}},
		allow_productivity = true
	},
	
	--
	{
		type = "recipe",
		name = "casting-pipe",
		category = "metallurgy",
		subgroup = "vulcanus-products",
		order = "d[casting]-f[casting-pipe]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-pipe.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-lead", amount = 20, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 10},
		},
		energy_required = 1,
		allow_decomposition = false,
		results = {{type = "item", name = "pipe", amount = 1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "casting-pipe-to-ground",
		category = "metallurgy",
		subgroup = "vulcanus-products",
		order = "d[casting]-g[casting-pipe-to-ground]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-pipe-to-ground.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-lead", amount = 40, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 10},
		  {type = "item", name = "pipe", amount = 10}
		},
		energy_required = 1,
		allow_decomposition = false,
		results = {{type = "item", name = "pipe-to-ground", amount = 2}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "casting-low-density-structure",
		category = "metallurgy",
		subgroup = "vulcanus-products",
		order = "d[casting]-j[low-density-structure]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-low-density-structure.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 100},
		  {type = "item", name = "plastic-bar", amount = 10},
		},
		energy_required = 15,
		allow_decomposition = false,
		auto_recycle = false,
		results = {{type = "item", name = "low-density-structure", amount = 1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "concrete-from-molten-iron",
		category = "metallurgy",
		subgroup = "vulcanus-products",
		order = "d[casting]-h[concrete]",
		icon = "__outer_moons__/graphics/icons/fluid/concrete-from-molten-silicon.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-silicon", amount = 20},
		  {type = "fluid", name = "water", amount = 100},
		  {type = "item", name = "stone-brick", amount = 5},
		},
		energy_required = 10,
		allow_decomposition = false,
		results = {{type = "item", name = "concrete", amount = 10}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "refined-concrete-from-molten-iron",
		category = "metallurgy",
		subgroup = "vulcanus-products",
		order = "d[casting]-i[refined-concrete]",
		icon = "__outer_moons__/graphics/icons/fluid/refined-concrete-from-molten-iron.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-iron", amount = 40},
		  {type = "fluid", name = "water", amount = 100},
		  {type = "item", name = "concrete", amount = 20},
		},
		energy_required = 16,
		allow_decomposition = false,
		results = {{type = "item", name = "refined-concrete", amount = 10}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-aluminum-cable",
		category = "metallurgy",
		subgroup = "vulcanus-products",
		order = "d[casting]-d[casting-aluminum-cable]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-aluminum-cable.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 5, fluidbox_multiplier = 5},
		},
		energy_required = 1,
		allow_decomposition = false,
		results = {{type = "item", name = "aluminum-cable", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-fiber-optic",
		category = "metallurgy",
		subgroup = "vulcanus-products",
		order = "d[casting]-e[casting-fiber-optic]",
		icon = "__outer_moons__/graphics/icons/fluid/casting-fiber-optic.png",
		enabled = false,
		hidden = true,
		ingredients =
		{
		  {type = "fluid", name = "molten-silicon", amount = 5, fluidbox_multiplier = 5},
		},
		energy_required = 1,
		allow_decomposition = false,
		results = {{type = "item", name = "fiber-optic", amount = 2}},
		allow_productivity = true
	},
	
	-- Fluid Electrolysis	
	{
		type = "recipe",
		name = "salt",
		icon = "__outer_moons__/graphics/icons/salt.png",
		category = "electrolysis",
		--subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-a[salt]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 100},
		},
		results =
		{
		  {type = "item", name = "salt", amount = 4},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "potassium-salt",
		icon = "__outer_moons__/graphics/icons/potassium-salt.png",
		category = "electrolysis",
		--subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-ab[potassium-salt]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 100},
		},
		results =
		{
		  {type = "item", name = "potassium-salt", amount = 1},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},	
	{
		type = "recipe",
		name = "water-electrolysis",
		icon = "__outer_moons__/graphics/icons/fluid/water-electrolysis.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-b[water-electrolysis]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 30,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 100},
		},
		results =
		{
		  {type = "fluid", name = "hydrogen", amount = 100},
		  {type = "fluid", name = "oxygen", amount = 50},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "chloralkali-process",
		icon = "__outer_moons__/graphics/icons/fluid/chloralkali-process.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-f[chloralkali-process]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 30,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 40},
		  {type = "item", name = "salt", amount = 10},
		},
		results =
		{
		  {type = "item", name = "lye", amount = 4},
		  {type = "fluid", name = "hydrogen", amount = 20},
		  {type = "fluid", name = "chlorine", amount = 20},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "red-mud-reprocessing",
		icon = "__outer_moons__/graphics/icons/red-mud-reprocessing.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-d[red-mud-reprocessing]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		hide_from_player_crafting = true,
		energy_required = 20,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 30},
		  {type = "fluid", name = "red-mud", amount = 16},
		},
		results =
		{
		  --{type = "item", name = "iron-ore", amount = 1, probability = 0.6, show_details_in_recipe_tooltip = false},
		  --{type = "item", name = "silicon-ore", amount = 1, probability = 0.5, show_details_in_recipe_tooltip = false},
		  --{type = "item", name = "alumina", amount = 1, probability = 0.33, show_details_in_recipe_tooltip = false},
		  --{type = "item", name = "titanium-ore", amount = 1},
		  {type = "item", name = "titanium-ore", amount = 1},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "brine-extraction",
		icon = "__outer_moons__/graphics/icons/fluid/brine-extraction.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-g[brine-extraction]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 30,
		--surface_conditions = {
		--	{
		--		property = "pressure",
		--		min = 150,
		--		max = 150
		--	}
		--},
		ingredients =
		{
		  {type = "fluid", name = "brine", amount = 50},
		},
		results =
		{
		  {type = "item", name = "magnesium-ore", amount = 5},
		  {type = "item", name = "calcite", amount = 2},
		  {type = "fluid", name = "water", amount = 35},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "carbon-dioxide-electrolysis",
		icon = "__outer_moons__/graphics/icons/fluid/carbon-dioxide-electrolysis.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-c[carbon-dioxide-electrolysis]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 30,
		ingredients =
		{
		  {type = "fluid", name = "carbon-dioxide", amount = 20},
		},
		results =
		{
		  {type = "item", name = "carbon", amount = 20},
		  {type = "fluid", name = "oxygen", amount = 20},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "carbon-methanation",
		icon = "__outer_moons__/graphics/icons/fluid/methanation.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-cd[carbon-dioxide-electrolysis]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 30,
		ingredients =
		{
		  {type = "item", name = "tungsten-carbide", amount = 1},
		  {type = "fluid", name = "carbon-dioxide", amount = 20},
		  {type = "fluid", name = "hydrogen", amount = 40},
		},
		results =
		{
		  {type = "fluid", name = "methane", amount = 20},
		  {type = "fluid", name = "oxygen", amount = 20},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "NaK-lubricant",
		icon = "__outer_moons__/graphics/icons/fluid/NaK-lubricant.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-h[NaK]",
		auto_recycle = false,
		hide_from_player_crafting = true,
		energy_required = 30,
		ingredients =
		{
		  {type = "item", name = "salt", amount = 10},
		  {type = "item", name = "potassium-salt", amount = 10},
		},
		results =
		{
		  {type = "fluid", name = "lubricant", amount = 10},
		  {type = "fluid", name = "chlorine", amount = 10},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	-- Stone
	{
		type = "recipe",
		name = "silica-extraction",
		icon = "__outer_moons__/graphics/icons/silica-extraction.png",
		category = "crafting-with-fluid",
		subgroup = "chemical",
		order = "k[alumina]",
		auto_recycle = false,
		energy_required = 4,
		--surface_conditions =
		--{
		-- {
		--	property = "pressure",
		--	min = 1000,
		--	max = 1000
		--  }
		--},
		ingredients = {
			{type = "item", name = "stone", amount = 50 },
			{type = "fluid", name = "sulfuric-acid", amount = 5},
		},
		results = {
			{type="item", name="silicon-ore", amount_min = 2, amount_max = 10 }
		},
		allow_productivity = false,
		enabled = false
	},
	-- Selene
	{
		type = "recipe",
		name = "amalgamate-regolith",
		icon = "__outer_moons__/graphics/icons/amalgamate-regolith.png",
		category = "electrolysis",
		subgroup = "selene-processes",
		order = "a[selene]-a[amalgamate-regolith]",
		auto_recycle = false,
		energy_required = 2,
		ingredients = {{type = "item", name = "metallic-regolith", amount = 10}},
		results = {
			{type="item", name="iron-ore", amount_min=1, amount_max=3, probability=0.5, show_details_in_recipe_tooltip = false},
			{type="item", name="silicon-ore", amount_min=1, amount_max=3, probability=0.4, show_details_in_recipe_tooltip = false},
			{type="item", name="copper-ore", amount_min=1, amount_max=3, probability=0.35, show_details_in_recipe_tooltip = false},
			{type="item", name="alumina", amount_min=1, amount_max=3, probability=0.3, show_details_in_recipe_tooltip = false},
			{type="item", name="magnesium-ore", amount_min=1, amount_max=3, probability=0.25, show_details_in_recipe_tooltip = false},
			{type="item", name="nickel-ore", amount_min=1, amount_max=3, probability=0.2, show_details_in_recipe_tooltip = false},
			{type="item", name="lead-ore", amount_min=1, amount_max=3, probability=0.15, show_details_in_recipe_tooltip = false},
			{type="item", name="sulfur", amount_min=1, amount_max=5, probability=0.1, show_details_in_recipe_tooltip = false},
			--{type="item", name="uranium-ore", amount=1, probability=0.05, show_details_in_recipe_tooltip = false}
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "regolith-stone",
		icon = "__outer_moons__/graphics/icons/regolith-stone.png",
		category = "crafting-with-fluid",
		subgroup = "selene-processes",
		order = "a[selene]-b[regolith-stone]",
		auto_recycle = false,
		energy_required = 1,
		ingredients = {
			{type = "item", name = "metallic-regolith", amount = 10},
			{type = "fluid", name = "water", amount = 50},
		},
		results = {
			{type="item", name="concrete", amount=10 }
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "regolith-uranium",
		icon = "__outer_moons__/graphics/icons/regolith-uranium.png",
		category = "advanced-crafting",
		subgroup = "selene-processes",
		order = "a[selene]-b[regolith-uranium]",
		auto_recycle = false,
		energy_required = 3,
		ingredients = {{type = "item", name = "metallic-regolith", amount = 20}},
		results = {
			{type="item", name="uranium-ore", amount_min=1, amount_max=5 }
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "solid-fuel-from-magnesium",
		icon = "__outer_moons__/graphics/icons/solid-fuel-from-magnesium.png",
		energy_required = 1,
		enabled = false,
		auto_recycle = false,
		category = "robotics",
		subgroup = "selene-processes",
		order = "b[selene]-h[solid-fuel-from-magnesium]",
		ingredients =
		{
		  {type = "item", name = "magnesium-plate", amount = 4}
		},
		results =
		{
		  {type = "item", name = "solid-fuel", amount = 1}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.222, g = 0.188, b = 0.344, a = 1.000}, -- #383057ff
		  secondary = {r = 0.394, g = 0.481, b = 0.594, a = 1.000}, -- #647a97ff
		  tertiary = {r = 0.370, g = 0.362, b = 0.362, a = 1.000}, -- #5e5c5cff
		  quaternary = {r = 0.192, g = 0.210, b = 0.308, a = 1.000}, -- #30354eff
		}
	},	
	{
		type = "recipe",
		name = "thermite-explosives",
		icon = "__outer_moons__/graphics/icons/thermite-explosives.png",
		category = "robotics",
		subgroup = "selene-processes",
		order = "b[selene]-g[thermite-explosives]",
		crafting_machine_tint =
		{
		  primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
		  secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
		  tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
		  quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
		},
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "dry-ice", amount = 2},
		  {type = "item", name = "aluminum-plate", amount = 4},
		  {type = "item", name = "magnesium-plate", amount = 6}
		},
		results = {{type="item", name="explosives", amount=3}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "cliff-explosives",
		--category = "",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "explosives", amount = 10},
		  {type = "item", name = "water-barrel", amount = 1},
		  {type = "item", name = "lye", amount = 8},		  
		},
		results = {{type="item", name="cliff-explosives", amount=1}}
	},
	{
		type = "recipe",
		name = "hydrogen-rocket-fuel",
		icon = "__outer_moons__/graphics/icons/hydrogen-rocket-fuel.png",
		energy_required = 5,
		enabled = false,
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-i[hydrogen-rocket-fuel]",
		ingredients =
		{
		  {type = "item", name = "solid-fuel", amount = 10},
		  {type="fluid", name = "hydrogen", amount= 30},
		},
		results = {{type="item", name="rocket-fuel", amount=2}},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.996, g = 0.742, b = 0.408, a = 1.000}, -- #febd68ff
		  secondary = {r = 0.446, g = 0.392, b = 0.168, a = 1.000}, -- #71632aff
		  tertiary = {r = 0.347, g = 0.388, b = 0.387, a = 1.000}, -- #586262ff
		  quaternary = {r = 0.656, g = 0.562, b = 0.264, a = 1.000}, -- #a78f43ff
		}
	},
	--structures
	{
		type = "recipe",
		name = "assembling-machine-2",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "iron-gear-wheel", amount = 5},
		  {type = "item", name = "assembling-machine-1", amount = 1}
		},
		results = {{type="item", name="assembling-machine-2", amount=1}}
	},
	{
		type = "recipe",
		name = "assembling-machine-3",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 4},
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "assembling-machine-2", amount = 1}
		},
		results = {{type="item", name="assembling-machine-3", amount=1}}
	},
	{
		type = "recipe",
		name = "stone-furnace-new",
		ingredients = {{type = "item", name = "stone", amount = 5}},
		results = {{type="item", name="stone-furnace-new", amount=1}}
	},
	{
		type = "recipe",
		name = "steel-furnace-new",
		ingredients = {{type = "item", name = "invar-plate", amount = 6}, {type = "item", name = "electronic-circuit", amount = 5}, {type = "item", name = "stone-brick", amount = 10}},
		results = {{type="item", name="steel-furnace-new", amount=1}},
		energy_required = 3,
		enabled = false
	},
	{
		type = "recipe",
		name = "electric-furnace-new",
		ingredients = {{type = "item", name = "invar-plate", amount = 10}, {type = "item", name = "integrated-circuit", amount = 5}, {type = "item", name = "concrete", amount = 10}},
		results = {{type="item", name="electric-furnace-new", amount=1}},
		energy_required = 5,
		enabled = false
	},
	{
		type = "recipe",
		name = "industrial-furnace",
		category = "assembly-or-robotics",
		ingredients = {{type = "item", name = "invar-plate", amount = 20}, {type = "item", name = "advanced-circuit", amount = 5}, {type = "item", name = "refined-concrete", amount = 10}},
		results = {{type="item", name="industrial-furnace", amount=1}},
		energy_required = 10,
		enabled = false
	},
	{
		type = "recipe",
		name = "boiler",
		enabled = false,
		ingredients = {{type = "item", name = "stone-furnace-new", amount = 1}, {type = "item", name = "pipe", amount = 4}},
		results = {{type="item", name="boiler", amount=1}}
	},
	{
		type = "recipe",
		name = "burner-mining-drill",
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "iron-gear-wheel", amount = 3},
		  {type = "item", name = "stone-furnace-new", amount = 1},
		  {type = "item", name = "iron-plate", amount = 3}
		},
		results = {{type="item", name="burner-mining-drill", amount=1}}
	},
	{
		type = "recipe",
		name = "big-mining-drill",
		category = "metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		energy_required = 30,
		ingredients =
		{
		  {type = "item", name = "electric-mining-drill", amount = 1},
		  {type = "fluid", name = "molten-iron", amount = 200},
		  {type = "item", name = "tungsten-carbide", amount = 20},
		  {type = "item", name = "electric-engine-unit", amount = 10},
		  {type = "item", name = "integrated-circuit", amount = 10},
		},
		results = {{type="item", name="big-mining-drill", amount=1}}
	},
	{
		type = "recipe",
		name = "beacon",
		category = "electronics-or-assembling",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  --{type = "item", name = "processing-unit", amount = 20},
		  {type = "item", name = "advanced-circuit", amount = 15},
		  {type = "item", name = "aluminum-plate", amount = 10},
		  {type = "item", name = "fiber-optic", amount = 10}
		},
		results = {{type="item", name="beacon", amount=1}}
	},
	{
		type = "recipe",
		name = "solar-panel",
		category = "electronics",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 4},
		  {type = "item", name = "electronic-circuit", amount = 10},
		  {type = "item", name = "silicon-wafer", amount = 4}
		},
		results = {{type="item", name="solar-panel", amount=1}}
	},
	{
		type = "recipe",
		name = "centrifuge",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "concrete", amount = 100},
		  {type = "item", name = "steel-plate", amount = 50},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 100}
		},
		results = {{type="item", name="centrifuge", amount=1}},
		requester_paste_multiplier = 10
	},
	{
		type = "recipe",
		name = "solar-array",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "osmiridium-plate", amount = 4},
		  {type = "item", name = "integrated-circuit", amount = 10},
		  {type = "item", name = "indium-wafer", amount = 8}
		},
		results = {{type="item", name="solar-array", amount=1}}
	},
	{
		type = "recipe",
		name = "superaccumulator",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "osmiridium-plate", amount = 2},
		  {type = "item", name = "solid-state-battery", amount = 5}
		},
		results = {{type="item", name="superaccumulator", amount=1}}
	},
	{
		type = "recipe",
		name = "electric-boiler",
		energy_required = 3,
		enabled = false,
		ingredients = {
			{type = "item", name = "invar-plate", amount = 10}, 
			{type = "item", name = "copper-cable", amount = 20}, 
			{type = "item", name = "electronic-circuit", amount = 5}, 
			{type = "item", name = "pipe", amount = 10}
		},
		results = {{type="item", name="electric-boiler", amount=1}}
	},
	{
		type = "recipe",
		name = "nuclear-reactor",
		energy_required = 8,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "concrete", amount = 500},
		  {type = "item", name = "invar-plate", amount = 500},
		  {type = "item", name = "processing-unit", amount = 20},
		  {type = "item", name = "lead-plate", amount = 500}
		},
		results = {{type="item", name="nuclear-reactor", amount=1}},
		requester_paste_multiplier = 1
	},
	{
		type = "recipe",
		name = "heat-exchanger",
		energy_required = 3,
		enabled = false,
		ingredients = {{type = "item", name = "invar-plate", amount = 10}, {type = "item", name = "copper-plate", amount = 100}, {type = "item", name = "pipe", amount = 10}},
		results = {{type="item", name="heat-exchanger", amount=1}}
	},
	{
		type = "recipe",
		name = "heat-pipe",
		energy_required = 1,
		enabled = false,
		ingredients = {{type = "item", name = "invar-plate", amount = 10}, {type = "item", name = "copper-plate", amount = 20}},
		results = {{type="item", name="heat-pipe", amount=1}}
	},
	{
		type = "recipe",
		name = "steam-turbine",
		enabled = false,
		energy_required = 3,
		ingredients = {{type = "item", name = "iron-gear-wheel", amount = 30}, {type = "item", name = "nickel-plate", amount = 50}, {type = "item", name = "pipe", amount = 20}, {type = "item", name = "electric-engine-unit", amount = 10}},
		results = {{type="item", name="steam-turbine", amount=1}}
	},
	{
		type = "recipe",
		name = "heating-tower",
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "boiler", amount = 2},
		  {type = "item", name = "heat-pipe", amount = 5},
		  {type = "item", name = "concrete", amount = 20},
		},
		results = {{type="item", name="heating-tower", amount=1}},
		enabled = false
	},
	{
		type = "recipe",
		name = "biochamber",
		category = "organic-or-assembling",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "nutrients", amount = 5},
		  {type = "item", name = "pentapod-egg", amount = 1},
		  {type = "item", name = "iron-plate", amount = 20},
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "landfill", amount = 1}
		},
		results = {{type="item", name="biochamber", amount=1}},
		enabled = false
	},
	{
		type = "recipe",
		name = "agricultural-tower",
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 10},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "spoilage", amount = 20},
		  {type = "item", name = "landfill", amount = 1}
		},
		results = {{type="item", name="agricultural-tower", amount=1}},
		enabled = false
	},
	{
		type = "recipe",
		name = "electrolytic-plant",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "invar-plate", amount = 5},
		  {type = "item", name = "copper-cable", amount = 5},
		  {type = "item", name = "pipe", amount = 5}
		},
		results = {{type="item", name="electrolytic-plant", amount=1}}
	},
	{
		type = "recipe",
		name = "lightning-rod",
		category = "electronics",
		surface_conditions =
		{
		  {
			property = "magnetic-field",
			min = 99,
			max = 99
		  }
		},
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "aluminum-cable", amount = 12},
		  {type = "item", name = "steel-plate", amount = 8},
		  {type = "item", name = "stone-brick", amount = 4},
		},
		results = {{type="item", name="lightning-rod", amount=1}},
		enabled = false
	},
	{
		type = "recipe",
		name = "foundry",
		category = "metallurgy-or-assembling",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-carbide", amount = 50},
		  {type = "item", name = "invar-plate", amount = 50},
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "item", name = "refined-concrete", amount = 20},
		  {type = "fluid", name = "lubricant", amount = 20}
		},
		energy_required = 10,
		results = {{type="item", name="foundry", amount=1}}
	},
	{
		type = "recipe",
		name = "scrubber",
		category = "robotics",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 5000,
			max = 5000
		  }
		},
		energy_required = 30,
		ingredients =
		{
		  {type = "item", name = "filter", amount = 5},
		  {type = "item", name = "beryllium-plate", amount = 20},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "pipe", amount = 10}
		},
		results = {{type="item", name="scrubber", amount=1}},
		enabled = false
	},
	{
		type = "recipe",
		name = "wind-turbine",
		category = "robotics",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 5000,
			max = 5000
		  }
		},
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "electric-engine-unit", amount = 4},
		  {type = "item", name = "beryllium-plate", amount = 10},
		  {type = "item", name = "graphene", amount = 10},
		  {type = "item", name = "computing-core", amount = 1},
		},
		results = {{type="item", name="wind-turbine", amount=1}},
		enabled = false
	},
	{
		type = "recipe",
		name = "biochamber",
		category = "organic-or-assembling",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "nutrients", amount = 5},
		  {type = "item", name = "pentapod-egg", amount = 1},
		  {type = "item", name = "iron-plate", amount = 20},
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "item", name = "landfill", amount = 1}
		},
		results = {{type="item", name="biochamber", amount=1}},
		enabled = false
	},
	{
		type = "recipe",
		name = "megafoundry",
		category = "metallurgy-or-adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "foundry", amount = 1},
		  {type = "item", name = "tungsten-plate", amount = 15},
		  {type = "item", name = "superconductor", amount = 20},
		  {type = "item", name = "computing-core", amount = 30},
		  {type = "item", name = "carbon-fiber", amount = 10}
		},
		energy_required = 30,
		results = {{type="item", name="megafoundry", amount=1}}
	},
	{
		type = "recipe",
		name = "electrorefinery",
		icon = "__outer_moons__/graphics/icons/electrorefinery.png",
		category = "assembly-or-robotics",
		enabled = false,
		energy_required = 20,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 150,
			max = 150
		  }
		},
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "item", name = "magnesium-plate", amount = 50},
		  {type = "item", name = "aluminum-cable", amount = 20},
		  {type = "item", name = "electrolytic-plant", amount = 1}
		},
		results = {{type="item", name="electrorefinery", amount=1}}
	},
	{
		type = "recipe",
		name = "adv-assembling-machine",
		icon = "__outer_moons__/graphics/icons/adv-assembler.png",
		category = "assembly-or-robotics",
		enabled = false,
		energy_required = 20,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 150,
			max = 150
		  }
		},
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "item", name = "magnalium-plate", amount = 50},
		  {type = "item", name = "spark-plug", amount = 4},
		  {type = "item", name = "bulk-inserter", amount = 2}
		},
		results = {{type="item", name="adv-assembling-machine", amount=1}}
	},
	-- Science	
	{
		type = "recipe",
		name = "chemical-science-pack",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 24,
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 3},
		  {type = "item", name = "integrated-circuit", amount = 1},
		 -- {type = "item", name = "sulfur", amount = 5},
		  {type = "fluid", name = "petroleum-gas", amount = 10}
		},
		results = {{type="item", name="chemical-science-pack", amount=2}},
		crafting_machine_tint =
		{
		  primary = {r = 0.0, g = 0.8, b = 1.0, a = 1.000},
		  secondary = {r = 0.0, g = 0.8, b = 1.0, a = 1.000},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "production-science-pack",
		enabled = false,
		energy_required = 21,
		ingredients =
		{
		  {type = "item", name = "electric-furnace-new", amount = 1},
		  {type = "item", name = "productivity-module", amount = 1},
		  {type = "item", name = "rail", amount = 30}
		},
		results = {{type="item", name="production-science-pack", amount=3}},
		crafting_machine_tint =
		{
		  primary = {r = 0.8, g = 0.0, b = 1.0, a = 1.000},
		  secondary = {r = 0.8, g = 0.0, b = 1.0, a = 1.000},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "utility-science-pack",
		enabled = false,
		energy_required = 21,
		ingredients =
		{
		  {type = "item", name = "low-density-structure", amount = 3},
		  {type = "item", name = "advanced-circuit", amount = 1},
		  {type = "item", name = "flying-robot-frame", amount = 1}
		},
		results = {{type="item", name="utility-science-pack", amount=3}},
		crafting_machine_tint =
		{
		  primary = {r = 1.0, g = 0.8, b = 0.0, a = 1.000},
		  secondary = {r = 1.0, g = 0.8, b = 0.0, a = 1.000},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "space-science-pack",
		icon = "__base__/graphics/icons/space-science-pack.png",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 2},
		  {type = "item", name = "silicon-carbide", amount = 1},
		  {type = "item", name = "ice", amount = 1}
		},
		surface_conditions =
		{
		  {
			property = "gravity",
			min = 0,
			max = 0
		  }
		},
		energy_required = 15,
		results =
		{
		  {type = "item", name = "space-science-pack", amount = 5}
		},
		allow_productivity = true,
		main_product = "space-science-pack"
	},
	{
		type = "recipe",
		name = "lunar-science-pack",
		category = "robotics",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 150,
			max = 150
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "silicon-wafer", amount = 2},
		  {type = "item", name = "magnalium-plate", amount = 1},
		  {type = "item", name = "caelium-plate", amount = 1},
		  {type = "fluid", name = "oxygen", amount = 80},
		},
		energy_required = 10,
		results = {{type="item", name="lunar-science-pack", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "nuclear-science-pack",
		category = "centrifuging",
		--surface_conditions =
		--{
		--  {
		--	property = "pressure",
		--	min = 1000,
		--	max = 1000
		--  }
		--},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "uranium-238", amount = 2},
		  --{type = "item", name = "uranium-235", amount = 1},
		  {type = "item", name = "lead-plate", amount = 2},
		},
		energy_required = 10,
		results = {{type="item", name="nuclear-science-pack", amount=1}},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0, g = 1, b = 0, a = 1.000}, 
		}
	},
	{
		type = "recipe",
		name = "metallurgic-science-pack",
		category = "metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-carbide", amount = 1},
		  {type = "item", name = "tungsten-plate", amount = 2},
		  {type = "fluid", name = "molten-nickel", amount = 100},
		  {type = "fluid", name = "molten-aluminum", amount = 100},
		},
		energy_required = 10,
		results = {{type="item", name="metallurgic-science-pack", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "material-science-pack",
		category = "adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "osmiridium-plate", amount = 1},
		  {type = "item", name = "arsenene", amount = 2},
		  {type = "fluid", name = "perchlorate", amount = 10},
		},
		energy_required = 10,
		results = {{type="item", name="material-science-pack", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "cryogenic-science-pack",
		category = "cryogenics",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 300,
			max = 300
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "ice", amount = 3},
		  {type = "item", name = "lithium-plate", amount = 1},
		  {type = "fluid", name = "fluoroketone-cold", amount = 6, ignored_by_stats = 3}
		},
		energy_required = 15,
		results =
		{
		  {type = "item", name = "cryogenic-science-pack", amount = 1},
		  {type = "fluid", name = "fluoroketone-hot", amount = 3, ignored_by_stats = 3, ignored_by_productivity = 3}
		},
		main_product = "cryogenic-science-pack",
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.040, g = 0.186, b = 1.000, a = 1.000}, -- #0a2fffff
		  secondary = {r = 0.200, g = 0.400, b = 1.000, a = 1.000}, -- #3366ffff
		  tertiary = {r = 0.600, g = 0.651, b = 1.000, a = 1.000}, -- #99a6ffff
		  quaternary = {r = 0.100, g = 0.300, b = 0.500, a = 1.000}, -- #194c7fff
		}
	},
	{
		type = "recipe",
		name = "pneumatic-science-pack",
		category = "synthesis",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 5000,
			max = 5000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "graphene", amount = 1},
		  {type = "item", name = "nanotube", amount = 2},
		  {type = "item", name = "beryllium-plate", amount = 1},
		},
		energy_required = 10,
		results = {{type="item", name="pneumatic-science-pack", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "genetic-science-pack",
		category = "genetics",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 1200,
			max = 1200
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "cobalt-plate", amount = 2},
		  {type = "fluid", name = "adenine", amount = 10},
		  {type = "fluid", name = "thymine", amount = 10},
		  {type = "fluid", name = "guanine", amount = 10},
		  {type = "fluid", name = "cytosine", amount = 10},
		},
		energy_required = 10,
		results = {{type="item", name="genetic-science-pack", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "particle-science-pack",
		category = "particle-physics",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "proton-stream", amount = 2},
		  {type = "fluid", name = "neutron-stream", amount = 2},
		  {type = "fluid", name = "electron-stream", amount = 2},
		},
		energy_required = 10,
		results = {{type="item", name="particle-science-pack", amount=1}},
		allow_productivity = true
	},
	
	
	{
		type = "recipe",
		name = "promethium-science-pack",
		energy_required = 15,
		surface_conditions =
		{
		  {
			property = "gravity",
			min = 0,
			max = 0
		  }
		},
		enabled = false,
		allow_productivity = true,
		category = "synthesis",
		ingredients =
		{
		  {type = "item", name = "mischmetal-plate", amount = 10},
		  {type = "item", name = "thorium-232", amount = 1},
		  {type = "fluid", name = "fusion-plasma", amount = 10}
		},
		results = {{type="item", name="promethium-science-pack", amount=10}},
		crafting_machine_tint =
		{
		  primary = {r = 0, g = 0, b = 0.1, a = 1},
		  secondary = {r = 0, g = 0, b = 0.4, a = 1},
		  tertiary = {r = 0.1, g = 0.1, b = 0.4, a = 1},
		  quaternary = {r = 0, g = 0, b = 0.1, a = 1},
		}
	},
	-- Military
	
	{
		type = "recipe",
		name = "car",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "multicylinder-engine-unit", amount = 1},
		  {type = "item", name = "aluminum-plate", amount = 20},
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "steel-plate", amount = 5}
		},
		results = {{type="item", name="car", amount=1}}
	},
	{
		type = "recipe",
		name = "tank",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "multicylinder-engine-unit", amount = 8},
		  {type = "item", name = "steel-plate", amount = 50},
		  {type = "item", name = "iron-gear-wheel", amount = 15},
		  {type = "item", name = "advanced-circuit", amount = 10}
		},
		results = {{type="item", name="tank", amount=1}}
	},
	{
		type = "recipe",
		name = "spidertron",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "exoskeleton-equipment", amount = 4},
		  {type = "item", name = "fission-reactor-equipment", amount = 2},
		  {type = "item", name = "rocket-turret", amount = 1},
		  {type = "item", name = "computing-core", amount = 10},
		  {type = "item", name = "radar", amount = 2},
		  {type = "item", name = "electric-engine-unit", amount = 16},
		 -- {type = "item", name = "raw-fish", amount = 1}
		},
		results = {{type="item", name="spidertron", amount=1}}
	},
		
		
	{
		type = "recipe",
		name = "poison-capsule",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "electronic-circuit", amount = 2},
		  {type = "item", name = "coal", amount = 5},
		  {type = "item", name = "sulfur", amount = 5},
		},
		results = {{type="item", name="poison-capsule", amount=1}}
	},
	{
		type = "recipe",
		name = "slowdown-capsule",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "electronic-circuit", amount = 2},
		  {type = "item", name = "coal", amount = 5},
		  {type = "item", name = "salt", amount = 5},
		},
		results = {{type="item", name="slowdown-capsule", amount=1}}
	},
	
	
	{
		type = "recipe",
		name = "gun-turret",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "iron-gear-wheel", amount = 8},
		  {type = "item", name = "copper-plate", amount = 5},
		  {type = "item", name = "submachine-gun", amount = 1},
		  {type = "item", name = "iron-plate", amount = 10}
		},
		results = {{type="item", name="gun-turret", amount=1}}
	},
	
	{
		type = "recipe",
		name = "railgun",
		category = "cryogenics",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "iridium-plate", amount = 10},
		  {type = "item", name = "osmium-superconductor", amount = 10},
		  {type = "item", name = "computing-core", amount = 20},
		  {type = "item", name = "nanotube", amount = 30},
		},
		results = {{type="item", name="railgun", amount=1}},
		crafting_machine_tint =
		{
		  primary = {r = 0.504, g = 0.448, b = 0.321, a = 1.000}, -- #807251ff
		  secondary = {r = 0.312, g = 0.519, b = 0.601, a = 1.000}, -- #4f8499ff
		  tertiary = {r = 0.402, g = 0.558, b = 0.880, a = 1.000}, -- #668ee0ff
		  quaternary = {r = 0.246, g = 0.246, b = 0.246, a = 1.000}, -- #3e3e3eff
		}
	},
	{
		type = "recipe",
		name = "railgun-turret",
		category = "cryogenics",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "computing-core", amount = 50},
		  {type = "item", name = "iridium-plate", amount = 20},
		  {type = "item", name = "osmium-superconductor", amount = 40},
		  {type = "item", name = "railgun", amount = 1},
		},
		results = {{type="item", name="railgun-turret", amount=1}},
		crafting_machine_tint =
		{
		  primary = {r = 0.504, g = 0.448, b = 0.321, a = 1.000}, -- #807251ff
		  secondary = {r = 0.312, g = 0.519, b = 0.601, a = 1.000}, -- #4f8499ff
		  tertiary = {r = 0.402, g = 0.558, b = 0.880, a = 1.000}, -- #668ee0ff
		  quaternary = {r = 0.246, g = 0.246, b = 0.246, a = 1.000}, -- #3e3e3eff
		}
	},
	{
		type = "recipe",
		name = "railgun-ammo",
		enabled = false,
		energy_required = 25,
		ingredients =
		{
		  {type = "item", name = "iridium-plate", amount = 5},
		  --{type = "item", name = "cobalt-cable", amount = 10},
		  {type = "item", name = "aluminum-cable", amount = 10},
		  {type = "item", name = "explosives", amount = 2},
		},
		results = {{type="item", name="railgun-ammo", amount=1}}
	},
	
	{
		type = "recipe",
		name = "gun-turret",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "copper-plate", amount = 10},
		  {type = "item", name = "iron-plate", amount = 20},
		  {type = "item", name = "electronic-circuit", amount = 3},		  
		},
		results = {{type="item", name="gun-turret", amount=1}}
	},
	{
		type = "recipe",
		name = "laser-turret",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 20},
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "battery", amount = 12},
		  {type = "item", name = "aluminum-plate", amount = 6}
		},
		results = {{type="item", name="laser-turret", amount=1}}
	},
	{
		type = "recipe",
		name = "flamethrower-turret",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "invar-plate", amount = 20},
		  {type = "item", name = "spark-plug", amount = 2},
		  {type = "item", name = "pump", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 5}
		},
		results = {{type="item", name="flamethrower-turret", amount=1}}
	},
	
	{
		type = "recipe",
		name = "defender-capsule",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "piercing-rounds-magazine", amount = 3},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "flying-robot-frame", amount = 1},
		},
		results = {{type="item", name="defender-capsule", amount=1}}
	},
	{
		type = "recipe",
		name = "distractor-capsule",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "aluminum-plate", amount = 4},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "flying-robot-frame", amount = 1},
		},
		results = {{type="item", name="distractor-capsule", amount=1}}
	},
	{
		type = "recipe",
		name = "destroyer-capsule",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "aluminum-cable", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 1},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "flying-robot-frame", amount = 1},
		},
		results = {{type="item", name="destroyer-capsule", amount=1}}
	},
	
	
	{
		type = "recipe",
		name = "pistol",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "copper-plate", amount = 2},
		  {type = "item", name = "iron-gear-wheel", amount = 2},
		  {type = "item", name = "iron-plate", amount = 4}
		},
		results = {{type="item", name="pistol", amount=1}}
	},
	{
		type = "recipe",
		name = "combat-shotgun",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 15},
		  {type = "item", name = "iron-gear-wheel", amount = 5},
		  {type = "item", name = "copper-plate", amount = 10},
		  {type = "item", name = "plastic-bar", amount = 10}
		},
		results = {{type="item", name="combat-shotgun", amount=1}}
	},
	{
		type = "recipe",
		name = "flamethrower",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "spark-plug", amount = 2},
		},
		results = {{type="item", name="flamethrower", amount=1}}
	},
	
	{
		type = "recipe",
		name = "shotgun-shell",
		enabled = false,
		energy_required = 3,
		ingredients =
		{
		  {type = "item", name = "lead-plate", amount = 2},
		  {type = "item", name = "wood", amount = 1}
		},
		results = {{type="item", name="shotgun-shell", amount=1}}
	},
	{
		type = "recipe",
		name = "piercing-shotgun-shell",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "shotgun-shell", amount = 2},
		  {type = "item", name = "plastic-bar", amount = 5},
		  {type = "item", name = "steel-plate", amount = 2}
		},
		results = {{type="item", name="piercing-shotgun-shell", amount=1}}
	},
	{
		type = "recipe",
		name = "firearm-magazine",
		energy_required = 1,
		ingredients = {{type = "item", name = "lead-plate", amount = 4}},
		results = {{type="item", name="firearm-magazine", amount=1}}
	},
	
	{
		type = "recipe",
		name = "rocket",
		enabled = false,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "explosives", amount = 1},
		  {type = "item", name = "iron-plate", amount = 2},
		  {type = "item", name = "electronic-circuit", amount = 1},
		},
		results = {{type="item", name="rocket", amount=1}}
	},
	{
		type = "recipe",
		name = "explosive-rocket",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "rocket", amount = 1},
		  {type = "item", name = "explosives", amount = 2},
		  {type = "item", name = "integrated-circuit", amount = 2}
		},
		results = {{type="item", name="explosive-rocket", amount=1}}
	},
	{
		type = "recipe",
		name = "atomic-bomb",
		enabled = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "item", name = "explosives", amount = 10},
		  {type = "item", name = "uranium-235", amount = 30}
		},
		results = {{type="item", name="atomic-bomb", amount=1}}
	},
	
	--Armor	
	{
		type = "recipe",
		name = "light-armor",
		enabled = true,
		energy_required = 3,
		ingredients = {{type = "item", name = "iron-plate", amount = 40}},
		results = {{type="item", name="light-armor", amount=1}}
	},
	{
		type = "recipe",
		name = "heavy-armor",
		enabled = false,
		energy_required = 8,
		ingredients = {
			{type = "item", name = "nickel-plate", amount = 100}, 
			{type = "item", name = "steel-plate", amount = 50},
			{type = "item", name = "light-armor", amount = 1},
		},
		results = {{type="item", name="heavy-armor", amount=1}}
	},
	{
		type = "recipe",
		name = "modular-armor",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 30},
		  {type = "item", name = "plastic-bar", amount = 50},
		  {type = "item", name = "heavy-armor", amount = 1},
		},
		results = {{type="item", name="modular-armor", amount=1}}
	},
	{
		type = "recipe",
		name = "power-armor",
		enabled = false,
		energy_required = 20,
		ingredients = {
			{type = "item", name = "advanced-circuit", amount = 40}, 
			{type = "item", name = "electric-engine-unit", amount = 20}, 
			{type = "item", name = "titanium-plate", amount = 40},
		    {type = "item", name = "modular-armor", amount = 1},
		},
		results = {{type="item", name="power-armor", amount=1}},
		requester_paste_multiplier = 1
	},
	{
		type = "recipe",
		name = "power-armor-mk2",
		enabled = false,
		energy_required = 25,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 50},
		  {type = "item", name = "magnalium-plate", amount = 40},
		  {type = "item", name = "low-density-structure", amount = 30},
		  {type = "item", name = "power-armor", amount = 1},
		},
		results = {{type="item", name="power-armor-mk2", amount=1}},
		requester_paste_multiplier = 1
	},
    {
		type = "recipe",
		name = "mech-armor",
		enabled = false,
		energy_required = 60,
		ingredients =
		{
		  {type = "item", name = "power-armor-mk2", amount = 1},
		  {type = "item", name = "computing-core", amount = 60},
		  {type = "item", name = "tungsten-carbide", amount = 60},
		  {type = "item", name = "carbon-fiber", amount = 50},
		  {type = "item", name = "supercapacitor", amount = 50}
		},
		results = {{type="item", name="mech-armor", amount=1}}
	},
	--- Equipment
	
	{
		type = "recipe",
		name = "solar-panel-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "solar-panel", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 2},
		  {type = "item", name = "titanium-plate", amount = 5}
		},
		results = {{type="item", name="solar-panel-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "fission-reactor-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 50},
		  {type = "item", name = "titanium-plate", amount = 50},
		  {type = "item", name = "uranium-fuel-cell", amount = 5}
		},
		results = {{type="item", name="fission-reactor-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "fusion-reactor-equipment",
		enabled = false,
		energy_required = 30,
		ingredients =
		{
		  --{type = "item", name = "fission-reactor-equipment", amount = 1},
		  {type = "item", name = "fusion-power-cell", amount = 10},
		  {type = "item", name = "graphene", amount = 200},
		  {type = "item", name = "altermagnet", amount = 100},
		  {type = "item", name = "nanotube", amount = 150},
		  {type = "item", name = "quantum-supercomputer", amount = 50}
		},
		results = {{type="item", name="fusion-reactor-equipment", amount=1}},
		crafting_machine_tint =
		{
		  primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
		  secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
		  tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
		  quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
		}
	},
	{
		type = "recipe",
		name = "battery-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "battery", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "titanium-plate", amount = 10}
		},
		results = {{type="item", name="battery-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "battery-mk2-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "battery-equipment", amount = 5},
		  {type = "item", name = "integrated-circuit", amount = 10},
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "solid-state-battery", amount = 10},
		},
		results = {{type="item", name="battery-mk2-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "battery-mk3-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "battery-mk2-equipment", amount = 5},
		  {type = "item", name = "advanced-circuit", amount = 15},
		  {type = "item", name = "graphene", amount = 30},
		  {type = "item", name = "quantum-tube", amount = 20},
		},
		results = {{type="item", name="battery-mk3-equipment", amount=1}}
	},
	
	{
		type = "recipe",
		name = "night-vision-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "titanium-plate", amount = 10}
		},
		results = {{type="item", name="night-vision-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "belt-immunity-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "titanium-plate", amount = 10}
		},
		results = {{type="item", name="belt-immunity-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "exoskeleton-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 10},
		  {type = "item", name = "electric-engine-unit", amount = 30},
		  {type = "item", name = "titanium-plate", amount = 20}
		},
		results = {{type="item", name="exoskeleton-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "personal-roboport-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 10},
		  {type = "item", name = "iron-gear-wheel", amount = 40},
		  {type = "item", name = "titanium-plate", amount = 20},
		  {type = "item", name = "battery", amount = 45}
		},
		results = {{type="item", name="personal-roboport-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "personal-roboport-mk2-equipment",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "personal-roboport-equipment", amount = 5},
		  {type = "item", name = "processing-unit", amount = 20},
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "solid-state-battery", amount = 60}
		},
		results = {{type="item", name="personal-roboport-mk2-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "toolbelt-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 3},
		  {type = "item", name = "carbon-fiber", amount = 10}
		},
		results = {{type="item", name="toolbelt-equipment", amount=1}}
	},
	
	
	{
		type = "recipe",
		name = "energy-shield-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 1},
		  {type = "item", name = "titanium-plate", amount = 10}
		},
		results = {{type="item", name="energy-shield-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "energy-shield-mk2-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "energy-shield-equipment", amount = 10},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "graphene", amount = 5}
		},
		results = {{type="item", name="energy-shield-mk2-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "personal-laser-defense-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 20},
		  {type = "item", name = "titanium-plate", amount = 5},
		  {type = "item", name = "laser-turret", amount = 5}
		},
		results = {{type="item", name="personal-laser-defense-equipment", amount=1}}
	},
	{
		type = "recipe",
		name = "discharge-defense-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "titanium-plate", amount = 20},
		  {type = "item", name = "laser-turret", amount = 10}
		},
		results = {{type="item", name="discharge-defense-equipment", amount=1}}
	},
	
	
	---Gleba
	{
      type = "recipe",
      name = "funnelwood-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/funnelwood-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "funnelwood", amount = 2},
      },
      results =
      {
		{type = "item", name = "funneltrunk-seed", amount = 1, probability = 0.02},
        {type = "item", name = "funnelbranch", amount = 3},
      },
      subgroup = "agriculture-processes",
      order = "d[agriculture]-d[funnelwood-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },	
	{
      type = "recipe",
      name = "slipstack-polyp-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/slipstack-polyp-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "slipstack-polyp", amount = 5},
       -- {type = "fluid", name = "water", amount = 15, fluidbox_multiplier = 10},
      },
      results =
      {
		{type = "item", name = "slipstack-seed", amount = 1, probability = 0.02},
        --{type = "item", name = "calcite", amount = 3},
        {type = "fluid", name = "slipgoo", amount = 10},
      },
      subgroup = "agriculture-processes",
      order = "d[agriculture]-a[slipstack-polyp-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },	
	{
		type = "recipe",
		name = "yumako-processing",
		icon = "__space-age__/graphics/icons/yumako-processing.png",
		category = "organic-or-hand-crafting",
		subgroup = "agriculture-processes",
		order = "d[agriculture]-f[yumako-processing]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients = {{type = "item", name = "yumako", amount = 1}},
		results =
		{
		  {type = "item", name = "yumako-seed", amount = 1, probability = 0.02},
		  {type = "item", name = "yumako-mash", amount = 2}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.976, g = 0.006, b = 0.310, a = 1.000},
		  secondary = {r = 0.805, g = 0.701, b = 0.293, a = 1.000}
		}
	},
    {
      type = "recipe",
      name = "mawpouch-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/mawpouch-processing.png",
      enabled = false,
      energy_required = 6,
      ingredients =
      {
        {type = "item", name = "mawpouch", amount = 5},
        --{type = "fluid", name = "water", amount = 20, fluidbox_multiplier = 10},
      },
      results =
      {
		{type = "item", name = "lickmaw-seed", amount = 1, probability = 0.02},
       -- {type = "item", name = "calcite", amount = 3},
        {type = "fluid", name = "mawslush", amount = 15},
      },
      subgroup = "agriculture-processes",
      order = "d[agriculture]-e[mawpouch-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.16, b = 0.15, a = 1.000},
        secondary = {r = 0.75, g = 0.26, b = 0.25, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "frondstalk-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/frondstalk-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "frondstalk", amount = 3},
      },
      results =
      {
		{type = "item", name = "stingfrond-seed", amount = 1, probability = 0.02},
        {type = "item", name = "frondstrand", amount = 5},
      },
      subgroup = "agriculture-processes",
      order = "d[agriculture]-h[frondstalk-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "jellynut-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/cuttlepod-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "cuttlepod", amount = 2},
      },
      results =
      {
		{type = "item", name = "cuttlepop-seed", amount = 1, probability = 0.02},
        {type = "item", name = "jelly", amount = 3},
      },
      subgroup = "agriculture-processes",
      order = "d[agriculture]-c[jellynut-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.405, g = 0.701, b = 0.693, a = 1.000},
		secondary = {r = 0.876, g = 0.406, b = 0.710, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "boompuff-bulb-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/boompuff-bulb-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "boompuff-bulb", amount = 1},
      },
      results =
      {
		{type = "item", name = "boompuff-seed", amount = 1, probability = 0.02},
        {type = "item", name = "boompowder", amount = 5},
      },
      subgroup = "agriculture-processes",
      order = "d[agriculture]-g[boompuff-bulb-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "teflilly-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/teflilly-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "teflilly", amount = 1},
      },
      results =
      {
		{type = "item", name = "teflilly-seed", amount = 1, probability = 0.02},
        {type = "item", name = "tefpetal", amount = 6},
      },
      subgroup = "agriculture-processes",
      order = "d[agriculture]-b[teflilly-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },  
	{
      type = "recipe",
      name = "mawslush-chloroform",
      category = "organic",
      icon = "__outer_moons__/graphics/icons/mawslush-chloroform.png",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        {type = "fluid", name = "mawslush", amount = 15, fluidbox_multiplier = 10},
        {type = "item", name = "carbon", amount = 5},
      },
      results =
      {
        {type = "fluid", name = "chloroform", amount = 5},
      },
      subgroup = "agriculture-products",
      order = "a[organic-processing]-e[mawslush-chloroform]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.62, g = 0.11, b = 0.38, a = 1.000},
        secondary = {r = 0.72, g = 0.21, b = 0.48, a = 1.000}
      }
    },		
	{
      type = "recipe",
      name = "mawslush-crystallization",
      category = "organic",
      icon = "__outer_moons__/graphics/icons/mawslush-crystallization.png",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        {type = "fluid", name = "mawslush", amount = 10, fluidbox_multiplier = 10},
        {type = "item", name = "bioflux", amount = 1},
      },
      results =
      {
        {type = "item", name = "potassium-salt", amount = 2},
      },
      subgroup = "agriculture-intermediates",
      order = "e[mawslush-crystallization]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.62, g = 0.11, b = 0.38, a = 1.000},
        secondary = {r = 0.72, g = 0.21, b = 0.48, a = 1.000}
      }
    },	
    {
      type = "recipe",
      name = "glycerol-extraction",
      category = "organic",
      icon = "__outer_moons__/graphics/icons/glycerol-synthesis.png",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        --{type = "item", name = "yumako-mash", amount = 15},
        {type = "item", name = "bioflux", amount = 2},
        {type = "fluid", name = "mawslush", amount = 30, fluidbox_multiplier = 10},
      },
      results =
      {
        {type = "fluid", name = "glycerol", amount = 20},
      },
      subgroup = "bioflux-intermediates",
      order = "e[glycerol-extraction]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.62, g = 0.11, b = 0.38, a = 1.000},
        secondary = {r = 0.72, g = 0.21, b = 0.48, a = 1.000}
      }
    },	
    {
      type = "recipe",
      name = "bioslurry",
      category = "organic-or-chemistry",
      icon = "__outer_moons__/graphics/icons/fluid/gleba-bioslurry.png",
      enabled = false,
      energy_required = 12,
      ingredients =
	  {
        {type = "item", name = "jelly", amount = 10},
        {type = "item", name = "yumako-mash", amount = 5},
        {type = "fluid", name = "slipgoo", amount = 20, fluidbox_multiplier = 10},
        {type = "fluid", name = "mawslush", amount = 30, fluidbox_multiplier = 10},
	  },
      results =
      {
        {type = "fluid", name = "bioslurry", amount = 10},
      },
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.3, g = 0.9, b = 0.8, a = 1.000},
        secondary = {r = 0.8, g = 0.5, b = 0.3, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "bioflux",
      category = "organic-or-chemistry",
      icon = "__space-age__/graphics/icons/bioflux.png",
      enabled = false,
      energy_required = 8,
      ingredients =
	  {
        --{type = "item", name = "fertilizer", amount = 10},
        {type = "fluid", name = "water", amount = 10, fluidbox_multiplier = 10},
        {type = "fluid", name = "bioslurry", amount = 15, fluidbox_multiplier = 10},
	  },
      results =
      {
        {type = "item", name = "bioflux", amount = 4},
      },
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.3, g = 0.9, b = 0.8, a = 1.000},
        secondary = {r = 0.8, g = 0.5, b = 0.3, a = 1.000}
      }
    },
	{
      type = "recipe",
      name = "nitrocalcite",
      category = "organic-or-chemistry",
      icon = "__outer_moons__/graphics/icons/nitrocalcite.png",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        {type = "item", name = "spoilage", amount = 5},
        {type = "item", name = "stone", amount = 1},
      },
      results =
      {
        {type = "item", name = "nitrocalcite", amount = 2},
      },
      subgroup = "gleba-general",
      order = "e[nitrocalcite]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.4, g = 0.2, b = 0.4, a = 1.000},
        secondary = {r = 0.8, g = 0.4, b = 0.8, a = 1.000}
      }
    },
	{
		type = "recipe",
		name = "carbon-fiber",
		category = "organic",
		subgroup = "bioflux-intermediates",
		order = "h[carbon-fiber]",
		auto_recycle = false,
		energy_required = 5,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "carbon", amount = 10},
		  {type = "item", name = "frondstrand", amount = 5},
		  {type = "item", name = "plastic-bar", amount = 3},
		  {type = "item", name = "bioflux", amount = 1},
		},
		results = {{type="item", name="carbon-fiber", amount=1}},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.306, g = 0.643, b = 0.684, a = 1.000},
		  secondary = {r = 0.684, g = 0.684, b = 0.684, a = 1.000},
		},
	},
	{
		type = "recipe",
		name = "burnt-spoilage",
		icon = "__outer_moons__/graphics/icons/frondstrand-splitting.png",
		category = "organic",
		subgroup = "agriculture-intermediates",
		order = "h[burnt-spoilage]",
		auto_recycle = false,
		energy_required = 12,
		ingredients =
		{
		  {type = "item", name = "frondstrand", amount = 2}
		},
		results =
		{
		  {type = "item", name = "carbon", amount = 5}
		},
		allow_productivity = true,
		enabled = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.134, g = 0.009, b = 0.009, a = 1.000}, -- #220202ff
		  secondary = {r = 0.377, g = 0.255, b = 0.255, a = 1.000}, -- #604141ff
		}
	},
	{
		type = "recipe",
		name = "ethanol-synthesis",
		icon = "__outer_moons__/graphics/icons/fluid/ethanol-synthesis.png",
		category = "organic",
		subgroup = "bioflux-intermediates",
		order = "f[ethanol-synthesis]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "yumako-mash", amount = 10},
		  {type = "fluid", name = "water", amount = 20},
		  {type = "item", name =  "bioflux", amount = 1},
		},
		results = {{type="fluid", name="ethanol", amount=15}},
		crafting_machine_tint =
		{
		  primary = {r = 0.47, g = 0.68, b = 0.55, a = 1.000}, 
		  secondary = {r = 0.42, g = 0.63, b = 0.5, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "rocket-fuel-from-jelly",
		icon = "__outer_moons__/graphics/icons/biofuel.png",
		category = "organic",
		subgroup = "bioflux-intermediates",
		order = "c[biofuel]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "fluid", name = "ethanol", amount = 30},
		  {type = "item", name =  "boompowder", amount = 30},
		  {type = "item", name = "bioflux", amount = 2}
		},
		results = {{type="item", name="rocket-fuel", amount=1}},
		crafting_machine_tint =
		{
		  primary = {r = 0.728, g = 0.116, b = 0.116, a = 1.000}, -- #b91d1dff
		  secondary = {r = 0.3, g = 0.9, b = 0.3, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "biolubricant",
		icon = "__outer_moons__/graphics/icons/fluid/biolubricant.png",
		category = "organic",
		subgroup = "agriculture-products",
		order = "a[biolubricant]",
		auto_recycle = false,
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "slipgoo", amount = 20, fluidbox_multiplier = 10},
		  {type = "fluid", name = "water", amount = 10, fluidbox_multiplier = 10},
		},
		results =
		{
		  {type = "fluid", name="lubricant", amount = 20}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0, g = 1, b = 0, a = 1.000},
		  secondary = {r = 0.3, g = 1, b = 0.3, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "tefpetal-extraction",
		icon = "__outer_moons__/graphics/icons/tefpetal-breakdown.png",
		category = "organic",
		subgroup = "agriculture-intermediates",
		order = "b[tefpetal-extraction]",
		auto_recycle = false,
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tefpetal", amount = 10}
		},
		results =
		{
		  {type = "fluid", name = "hydrofluoric-acid", amount = 20},
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0, g = 1, b = 0, a = 1.000},
		  secondary = {r = 0.3, g = 1, b = 0.3, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "bioplastic",
		icon = "__outer_moons__/graphics/icons/bioplastic.png",
		category = "organic",
		subgroup = "bioflux-intermediates",
		order = "b[organic-products]-b[bioplastic]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "tetrafluoroethylene", amount = 30},
		  {type = "item", name = "bioflux", amount = 1}
		},
		results = {{type="item", name="plastic-bar", amount=5}},
		crafting_machine_tint =
		{
		  primary = {r = 0.722, g = 0.621, b = 0.655, a = 1.000},
		  secondary = {r = 0.693, g = 0.449, b = 0.449, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "biosulfur",
		icon = "__outer_moons__/graphics/icons/biosulfur.png",
		category = "organic",
		subgroup = "bioflux-intermediates",
		order = "g[biosulfur]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "boompowder", amount = 5},
		  {type = "fluid", name = "water", amount = 10, fluidbox_multiplier = 10},
		  {type = "item", name = "bioflux", amount = 1},
		},
		results = {{type="fluid", name="sulfuric-acid", amount=10}},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 0, a = 1.000},
		  secondary = {r = 0.693, g = 0.449, b = 0.0, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "biogrenades",
		icon = "__outer_moons__/graphics/icons/biogrenades.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 8,
		subgroup = "agriculture-intermediates",
		order = "g[biogrenades]",
		ingredients =
		{
		  {type = "item", name = "boompowder", amount = 12},
		  {type = "item", name = "iron-plate", amount = 5},
		},
		results = {{type="item", name="grenade", amount=1}}
	},
	{
		type = "recipe",
		name = "niter-synthesis",
		icon = "__outer_moons__/graphics/icons/niter-synthesis.png",
		category = "organic-or-chemistry",
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		subgroup = "gleba-general",
		order = "g[niter-synthesis]",
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "potassium-salt", amount = 5},
		  {type = "item", name = "nitrocalcite", amount = 3}
		},
		results = {{type="item", name="niter", amount=2}}
	},
	{
		type = "recipe",
		name = "nitroglycerin-synthesis",
		icon = "__outer_moons__/graphics/icons/nitroglycerin-synthesis.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		subgroup = "gleba-general",
		order = "h[nitroglycerin-synthesis]",
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "niter", amount = 6},
		  {type = "fluid", name = "sulfuric-acid", amount = 5},
		  {type = "fluid", name = "glycerol", amount = 9}
		},
		results = {{type="fluid", name="nitroglycerin", amount=30}}
	},
	{
		type = "recipe",
		name = "bioexplosives",
		icon = "__outer_moons__/graphics/icons/bioexplosives.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
		  secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
		  tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
		  quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 4,
		subgroup = "gleba-general",
		order = "i[bioexplosives]",
		ingredients =
		{
		  {type = "fluid", name = "ethanol", amount = 12},
		  {type = "fluid", name = "nitroglycerin", amount = 20}
		},
		results = {{type="item", name="explosives", amount=2}}
	},
	{
		type = "recipe",
		name = "iron-bacteria",
		icon = "__outer_moons__/graphics/icons/funnelbranch-iron.png",
		category = "organic-or-hand-crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		subgroup = "agriculture-intermediates",
		order = "d[iron-bacteria]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "funnelbranch", amount = 5},
		},
		results =
		{
		  {type = "item", name = "iron-bacteria", amount = 1, probability = 0.1 },
		  {type = "item", name = "spoilage", amount = 1}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
		  secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
		}
	},
	{
		type = "recipe",
		name = "biowall",
		icon = "__outer_moons__/graphics/icons/biowall.png",
		category = "organic",
		subgroup = "bioflux-intermediates",
		order = "d[biowall]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "funnelbranch", amount = 8},
		  {type = "item", name = "bioflux", amount = 1},
		},
		results =
		{
		  {type = "item", name = "stone-wall", amount = 2}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
		  secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
		}
	},
	{
		type = "recipe",
		name = "nickel-bacteria",
		icon = "__outer_moons__/graphics/icons/jelly-nickel.png",
		category = "organic-or-hand-crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		subgroup = "agriculture-intermediates",
		order = "c[nickel-bacteria]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "jelly", amount = 4},
		},
		results =
		{
		  {type = "item", name = "nickel-bacteria", amount = 1, probability = 0.1 },
		  {type = "item", name = "spoilage", amount = 1}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
		  secondary = {r = 0.095, g = 0.822, b = 0.412, a = 1.000}, -- #1868d1ff
		},
	},
	{
		type = "recipe",
		name = "copper-bacteria",
		icon = "__outer_moons__/graphics/icons/mash-copper.png",
		category = "organic-or-hand-crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		subgroup = "agriculture-intermediates",
		order = "f[copper-bacteria]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "yumako-mash", amount = 3},
		},
		results =
		{
		  {type = "item", name = "copper-bacteria", amount = 1, probability = 0.1 },
		  {type = "item", name = "spoilage", amount = 1}
		},
		--main_product = "copper-bacteria",
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.457, b = 0.000, a = 1.000}, -- #ff7400ff
		  secondary = {r = 1.000, g = 0.196, b = 0.000, a = 1.000}, -- #ff3100ff
		}
	},
	{
		type = "recipe",
		name = "nickel-bacteria-cultivation",
		icon = "__outer_moons__/graphics/icons/nickel-bacteria-cultivation.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		subgroup = "bacteria",
		order = "f[bacteria]",
		enabled = false,
		allow_productivity = true,
		result_is_always_fresh = true,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "nickel-bacteria", amount = 1},
		  {type = "item", name = "bioflux", amount = 1}
		},
		results =
		{
		  {type = "item", name = "nickel-bacteria", amount = 4}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
		  secondary = {r = 0.095, g = 0.822, b = 0.412, a = 1.000}, -- #1868d1ff
		},
		show_amount_in_title = false
	},
	{
		type = "recipe",
		name = "pyromorphitic-extraction",
		icon = "__outer_moons__/graphics/icons/pyromorphitic-extraction.png",
		category = "organic-or-chemistry", --chemistry-or-cryogenics
		subgroup = "gleba-general",
		order = "ab[pyromorphitic-extraction]",
		enabled = false,
		allow_productivity = true,
		result_is_always_fresh = true,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "phosphate", amount = 50},
		  {type = "fluid", name = "sulfuric-acid", amount = 5}
		},
		results =
		{
		  {type="item", name="lead-ore", amount_min = 2, amount_max = 10 }
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.440, g = 0.322, b = 0.306, a = 1.000}, -- #007fffff
		  secondary = {r = 0.440, g = 0.322, b = 0.306, a = 1.000}, -- #1868d1ff
		},
		show_amount_in_title = false
	},
	{
		type = "recipe",
		name = "phosphasilenic-extraction",
		icon = "__outer_moons__/graphics/icons/phosphasilenic-extraction.png",
		category = "chemistry-or-cryogenics", --organic-or-chemistry
		subgroup = "gleba-general",
		order = "ac[phosphasilenic-extraction]",
		enabled = false,
		allow_productivity = true,
		result_is_always_fresh = true,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "phosphate", amount = 50},
		  {type = "fluid", name = "sulfuric-acid", amount = 5}
		},
		results =
		{
		  {type="item", name="silicon-ore", amount_min = 2, amount_max = 10 }
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.440, g = 0.322, b = 0.306, a = 1.000}, -- #007fffff
		  secondary = {r = 0.440, g = 0.322, b = 0.306, a = 1.000}, -- #1868d1ff
		},
		show_amount_in_title = false
	},
	{
		type = "recipe",
		name = "berlinitic-extraction",
		icon = "__outer_moons__/graphics/icons/berlinitic-extraction.png",
		category = "chemistry-or-cryogenics", --organic-or-chemistry
		subgroup = "gleba-general",
		order = "ad[berlinitic-extraction]",
		enabled = false,
		allow_productivity = true,
		result_is_always_fresh = true,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "phosphate", amount = 50},
		  {type = "fluid", name = "sulfuric-acid", amount = 5}
		},
		results =
		{
		  {type="item", name="alumina", amount_min = 2, amount_max = 10 }
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.440, g = 0.322, b = 0.306, a = 1.000}, -- #007fffff
		  secondary = {r = 0.440, g = 0.322, b = 0.306, a = 1.000}, -- #1868d1ff
		},
		show_amount_in_title = false
	},
	--Soils
	{
		type = "recipe",
		name = "fertilizer",
		icon = "__outer_moons__/graphics/icons/fertilizer.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		subgroup = "agriculture-products",
		order = "b[organic-products]-a[fertilizer]",
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "phosphate", amount = 20},
		  {type = "item", name = "nitrocalcite", amount = 6},
		  {type = "item", name = "potassium-salt", amount = 4},
		  {type = "item", name = "nutrients", amount = 10}
		},
		results = {{type="item", name="fertilizer", amount=10}}
	},
	{
		type = "recipe",
		name = "stone-synthesis",
		icon = "__outer_moons__/graphics/icons/stone-synthesis.png",
		category = "smelting",
		subgroup = "gleba-general",
		order = "d[stone-synthesis]",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "calcite", amount = 3},
		},
		results = {{type="item", name="stone", amount=1}}
	},
	{
		type = "recipe",
		name = "concrete-synthesis",
		icon = "__outer_moons__/graphics/icons/slipconcrete.png",
		category = "organic",
		subgroup = "agriculture-intermediates",
		order = "a[concrete-synthesis]",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "stone-brick", amount = 5},
		  {type = "fluid", name = "slipgoo", amount = 20, fluidbox_multiplier = 10},
		},
		results = {{type="item", name="concrete", amount=10}}
	},
	{
		type = "recipe",
		name = "refined-concrete-synthesis",
		icon = "__outer_moons__/graphics/icons/refined-slipconcrete.png",
		category = "organic",
		subgroup = "bioflux-intermediates",
		order = "a[stone-synthesis]",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "concrete", amount = 20},
		  {type = "fluid", name = "slipgoo", amount = 20, fluidbox_multiplier = 10},
		},
		results = {{type="item", name="refined-concrete", amount=10}}
	},
	{
		type = "recipe",
		name = "artificial-cuticle-soil",
		icon = "__outer_moons__/graphics/icons/artificial-cuticle-soil.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "slipstack-seed", amount = 1},
		  {type = "item", name = "sunnycomb-seed", amount = 1},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-cuticle-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-cuticle-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-cuticle-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-cuticle-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-cuticle-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-yumako-soil",
		icon = "__outer_moons__/graphics/icons/artificial-virid-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "cuttlepop-seed", amount = 1},
		  {type = "item", name = "funneltrunk-seed", amount = 1},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-yumako-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-yumako-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-virid-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-yumako-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-yumako-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-jellynut-soil",
		icon = "__outer_moons__/graphics/icons/artificial-sanguine-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "lickmaw-seed", amount = 1},
		  {type = "item", name = "yumako-seed", amount = 1},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-jellynut-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-jellynut-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-sanguine-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-jellynut-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-jellynut-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-ochre-soil",
		icon = "__outer_moons__/graphics/icons/artificial-ochre-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "boompuff-seed", amount = 2},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-ochre-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-ochre-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-ochre-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-ochre-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-ochre-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-cerulean-soil",
		icon = "__outer_moons__/graphics/icons/artificial-cerulean-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "stingfrond-seed", amount = 2},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-cerulean-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-cerulean-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-cerulean-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-jellynut-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-cerulean-soil", amount=1}}
	},
	
	--Fulgora
	{
      type = "recipe",
      name = "sludge-separation",
      category = "oil-processing",
      icon = "__outer_moons__/graphics/icons/fluid/sludge-separation.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "fluid", name = "sludge", amount = 500, fluidbox_multiplier = 10}
      },
      results =
      {
        {type = "fluid", name = "heavy-oil", amount = 65},
        {type = "fluid", name = "aromatics", amount = 30},
        {type = "fluid", name = "water", amount = 55},
        {type = "item", name = "microplastic", amount_min = 4, amount_max = 12},
        {type = "item", name = "sulfur", amount_min = 2, amount_max = 6},
      },
      subgroup = "separation-recipes",
      order = "a[separation]-b[fulgoran-sludge-separation]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.5, g = 0.4, b = 0.25, a = 1.000},
        secondary = {r = 0, g = 0, b = 0, a = 1.000},
        tertiary = {r = 0.75, g = 0.5, b = 0.5},
        quaternary = {r = 0.24, g = 0.16, b = 0.16}
      }
    },
	{
		type = "recipe",
		name = "electrolyte",
		category = "electromagnetics",
		subgroup = "fulgora-processes",
		order = "c[holmium]-a[electrolyte]",
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "stone-brick", amount = 1},
		  {type = "item", name = "plastic-bar", amount = 1},
		  {type = "fluid", name = "heavy-oil", amount = 10},
		  {type = "fluid", name = "holmium-solution", amount = 10},
		},
		results = {{type = "fluid", name = "electrolyte", amount = 10}},
		allow_productivity = true,
		enabled = false
	},
	{
      type = "recipe",
      name = "amalgamate-microplastic",
      category = "smelting",
      icon = "__outer_moons__/graphics/icons/amalgamate-microplastic.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "microplastic", amount = 10}
      },
      results =
      {
        {type = "item", name = "plastic-bar", amount = 1}
      },
      subgroup = "fulgora-processes",
      order = "b[chemistry-fulgora]-b[amalgamate-microplastic]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
      }
    },
	{
		type = "recipe",
		name = "superconductor",
		category = "electromagnetics",
		subgroup = "fulgora-processes",
		order = "c[holmium]-b[superconductor]",
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "holmium-plate", amount = 1},
		  {type = "item", name = "aluminum-cable", amount = 1},
		  {type = "item", name = "plastic-bar", amount = 1},
		  {type = "fluid", name = "aromatics", amount = 5},
		},
		results = {{type = "item", name = "superconductor", amount = 2}},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "supercapacitor",
		category = "electromagnetics",
		subgroup = "fulgora-processes",
		order = "c[holmium]-c[supercapacitor]",
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "superconductor", amount = 1},
		  {type = "item", name = "plastic-bar", amount = 2},
		  {type = "item", name = "advanced-circuit", amount = 1},
		  {type = "item", name = "solid-state-battery", amount = 2},
		},
		results = {{type="item", name="supercapacitor", amount=1}},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "solid-state-battery",
		category = "electromagnetics",
		subgroup = "chemical-product",
		order = "e[solid-state-battery]",
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "superconductor", amount = 2},
		  {type = "fluid", name = "electrolyte", amount = 20},
		},
		results = {{type="item", name="solid-state-battery", amount=1}},
		allow_productivity = true,
		enabled = false
	},
	--Inserters	
	{
		type = "recipe",
		name = "burner-inserter",
		category = "crafting-or-robotics",
		ingredients =
		{
		  {type = "item", name = "lead-plate", amount = 1},
		  --{type = "item", name = "solder", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 1}
		},
		results = {{type="item", name="burner-inserter", amount=1}}
	},
	{
		type = "recipe",
		name = "inserter",
		category = "crafting-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 1},
		  {type = "item", name = "burner-inserter", amount = 1}
		},
		results = {{type="item", name="inserter", amount=1}}
	},	
	{
		type = "recipe",
		name = "long-handed-inserter",
		category = "crafting-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 2},
		  {type = "item", name = "burner-inserter", amount = 1}
		},
		results = {{type="item", name="long-handed-inserter", amount=1}}
	},
	
	{
		type = "recipe",
		name = "fast-inserter",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 1},
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "iron-gear-wheel", amount = 2},
		  {type = "item", name = "inserter", amount = 1}
		},
		results = {{type="item", name="fast-inserter", amount=1}}
	},
	{
		type = "recipe",
		name = "fast-long-handed-inserter",
		category = "assembly-or-robotics",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 1},
		  {type = "item", name = "steel-plate", amount = 4},
		  {type = "item", name = "iron-gear-wheel", amount = 2},
		  {type = "item", name = "long-handed-inserter", amount = 1}
		},
		results = {{type="item", name="fast-long-handed-inserter", amount=1}}
	},
	
	
	{
		type = "recipe",
		category = "assembly-or-robotics",
		name = "bulk-inserter",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 1},
		  {type = "item", name = "aluminum-plate", amount = 3},
		  {type = "item", name = "iron-gear-wheel", amount = 4},
		  {type = "item", name = "fast-inserter", amount = 1}
		},
		results = {{type="item", name="bulk-inserter", amount=1}}
	},
	{
		type = "recipe",
		category = "assembly-or-robotics",
		name = "bulk-long-handed-inserter",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 1},
		  {type = "item", name = "aluminum-plate", amount = 6},
		  {type = "item", name = "iron-gear-wheel", amount = 4},
		  {type = "item", name = "fast-long-handed-inserter", amount = 1}
		},
		results = {{type="item", name="bulk-long-handed-inserter", amount=1}}
	},
	
	{
		type = "recipe",
		name = "stack-inserter",
		category = "robotics",
		enabled = false,
		--energy_required = 0.5,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 1},
		  {type = "item", name = "magnalium-plate", amount = 4},
		  {type = "item", name = "iron-gear-wheel", amount = 8},
		  {type = "item", name = "bulk-inserter", amount = 1},
		},
		results = {{type="item", name="stack-inserter", amount=1}}
	},
	{
		type = "recipe",
		name = "stack-long-handed-inserter",
		category = "robotics",
		enabled = false,
		--energy_required = 0.5,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 1},
		  {type = "item", name = "magnalium-plate", amount = 8},
		  {type = "item", name = "iron-gear-wheel", amount = 8},
		  {type = "item", name = "bulk-long-handed-inserter", amount = 1},
		},
		results = {{type="item", name="stack-long-handed-inserter", amount=1}}
	},
	-- Modules
	{
		type = "recipe",
		name = "speed-module",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 5}
		},
		energy_required = 15,
		results = {{type="item", name="speed-module", amount=1}}
	},
	{
		type = "recipe",
		name = "speed-module-2",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "speed-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 30,
		results = {{type="item", name="speed-module-2", amount=1}}
	},
	{
		type = "recipe",
		name = "speed-module-3",
		category = "electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "speed-module-2", amount = 4},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		energy_required = 60,
		results = {{type="item", name="speed-module-3", amount=1}}
	},
	{
		type = "recipe",
		name = "productivity-module",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 5}
		},
		energy_required = 15,
		results = {{type="item", name="productivity-module", amount=1}}
	},
	{
		type = "recipe",
		name = "productivity-module-2",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "productivity-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 30,
		results = {{type="item", name="productivity-module-2", amount=1}}
	},
	{
		type = "recipe",
		name = "productivity-module-3",
		category = "electronics-quantum",
		enabled = false,
		energy_required = 60,
		ingredients =
		{
		  {type = "item", name = "productivity-module-2", amount = 4},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		results = {{type="item", name="productivity-module-3", amount=1}}
	},
	{
		type = "recipe",
		name = "efficiency-module",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 5}
		},
		energy_required = 15,
		results = {{type="item", name="efficiency-module", amount=1}}
	},
	{
		type = "recipe",
		name = "efficiency-module-2",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "efficiency-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 30,
		results = {{type="item", name="efficiency-module-2", amount=1}}
	},
	{
		type = "recipe",
		name = "efficiency-module-3",
		category = "electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "efficiency-module-2", amount = 4},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		energy_required = 60,
		results = {{type="item", name="efficiency-module-3", amount=1}}
	},
	{
		type = "recipe",
		name = "quality-module",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "integrated-circuit", amount = 5},
		},
		energy_required = 15,
		results = {{type="item", name="quality-module", amount=1}}
	},
	{
		type = "recipe",
		name = "quality-module-2",
		category = "assembly-electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "quality-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5},
		},
		energy_required = 30,
		results = {{type="item", name="quality-module-2", amount=1}}
	},
	{
		type = "recipe",
		name = "quality-module-3",
		category = "electronics-quantum",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "quality-module-2", amount = 4},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		energy_required = 60,
		results = {{type="item", name="quality-module-3", amount=1}}
	},
	--Scrap
	{
		type = "recipe",
		name = "scrap-recycling",
		icons = {
		  {
			icon = "__quality__/graphics/icons/recycling.png"
		  },
		  {
			icon = "__space-age__/graphics/icons/scrap.png",
			scale = 0.4
		  },
		  {
			icon = "__quality__/graphics/icons/recycling-top.png"
		  }
		},
		category = "recycling-or-hand-crafting",
		subgroup = "fulgora-processes",
		order = "a[trash]-b[trash-recycling]",
		enabled = false,
		auto_recycle = false,
		energy_required = 0.2,
		ingredients = {{type = "item", name = "scrap", amount = 1}},
		results =
		{
		  {type = "item", name = "iron-gear-wheel",        amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "concrete",               amount = 1, probability = 0.06, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "steel-plate",            amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "battery",                amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "aluminum-cable",         amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "stone",                  amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "advanced-circuit",       amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "processing-unit",        amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "electric-engine-unit",   amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "solid-fuel",             amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "low-density-structure",  amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "holmium-ore",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
		}
	},
	--Belts
	{
		type = "recipe",
		name = "transport-belt",
		energy_required = 1,
		category = "pressing",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 1}
		},
		results = {{type="item", name="transport-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "fast-transport-belt",
		category = "pressing",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "iron-gear-wheel", amount = 2},
		  {type = "item", name = "transport-belt", amount = 1}
		},
		results = {{type="item", name="fast-transport-belt", amount=1}}
	},
	{
		type = "recipe",
		name = "express-transport-belt",
		category = "crafting-with-fluid-or-metallurgy",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 3},
		  {type = "item", name = "iron-gear-wheel", amount = 4},
		  {type = "item", name = "fast-transport-belt", amount = 1},
		  {type = "fluid", name = "lubricant", amount = 20}
		},
		results = {{type="item", name="express-transport-belt", amount=1}}
	},
	{
		type = "recipe",
		name = "turbo-transport-belt",
		category = "metallurgy",
		energy_required = 4,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-plate", amount = 4},
		  {type = "item", name = "iron-gear-wheel", amount = 6},
		  {type = "item", name = "express-transport-belt", amount = 1},
		  {type= "fluid", name = "lubricant", amount = 25}
		},
		results = {{type="item", name="turbo-transport-belt", amount=1}}
	},
	{
		type = "recipe",
		name = "hyper-transport-belt",
		category = "adv-metallurgy",
		energy_required = 5,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "osmiridium-plate", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 8},
		  {type = "item", name = "turbo-transport-belt", amount = 1},
		  {type= "fluid", name = "lubricant", amount = 30}
		},
		results = {{type="item", name="hyper-transport-belt", amount=1}}
	},
	{
		type = "recipe",
		name = "vacuum-transport-belt",
		category = "adv-metallurgy",
		energy_required = 6,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 0,
			max = 0
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "mischmetal-plate", amount = 6},
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "hyper-transport-belt", amount = 1},
		  {type= "fluid", name = "lubricant", amount = 40}
		},
		results = {{type="item", name="vacuum-transport-belt", amount=1}}
	},
	--Underground
	{
		type = "recipe",
		name = "underground-belt",
		enabled = false,
		category = "pressing",
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 10},
		  {type = "item", name = "iron-gear-wheel", amount = 5},
		  {type = "item", name = "transport-belt", amount = 5}
		},
		results = {{type="item", name="underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "fast-underground-belt",
		energy_required = 2,
		category = "pressing",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 14},
		  {type = "item", name = "iron-gear-wheel", amount = 14},
		  {type = "item", name = "underground-belt", amount = 2}
		},
		results = {{type="item", name="fast-underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "express-underground-belt",
		energy_required = 3,
		category = "crafting-with-fluid-or-metallurgy",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 18},
		  {type = "item", name = "iron-gear-wheel", amount = 18},
		  {type = "item", name = "fast-underground-belt", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 40}
		},
		results = {{type="item", name="express-underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "turbo-underground-belt",
		energy_required = 4,
		category = "metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-plate", amount = 22},
		  {type = "item", name = "iron-gear-wheel", amount = 22},
		  {type = "item", name = "express-underground-belt", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 50}
		},
		results = {{type="item", name="turbo-underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "hyper-underground-belt",
		energy_required = 5,
		category = "adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "osmiridium-plate", amount = 26},
		  {type = "item", name = "iron-gear-wheel", amount = 26},
		  {type = "item", name = "turbo-underground-belt", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 60}
		},
		results = {{type="item", name="hyper-underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "vacuum-underground-belt",
		energy_required = 6,
		category = "adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 0,
			max = 0
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "mischmetal-plate", amount = 30},
		  {type = "item", name = "iron-gear-wheel", amount = 30},
		  {type = "item", name = "hyper-underground-belt", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 80}
		},
		results = {{type="item", name="vacuum-underground-belt", amount=2}}
	},
	--Splitter
	{
		type = "recipe",
		name = "splitter",
		category = "pressing",
		enabled = false,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "iron-plate", amount = 2},
		  {type = "item", name = "iron-gear-wheel", amount = 4},
		  {type = "item", name = "transport-belt", amount = 2}
		},
		results = {{type="item", name="splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "fast-splitter",
		category = "pressing",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "splitter", amount = 1},
		  {type = "item", name = "steel-plate", amount = 4},
		  {type = "item", name = "iron-gear-wheel", amount = 8},
		  {type = "item", name = "integrated-circuit", amount = 5}
		},
		results = {{type="item", name="fast-splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "express-splitter",
		category = "crafting-with-fluid-or-metallurgy",
		enabled = false,
		energy_required = 3,
		ingredients =
		{
		  {type = "item", name = "fast-splitter", amount = 1},
		  {type = "item", name = "aluminum-plate", amount = 6},
		  {type = "item", name = "iron-gear-wheel", amount = 12},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "fluid", name = "lubricant", amount = 60}
		},
		results = {{type="item", name="express-splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "turbo-splitter",
		category = "metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "express-splitter", amount = 1},
		  {type = "item", name = "tungsten-plate", amount = 8},
		  {type = "item", name = "iron-gear-wheel", amount = 16},
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "fluid", name = "lubricant", amount = 80}
		},
		results = {{type="item", name="turbo-splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "hyper-splitter",
		category = "adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "turbo-splitter", amount = 1},
		  {type = "item", name = "osmiridium-plate", amount = 10},
		  {type = "item", name = "iron-gear-wheel", amount = 20},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "fluid", name = "lubricant", amount = 100}
		},
		results = {{type="item", name="hyper-splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "vacuum-splitter",
		category = "adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 0,
			max = 0
		  }
		},
		enabled = false,
		energy_required = 6,
		ingredients =
		{
		  {type = "item", name = "hyper-splitter", amount = 1},
		  {type = "item", name = "mischmetal-plate", amount = 12},
		  {type = "item", name = "iron-gear-wheel", amount = 24},
		  {type = "item", name = "quantum-supercomputer", amount = 5},
		  {type = "fluid", name = "lubricant", amount = 125}
		},
		results = {{type="item", name="vacuum-splitter", amount=1}}
	},
	
	-- Combinators
	{
		type = "recipe",
		name = "arithmetic-combinator",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "copper-cable", amount = 5},
		  {type = "item", name = "integrated-circuit", amount = 5}
		},
		results = {{type="item", name="arithmetic-combinator", amount=1}}
	},
	{
		type = "recipe",
		name = "decider-combinator",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "copper-cable", amount = 5},
		  {type = "item", name = "integrated-circuit", amount = 5}
		},
		results = {{type="item", name="decider-combinator", amount=1}}
	},
	{
		type = "recipe",
		name = "constant-combinator",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "copper-cable", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 2}
		},
		results = {{type="item", name="constant-combinator", amount=1}}
	},
	{
		type = "recipe",
		name = "selector-combinator",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 2},
		  {type = "item", name = "decider-combinator", amount = 5}
		},
		results = {{type="item", name="selector-combinator", amount=1}}
	},
	{
		type = "recipe",
		name = "power-switch",
		category = "electronics-or-assembling",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 5},
		  {type = "item", name = "copper-cable", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 2}
		},
		results = {{type="item", name="power-switch", amount=1}}
	},
	{
		type = "recipe",
		name = "programmable-speaker",
		category = "electronics-or-assembling",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 3},
		  {type = "item", name = "iron-stick", amount = 4},
		  {type = "item", name = "copper-cable", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 4}
		},
		results = {{type="item", name="programmable-speaker", amount=1}}
	},
	{
		type = "recipe",
		name = "display-panel",
		category = "electronics-or-assembling",
		ingredients = {{type = "item", name = "plastic-bar", amount = 2}, {type = "item", name = "small-lamp", amount = 4}, {type = "item", name = "integrated-circuit", amount = 1}},
		results = {{type="item", name="display-panel", amount=1}},
		enabled = false
	},
	--Scrubbing
	{
		type = "recipe",
		name = "filter",
		icon = "__outer_moons__/graphics/icons/filter.png",
		energy_required = 10,
		enabled = false,
		--hidden_in_factoriopedia = true,
		category = "robotics",
		subgroup = "aiolos-processes",
		order = "a",
		ingredients = {
			{type = "item", name = "sunnylattice", amount = 1},
			{type = "item", name = "plastic-bar", amount = 8},
			{type = "item", name = "beryllium-plate", amount = 1},
		},
		results =
		{
		  {type = "item", name = "filter", amount = 1},
		},
	},
	{
		type = "recipe",
		name = "filter-cleaning",
		icon = "__outer_moons__/graphics/icons/filter-cleaning.png",
		energy_required = 10,
		enabled = false,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "aiolos-processes",
		order = "a",
		ingredients = {
			{type = "item", name = "used-filter", amount = 1},
			{type = "item", name = "lye", amount = 2},
		},
		results =
		{
		  {type = "item", name = "filter", amount = 1},
		},
	},
	{
		type = "recipe",
		name = "nauvis-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/nauvis-scrubbing.png",
		energy_required = 10,
		enabled = false,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		hide_from_player_crafting = true,
		hide_from_stats = true,
		order = "a",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 1000,
			max = 1000
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "nitrogen", amount = 70},
		  {type = "fluid", name = "oxygen", amount = 15},
		  {type = "fluid", name = "carbon-dioxide", amount = 10},
		  {type = "fluid", name = "sulfur-dioxide", amount = 5},
		},
	},
	{
		type = "recipe",
		name = "selene-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/selene-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "b",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 150,
			max = 150
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "helium", amount = 10},
		  {type = "fluid", name = "hydrogen", amount = 2.5},
		  {type = "fluid", name = "steam", amount = 1.5},
		  {type = "fluid", name = "carbon-dioxide", amount = 1},
		},
	},
	{
		type = "recipe",
		name = "vulcanus-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/vulcanus-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "c",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "sulfur-dioxide", amount = 120},
		  {type = "fluid", name = "carbon-dioxide", amount = 50},
		  {type = "fluid", name = "steam", amount = 20},
		  {type = "fluid", name = "nitrogen", amount = 10},
		},
	},
	{
		type = "recipe",
		name = "gleba-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/gleba-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "d",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "oxygen", amount = 150},
		  {type = "fluid", name = "ammonia", amount = 50},
		  {type = "fluid", name = "nitrogen", amount = 30},
		  {type = "fluid", name = "carbon-dioxide", amount = 20},
		},
	},
	{
		type = "recipe",
		name = "fulgora-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/fulgora-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "e",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 800,
			max = 800
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "carbon-dioxide", amount = 40},
		  {type = "fluid", name = "oxygen", amount = 20},
		  {type = "fluid", name = "hydrogen", amount = 15},
		  {type = "fluid", name = "helium", amount = 5},
		},
	},
	{
		type = "recipe",
		name = "mefitis-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/mefitis-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "f",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "sulfur-dioxide", amount = 30},
		  {type = "fluid", name = "chlorine", amount = 10},
		  {type = "fluid", name = "carbon-dioxide", amount = 5},
		  {type = "fluid", name = "nitrogen", amount = 5},
		},
	},
	{
		type = "recipe",
		name = "aquilo-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/aquilo-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "g",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 300,
			max = 300
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "carbon-dioxide", amount = 40},
		  {type = "fluid", name = "fluorine", amount = 30},
		  {type = "fluid", name = "nitrogen", amount = 10},
		},
	},
	{
		type = "recipe",
		name = "aiolos-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/aiolos-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "h",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 5000,
			max = 5000
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "nitrogen", amount = 400},
		  {type = "fluid", name = "methane", amount = 50},
		  {type = "fluid", name = "phosphine", amount = 30},
		  {type = "fluid", name = "steam", amount = 20},
		},
	},
	{
		type = "recipe",
		name = "feronia-scrubbing",
		icon = "__outer_moons__/graphics/icons/fluid/feronia-scrubbing.png",
		energy_required = 10,
		enabled = false,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		--hidden_in_factoriopedia = true,
		category = "scrubbing",
		subgroup = "scrubber-recipes",
		order = "i",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 1200,
			max = 1200
		  }
		},
		ingredients = {
			{type = "item", name = "filter", amount = 1}
		},
		results =
		{
		  {type = "item", name = "used-filter", amount = 1},
		  {type = "fluid", name = "oxygen", amount = 60},
		  {type = "fluid", name = "iodine", amount = 30},
		  {type = "fluid", name = "nitrogen", amount = 20},
		  {type = "fluid", name = "carbon-dioxide", amount = 10},
		},
	},
	-- Aiolos Ag
    {
      type = "recipe",
      name = "sunnycomb-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/sunnycomb-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "sunnycomb", amount = 1},
      },
      results =
      {
		{type = "item", name = "sunnycomb-seed", amount = 1, probability = 0.02},
        {type = "item", name = "sunnylattice", amount = 1},
      },
      subgroup = "aiolos-agriculture",
      order = "c[agriculture]-b[sunnycomb-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },  
	--Feronia
	
	-- Asteroids
	{
		type = "recipe",
		name = "metallic-asteroid-crushing",
		icon = "__space-age__/graphics/icons/metallic-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-a-a",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1},
		},
		energy_required = 2,
		results =
		{
		  {type = "item", name = "iron-ore", amount = 20},
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.2}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "carbonic-asteroid-crushing",
		icon = "__space-age__/graphics/icons/carbonic-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-a-b",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1},
		},
		energy_required = 2,
		results =
		{
		  {type = "item", name = "carbon", amount = 10},
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.2}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "silicaceous-asteroid-crushing",
		icon = "__outer_moons__/graphics/icons/silicaceous-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-a-c",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1},
		},
		energy_required = 2,
		results =
		{
		  {type = "item", name = "silicon-ore", amount = 10},
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1, probability = 0.2}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "oxide-asteroid-crushing",
		icon = "__space-age__/graphics/icons/oxide-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-a-d",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1},
		},
		energy_required = 2,
		results =
		{
		  {type = "item", name = "ice", amount = 5},
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.2}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
	
	
	{
		type = "recipe",
		name = "advanced-metallic-asteroid-crushing",
		localised_name = {"recipe-name.advanced-metallic-asteroid-crushing"},
		icon = "__space-age__/graphics/icons/advanced-metallic-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "c-a-b",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1}
		},
		energy_required = 5,
		results =
		{
		  {type = "item", name = "iron-ore", amount = 8},
		  {type = "item", name = "nickel-ore", amount = 6},
		  {type = "item", name = "copper-ore", amount = 4},
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.05}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "advanced-carbonic-asteroid-crushing",
		localised_name = {"recipe-name.advanced-carbonic-asteroid-crushing"},
		icon = "__space-age__/graphics/icons/advanced-carbonic-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "e[advanced-carbonic-asteroid-crushing]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1}
		},
		energy_required = 5,
		results =
		{
		  {type = "item", name = "carbon", amount = 8},
		  {type = "item", name = "sulfur", amount = 6},
		  {type = "item", name = "niter", amount = 4},
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.05}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "advanced-silicaceous-asteroid-crushing",
		localised_name = {"recipe-name.advanced-silicaceous-asteroid-crushing"},
		icon = "__space-age__/graphics/icons/advanced-carbonic-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "f[advanced-silicaceous-asteroid-crushing]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1}
		},
		energy_required = 5,
		results =
		{
		  {type = "item", name = "silicon-ore", amount = 8},
		  {type = "item", name = "magnesium-ore", amount = 6},
		  {type = "item", name = "alumina", amount = 4},
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1, probability = 0.05}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "advanced-oxide-asteroid-crushing",
		localised_name = {"recipe-name.advanced-oxide-asteroid-crushing"},
		icon = "__space-age__/graphics/icons/advanced-oxide-asteroid-crushing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "g[advanced-oxide-asteroid-crushing]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1}
		},
		energy_required = 5,
		results =
		{
		  {type = "item", name = "ice", amount = 4},
		  {type = "item", name = "dry-ice", amount = 3},
		  {type = "item", name = "calcite", amount = 2},
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.05}
		},
		allow_productivity = true,
		allow_decomposition = false
	},
  
	{
		type = "recipe",
		name = "metallic-asteroid-reprocessing",
		icon = "__space-age__/graphics/icons/metallic-asteroid-reprocessing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-b-a",
		auto_recycle = false,
		enabled = false,
		ingredients = {{type = "item", name = "metallic-asteroid-chunk", amount = 1}},
		energy_required = 2,
		results =
		{
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.4},
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.15},
		},
		allow_productivity = false,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "carbonic-asteroid-reprocessing",
		icon = "__space-age__/graphics/icons/carbonic-asteroid-reprocessing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-b-b",
		auto_recycle = false,
		enabled = false,
		ingredients = {{type = "item", name = "carbonic-asteroid-chunk", amount = 1}},
		energy_required = 2,
		results =
		{
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.4},
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.15},
		},
		allow_productivity = false,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "silicaceous-asteroid-reprocessing",
		icon = "__outer_moons__/graphics/icons/silicaceous-asteroid-reprocessing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-b-c",
		auto_recycle = false,
		enabled = false,
		ingredients = {{type = "item", name = "silicaceous-asteroid-chunk", amount = 1}},
		energy_required = 2,
		results =
		{
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1, probability = 0.4},
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.15},
		},
		allow_productivity = false,
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "oxide-asteroid-reprocessing",
		icon = "__space-age__/graphics/icons/oxide-asteroid-reprocessing.png",
		category = "crushing",
		subgroup="space-crushing",
		order = "b-b-d",
		auto_recycle = false,
		enabled = false,
		ingredients = {{type = "item", name = "oxide-asteroid-chunk", amount = 1}},
		energy_required = 1,
		results =
		{
		  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.4},
		  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.15},
		  {type = "item", name = "silicaceous-asteroid-chunk", amount = 1, probability = 0.15},
		},
		allow_productivity = false,
		allow_decomposition = false
	},
	--Flaring
	{
		type = "recipe",
		name = "crude-flaring",
		icon = "__base__/graphics/icons/fluid/crude-oil.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "crude-oil", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "heavy-oil-flaring",
		icon = "__base__/graphics/icons/fluid/heavy-oil.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "heavy-oil", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "light-oil-flaring",
		icon = "__base__/graphics/icons/fluid/light-oil.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "light-oil", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "lubricant-flaring",
		icon = "__base__/graphics/icons/fluid/lubricant.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "lubricant", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "aromatics-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/aromatics.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "aromatics", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "methanol-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/methanol.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "methanol", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "phenol-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/phenol.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "phenol", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "sulfuric-acid-flaring",
		icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "sulfuric-acid", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "nitric-acid-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/nitric-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "nitric-acid", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "nitrogen-tetroxide-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/nitrogen-tetroxide.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "nitrogen-tetroxide", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "perchlorate-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/perchlorate.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "perchlorate", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "ethanol-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/ethanol.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "ethanol", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "phosphoric-acid-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/phosphoric-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "phosphoric-acid", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "adenine-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/adenine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "adenine", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "guanine-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/guanine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "guanine", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "thymine-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/thymine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "thymine", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "cytosine-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/cytosine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "cytosine", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "chloroform-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/chloroform.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "chloroform", amount = 100}
		},
	},
	{
		type = "recipe",
		name = "fluoroform-flaring",
		icon = "__outer_moons__/graphics/icons/fluid/fluoroform.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "flaring",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "fluoroform", amount = 100}
		},
	},
	--Venting
	{
		type = "recipe",
		name = "steam-venting",
		icon = "__base__/graphics/icons/fluid/steam.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "hydrogen-venting",
		icon = "__outer_moons__/graphics/icons/fluid/hydrogen.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "hydrogen", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "oxygen-venting",
		icon = "__outer_moons__/graphics/icons/fluid/oxygen.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "oxygen", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "petroleum-gas-venting",
		icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.966, g = 0.975, b = 0.857, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "olefins-venting",
		icon = "__outer_moons__/graphics/icons/fluid/olefins.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "natural-gas-venting",
		icon = "__outer_moons__/graphics/icons/fluid/natural-gas.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "natural-gas", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "methane-venting",
		icon = "__outer_moons__/graphics/icons/fluid/methane.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "methane", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "carbon-monoxide-venting",
		icon = "__outer_moons__/graphics/icons/fluid/carbon-monoxide.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "carbon-monoxide", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "carbon-dioxide-venting",
		icon = "__outer_moons__/graphics/icons/fluid/carbon-dioxide.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "carbon-dioxide", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "formaldehyde-venting",
		icon = "__outer_moons__/graphics/icons/fluid/formaldehyde.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "formaldehyde", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "sulfane-venting",
		icon = "__outer_moons__/graphics/icons/fluid/sulfane.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "sulfane", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.975, g = 0.911, b = 0.5, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "sulfur-dioxide-venting",
		icon = "__outer_moons__/graphics/icons/fluid/sulfur-dioxide.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "sulfur-dioxide", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.975, g = 0.911, b = 0.5, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "nitrogen-venting",
		icon = "__outer_moons__/graphics/icons/fluid/nitrogen.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "nitrogen", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.695, g = 0.901, b = 0.971, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "ammonia-venting",
		icon = "__outer_moons__/graphics/icons/fluid/ammonia.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "ammonia", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.695, g = 0.901, b = 0.971, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "hydrazine-venting",
		icon = "__outer_moons__/graphics/icons/fluid/hydrazine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "hydrazine", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.695, g = 0.901, b = 0.971, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "chlorine-venting",
		icon = "__outer_moons__/graphics/icons/fluid/chlorine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "chlorine", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.289, g = 0.632, b = 0.267, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "hydrochloric-acid-venting",
		icon = "__outer_moons__/graphics/icons/fluid/hydrochloric-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "hydrochloric-acid", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.289, g = 0.632, b = 0.267, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "vinyl-chloride-venting",
		icon = "__outer_moons__/graphics/icons/fluid/vinyl-chloride.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "vinyl-chloride", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.688, g = 0.836, b = 0.679, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "helium-venting",
		icon = "__outer_moons__/graphics/icons/fluid/helium.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "helium", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "volcanic-gas-venting",
		icon = "__outer_moons__/graphics/icons/fluid/volcanic-gas.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "volcanic-gas", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.831, g = 0.671, b = 0.268, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "fluorine-venting",
		icon = "__outer_moons__/graphics/icons/fluid/fluorine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "fluorine", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.471, g = 0.629, b = 0.585, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "phosphine-venting",
		icon = "__outer_moons__/graphics/icons/fluid/phosphine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "phosphine", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.746, g = 0.497, b = 0.02, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "iodine-venting",
		icon = "__outer_moons__/graphics/icons/fluid/iodine.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "iodine", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.484, g = 0.241, b = 0.731, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "hydroiodic-acid-venting",
		icon = "__outer_moons__/graphics/icons/fluid/hydroiodic-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "hydroiodic-acid", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.484, g = 0.241, b = 0.731, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "hydrofluoric-acid-venting",
		icon = "__outer_moons__/graphics/icons/fluid/hydrofluoric-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "hydrofluoric-acid", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.471, g = 0.629, b = 0.585, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "tetrafluoroethylene-venting",
		icon = "__outer_moons__/graphics/icons/fluid/tetrafluoroethylene.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		hide_from_player_crafting = true,
		hide_from_stats = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "tetrafluoroethylene", amount = 100}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.471, g = 0.629, b = 0.585, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
})
