--// display name remover + bar adder
local function sethiddenproperty2(obj,pro,val)
obj[pro]=val
end
game:GetService("RunService").RenderStepped:Connect(function()
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Character ~= nil then
            if v.Character:FindFirstChild("Humanoid") then
                sethiddenproperty2(v.Character.Humanoid, "HealthDisplayType", Enum.HumanoidHealthDisplayType.AlwaysOn)
            end
        end
    end
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        pcall(function()
            v.Character:WaitForChild("Humanoid").DisplayName = v.Name
        end)
    end
end)
