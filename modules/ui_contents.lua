-- Project PList By Colastee
-- Made possible by using Roblox Corescripts
repeat wait() until game:IsLoaded()
if isfolder("PLIST_Assets") == true then
    delfolder("PLIST_Assets")
end
local SettingsShield = nil
for _,v in pairs(game:GetDescendants()) do
	if v.Name == "SettingsShield" then
		SettingsShield = v
	end
end
task.wait(1)
--Setup
function releasefocus()
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("TextBox") then
            v:ReleaseFocus()
        end
    end
end

-- LEAVEGAMEPAGE START
--[[keypress(0x1B);releasefocus()
wait()
keypress(0x4C);releasefocus()
keypress(0x1B);releasefocus()
keypress(0x1B);releasefocus()
-- LEAVEGAMEPAGE END
task.wait(0.0001)
--START MENU
keypress(0x1B);releasefocus() -- ESC
wait()
keypress(0x09) -- TAB
keypress(0x09)
keypress(0x09)
task.wait(0.0001)
keypress(0x1B);releasefocus() -- ESC
--releasefocus()]]
--END MENU
task.wait(0.0001)
--START CURSOR SUPPORT
game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
task.wait(0.01)
game:GetService("StarterGui"):SetCore("DevConsoleVisible", false)
--END CURSOR SUPPORT
local menucontainer = SettingsShield.MenuContainer
local pageviewinnerframe = menucontainer.PageViewClipper.PageView.PageViewInnerFrame
local settingstab = pageviewinnerframe.Page
local reporttab = pageviewinnerframe.ReportAbusePage
local plrstab = pageviewinnerframe.Players
local shiftlockenabled = false
local actualrobloxui = game.CoreGui:FindFirstChild("RobloxGui")
local config = Instance.new("Folder", game.Players.LocalPlayer)
config.Name = "PLIST_Config"
local DisplayNames = Instance.new("BoolValue", config)
DisplayNames.Name = "DisplayNames"
DisplayNames.Value = false
game:GetService("RunService").RenderStepped:Connect(function()
	actualrobloxui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	menucontainer.HubBar.HubBarContainer.ZIndex = 3
	for _,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
		if v:IsA("GuiObject") and v.Size == UDim2.new(1, 0, 0, 36) and v.Name ~= "TopBarContainerPLIST" or v:IsA("GuiObject") and v.Position.Y.Scale == 0 and v.Position.Y.Offset == 0 and v.Parent:IsA("ScreenGui") and not v.Parent.Parent.Name == "CoreGui" and not v.Parent.Name == "CoreGui" and v.Name ~= "TopBarContainerPLIST" then
			v.Visible = false
		end
	end
    if settingstab.Visible == true then
        menucontainer.PageViewClipper.PageView.CanvasPosition = Vector2.new(0, 0)
        menucontainer.PageViewClipper.PageView.CanvasSize = UDim2.new(0, 0, 0, 0)
    end
end)
game:GetService("RunService").RenderStepped:Connect(function()
	if shiftlockenabled then
		settingstab["Shift Lock SwitchFrame"].ShiftLockOverrideLabel.Text = "Configure with PLIST"
	end
end)
game:GetService("RunService").RenderStepped:Connect(function()

	if reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.Text == "Short Description (Optional)" then
		reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.ClearTextOnFocus = true
		else
		reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.ClearTextOnFocus = false
	end
	reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.Text = reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.Text:gsub("In your own words, help us understand what went wrong.", "Short Description (Optional)")
	reporttab["Experience or Person?Frame"]["Experience or Person?Label"].Text = "Game or Player?"
	reporttab["Experience or Person?Frame"].Selector.Selection1.Text = "Game"
	reporttab["Experience or Person?Frame"].Selector.Selection2.Text = "Player"
	reporttab["Which Person?Frame"]["Which Person?Label"].Text = "Which Player?"
	reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.SubmitButtonButton.ZIndex = 2
	reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.SubmitButtonButton.SubmitButtonTextLabel.ZIndex = 2
	reporttab["In your own words, help us understand what went wrong.Frame"].TextBox.SubmitButtonButton.Position = UDim2.new(0.89, 0,1, 5)
	if reporttab:FindFirstChild("Type Of Abuse?Frame") then
		reporttab:FindFirstChild("Type Of Abuse?Frame")["Type Of Abuse?Label"].ZIndex = 2
	end
end)
function PlayersUIConfiguration()
    for _,v in plrstab:GetChildren() do
	    local target = game.Players:FindFirstChild(v.Name:gsub("PlayerLabel", ""))
		if DisplayNames.Value and v.Name:find("PlayerLabel") and v:FindFirstChild("DisplayNameLabel") and target then
			v.DisplayNameLabel.Text = target.DisplayName
		end
		if not DisplayNames.Value and v.Name:find("PlayerLabel") and v:FindFirstChild("DisplayNameLabel") and target then
			v.DisplayNameLabel.Text = target.Name
		end
        if v.Name:find(game.Players.LocalPlayer.Name) and v.Name:find("PlayerLabel") then
			if game:GetService("GuiService"):GetInspectMenuEnabled() then
				v.RightSideButtons:FindFirstChild("Inspect").Visible = false
			end
            v.NameLabel.Visible = false
            v.DisplayNameLabel.Position = UDim2.new(0, 60, 0.5, 0)
			v.DisplayNameLabel.Size = UDim2.new(0, 0, 0, 0)
			v.DisplayNameLabel.TextWrapped = false
			v.DisplayNameLabel.TextScaled = false
			v.DisplayNameLabel.FontSize = Enum.FontSize.Size24
        end
		if v.Name:find("PlayerLabel") and v.RightSideButtons:FindFirstChild("BlockButton") and v.RightSideButtons:FindFirstChild("ReportPlayer") and v.RightSideButtons:FindFirstChild("FriendStatus") then
			if game:GetService("GuiService"):GetInspectMenuEnabled() then
				v.RightSideButtons:FindFirstChild("Inspect").Visible = false
			end
            v.RightSideButtons:FindFirstChild("BlockButton").Visible = false
            v.RightSideButtons:FindFirstChild("ReportPlayer").Visible = false
            v.NameLabel.Visible = false
            v.DisplayNameLabel.Position = UDim2.new(0, 60, 0.5, 0)
			v.DisplayNameLabel.Size = UDim2.new(0, 0, 0, 0)
			v.DisplayNameLabel.TextWrapped = false
			v.DisplayNameLabel.TextScaled = false
            v.DisplayNameLabel.FontSize = Enum.FontSize.Size24
            v.RightSideButtons.FriendStatus.Size = UDim2.new(0, 200, 0, 46)
        end
    end
end
game:GetService("RunService").RenderStepped:Connect(function()
	PlayersUIConfiguration()
end)
settingstab["Graphics QualityFrame"].Slider.RightButton.Size = UDim2.new(0, 50, 0, 50)
settingstab["Graphics QualityFrame"].Slider.LeftButton.Size = UDim2.new(0, 50, 0, 50)
settingstab["Graphics QualityFrame"].Slider.RightButton.RightButton.Size = UDim2.new(0, 18, 0, 30)
settingstab["Graphics QualityFrame"].Slider.LeftButton.LeftButton.Size = UDim2.new(0, 18, 0, 30)
settingstab["Graphics QualityFrame"].Slider.RightButton.RightButton.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
settingstab["Graphics QualityFrame"].Slider.LeftButton.LeftButton.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
settingstab["VolumeFrame"].Slider.RightButton.Size = UDim2.new(0, 50, 0, 50)
settingstab["VolumeFrame"].Slider.LeftButton.Size = UDim2.new(0, 50, 0, 50)
settingstab["VolumeFrame"].Slider.RightButton.RightButton.Size = UDim2.new(0, 18, 0, 30)
settingstab["VolumeFrame"].Slider.LeftButton.LeftButton.Size = UDim2.new(0, 18, 0, 30)
settingstab["VolumeFrame"].Slider.RightButton.RightButton.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
settingstab["VolumeFrame"].Slider.LeftButton.LeftButton.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
settingstab["Camera SensitivityFrame"].Slider.RightButton.Size = UDim2.new(0, 50, 0, 50)
settingstab["Camera SensitivityFrame"].Slider.LeftButton.Size = UDim2.new(0, 50, 0, 50)
settingstab["Camera SensitivityFrame"].Slider.RightButton.RightButton.Size = UDim2.new(0, 18, 0, 30)
settingstab["Camera SensitivityFrame"].Slider.LeftButton.LeftButton.Size = UDim2.new(0, 18, 0, 30)
settingstab["Camera SensitivityFrame"].Slider.RightButton.RightButton.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
settingstab["Camera SensitivityFrame"].Slider.LeftButton.LeftButton.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
settingstab["Camera SensitivityFrame"].Slider.CameraSensitivityTextBox:Destroy()
settingstab["Camera SensitivityFrame"].Slider.Size = UDim2.new(0.6, 0, 0, 50)
settingstab["Camera SensitivityFrame"].Slider.Position = UDim2.new(1, 0, 0.5, 0)
menucontainer.BottomButtonFrame.LeaveGameButtonButton.LeaveGameButtonTextLabel.Text = "Leave Game"
menucontainer.BottomButtonFrame.ResumeButtonButton.ResumeButtonTextLabel.Text = "Resume Game"
menucontainer.HubBar.Position = UDim2.new(0, 0, 0, 0)
menucontainer.HubBar.Size = UDim2.new(0, 800, 0, 60)
menucontainer.HubBar.HubBarHomeButton:Destroy()
menucontainer.HubBar.HubBarContainer.PlayersTab.Icon.Title.Text = "Players"
menucontainer.HubBar.HubBarContainer.Size = UDim2.new(1, 0, 1, 0)
menucontainer.HubBar.HubBarContainer.Position = UDim2.new(0, 0, 0, 0)

menucontainer.HubBar.HubBarContainer.GameSettingsTab.Icon.AspectRatioConstraint.AspectRatio = 1.1
menucontainer.HubBar.HubBarContainer.GameSettingsTab.Icon.Position = UDim2.new(0, 10, 0.5, -24)
menucontainer.HubBar.HubBarContainer.GameSettingsTab.Icon.Size = UDim2.new(0, 54, 0, 48)

menucontainer.HubBar.HubBarContainer.PlayersTab.Icon.AspectRatioConstraint.AspectRatio = 1.1
menucontainer.HubBar.HubBarContainer.PlayersTab.Icon.Position = UDim2.new(0, 55, 0.5, 20)
menucontainer.HubBar.HubBarContainer.PlayersTab.Icon.Size = UDim2.new(0, 54, 0, -38)

menucontainer.HubBar.HubBarContainer.ReportAbuseTab.Icon.AspectRatioConstraint.AspectRatio = 0.95
menucontainer.HubBar.HubBarContainer.ReportAbuseTab.Icon.Position = UDim2.new(0, 10, 0.5, -24)
menucontainer.HubBar.HubBarContainer.ReportAbuseTab.Icon.Size = UDim2.new(0, 54, 0, 48)

menucontainer.HubBar.HubBarContainer.HelpTab.Icon.AspectRatioConstraint.AspectRatio = 1
menucontainer.HubBar.HubBarContainer.HelpTab.Icon.Position = UDim2.new(0, 10, 0.5, -24)
menucontainer.HubBar.HubBarContainer.HelpTab.Icon.Size = UDim2.new(0, 54, 0, 48)

reporttab["Reason for Abuse?Frame"].DropDownFrameButton.DropDownFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Center
reporttab["Which Person?Frame"].DropDownFrameButton.DropDownFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Center
reporttab:FindFirstChild("Type Of Abuse?Frame").DropDownFrameButton.DropDownFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Center
pageviewinnerframe.Players.ImageButton:Destroy()
pageviewinnerframe.LeaveGamePage.LeaveGameText.Text = "Are you sure you want to leave the game?"
function firstperson()
	if game.Players.LocalPlayer.Character:FindFirstChild("Head") then
		game.Players.LocalPlayer.Character.Head.LocalTransparencyModifier = math.floor(game.Players.LocalPlayer.Character.Head.LocalTransparencyModifier)
		if game.Players.LocalPlayer.Character.Head.LocalTransparencyModifier > 0.0000001 then
			return true
		elseif game.Players.LocalPlayer.Character.Head.LocalTransparencyModifier < 0.0000001 then
			return false
		end
	else
		return false
	end
end
local p = {}
local typing = false
local shiftreplicaENABLED = Instance.new("BoolValue", config)
shiftreplicaENABLED.Value = true
shiftreplicaENABLED.Name = "shiftreplicaENABLED"
game.CoreGui.DevConsoleMaster.IgnoreGuiInset = true
local RobloxGuii = Instance.new("ScreenGui", game.CoreGui)
RobloxGuii.Name = "16UI"
RobloxGuii.ResetOnSpawn = false
RobloxGuii.DisplayOrder = 9999

local TopBarContainer = game.CoreGui:WaitForChild("TopBarApp").TopBarFrame
local nameFORLOGO = "LOGOOO"..math.random(3, 7)
local nameFORPLAYERTAB = "PLRTABB"..math.random(8, 11)
makefolder("PLIST_Assets")
writefile("PLIST_Assets\\"..nameFORPLAYERTAB..".png", game:HttpGet("https://raw.githubusercontent.com/mrlifeflam/Project-PList/main/Assets/PlayersTabIcon.png"))
writefile("PLIST_Assets\\Loaded.mp3", game:HttpGet("https://raw.githubusercontent.com/mrlifeflam/Project-PList/main/Assets/Loaded.mp3"))
writefile("PLIST_Assets\\uuhhh.mp3", game:HttpGet("https://raw.githubusercontent.com/mrlifeflam/Project-PList/main/Assets/uuhhh.mp3"))
writefile("PLIST_Assets\\metalstone2.mp3", game:HttpGet("https://raw.githubusercontent.com/mrlifeflam/Project-PList/main/Assets/metalstone2.mp3"))
writefile("PLIST_Assets\\"..nameFORLOGO..".png", game:HttpGet("https://raw.githubusercontent.com/mrlifeflam/Project-PList/main/Assets/PLIST.png"))
local badmouse = true
if not game:IsLoaded() then
    game.Loaded:Wait()
end
--menucontainer.HubBar.HubBarContainer.PlayersTab.Icon.Image = getcustomasset("PLIST_Assets\\"..nameFORPLAYERTAB..".png")
local runserv = game:GetService("RunService")
local RenderStepped = runserv.RenderStepped
local playerlist = Instance.new("ScreenGui")
local PlayerListContainer = Instance.new("Frame")
local ScrollList = Instance.new("ScrollingFrame")
local PopupClipFrame = Instance.new("Frame")
local You = Instance.new("Frame")
local BGFrame = Instance.new("TextButton")
local MembershipIcon = Instance.new("ImageLabel")
local PlayerName = Instance.new("TextLabel")
local NameHealthContainer = Instance.new("TextButton")
local Username = Instance.new("TextLabel")
local HealthContainer = Instance.new("Frame")
local HealthFill = Instance.new("Frame")

NameHealthContainer.Name = "NameHealthContainer"
NameHealthContainer.BackgroundTransparency = 1
NameHealthContainer.Text = ""
NameHealthContainer.Size = UDim2.new(0, 170, 0, 40)
NameHealthContainer.Active = false
--0, 75, 0, 23
Username.Name = "Username"
Username.Parent = NameHealthContainer
Username.BackgroundTransparency = 1
Username.Position = UDim2.new(0, 7, 0, 0)
Username.Size = UDim2.new(1, -14, 0, 22)
Username.Font = Enum.Font.SourceSansBold
Username.Text = "Player1"
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 14.000
Username.ZIndex = 9999
Username.TextXAlignment = Enum.TextXAlignment.Left
Username.TextYAlignment = Enum.TextYAlignment.Bottom
Username.Active = false

HealthContainer.Name = "HealthContainer"
HealthContainer.Parent = NameHealthContainer
HealthContainer.BackgroundColor3 = Color3.fromRGB(228, 236, 246)
HealthContainer.BorderSizePixel = 0
HealthContainer.Position = UDim2.new(0, 7, 1, -11)
HealthContainer.Size = UDim2.new(1, -14, 0, 3.5)
HealthContainer.Active = false

HealthFill.Name = "HealthFill"
HealthFill.Parent = HealthContainer
HealthFill.BackgroundColor3 = Color3.fromRGB(27, 252, 107)
HealthFill.BorderSizePixel = 0
HealthFill.Size = UDim2.new(1, 0, 1, 0)
HealthFill.Active = false


local function JWFFKU_fake_script() 
	local script = Instance.new('LocalScript', Username)

	local player = game.Players.LocalPlayer
	game:GetService("RunService").RenderStepped:Connect(function()
        if DisplayNames.Value then
		    script.Parent.Text = player.DisplayName
        else
		    script.Parent.Text = player.Name
        end
	end)
end

coroutine.wrap(JWFFKU_fake_script)()
local function VWPK_fake_script()
	local script = Instance.new('LocalScript', NameHealthContainer)

	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health,false)
	local player = game.Players.LocalPlayer
	local char = player.Character
	local gui = script.Parent
	local frame = gui.HealthContainer
	local bar = frame.HealthFill
	RenderStepped:Connect(function()
		bar.Size = UDim2.new(0,(game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health / game.Players.LocalPlayer.Character:WaitForChild("Humanoid").MaxHealth * 160),1,0)
		spawn(function() 
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health < game.Players.LocalPlayer.Character.Humanoid.MaxHealth and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth/2 then
				bar.BackgroundColor3 = Color3.new(1-(game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth)+0.5,1,0)
			else
				bar.BackgroundColor3 = Color3.fromRGB(27, 252, 107)
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health == game.Players.LocalPlayer.Character.Humanoid.MaxHealth/2 then
				bar.BackgroundColor3 = Color3.new(1,1,0)
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health < game.Players.LocalPlayer.Character.Humanoid.MaxHealth/2 then
				bar.BackgroundColor3 = Color3.new(1,(game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth)*2,0)
			end 
		end)
	end)
end
coroutine.wrap(VWPK_fake_script)()

local tbar = game:GetService("CoreGui"):WaitForChild("TopBarApp").TopBarFrame
local chatico = tbar.LeftFrame.ChatIcon.Background.Icon
local chaet = tbar.LeftFrame.ChatIcon.Background
local UIS = game:GetService("UserInputService")
if tbar.RightFrame:FindFirstChild("HealthBar") then
tbar.RightFrame.HealthBar:Destroy()
end
--[[
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Chat") then
	game:GetService("RunService").RenderStepped:Connect(function()
		if game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar:IsFocused() then
			game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.BackgroundTransparency = 0.1
		else
			game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.BackgroundTransparency = game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.BackgroundTransparency
		end
	end)
end
]]
game:GetService("RunService").RenderStepped:Connect(function()
--tbar.Transparency = 0.5
tbar.BorderSizePixel = 0
tbar.BackgroundColor3 = Color3.fromRGB(31, 31, 31)

tbar.LeftFrame.ChatIcon.Background.StateOverlay.Image = ""
tbar.LeftFrame.MenuIcon.Background.StateOverlay.Image = ""

tbar.LeftFrame.MenuIcon.Background.Image = ""
tbar.LeftFrame.ChatIcon.Background.Image = ""

tbar.LeftFrame.Position = UDim2.new(0, 0, 0, 2)
tbar.LeftFrame.Size = UDim2.new(0, 0, 0, 36)

tbar.LeftFrame.MenuIcon.Position = UDim2.new(0, 0, 0, 0)
tbar.LeftFrame.MenuIcon.Size = UDim2.new(0, 50, 0, 36)
tbar.LeftFrame.MenuIcon.Background.Icon.Position = UDim2.new(0, 25, 0, 12)
tbar.LeftFrame.MenuIcon.Background.Icon.Size = UDim2.new(0, 32, 0, 25)

game.CoreGui:WaitForChild("TopBarApp").LegacyCloseMenu.CloseMenuButton.Position = UDim2.new(0, -8, 0, 18)
game.CoreGui:WaitForChild("TopBarApp").LegacyCloseMenu.CloseMenuButton.Size = UDim2.new(0, 32, 0, 25)

tbar.LeftFrame.ChatIcon.Position = UDim2.new(0, 0, 0, 0)
tbar.LeftFrame.ChatIcon.Size = UDim2.new(0, 50, 0, 36)
tbar.LeftFrame.ChatIcon.Background.Icon.Position = UDim2.new(0, 14, 0, 13)
tbar.LeftFrame.ChatIcon.Background.Icon.Size = UDim2.new(0, 28, 0, 27)



tbar.LeftFrame.MenuIcon.Background.Icon.Image = "rbxasset://textures/ui/Menu/Hamburger.png"

end)

