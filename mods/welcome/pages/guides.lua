function welcome.guides_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "welcome:guides",
		welcome.size..
		welcome.close_button..
		welcome.image_button_welcome..
		welcome.image_button_profile..
		welcome.image_button_rules..
		welcome.image_button_guides..
		welcome.image_button_contact..
		welcome.image_button_inbox..
		welcome.image_button_staff..
		"tablecolumns[color;text]" ..
		"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
		"table[2,0;10,2;welcome_guides;" ..
		"#FFFF00," .. "Here are some useful guides and help articles," ..
		",underconstruction.gif,"..
		";1]")
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if formname ~= "welcome:guides" then
		return
	end
	if fields.welcome_welcome then
		minetest.after(1, function()
			welcome.welcome_formspec(player)
		end)
	end
	if fields.welcome_profile then
		minetest.after(1, function()
			welcome.profile_formspec(player)
		end)
	end
	if fields.welcome_rules then
		minetest.after(1, function()
			welcome.rules_formspec(player)
		end)
	end
	if fields.welcome_guides then
		minetest.after(1, function()
			welcome.guides_formspec(player)
		end)
	end
	if fields.welcome_contact then
		minetest.after(1, function()
			welcome.contact_formspec(player)
		end)
	end
	if fields.welcome_inbox then
		minetest.after(1, function()
			chatplus.showInbox(plname)
		end)
	end
	if fields.welcome_staff then
		minetest.after(1, function()
			welcome.staff_formspec(player)
		end)
	end
end)
