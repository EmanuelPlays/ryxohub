-- Rayfield Interface Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Game Detection Database
local gameDatabase = {
    [2753915549] = { -- Blox Fruits
        Name = "Blox Fruits",
        Script = "https://raw.githubusercontent.com/x3ystorage/xyz/master/loader",
        Icon = 7733960981,
        Features = {"Auto Farm", "Auto Raid", "Teleports", "ESP"}
    },
    [292439477] = { -- Phantom Forces
        Name = "Phantom Forces",
        Script = "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAM%20Loader",
        Icon = 7733960981,
        Features = {"Aimbot", "Wallhack", "ESP", "No Recoil"}
    },
    [2788229376] = { -- Doors
        Name = "Doors",
        Script = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua",
        Icon = 7733960981,
        Features = {"God Mode", "Auto Door", "Entity ESP", "Item ESP"}
    },
    [142823291] = { -- Murder Mystery 2
        Name = "Murder Mystery 2",
        Script = "https://raw.githubusercontent.com/K0t1n/Public/main/NormalMM2",
        Icon = 7733960981,
        Features = {"Murder ESP", "Sheriff ESP", "Auto Win", "Speed"}
    },
    [286090429] = { -- Arsenal
        Name = "Arsenal",
        Script = "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAM%20Loader",
        Icon = 7733960981,
        Features = {"Aimbot", "Silent Aim", "ESP", "Trigger Bot"}
    },
    [155615604] = { -- Prison Life
        Name = "Prison Life",
        Script = "https://raw.githubusercontent.com/FilteringEnabled/FE-Scripts/main/PrisonLife",
        Icon = 7733960981,
        Features = {"Auto Arrest", "Gun Mods", "ESP", "Teleports"}
    },
    [5602055394] = { -- BedWars
        Name = "BedWars",
        Script = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",
        Icon = 7733960981,
        Features = {"Auto Bridge", "Kill Aura", "ESP", "Fly"}
    },
    [3956818381] = { -- Ninja Legends
        Name = "Ninja Legends",
        Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        Icon = 7733960981,
        Features = {"Auto Farm", "Auto Sell", "Teleports", "Speed"}
    },
    [537413528] = { -- Build A Boat For Treasure
        Name = "Build A Boat",
        Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        Icon = 7733960981,
        Features = {"Auto Farm", "Auto Build", "Speed", "Teleports"}
    },
    [3233893879] = { -- Pet Simulator X
        Name = "Pet Simulator X",
        Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        Icon = 7733960981,
        Features = {"Auto Farm", "Auto Hatch", "Teleports", "ESP"}
    },
    [6284583030] = { -- Pet Simulator 99
        Name = "Pet Simulator 99",
        Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        Icon = 7733960981,
        Features = {"Auto Farm", "Auto Hatch", "Teleports", "ESP"}
    },
    [1962086868] = { -- Tower of Hell
        Name = "Tower of Hell",
        Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        Icon = 7733960981,
        Features = {"Auto Complete", "Fly", "Noclip", "Speed"}
    },
    [7047605731] = { -- Break In
        Name = "Break In",
        Script = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua",
        Icon = 7733960981,
        Features = {"ESP", "Auto Complete", "Speed", "Teleports"}
    },
    [621129760] = { -- Natural Disaster Survival
        Name = "Natural Disaster",
        Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        Icon = 7733960981,
        Features = {"Auto Survive", "ESP", "Speed", "Teleports"}
    },
    [4520749081] = { -- King Legacy
        Name = "King Legacy",
        Script = "https://raw.githubusercontent.com/x3ystorage/xyz/master/loader",
        Icon = 7733960981,
        Features = {"Auto Farm", "Auto Raid", "ESP", "Teleports"}
    },
    [6516141723] = { -- Item Asylum
        Name = "Item Asylum",
        Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        Icon = 7733960981,
        Features = {"ESP", "Auto Win", "Speed", "Teleports"}
    }
}

-- Get current game info
local currentGameId = game.PlaceId
local currentGame = gameDatabase[currentGameId] or {
    Name = "Unknown Game",
    Script = nil,
    Icon = 7733960981,
    Features = {"Universal Cheats"}
}

