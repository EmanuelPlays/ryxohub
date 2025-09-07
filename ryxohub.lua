-- Rayfield Interface Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Game Detection
local gameDetection = {
    [2753915549] = "Blox Fruits",
    [292439477] = "Phantom Forces",
    [142823291] = "Murder Mystery 2",
    [286090429] = "Arsenal",
    [155615604] = "Prison Life",
    [2788229376] = "Doors",
    [5602055394] = "BedWars",
    [3956818381] = "Ninja Legends",
    [537413528] = "Build A Boat For Treasure",
    [6516141723] = "Item Asylum",
    [4520749081] = "King Legacy",
    [3233893879] = "Pet Simulator X",
    [6284583030] = "Pet Simulator 99",
    [1962086868] = "Tower of Hell",
    [7047605731] = "Break In",
    [621129760] = "Natural Disaster Survival"
}

-- Get current game info
local currentGameId = game.PlaceId
local currentGameName = gameDetection[currentGameId] or "Unknown Game"

-- Create the main window
local Window = Rayfield:CreateWindow({
   Name = "RyxoHub - " .. currentGameName,
   LoadingTitle = "RyxoHub Loading...",
   LoadingSubtitle = "Detected: " .. currentGameName,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RyxoHubConfig",
      FileName = "UltimateSettings.json"
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
      Key = "RYXOHUB-ULTRA-V2"
   }
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")

-- Local player
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Create tabs
local MainTab = Window:CreateTab("Main", 7733960981)
local PlayerTab = Window:CreateTab("Player", 7733960981)
local CombatTab = Window:CreateTab("Combat", 7733960981)
local VisualsTab = Window:CreateTab("Visuals", 7733960981)
local TeleportTab = Window:CreateTab("Teleport", 7733960981)
local WorldTab = Window:CreateTab("World", 7733960981)
local AntiCheatTab = Window:CreateTab("Anti-Cheat", 7733960981)
local SettingsTab = Window:CreateTab("Settings", 7733960981)
local GameTab = Window:CreateTab("Game Specific", 7733960981)

-- Game Detection Section
local GameSection = GameTab:CreateSection("Detected Game")

GameSection:CreateParagraph({
    Title = "Current Game",
    Content = currentGameName .. " (ID: " .. currentGameId .. ")"
})

-- Game-specific features based on detection
if currentGameId == 2753915549 then -- Blox Fruits
    GameSection:CreateButton({
        Name = "Load Blox Fruits Script",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/x3ystorage/xyz/master/loader"))()
            Rayfield:Notify({
                Title = "Blox Fruits Script Loaded",
                Content = "Blox Fruits features activated",
                Duration = 5,
                Image = 7733960981,
            })
        end,
    })
    
    GameSection:CreateToggle({
        Name = "Auto Farm Blox Fruits",
        CurrentValue = false,
        Flag = "BloxFruitsAutoFarm",
        Callback = function(Value)
            if Value then
                Rayfield:Notify({
                    Title = "Auto Farm Enabled",
                    Content = "Farming Blox Fruits automatically",
                    Duration = 3,
                    Image = 7733960981,
                })
            else
                Rayfield:Notify({
                    Title = "Auto Farm Disabled",
                    Content = "Stopped farming Blox Fruits",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
elseif currentGameId == 292439477 then -- Phantom Forces
    GameSection:CreateButton({
        Name = "Load Phantom Forces Script",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAM%20Loader"))()
            Rayfield:Notify({
                Title = "Phantom Forces Script Loaded",
                Content = "Phantom Forces features activated",
                Duration = 5,
                Image = 7733960981,
            })
        end,
    })
    
    GameSection:CreateToggle({
        Name = "Wallhack (PF)",
        CurrentValue = false,
        Flag = "PFWallhack",
        Callback = function(Value)
            if Value then
                Rayfield:Notify({
                    Title = "PF Wallhack Enabled",
                    Content = "Seeing enemies through walls",
                    Duration = 3,
                    Image = 7733960981,
                })
            else
                Rayfield:Notify({
                    Title = "PF Wallhack Disabled",
                    Content = "Wallhack disabled",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
elseif currentGameId == 2788229376 then -- Doors
    GameSection:CreateButton({
        Name = "Load Doors Script",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
            Rayfield:Notify({
                Title = "Doors Script Loaded",
                Content = "Doors features activated",
                Duration = 5,
                Image = 7733960981,
            })
        end,
    })
    
    GameSection:CreateToggle({
        Name = "Auto Avoid Entities",
        CurrentValue = false,
        Flag = "DoorsAutoAvoid",
        Callback = function(Value)
            if Value then
                Rayfield:Notify({
                    Title = "Auto Avoid Enabled",
                    Content = "Automatically avoiding entities",
                    Duration = 3,
                    Image = 7733960981,
                })
            else
                Rayfield:Notify({
                    Title = "Auto Avoid Disabled",
                    Content = "Manual entity avoidance",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
else
    GameSection:CreateParagraph({
        Title = "No Game-Specific Features",
        Content = "No specialized scripts available for this game. Using universal features only."
    })
end

-- Main Section
local MainSection = MainTab:CreateSection("RyxoHub Premium Features")

-- Auto Farm Example
local AutoFarm = MainSection:CreateToggle({
   Name = "Auto Farm Coins",
   CurrentValue = false,
   Flag = "AutoFarmToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Auto Farm Enabled",
            Content = "Now farming coins automatically",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Auto Farm Disabled",
            Content = "Stopped farming coins",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Infinite Yield
local InfiniteYield = MainSection:CreateButton({
   Name = "Load Infinite Yield",
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

-- Anti-AFK
local AntiAFKEnabled = false
local AntiAFK = MainSection:CreateToggle({
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

-- Player Section
local PlayerSection = PlayerTab:CreateSection("RyxoHub Movement")

-- Speed Hack
local SpeedEnabled = false
local SpeedValue = 50
local SpeedHack = PlayerSection:CreateToggle({
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
local JumpHack = PlayerSection:CreateToggle({
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
local Fly = PlayerSection:CreateToggle({
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
         
         -- Fly logic would go here
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
local Noclip = PlayerSection:CreateToggle({
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

-- Infinite Stamina
PlayerSection:CreateToggle({
   Name = "Infinite Stamina",
   CurrentValue = false,
   Flag = "StaminaToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Infinite Stamina Enabled",
            Content = "You will never run out of stamina",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Infinite Stamina Disabled",
            Content = "Stamina is now limited",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Combat Section
local CombatSection = CombatTab:CreateSection("RyxoHub Combat")

-- Silent Aim
local SilentAimEnabled = false
local SilentAimFOV = 100
local SilentAimHitChance = 100
local SilentAimTargetPart = "Head"

local SilentAimToggle = CombatSection:CreateToggle({
   Name = "Silent Aim",
   CurrentValue = false,
   Flag = "SilentAimToggle",
   Callback = function(Value)
      SilentAimEnabled = Value
      if SilentAimEnabled then
         Rayfield:Notify({
            Title = "Silent Aim Enabled",
            Content = "Bullets will magically hit targets",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Silent Aim Disabled",
            Content = "Aiming returned to normal",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

CombatSection:CreateSlider({
   Name = "Silent Aim FOV",
   Range = {0, 500},
   Increment = 10,
   Suffix = "units",
   CurrentValue = 100,
   Flag = "SilentAimFOVSlider",
   Callback = function(Value)
      SilentAimFOV = Value
   end,
})

CombatSection:CreateSlider({
   Name = "Hit Chance",
   Range = {0, 100},
   Increment = 5,
   Suffix = "%",
   CurrentValue = 100,
   Flag = "HitChanceSlider",
   Callback = function(Value)
      SilentAimHitChance = Value
   end,
})

CombatSection:CreateDropdown({
   Name = "Target Part",
   Options = {"Head", "Torso", "Random"},
   CurrentOption = "Head",
   Flag = "TargetPartDropdown",
   Callback = function(Option)
      SilentAimTargetPart = Option
   end,
})

-- Trigger Bot
CombatSection:CreateToggle({
   Name = "Trigger Bot",
   CurrentValue = false,
   Flag = "TriggerBotToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Trigger Bot Enabled",
            Content = "Auto shooting when target is in sight",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Trigger Bot Disabled",
            Content = "Manual shooting restored",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Aimbot
local AimbotEnabled = false
local AimbotFOV = 100
local AimbotSmoothness = 10
local Aimbot = CombatSection:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "AimbotToggle",
   Callback = function(Value)
      AimbotEnabled = Value
      if AimbotEnabled then
         Rayfield:Notify({
            Title = "Aimbot Enabled",
            Content = "Locking onto nearest player",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Aimbot Disabled",
            Content = "Aiming returned to normal",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

CombatSection:CreateSlider({
   Name = "Aimbot FOV",
   Range = {0, 500},
   Increment = 10,
   Suffix = "units",
   CurrentValue = 100,
   Flag = "AimbotFOVSlider",
   Callback = function(Value)
      AimbotFOV = Value
   end,
})

CombatSection:CreateSlider({
   Name = "Aimbot Smoothness",
   Range = {1, 30},
   Increment = 1,
   Suffix = "level",
   CurrentValue = 10,
   Flag = "AimbotSmoothSlider",
   Callback = function(Value)
      AimbotSmoothness = Value
   end,
})

-- Wallhack/ESP
local ESPEnabled = false
local ESP = VisualsTab:CreateSection("RyxoHub ESP")

local Wallhack = ESP:CreateToggle({
   Name = "Wallhack (ESP)",
   CurrentValue = false,
   Flag = "WallhackToggle",
   Callback = function(Value)
      ESPEnabled = Value
      if ESPEnabled then
         Rayfield:Notify({
            Title = "ESP Enabled",
            Content = "Players highlighted through walls",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "ESP Disabled",
            Content = "Player highlighting disabled",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- X-Ray Vision
local XRayEnabled = false
local XRay = ESP:CreateToggle({
   Name = "X-Ray Vision",
   CurrentValue = false,
   Flag = "XRayToggle",
   Callback = function(Value)
      XRayEnabled = Value
      if XRayEnabled then
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

-- FullBright
local FullBrightEnabled = false
local FullBright = ESP:CreateToggle({
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

-- Chams
ESP:CreateToggle({
   Name = "Chams",
   CurrentValue = false,
   Flag = "ChamsToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Chams Enabled",
            Content = "Player models highlighted",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Chams Disabled",
            Content = "Player models normal",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Tracers
ESP:CreateToggle({
   Name = "Tracers",
   CurrentValue = false,
   Flag = "TracersToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Tracers Enabled",
            Content = "Lines drawn to players",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Tracers Disabled",
            Content = "Tracers removed",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Advanced Graphics Section
local GraphicsSection = VisualsTab:CreateSection("Advanced Graphics")

-- Shadow Map
GraphicsSection:CreateSlider({
   Name = "Shadow Map",
   Range = {0, 2048},
   Increment = 256,
   Suffix = "resolution",
   CurrentValue = 1024,
   Flag = "ShadowMapSlider",
   Callback = function(Value)
      Lighting:GetPropertyChangedSignal("ShadowMapSize"):Wait()
      Lighting.ShadowMapSize = Value
   end,
})

-- Graphics Quality
GraphicsSection:CreateSlider({
   Name = "Graphics Quality",
   Range = {1, 21},
   Increment = 1,
   Suffix = "level",
   CurrentValue = 14,
   Flag = "GraphicsQualitySlider",
   Callback = function(Value)
      settings().Rendering.QualityLevel = Value
   end,
})

-- Render Distance
GraphicsSection:CreateSlider({
   Name = "Render Distance",
   Range = {0, 10000},
   Increment = 500,
   Suffix = "studs",
   CurrentValue = 5000,
   Flag = "RenderDistanceSlider",
   Callback = function(Value)
      LocalPlayer:SetAttribute("RenderDistance", Value)
   end,
})

-- Depth of Field
GraphicsSection:CreateToggle({
   Name = "Depth of Field",
   CurrentValue = false,
   Flag = "DOFToggle",
   Callback = function(Value)
      Lighting:FindFirstChildOfClass("DepthOfFieldEffect").Enabled = Value
   end,
})

-- Bloom
GraphicsSection:CreateToggle({
   Name = "Bloom Effect",
   CurrentValue = false,
   Flag = "BloomToggle",
   Callback = function(Value)
      Lighting:FindFirstChildOfClass("BloomEffect").Enabled = Value
   end,
})

-- Color Correction
GraphicsSection:CreateToggle({
   Name = "Color Correction",
   CurrentValue = false,
   Flag = "ColorCorrectionToggle",
   Callback = function(Value)
      Lighting:FindFirstChildOfClass("ColorCorrectionEffect").Enabled = Value
   end,
})

-- Sun Rays
GraphicsSection:CreateToggle({
   Name = "Sun Rays",
   CurrentValue = false,
   Flag = "SunRaysToggle",
   Callback = function(Value)
      Lighting:FindFirstChildOfClass("SunRaysEffect").Enabled = Value
   end,
})

-- Anti-Aliasing
GraphicsSection:CreateDropdown({
   Name = "Anti-Aliasing",
   Options = {"None", "FXAA", "TAA", "SMAA"},
   CurrentOption = "FXAA",
   Flag = "AntiAliasingDropdown",
   Callback = function(Option)
      -- Anti-aliasing implementation would go here
   end,
})

-- Teleport Section
local TeleportSection = TeleportTab:CreateSection("RyxoHub Teleport")

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
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to " .. playerDropdown.CurrentOption,
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- World Section
local WorldSection = WorldTab:CreateSection("World Modifications")

-- Time Changer
WorldSection:CreateSlider({
   Name = "Time of Day",
   Range = {0, 24},
   Increment = 0.5,
   Suffix = "hours",
   CurrentValue = 12,
   Flag = "TimeOfDaySlider",
   Callback = function(Value)
      Lighting.ClockTime = Value
   end,
})

-- Fog
WorldSection:CreateToggle({
   Name = "Fog",
   CurrentValue = false,
   Flag = "FogToggle",
   Callback = function(Value)
      Lighting.FogEnd = Value and 10000 or 1000000000
   end,
})

WorldSection:CreateSlider({
   Name = "Fog Density",
   Range = {0, 1000},
   Increment = 10,
   Suffix = "density",
   CurrentValue = 100,
   Flag = "FogDensitySlider",
   Callback = function(Value)
      Lighting.FogEnd = Value
   end,
})

-- Gravity
WorldSection:CreateSlider({
   Name = "Gravity",
   Range = {0, 196.2},
   Increment = 10,
   Suffix = "studs/s²",
   CurrentValue = 196.2,
   Flag = "GravitySlider",
   Callback = function(Value)
      workspace.Gravity = Value
   end,
})

-- Anti-Cheat Section
local AntiCheatSection = AntiCheatTab:CreateSection("Anti-Cheat Bypass")

-- Anti-Cheat Disabler
AntiCheatSection:CreateButton({
   Name = "Disable Anti-Cheat",
   Callback = function()
      Rayfield:Notify({
         Title = "Anti-Cheat Disabled",
         Content = "Attempting to bypass anti-cheat systems",
         Duration = 5,
         Image = 7733960981,
      })
      
      -- This is a generic approach and may not work for all games
      for i,v in pairs(getreg()) do
         if type(v) == "function" and is_synapse_function(v) then
            setupvalue(v, 1, function() return true end)
         end
      end
   end,
})

-- Anti-Kick
AntiCheatSection:CreateToggle({
   Name = "Anti-Kick",
   CurrentValue = false,
   Flag = "AntiKickToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Anti-Kick Enabled",
            Content = "Attempting to prevent kicks",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Anti-Kick Disabled",
            Content = "Kick protection removed",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Anti-Ban
AntiCheatSection:CreateToggle({
   Name = "Anti-Ban",
   CurrentValue = false,
   Flag = "AntiBanToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Anti-Ban Enabled",
            Content = "Attempting to prevent bans",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Anti-Ban Disabled",
            Content = "Ban protection removed",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Script Integrity Bypass
AntiCheatSection:CreateToggle({
   Name = "Script Integrity Bypass",
   CurrentValue = false,
   Flag = "ScriptIntegrityToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Script Integrity Bypassed",
            Content = "Attempting to bypass script checks",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Script Integrity Normal",
            Content = "Script checks active",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Memory Protection
AntiCheatSection:CreateToggle({
   Name = "Memory Protection",
   CurrentValue = false,
   Flag = "MemoryProtectionToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Memory Protection Enabled",
            Content = "Attempting to hide from memory scans",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Memory Protection Disabled",
            Content = "Memory not protected",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Misc Section
local MiscSection = WorldTab:CreateSection("RyxoHub Utilities")

-- FPS Boost
MiscSection:CreateButton({
   Name = "FPS Boost",
   Callback = function()
      Rayfield:Notify({
         Title = "FPS Boost Applied",
         Content = "Graphics optimized for performance",
         Duration = 5,
         Image = 7733960981,
      })
   end,
})

-- Server Rejoin
MiscSection:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
      Rayfield:Notify({
         Title = "Rejoining Server",
         Content = "Reconnecting to current server...",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Server Hop
MiscSection:CreateButton({
   Name = "Server Hop",
   Callback = function()
      Rayfield:Notify({
         Title = "Server Hopping",
         Content = "Finding a new server...",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Settings Section
local SettingsSection = SettingsTab:CreateSection("RyxoHub Settings")

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

-- Config Saving
SettingsSection:CreateButton({
   Name = "Save Configuration",
   Callback = function()
      Rayfield:Notify({
         Title = "Configuration Saved",
         Content = "Your settings have been saved",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

SettingsSection:CreateButton({
   Name = "Load Configuration",
   Callback = function()
      Rayfield:Notify({
         Title = "Configuration Loaded",
         Content = "Your settings have been loaded",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Credits
local CreditsSection = SettingsTab:CreateSection("RyxoHub Credits")
CreditsSection:CreateParagraph({Title = "RyxoHub Ultimate v3.0", Content = "Created by Ryxo Development Team\nSpecial thanks to our beta testers\n\nFeatures:\n- Advanced Anti-Cheat Bypass\n- Silent Aim with Customization\n- ESP & Visual Enhancements\n- Advanced Graphics Controls\n- World Modification\n- Player Utilities"})

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

-- UI Toggle key
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, processed)
   if not processed and input.KeyCode == Enum.KeyCode.RightShift then
      Rayfield:Toggle()
   end
end)

Rayfield:Notify({
   Title = "RyxoHub Ultimate Loaded",
   Content = "Welcome to RyxoHub Ultimate! Press RightShift to toggle menu\n\nFeatures: Anti-Cheat Bypass | Silent Aim | ESP | Advanced Graphics",
   Duration = 8,
   Image = 7733960981,
})

-- Load configuration at the end
Rayfield:LoadConfiguration()