if chatico.Image == "rbxasset://textures/ui/TopBar/chatOff.png" then
    chatico.Image = "rbxasset://textures/ui/Chat/Chat@2x.png"
elseif chatico.Image == "rbxasset://textures/ui/TopBar/chatOn.png" then
    chatico.Image = "rbxasset://textures/ui/Chat/ChatDown@2x.png"
end

local function changechatico()
    if chatico.Image == "rbxasset://textures/ui/TopBar/chatOff.png" then
        chatico.Image = "rbxasset://textures/ui/Chat/Chat@2x.png"
    elseif chatico.Image == "rbxasset://textures/ui/TopBar/chatOn.png" then
        chatico.Image = "rbxasset://textures/ui/Chat/ChatDown@2x.png"
    end		
end
game:GetService("RunService").RenderStepped:Connect(function()
changechatico()
end)

game:GetService("CoreGui"):WaitForChild("TopBarApp").TopBarFrame.RightFrame.MoreMenu.Visible = false
game:GetService("CoreGui"):WaitForChild("TopBarApp").TopBarFrame.RightFrame.Position = UDim2.new(1, -4, 0, 0)


for _,v in pairs(game:GetDescendants()) do
    if v:IsA("TextLabel") and v.Text == "Chat '/?' or '/help' for a list of chat commands." then
        v.Text = "Please chat '/?' for a list of commands"
    end
end
game:GetService("RunService").RenderStepped:Connect(function()
    tbar.LeftFrame.MenuIcon.Background.StateOverlay.Image = ""
    game.CoreGui:WaitForChild("TopBarApp").LegacyCloseMenu.CloseMenuButton.Image = "rbxasset://textures/ui/Menu/HamburgerDown.png"
    game.CoreGui:WaitForChild("TopBarApp").LegacyCloseMenu.CloseMenuButton.ImageRectOffset = Vector2.new(0, 0)
    game.CoreGui:WaitForChild("TopBarApp").LegacyCloseMenu.CloseMenuButton.ImageRectSize = Vector2.new(0, 0)
    if tbar.RightFrame:FindFirstChild("MoreMenu") then
        tbar.RightFrame.MoreMenu:Destroy()
    end
    if tbar.LeftFrame.ChatIcon:FindFirstChild("BadgeContainer") and game.TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
		if tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge") then
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ImageRectOffset = Vector2.new(0, 0)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ImageRectSize = Vector2.new(0, 0)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner:ClearAllChildren()
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Position = UDim2.new(0, 15, 0, -3)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Size = UDim2.new(0, 23, 0, 24)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ScaleType = Enum.ScaleType.Fit
			if tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge"):FindFirstChild("Background") then
				tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Background:Destroy()
			end
        end
    elseif tbar.LeftFrame.ChatIcon:FindFirstChild("BadgeContainer") and game.TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        if tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge") then
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ImageRectOffset = Vector2.new(0, 0)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ImageRectSize = Vector2.new(0, 0)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.Size = UDim2.new(1, 5, 1, 5)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.Position = UDim2.new(0.5, 0, 0.6, 0)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner:ClearAllChildren()
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Position = UDim2.new(0, 15, 0, 2)
			tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ScaleType = Enum.ScaleType.Fit
			if tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge"):FindFirstChild("Background") then
				tbar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Background:Destroy()
			end
        end
    end
end)
local mouseh = nil
local shiftreplica = false
if badmouse == true then
mouseh = Instance.new("ImageLabel")
local uis = game:GetService("UserInputService")
local mh = game.Players.LocalPlayer:GetMouse()
game.CoreGui.DevConsoleMaster.IgnoreGuiInset = true
mouseh.Name = "MouseH"
mouseh.Parent = game.CoreGui.DevConsoleMaster
mouseh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mouseh.BackgroundTransparency = 1.000
mouseh.Position = UDim2.new(0, 0, 0, 0)
mouseh.Visible = true
mouseh.ZIndex = 9999999
mouseh.Active = false
mouseh.Image = 'rbxasset://textures/ArrowFarCursor.png'
game:GetService("RunService").RenderStepped:Connect(function()
    if uis:GetFocusedTextBox() == true then
        typing = true
    else
        typing = false
    end
end)
local othericon = false
local clickdecicon = false
game:GetService("RunService").RenderStepped:Connect(function()
	if shiftreplica == false then
		mouseh.Size = UDim2.new(0, 64, 0, 64)
	else
		mouseh.Image = "rbxasset://textures/MouseLockedCursor.png"
		mouseh.Size = UDim2.new(0, 37, 0, 37)
	end
	if clickdecicon then
		mouseh.Size = UDim2.new(0, 85, 0, 85)
	end
	mouseh.Position = UDim2.new(0, mh.X - 32, 0, mh.Y + 2.9)
	uis.MouseIconEnabled = false
	uis.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	mh.Icon = "rbxassetid://000001"
end)
for _,v in pairs(game:GetDescendants()) do
    if v:IsA("TextLabel") and v.Text == "Chat '/?' or '/help' for a list of chat commands." then
        v.Text = "Please chat '/?' for a list of commands"
    end
    if v:IsA("TextLabel") and v.Name == "BubbleText" then
        v.Font = Enum.Font.Legacy
        v.TextSize = 13
    end
    if v:IsA("GuiObject") then
        if v.Name ~= "MouseH" and othericon == false and clickdecicon == false then
			v.MouseEnter:Connect(function()
				if not othericon and not clickdecicon then
					mouseh.Image = "rbxasset://textures/ArrowCursor.png"
				end
			end)
			v.MouseLeave:Connect(function()
				mouseh.Image = 'rbxasset://textures/ArrowFarCursor.png'
			end)
        end
    end
	--[[
	if v:IsA("TextBox") then
		v.MouseEnter:Connect(function()
			othericon = true
			mouseh.Image = "rbxasset://textures/IBeamCursor.png"
		end)
		v.MouseLeave:Connect(function()
			othericon = false
			mouseh.Image = 'rbxasset://textures/ArrowFarCursor.png'
		end)
	end
	]]
	if v and v:FindFirstChildOfClass("ClickDetector") then
		v:FindFirstChildOfClass("ClickDetector").MouseHoverEnter:Connect(function()
			if v:FindFirstChildOfClass("ClickDetector").CursorIcon == "" and othericon == false then
				clickdecicon = true
				mouseh.Image = "rbxasset://textures/DragCursor.png"
			elseif v:FindFirstChildOfClass("ClickDetector").CursorIcon ~= "" and othericon == false then
				clickdecicon = true
				mouseh.Image = v:FindFirstChildOfClass("ClickDetector").CursorIcon
			end
		end)
		v:FindFirstChildOfClass("ClickDetector").MouseHoverLeave:Connect(function()
			clickdecicon = false
			mouseh.Image = 'rbxasset://textures/ArrowFarCursor.png'
		end)
	end
end
game.DescendantAdded:Connect(function(v)
    if v:IsA("GuiObject") then
        if v.Name ~= "MouseH" and othericon == false and clickdecicon == false then
			v.MouseEnter:Connect(function()
				if not othericon and not clickdecicon then
					mouseh.Image = "rbxasset://textures/ArrowCursor.png"
				end
			end)
			v.MouseLeave:Connect(function()
				mouseh.Image = 'rbxasset://textures/ArrowFarCursor.png'
			end)
        end
    end
	if v and v:FindFirstChildOfClass("ClickDetector") then
		v:FindFirstChildOfClass("ClickDetector").MouseHoverEnter:Connect(function()
			if v:FindFirstChildOfClass("ClickDetector").CursorIcon == "" and othericon == false then
				clickdecicon = true
				mouseh.Image = "rbxasset://textures/DragCursor.png"
			elseif v:FindFirstChildOfClass("ClickDetector").CursorIcon ~= "" and othericon == false then
				clickdecicon = true
				mouseh.Image = v:FindFirstChildOfClass("ClickDetector").CursorIcon
			end
		end)
		v:FindFirstChildOfClass("ClickDetector").MouseHoverLeave:Connect(function()
			clickdecicon = false
			mouseh.Image = 'rbxasset://textures/ArrowFarCursor.png'
		end)
	end
    if v.Name == "BubbleText" then
        v.Font = Enum.Font.Legacy
        v.TextSize = 13
    end
end)
end
local backpackicon = tbar.LeftFrame.MenuIcon:Clone()
backpackicon.Parent = tbar
backpackicon.Position = UDim2.new(0, 105, 0, -2)
backpackicon.Name = "BackpackIcon"
backpackicon.Size = UDim2.new(0, 25, 0, 36)
backpackicon.Background.ImageTransparency = 1
backpackicon.Background.Icon.Size = UDim2.new(0, 23, 0, 27)
backpackicon.Background.Icon.Image = "rbxasset://textures/ui/Backpack/Backpack@2x.png"
game:GetService("RunService").RenderStepped:Connect(function()
    if game.CoreGui.RobloxGui.Backpack.Inventory.Visible == true then
        backpackicon.Background.Icon.Image = "rbxasset://textures/ui/Backpack/Backpack_Down@2x.png"
        else
        backpackicon.Background.Icon.Image = "rbxasset://textures/ui/Backpack/Backpack@2x.png"
    end
	backpackicon.Visible = game.StarterGui:GetCoreGuiEnabled("Backpack")
end)
--[[
gave up on this crap bc just realized that even when you make the backpack properties visible it still thinks that it doesnt have inventory opened.
local bp = game.CoreGui.RobloxGui.Backpack
local count = 0
local count2 = 0
function repos(state)
    local count = 0
    local count2 = 0
    for _,v in pairs(bp.Hotbar:GetChildren()) do
        v.Position = UDim2.new(0, 0, 0, 5)
    end
    if state == true then
        bp.Inventory.Visible = true
        for _,v in pairs(bp.Hotbar:GetChildren()) do
            count = count + 1
            if count == 1 then
                v.Position = UDim2.new(0, 5, 0, 5)
            end
            if count ~= 1 then
                count2 = count2 + 65
                v.Position = v.Position + UDim2.new(0, count2, 0, 0)
                v.Visible = true
            end
        end
    end
end
backpackicon.Background.MouseButton1Down:Connect(function()
    if bptog == false and game.CoreGui.RobloxGui.Backpack.Inventory.Visible == false then
        repos(true)
    elseif bptog == false and game.CoreGui.RobloxGui.Backpack.Inventory.Visible == false then
        repos(false)
    end
end)
for the next pile of code i will just add something to let users know that the backpack icon does NOT work when you click it!
]]
local bptog = false
local tss = game:GetService("TweenService")
backpackicon.Background.MouseButton1Down:Connect(function()
    if bptog == false  then
        bptog = true
        print("Press ~ to open inventory!!11")
        local g = {ImageColor3 = Color3.fromRGB(255, 0, 0)}
        local g2 = {ImageColor3 = Color3.fromRGB(255, 255, 255)}
        local redthing = tss:Create(backpackicon.Background.Icon, TweenInfo.new(0.3), g)
        redthing:Play()
        wait(1)
        local normal = tss:Create(backpackicon.Background.Icon, TweenInfo.new(0.3), g2)
        normal:Play()
        wait(0.2)
        bptog = false
    end
end)

-- RobloxGui/Modules/PlayerDropDown

local moduleApiTable = {}

--[[ Services ]]--
local PlayersService = game:GetService('Players')
local LocalPlayer = PlayersService.LocalPlayer
while not LocalPlayer do
	PlayersService.PlayerAdded:wait()
	LocalPlayer = PlayersService.LocalPlayer
end
local CoreGui = LocalPlayer.PlayerGui
local HttpService = game:GetService('HttpService')
local HttpRbxApiService = game:GetService('HttpRbxApiService')
local StarterGui = game:GetService("StarterGui")


--[[ Constants ]]--
local POPUP_ENTRY_SIZE_Y = 24
local ENTRY_PAD = 2
local BG_TRANSPARENCY = 0.5
local BG_COLOR = Color3.new(31/255, 31/255, 31/255)
local TEXT_STROKE_TRANSPARENCY = 0.75
local TEXT_COLOR = Color3.new(1, 1, 243/255)
local TEXT_STROKE_COLOR = Color3.new(34/255, 34/255, 34/255)
local MAX_FRIEND_COUNT = 200
local FRIEND_IMAGE = 'https://www.roblox.com/thumbs/avatar.ashx?userId='

local GET_BLOCKED_USERIDS_TIMEOUT = 5

--[[ Modules ]]--
local RobloxGui = RobloxGuii

--[[ Remotes ]]--
local RemoteEvent_NewFollower = Instance.new("RemoteEvent", script)
RemoteEvent_NewFollower.Name = "NewFollower"

