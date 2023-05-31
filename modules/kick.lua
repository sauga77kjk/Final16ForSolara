--// remove new kick
game:GetService("RunService").RenderStepped:Connect(function()
    game:GetService("RunService"):SetRobloxGuiFocused(false)
    for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v.Name == "RobloxPromptGui" and v:FindFirstChild("promptOverlay"):FindFirstChild("ErrorPrompt") then
            v:Destroy()
        end
    end
end)