--Bounty Hunting Mod
--Release 0.1.1
--Copyright Mr_Pardison
--license LGPLv3.0
--Assistant: alexdevteam
--Tester: Mr_Pardison / A_Hamilton
--Tester:
--Tester: 

--Have to register UI page.


--Priv registration to remove a player from the list
minetest.register_privilege("bounty_admin", {
        description = "Can add and remove players from the blacklist",
        give_to_singleplayer = false
})
--Chat command registration to add or remove a player from The List
--minetest.register_chatcommand("bounty", {
--        privs = {
--          interact = true
--        },
--        func = function(name, param, item, val)
--            return true, "You have added " .. name .. " to the " .. param .. " list for the price of " .. val ..
--        end},)

--Might need to register a complex subcommand for this (sends a message to the player that they have been added to the bounty list).
--local to, msg = .. name ..
ChatCmdBuilder.new("bounty", function(cmd)
	cmd:sub(":target :bounty:val", function(name, target, val)
	local player = minetest.get_player_by_name(target)
		if player then
			player:set_bounty(bounty)
			return true, target .. " has been added to the bounty list for the price of " .. val
		else
			return false, "Unable to find any player by the name of " .. target.. ". Check the spelling of the name."
		end
	end)
end, {
	description ="Add a player to the bounty list for a price",
})
--SFINV page (GUI to add a player to The List)
sfinv.register_page("bounty_hunting:bounty_list", {
    title = "Bounty List",
    get = function(self, player, context)
        local players = {}
                    context.bounty_hunting_list = players
        local formspec = {
            "textlist[0.1,0.1;7.8,3;playerlist;"
        }
        local is_first = true
            for _ , player in pairs(minetest.get_connected_players()) do
                local player_name = player:get_player_name()
                players[#players + 1] = player_name
                if not is_first then
                        formspec[#formspec + 1] = ","
                end
                formspec[#formspec + 1] = ","
            --add buttons which is important.
            formspec[#formspec + 1] = "button[0.1,3.3;2.1,;add_bounty;Place Bounty;]"
            formspec[#formspec + 1] = "button[2.1,3.3;2.1;stack_bounty;Stack Bounty;]"
        end
      end
})

sfinv.register_page("bounty_hunting:bounty_change:", {
    title = "Bounty Removal";
    get = function(self, player, context)
        local players = {}
        context.bounty_hunting_list = players
        local formspec = {
            "textlist[0.1,0.1;7.8,3;playerlist;"
        }
        local is_first = true
        for _ , player in pairs(minetest.get_connected_players()) do
            local player_name = player:get_player_name()
            players[#players + 1] = player_name
            if not is_first then
                  formspec[#formspec + 1] = ","
            end
            formspec[#formspec + 1] = ","
            formspec[#formspec + 1] = "button[3.1,3.3;2.1;remove_bounty;Remove Bounty;]"
            return sfinv.make_formspec(player, context,table.concat(formspec, ""), false)
        end
		is_in_nav = function(self, player, context)
    		local privs = minetest.get_player_privs(player:get_player_name())
    		return privs.bounty_admin

end
end
})
local function on_grant_revoke(grantee, granter, priv)
    if priv == "bounty_admin"
      then local player = mientest.get_player_by_name(grantee)
        if player then
            sfinv.set_player_inventory_formspec(player)
        end
    end
end

--[[if minetest.get_modpath("unified_inventory") then
--Unified_Inventory Page Registration
unified_inventory.register_page("Bounty List", {
        get_formspec = function(player)
            local bounty = bounty.get_player_name(player)
         end   
)}
-- add inventory_plus page when a player joins
minetest.register_on_joinplayer(function(player)
    inventory_plus.register_button(player,"bounty_hunting",S("Bounty List"))
end)
 
-- each time a player clicks an inventory button, this is called
minetest.register_on_player_receive_fields(function(player, formname, fields)
 
    -- Bounty Hunting List was clicked from the main inventory page
    if fields.bounty_hunting then
        -- setup the inventory formspec
        inventory_plus.set_inventory_formspec(player, get_formspec(player))
    end
 
    -- Bounty List button was clicked
    if fields.bounty_hunting_bounty_list then
        -- setup the inventory formspec
        inventory_plus.set_inventory_formspec(player, get_formspec(player))
 
        -- user clicked the button, better do something here
        
    end
end)
 
-- get_formspec to use when your button is clicked
local get_formspec = function(player)
    local formspec = "size[4,1.5]" -- size of the formspec page
        .."button[0,0;2,0.5;main;Back]" -- back to main inventory
        .."button[0,2;2,0.5;your_mod_name_some_button;Some Button]" -- a button that does something in your GUI
    return formspec
end]]--
minetest.register_on_player_receive_fields(function(player, formname, fields)
	-- support inventory plus
	if m_ip then
		if fields.bounty_hunting then
			-- show formspec
			local formspec = get_formspec(player:get_player_name())
			formspec = formspec.."button[6,0.1;2,0.5;main;Back]"
			.. default.gui_bg
			.. default.gui_bg_img
			.. default.gui_slots
			inventory_plus.set_inventory_formspec(player, formspec)
			return
		end
	end

	if formname ~= "bounty_hunting:bounty_form" and
	formname ~= "" then return end

	--[[for i = 1, 8 do
		if fields[tostring(i)] then
			warp(player, tostring(i))
			return
		end
	end]]--
end)


-- unified inventory button

if m_ui then
	unified_inventory.register_button('Bounty List', {
		type = 'image',
		image = 'target.png',
		tooltip = 'Bounty List'

	})
	unified_inventory.register_page("bounty", {
		get_formspec = function(player, perplayer_formspec)
			local name = player:get_player_name()
			local fy = perplayer_formspec.formspec_y
			local formspec = "background[0.06,"..fy..";7.92,7.52;cats_schrodinger.png]"
			.."label[0,0;Schrodinger's Cat]"
			..get_formspec(name,true)
			return {formspec=formspec}
	end
})
end

--Detect whether the player was killed by another player

--Give player the reward for completing the contract

--Remove contract from list

--