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

--// vars and funcs
local repo = "https://raw.githubusercontent.com/sauga77kjk/Final16ForSolara/main/"
if modules == nil then
    --//   organizaton: | graphics                       | control     | ui                           | developer
    getgenv().modules = {"displays.lua", "graphics.lua",  "camera.lua", "kick.lua", "ui_contents.lua", "fd_spoof.lua"}
    game:GetService("TestService"):Warn(false, "[!] final16 | modules nil")
end

for number, module in pairs(modules) do 
    spawn(function() --> I absolutely HATE how uly this looks but whatever
        pcall(function()loadstring(game:HttpGet(repo.."modules/"..module))()end) --> :( look at this frowny face his sad because the modules are spamming errors so i added this to help him :)
        game:GetService("TestService"):Message("[*] final16 | loaded module, "..module)
    end)
end