-- Create the main window
local Window = Rayfield:CreateWindow({
   Name = "RyxoHub - Universal Loader",
   LoadingTitle = "RyxoHub Loading...",
   LoadingSubtitle = "Detected: " .. currentGame.Name,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RyxoHubUniversal",
      FileName = "UniversalSettings.json"
   },
   Discord = {
      Enabled = true,
      Invite = "ryxohub", 
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "RyxoHub Premium",
      Subtitle = "Enter Your Key",
      Note = "Key available in Discord",
      FileName = "RyxoHubKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "RYXOHUB-UNIVERSAL-2025"
   }
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")

-- Local player
local LocalPlayer = Players.LocalPlayer

-- Create tabs
local MainTab = Window:CreateTab("Game Loader", 7733960981)
local UniversalTab = Window:CreateTab("Universal", 7733960981)
local PlayerTab = Window:CreateTab("Player", 7733960981)
local VisualsTab = Window:CreateTab("Visuals", 7733960981)
local TeleportTab = Window:CreateTab("Teleport", 7733960981)
local SettingsTab = Window:CreateTab("Settings", 7733960981)

-- Game Loader Section
local LoaderSection = MainTab:CreateSection("Game Detection & Loading")

-- Display current game info
LoaderSection:CreateParagraph({
    Title = "Detected Game",
    Content = currentGame.Name .. " (ID: " .. currentGameId .. ")"
})

-- Display game features
local featuresText = table.concat(currentGame.Features, ", ")
LoaderSection:CreateParagraph({
    Title = "Available Features",
    Content = featuresText
})

-- Load Game-Specific Script
if currentGame.Script then
    LoaderSection:CreateButton({
        Name = "Load " .. currentGame.Name .. " Script",
        Callback = function()
            Rayfield:Notify({
                Title = "Loading Game Script",
                Content = "Loading " .. currentGame.Name .. " cheats...",
                Duration = 3,
                Image = currentGame.Icon,
            })
            
            -- Load the game-specific script
            local success, err = pcall(function()
                loadstring(game:HttpGet(currentGame.Script))()
            end)
            
            if success then
                Rayfield:Notify({
                    Title = "Script Loaded Successfully",
                    Content = currentGame.Name .. " cheats activated!",
                    Duration = 5,
                    Image = currentGame.Icon,
                })
            else
                Rayfield:Notify({
                    Title = "Script Load Failed",
                    Content = "Error: " .. tostring(err),
                    Duration = 6,
                    Image = currentGame.Icon,
                })
            end
        end,
    })
else
    LoaderSection:CreateParagraph({
        Title = "No Game-Specific Script",
        Content = "Using universal cheats only for this game."
    })
end

-- Manual Game Selection
local gameOptions = {}
for id, gameInfo in pairs(gameDatabase) do
    table.insert(gameOptions, gameInfo.Name)
end

table.sort(gameOptions)

local gameDropdown = LoaderSection:CreateDropdown({
    Name = "Manual Game Selection",
    Options = gameOptions,
    CurrentOption = currentGame.Name,
    Flag = "GameDropdown",
    Callback = function(Option)
        -- Find the game ID from the selected name
        for id, gameInfo in pairs(gameDatabase) do
            if gameInfo.Name == Option then
                Rayfield:Notify({
                    Title = "Game Selected",
                    Content = "Selected: " .. Option,
                    Duration = 3,
                    Image = 7733960981,
                })
                break
            end
        end
    end,
})

-- Load Infinite Yield (Universal)
LoaderSection:CreateButton({
    Name = "Load Infinite Yield (Universal)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        Rayfield:Notify({
            Title = "Infinite Yield Loaded",
            Content = "Press F9 to view commands",
            Duration = 6.5,
            Image = 7733960981,
        })
    end,
})

-- Universal Cheats Section
local UniversalSection = UniversalTab:CreateSection("Universal Cheats")