--[[ Utility Functions ]]--
local function createSignal()
	local sig = {}

	local mSignaler = Instance.new('BindableEvent')

	local mArgData = nil
	local mArgDataCount = nil

	function sig:fire(...)
		mArgData = {...}
		mArgDataCount = select('#', ...)
		mSignaler:Fire()
	end

	function sig:connect(f)
		if not f then error("connect(nil)", 2) end
		return mSignaler.Event:connect(function()
			f(unpack(mArgData, 1, mArgDataCount))
		end)
	end

	function sig:wait()
		mSignaler.Event:wait()
		assert(mArgData, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		return unpack(mArgData, 1, mArgDataCount)
	end

	return sig
end

--[[ Events ]]--
local BlockStatusChanged = createSignal()
local MuteStatusChanged = createSignal()



local function getFriendCountAsync(userId)
	local friendCount = nil
	local wasSuccess, result = pcall(function()
		local str = 'user/get-friendship-count'
		if userId then
			str = str..'?userId='..tostring(userId)
		end
		return HttpRbxApiService:GetAsync(str)
	end)
		result = HttpService:JSONDecode(result)

	if result["success"] and result["count"] then
		friendCount = result["count"]
	end

	return friendCount
end

-- checks if we can send a friend request. Right now the only way we
-- can't is if one of the players is at the max friend limit
local function canSendFriendRequestAsync(otherPlayer)
	local theirFriendCount = getFriendCountAsync(otherPlayer.UserId)
	local myFriendCount = getFriendCountAsync()

	-- assume max friends if web call fails
	if not myFriendCount or not theirFriendCount then
		return false
	end
	if myFriendCount < MAX_FRIEND_COUNT and theirFriendCount < MAX_FRIEND_COUNT then
		return true
	elseif myFriendCount >= MAX_FRIEND_COUNT then
		return false
	elseif theirFriendCount >= MAX_FRIEND_COUNT then
		return false
	end
end

--[[ Follower Functions ]]--

-- Returns whether followerUserId is following userId
local function isFollowing(userId, followerUserId)
    return nil
end

--[[ Functions for Blocking users ]]--
local BlockedList = {}
local MutedList = {}

local function GetBlockedPlayersAsync()
	local userId = LocalPlayer.UserId
	local apiPath = "userblock/getblockedusers" .. "?" .. "userId=" .. tostring(userId) .. "&" .. "page=" .. "1"
	if userId > 0 then
		local blockList = nil
		local success, msg = pcall(function()
			local request = HttpRbxApiService:GetAsync(apiPath)
			blockList = request and game:GetService('HttpService'):JSONDecode(request)
		end)
		if blockList and blockList['success'] == true and blockList['userList'] then
			local returnList = {}
			for i, v in pairs(blockList['userList']) do
				returnList[v] = true
			end
			return returnList
		end
	end
	return {}
end
table.insert(p, "Pro")

spawn(function()
	BlockedList = GetBlockedPlayersAsync()
	GetBlockedPlayersCompleted = true
end)

local function getBlockedUserIdsFromBlockedList()
	local userIdList = {}
	for userId, _ in pairs(BlockedList) do
		table.insert(userIdList, userId)
	end
	return userIdList
end

local function getBlockedUserIds()
	if LocalPlayer.UserId > 0 then
		local timeWaited = 0
		while true do
			if GetBlockedPlayersCompleted then
				return getBlockedUserIdsFromBlockedList()
			end
			timeWaited = timeWaited + wait()
			if timeWaited > GET_BLOCKED_USERIDS_TIMEOUT then
				return {}
			end
		end
	end
	return {}
end

local function isBlocked(userId)
	if (BlockedList[userId]) then
		return true
	end
	return false
end

local function isMuted(userId)
	if (MutedList[userId] ~= nil and MutedList[userId] == true) then
		return true
	end
	return false
end

local function BlockPlayerAsync(playerToBlock)
	if playerToBlock and LocalPlayer ~= playerToBlock then
		local blockUserId = playerToBlock.UserId
		if blockUserId > 0 then
			if not isBlocked(blockUserId) then
				BlockedList[blockUserId] = true
				BlockStatusChanged:fire(blockUserId, true)
				local success, wasBlocked = pcall(function()
					local playerBlocked = LocalPlayer:BlockUser(playerToBlock)
					return playerBlocked
				end)
				return success and wasBlocked
			else
				return true
			end
		end
	end
	return false
end

local function UnblockPlayerAsync(playerToUnblock)
	if playerToUnblock then
		local unblockUserId = playerToUnblock.UserId

		if isBlocked(unblockUserId) then
			BlockedList[unblockUserId] = nil
			BlockStatusChanged:fire(unblockUserId, false)
			local success, wasUnBlocked = pcall(function()
				local playerUnblocked = LocalPlayer:UnblockUser(playerToUnblock)
				return playerUnblocked
			end)
			return success and wasUnBlocked
		else
			return true
		end
	end
	return false
end

local function MutePlayer(playerToMute)
	if playerToMute and LocalPlayer ~= playerToMute then
		local muteUserId = playerToMute.UserId
		if muteUserId > 0 then
			if not isMuted(muteUserId) then
				MutedList[muteUserId] = true
				MuteStatusChanged:fire(muteUserId, true)
			end
		end
	end
end

local function UnmutePlayer(playerToUnmute)
	if playerToUnmute then
		local unmuteUserId = playerToUnmute.UserId
		MutedList[unmuteUserId] = nil
		MuteStatusChanged:fire(unmuteUserId, false)
	end
end

--[[ Function to create DropDown class ]]--
function createPlayerDropDown()
	local playerDropDown = {}
	playerDropDown.Player = nil
	playerDropDown.PopupFrame = nil
	playerDropDown.HidePopupImmediately = false
	playerDropDown.PopupFrameOffScreenPosition = nil -- if this is set the popup frame tweens to a different offscreen position than the default

	playerDropDown.HiddenSignal = createSignal()

	--[[ Functions for when options in the dropdown are pressed ]]--
	local function onFriendButtonPressed()
		if playerDropDown.Player then
			local status = getFriendStatus(playerDropDown.Player)
			if status == Enum.FriendStatus.Friend then
                game.StarterGui:SetCore("PromptUnfriend", playerDropDown.Player)
                spawn(function()
                    game.CoreGui.RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Down:Connect(function()
				        game.Players.LocalPlayer:RevokeFriendship(playerDropDown.Player)
                    end)
                end)
            elseif status == Enum.FriendStatus.Unknown or status == Enum.FriendStatus.NotFriend then
				-- cache and spawn
				local cachedLastSelectedPlayer = playerDropDown.Player
					if cachedLastSelectedPlayer and cachedLastSelectedPlayer.Parent == PlayersService then
				        game.StarterGui:SetCore("PromptSendFriendRequest", cachedLastSelectedPlayer)
                        spawn(function()
                            game.CoreGui.RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Down:Connect(function()
                                game.Players.LocalPlayer:RequestFriendship(cachedLastSelectedPlayer)
                            end)
                        end)
                    end
			elseif status == Enum.FriendStatus.FriendRequestSent then
                game.StarterGui:SetCore("PromptUnfriend", playerDropDown.Player)
                spawn(function()
                    game.CoreGui.RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Down:Connect(function()
				        game.Players.LocalPlayer:RevokeFriendship(playerDropDown.Player)
                    end)
                end)
			elseif status == Enum.FriendStatus.FriendRequestReceived then
				game.StarterGui:SetCore("PromptSendFriendRequest", playerDropDown.Player)
                spawn(function()
                    game.CoreGui.RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Down:Connect(function()
                        game.Players.LocalPlayer:RequestFriendship(playerDropDown.Player)
                    end)
                end)
    		end

			playerDropDown:Hide()
		end
	end

	local function onDeclineFriendButonPressed()
		if playerDropDown.Player then
			game.StarterGui:SetCore("PromptUnfriend", playerDropDown.Player)
            spawn(function()
                game.CoreGui.RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Down:Connect(function()
				    game.Players.LocalPlayer:RevokeFriendship(playerDropDown.Player)
                end)
            end)
			playerDropDown:Hide()
		end
	end

	-- Client unfollows followedUserId
	local function onUnfollowButtonPressed()
		if not playerDropDown.Player then return end
		--
		local apiPath = "user/unfollow"
		local params = "followedUserId="..tostring(playerDropDown.Player.UserId)
		local success, result = pcall(function()
			return HttpRbxApiService:PostAsync(apiPath, params, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationUrlEncoded)
		end)
		if not success then
			playerDropDown:Hide()
			return
		end

		result = HttpService:JSONDecode(result)
		if result["success"] then
			if RemoteEvent_NewFollower then
				RemoteEvent_NewFollower:FireServer(playerDropDown.Player, false)
			end
			moduleApiTable.FollowerStatusChanged:fire()
		end

		playerDropDown:Hide()
		-- no need to send notification when someone unfollows
	end

	local function onBlockButtonPressed()
		if playerDropDown.Player then
            local cachedPlayer = playerDropDown.Player
            game.StarterGui:SetCore("PromptBlockPlayer", cachedPlayer)
			spawn(function()
                game.CoreGui.RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Down:Connect(function()
				    BlockPlayerAsync(cachedPlayer)
                end)
			end)
			playerDropDown:Hide()
		end
	end

	local function onUnblockButtonPressed()
		if playerDropDown.Player then
			local cachedPlayer = playerDropDown.Player
            game.StarterGui:SetCore("PromptUnblockPlayer", cachedPlayer)
			spawn(function()
                game.CoreGui.RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Down:Connect(function()
				    UnblockPlayerAsync(cachedPlayer)
                end)
			end)
			playerDropDown:Hide()
		end
	end

	local function onReportButtonPressed()
		if playerDropDown.Player then
			playerDropDown:Hide()
            keypress(0x1B)
            wait()
            keypress(0x09)
            keypress(0x09)
		end
	end

	-- Client follows followedUserId
	local function onFollowButtonPressed()
		if not playerDropDown.Player then return end
		--
		local followedUserId = tostring(playerDropDown.Player.UserId)
		local apiPath = "user/follow"
		local params = "followedUserId="..followedUserId
		local success, result = pcall(function()
			return HttpRbxApiService:PostAsync(apiPath, params, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationUrlEncoded)
		end)
		if not success then
			playerDropDown:Hide()
			return
		end

		result = HttpService:JSONDecode(result)
		if result["success"] then
			if RemoteEvent_NewFollower then
				RemoteEvent_NewFollower:FireServer(playerDropDown.Player, true)
			end
			moduleApiTable.FollowerStatusChanged:fire()
		end

		playerDropDown:Hide()
	end

	local function createPopupFrame(buttons)
		local frame = Instance.new('Frame')
		frame.Name = "PopupFrame"
		frame.Size = UDim2.new(1, 0, 0, (POPUP_ENTRY_SIZE_Y * #buttons) + (#buttons - ENTRY_PAD))
		frame.Position = UDim2.new(1, 1, 0, 0)
		frame.BackgroundTransparency = 1

		for i,button in ipairs(buttons) do
			local btn = Instance.new('TextButton')
			btn.Name = button.Name
			btn.Size = UDim2.new(1, 0, 0, POPUP_ENTRY_SIZE_Y)
			btn.Position = UDim2.new(0, 0, 0, POPUP_ENTRY_SIZE_Y * (i - 1) + ((i - 1) * ENTRY_PAD))
			btn.BackgroundTransparency = BG_TRANSPARENCY
			btn.BackgroundColor3 = BG_COLOR
			btn.BorderSizePixel = 0
			btn.Text = button.Text
			btn.Font = Enum.Font.SourceSans
			btn.FontSize = Enum.FontSize.Size14
			btn.TextColor3 = TEXT_COLOR
			btn.TextStrokeTransparency = TEXT_STROKE_TRANSPARENCY
			btn.TextStrokeColor3 = TEXT_STROKE_COLOR
			btn.AutoButtonColor = true
			btn.Parent = frame

			btn.MouseButton1Click:connect(button.OnPress)
		end

		return frame
	end

	--[[ PlayerDropDown Functions ]]--
	function playerDropDown:Hide()
		if playerDropDown.PopupFrame then
			local offscreenPosition = (playerDropDown.PopupFrameOffScreenPosition ~= nil and playerDropDown.PopupFrameOffScreenPosition or UDim2.new(1, 1, 0, playerDropDown.PopupFrame.Position.Y.Offset))
			if not playerDropDown.HidePopupImmediately then
				playerDropDown.PopupFrame:TweenPosition(offscreenPosition, Enum.EasingDirection.InOut,
					Enum.EasingStyle.Quad, 0.15, true, function()
						if playerDropDown.PopupFrame then
							playerDropDown.PopupFrame:Destroy()
							playerDropDown.PopupFrame = nil
						end
					end)
			else
				playerDropDown.PopupFrame:Destroy()
				playerDropDown.PopupFrame = nil
			end
		end
		if playerDropDown.Player then
			playerDropDown.Player = nil
		end
		playerDropDown.HiddenSignal:fire()
	end

	function playerDropDown:CreatePopup(Player)
		playerDropDown.Player = Player

		local buttons = {}

		local status = getFriendStatus(playerDropDown.Player)
		local friendText = ""
		local canDeclineFriend = false
		if status == Enum.FriendStatus.Friend then
			friendText = "Unfriend Player"
		elseif status == Enum.FriendStatus.Unknown or status == Enum.FriendStatus.NotFriend then
			friendText = "Send Friend Request"
		elseif status == Enum.FriendStatus.FriendRequestSent then
			friendText = "Revoke Friend Request"
		elseif status == Enum.FriendStatus.FriendRequestReceived then
			friendText = "Accept Friend Request"
			canDeclineFriend = true
		end

		local blocked = isBlocked(playerDropDown.Player.UserId)

		if not blocked then
			table.insert(buttons, {
				Name = "FriendButton",
				Text = friendText,
				OnPress = onFriendButtonPressed,
			})
		end

		if canDeclineFriend and not blocked then
			table.insert(buttons, {
				Name = "DeclineFriend",
				Text = "Decline Friend Request",
				OnPress = onDeclineFriendButonPressed,
			})
		end
		-- following status
		local following = isFollowing(playerDropDown.Player.UserId, LocalPlayer.UserId)
		local followerText = following and "Unfollow Player" or "Follow Player"

		if not blocked then
			table.insert(buttons, {
				Name = "FollowerButton",
				Text = followerText,
				OnPress = following and onUnfollowButtonPressed or onFollowButtonPressed,
			})
		end

		local blockedText = blocked and "Unblock Player" or "Block Player"
		table.insert(buttons, {
			Name = "BlockButton",
			Text = blockedText,
			OnPress = blocked and onUnblockButtonPressed or onBlockButtonPressed,
		})
		table.insert(buttons, {
			Name = "ReportButton",
			Text = "Report Abuse",
			OnPress = onReportButtonPressed,
		})

		if playerDropDown.PopupFrame then
			playerDropDown.PopupFrame:Destroy()
		end
		playerDropDown.PopupFrame = createPopupFrame(buttons)
		return playerDropDown.PopupFrame
	end

	--[[ PlayerRemoving Connection ]]--
	PlayersService.PlayerRemoving:connect(function(leavingPlayer)
		if playerDropDown.Player == leavingPlayer then
			playerDropDown:Hide()
		end
	end)

	return playerDropDown
end

--- GetCore Blocked/Muted/Friended events.

PlayerBlockedEvent = Instance.new("BindableEvent")
PlayerUnblockedEvent = Instance.new("BindableEvent")
PlayerMutedEvent = Instance.new("BindableEvent")
PlayerUnMutedEvent = Instance.new("BindableEvent")
PlayerFriendedEvent = Instance.new("BindableEvent")
PlayerUnFriendedEvent = Instance.new("BindableEvent")


table.insert(p, "ject")
BlockStatusChanged:connect(function(userId, isBlocked)
	local player = PlayersService:GetPlayerByUserId(userId)
	if player then
		if isBlocked then
			PlayerBlockedEvent:Fire(player)
		else
			PlayerUnblockedEvent:Fire(player)
		end
	end
end)

MuteStatusChanged:connect(function(userId, isMuted)
	local player = PlayersService:GetPlayerByUserId(userId)
	if player then
		if isMuted then
			PlayerMutedEvent:Fire(player)
		else
			PlayerUnMutedEvent:Fire(player)
		end
	end
end)

do
	moduleApiTable.FollowerStatusChanged = createSignal()

	function moduleApiTable:CreatePlayerDropDown()
		return createPlayerDropDown()
	end

	function moduleApiTable:GetFriendCountAsync(player)
		return getFriendCountAsync(player.UserId)
	end

	function moduleApiTable:MaxFriendCount()
		return MAX_FRIEND_COUNT
	end

	function moduleApiTable:GetFriendStatus()
		return getFriendStatus()
	end

	function moduleApiTable:CreateBlockingUtility()
		local blockingUtility = {}

		function blockingUtility:BlockPlayerAsync(player)
			return BlockPlayerAsync(player)
		end

		function blockingUtility:UnblockPlayerAsync(player)
			return UnblockPlayerAsync(player)
		end

		function blockingUtility:MutePlayer(player)
			return MutePlayer(player)
		end

		function blockingUtility:UnmutePlayer(player)
			return UnmutePlayer(player)
		end

		function blockingUtility:IsPlayerBlockedByUserId(userId)
			return isBlocked(userId)
		end

		function blockingUtility:GetBlockedStatusChangedEvent()
			return BlockStatusChanged
		end

		function blockingUtility:GetMutedStatusChangedEvent()
			return MuteStatusChanged
		end

		function blockingUtility:IsPlayerMutedByUserId(userId)
			return isMuted(userId)
		end

		function blockingUtility:GetBlockedUserIdsAsync()
			return getBlockedUserIds()
		end

		return blockingUtility
	end
end





-- RobloxGui/Modules/PlayerListModule


PlayersService = game:GetService('Players')
Player = PlayersService.LocalPlayer
CoreGui = Player.PlayerGui
GuiService = game:GetService('GuiService')
UserInputService = game:GetService('UserInputService')
TeamsService = game:FindService('Teams')
ContextActionService = game:GetService('ContextActionService')
StarterGui = game:GetService('StarterGui')
Settings = UserSettings()
GameSettings = Settings.GameSettings



table.insert(p, "PL")
while not PlayersService.LocalPlayer do
	-- This does not follow the usual pattern of PlayersService:PlayerAdded:Wait()
	-- because it caused a bug where the local players name would show as Player in game.
	-- The local players name is not yet set when the PlayerAdded event fires.
	wait()
end

RobloxGui = RobloxGuii

FORCE_TEN_FOOT_INTERFACE = false
tenFootInterfaceEnabled = false
do
	platform = Enum.Platform.Windows

	tenFootInterfaceEnabled = GuiService:IsTenFootInterface()
end

if FORCE_TEN_FOOT_INTERFACE then
	tenFootInterfaceEnabled = true
end

local isTenFootInterface = tenFootInterfaceEnabled

playerDropDownModule = moduleApiTable
blockingUtility = playerDropDownModule:CreateBlockingUtility()
playerDropDown = playerDropDownModule:CreatePlayerDropDown()

function IsInGroupFunctionFactory(groupId)
	local inGroupCache = {}
	return function(player)
		if player and player.UserId > 0 then
			if inGroupCache[player.UserId] == nil then
				local inGroup = false
				pcall(function()
					inGroup = player:IsInGroup(groupId)
				end)
				inGroupCache[player.UserId] = inGroup
			end
			return inGroupCache[player.UserId]
		end
		return false
	end
end
function HasRankInGroupFunctionFactory(groupId, requiredRank)
	local hasRankCache = {}
	return function(player)
		if player and player.UserId > 0 then
			if hasRankCache[player.UserId] == nil then
				local hasRank = false
				pcall(function()
					hasRank = player:GetRankInGroup(groupId) >= requiredRank
				end)
				hasRankCache[player.UserId] = hasRank
			end
			return hasRankCache[player.UserId]
		end
		return false
	end
end
IsPlayerAdminAsync = IsInGroupFunctionFactory(1200769)
IsPlayerInternAsync = HasRankInGroupFunctionFactory(2868472, 100)

--[[ Remotes ]]--
RemoveEvent_OnFollowRelationshipChanged = nil
RemoteFunc_GetFollowRelationships = nil

--[[ Start Module ]]--
local Playerlist = {}

--[[ Public Event API ]]--
-- Parameters: Sorted Array - see GameStats below
Playerlist.OnLeaderstatsChanged = Instance.new('BindableEvent')
-- Parameters: nameOfStat(string), formatedStringOfStat(string)
Playerlist.OnStatChanged = Instance.new('BindableEvent')

--[[ Client Stat Table ]]--
-- Sorted Array of tables
GameStats = {}
-- Fields
-- Name: String the developer has given the stat
-- Text: Formated string of the stat value
-- AddId: Child add order id
-- IsPrimary: Is this the primary stat
-- Priority: Sorting priority
-- NOTE: IsPrimary and Priority are unofficially supported. They are left over legacy from the old player list.
-- They can be un-supported at anytime. You should prefer using child add order to order your stats in the leader board.

--[[ Script Variables ]]--
table.insert(p, "ist")
topbarEnabled = true
playerlistCoreGuiEnabled = true
MyPlayerEntryTopFrame = nil
PlayerEntries = {}
StatAddId = 0
TeamEntries = {}
TeamAddId = 0
NeutralTeam = nil
IsShowingNeutralFrame = false
LastSelectedFrame = nil
LastSelectedPlayer = nil
MinContainerSize = UDim2.new(0, 165, 0.5, 0)
viewportSize = workspace.CurrentCamera.ViewportSize
if isTenFootInterface then
	MinContainerSize = UDim2.new(0, 1000, 0, 720)
end
TempHideKeys = {}

function IsXboxUseCrossPlatformPlayEnabled()
	local success, flagValue = pcall(function() return true end)
	return (success and flagValue == true)
end

AllowPlatformName = IsXboxUseCrossPlatformPlayEnabled() and
	GuiService:IsTenFootInterface() == true

PlayerEntrySizeY = 24
if isTenFootInterface then
	PlayerEntrySizeY = AllowPlatformName and 100 or 80
end

TeamEntrySizeY = 18

if isTenFootInterface then
	TeamEntrySizeY = 32
end

NameEntrySizeX = 170
if isTenFootInterface then
	NameEntrySizeX = 350
end

StatEntrySizeX = 75
if isTenFootInterface then
	StatEntrySizeX = 250
end

function isSmallTouchScreen()
	return UserInputService.TouchEnabled and (viewportSize.Y < 500 or viewportSize.X < 700)
end

IsSmallScreenDevice = isSmallTouchScreen()

BaseUrl = game:GetService('ContentProvider').BaseUrl:lower()
BaseUrl = string.gsub(BaseUrl, "/m.", "/www.")
AssetGameUrl = string.gsub(BaseUrl, 'www', 'assetgame')

--[[ Constants ]]--
ENTRY_PAD = 2
BG_TRANSPARENCY = 0.5
BG_COLOR = Color3.new(31/255, 31/255, 31/255)
BG_COLOR_TOP = Color3.new(106/255, 106/255, 106/255)
TEXT_STROKE_TRANSPARENCY = 0.75
TEXT_COLOR = Color3.new(1, 1, 243/255)
TEXT_STROKE_COLOR = Color3.new(34/255, 34/255, 34/255)
TWEEN_TIME = 0.15
MAX_LEADERSTATS = 4
MAX_STR_LEN = 12
TILE_SPACING = 2
if isTenFootInterface then
	BG_COLOR_TOP = Color3.new(25/255, 25/255, 25/255)
	BG_COLOR = Color3.new(60/255, 60/255, 60/255)
	BG_TRANSPARENCY = 0.25
	TEXT_STROKE_TRANSPARENCY = 1
	TILE_SPACING = 5
end
SHADOW_IMAGE = 'rbxasset://textures/ui/PlayerList/TileShadowMissingTop.png'--'http://www.roblox.com/asset?id=286965900'
SHADOW_SLICE_SIZE = 5
SHADOW_SLICE_RECT = Rect.new(SHADOW_SLICE_SIZE+1, SHADOW_SLICE_SIZE+1, SHADOW_SLICE_SIZE*2-1, SHADOW_SLICE_SIZE*2-1)

local CUSTOM_ICONS = {	-- Admins with special icons
	['7210880'] = 'rbxassetid://134032333', -- Jeditkacheff
	['13268404'] = 'rbxassetid://113059239', -- Sorcus
	['261'] = 'rbxassetid://105897927', -- shedlestky
	['20396599'] = 'rbxassetid://161078086', -- Robloxsai
}

local ABUSES = {
	"Swearing",
	"Bullying",
	"Scamming",
	"Dating",
	"Cheating/Exploiting",
	"Personal Questions",
	"Offsite Links",
	"Bad Username",
}

--[[ Images ]]--
CHAT_ICON = 'rbxasset://textures/ui/chat_teamButton.png'
ADMIN_ICON = 'rbxasset://textures/ui/icon_admin-16.png'
INTERN_ICON = 'rbxasset://textures/ui/icon_intern-16.png'
PLACE_OWNER_ICON = 'rbxasset://textures/ui/icon_placeowner.png'
BC_ICON = 'rbxasset://textures/ui/icon_premium-16.png'
TBC_ICON = 'rbxasset://textures/ui/icon_premium-16.png'
OBC_ICON = 'rbxasset://textures/ui/icon_premium-16.png'
BLOCKED_ICON = 'rbxasset://textures/ui/Playerlist/BlockedIcon.png'
FRIEND_ICON = 'rbxasset://textures/ui/icon_friends_16.png'
FRIEND_REQUEST_ICON = 'rbxasset://textures/ui/icon_friendrequestsent_16.png'
FRIEND_RECEIVED_ICON = 'rbxasset://textures/ui/icon_friendrequestrecieved-16.png'

FOLLOWER_ICON = 'rbxassetid://7038289581'
FOLLOWING_ICON = 'rbxassetid://7038290262'
MUTUAL_FOLLOWING_ICON = 'rbxassetid://7038290741'

CHARACTER_BACKGROUND_IMAGE = 'rbxassetid://7038292205'

--[[ Helper Functions ]]--
function clamp(value, min, max)
	if value < min then
		value = min
	elseif value > max then
		value = max
	end

	return value
end

function getFriendStatusIcon(friendStatus, player)
    if table.find(game.StarterGui:GetCore("GetBlockedUserIds"), player.UserId) then
        return BLOCKED_ICON
    elseif friendStatus == Enum.FriendStatus.Friend then
		return FRIEND_ICON
	elseif friendStatus == Enum.FriendStatus.FriendRequestSent then
		return FRIEND_REQUEST_ICON
	elseif friendStatus == Enum.FriendStatus.FriendRequestReceived then
		return FRIEND_RECEIVED_ICON
    elseif player.UserId == game.CreatorId and game.CreatorType == Enum.CreatorType.User then
		return PLACE_OWNER_ICON
    elseif player.MembershipType == Enum.MembershipType.Premium then
		return BC_ICON
    elseif friendStatus == Enum.FriendStatus.Unknown or friendStatus == Enum.FriendStatus.NotFriend and player.MembershipType ~= Enum.MembershipType.Premium and player.UserId ~= game.CreatorId and game.CreatorType ~= Enum.CreatorType.User then
		return ""
	else
        return ""
		--error("PlayerList: Unknown value for friendStatus: "..tostring(friendStatus))
	end
end


function getCustomPlayerIcon(player)
	local userIdStr = tostring(player.UserId)
	if CUSTOM_ICONS[userIdStr] then return nil end
	--

	if IsPlayerAdminAsync(player) then
		return ADMIN_ICON
	elseif IsPlayerInternAsync(player) then
		return INTERN_ICON
	end
end

function setAvatarIconAsync(player, iconImage)
	-- this function is pretty much for xbox right now and makes use of modules that are part
	-- of the xbox app. Please see Kip or Jason if you have any questions
	local useSubdomainsFlagExists, useSubdomainsFlagValue = pcall(function() return true end)
	local thumbsUrl = BaseUrl
	if(useSubdomainsFlagExists and useSubdomainsFlagValue and AssetGameUrl~=nil) then
		thumbsUrl = AssetGameUrl
	end

	local thumbnailLoader = false -- for now

	local isFinalSuccess = false
	if thumbnailLoader then
		local loader = thumbnailLoader:Create(iconImage, player.UserId,
			thumbnailLoader.Sizes.Small, thumbnailLoader.AssetType.Avatar, true)
		isFinalSuccess = loader:LoadAsync(false, true, nil)
	end

	if not isFinalSuccess then
		iconImage.Image = 'rbxasset://textures/ui/Shell/Icons/DefaultProfileIcon.png'
	end
end
function getMembershipIcon(player)
	if isTenFootInterface then
		-- return nothing, we need to spawn off setAvatarIconAsync() as a later time to not block
		return ""
	else
			local userIdStr = tostring(player.UserId)
			local membershipType = player.MembershipType
			if CUSTOM_ICONS[userIdStr] then
				return CUSTOM_ICONS[userIdStr]
            elseif table.find(game.StarterGui:GetCore("GetBlockedUserIds"), player.UserId) then
                return BLOCKED_ICON
            elseif player.UserId == game.CreatorId and game.CreatorType == Enum.CreatorType.User then
				return PLACE_OWNER_ICON
            elseif membershipType == Enum.MembershipType.Premium then
				return BC_ICON
            elseif membershipType == Enum.MembershipType.None then -- Will keep these BC memberships here for accuracy. Challenge: Implement your own system to control these icons!
				return ""
			else
				return ""
			end
		end

end

function isValidStat(obj)
	return obj:IsA('StringValue') or obj:IsA('IntValue') or obj:IsA('BoolValue') or obj:IsA('NumberValue') or
		obj:IsA('DoubleConstrainedValue') or obj:IsA('IntConstrainedValue')
end

function sortPlayerEntries(a, b)
	if a.PrimaryStat == b.PrimaryStat then
		return a.Player.Name:upper() < b.Player.Name:upper()
	end
	if not a.PrimaryStat then return false end
	if not b.PrimaryStat then return true end
	local statA = a.PrimaryStat
	local statB = b.PrimaryStat
	statA = tonumber(statA) or statA
	statB = tonumber(statB) or statB
	return statA > statB
end

function sortLeaderStats(a, b)
	if a.IsPrimary ~= b.IsPrimary then
		return a.IsPrimary
	end
	if a.Priority == b.Priority then
		return a.AddId < b.AddId
	end
	return a.Priority < b.Priority
end

function sortTeams(a, b)
	if a.TeamScore == b.TeamScore then
		return a.Id < b.Id
	end
	if not a.TeamScore then return false end
	if not b.TeamScore then return true end
	return a.TeamScore < b.TeamScore
end

-- Start of Gui Creation
local Container = Instance.new('Frame', RobloxGuii)
Container.Name = "PlayerListContainer"
Container.Size = MinContainerSize

if isTenFootInterface then
	Container.Position = UDim2.new(0.5, -MinContainerSize.X.Offset/2, 0.25, 0)
else
	Container.Position = UDim2.new(1, -167, 0, 2)
end

-- Every time Performance Stats toggles on/off we need to
-- reposition the main Container, so things don't overlap.
-- Optimally I could just call an "UpdateContainerPosition" function
-- that takes into account everything that affects Container position
-- and recalculate things.
--
-- Unfortunately, the position of Container may be kind of hard to re-calculate
-- on the fly when it's been shaped based on current leader board state.
--
-- So instead we do this:
-- We always track where we'd be putting the widget if there were no
-- position stats in targetContainerYOffset.
-- Whenever we reposition Container, we first move it to the ignoring-stats
-- location, (updating targetContainerYOffset), then call the
-- AdjustContainerPosition function to derive final position.
local targetContainerYOffset = Container.Position.Y.Offset

Container.BackgroundTransparency = 1

function AdjustContainerPosition()
	-- A function to position the Container in light of presence of performance stats.
	return -- core script only function so No More Fortnite... :flushed:
end

-- Scrolling Frame
local noSelectionObject = Instance.new("Frame")
noSelectionObject.BackgroundTransparency = 1
noSelectionObject.BorderSizePixel = 0

local ScrollList = Instance.new('ScrollingFrame')
ScrollList.Name = "ScrollList"
ScrollList.Size = UDim2.new(1, -1, 0, 0)
if isTenFootInterface then
	ScrollList.Position = UDim2.new(0, 0, 0, PlayerEntrySizeY + TILE_SPACING)
	ScrollList.Size = UDim2.new(1, 19, 0, 0)
end
ScrollList.BackgroundTransparency = 1
ScrollList.BackgroundColor3 = Color3.new()
ScrollList.BorderSizePixel = 0
ScrollList.CanvasSize = UDim2.new(0, 0, 0, 0)	-- NOTE: Look into if x needs to be set to anything
ScrollList.ScrollBarThickness = 0
ScrollList.BottomImage = 'rbxasset://textures/ui/scroll-bottom.png'
ScrollList.MidImage = 'rbxasset://textures/ui/scroll-middle.png'
ScrollList.TopImage = 'rbxasset://textures/ui/scroll-top.png'
ScrollList.SelectionImageObject = noSelectionObject
ScrollList.Selectable = false
ScrollList.Parent = Container

-- PlayerDropDown clipping frame
local PopupClipFrame = Instance.new('Frame')
PopupClipFrame.Name = "PopupClipFrame"
PopupClipFrame.Size = UDim2.new(0, 150, 1.5, 0)
PopupClipFrame.Position = UDim2.new(0, -150 - ENTRY_PAD, 0, 0)
PopupClipFrame.BackgroundTransparency = 1
PopupClipFrame.ClipsDescendants = true
PopupClipFrame.Parent = Container
table.insert(p, " B")


--[[ Creation Helper Functions ]]--
function createEntryFrame(name, sizeYOffset, isTopStat)
	local containerFrame = Instance.new('Frame')
	containerFrame.Name = name
	containerFrame.Position = UDim2.new(0, 0, 0, 0)
	containerFrame.Size = UDim2.new(1, 0, 0, sizeYOffset)
	if isTenFootInterface then
		containerFrame.Position = UDim2.new(0, 10, 0, 0)
		containerFrame.Size = containerFrame.Size + UDim2.new(0, -20, 0, 0)
	end
	containerFrame.BackgroundTransparency = 1
	containerFrame.ZIndex = isTenFootInterface and 2 or 1

	local nameFrame = Instance.new('TextButton')
	nameFrame.Name = "BGFrame"
	nameFrame.Position = UDim2.new(0, 0, 0, 0)
	nameFrame.Size = UDim2.new(0, NameEntrySizeX, 0, sizeYOffset)
	nameFrame.BackgroundTransparency = isTopStat and 0 or BG_TRANSPARENCY
	nameFrame.BackgroundColor3 = isTopStat and BG_COLOR_TOP or BG_COLOR
	nameFrame.BorderSizePixel = 0
	nameFrame.AutoButtonColor = false
	nameFrame.Text = ""
	nameFrame.Parent = containerFrame
	nameFrame.ZIndex = isTenFootInterface and 2 or 1

	return containerFrame, nameFrame
end

function createEntryNameText(name, text, position, size, fontSize)
	local nameLabel = Instance.new('TextLabel')
	nameLabel.Name = name
	nameLabel.Position = position
	nameLabel.Size = size
	nameLabel.BackgroundTransparency = 1
	nameLabel.Font = Enum.Font.SourceSans

	if fontSize then
		nameLabel.FontSize = fontSize
	else
		if isTenFootInterface then
			nameLabel.FontSize = Enum.FontSize.Size32
		else
			nameLabel.FontSize = Enum.FontSize.Size14
		end
	end

	nameLabel.TextColor3 = TEXT_COLOR
	nameLabel.TextStrokeTransparency = TEXT_STROKE_TRANSPARENCY
	nameLabel.TextStrokeColor3 = TEXT_STROKE_COLOR
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.ClipsDescendants = true
	nameLabel.Text = text
	nameLabel.ZIndex = isTenFootInterface and 2 or 1

	return nameLabel
end

function createStatFrame(offset, parent, name, isTopStat)
	local statFrame = Instance.new('Frame')
	statFrame.Name = name
	statFrame.Size = UDim2.new(0, StatEntrySizeX, 1, 0)
	statFrame.Position = UDim2.new(0, offset + TILE_SPACING, 0, 0)
	statFrame.BackgroundTransparency = isTopStat and 0 or BG_TRANSPARENCY
	statFrame.BackgroundColor3 = isTopStat and BG_COLOR_TOP or BG_COLOR
	statFrame.BorderSizePixel = 0
	statFrame.Parent = parent

	if isTenFootInterface then
		statFrame.ZIndex = 2

		local shadow = Instance.new("ImageLabel")
		shadow.BackgroundTransparency = 1
		shadow.Name = 'Shadow'
		shadow.Image = SHADOW_IMAGE
		shadow.Position = UDim2.new(0, -SHADOW_SLICE_SIZE, 0, 0)
		shadow.Size = UDim2.new(1, SHADOW_SLICE_SIZE*2, 1, SHADOW_SLICE_SIZE)
		shadow.ScaleType = 'Slice'
		shadow.SliceCenter = SHADOW_SLICE_RECT
		shadow.Parent = statFrame
	end

	return statFrame
end

function createStatText(parent, text, isTopStat, isTeamStat)

	local statText = Instance.new('TextLabel')
	statText.Name = "StatText"
	statText.Size = isTopStat and UDim2.new(1, 0, 0.5, 0) or UDim2.new(1, 0, 1, 0)
	statText.Position = isTopStat and UDim2.new(0, 0, 0.5, 0) or UDim2.new(0, 0, 0, 0)
	statText.BackgroundTransparency = 1
	statText.Font = isTopStat and Enum.Font.SourceSansBold or Enum.Font.SourceSans
	if isTenFootInterface then
		statText.FontSize = Enum.FontSize.Size32
	else
		statText.FontSize = Enum.FontSize.Size14
	end
	statText.TextColor3 = TEXT_COLOR
	statText.TextStrokeColor3 = TEXT_STROKE_COLOR
	statText.TextStrokeTransparency = TEXT_STROKE_TRANSPARENCY
	statText.Text = text
	statText.Active = true
	statText.Parent = parent
	if isTenFootInterface then
		statText.ZIndex = 2
	end
	if tostring(parent.Parent.Name) == game.Players.LocalPlayer.Name then
	local statTexttop = statText:Clone()
	statTexttop.Name = parent.Parent.Name.." TEXT"
	game:GetService("RunService").RenderStepped:Connect(function()
		statTexttop.Text = statText.Text
	end)
	statTexttop.Parent = RobloxGuii.PlayerListContainer
	statTexttop.Size = UDim2.new(0, 75, 0, 23)
	statTexttop.Position = UDim2.new(0, parent.Position.X.Offset, 0, -23)
	statTexttop.Font =  Enum.Font.SourceSansBold
	local statTextname = statText:Clone()
	statTextname.Parent = RobloxGuii.PlayerListContainer
	statTextname.Text = parent.Name
	statTexttop.Name = parent.Name.." NAME"
	statTextname.Size = UDim2.new(0, 75, 0, 23)
	statTextname.Position = UDim2.new(0, parent.Position.X.Offset, 0, -40)
	statTextname.Font =  Enum.Font.SourceSansBold
	end
	if isTopStat then
		local statName = statText:Clone()
		statName.Name = "StatName"
		statName.Text = tostring(parent.Name)
		statName.Position = UDim2.new(0,0,0,0)
		statName.Font = Enum.Font.SourceSans
		statName.ClipsDescendants = true
		statName.Parent = parent
		if isTenFootInterface then
			statName.ZIndex = 2
		end
	end

	if isTeamStat then
		statText.Font = 'SourceSansBold'
	end

	return statText
end
table.insert(p, " Co")
function createImageIcon(image, name, xOffset, parent)
	local imageLabel = Instance.new('ImageLabel')
	imageLabel.Name = name
	if isTenFootInterface then
		local background = Instance.new("ImageLabel", parent)
		background.Name = 'Background'
		background.BackgroundTransparency = 1
		background.Image = CHARACTER_BACKGROUND_IMAGE
		background.Size = UDim2.new(0, 66, 0, 66)
		background.Position = UDim2.new(0.01, xOffset - 1, 0.5, -background.Size.Y.Offset/2)
		background.ZIndex = 2

		imageLabel.Size = UDim2.new(0, 64, 0, 64)
		imageLabel.Position = UDim2.new(0.5, -64/2, 0.5, -64/2)
		imageLabel.ZIndex = 2
		imageLabel.Parent = background
	else
		imageLabel.Size = UDim2.new(0, 16, 0, 16)
		imageLabel.Position = UDim2.new(0.01, xOffset, 0.5, -imageLabel.Size.Y.Offset/2)
		imageLabel.Parent = parent
	end
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = image
	imageLabel.BorderSizePixel = 0

	return imageLabel
end

function getScoreValue(statObject)
	if statObject:IsA('DoubleConstrainedValue') or statObject:IsA('IntConstrainedValue') then
		return statObject.ConstrainedValue
	elseif statObject:IsA('BoolValue') then
		if statObject.Value then return 1 else return 0 end
	else
		return statObject.Value
	end
end

local THIN_CHARS = "[^%[iIl\%.,']"
function strWidth(str)
	return string.len(str) - math.floor(string.len(string.gsub(str, THIN_CHARS, "")) / 2)
end

function formatNumber(value)
	local _,_,minusSign, int, fraction = tostring(value):find('([-]?)(%d+)([.]?%d*)')
	int = int:reverse():gsub("%d%d%d", "%1,")
	return minusSign..int:reverse():gsub("^,", "")..fraction
end

function formatStatString(text)
	local numberValue = tonumber(text)
	if numberValue then
		text = formatNumber(numberValue)
	end

	if strWidth(text) <= MAX_STR_LEN then
		return text
	else
		return string.sub(text, 1, MAX_STR_LEN - 3).."..."
	end
end

--[[ Resize Functions ]]--
local LastMaxScrollSize = 0
function setScrollListSize()
	local teamSize = #TeamEntries * TeamEntrySizeY
	local playerSize = #PlayerEntries * PlayerEntrySizeY
	local spacing = #PlayerEntries * ENTRY_PAD + #TeamEntries * ENTRY_PAD
	local canvasSize = teamSize + playerSize + spacing
	if #TeamEntries > 0 and NeutralTeam and IsShowingNeutralFrame then
		canvasSize = canvasSize + TeamEntrySizeY + ENTRY_PAD
	end
	ScrollList.CanvasSize = UDim2.new(0, 0, 0, canvasSize)
	local newScrollListSize = math.min(canvasSize, Container.AbsoluteSize.y)
	if ScrollList.Size.Y.Offset == LastMaxScrollSize then
		if isTenFootInterface then
			ScrollList.Size = UDim2.new(1, 20, 0, newScrollListSize)
		else
			ScrollList.Size = UDim2.new(1, 0, 0, newScrollListSize)
		end
	end
	LastMaxScrollSize = newScrollListSize
end

--[[ Re-position Functions ]]--
function setPlayerEntryPositions()
	local position = 0
	for i = 1, #PlayerEntries do
		if isTenFootInterface and PlayerEntries[i].Frame ~= MyPlayerEntryTopFrame then
			PlayerEntries[i].Frame.Position = UDim2.new(0, 10, 0, position)
			position = position + PlayerEntrySizeY + TILE_SPACING
		elseif PlayerEntries[i].Frame ~= MyPlayerEntryTopFrame then
			PlayerEntries[i].Frame.Position = UDim2.new(0, 0, 0, position)
			position = position + PlayerEntrySizeY + TILE_SPACING
		end
	end
end

function setTeamEntryPositions()
	local teams = {}
	for _,teamEntry in ipairs(TeamEntries) do
		local team = teamEntry.Team
		teams[tostring(team.TeamColor)] = {}
	end
	if NeutralTeam then
		teams.Neutral = {}
	end

	for _,playerEntry in ipairs(PlayerEntries) do
		if playerEntry.Frame ~= MyPlayerEntryTopFrame then
			local player = playerEntry.Player
			if player.Neutral then
				table.insert(teams.Neutral, playerEntry)
			elseif teams[tostring(player.TeamColor)] then
				table.insert(teams[tostring(player.TeamColor)], playerEntry)
			else
				table.insert(teams.Neutral, playerEntry)
			end
		end
	end

	local position = 0
	for _,teamEntry in ipairs(TeamEntries) do
		local team = teamEntry.Team
		teamEntry.Frame.Position = UDim2.new(0, isTenFootInterface and 10 or 0, 0, position)
		position = position + TeamEntrySizeY + TILE_SPACING
		local players = teams[tostring(team.TeamColor)]
		for _,playerEntry in ipairs(players) do
			playerEntry.Frame.Position = UDim2.new(0, isTenFootInterface and 10 or 0, 0, position)
			position = position + PlayerEntrySizeY + TILE_SPACING
		end
	end
	if NeutralTeam then
		NeutralTeam.Frame.Position = UDim2.new(0, isTenFootInterface and 10 or 0, 0, position)
		position = position + TeamEntrySizeY + TILE_SPACING
		if #teams.Neutral > 0 then
			IsShowingNeutralFrame = true
			local players = teams.Neutral
			for _,playerEntry in ipairs(players) do
				playerEntry.Frame.Position = UDim2.new(0, isTenFootInterface and 10 or 0, 0, position)
				position = position + PlayerEntrySizeY + TILE_SPACING
			end
		else
			IsShowingNeutralFrame = false
		end
	end
end
table.insert(p, "la")
function setEntryPositions()
	table.sort(PlayerEntries, sortPlayerEntries)
	if #TeamEntries > 0 then
		setTeamEntryPositions()
	else
		setPlayerEntryPositions()
	end
end

function updateSocialIcon(newIcon, bgFrame)
	local socialIcon = bgFrame:FindFirstChild('SocialIcon')
	local nameFrame = bgFrame:FindFirstChild('PlayerName')
	local offset = 19
	if socialIcon then
		if newIcon then
			socialIcon.Image = newIcon
		else
			if nameFrame then
				local newSize = nameFrame.Size.X.Offset + socialIcon.Size.X.Offset + 2
				nameFrame.Size = UDim2.new(-0.01, newSize, 0.5, 0)
				nameFrame.Position = UDim2.new(0.01, offset, 0.245, 0)
			end
			socialIcon:Destroy()
		end
	elseif newIcon and bgFrame then
		socialIcon = createImageIcon(newIcon, "SocialIcon", offset, bgFrame)
		offset = offset + socialIcon.Size.X.Offset + 2
		if nameFrame then
			local newSize = bgFrame.Size.X.Offset - offset
			nameFrame.Size = UDim2.new(-0.01, newSize, 0.5, 0)
			nameFrame.Position = UDim2.new(0.01, offset, 0.245, 0)
		end
	end
end

function getFriendStatus(selectedPlayer)
	if selectedPlayer == Player then
		return Enum.FriendStatus.NotFriend
	else
		local success, result = pcall(function()
			-- NOTE: Core script only
			return Player:GetFriendStatus(selectedPlayer)
		end)
		if success then
			return result
		else
			return Enum.FriendStatus.NotFriend
		end
	end
end

function popupHidden()
	if LastSelectedFrame then
		for _,childFrame in pairs(LastSelectedFrame:GetChildren()) do
			if childFrame:IsA('TextButton') or childFrame:IsA('Frame') then
				childFrame.BackgroundColor3 = BG_COLOR
			end
		end
	end
	ScrollList.ScrollingEnabled = true
	LastSelectedFrame = nil
	LastSelectedPlayer = nil
end
playerDropDown.HiddenSignal:connect(popupHidden)

function openPlatformProfileUI(rbxUid)
	if not rbxUid or rbxUid < 1 then return end
	pcall(function()
		local platformService = game:GetService('PlatformService')
		local platformId = platformService:GetPlatformId(rbxUid)
		if platformId and #platformId > 0 then
			platformService:PopupProfileUI(Enum.UserInputType.Gamepad1, platformId)
		end
	end)
end

function onEntryFrameSelected(selectedFrame, selectedPlayer)
	if isTenFootInterface then
		-- open the profile UI for the selected user. On console we allow user to select themselves
		-- they may want quick access to platform profile features
		openPlatformProfileUI(selectedPlayer.UserId)
		return
	end

	if selectedPlayer ~= Player and selectedPlayer.UserId > 1 and Player.UserId > 1 then
		if LastSelectedFrame ~= selectedFrame then
			if LastSelectedFrame then
				for _,childFrame in pairs(LastSelectedFrame:GetChildren()) do
					if childFrame:IsA('TextButton') or childFrame:IsA('Frame') then
						childFrame.BackgroundColor3 = BG_COLOR
					end
				end
			end
			LastSelectedFrame = selectedFrame
			LastSelectedPlayer = selectedPlayer
			for _,childFrame in pairs(selectedFrame:GetChildren()) do
				if childFrame:IsA('TextButton') or childFrame:IsA('Frame') then
					childFrame.BackgroundColor3 = Color3.new(0, 1, 1)
				end
			end
			-- NOTE: Core script only
			ScrollList.ScrollingEnabled = false

			local PopupFrame = playerDropDown:CreatePopup(selectedPlayer)
			PopupFrame.Position = UDim2.new(1, 1, 0, selectedFrame.Position.Y.Offset - ScrollList.CanvasPosition.y)
			PopupFrame.Parent = PopupClipFrame
			PopupFrame:TweenPosition(UDim2.new(0, 0, 0, selectedFrame.Position.Y.Offset - ScrollList.CanvasPosition.y), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, TWEEN_TIME, true)
		else
			playerDropDown:Hide()
			LastSelectedFrame = nil
			LastSelectedPlayer = nil
		end
	end
end

function onFriendshipChanged(otherPlayer, newFriendStatus)
	local entryToUpdate = nil
	for _,entry in ipairs(PlayerEntries) do
		if entry.Player == otherPlayer then
			entryToUpdate = entry
			break
		end
	end
	if not entryToUpdate then
		return
	end
	local newIcon = getFriendStatusIcon(newFriendStatus, nil)
	local frame = entryToUpdate.Frame
	local bgFrame = frame:FindFirstChild('BGFrame')
	if bgFrame then
		--no longer friends, but might still be following
		-- TODO: We need to get follow relationship here; we currently don't have a way
		-- to get a single users result, so the server script will need to be updated
		-- issue will be when unfriending a user, but still following them, the icon
		-- will not show correctly.
		updateSocialIcon(newIcon, bgFrame)
	end
end

--[[ Begin New Server Followers ]]--
function setFollowRelationshipsView(relationshipTable)
	if not relationshipTable then
		return
	end

	for i = 1, #PlayerEntries do
		local entry = PlayerEntries[i]
		local player = entry.Player
		local userId = tostring(player.UserId)

		-- don't update icon if already friends
		local friendStatus = getFriendStatus(player)
		if friendStatus == Enum.FriendStatus.Friend then
			return
		end

		local icon = nil
		if relationshipTable[userId] then
			local relationship = relationshipTable[userId]
			if relationship.IsMutual == true then
				icon = MUTUAL_FOLLOWING_ICON
			elseif relationship.IsFollowing == true then
				icon = FOLLOWING_ICON
			elseif relationship.IsFollower == true then
				icon = FOLLOWER_ICON
			end
		end

		if icon then
			local frame = entry.Frame
			local bgFrame = frame:FindFirstChild('BGFrame')
			if bgFrame then
				updateSocialIcon(icon, bgFrame)
			end
		end
	end
end

function getFollowRelationships()
	local result = nil
	if RemoteFunc_GetFollowRelationships then
		result = RemoteFunc_GetFollowRelationships:InvokeServer()
	end
	return result
end

--[[ End New Server Followers ]]--

function updateAllTeamScores()
	local teamScores = {}
	for _,playerEntry in ipairs(PlayerEntries) do
		local player = playerEntry.Player
		local leaderstats = player:FindFirstChild('leaderstats')
		local team = player.Neutral and 'Neutral' or tostring(player.TeamColor)
		local isInValidColor = true
		if team ~= 'Neutral' then
			for _,teamEntry in ipairs(TeamEntries) do
				local color = teamEntry.Team.TeamColor
				if team == tostring(color) then
					isInValidColor = false
					break
				end
			end
		end
		if isInValidColor then
			team = 'Neutral'
		end
		if not teamScores[team] then
			teamScores[team] = {}
		end
		if playerEntry.Frame ~= MyPlayerEntryTopFrame then
			if leaderstats then
				for _,stat in ipairs(GameStats) do
					local statObject = leaderstats:FindFirstChild(stat.Name)
					if statObject and not statObject:IsA('StringValue') then
						if not teamScores[team][stat.Name] then
							teamScores[team][stat.Name] = 0
						end
						teamScores[team][stat.Name] = teamScores[team][stat.Name] + getScoreValue(statObject)
					end
				end
			end
		end
	end

	for _,teamEntry in ipairs(TeamEntries) do
		local team = teamEntry.Team
		local frame = teamEntry.Frame
		local color = tostring(team.TeamColor)
		local stats = teamScores[color]
		if stats then
			for statName,statValue in pairs(stats) do
				local statFrame = frame:FindFirstChild(statName)
				if statFrame then
					local statText = statFrame:FindFirstChild('StatText')
					if statText then
						statText.Text = formatStatString(tostring(statValue))
					end
				end
			end
		else
			for _,childFrame in pairs(frame:GetChildren()) do
				local statText = childFrame:FindFirstChild('StatText')
				if statText then
					statText.Text = ''
				end
			end
		end
	end
	if NeutralTeam then
		local frame = NeutralTeam.Frame
		local stats = teamScores['Neutral']
		if stats then
			frame.Visible = true
			for statName,statValue in pairs(stats) do
				local statFrame = frame:FindFirstChild(statName)
				if statFrame then
					local statText = statFrame:FindFirstChild('StatText')
					if statText then
						statText.Text = formatStatString(tostring(statValue))
					end
				end
			end
		else
			frame.Visible = false
		end
	end
end

function updateTeamEntry(entry)
	local frame = entry.Frame
	local team = entry.Team
	local color = team.TeamColor.Color
	local offset = NameEntrySizeX
	for _,stat in ipairs(GameStats) do
		local statFrame = frame:FindFirstChild(stat.Name)
		if not statFrame then
			statFrame = createStatFrame(offset, frame, stat.Name)
			statFrame.BackgroundColor3 = color
			createStatText(statFrame, "", false, true)
		end
		statFrame.Position = UDim2.new(0, offset + TILE_SPACING, 0, 0)
		offset = offset + statFrame.Size.X.Offset + TILE_SPACING
	end
end

function updatePrimaryStats(statName)
	for _,entry in ipairs(PlayerEntries) do
		local player = entry.Player
		local leaderstats = player:FindFirstChild('leaderstats')
		entry.PrimaryStat = nil
		if leaderstats then
			local statObject = leaderstats:FindFirstChild(statName)
			if statObject then
				local scoreValue = getScoreValue(statObject)
				entry.PrimaryStat = scoreValue
			end
		end
	end
end

local updateLeaderstatFrames = nil
-- TODO: fire event to top bar?
function initializeStatText(stat, statObject, entry, statFrame, index, isTopStat)
	local player = entry.Player
	local statValue = getScoreValue(statObject)
	if statObject.Name == GameStats[1].Name then
		entry.PrimaryStat = statValue
	end
	local statText = createStatText(statFrame, formatStatString(tostring(statValue)), isTopStat)
	-- Top Bar insertion
	if player == Player then
		stat.Text = statText.Text
	end

	statObject.Changed:connect(function(newValue)
		local scoreValue = getScoreValue(statObject)
		statText.Text = formatStatString(tostring(scoreValue))
		if statObject.Name == GameStats[1].Name then
			entry.PrimaryStat = scoreValue
		end
		-- Top bar changed event
		if player == Player then
			stat.Text = statText.Text
			Playerlist.OnStatChanged:Fire(stat.Name, stat.Text)
		end
		updateAllTeamScores()
		setEntryPositions()
	end)
	statObject.ChildAdded:connect(function(child)
		if child.Name == "IsPrimary" then
			GameStats[1].IsPrimary = false
			stat.IsPrimary = true
			updatePrimaryStats(stat.Name)
			if updateLeaderstatFrames then updateLeaderstatFrames() end
			Playerlist.OnLeaderstatsChanged:Fire(GameStats)
		end
	end)
end
table.insert(p, "stee")
updateLeaderstatFrames = function()
	table.sort(GameStats, sortLeaderStats)
	if #TeamEntries > 0 then
		for _,entry in ipairs(TeamEntries) do
			updateTeamEntry(entry)
		end
		if NeutralTeam then
			updateTeamEntry(NeutralTeam)
		end
	end

	for _,entry in ipairs(PlayerEntries) do
		local player = entry.Player
		local mainFrame = entry.Frame
		local offset = NameEntrySizeX
		local leaderstats = player:FindFirstChild('leaderstats')
		local isTopStat = (entry.Frame == MyPlayerEntryTopFrame)

		if leaderstats then
			for _,stat in ipairs(GameStats) do
				local statObject = leaderstats:FindFirstChild(stat.Name)
				local statFrame = mainFrame:FindFirstChild(stat.Name)

				if not statFrame then
					statFrame = createStatFrame(offset, mainFrame, stat.Name, isTopStat)
					if statObject then
						initializeStatText(stat, statObject, entry, statFrame, nil, isTopStat)
					end
				elseif statObject then
					local statText = statFrame:FindFirstChild('StatText')
					if not statText then
						initializeStatText(stat, statObject, entry, statFrame, nil, isTopStat)
					end
				end
				statFrame.Position = UDim2.new(0, offset + TILE_SPACING, 0, 0)
				offset = offset + statFrame.Size.X.Offset + TILE_SPACING
			end
		else
			for _,stat in ipairs(GameStats) do
				local statFrame = mainFrame:FindFirstChild(stat.Name)
				if not statFrame then
					statFrame = createStatFrame(offset, mainFrame, stat.Name, isTopStat)
				end
				offset = offset + statFrame.Size.X.Offset + TILE_SPACING
			end
		end

		if entry.Frame ~= MyPlayerEntryTopFrame then
			if isTenFootInterface then
				Container.Position = UDim2.new(0.5, -offset/2, 0, 110)
				Container.Size = UDim2.new(0, offset, 0.8, 0)
			else
				Container.Position = UDim2.new(1, -offset, 0, 2)
				Container.Size = UDim2.new(0, offset, 0.5, 0)
			end
			targetContainerYOffset = Container.Position.Y.Offset
			AdjustContainerPosition()

			local newMinContainerOffset = offset
			MinContainerSize = UDim2.new(0, newMinContainerOffset, 0.5, 0)
		end
	end
	updateAllTeamScores()
	setEntryPositions()
	Playerlist.OnLeaderstatsChanged:Fire(GameStats)
end

function addNewStats(leaderstats)
	for i,stat in ipairs(leaderstats:GetChildren()) do
		if isValidStat(stat) and #GameStats < MAX_LEADERSTATS then
			local gameHasStat = false
			for _,gStat in ipairs(GameStats) do
				if stat.Name == gStat.Name then
					gameHasStat = true
					break
				end
			end

			if not gameHasStat then
				local newStat = {}
				newStat.Name = stat.Name
				newStat.Text = "-"
				newStat.Priority = 0
				local priority = stat:FindFirstChild('Priority')
				if priority then newStat.Priority = priority end
				newStat.IsPrimary = false
				local isPrimary = stat:FindFirstChild('IsPrimary')
				if isPrimary then
					newStat.IsPrimary = true
				end
				newStat.AddId = StatAddId
				StatAddId = StatAddId + 1
				table.insert(GameStats, newStat)
				table.sort(GameStats, sortLeaderStats)
				if #GameStats == 1 then
					setScrollListSize()
					setEntryPositions()
				end
			end
		end
	end
end

function removeStatFrameFromEntry(stat, frame)
	local statFrame = frame:FindFirstChild(stat.Name)
	if statFrame then
		statFrame:Destroy()
	end
end

function doesStatExists(stat)
	local doesExists = false
	for _,entry in ipairs(PlayerEntries) do
		local player = entry.Player
		if player then
			local leaderstats = player:FindFirstChild('leaderstats')
			if leaderstats and leaderstats:FindFirstChild(stat.Name) then
				doesExists = true
				break
			end
		end
	end

	return doesExists
end

function onStatRemoved(oldStat, entry)
	if isValidStat(oldStat) then
		removeStatFrameFromEntry(oldStat, entry.Frame)
		local statExists = doesStatExists(oldStat)
		--
		local toRemove = nil
		for i, stat in ipairs(GameStats) do
			if stat.Name == oldStat.Name then
				toRemove = i
				break
			end
		end
		-- removed from player but not from game; another player still has this stat
		if statExists then
			if toRemove and entry.Player == Player then
				GameStats[toRemove].Text = "-"
				Playerlist.OnStatChanged:Fire(GameStats[toRemove].Name, GameStats[toRemove].Text)
			end
			-- removed from game
		else
			for _,playerEntry in ipairs(PlayerEntries) do
				removeStatFrameFromEntry(oldStat, playerEntry.Frame)
			end
			for _,teamEntry in ipairs(TeamEntries) do
				removeStatFrameFromEntry(oldStat, teamEntry.Frame)
			end
			if toRemove then
				table.remove(GameStats, toRemove)
				table.sort(GameStats, sortLeaderStats)
			end
		end
		if GameStats[1] then
			updatePrimaryStats(GameStats[1].Name)
		end
		updateLeaderstatFrames()
	end
end

function onStatAdded(leaderstats, entry)
	leaderstats.ChildAdded:connect(function(newStat)
		if isValidStat(newStat) then
			addNewStats(newStat.Parent)
			updateLeaderstatFrames()
		end
	end)
	leaderstats.ChildRemoved:connect(function(child)
		onStatRemoved(child, entry)
	end)
	addNewStats(leaderstats)
	updateLeaderstatFrames()
end

function setLeaderStats(entry)
	local player = entry.Player
	local leaderstats = player:FindFirstChild('leaderstats')

	if leaderstats then
		onStatAdded(leaderstats, entry)
	end

	local function onPlayerChildChanged(property, child)
		if property == 'Name' and child.Name == 'leaderstats' then
			onStatAdded(child, entry)
		end
	end

	player.ChildAdded:connect(function(child)
		if child.Name == 'leaderstats' then
			onStatAdded(child, entry)
		end
		child.Changed:connect(function(property) onPlayerChildChanged(property, child) end)
	end)
	for _,child in pairs(player:GetChildren()) do
		child.Changed:connect(function(property) onPlayerChildChanged(property, child) end)
	end

	player.ChildRemoved:connect(function(child)
		if child.Name == 'leaderstats' then
			for i,stat in ipairs(child:GetChildren()) do
				onStatRemoved(stat, entry)
			end
			updateLeaderstatFrames()
		end
	end)
end

local offsetSize = 18
if isTenFootInterface then offsetSize = 32 end

function createPlayerEntry(player, isTopStat)
	local playerEntry = {}
	local name = nil
    local msiop = false
    name = player.Name
    game:GetService("RunService").RenderStepped:Connect(function()
        if DisplayNames.Value then
            name = player.DisplayName
        else
            name = player.Name
        end
    end)
	local containerFrame, entryFrame = createEntryFrame(name, PlayerEntrySizeY, isTopStat)
	entryFrame.Active = true

	entryFrame.MouseButton1Click:connect(function()
		onEntryFrameSelected(containerFrame, player)
	end)

	local currentXOffset = AllowPlatformName and 14 or 1

	-- check membership
	local membershipIconImage = getMembershipIcon(player)
    local playerIcon = nil
	local membershipIcon = nil

	if membershipIconImage then
		membershipIcon = createImageIcon(--[[membershipIconImage]] "", "MembershipIcon", currentXOffset, entryFrame)
        currentXOffset = currentXOffset + membershipIcon.Size.X.Offset + (AllowPlatformName and 4 or 2)
	else
		currentXOffset = currentXOffset + offsetSize
	end
    playerIcon = entryFrame.MembershipIcon:Clone()
    playerIcon.Parent = entryFrame
    playerIcon.Image = ""
    membershipIcon:Destroy()
    game:GetService("RunService").RenderStepped:Connect(function()
        if game.Players:FindFirstChild(name) then
            playerIcon.Image = getFriendStatusIcon(game.Players.LocalPlayer:GetFriendStatus(game.Players[name]), game.Players[name])
        end
    end)
    if getFriendStatusIcon(game.Players.LocalPlayer:GetFriendStatus(game.Players[name]), game.Players[name]) == BLOCKED_ICON then
        wait(0.8)
        --entryFrame.MembershipIcon:Destroy()
        BlockPlayerAsync(game.Players[name])
    end
    spawn(function()
		if isTenFootInterface and membershipIcon then
			setAvatarIconAsync(player, membershipIcon)
		end
	end)

	-- Some functions yield, so we need to spawn off in order to not cause a race condition with other events like PlayersService.ChildRemoved
	spawn(function()
		-- don't make rank/grp calls on console
		if isTenFootInterface then return end

		local success, result = pcall(function()
			return player:GetRankInGroup(game.CreatorId) == 255
		end)
		if success then
			if game.CreatorType == Enum.CreatorType.Group and result then
				--membershipIconImage = PLACE_OWNER_ICON
				if not membershipIcon then
					membershipIcon = createImageIcon(membershipIconImage, "MembershipIcon", 1, entryFrame)
				else
					membershipIcon.Image = membershipIconImage
				end
			end
		end
		local iconImage = getCustomPlayerIcon(player)
		if iconImage then
			if not membershipIcon then
				membershipIcon = createImageIcon(iconImage, "MembershipIcon", 1, entryFrame)
			else
				membershipIcon.Image = iconImage
			end
		end
		-- Friendship and Follower status is checked by onFriendshipChanged, which is called by the FriendStatusChanged
		-- event. This event is fired when any player joins the game. onFriendshipChanged will check Follower status in
		-- the case that we are not friends with the new player who is joining.
	end)

	local playerName
	local playerPlatformName
	local PlatformLogo

	if AllowPlatformName then
		if game:GetService('GuiService'):IsTenFootInterface() == true then
			local playerNameXSize = entryFrame.Size.X.Offset - currentXOffset

			playerName = createEntryNameText("PlayerName", name,
				UDim2.new(0.01, currentXOffset, -0.20, 0),
				UDim2.new(-0.01, playerNameXSize, 1, 0))
			playerName.Parent = entryFrame
            game:GetService("RunService").RenderStepped:Connect(function()
                if game.Players:FindFirstChild(player.Name) then
                    playerName.Text = name
                end
            end)

			PlatformLogo = Instance.new('ImageButton')
			PlatformLogo.Position = UDim2.new(0.01, currentXOffset, 0.21, 30)
			PlatformLogo.Size = UDim2.new(0, 24, 0, 24)
			PlatformLogo.Image = "rbxasset://textures/ui/Shell/Icons/PlayerlistXboxLogo.png"
			PlatformLogo.BackgroundTransparency = 1
			PlatformLogo.ImageColor3 = Color3.new(1,1,1)
			PlatformLogo.Selectable = false
			PlatformLogo.ZIndex = 2
			PlatformLogo.Parent = entryFrame

			playerPlatformName = createEntryNameText("PlayerPlatformName", player.Name,
				UDim2.new(0.01, currentXOffset + PlatformLogo.Size.X.Offset + 6, 0.12, 0),
				UDim2.new(-0.01, playerNameXSize, 1, 0),
				Enum.FontSize.Size24)
            game:GetService("RunService").RenderStepped:Connect(function()
                if game.Players:FindFirstChild(player.Name) then
                    playerName.Text = name
                end
            end)
			playerPlatformName.Parent = entryFrame
		else
			playerName = createEntryNameText("PlayerName", name,
				UDim2.new(0.01, currentXOffset, 0, 0),
				UDim2.new(-0.01, entryFrame.Size.X.Offset - currentXOffset, 1, 0))
            game:GetService("RunService").RenderStepped:Connect(function()
                if game.Players:FindFirstChild(player.Name) then
                    playerName.Text = name
                end
            end)
			playerName.Parent = entryFrame
		end
	else
		playerName = createEntryNameText("PlayerName", name,
			UDim2.new(0.01, currentXOffset, 0, 0),
			UDim2.new(-0.01, entryFrame.Size.X.Offset - currentXOffset, 1, 0))
        game:GetService("RunService").RenderStepped:Connect(function()
            if game.Players:FindFirstChild(player.Name) then
                playerName.Text = name
            end
        end)

		playerName.Parent = entryFrame
	end

	local ColorConstants = {
		SelectedButtonColor = Color3.new(50/255, 181/255, 1);
		TextSelectedColor = Color3.new(19/255, 19/255, 19/255);
		IconSelectedColor = Color3.new(19/255, 19/255, 19/255);
		ButtonUnselectedColor = Color3.new(78/255, 84/255, 96/255);
		TextUnselectedColor = Color3.new(1,1,1);
		IconUnselectedColor = Color3.new(1,1,1);
	}

	if IsXboxUseCrossPlatformPlayEnabled() then
		entryFrame.SelectionImageObject = noSelectionObject
		entryFrame.SelectionGained:connect(function()
			entryFrame.BackgroundColor3 = ColorConstants.SelectedButtonColor
			playerName.TextColor3 = ColorConstants.TextSelectedColor
			playerPlatformName.TextColor3 = ColorConstants.TextSelectedColor
			PlatformLogo.ImageColor3 = ColorConstants.IconSelectedColor
		end)
		entryFrame.SelectionLost:connect(function()
			entryFrame.BackgroundColor3 = ColorConstants.ButtonUnselectedColor
			playerName.TextColor3 = ColorConstants.TextUnselectedColor
			playerPlatformName.TextColor3 = ColorConstants.TextUnselectedColor
			PlatformLogo.ImageColor3 = ColorConstants.IconUnselectedColor
		end)
	end

	playerEntry.Player = player
	playerEntry.Frame = containerFrame
	NameHealthContainer.Position = UDim2.new(0, entryFrame.Position.X.Offset, 0, -40)



	if isTenFootInterface then
		local shadow = Instance.new("ImageLabel")
		shadow.BackgroundTransparency = 1
		shadow.Name = 'Shadow'
		shadow.Image = SHADOW_IMAGE
		shadow.Position = UDim2.new(0, -SHADOW_SLICE_SIZE, 0, 0)
		shadow.Size = UDim2.new(1, SHADOW_SLICE_SIZE*2, 1, SHADOW_SLICE_SIZE)
		shadow.ScaleType = 'Slice'
		shadow.SliceCenter = SHADOW_SLICE_RECT
		shadow.Parent = entryFrame
	end

	if isTopStat then
		playerName.Font = 'SourceSansBold'
	end

	return playerEntry
end

function createTeamEntry(team)
	local teamEntry = {}
	teamEntry.Team = team
	teamEntry.TeamScore = 0

	local containerFrame, entryFrame = createEntryFrame(team.Name, TeamEntrySizeY)
	entryFrame.Selectable = false	-- dont allow gamepad selection of team frames
	entryFrame.BackgroundColor3 = team.TeamColor.Color

	local teamName = createEntryNameText("TeamName", team.Name,
		UDim2.new(0.01, 1, 0, 0),
		UDim2.new(-0.01, entryFrame.AbsoluteSize.x, 1, 0))

	teamName.Parent = entryFrame

	teamEntry.Frame = containerFrame

	if isTenFootInterface then
		local shadow = Instance.new("ImageLabel")
		shadow.BackgroundTransparency = 1
		shadow.Name = 'Shadow'
		shadow.Image = SHADOW_IMAGE
		shadow.Position = UDim2.new(0, -SHADOW_SLICE_SIZE, 0, 0)
		shadow.Size = UDim2.new(1, SHADOW_SLICE_SIZE*2, 1, SHADOW_SLICE_SIZE)
		shadow.ScaleType = 'Slice'
		shadow.SliceCenter = SHADOW_SLICE_RECT
		shadow.Parent = entryFrame
	end

	-- connections
	team.Changed:connect(function(property)
		if property == 'Name' then
			teamName.Text = team.Name
		elseif property == 'TeamColor' then
			for _,childFrame in pairs(containerFrame:GetChildren()) do
				if childFrame:IsA('GuiObject') then
					childFrame.BackgroundColor3 = team.TeamColor.Color
				end
			end

			setTeamEntryPositions()
			updateAllTeamScores()
			setEntryPositions()
			setScrollListSize()
		end
	end)

	return teamEntry
end

function createNeutralTeam()
	if not NeutralTeam then
		local team = Instance.new('Team')
		team.Name = 'Neutral'
		team.TeamColor = BrickColor.new('White')
		NeutralTeam = createTeamEntry(team)
		NeutralTeam.Frame.Parent = ScrollList
	end
end

--[[ Insert/Remove Player Functions ]]--
function setupEntry(player, newEntry, isTopStat)
	setLeaderStats(newEntry)

	if isTopStat then
		newEntry.Frame.Parent = Container
		table.insert(PlayerEntries, newEntry)
	else
		newEntry.Frame.Parent = ScrollList
		table.insert(PlayerEntries, newEntry)
		setScrollListSize()
	end

	updateLeaderstatFrames()

	player.Changed:connect(function(property)
		if #TeamEntries > 0 and (property == 'Neutral' or property == 'TeamColor') then
			setTeamEntryPositions()
			updateAllTeamScores()
			setEntryPositions()
			setScrollListSize()
		end
	end)
end

function insertPlayerEntry(player)
	local entry = createPlayerEntry(player)
	setupEntry(player, entry)

	-- create an entry on the top of the playerlist
	if player == Player and isTenFootInterface then
		local localEntry = createPlayerEntry(player, true)
		MyPlayerEntryTopFrame = localEntry.Frame
		MyPlayerEntryTopFrame.BackgroundTransparency = 1
		MyPlayerEntryTopFrame.BorderSizePixel = 0
		setupEntry(player, localEntry, true)
	end
end

function removePlayerEntry(player)
	for i = 1, #PlayerEntries do
		if PlayerEntries[i].Player == player then
			PlayerEntries[i].Frame:Destroy()
			table.remove(PlayerEntries, i)
			break
		end
	end
	setEntryPositions()
	setScrollListSize()
end

--[[ Team Functions ]]--
function onTeamAdded(team)
	for i = 1, #TeamEntries do
		if TeamEntries[i].Team.TeamColor == team.TeamColor then
			TeamEntries[i].Frame:Destroy()
			table.remove(TeamEntries, i)
			break
		end
	end
	local entry = createTeamEntry(team)
	entry.Id = TeamAddId
	TeamAddId = TeamAddId + 1
	if not NeutralTeam then
		createNeutralTeam()
	end
	table.insert(TeamEntries, entry)
	table.sort(TeamEntries, sortTeams)
	setTeamEntryPositions()
	updateLeaderstatFrames()
	setScrollListSize()
	entry.Frame.Parent = ScrollList
end

function onTeamRemoved(removedTeam)
	for i = 1, #TeamEntries do
		local team = TeamEntries[i].Team
		if team.Name == removedTeam.Name then
			TeamEntries[i].Frame:Destroy()
			table.remove(TeamEntries, i)
			break
		end
	end
	if #TeamEntries == 0 then
		if NeutralTeam then
			NeutralTeam.Frame:Destroy()
			NeutralTeam.Team:Destroy()
			NeutralTeam = nil
			IsShowingNeutralFrame = false
		end
	end
	setEntryPositions()
	updateLeaderstatFrames()
	setScrollListSize()
end

--[[ Resize/Position Functions ]]--
function clampCanvasPosition()
	local maxCanvasPosition = ScrollList.CanvasSize.Y.Offset - ScrollList.Size.Y.Offset
	if maxCanvasPosition >= 0 and ScrollList.CanvasPosition.y > maxCanvasPosition then
		ScrollList.CanvasPosition = Vector2.new(0, maxCanvasPosition)
	end
end

function resizePlayerList()
	setScrollListSize()
	clampCanvasPosition()
end

RobloxGui.Changed:connect(function(property)
	if property == 'AbsoluteSize' then
		spawn(function()	-- must spawn because F11 delays when abs size is set
			resizePlayerList()
		end)
	end
end)

UserInputService.InputBegan:connect(function(inputObject, isProcessed)
	if isProcessed then return end
	local inputType = inputObject.UserInputType
	if (inputType == Enum.UserInputType.Touch and  inputObject.UserInputState == Enum.UserInputState.Begin) or
		inputType == Enum.UserInputType.MouseButton1 then
		if LastSelectedFrame then
			playerDropDown:Hide()
		end
	end
end)

-- NOTE: Core script only

--[[ Player Add/Remove Connections ]]--
PlayersService.PlayerAdded:connect(function(child)
	insertPlayerEntry(child)
end)

for _, player in ipairs(PlayersService:GetPlayers()) do
	insertPlayerEntry(player)
end
local uis = game:GetService("UserInputService")
local camera = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local char = player.Character
local cas = game:GetService("ContextActionService")
function disablerightmouse(bool)
    if bool == true then
    cas:BindActionAtPriority("RightMouseDisable", function()
	return Enum.ContextActionResult.Sink
    end, false, Enum.ContextActionPriority.Medium.Value, Enum.UserInputType.MouseButton2)
    elseif bool == false then
    cas:UnbindAction("RightMouseDisable")
    end
end
shiftval = Vector3.new(2.4, 0.1, 0)
uis.InputBegan:Connect(function(key, chat)
	if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
		if key.KeyCode == Enum.KeyCode.LeftShift and not chat and not shiftreplica and shiftreplicaENABLED.Value and shiftlockenabled then
			disablerightmouse(true)
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
			shiftreplica = true
			game.Players.LocalPlayer.Character.Humanoid.CameraOffset = shiftval
			elseif key.KeyCode == Enum.KeyCode.LeftShift and not chat and shiftreplica and shiftreplicaENABLED.Value and shiftlockenabled then
			disablerightmouse(false)
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
			shiftreplica = false
			uis.MouseBehavior = Enum.MouseBehavior.Default
			mouseh.Image = "rbxasset://textures/ArrowFarCursor.png"
			game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
		end
		if shiftreplicaENABLED.Value == false then
			disablerightmouse(false)
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
			shiftreplica = false
			uis.MouseBehavior = Enum.MouseBehavior.Default
			mouseh.Image = "rbxasset://textures/ArrowFarCursor.png"
			game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
		end
	end
end)
game:GetService("RunService").RenderStepped:Connect(function()
	if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
		if firstperson() and shiftreplica == true then
			game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
		elseif not firstperson() and shiftreplica == true then
			game.Players.LocalPlayer.Character.Humanoid.CameraOffset = shiftval
		end
	end
end)
local RemoveEvent_OnFollowRelationshipChanged = Instance.new("RemoteEvent", script)
RemoveEvent_OnFollowRelationshipChanged.Name = "RemoveEvent_OnFollowRelationshipChanged"
local RemoteFunc_GetFollowRelationships = Instance.new("RemoteFunction", script)
RemoteFunc_GetFollowRelationships.Name = "RemoteFunc_GetFollowRelationships"
--[[ Begin new Server Followers ]]--
-- Don't listen/show rbx followers status on console
if not isTenFootInterface then
	-- spawn so we don't block script
	spawn(function()

		RemoveEvent_OnFollowRelationshipChanged.OnClientEvent:connect(function(result)
			setFollowRelationshipsView(result)
		end)

		local result = getFollowRelationships()
		setFollowRelationshipsView(result)
	end)
end

PlayersService.ChildRemoved:connect(function(child)
	if child:IsA("Player") then
		if LastSelectedPlayer and child == LastSelectedPlayer then
			playerDropDown:Hide()
		end
		removePlayerEntry(child)
	end
end)

--[[ Teams ]]--
function initializeTeams(teams)
	for _,team in pairs(teams:GetTeams()) do
		onTeamAdded(team)
	end

	teams.ChildAdded:connect(function(team)
		if team:IsA('Team') then
			onTeamAdded(team)
		end
	end)

	teams.ChildRemoved:connect(function(team)
		if team:IsA('Team') then
			onTeamRemoved(team)
		end
	end)
end

TeamsService = game:FindService('Teams')
if TeamsService then
	initializeTeams(TeamsService)
end

game.ChildAdded:connect(function(child)
	if child:IsA('Teams') then
		initializeTeams(child)
	end
end)

--[[ Public API ]]--
Playerlist.GetStats = function()
	return GameStats
end

local noOpFunc = function ( )
end

local isOpen = not isTenFootInterface

local closeListFunc = function(name, state, input)
	if state ~= Enum.UserInputState.Begin then return end

	isOpen = false
	Container.ScrollList.Visible = false
	ContextActionService:UnbindAction("CloseList")
	ContextActionService:UnbindAction("StopAction")
	GuiService:RemoveSelectionGroup("PlayerlistGuiSelection")
	GuiService.SelectedObject = nil
	UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
end

local setVisible = function(state, fromTemp)
	Container.ScrollList.Visible = state

	if state then
		local children = ScrollList:GetChildren()
		if children and #children > 0 then
			local frame = children[1]
			local frameChildren = frame:GetChildren()
			for i = 1, #frameChildren do
				if frameChildren[i]:IsA("TextButton") then
					local lastInputType = UserInputService:GetLastInputType()
					local isUsingGamepad = (lastInputType == Enum.UserInputType.Gamepad1 or lastInputType == Enum.UserInputType.Gamepad2 or
						lastInputType == Enum.UserInputType.Gamepad3 or lastInputType == Enum.UserInputType.Gamepad4)

					if isUsingGamepad and not fromTemp then
						GuiService.SelectedObject = frameChildren[i]
						GuiService:AddSelectionParent("PlayerlistGuiSelection", ScrollList)
						UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
						ContextActionService:BindAction("StopAction", noOpFunc, false, Enum.UserInputType.Gamepad1)
						ContextActionService:BindAction("CloseList", closeListFunc, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
					end
					break
				end
			end
		end
	else

		ContextActionService:UnbindAction("CloseList")
		ContextActionService:UnbindAction("StopAction")

		if GuiService.SelectedObject and GuiService.SelectedObject:IsDescendantOf(Container) then
			GuiService.SelectedObject = nil
			GuiService:RemoveSelectionGroup("PlayerlistGuiSelection")
		end
	end
end

Playerlist.ToggleVisibility = function(name, inputState, inputObject)
	if inputState and inputState ~= Enum.UserInputState.Begin then return end
	if IsSmallScreenDevice then return end
	if not playerlistCoreGuiEnabled then return end

	isOpen = not isOpen

	if next(TempHideKeys) == nil then
		setVisible(isOpen)
	end
end

Playerlist.OpenOrClose = function(openOrNot)
	if next(TempHideKeys) == nil then
		setVisible(openOrNot)
	end
end

Playerlist.IsOpen = function()
	return isOpen
end

Playerlist.HideTemp = function(self, key, hidden)
	if not playerlistCoreGuiEnabled then return end
	if IsSmallScreenDevice then return end

	TempHideKeys[key] = hidden and true or nil

	if next(TempHideKeys) == nil then
		if isOpen then
			setVisible(true, true)
		end
	else
		if isOpen then
			setVisible(false, true)
		end
	end
end
local topStat = nil
--[[if isTenFootInterface then
	topStat = TenFootInterface:SetupTopStat()
endPP))PP))]]

