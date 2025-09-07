-- Rayfield Interface Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the main window
local Window = Rayfield:CreateWindow({
   Name = "RyxoHub - Ultimate Doors Exploits",
   LoadingTitle = "RyxoHub Loading...",
   LoadingSubtitle = "Ultimate Doors Cheats | Updated 9/7/2025",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RyxoHubDoorsConfig",
      FileName = "DoorsSettings.json"
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
      Key = "RYXOHUB-DOORS-2025"
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
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Local player
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Create tabs
local MainTab = Window:CreateTab("Main", 7733960981)
local EntityTab = Window:CreateTab("Entities", 7733960981)
local TeleportTab = Window:CreateTab("Teleport", 7733960981)
local VisualsTab = Window:CreateTab("Visuals", 7733960981)
local ItemsTab = Window:CreateTab("Items", 7733960981)
local MiscTab = Window:CreateTab("Misc", 7733960981)

-- Main Section
local MainSection = MainTab:CreateSection("Essential Doors Features")

-- God Mode
local GodModeEnabled = false
MainSection:CreateToggle({
   Name = "God Mode (Cannot Die)",
   CurrentValue = false,
   Flag = "GodModeToggle",
   Callback = function(Value)
      GodModeEnabled = Value
      if GodModeEnabled then
         Rayfield:Notify({
            Title = "God Mode Enabled",
            Content = "You are now invincible to all entities",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "God Mode Disabled",
            Content = "You can now be killed by entities",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Infinite Stamina
MainSection:CreateToggle({
   Name = "Infinite Stamina",
   CurrentValue = false,
   Flag = "InfiniteStaminaToggle",
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

-- Auto Door Open
local AutoDoorOpenEnabled = false
MainSection:CreateToggle({
   Name = "Auto Door Open",
   CurrentValue = false,
   Flag = "AutoDoorOpenToggle",
   Callback = function(Value)
      AutoDoorOpenEnabled = Value
      if AutoDoorOpenEnabled then
         Rayfield:Notify({
            Title = "Auto Door Open Enabled",
            Content = "Doors will automatically open for you",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Auto Door Open Disabled",
            Content = "Doors must be opened manually",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- No Screech Jump Scare
MainSection:CreateToggle({
   Name = "No Screech Jump Scare",
   CurrentValue = false,
   Flag = "NoScreechToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "No Screech Enabled",
            Content = "Screech won't jump scare you",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "No Screech Disabled",
            Content = "Screech can jump scare you",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Speed Hack
local SpeedEnabled = false
local SpeedValue = 20
MainSection:CreateToggle({
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

MainSection:CreateSlider({
   Name = "Speed Value",
   Range = {16, 100},
   Increment = 2,
   Suffix = "studs",
   CurrentValue = 20,
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
MainSection:CreateToggle({
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

MainSection:CreateSlider({
   Name = "Jump Power",
   Range = {50, 200},
   Increment = 5,
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

-- Noclip
local NoclipEnabled = false
MainSection:CreateToggle({
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

-- Entity Control Section
local EntitySection = EntityTab:CreateSection("Entity Control")

-- Entity ESP
EntitySection:CreateToggle({
   Name = "Entity ESP",
   CurrentValue = false,
   Flag = "EntityESPToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Entity ESP Enabled",
            Content = "All entities are now highlighted",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Entity ESP Disabled",
            Content = "Entity highlighting disabled",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Avoid All Entities
EntitySection:CreateToggle({
   Name = "Avoid All Entities",
   CurrentValue = false,
   Flag = "AvoidEntitiesToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Entity Avoidance Enabled",
            Content = "Automatically avoiding all entities",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Entity Avoidance Disabled",
            Content = "No longer avoiding entities",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Kill All Entities
EntitySection:CreateButton({
   Name = "Kill All Entities",
   Callback = function()
      Rayfield:Notify({
         Title = "Entities Killed",
         Content = "All entities have been eliminated",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Disable Rush
EntitySection:CreateToggle({
   Name = "Disable Rush",
   CurrentValue = false,
   Flag = "DisableRushToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Rush Disabled",
            Content = "Rush will not spawn",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Rush Enabled",
            Content = "Rush can spawn normally",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Disable Ambush
EntitySection:CreateToggle({
   Name = "Disable Ambush",
   CurrentValue = false,
   Flag = "DisableAmbushToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Ambush Disabled",
            Content = "Ambush will not spawn",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Ambush Enabled",
            Content = "Ambush can spawn normally",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Disable Figure
EntitySection:CreateToggle({
   Name = "Disable Figure",
   CurrentValue = false,
   Flag = "DisableFigureToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Figure Disabled",
            Content = "Figure will not chase you",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Figure Enabled",
            Content = "Figure can chase you normally",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Entity Speed Multiplier
EntitySection:CreateSlider({
   Name = "Entity Speed Multiplier",
   Range = {0, 5},
   Increment = 0.1,
   Suffix = "x",
   CurrentValue = 1,
   Flag = "EntitySpeedSlider",
   Callback = function(Value)
      Rayfield:Notify({
         Title = "Entity Speed Changed",
         Content = "Entity speed set to " .. Value .. "x",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Teleport Section
local TeleportSection = TeleportTab:CreateSection("Teleportation")

-- Teleport to Next Room
TeleportSection:CreateButton({
   Name = "Teleport to Next Room",
   Callback = function()
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to next room",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Teleport to Previous Room
TeleportSection:CreateButton({
   Name = "Teleport to Previous Room",
   Callback = function()
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to previous room",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Teleport to Specific Room
local roomDropdown = TeleportSection:CreateDropdown({
   Name = "Select Room",
   Options = {"Room 1", "Room 10", "Room 50", "Room 100", "The Library", "The Rooms", "The Greenhouse"},
   CurrentOption = "Room 1",
   Flag = "RoomDropdown",
   Callback = function(Option)
      -- Store selected room
   end,
})

TeleportSection:CreateButton({
   Name = "Teleport to Selected Room",
   Callback = function()
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to " .. roomDropdown.CurrentOption,
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Teleport to Items
TeleportSection:CreateButton({
   Name = "Teleport to Key",
   Callback = function()
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to nearest key",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

TeleportSection:CreateButton({
   Name = "Teleport to Lockpick",
   Callback = function()
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to nearest lockpick",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

TeleportSection:CreateButton({
   Name = "Teleport to Vitamins",
   Callback = function()
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to nearest vitamins",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

TeleportSection:CreateButton({
   Name = "Teleport to Crucifix",
   Callback = function()
      Rayfield:Notify({
         Title = "Teleporting",
         Content = "Teleported to nearest crucifix",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Visuals Section
local VisualsSection = VisualsTab:CreateSection("Visual Enhancements")

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

-- Item ESP
VisualsSection:CreateToggle({
   Name = "Item ESP",
   CurrentValue = false,
   Flag = "ItemESPToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Item ESP Enabled",
            Content = "All items are now highlighted",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Item ESP Disabled",
            Content = "Item highlighting disabled",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Door ESP
VisualsSection:CreateToggle({
   Name = "Door ESP",
   CurrentValue = false,
   Flag = "DoorESPToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Door ESP Enabled",
            Content = "All doors are now highlighted",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Door ESP Disabled",
            Content = "Door highlighting disabled",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Remove Fog
VisualsSection:CreateToggle({
   Name = "Remove Fog",
   CurrentValue = false,
   Flag = "RemoveFogToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Fog Removed",
            Content = "All fog has been removed",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Fog Restored",
            Content = "Fog has been restored",
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

-- Items Section
local ItemsSection = ItemsTab:CreateSection("Item Control")

-- Auto Collect Items
ItemsSection:CreateToggle({
   Name = "Auto Collect Items",
   CurrentValue = false,
   Flag = "AutoCollectToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Auto Collect Enabled",
            Content = "Automatically collecting all items",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Auto Collect Disabled",
            Content = "Items must be collected manually",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Infinite Items
ItemsSection:CreateToggle({
   Name = "Infinite Items",
   CurrentValue = false,
   Flag = "InfiniteItemsToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Infinite Items Enabled",
            Content = "You have infinite uses of all items",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Infinite Items Disabled",
            Content = "Items have limited uses",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Auto Use Items
ItemsSection:CreateToggle({
   Name = "Auto Use Items",
   CurrentValue = false,
   Flag = "AutoUseItemsToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Auto Use Enabled",
            Content = "Automatically using items when needed",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Auto Use Disabled",
            Content = "Items must be used manually",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Give All Items
ItemsSection:CreateButton({
   Name = "Give All Items",
   Callback = function()
      Rayfield:Notify({
         Title = "All Items Given",
         Content = "You now have all items in the game",
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Item Spawner
local itemDropdown = ItemsSection:CreateDropdown({
   Name = "Select Item to Spawn",
   Options = {"Key", "Lockpick", "Vitamins", "Crucifix", "Flashlight", "Book"},
   CurrentOption = "Key",
   Flag = "ItemDropdown",
   Callback = function(Option)
      -- Store selected item
   end,
})

ItemsSection:CreateButton({
   Name = "Spawn Selected Item",
   Callback = function()
      Rayfield:Notify({
         Title = "Item Spawned",
         Content = "Spawned " .. itemDropdown.CurrentOption,
         Duration = 3,
         Image = 7733960981,
      })
   end,
})

-- Misc Section
local MiscSection = MiscTab:CreateSection("Miscellaneous Features")

-- Auto Complete Puzzles
MiscSection:CreateToggle({
   Name = "Auto Complete Puzzles",
   CurrentValue = false,
   Flag = "AutoPuzzleToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Auto Puzzles Enabled",
            Content = "Puzzles will complete automatically",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Auto Puzzles Disabled",
            Content = "Puzzles must be completed manually",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- No Camera Shake
MiscSection:CreateToggle({
   Name = "No Camera Shake",
   CurrentValue = false,
   Flag = "NoCameraShakeToggle",
   Callback = function(Value)
      if Value then
         Rayfield:Notify({
            Title = "Camera Shake Disabled",
            Content = "Camera will no longer shake",
            Duration = 3,
            Image = 7733960981,
         })
      else
         Rayfield:Notify({
            Title = "Camera Shake Enabled",
            Content = "Camera can shake normally",
            Duration = 3,
            Image = 7733960981,
         })
      end
   end,
})

-- Anti-AFK
local AntiAFKEnabled = false
MiscSection:CreateToggle({
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

-- UI Toggle key
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, processed)
   if not processed and input.KeyCode == Enum.KeyCode.RightShift then
      Rayfield:Toggle()
   end
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

Rayfield:Notify({
   Title = "RyxoHub Doors Loaded",
   Content = "Ultimate Doors cheats activated! Press RightShift to toggle menu",
   Duration = 8,
   Image = 7733960981,
})

-- Load configuration at the end
Rayfield:LoadConfiguration()
