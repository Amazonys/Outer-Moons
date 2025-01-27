
local function set_inventory(e)
  local player = game.players[e.player_index]
  local character = player.cutscene_character or player.character;
		character.clear_items_inside()
		--player.insert{name="iron-plate", count = 8}
		character.insert{name="wood", count = 1}
		character.insert{name="pistol", count = 1}
		character.insert{name="firearm-magazine", count = 2}
		character.insert{name="burner-mining-drill", count = 1}
		character.insert{name="stone-furnace-new", count = 1}
end

local function player_created(e)
  set_inventory(e)
end

script.on_event(defines.events.on_player_created, player_created)