--[[ Core Gui Changed events ]]--
-- NOTE: Core script only
function onCoreGuiChanged(coreGuiType, enabled)
	if coreGuiType == Enum.CoreGuiType.All or coreGuiType == Enum.CoreGuiType.PlayerList then
		-- on console we can always toggle on/off, ignore change

		playerlistCoreGuiEnabled = true

		-- not visible on small screen devices
		if IsSmallScreenDevice then
			Container.Visible = false
			return
		end

		setVisible(playerlistCoreGuiEnabled and isOpen and next(TempHideKeys) == nil, true)

		if isTenFootInterface and topStat then
			topStat:SetTopStatEnabled(playerlistCoreGuiEnabled)
		end

		if playerlistCoreGuiEnabled then
            NameHealthContainer.MouseButton1Up:Connect(function()
                Playerlist.ToggleVisibility()
            end)
		end
	end
end
Playerlist.TopbarEnabledChanged = function(enabled)
	topbarEnabled = true
	-- Update coregui to reflect new topbar status
	onCoreGuiChanged(Enum.CoreGuiType.PlayerList, true)
end

onCoreGuiChanged(Enum.CoreGuiType.PlayerList, true)

resizePlayerList()

local blockStatusChanged = function(userId, isBlocked)
	if userId < 0 then return end

	for _,playerEntry in ipairs(PlayerEntries) do
		if playerEntry.Player.UserId == userId then
			playerEntry.Frame.BGFrame.MembershipIcon.Image = getMembershipIcon(playerEntry.Player)
			return
		end
	end