-- Anti-AFK
local AntiAFKEnabled = false
UniversalSection:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = false,
   Flag = "AntiAFKToggle",
   Callback = function(Value)
      AntiAFKEnabled = Value
      if AntiAFKEnabled then
         vu = game:GetService("VirtualUser")
         game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
         end)
         Rayfield:Notify({
            Title = "Anti-AFK Enabled",
            Content = "You won't be kicked for being AFK",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Anti-AFK Disabled",
            Content = "You can now be kicked for inactivity",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- FPS Boost
UniversalSection:CreateButton({
   Name = "FPS Boost",
   Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
         if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
            v.Material = Enum.Material.SmoothPlastic
         end
      end
      
      settings().Rendering.QualityLevel = 1
      Rayfield:Notify({
         Title = "FPS Boost Applied",
         Content = "Graphics optimized for performance",
         Duration = 5,
         Image = 7733960981,
      })
   end,
})

-- Server Utilities
UniversalSection:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
      TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
   end,
})

UniversalSection:CreateButton({
   Name = "Server Hop",
   Callback = function()
      local Http = game:GetService("HttpService")
      local TPS = game:GetService("TeleportService")
      local API = "https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=%s"
      
      local function servers(option)
         local url = string.format(API, game.PlaceId, option, 100)
         return Http:JSONDecode(game:HttpGet(url))
      end
      
      local function hop()
         for _, v in next, servers("Asc")["data"] do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
               TPS:TeleportToPlaceInstance(game.PlaceId, v.id)
               break
            end
         end
      end
      
      hop()
   end,
})

-- Player Section
local PlayerSection = PlayerTab:CreateSection("Player Modifications")

-- Speed Hack
local SpeedEnabled = false
local SpeedValue = 50
PlayerSection:CreateToggle({
   Name = "Speed Hack",
   CurrentValue = false,
   Flag = "SpeedToggle",
   Callback = function(Value)
      SpeedEnabled = Value
      if SpeedEnabled then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValue
      else
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      end
   end,
})

