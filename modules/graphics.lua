--// setting up graphics to look older
local function sethiddenproperty(obj,pro,val)
obj[pro]=val
end
local effectsafter2016 = {"DepthOfFieldEffect", "Atmosphere"}
for _, effect in pairs(game:GetService("Lighting"):GetChildren()) do
    for _, not2016effect in pairs(effectsafter2016) do
        if effect:IsA(not2016effect) then
            effect:Destroy() 
        end
    end
end

pcall(function()
    sethiddenproperty(game:GetService("Lighting"), "Technology", Enum.Technology.Compatibility) 
end)

game:GetService("Lighting").Ambient = Color3.fromRGB(0, 0, 0)
game:GetService("Lighting").Brightness = 1
game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(127, 127, 127)

--// studs (texture setup/base from beyond 5d's project)
for _, v in ipairs(game:GetDescendants()) do
    if v:IsA("BasePart") and v.Material == Enum.Material.Plastic and v.TopSurface == Enum.SurfaceType.Studs then
		if not v:FindFirstChildOfClass("Texture") and not v.Parent:FindFirstChild("Humanoid") then
    		local Studs = Instance.new("Texture")
    		Studs.Parent = v
    		Studs.Face = Enum.NormalId.Top
    		Studs.Texture = "rbxassetid://7027211371"
    		Studs.Color3 = Color3.new(v.Color.R * 2, v.Color.G * 2, v.Color.B * 2)
    		Studs.Transparency = v.Transparency
		end
    end
end

wait(0.5)
--settings().Rendering.QualityLevel = 16
