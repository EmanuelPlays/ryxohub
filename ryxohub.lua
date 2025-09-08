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
    },
    [9872472334] = { -- A Long Road
        Name = "A Long Road",
        Script = "BUILTIN", -- Special indicator for built-in script
        Icon = 7733960981,
        Features = {"Auto Drive", "Auto Collect", "Speed Hack", "Teleports", "Infinite Fuel"}
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

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Local player
local LocalPlayer = Players.LocalPlayer

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

-- Create tabs
local UniversalTab = Window:CreateTab("Universal", 7733960981)
local PlayerTab = Window:CreateTab("Player", 7733960981)
local VisualsTab = Window:CreateTab("Visuals", 7733960981)
local TeleportTab = Window:CreateTab("Teleport", 7733960981)
local SettingsTab = Window:CreateTab("Settings", 7733960981)

-- A Long Road specific variables
local ALongRoadTab
local ALongRoadSection
local AutoDriveEnabled = false
local AutoCollectEnabled = false
local InfiniteFuelEnabled = false
local VehicleSpeed = 50

-- Function to load A Long Road specific script
local function LoadALongRoadScript()
    -- Create a dedicated tab for A Long Road
    ALongRoadTab = Window:CreateTab("A Long Road", 7733960981)
    ALongRoadSection = ALongRoadTab:CreateSection("A Long Road Cheats")
    
    -- Auto Drive Toggle
    ALongRoadSection:CreateToggle({
        Name = "Auto Drive",
        CurrentValue = false,
        Flag = "AutoDriveToggle",
        Callback = function(Value)
            AutoDriveEnabled = Value
            if AutoDriveEnabled then
                Rayfield:Notify({
                    Title = "Auto Drive Enabled",
                    Content = "Vehicle will drive automatically",
                    Duration = 3,
                    Image = 7733960981,
                })
                
                -- Auto Drive logic
                spawn(function()
                    while AutoDriveEnabled and RunService.Heartbeat:Wait() do
                        -- Find vehicle and make it drive forward
                        local character = LocalPlayer.Character
                        if character then
                            local humanoid = character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:Move(Vector3.new(0, 0, -1)) -- Move forward
                            end
                        end
                    end
                end)
            else
                Rayfield:Notify({
                    Title = "Auto Drive Disabled",
                    Content = "Manual control restored",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
    -- Auto Collect Toggle
    ALongRoadSection:CreateToggle({
        Name = "Auto Collect",
        CurrentValue = false,
        Flag = "AutoCollectToggle",
        Callback = function(Value)
            AutoCollectEnabled = Value
            if AutoCollectEnabled then
                Rayfield:Notify({
                    Title = "Auto Collect Enabled",
                    Content = "Automatically collecting resources",
                    Duration = 3,
                    Image = 7733960981,
                })
                
                -- Auto Collect logic
                spawn(function()
                    while AutoCollectEnabled and RunService.Heartbeat:Wait() do
                        -- Find and collect nearby resources
                        for _, item in ipairs(workspace:GetChildren()) do
                            if item.Name == "Resource" or item.Name == "Coin" or item.Name == "Collectible" then
                                local charRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if charRoot and (charRoot.Position - item.Position).Magnitude < 20 then
                                    firetouchinterest(charRoot, item, 0)
                                    firetouchinterest(charRoot, item, 1)
                                end
                            end
                        end
                    end
                end)
            else
                Rayfield:Notify({
                    Title = "Auto Collect Disabled",
                    Content = "Manual collection required",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
    -- Infinite Fuel Toggle
    ALongRoadSection:CreateToggle({
        Name = "Infinite Fuel",
        CurrentValue = false,
        Flag = "InfiniteFuelToggle",
        Callback = function(Value)
            InfiniteFuelEnabled = Value
            if InfiniteFuelEnabled then
                Rayfield:Notify({
                    Title = "Infinite Fuel Enabled",
                    Content = "Fuel will never deplete",
                    Duration = 3,
                    Image = 7733960981,
                })
                
                -- Infinite Fuel logic
                spawn(function()
                    while InfiniteFuelEnabled and RunService.Heartbeat:Wait() do
                        -- Find and set fuel to max
                        local character = LocalPlayer.Character
                        if character then
                            for _, part in ipairs(character:GetDescendants()) do
                                if part.Name:lower():find("fuel") and part:IsA("NumberValue") then
                                    part.Value = 100
                                end
                            end
                            
                            -- Check vehicle too
                            for _, vehicle in ipairs(workspace:GetChildren()) do
                                if vehicle:FindFirstChild("Seat") and vehicle.Seat:FindFirstChild("Occupant") then
                                    if vehicle.Seat.Occupant == LocalPlayer.Character.Humanoid then
                                        for _, part in ipairs(vehicle:GetDescendants()) do
                                            if part.Name:lower():find("fuel") and part:IsA("NumberValue") then
                                                part.Value = 100
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                Rayfield:Notify({
                    Title = "Infinite Fuel Disabled",
                    Content = "Fuel consumption normal",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
    -- Vehicle Speed Slider
    ALongRoadSection:CreateSlider({
        Name = "Vehicle Speed",
        Range = {10, 200},
        Increment = 5,
        Suffix = "speed",
        CurrentValue = 50,
        Flag = "VehicleSpeedSlider",
        Callback = function(Value)
            VehicleSpeed = Value
            
            -- Apply speed boost to vehicle
            local character = LocalPlayer.Character
            if character then
                for _, vehicle in ipairs(workspace:GetChildren()) do
                    if vehicle:FindFirstChild("Seat") and vehicle.Seat:FindFirstChild("Occupant") then
                        if vehicle.Seat.Occupant == character.Humanoid then
                            if vehicle:FindFirstChild("MaxSpeed") then
                                vehicle.MaxSpeed.Value = Value
                            end
                        end
                    end
                end
            end
        end,
    })
    
    -- Teleport to Checkpoint Button
    ALongRoadSection:CreateButton({
        Name = "Teleport to Next Checkpoint",
        Callback = function()
            -- Find the next checkpoint
            local checkpoints = {}
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj.Name:lower():find("checkpoint") or obj.Name:lower():find("cp") then
                    table.insert(checkpoints, obj)
                end
            end
            
            -- Sort checkpoints by position
            table.sort(checkpoints, function(a, b)
                return a.Position.X < b.Position.X
            end)
            
            -- Teleport to the next checkpoint
            local charRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if charRoot and #checkpoints > 0 then
                local targetCheckpoint = checkpoints[1]
                
                -- Find the farthest checkpoint we haven't passed yet
                for _, checkpoint in ipairs(checkpoints) do
                    if checkpoint.Position.X > charRoot.Position.X then
                        targetCheckpoint = checkpoint
                        break
                    end
                end
                
                charRoot.CFrame = CFrame.new(targetCheckpoint.Position + Vector3.new(0, 5, 0))
                Rayfield:Notify({
                    Title = "Teleported",
                    Content = "Teleported to next checkpoint",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
    -- Instant Win Button
    ALongRoadSection:CreateButton({
        Name = "Instant Win (Teleport to End)",
        Callback = function()
            -- Find the finish line or end point
            local finishLine
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj.Name:lower():find("finish") or obj.Name:lower():find("end") then
                    finishLine = obj
                    break
                end
            end
            
            -- If no finish line found, try to find the farthest point
            if not finishLine then
                local farthestX = -math.huge
                for _, obj in ipairs(workspace:GetChildren()) do
                    if obj:IsA("Part") and obj.Position.X > farthestX then
                        farthestX = obj.Position.X
                        finishLine = obj
                    end
                end
            end
            
            -- Teleport to finish line
            local charRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if charRoot and finishLine then
                charRoot.CFrame = CFrame.new(finishLine.Position + Vector3.new(0, 5, 0))
                Rayfield:Notify({
                    Title = "Teleported to Finish",
                    Content = "You should win now!",
                    Duration = 5,
                    Image = 7733960981,
                })
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Could not find finish line",
                    Duration = 3,
                    Image = 7733960981,
                })
            end
        end,
    })
    
    Rayfield:Notify({
        Title = "A Long Road Cheats Loaded",
        Content = "Special features enabled for A Long Road",
        Duration = 5,
        Image = 7733960981,
    })
end

-- Function to load game script automatically
local function LoadGameScript()
    if currentGame.Script then
        Rayfield:Notify({
            Title = "Loading Game Script",
            Content = "Loading " .. currentGame.Name .. " cheats...",
            Duration = 3,
            Image = currentGame.Icon,
        })
        
        -- Load the game-specific script
        local success, err = pcall(function()
            if currentGame.Script == "BUILTIN" and currentGame.Name == "A Long Road" then
                LoadALongRoadScript()
            else
                loadstring(game:HttpGet(currentGame.Script))()
            end
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
    else
        Rayfield:Notify({
            Title = "No Game-Specific Script",
            Content = "Using universal cheats only for " .. currentGame.Name,
            Duration = 5,
            Image = currentGame.Icon,
        })
    end
end

-- Load the game script automatically on start
spawn(function()
    wait(1) -- Wait a moment for UI to fully load
    LoadGameScript()
end)

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
         local vu = game:GetService("VirtualUser")
         game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector3.new(0,0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector3.new(0,0,0), workspace.CurrentCamera.CFrame)
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
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
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
         if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValue
         end
      else
         if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
         end
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
      if SpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.WalkSpeed = Value
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
         if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = JumpValue
         end
      else
         if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = 50
         end
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
      if JumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   end,
})

-- Fly
local FlyEnabled = false
local FlySpeed = 50
local FlyBodyVelocity

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
         
         -- Fly logic
         if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            FlyBodyVelocity = Instance.new("BodyVelocity")
            FlyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            FlyBodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            FlyBodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
         end
         
         local flyConnection
         flyConnection = UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.E then
               if FlyBodyVelocity then
                  FlyBodyVelocity.Velocity = Vector3.new(0, FlySpeed, 0)
               end
            elseif input.KeyCode == Enum.KeyCode.Q then
               if FlyBodyVelocity then
                  FlyBodyVelocity.Velocity = Vector3.new(0, -FlySpeed, 0)
               end
            end
         end)
         
         UserInputService.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.E or input.KeyCode == Enum.KeyCode.Q then
               if FlyBodyVelocity then
                  FlyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
               end
            end
         end)
      else
         if FlyBodyVelocity then
            FlyBodyVelocity:Destroy()
            FlyBodyVelocity = nil
         end
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
local ESPHighlights = {}
VisualsSection:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Flag = "PlayerESPToggle",
   Callback = function(Value)
      if Value then
         -- ESP logic
         for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
               local highlight = Instance.new("Highlight")
               highlight.Parent = player.Character
               highlight.FillColor = Color3.fromRGB(255, 0, 0)
               highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
               highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
               ESPHighlights[player] = highlight
            end
         end
         
         -- Connect to new players
         Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
               if player ~= LocalPlayer then
                  local highlight = Instance.new("Highlight")
                  highlight.Parent = character
                  highlight.FillColor = Color3.fromRGB(255, 0, 0)
                  highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                  highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                  ESPHighlights[player] = highlight
               end
            end)
         end)
         
         Rayfield:Notify({
            Title = "Player ESP Enabled",
            Content = "Players highlighted through walls",
            Duration = 3,
            Image = 7733960981,
         })
      else
         -- Remove ESP
         for player, highlight in pairs(ESPHighlights) do
            if highlight then
               highlight:Destroy()
            end
         end
         ESPHighlights = {}
         
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
         Lighting.GlobalShadows = false
         Lighting.ClockTime = 14
         Rayfield:Notify({
            Title = "FullBright Enabled",
            Content = "Maximum brightness activated",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Lighting.GlobalShadows = true
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
         -- Make walls semi-transparent
         for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("Part") and (part.Name:lower():find("wall") or part.Name:lower():find("building")) then
               part.Transparency = 0.5
            end
         end
         
         Rayfield:Notify({
            Title = "X-Ray Enabled",
            Content = "Seeing through walls",
            Duration = 3,
            Image = 7733960981,
         })
      else
         -- Restore wall opacity
         for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("Part") and (part.Name:lower():find("wall") or part.Name:lower():find("building")) then
               part.Transparency = 0
            end
         end
         
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
      for _, player in ipairs(Players:GetPlayers()) do
         if player ~= LocalPlayer then
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
         local targetPlayer = Players[selectedPlayer]
         if targetPlayer and targetPlayer.Character then
            local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
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
spawn(function()
   wait(2)
   local players = {}
   for _, player in ipairs(Players:GetPlayers()) do
      if player ~= LocalPlayer then
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
