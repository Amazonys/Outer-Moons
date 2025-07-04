require("__outer_moons__.prototypes.entity.resources")
require("__outer_moons__.prototypes.autoplace-controls")
require("__outer_moons__.prototypes.planet.asteroid-spawn-definitions")
require("__outer_moons__.prototypes.planet.planet")
require("__outer_moons__.prototypes.planet.planet-map-gen")
require("__outer_moons__.prototypes.categories.recipe-category")
require("__outer_moons__.prototypes.item-groups")
require("__outer_moons__.prototypes.entity.entities")
require("__outer_moons__.prototypes.entity.plants")
require("__outer_moons__.prototypes.entity.transport-belts")
require("__outer_moons__.prototypes.entity.remnants")
require("__outer_moons__.prototypes.technology")
require("__outer_moons__.prototypes.item.item")
require("__outer_moons__.prototypes.fluid")
require("__outer_moons__.prototypes.recipe")
require("__outer_moons__.prototypes.factoriopedia-simulations")
require("__outer_moons__.prototypes.decorative.decoratives-selene")
require("__outer_moons__.prototypes.decorative.decoratives-gleba")
require("__outer_moons__.prototypes.decorative.decoratives-mefitis")
require("__outer_moons__.prototypes.decorative.decoratives-aiolos")
require("__outer_moons__.prototypes.decorative.decoratives-feronia")
require("__outer_moons__.prototypes.tile.tiles-selene")
require("__outer_moons__.prototypes.tile.tiles-gleba")
require("__outer_moons__.prototypes.tile.tiles-mefitis")
require("__outer_moons__.prototypes.tile.tiles-aiolos")
require("__outer_moons__.prototypes.tile.tiles-feronia")

require("__outer_moons__.prototypes.entity.asteroid")
require("__outer_moons__.prototypes.entity.explosions")
require("__outer_moons__.prototypes.entity.smoke")
require("__outer_moons__.prototypes.particles")

planets = {
"nauvis",
}

for _, name in pairs(planets) do
	local prototype = data.raw["space-location"][name] or data.raw["planet"][name]
	if not prototype then
		error("missing space location: "..name)
	end
	prototype.starmap_icon = "__outer_moons__/graphics/icons/starmap-planet-"..name..".png"
	prototype.starmap_icon_size = 4096
end
	