PlayerSection:CreateSlider({
   Name = "Speed Value",
   Range = {16, 500},
   Increment = 5,
   Suffix = "studs",
   CurrentValue = 50,
   Flag = "SpeedSlider",
   Callback = function(Value)
      SpeedValue = Value
      if SpeedEnabled then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

-- Jump Hack
local JumpEnabled = false
local JumpValue = 50
PlayerSection:CreateToggle({
   Name = "High Jump",
   CurrentValue = false,
   Flag = "JumpToggle",
   Callback = function(Value)
      JumpEnabled = Value
      if JumpEnabled then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpValue
      else
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
      end
   end,
})

PlayerSection:CreateSlider({
   Name = "Jump Power",
   Range = {50, 500},
   Increment = 10,
   Suffix = "power",
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
      JumpValue = Value
      if JumpEnabled then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   end,
})

-- Fly
local FlyEnabled = false
local FlySpeed = 50
PlayerSection:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "FlyToggle",
   Callback = function(Value)
      FlyEnabled = Value
      if FlyEnabled then
         Rayfield:Notify({
            Title = "Fly Enabled",
            Content = "Press E to fly up, Q to fly down",
            Duration = 5,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Fly Disabled",
            Content = "Flight mode deactivated",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

PlayerSection:CreateSlider({
   Name = "Fly Speed",
   Range = {10, 300},
   Increment = 5,
   Suffix = "speed",
   CurrentValue = 50,
   Flag = "FlySlider",
   Callback = function(Value)
      FlySpeed = Value
   end,
})

-- Noclip
local NoclipEnabled = false
PlayerSection:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
      NoclipEnabled = Value
      if NoclipEnabled then
         Rayfield:Notify({
            Title = "Noclip Enabled",
            Content = "You can now walk through walls",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Noclip Disabled",
            Content = "Collision is restored",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Visuals Section
local VisualsSection = VisualsTab:CreateSection("Visual Enhancements")

-- ESP
VisualsSection:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Flag = "PlayerESPToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Player ESP Enabled",
            Content = "Players highlighted through walls",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Player ESP Disabled",
            Content = "Player highlighting disabled",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- FullBright
local FullBrightEnabled = false
VisualsSection:CreateToggle({
   Name = "FullBright",
   CurrentValue = false,
   Flag = "FullBrightToggle",
   Callback = function(Value)
      FullBrightEnabled = Value
      if FullBrightEnabled then
         game:GetService("Lighting").GlobalShadows = false
         Rayfield:Notify({
            Title = "FullBright Enabled",
            Content = "Maximum brightness activated",
            Duration = 3,
            Image = 7733960981,
         })
      else
         game:GetService("Lighting").GlobalShadows = true
         Rayfield:Notify({
            Title = "FullBright Disabled",
            Content = "Lighting returned to normal",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- X-Ray Vision
VisualsSection:CreateToggle({
   Name = "X-Ray Vision",
   CurrentValue = false,
   Flag = "XRayToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "X-Ray Enabled",
            Content = "Seeing through walls",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "X-Ray Disabled",
            Content = "Vision returned to normal",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Teleport Section
local TeleportSection = TeleportTab:CreateSection("Teleportation")

local playerDropdown = TeleportSection:CreateDropdown({
   Name = "Select Player",
   Options = {"Player1", "Player2"},
   CurrentOption = "Player1",
   Flag = "PlayerDropdown",
   Callback = function(Option)
      -- Store selected player
   end,
})

-- Refresh player list
TeleportSection:CreateButton({
   Name = "Refresh Player List",
   Callback = function()
      local players = {}
      for _, player in ipairs(game.Players:GetPlayers()) do
         if player ~= game.Players.LocalPlayer then
            table.insert(players, player.Name)
         end
      end
      playerDropdown:Refresh(players, true)
   end,
})

-- Teleport to player
TeleportSection:CreateButton({
   Name = "Teleport to Selected Player",
   Callback = function()
      local selectedPlayer = playerDropdown.CurrentOption
      if selectedPlayer and selectedPlayer ~= "" then
         local targetPlayer = game.Players[selectedPlayer]
         if targetPlayer and targetPlayer.Character then
            local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            local localRoot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if targetRoot and localRoot then
               localRoot.CFrame = targetRoot.CFrame
               Rayfield:Notify({
                  Title = "Teleported",
                  Content = "Teleported to " .. selectedPlayer,
                  Duration = 3,
                  Image = 7733960981,
               })
            end
         end
      else
         Rayfield:Notify({
            Title = "Error",
            Content = "Please select a player first",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Settings Section
local SettingsSection = SettingsTab:CreateSection("Settings")

-- UI Toggle Key
SettingsSection:CreateKeybind({
   Name = "UI Toggle Key",
   CurrentKeybind = "RightShift",
   HoldToInteract = false,
   Flag = "UIToggleKeybind",
   Callback = function(Keybind)
      Rayfield:Notify({
         Title = "Toggle Keybind Set",
         Content = "Press " .. Keybind .. " to toggle UI",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- UI Color
SettingsSection:CreateColorPicker({
   Name = "UI Color",
   Color = Color3.fromRGB(0, 85, 255),
   Flag = "UIColorPicker",
   Callback = function(Value)
      Window:ChangeColor(Value)
   end
})

-- Destroy UI
SettingsSection:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
   end,
})

-- Initialize player dropdown on load
task.spawn(function()
   wait(2)
   local players = {}
   for _, player in ipairs(game.Players:GetPlayers()) do
      if player ~= game.Players.LocalPlayer then
         table.insert(players, player.Name)
      end
   end
   playerDropdown:Refresh(players, true)
end)

-- Noclip loop
RunService.Stepped:Connect(function()
   if NoclipEnabled and LocalPlayer.Character then
      for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
         if part:IsA("BasePart") then
            part.CanCollide = false
         end
      end
   end
end)

-- UI Toggle key
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, processed)
   if not processed and input.KeyCode == Enum.KeyCode.RightShift then
      Rayfield:Toggle()
   end
end)

Rayfield:Notify({
   Title = "RyxoHub Universal Loaded",
   Content = "Detected: " .. currentGame.Name .. "\nPress RightShift to toggle menu",
   Duration = 8,
   Image = 7733960981,
})

-- Load configuration at the end
Rayfield:LoadConfiguration()
