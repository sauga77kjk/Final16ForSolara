```
    :::::::::: ::::::::::: ::::    :::     :::     :::          :::   ::::::::  
    :+:            :+:     :+:+:   :+:   :+: :+:   :+:        :+:+:  :+:    :+: 
    +:+            +:+     :+:+:+  +:+  +:+   +:+  +:+          +:+  +:+        
    :#::+::#       +#+     +#+ +:+ +#+ +#++:++#++: +#+          +#+  +#++:++#+  
    +#+            +#+     +#+  +#+#+# +#+     +#+ +#+          +#+  +#+    +#+ 
    #+#            #+#     #+#   #+#+# #+#     #+# #+#          #+#  #+#    #+# 
    ###        ########### ###    #### ###     ### ########## ####### ########  

   @scotdotwtf, @colastee, made with love <3
```

# what
### So like this is a script that tries to emulate ROBLOX's 2016 user interface, graphics, and more.
### This is my 4th one lol. I'm hoping this is my last one.

# script
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/scotdotwtf/Final16/main/loader.lua"))()
```

# documentation
- ### Final16 has a simple module based loading system that allows you to choose what you want to load and not to load.
- ### To specify what modules you want to load, simply specify `getgenv().modules = {}` with the modules you would like to load.
- #### Modules can be found here: https://github.com/scotdotwtf/Final16/tree/main/modules
- ### Here's an example of loading only the camera and graphics module:
```lua
getgenv().modules = {"camera.lua", "graphics.lua"}
loadstring(game:HttpGet("https://raw.githubusercontent.com/scotdotwtf/Final16/main/loader.lua"))()
```
- ### The cool thing with final 16 is that it loads all module even if you don't specify it. [Here's how I did it:](https://github.com/scotdotwtf/Final16/blob/840aacba54257522ff37d52794eb0243a7b62c2c/loader.lua#L22)
```lua
-- LINE 16, scotdotwtf/Final16/loader.lua
if modules == nil then
    getgenv().modules = {"camera.lua", "displays.lua", "graphics.lua", "kick.lua", "mouse.lua", "playerlist.lua", "topbar.lua", "fdspoof.lua"}
    game:GetService("TestService"):Warn(false, "[!] final16 | modules nil")
end
```

# contribute
### Want to contribute? Simply make a pull request with your module, fix, or other addon and I will merge or communicate. 