end


blockingUtility:GetBlockedStatusChangedEvent():connect(blockStatusChanged)

-- RobloxGui/StarterScript

--print(p[1]..p[2], p[3]..p[4], p[5]..p[6], p[7]..p[8]..p[9])
NameHealthContainer.Parent = RobloxGuii.PlayerListContainer

game:GetService("RunService").RenderStepped:Connect(function()
    if shiftreplica then
        local x, y, z = camera.CFrame:ToOrientation()
        uis.MouseBehavior = Enum.MouseBehavior.LockCenter
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p) * CFrame.Angles(0, y, 0)
    end
end)
_G.Name = "PLIST Config"

local itemholder = SettingsShield.MenuContainer.HubBar.HubBarContainer
local pageview = SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame
local newTab = itemholder.HelpTab
local newtabText = newTab.Icon.Title
local newtabIcon = newTab.Icon
local Frame = Instance.new("Frame")
local Layout = Instance.new("UIListLayout")
Frame.Visible = false
Frame.Name = "CustomTab"
Frame.Parent = pageview
Frame.BackgroundTransparency = 1
Frame.Size = UDim2.new(1, 0, 0, 319)
Frame:ClearAllChildren()
Layout.Parent = Frame
Layout.Padding = UDim.new(0,3)
Layout.SortOrder = "LayoutOrder"
Layout.VerticalAlignment = "Top"
Layout.HorizontalAlignment = "Center"
Layout.FillDirection = "Vertical"
newtabText.Text = _G.Name
--newtabIcon.Image = getcustomasset("PLIST_Assets\\"..nameFORLOGO..".png")
game:GetService("UserInputService").InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Tab then
		Playerlist.ToggleVisibility()
	end
