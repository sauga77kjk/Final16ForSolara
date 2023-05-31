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
    getgenv().modules = {"camera.lua", "displays.lua", "graphics.lua", "kick.lua", "mouse.lua", "playerlist.lua", "topbar.lua"}
	print("[!] final16 | modules nil")
end

for number, module in pairs(modules) do
    loadstring(game:HttpGet(repo.."modules/"..module))()
    warn("[*] final16 | loaded module, "..module)
 end