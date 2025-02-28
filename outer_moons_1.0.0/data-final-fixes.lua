-- Rocket parts
data.raw["recipe"]["rocket-part"].ingredients = {{type = "item", name = "rocket-part-new", amount = 1 } }

-- Cryo Plant changes
data.raw["assembling-machine"]["cryogenic-plant"].effect_receiver = { base_effect = { productivity = 0.5 } }
data.raw["assembling-machine"]["cryogenic-plant"].module_slots = 5
data.raw["assembling-machine"]["foundry"].module_slots = 3
data.raw["assembling-machine"]["foundry"].crafting_speed = 1
data.raw["assembling-machine"]["biochamber"].module_slots = 3
data.raw["assembling-machine"]["electromagnetic-plant"].module_slots = 3

data.raw["recipe"]["fluoroketone-cooling"].ingredients = { { type = "fluid", name = "fluoroketone-hot", amount = 18 } }
data.raw["recipe"]["fluoroketone-cooling"].results = { { type = "fluid", name= "fluoroketone-cold", amount = 12 } }
data.raw["recipe"]["fluoroketone-cooling"].energy_required = 9

data.raw.character.character.crafting_categories = {"crafting", "electronics", "pressing", "recycling-or-hand-crafting", "organic-or-hand-crafting", "organic-or-assembling", "crafting-or-robotics", "hand-assembly-electronics-quantum"}

data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "crafting-with-fluid", "electronics", "electronics-with-fluid", "pressing", "metallurgy-or-assembling", "organic-or-hand-crafting", "organic-or-assembling", "electronics-or-assembling", "cryogenics-or-assembling", "crafting-or-robotics", "crafting-with-fluid-or-metallurgy", "assembly-or-robotics", "fluid-assembly-or-robotics", "hand-assembly-electronics-quantum", "assembly-electronics-quantum",}
data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics", "electronics-with-fluid", "pressing", "metallurgy-or-assembling", "organic-or-hand-crafting", "organic-or-assembling", "electronics-or-assembling", "cryogenics-or-assembling", "crafting-or-robotics", "crafting-with-fluid-or-metallurgy", "assembly-or-robotics", "fluid-assembly-or-robotics", "hand-assembly-electronics-quantum", "assembly-electronics-quantum",}
data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics", "electronics-with-fluid", "pressing", "metallurgy-or-assembling", "organic-or-hand-crafting", "organic-or-assembling", "electronics-or-assembling", "cryogenics-or-assembling", "crafting-or-robotics", "crafting-with-fluid-or-metallurgy", "assembly-or-robotics", "fluid-assembly-or-robotics", "hand-assembly-electronics-quantum", "assembly-electronics-quantum",}