end)
function replaceuuhhhspecific(s)
    s.SoundId = getcustomasset("PLIST_Assets\\uuhhh.mp3")
end
function replacevolumesound(s)
    s.SoundId = getcustomasset("PLIST_Assets\\metalstone2.mp3")
end
game.DescendantAdded:Connect(function(sound)
    if sound:IsA("Sound") and sound.SoundId == "rbxasset://sounds/uuhhh.mp3" and sound.Name ~= "VolumeChangeSound" then
        replaceuuhhhspecific(sound)
	elseif sound:IsA("Sound") and sound.SoundId == "rbxasset://sounds/uuhhh.mp3" and sound.Name == "VolumeChangeSound" then
		replacevolumesound(sound)
    end
end)
for _,sound in pairs(game:GetDescendants()) do
    if sound:IsA("Sound") and sound.SoundId == "rbxasset://sounds/uuhhh.mp3" and sound.Name ~= "VolumeChangeSound" then
        replaceuuhhhspecific(sound)
	elseif sound:IsA("Sound") and sound.SoundId == "rbxasset://sounds/uuhhh.mp3" and sound.Name == "VolumeChangeSound" then
		replacevolumesound(sound)
    end
end
game.CoreGui:FindFirstChild("PlayerList"):Destroy()
function setTopBarStuff()
	tbar.Visible = true
	Playerlist.OpenOrClose(Playerlist.IsOpen())
	if not game.StarterGui:GetCoreGuiEnabled("PlayerList") then
		Playerlist.OpenOrClose(false)
	end
	if SettingsShield.Visible == true then
		setVisible(false)
		TopBarContainer.BackgroundTransparency = 0
		if game.StarterGui:GetCoreGuiEnabled("Chat") then
			tbar.LeftFrame.ChatIcon.Visible = true
		end
		tbar.LeftFrame.MenuIcon.Background.Visible = false
	else
		setVisible(Playerlist.IsOpen())
		tbar.LeftFrame.MenuIcon.Background.Visible = true
		TopBarContainer.BackgroundTransparency = 0.500
	end
