-- Ultimate Roblox Cheat Script with Smooth Animations
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Camera = Workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- Animation functions
local function tweenProperty(instance, property, targetValue, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(
        duration,
        easingStyle or Enum.EasingStyle.Quad,
        easingDirection or Enum.EasingDirection.Out,
        0,
        false,
        0
    )
    local tween = TweenService:Create(instance, tweenInfo, {[property] = targetValue})
    tween:Play()
    return tween
end

local function animateButtonClick(button)
    local originalSize = button.Size
    tweenProperty(button, "Size", UDim2.new(originalSize.X.Scale * 0.95, originalSize.X.Offset, originalSize.Y.Scale * 0.95, originalSize.Y.Offset), 0.1)
    task.delay(0.1, function()
        tweenProperty(button, "Size", originalSize, 0.1)
    end)
end

local function animateMenuOpen(frame)
    frame.Visible = true
    frame.Size = UDim2.new(0, 0, 0, 0)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    tweenProperty(frame, "Size", UDim2.new(0, 300, 0, 400), 0.3, Enum.EasingStyle.Back)
    tweenProperty(frame, "Position", UDim2.new(0.5, -150, 0.5, -200), 0.3, Enum.EasingStyle.Back)
end

local function animateMenuClose(frame, callback)
    tweenProperty(frame, "Size", UDim2.new(0, 0, 0, 0), 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    tweenProperty(frame, "Position", UDim2.new(0.5, 0, 0.5, 0), 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    
    task.delay(0.2, function()
        frame.Visible = false
        if callback then callback() end
    end)
end

local function animateSettingsOpen(settingsFrame)
    settingsFrame.Visible = true
    settingsFrame.Size = UDim2.new(0, 0, 0, 0)
    
    tweenProperty(settingsFrame, "Size", UDim2.new(0, 200, 0, 200), 0.2)
end

local function animateSettingsClose(settingsFrame)
    tweenProperty(settingsFrame, "Size", UDim2.new(0, 0, 0, 0), 0.2)
    task.delay(0.2, function()
        settingsFrame.Visible = false
    end)
end

-- Game detection
local function detectGame()
    local placeId = game.PlaceId
    local knownGames = {
        [301549746] = "Counter Blox",
        [286090429] = "Arsenal",
        [263761432] = "Phantom Forces",
        [142823291] = "Murder Mystery 2",
        [2788229376] = "Da Hood",
        [6516141723] = "Doors",
        [4924922222] = "Brookhaven RP"
    }
    return knownGames[placeId] or "Unknown Game"
end

local currentGame = detectGame()
print("Detected game:", currentGame)

-- Cheat variables
local flyEnabled = false
local flySpeed = 50
local noclip = false
local walkSpeed = 16
local btoolsEnabled = false
local espEnabled = false
local infiniteJump = false
local fullBright = false
local xray = false
local antiAfk = false

-- Aimbot Settings
local aimbotSettings = {
    Enabled = true,
    TeamCheck = false,
    AimPart = "Head",
    Sensitivity = 0.1,
    FOV = 80,
    FOVVisible = true,
    Holding = false
}

-- ESP Settings
local espSettings = {
    showName = true,
    showHealth = true,
    showDistance = true,
    teamColor = false,
    fillColor = Color3.fromRGB(255, 0, 0),
    outlineColor = Color3.fromRGB(255, 255, 255),
    textColor = Color3.fromRGB(255, 255, 255),
    textSize = 14
}

-- Aimbot FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = aimbotSettings.FOV
FOVCircle.Filled = false
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Visible = aimbotSettings.FOVVisible
FOVCircle.Transparency = 0.7
FOVCircle.NumSides = 64
FOVCircle.Thickness = 1

-- Fly system
local function toggleFly()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
        
        RunService.Stepped:Connect(function()
            if not flyEnabled or not LocalPlayer.Character then 
                bodyVelocity:Destroy()
                return 
            end
            
            local camCF = Camera.CFrame
            local moveVec = Vector3.new()
            
            if UIS:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + camCF.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec - camCF.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec - camCF.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + camCF.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then moveVec = moveVec + Vector3.new(0, 1, 0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then moveVec = moveVec - Vector3.new(0, 1, 0) end
            
            if moveVec.Magnitude > 0 then
                bodyVelocity.Velocity = moveVec.Unit * flySpeed
            else
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local bodyVelocity = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity")
            if bodyVelocity then bodyVelocity:Destroy() end
        end
    end
end

-- Noclip system
local function toggleNoclip()
    noclip = not noclip
    if noclip then
        RunService.Stepped:Connect(function()
            if not noclip or not LocalPlayer.Character then return end
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end
end

-- ESP System
local function updateESP()
    if not espEnabled then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            local rootPart = char:FindFirstChild("HumanoidRootPart")
            
            -- Remove existing ESP
            if char:FindFirstChild("ESP_Folder") then
                char:FindFirstChild("ESP_Folder"):Destroy()
            end
            
            -- Create ESP elements
            local espFolder = Instance.new("Folder")
            espFolder.Name = "ESP_Folder"
            espFolder.Parent = char
            
            -- Highlight
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.FillColor = espSettings.fillColor
            highlight.OutlineColor = espSettings.outlineColor
            highlight.Parent = espFolder
            
            -- Billboard with info
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP_Info"
            billboard.Adornee = rootPart or char:FindFirstChild("Head")
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = espFolder
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = espSettings.textColor
            textLabel.TextSize = espSettings.textSize
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.Text = ""
            textLabel.Parent = billboard
            
            -- Update info continuously
            RunService.Heartbeat:Connect(function()
                if not char or not char.Parent or not espEnabled then
                    espFolder:Destroy()
                    return
                end
                
                -- Update team color
                if espSettings.teamColor and player.Team then
                    highlight.FillColor = player.TeamColor.Color
                end
                
                -- Update text
                local infoText = ""
                if espSettings.showName then
                    infoText = player.Name.."\n"
                end
                if espSettings.showHealth and humanoid then
                    infoText = infoText.."HP: "..math.floor(humanoid.Health).."/"..math.floor(humanoid.MaxHealth).."\n"
                end
                if espSettings.showDistance and rootPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    infoText = infoText.."Dist: "..math.floor(distance).." studs"
                end
                
                textLabel.Text = infoText
            end)
        end
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        updateESP()
        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(char)
                if espEnabled then updateESP() end
            end)
        end)
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("ESP_Folder") then
                player.Character:FindFirstChild("ESP_Folder"):Destroy()
            end
        end
    end
end

-- Aimbot Functions
local function GetClosestPlayer()
    local MaximumDistance = aimbotSettings.FOV
    local Target = nil

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if aimbotSettings.TeamCheck == true then
                if player.Team ~= LocalPlayer.Team then
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                            local ScreenPoint = Camera:WorldToScreenPoint(player.Character.HumanoidRootPart.Position)
                            local VectorDistance = (Vector2.new(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                            
                            if VectorDistance < MaximumDistance then
                                Target = player
                                MaximumDistance = VectorDistance
                            end
                        end
                    end
                end
            else
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                        local ScreenPoint = Camera:WorldToScreenPoint(player.Character.HumanoidRootPart.Position)
                        local VectorDistance = (Vector2.new(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                        
                        if VectorDistance < MaximumDistance then
                            Target = player
                            MaximumDistance = VectorDistance
                        end
                    end
                end
            end
        end
    end

    return Target
end

-- Aimbot Connections
UIS.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotSettings.Holding = true
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotSettings.Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    -- Update FOV Circle
    FOVCircle.Position = Vector2.new(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y)
    FOVCircle.Radius = aimbotSettings.FOV
    FOVCircle.Visible = aimbotSettings.FOVVisible and aimbotSettings.Enabled
    
    -- Aimbot Logic
    if aimbotSettings.Holding and aimbotSettings.Enabled then
        local closestPlayer = GetClosestPlayer()
        if closestPlayer and closestPlayer.Character then
            local targetPart = closestPlayer.Character:FindFirstChild(aimbotSettings.AimPart)
            if targetPart then
                TweenService:Create(Camera, TweenInfo.new(aimbotSettings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)
                }):Play()
            end
        end
    end
end)

local function toggleAimbot()
    aimbotSettings.Enabled = not aimbotSettings.Enabled
    FOVCircle.Visible = aimbotSettings.Enabled and aimbotSettings.FOVVisible
end

-- Right-click settings menu
local function createSettingsMenu(parentFrame, settingsTable, settingName)
    local settingsMenu = Instance.new("Frame")
    settingsMenu.Name = settingName.."_Settings"
    settingsMenu.Size = UDim2.new(0, 0, 0, 0)
    settingsMenu.Position = UDim2.new(1, 0, 0, 0)
    settingsMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    settingsMenu.BorderSizePixel = 0
    settingsMenu.Visible = false
    settingsMenu.Parent = parentFrame
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.Parent = settingsMenu
    
    local yOffset = 5
    local elementHeight = 25
    
    for setting, value in pairs(settingsTable) do
        if type(value) == "boolean" then
            local toggle = Instance.new("TextButton")
            toggle.Size = UDim2.new(0.9, 0, 0, elementHeight)
            toggle.Position = UDim2.new(0.05, 0, 0, yOffset)
            toggle.Text = setting..": "..(value and "ON" or "OFF")
            toggle.TextColor3 = Color3.new(1, 1, 1)
            toggle.BackgroundColor3 = value and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
            toggle.Parent = scrollFrame
            
            toggle.MouseButton1Click:Connect(function()
                animateButtonClick(toggle)
                settingsTable[setting] = not settingsTable[setting]
                toggle.Text = setting..": "..(settingsTable[setting] and "ON" or "OFF")
                toggle.BackgroundColor3 = settingsTable[setting] and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
                
                -- Special cases
                if setting == "Enabled" and settingName == "Aimbot" then
                    FOVCircle.Visible = settingsTable[setting] and aimbotSettings.FOVVisible
                end
                if setting == "FOVVisible" then
                    FOVCircle.Visible = settingsTable[setting] and aimbotSettings.Enabled
                end
                if settingName == "ESP" then
                    updateESP()
                end
            end)
            
            yOffset = yOffset + elementHeight + 5
        elseif type(value) == "number" then
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0.9, 0, 0, elementHeight)
            label.Position = UDim2.new(0.05, 0, 0, yOffset)
            label.Text = setting..": "..value
            label.TextColor3 = Color3.new(1, 1, 1)
            label.BackgroundTransparency = 1
            label.Parent = scrollFrame
            yOffset = yOffset + elementHeight
            
            local increase = Instance.new("TextButton")
            increase.Size = UDim2.new(0.425, 0, 0, elementHeight)
            increase.Position = UDim2.new(0.05, 0, 0, yOffset)
            increase.Text = "+"
            increase.TextColor3 = Color3.new(1, 1, 1)
            increase.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            increase.Parent = scrollFrame
            
            local decrease = Instance.new("TextButton")
            decrease.Size = UDim2.new(0.425, 0, 0, elementHeight)
            decrease.Position = UDim2.new(0.525, 0, 0, yOffset)
            decrease.Text = "-"
            decrease.TextColor3 = Color3.new(1, 1, 1)
            decrease.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            decrease.Parent = scrollFrame
            
            increase.MouseButton1Click:Connect(function()
                animateButtonClick(increase)
                settingsTable[setting] = settingsTable[setting] + (setting == "Sensitivity" and 0.1 or 5)
                label.Text = setting..": "..settingsTable[setting]
                if setting == "FOV" then
                    FOVCircle.Radius = settingsTable[setting]
                end
            end)
            
            decrease.MouseButton1Click:Connect(function()
                animateButtonClick(decrease)
                settingsTable[setting] = math.max(0, settingsTable[setting] - (setting == "Sensitivity" and 0.1 or 5))
                label.Text = setting..": "..settingsTable[setting]
                if setting == "FOV" then
                    FOVCircle.Radius = settingsTable[setting]
                end
            end)
            
            yOffset = yOffset + elementHeight + 5
        elseif type(value) == "string" then
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0.9, 0, 0, elementHeight)
            label.Position = UDim2.new(0.05, 0, 0, yOffset)
            label.Text = setting..": "..value
            label.TextColor3 = Color3.new(1, 1, 1)
            label.BackgroundTransparency = 1
            label.Parent = scrollFrame
            yOffset = yOffset + elementHeight
            
            local nextButton = Instance.new("TextButton")
            nextButton.Size = UDim2.new(0.425, 0, 0, elementHeight)
            nextButton.Position = UDim2.new(0.05, 0, 0, yOffset)
            nextButton.Text = "Next"
            nextButton.TextColor3 = Color3.new(1, 1, 1)
            nextButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            nextButton.Parent = scrollFrame
            
            local prevButton = Instance.new("TextButton")
            prevButton.Size = UDim2.new(0.425, 0, 0, elementHeight)
            prevButton.Position = UDim2.new(0.525, 0, 0, yOffset)
            prevButton.Text = "Prev"
            prevButton.TextColor3 = Color3.new(1, 1, 1)
            prevButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            prevButton.Parent = scrollFrame
            
            local options = {"Head", "HumanoidRootPart", "UpperTorso"}
            local currentIndex = table.find(options, value) or 1
            
            nextButton.MouseButton1Click:Connect(function()
                animateButtonClick(nextButton)
                currentIndex = currentIndex + 1
                if currentIndex > #options then currentIndex = 1 end
                settingsTable[setting] = options[currentIndex]
                label.Text = setting..": "..settingsTable[setting]
            end)
            
            prevButton.MouseButton1Click:Connect(function()
                animateButtonClick(prevButton)
                currentIndex = currentIndex - 1
                if currentIndex < 1 then currentIndex = #options end
                settingsTable[setting] = options[currentIndex]
                label.Text = setting..": "..settingsTable[setting]
            end)
            
            yOffset = yOffset + elementHeight + 5
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
    
    return settingsMenu
end

-- GUI Creation
local CheatMenuGUI = nil
local MenuOpen = false

local function toggleMenu()
    MenuOpen = not MenuOpen
    
    if MenuOpen then
        CheatMenuGUI = Instance.new("ScreenGui")
        CheatMenuGUI.Name = "CheatMenuGUI"
        CheatMenuGUI.Parent = CoreGui

        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0, 0, 0, 0)
        Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        Frame.BorderSizePixel = 0
        Frame.ClipsDescendants = true
        Frame.Parent = CheatMenuGUI

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, 0, 0, 30)
        Title.Position = UDim2.new(0, 0, 0, 0)
        Title.Text = "Ultimate Cheat Menu - "..currentGame
        Title.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        Title.TextColor3 = Color3.new(1, 1, 1)
        Title.Font = Enum.Font.SourceSansBold
        Title.Parent = Frame

        local ScrollingFrame = Instance.new("ScrollingFrame")
        ScrollingFrame.Size = UDim2.new(1, 0, 1, -40)
        ScrollingFrame.Position = UDim2.new(0, 0, 0, 30)
        ScrollingFrame.BackgroundTransparency = 1
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
        ScrollingFrame.ScrollBarThickness = 5
        ScrollingFrame.Parent = Frame

        local yOffset = 10
        local buttonHeight = 35

        local function createButton(text, toggleFunc, getStateFunc, settingsTable)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0.9, 0, 0, 30)
            button.Position = UDim2.new(0.05, 0, 0, yOffset)
            button.Text = text..": "..(getStateFunc() and "ON" or "OFF")
            button.TextColor3 = Color3.new(1, 1, 1)
            button.BackgroundColor3 = getStateFunc() and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
            button.Parent = ScrollingFrame
            
            local settingsMenu = nil
            if settingsTable then
                settingsMenu = createSettingsMenu(button, settingsTable, text)
            end
            
            button.MouseButton1Click:Connect(function()
                animateButtonClick(button)
                toggleFunc()
                button.Text = text..": "..(getStateFunc() and "ON" or "OFF")
                button.BackgroundColor3 = getStateFunc() and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
            end)
            
            button.MouseButton2Click:Connect(function()
                if settingsMenu then
                    if settingsMenu.Visible then
                        animateSettingsClose(settingsMenu)
                    else
                        animateSettingsOpen(settingsMenu)
                    end
                end
            end)
            
            yOffset = yOffset + buttonHeight
            return button
        end

        -- Create buttons
        createButton("Fly", toggleFly, function() return flyEnabled end)
        createButton("Noclip", toggleNoclip, function() return noclip end)
        createButton("ESP", toggleESP, function() return espEnabled end, espSettings)
        createButton("Aimbot", toggleAimbot, function() return aimbotSettings.Enabled end, aimbotSettings)
        createButton("Infinite Jump", toggleInfiniteJump, function() return infiniteJump end)

        -- Close button
        local CloseButton = Instance.new("TextButton")
        CloseButton.Size = UDim2.new(0.9, 0, 0, 30)
        CloseButton.Position = UDim2.new(0.05, 0, 0, yOffset)
        CloseButton.Text = "Close Menu"
        CloseButton.TextColor3 = Color3.new(1, 1, 1)
        CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        CloseButton.Parent = ScrollingFrame

        CloseButton.MouseButton1Click:Connect(function()
            animateButtonClick(CloseButton)
            toggleMenu()
        end)

        -- Animate menu open
        animateMenuOpen(Frame)
    else
        if CheatMenuGUI then
            animateMenuClose(CheatMenuGUI:FindFirstChild("Frame"), function()
                CheatMenuGUI:Destroy()
            end)
        end
    end
end

-- Keybind to open menu (F5)
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F5 then
        toggleMenu()
    end
end)

print([[
=== Ultimate Cheat Menu Loaded ===
Press F5 to open/close menu
Left-click buttons to toggle features
Right-click ESP/Aimbot to configure settings
Aimbot: Hold Right Mouse Button to activate
]])

-- Initialize with menu closed
MenuOpen = false
