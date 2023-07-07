--[[

    :::::::::: ::::::::::: ::::    :::     :::     :::          :::   ::::::::  
    :+:            :+:     :+:+:   :+:   :+: :+:   :+:        :+:+:  :+:    :+: 
    +:+            +:+     :+:+:+  +:+  +:+   +:+  +:+          +:+  +:+        
    :#::+::#       +#+     +#+ +:+ +#+ +#++:++#++: +#+          +#+  +#++:++#+  
    +#+            +#+     +#+  +#+#+# +#+     +#+ +#+          +#+  +#+    +#+ 
    #+#            #+#     #+#   #+#+# #+#     #+# #+#          #+#  #+#    #+# 
    ###        ########### ###    #### ###     ### ########## ####### ########  

    - Hopfully the last and final
    2016 emulation script

    @scotdotwtf

]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/scotdotwtf/Final16/main/modules/load.lua"))()

--// vars and funcs
local repo = "https://raw.githubusercontent.com/scotdotwtf/Final16/main/"
if modules == nil then
    getgenv().modules = {"camera.lua", "displays.lua", "graphics.lua", "kick.lua", "mouse.lua", "playerlist.lua", "topbar.lua", "fdspoof.lua", "uicontents.lua"}
	game:GetService("TestService"):Warn(false, "[!] final16 | modules nil")
end

for number, module in pairs(modules) do
    loadstring(game:HttpGet(repo.."modules/"..module))()
    game:GetService("TestService"):Message("[*] final16 | loaded module, "..module)
 end