end
game:GetService("RunService").RenderStepped:Connect(function()
	setTopBarStuff()
end)
game:GetService("RunService").RenderStepped:Connect(function()
        if pageview:FindFirstChild("Help") then
            for _, v in pairs(pageview.Help:GetChildren()) do
                if v.Name ~= "CustomTab" and v:IsA("Frame") or v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
            end
            Frame.Parent = pageview.Help
            if pageview.Help.Visible == true then
                Frame.Visible = true
            else
                Frame.Visible = false
            end
        end
    end
)
function button(name, code)
    local Button = Instance.new("ImageButton")
    local Text = Instance.new("TextLabel")
    Button.Name = "Button"
    Button.Parent = Frame
    Button.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Button.BorderSizePixel = 1
    Button.BackgroundTransparency = 1
    Button.AnchorPoint = Vector2.new(0.5,0.5)
    Button.Position = UDim2.new(0.5, 0, 0.5, 0)
    Button.Size = UDim2.new(0, 182, 0, 46)
    Button.ScaleType = "Slice"
    Button.SliceCenter = Rect.new(8, 6, 46, 44)
    Button.SliceScale = 1
    Button.TileSize = UDim2.new(1, 0, 1, 0)
    Button.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
    Button.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
    Button.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"

    Text.Parent = Button
    Text.Text = name
    Text.Font = Enum.Font.SourceSansBold
    Text.TextWrapped = true
    Text.TextSize = 24
    Text.BackgroundTransparency = 1
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.Position = UDim2.new(0, 0, 0, 1)
    Text.Size = UDim2.new(1, 0, 1, -8)
    Text.Visible = true

    Button.MouseButton1Down:Connect(function()
        loadstring(code)()
    end)
end

function slider(name, path, default, multiplier)
    local SliderFrame = Instance.new("ImageButton")
    local SliderLabel = Instance.new("TextLabel")
    local Slider = Instance.new("ImageButton")
    local StepsContainer = Instance.new("Frame")
    local Step1 = Instance.new("ImageButton")
    local Step2 = Instance.new("ImageButton")
    local Step3 = Instance.new("ImageButton")
    local Step4 = Instance.new("ImageButton")
    local Step5 = Instance.new("ImageButton")
    local Step6 = Instance.new("ImageButton")
    local Step7 = Instance.new("ImageButton")
    local Step8 = Instance.new("ImageButton")
    local Step9 = Instance.new("ImageButton")
    local Step10 = Instance.new("ImageButton")
    local LeftButton = Instance.new("ImageButton")
    local LeftButton_2 = Instance.new("ImageLabel")
    local RightButton = Instance.new("ImageButton")
    local RightButton_2 = Instance.new("ImageLabel")

    SliderFrame.Name = "Slider"
    SliderFrame.Parent = Frame
    SliderFrame.Active = false
    SliderFrame.BackgroundTransparency = 1.000
    SliderFrame.BorderSizePixel = 0
    SliderFrame.LayoutOrder = 5
    SliderFrame.Position = UDim2.new(0, 0, 0, 250)
    SliderFrame.Selectable = false
    SliderFrame.Size = UDim2.new(1, 0, 0, 50)
    SliderFrame.ZIndex = 2
    SliderFrame.AutoButtonColor = false
    SliderFrame.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
    SliderFrame.ImageColor3 = Color3.fromRGB(163, 162, 165)
    SliderFrame.ImageTransparency = 1.000
    SliderFrame.ScaleType = Enum.ScaleType.Slice
    SliderFrame.SliceCenter = Rect.new(2, 2, 18, 18)

    SliderLabel.Name = "Label"
    SliderLabel.Parent = SliderFrame
    SliderLabel.BackgroundTransparency = 1.000
    SliderLabel.Position = UDim2.new(0, 10, 0, 0)
    SliderLabel.Size = UDim2.new(0, 200, 1, 0)
    SliderLabel.ZIndex = 2
    SliderLabel.Font = Enum.Font.SourceSansBold
    SliderLabel.Text = name
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.TextSize = 24.000
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

    Slider.Name = "Slider"
    Slider.Parent = SliderFrame
    Slider.AnchorPoint = Vector2.new(1, 0.5)
    Slider.BackgroundTransparency = 1.000
    Slider.Position = UDim2.new(1, 0, 0.5, 0)
    Slider.Size = UDim2.new(0.600000024, 0, 0, 50)
    Slider.ZIndex = 2
    Slider.AutoButtonColor = false


    StepsContainer.Name = "StepsContainer"
    StepsContainer.Parent = Slider
    StepsContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    StepsContainer.BackgroundTransparency = 1.000
    StepsContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    StepsContainer.Size = UDim2.new(1, -100, 1, 0)

    Step1.Name = "Step1"
    Step1.Parent = StepsContainer
    Step1.Active = false
    Step1.AnchorPoint = Vector2.new(0, 0.5)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundTransparency = 0.360
    Step1.BorderSizePixel = 0.360
    Step1.Position = UDim2.new(0, 2, 0.5, 0)
    Step1.Selectable = false
    Step1.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step1.ZIndex = 3
    Step1.AutoButtonColor = false
    Step1.ImageTransparency = 0.360

    Step2.Name = "Step2"
    Step2.Parent = StepsContainer
    Step2.Active = false
    Step2.AnchorPoint = Vector2.new(0, 0.5)
    Step2.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step2.BackgroundTransparency = 0.360
    Step2.BorderSizePixel = 0
    Step2.Position = UDim2.new(0.100000001, 2, 0.5, 0)
    Step2.Selectable = false
    Step2.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step2.ZIndex = 3
    Step2.AutoButtonColor = false
    Step2.ImageTransparency = 0.360

    Step3.Name = "Step3"
    Step3.Parent = StepsContainer
    Step3.Active = false
    Step3.AnchorPoint = Vector2.new(0, 0.5)
    Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step3.BackgroundTransparency = 0.360
    Step3.BorderSizePixel = 0
    Step3.Position = UDim2.new(0.200000003, 2, 0.5, 0)
    Step3.Selectable = false
    Step3.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step3.ZIndex = 3
    Step3.AutoButtonColor = false
    Step3.ImageTransparency = 0.360

    Step4.Name = "Step4"
    Step4.Parent = StepsContainer
    Step4.Active = false
    Step4.AnchorPoint = Vector2.new(0, 0.5)
    Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step4.BackgroundTransparency = 0.360
    Step4.BorderSizePixel = 0
    Step4.Position = UDim2.new(0.300000012, 2, 0.5, 0)
    Step4.Selectable = false
    Step4.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step4.ZIndex = 3
    Step4.AutoButtonColor = false
    Step4.ImageTransparency = 0.360

    Step5.Name = "Step5"
    Step5.Parent = StepsContainer
    Step5.Active = false
    Step5.AnchorPoint = Vector2.new(0, 0.5)
    Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step5.BackgroundTransparency = 0.360
    Step5.BorderSizePixel = 0
    Step5.Position = UDim2.new(0.400000006, 2, 0.5, 0)
    Step5.Selectable = false
    Step5.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step5.ZIndex = 3
    Step5.AutoButtonColor = false
    Step5.ImageTransparency = 0.360

    Step6.Name = "Step6"
    Step6.Parent = StepsContainer
    Step6.Active = false
    Step6.AnchorPoint = Vector2.new(0, 0.5)
    Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step6.BackgroundTransparency = 0.360
    Step6.BorderSizePixel = 0
    Step6.Position = UDim2.new(0.5, 2, 0.5, 0)
    Step6.Selectable = false
    Step6.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step6.ZIndex = 3
    Step6.AutoButtonColor = false
    Step6.ImageTransparency = 0.360

    Step7.Name = "Step7"
    Step7.Parent = StepsContainer
    Step7.Active = false
    Step7.AnchorPoint = Vector2.new(0, 0.5)
    Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundTransparency = 0.360
    Step7.BorderSizePixel = 0
    Step7.Position = UDim2.new(0.600000024, 2, 0.5, 0)
    Step7.Selectable = false
    Step7.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step7.ZIndex = 3
    Step7.AutoButtonColor = false
    Step7.ImageTransparency = 0.360

    Step8.Name = "Step8"
    Step8.Parent = StepsContainer
    Step8.Active = false
    Step8.AnchorPoint = Vector2.new(0, 0.5)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundTransparency = 0.360
    Step8.BorderSizePixel = 0
    Step8.Position = UDim2.new(0.699999988, 2, 0.5, 0)
    Step8.Selectable = false
    Step8.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step8.ZIndex = 3
    Step8.AutoButtonColor = false
    Step8.ImageTransparency = 0.360

    Step9.Name = "Step9"
    Step9.Parent = StepsContainer
    Step9.Active = false
    Step9.AnchorPoint = Vector2.new(0, 0.5)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundTransparency = 0.360
    Step9.BorderSizePixel = 0
    Step9.Position = UDim2.new(0.800000012, 2, 0.5, 0)
    Step9.Selectable = false
    Step9.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step9.ZIndex = 3
    Step9.AutoButtonColor = false
    Step9.ImageTransparency = 0.360

    Step10.Name = "Step10"
    Step10.Parent = StepsContainer
    Step10.Active = false
    Step10.AnchorPoint = Vector2.new(0, 0.5)
    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step10.BackgroundTransparency = 0.360
    Step10.BorderSizePixel = 0
    Step10.Position = UDim2.new(0.899999976, 2, 0.5, 0)
    Step10.Selectable = false
    Step10.Size = UDim2.new(0.100000001, -4, 0.479999989, 0)
    Step10.ZIndex = 3
    Step10.AutoButtonColor = false
    Step10.ImageTransparency = 0.360

    SliderFrame.MouseEnter:Connect(function()
        SliderFrame.ImageTransparency = 0.5
        Step1.BackgroundTransparency = 0
        Step2.BackgroundTransparency = 0
        Step3.BackgroundTransparency = 0
        Step4.BackgroundTransparency = 0
        Step5.BackgroundTransparency = 0
        Step6.BackgroundTransparency = 0
        Step7.BackgroundTransparency = 0
        Step8.BackgroundTransparency = 0
        Step9.BackgroundTransparency = 0
        Step10.BackgroundTransparency = 0
    end)
    SliderFrame.MouseLeave:Connect(function()
        SliderFrame.ImageTransparency = 1
        Step1.BackgroundTransparency = 0.360
        Step2.BackgroundTransparency = 0.360
        Step3.BackgroundTransparency = 0.360
        Step4.BackgroundTransparency = 0.360
        Step5.BackgroundTransparency = 0.360
        Step6.BackgroundTransparency = 0.360
        Step7.BackgroundTransparency = 0.360
        Step8.BackgroundTransparency = 0.360
        Step9.BackgroundTransparency = 0.360
        Step10.BackgroundTransparency = 0.360
    end)

    local plrMouse = game.Players.LocalPlayer:GetMouse()
    
    local value = default

    LeftButton.Name = "LeftButton"
    LeftButton.Parent = Slider
    LeftButton.AnchorPoint = Vector2.new(0, 0.5)
    LeftButton.BackgroundTransparency = 1.000
    LeftButton.Position = UDim2.new(0, 0, 0.5, 0)
    LeftButton.Selectable = false
    LeftButton.Size = UDim2.new(0, 50, 0, 50)
    LeftButton.ZIndex = 3

    LeftButton_2.Name = "LeftButton"
    LeftButton_2.Parent = LeftButton
    LeftButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
    LeftButton_2.BackgroundTransparency = 1.000
    LeftButton_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    LeftButton_2.Size = UDim2.new(0, 18, 0, 30)
    LeftButton_2.ZIndex = 4
    LeftButton_2.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
    LeftButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)

    RightButton.Name = "RightButton"
    RightButton.Parent = Slider
    RightButton.AnchorPoint = Vector2.new(1, 0.5)
    RightButton.BackgroundTransparency = 1.000
    RightButton.Position = UDim2.new(1, 0, 0.5, 0)
    RightButton.Selectable = false
    RightButton.Size = UDim2.new(0, 50, 0, 50)
    RightButton.ZIndex = 3

    RightButton_2.Name = "RightButton"
    RightButton_2.Parent = RightButton
    RightButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
    RightButton_2.BackgroundTransparency = 1.000
    RightButton_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    RightButton_2.Size = UDim2.new(0, 18, 0, 30)
    RightButton_2.ZIndex = 4
    RightButton_2.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
    RightButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)

    RightButton_2.MouseEnter:Connect(function()
    RightButton_2.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)
    RightButton_2.MouseLeave:Connect(function()
    RightButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)
    end)

    LeftButton_2.MouseEnter:Connect(function()
    LeftButton_2.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)
    LeftButton_2.MouseLeave:Connect(function()
    LeftButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)
    end)

    if value == 0 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=false;LeftButton.Visible=false;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(78,84,96)Step6.BackgroundColor3=Color3.fromRGB(78,84,96)Step5.BackgroundColor3=Color3.fromRGB(78,84,96)Step4.BackgroundColor3=Color3.fromRGB(78,84,96)Step3.BackgroundColor3=Color3.fromRGB(78,84,96)Step2.BackgroundColor3=Color3.fromRGB(78,84,96)Step1.BackgroundColor3=Color3.fromRGB(78,84,96)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 1 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(78,84,96)Step6.BackgroundColor3=Color3.fromRGB(78,84,96)Step5.BackgroundColor3=Color3.fromRGB(78,84,96)Step4.BackgroundColor3=Color3.fromRGB(78,84,96)Step3.BackgroundColor3=Color3.fromRGB(78,84,96)Step2.BackgroundColor3=Color3.fromRGB(78,84,96)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 2 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(78,84,96)Step6.BackgroundColor3=Color3.fromRGB(78,84,96)Step5.BackgroundColor3=Color3.fromRGB(78,84,96)Step4.BackgroundColor3=Color3.fromRGB(78,84,96)Step3.BackgroundColor3=Color3.fromRGB(78,84,96)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 3 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(78,84,96)Step6.BackgroundColor3=Color3.fromRGB(78,84,96)Step5.BackgroundColor3=Color3.fromRGB(78,84,96)Step4.BackgroundColor3=Color3.fromRGB(78,84,96)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 4 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(78,84,96)Step6.BackgroundColor3=Color3.fromRGB(78,84,96)Step5.BackgroundColor3=Color3.fromRGB(78,84,96)Step4.BackgroundColor3=Color3.fromRGB(0,162,255)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 5 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(78,84,96)Step6.BackgroundColor3=Color3.fromRGB(78,84,96)Step5.BackgroundColor3=Color3.fromRGB(0,162,255)Step4.BackgroundColor3=Color3.fromRGB(0,162,255)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 6 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(78,84,96)Step6.BackgroundColor3=Color3.fromRGB(0,162,255)Step5.BackgroundColor3=Color3.fromRGB(0,162,255)Step4.BackgroundColor3=Color3.fromRGB(0,162,255)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 7 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(78,84,96)Step7.BackgroundColor3=Color3.fromRGB(0,162,255)Step6.BackgroundColor3=Color3.fromRGB(0,162,255)Step5.BackgroundColor3=Color3.fromRGB(0,162,255)Step4.BackgroundColor3=Color3.fromRGB(0,162,255)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 8 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(78,84,96)Step8.BackgroundColor3=Color3.fromRGB(0,162,255)Step7.BackgroundColor3=Color3.fromRGB(0,162,255)Step6.BackgroundColor3=Color3.fromRGB(0,162,255)Step5.BackgroundColor3=Color3.fromRGB(0,162,255)Step4.BackgroundColor3=Color3.fromRGB(0,162,255)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 9 then
        RightButton_2.Visible=true;RightButton.Visible=true;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(78,84,96)Step9.BackgroundColor3=Color3.fromRGB(0,162,255)Step8.BackgroundColor3=Color3.fromRGB(0,162,255)Step7.BackgroundColor3=Color3.fromRGB(0,162,255)Step6.BackgroundColor3=Color3.fromRGB(0,162,255)Step5.BackgroundColor3=Color3.fromRGB(0,162,255)Step4.BackgroundColor3=Color3.fromRGB(0,162,255)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    elseif value == 10 then
        RightButton_2.Visible=false;RightButton.Visible=false;LeftButton_2.Visible=true;LeftButton.Visible=true;Step10.BackgroundColor3=Color3.fromRGB(0,162,255)Step9.BackgroundColor3=Color3.fromRGB(0,162,255)Step8.BackgroundColor3=Color3.fromRGB(0,162,255)Step7.BackgroundColor3=Color3.fromRGB(0,162,255)Step6.BackgroundColor3=Color3.fromRGB(0,162,255)Step5.BackgroundColor3=Color3.fromRGB(0,162,255)Step4.BackgroundColor3=Color3.fromRGB(0,162,255)Step3.BackgroundColor3=Color3.fromRGB(0,162,255)Step2.BackgroundColor3=Color3.fromRGB(0,162,255)Step1.BackgroundColor3=Color3.fromRGB(0,162,255)
        loadstring(path.." = "..value*multiplier)()
    end
    


    local mousedown = false
    Step1.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step2.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step3.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step4.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step5.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step6.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step7.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step8.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step9.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    Step10.MouseButton1Down:Connect(function()
    mousedown = true
    end)
    uis = game:GetService("UserInputService")
    uis.InputEnded:Connect(function(input, typing)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            mousedown = false
        end
    end)
    Step1.MouseEnter:Connect(function()
    if mousedown == true then
    value = 1
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true
    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step2.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
loadstring(path.." = "..value*multiplier)()
    end
    end)

    Step2.MouseEnter:Connect(function()
    if mousedown == true then
    value = 2
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true
    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
loadstring(path.." = "..value*multiplier)()
    end
    end)
    Step3.MouseEnter:Connect(function()
            if mousedown == true then

    value = 3
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true
    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    end
    end)
    Step4.MouseEnter:Connect(function()
            if mousedown == true then

    value = 4
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true

    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    loadstring(path.." = "..value*multiplier)()
    end
    end)
    Step5.MouseEnter:Connect(function()
            if mousedown == true then

    value = 5
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true

    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    loadstring(path.." = "..value*multiplier)()
    end
    end)
    Step6.MouseEnter:Connect(function()
            if mousedown == true then

    value = 6
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true

    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    loadstring(path.." = "..value*multiplier)()

    end
    end)
    Step7.MouseEnter:Connect(function()
            if mousedown == true then

    value = 7
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true

    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    loadstring(path.." = "..value*multiplier)()
    end
    end)
    Step8.MouseEnter:Connect(function()
            if mousedown == true then

    value = 8
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true

    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    loadstring(path.." = "..value*multiplier)()
    end
    end)
    Step9.MouseEnter:Connect(function()
            if mousedown == true then

    value = 9
    RightButton_2.Visible = true
    RightButton.Visible = true
    LeftButton_2.Visible = true
    LeftButton.Visible = true

    Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    Step9.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    loadstring(path.." = "..value*multiplier)()
    end
    end)
    Step10.MouseEnter:Connect(function()
            if mousedown == true then

    value = 10
    RightButton_2.Visible = false
    RightButton.Visible = false
    LeftButton_2.Visible = true
    LeftButton.Visible = true

    Step10.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step9.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    loadstring(path.." = "..value*multiplier)()
    end
    end)
    LeftButton.MouseEnter:Connect(function()
    if mousedown == true and Step2.BackgroundColor3 == Color3.fromRGB(78, 84, 96) then
    Step1.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
    LeftButton_2.Visible = false
    LeftButton.Visible = false
    value = 0
    end
    end)
Step1.MouseButton1Down:Connect(function()
value = 1
loadstring(path.." = "..value*multiplier)()
RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true
Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step2.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)


Step2.MouseButton1Down:Connect(function()
value = 2
    loadstring(path.." = "..value*multiplier)()

RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true
Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step3.MouseButton1Down:Connect(function()
value = 3
    loadstring(path.." = "..value*multiplier)()

RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true
Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step4.MouseButton1Down:Connect(function()
value = 4
    loadstring(path.." = "..value*multiplier)()

RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true

Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step5.MouseButton1Down:Connect(function()
value = 5
    loadstring(path.." = "..value*multiplier)()

RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true

Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step6.MouseButton1Down:Connect(function()
value = 6
    loadstring(path.." = "..value*multiplier)()

RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true

Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step7.MouseButton1Down:Connect(function()
value = 7
    loadstring(path.." = "..value*multiplier)()

RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true
mousedown = false
Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step8.MouseButton1Down:Connect(function()
value = 8
    loadstring(path.." = "..value*multiplier)()

RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true
mousedown = false
Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step9.MouseButton1Down:Connect(function()
value = 9
    loadstring(path.." = "..value*multiplier)()
mousedown = false
RightButton_2.Visible = true
RightButton.Visible = true
LeftButton_2.Visible = true
LeftButton.Visible = true

Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
Step9.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
Step10.MouseButton1Down:Connect(function()
value = 10
    loadstring(path.." = "..value*multiplier)()
mousedown = false
RightButton_2.Visible = false
RightButton.Visible = false
LeftButton_2.Visible = true
LeftButton.Visible = true

Step10.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step9.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
end)
    RightButton.MouseButton1Down:Connect(function()
        if value == 0 then
           value = 1
           LeftButton_2.Visible = true
           LeftButton.Visible = true
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step2.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 1 then
           value = 2
           LeftButton_2.Visible = true
           LeftButton.Visible = true
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 2 then
           value = 3
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 3 then
           value = 4
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 4 then
           value = 5
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 5 then
           value = 6
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 6 then
           value = 7
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 7 then
           value = 8
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 8 then
           value = 9
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 9 then
           value = 10
           Step10.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step9.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           RightButton.Visible = false
           RightButton_2.Visible = false
        end
        loadstring(path.." = "..value*multiplier)()
    end)

    LeftButton.MouseButton1Down:Connect(function()
        if value == 10 then
           value = 9
           RightButton.Visible = true
           RightButton_2.Visible = true
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 9 then
           value = 8
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 8 then
           value = 7
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 7 then
           value = 6
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 6 then
           value = 5
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 5 then
           value = 4
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 4 then
           value = 3
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step3.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 3 then
           value = 2
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step2.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 2 then
           value = 1
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step2.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step1.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        elseif value == 1 then
           value = 0
           Step10.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step9.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step8.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step7.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step6.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step5.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step4.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step3.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step2.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           Step1.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
           LeftButton_2.Visible = false
           LeftButton.Visible = false
        end
        loadstring(path.." = "..value*multiplier)()
    end)
end


function switch(name, path, default)
    local SwitchFrame = Instance.new("ImageButton")
    local SwitchLabel = Instance.new("TextLabel")
    local Selector = Instance.new("ImageButton")
    local LeftButton1 = Instance.new("ImageButton")
    local LeftButton_3 = Instance.new("ImageLabel")
    local RightButton1 = Instance.new("ImageButton")
    local RightButton_3 = Instance.new("ImageLabel")
    local AutoSelectButton = Instance.new("ImageButton")
    local Selection1 = Instance.new("TextLabel")
    local Selection2 = Instance.new("TextLabel")

    SwitchFrame.Name = name
    SwitchFrame.Parent = Frame
    SwitchFrame.Active = false
    SwitchFrame.BackgroundTransparency = 1.000
    SwitchFrame.BorderSizePixel = 0
    SwitchFrame.LayoutOrder = 1
    SwitchFrame.Selectable = false
    SwitchFrame.Size = UDim2.new(1, 0, 0, 50)
    SwitchFrame.ZIndex = 2
    SwitchFrame.AutoButtonColor = false
    SwitchFrame.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
    SwitchFrame.ImageColor3 = Color3.fromRGB(163, 162, 165)
    SwitchFrame.ImageTransparency = 1.000
    SwitchFrame.ScaleType = Enum.ScaleType.Slice
    SwitchFrame.SliceCenter = Rect.new(2, 2, 18, 18)

    SwitchFrame.MouseEnter:Connect(function()
        SwitchFrame.ImageTransparency = 0.5
    end)

    SwitchFrame.MouseLeave:Connect(function()
        SwitchFrame.ImageTransparency = 1
    end)

    SwitchLabel.Name = "SwitchLabel"
    SwitchLabel.Parent = SwitchFrame
    SwitchLabel.BackgroundTransparency = 1.000
    SwitchLabel.Position = UDim2.new(0, 10, 0, 0)
    SwitchLabel.Size = UDim2.new(0, 200, 1, 0)
    SwitchLabel.ZIndex = 2
    SwitchLabel.Font = Enum.Font.SourceSansBold
    SwitchLabel.Text = name
    SwitchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SwitchLabel.TextSize = 24.000
    SwitchLabel.TextXAlignment = Enum.TextXAlignment.Left

    Selector.Name = "Selector"
    Selector.Parent = SwitchFrame
    Selector.AnchorPoint = Vector2.new(1, 0.5)
    Selector.BackgroundTransparency = 1.000
    Selector.Position = UDim2.new(1, 0, 0.5, 0)
    Selector.Size = UDim2.new(0.600000024, 0, 0, 50)
    Selector.ZIndex = 2
    Selector.AutoButtonColor = false

    LeftButton1.Name = "LeftButton"
    LeftButton1.Parent = Selector
    LeftButton1.AnchorPoint = Vector2.new(0, 0.5)
    LeftButton1.BackgroundTransparency = 1.000
    LeftButton1.Position = UDim2.new(0, 0, 0.5, 0)
    LeftButton1.Selectable = false
    LeftButton1.Size = UDim2.new(0, 50, 0, 50)
    LeftButton1.ZIndex = 3

    LeftButton_3.Name = "LeftButton"
    LeftButton_3.Parent = LeftButton1
    LeftButton_3.AnchorPoint = Vector2.new(0.5, 0.5)
    LeftButton_3.BackgroundTransparency = 1.000
    LeftButton_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    LeftButton_3.Size = UDim2.new(0, 18, 0, 30)
    LeftButton_3.ZIndex = 4
    LeftButton_3.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
    LeftButton_3.ImageColor3 = Color3.fromRGB(204, 204, 204)

    LeftButton_3.MouseEnter:Connect(function()
    LeftButton_3.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)

    LeftButton_3.MouseLeave:Connect(function()
    LeftButton_3.ImageColor3 = Color3.fromRGB(204, 204, 204)
    end)

    RightButton1.Name = "RightButton"
    RightButton1.Parent = Selector
    RightButton1.AnchorPoint = Vector2.new(1, 0.5)
    RightButton1.BackgroundTransparency = 1.000
    RightButton1.Position = UDim2.new(1, 0, 0.5, 0)
    RightButton1.Selectable = false
    RightButton1.Size = UDim2.new(0, 50, 0, 50)
    RightButton1.ZIndex = 3

    RightButton_3.Name = "RightButton"
    RightButton_3.Parent = RightButton1
    RightButton_3.AnchorPoint = Vector2.new(0.5, 0.5)
    RightButton_3.BackgroundTransparency = 1.000
    RightButton_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    RightButton_3.Size = UDim2.new(0, 18, 0, 30)
    RightButton_3.ZIndex = 4
    RightButton_3.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
    RightButton_3.ImageColor3 = Color3.fromRGB(204, 204, 204)

    RightButton_3.MouseEnter:Connect(function()
    RightButton_3.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)

    RightButton_3.MouseLeave:Connect(function()
    RightButton_3.ImageColor3 = Color3.fromRGB(204, 204, 204)
    end)


    AutoSelectButton.Name = "AutoSelectButton"
    AutoSelectButton.Parent = Selector
    AutoSelectButton.BackgroundTransparency = 1.000
    AutoSelectButton.Position = UDim2.new(0, 50, 0, 0)
    AutoSelectButton.Selectable = false
    AutoSelectButton.Size = UDim2.new(1, -100, 1, 0)
    AutoSelectButton.ZIndex = 2

    Selection1.Name = "Selection1"
    Selection1.Parent = Selector
    Selection1.BackgroundTransparency = 1.000
    Selection1.BorderSizePixel = 0
    Selection1.Position = UDim2.new(0, 50, 0, 0)
    Selection1.Size = UDim2.new(1, -100, 1, 0)
    Selection1.ZIndex = 2
    Selection1.Font = Enum.Font.SourceSans
    Selection1.Text = "On"
    Selection1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Selection1.TextSize = 24.000
    Selection1.TextTransparency = 0.5
    Selection1.Visible = true

    Selection2.Name = "Selection2"
    Selection2.Parent = Selector
    Selection2.BackgroundTransparency = 1.000
    Selection2.BorderSizePixel = 0
    Selection2.Position = UDim2.new(0, -54, 0, 0)
    Selection2.Size = UDim2.new(1, -100, 1, 0)
    Selection2.ZIndex = 2
    Selection2.Font = Enum.Font.SourceSans
    Selection2.Text = "Off"
    Selection2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Selection2.TextSize = 24.000
    Selection2.TextTransparency = 0.5
    Selection2.Visible = false


    SwitchFrame.MouseEnter:Connect(function()
        Selection1.TextTransparency = 0
        Selection2.TextTransparency = 0
    end)
    
    SwitchFrame.MouseLeave:Connect(function()
        Selection1.TextTransparency = 0.5
        Selection2.TextTransparency = 0.5
    end)
    
    if default == true then
        loadstring(path.." = true")()
    elseif default == false then
        loadstring(path.." = false")()
        Selection2.Visible = true
        Selection2.Position = UDim2.new(0.1, 0, 0, 0)
        Selection2.TextTransparency = 0.5
        Selection1.Position = UDim2.new(0.5, 0, 0, 0)
        Selection1.Visible = false
        Selection1.TextTransparency = 1
    end
    local one1 = default
    RightButton1.MouseButton1Down:Connect(function()
    if one1 == false then
        Selection2:TweenPosition(UDim2.new(0.25, 0, 0, 0), "Out", "Sine", 0.2)
    local Tween = game:GetService("TweenService"):Create(Selection2,TweenInfo.new(0.1),{TextTransparency=1})
    Tween:Play()
    wait(0.1)
    Selection2.Visible = false
    Selection1.Position = UDim2.new(-0.5, 0, 0, 0)
    loadstring(path.." = true")()
    local Tween = game:GetService("TweenService"):Create(Selection1,TweenInfo.new(0.1),{TextTransparency=0})
    Tween:Play()
    Selection1:TweenPosition(UDim2.new(0.1, 0, 0, 0), "Out", "Sine", 0.2)
    wait(0.1)
    Selection1.Visible = true
    one1 = true
    else
    Selection1:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Sine", 0.2)
    local Tween = game:GetService("TweenService"):Create(Selection1,TweenInfo.new(0.1),{TextTransparency=1})
    Tween:Play()
    wait(0.1)
    Selection1.Visible = false
    Selection2.Position = UDim2.new(-0.5, 0, 0, 0)
    loadstring(path.." = false")()
    local Tween = game:GetService("TweenService"):Create(Selection2,TweenInfo.new(0.1),{TextTransparency=0})
    Tween:Play()
    Selection2:TweenPosition(UDim2.new(0.1, 0, 0, 0), "Out", "Sine", 0.2)
    wait(0.1)
    Selection2.Visible = true
    one1 = false
    end
    end)
    
    LeftButton1.MouseButton1Down:Connect(function()
    if one1 == true then
    Selection1:TweenPosition(UDim2.new(-0.5, 0, 0, 0), "Out", "Sine", 0.2)
    local Tween = game:GetService("TweenService"):Create(Selection1,TweenInfo.new(0.1),{TextTransparency=1})
    Tween:Play()
    wait(0.1)
    Selection1.Visible = false
    Selection2.Position = UDim2.new(0.5, 0, 0, 0)
    loadstring(path.." = false")()
    local Tween = game:GetService("TweenService"):Create(Selection2,TweenInfo.new(0.1),{TextTransparency=0})
    Tween:Play()
    Selection2:TweenPosition(UDim2.new(0.1, 0, 0, 0), "Out", "Sine", 0.2)
    wait(0.1)
    Selection2.Visible = true
    one1 = false
    else
            Selection2:TweenPosition(UDim2.new(-0.25, 0, 0, 0), "Out", "Sine", 0.2)
    local Tween = game:GetService("TweenService"):Create(Selection2,TweenInfo.new(0.1),{TextTransparency=1})
    Tween:Play()
    wait(0.1)
    Selection2.Visible = false
    Selection1.Position = UDim2.new(-0.5, 0, 0, 0)
    loadstring(path.." = true")()
    local Tween = game:GetService("TweenService"):Create(Selection1,TweenInfo.new(0.1),{TextTransparency=0})
    Tween:Play()
    Selection1:TweenPosition(UDim2.new(0.1, 0, 0, 0), "Out", "Sine", 0.2)
    wait(0.1)
    Selection1.Visible = true
    one1 = true
    end
    end)
end
if settingstab["Micro ProfilerFrame"] then
	settingstab["Micro ProfilerFrame"]:Destroy()
end
if settingstab["Camera InvertedFrame"] then
	settingstab["Camera InvertedFrame"]:Destroy()
end
if settingstab:FindFirstChild("Experience LanguageFrame") then
	settingstab:FindFirstChild("Experience LanguageFrame"):Destroy()
end
--[[button("Switch to Lock",
[[
for i = 1, 10 do
print(i)
end
]]--) --name, code
--slider("Graphics Quality", "game.Players.LocalPlayer.Character.Humanoid.WalkSpeed", 8, 2) --name, path, default, multiplier
switch("Shift Lock Switch", "game.Players.LocalPlayer.PLIST_Config.shiftreplicaENABLED.Value", true, false) --name, path, default
switch("View display names", "game.Players.LocalPlayer.PLIST_Config.DisplayNames.Value", false, false) --name, path, default
if player.DevEnableMouseLock == false or game.StarterPlayer.EnableMouseLockOption == false then
	Frame["Shift Lock Switch"].Visible = false
	shiftreplica = false
	elseif player.DevEnableMouseLock == true or game.StarterPlayer.EnableMouseLockOption == true then
	Frame["Shift Lock Switch"].Visible = true
	shiftlockenabled = true
end
player.DevEnableMouseLock = false
local s = Instance.new("Sound", workspace)
s.SoundId = getcustomasset("PLIST_Assets\\Loaded.mp3")
s:Play()
s.Volume = 2
game.StarterGui:SetCore("SendNotification", {
	Title = "PLIST";
	Text = "Loaded PLIST";
	Duration = 5;
})
