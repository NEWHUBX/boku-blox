

local TP = game.Players.LocalPlayer.Character.HumanoidRootPart

----------------Project New World 6918802270
---------------Control Army 10700669209
---------------My Hero Mania 4934471106 1,400+
---------------Anime Fruit Simulator 10446125875
--------------Anime Souls Simulator 11542692507 1,700+


if game.PlaceId == 6918802270 then 
    local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteMan420/bub/main/chub"))()
ESP.Players = false
ESP.Boxes = false
local vu = game:GetService("VirtualUser")

Plr = game.Players.LocalPlayer
local function getFRUIT()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace"):GetChildren() do
        if v:IsA("Tool")  then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end


local function getCHEST()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace"):GetChildren() do
        if v:IsA("Model") and v.Name == "Chest" then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Hitbox.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end
local TweenService = game:GetService("TweenService")
local noclipE = false
local antifall = false

local function noclip()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
    end
end

local function moveto(obj, speed)
    local info =
        TweenInfo.new(
        ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / speed,
        Enum.EasingStyle.Linear
    )
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})

    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        antifall.Velocity = Vector3.new(0, 0, 0)
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end

    tween.Completed:Connect(
        function()
            antifall:Destroy()
            noclipE:Disconnect()
        end
    )
end

local MOB = {}

for i, v in pairs(game:GetService("Workspace")["NPC Zones"]:GetDescendants()) do
    if v:IsA "StringValue" and v.Name == "NPCName" then
		if not table.find(MOB, tostring(v.Value)) then
            table.insert(MOB, tostring(v.Value))
        end
    end
end
local ISLAND = {}

for i, v in pairs(game:GetService("Workspace")["Npc_Workspace"]["Spawn Setters"]:GetChildren()) do
    if v:IsA "Model" then
		if not table.find(ISLAND, tostring(v)) then
            table.insert(ISLAND, tostring(v))
        end
    end
end

local BACK = {}

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA "Tool" then
		if not table.find(BACK, tostring(v)) then
            table.insert(BACK, tostring(v))
        end
    end
end


local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
getgenv().SecureMode = true

local Window = Rayfield:CreateWindow({
	Name = "Voxle Hub V9jg4gFXzg",
	LoadingTitle = "Voxle Hub",
	LoadingSubtitle = "by Voxle",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, 
		FileName = "Voxle Hub 2"
	},
        Discord = {
        	Enabled = true,
        	Invite = "V9jg4gFXzg", 
        	RememberJoins = true
        },

})

local Tab = Window:CreateTab("Main")

local Section = Tab:CreateSection("Farming")


Tab:CreateToggle({
	Name = "Normal Auto Attack",
	CurrentValue = false,
	Flag = "Toggle8", 
	Callback = function(Value)
		aaaaa = Value
            while aaaaa do task.wait()
                vu:Button1Down(Vector2.new(1000, 1000), workspace.CurrentCamera.CFrame)
                wait(0.1)
                vu:Button1Up(Vector2.new(1000, 1000), workspace.CurrentCamera.CFrame)
		end
	end,
})
    Tab:CreateLabel("Kill Aura only works with Combat")
 	Tab:CreateToggle({
	Name = "Kill Aura",
	CurrentValue = false,
	Flag = "Toggle3", 
	Callback = function(Value)
		a = Value
            while a do task.wait()
                pcall(function()
                game:GetService("Players").LocalPlayer.Character.Combat.Punch:FireServer((1))
            end)
		end
	end,
})

local drop = Tab:CreateDropdown({
	Name = "Select Mob",
	Options = MOB,
	CurrentOption = "Mob List",
	Flag = "Dropdown1", 
	Callback = function(Value)
        getgenv().mob = Value
	end,
})

local function getClosest()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace")["NPC Zones"]:GetDescendants() do
        if v:IsA("Model") and v.Parent.Name == "NPCS" and v.NPCName.Value == mob and v.Humanoid.Health > 0 then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end

Tab:CreateToggle({
	Name = "Farm Mob",
	CurrentValue = false,
	Flag = "Toggle9", 
	Callback = function(Value)
        c = Value
        while c do task.wait()
            pcall(function()
                moveto(getClosest().HumanoidRootPart.CFrame + Vector3.new(0,0,0),250)

            end)
        end
	end,
})

Tab:CreateToggle({
	Name = "Auto Quest",
	CurrentValue = false,
	Flag = "Toggle2", 
	Callback = function(Value)
        aa = Value
        while aa do task.wait()
            pcall(function()
                if mob == "Thief" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1"):FindFirstChild("1"),
                        [2] = "Level 1"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Bandit" then
                local args = {
                    [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1"):FindFirstChild("1"),
                    [2] = "Level 10"
                }

                game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Bandit Boss" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1"):FindFirstChild("1"),
                        [2] = "Level 25"
                    }
    
                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Pirate Clown" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2"):FindFirstChild("2"),
                        [2] = "Level 40"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Clown Boss" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2"):FindFirstChild("2"),
                        [2] = "Level 60"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Fishman" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3"):FindFirstChild("3"),
                        [2] = "Level 90"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Shark Boss" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3"):FindFirstChild("3"),
                        [2] = "Level 120"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Desert Thief" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4"):FindFirstChild("4"),
                        [2] = "Level 160"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Bomb Boss" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4"):FindFirstChild("4"),
                        [2] = "Level 200"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Krieg Pirate" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("5"):FindFirstChild("5"),
                        [2] = "Level 250"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Krieg Boss" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("5"):FindFirstChild("5"),
                        [2] = "Level 300"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Marine Recruit" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("6"):FindFirstChild("6"),
                        [2] = "Level 350"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Tashii" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("6"):FindFirstChild("6"),
                        [2] = "Level 400"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Monkey" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7"):FindFirstChild("7"),
                        [2] = "Level 450"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Gorilla" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7"):FindFirstChild("7"),
                        [2] = "Level 500"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "King Gorilla" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7"):FindFirstChild("7"),
                        [2] = "Level 550"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Marine Grunt" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("8"):FindFirstChild("8"),
                        [2] = "Level 600"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Marine Captain" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("8"):FindFirstChild("8"),
                        [2] = "Level 650"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Satyr" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("9"):FindFirstChild("9"),
                        [2] = "Level 700"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Minotaur" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("9"):FindFirstChild("9"),
                        [2] = "Level 750"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Elite Marine" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10"):FindFirstChild("10"),
                        [2] = "Level 800"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Vice Admiral" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10"):FindFirstChild("10"),
                        [2] = "Level 850"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Ice Admiral" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10"):FindFirstChild("10"),
                        [2] = "Level 900"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Sandorian Warrior" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11"):FindFirstChild("11"),
                        [2] = "Level 950"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Divine Soldier" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11"):FindFirstChild("11"),
                        [2] = "Level 1000"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Revolutionary" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11"):FindFirstChild("11"),
                        [2] = "Level 1150"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Revolutionary Elite" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11"):FindFirstChild("11"),
                        [2] = "Level 1200"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                elseif mob == "Revolutionary Boss" then
                    local args = {
                        [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11"):FindFirstChild("11"),
                        [2] = "Level 1250"
                    }

                    game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))

                end
            end)
        end
	end,
})

Tab:CreateButton({
	Name = "Refresh mobs",
	Callback = function()
        table.clear(MOB)
        for i, v in pairs(game:GetService("Workspace")["NPC Zones"]:GetDescendants()) do
            if v:IsA "StringValue" and v.Name == "NPCName" then
                if not table.find(MOB, tostring(v.Value)) then
                    table.insert(MOB, tostring(v.Value))
                    drop:Refresh(MOB, "Mob List")
                end
            end
        end
	end,
})
Tab:CreateToggle({
	Name = "Farm Chests",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
        aaaa = Value
        while aaaa do task.wait()
            pcall(function()
                moveto(getCHEST().Hitbox.CFrame + Vector3.new(0,0,0),500)
                for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v:IsA("Part") or v:IsA("MeshPart") then
                        if game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Position) <= 50 then
                            if v:FindFirstChild("ProximityPrompt") then
                                fireproximityprompt(v.ProximityPrompt)
                            end
                        end
                    end
                end
            end)
        end
	end,
})




local Tab = Window:CreateTab("Teleports")
    Tab:CreateDropdown({
	Name = "Select Island",
	Options = ISLAND,
	CurrentOption = "Island List",
	Flag = "Dropdown2", 
	Callback = function(Value)
        getgenv().island = Value
	end,
})
Tab:CreateButton({
	Name = "Teleport to Island",
	Callback = function()
        local args = {
            [1] = island
        }

        game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end,
})

    Tab:CreateDropdown({
	Name = "Select NPC",
	Options = {
    "Buso",
    "ObsHaki",
    "Black Leg",
    "Flashstep 1",
    "Flashstep 2",
    "Pipe",
    "Katana",
    "Soul Cane"},
	CurrentOption = "NPC List",
	Flag = "Dropdown3", 
	Callback = function(Value)
        getgenv().npc = Value
	end,
})
Tab:CreateButton({
	Name = "Teleport to NPC",
	Callback = function()
        if npc == "Buso" then
            moveto(game:GetService("Workspace")["Npc_Workspace"].Buso["1"].Clicker.CFrame
            + Vector3.new(0,0,0),200)
        elseif npc == "ObsHaki" then
            moveto(game:GetService("Workspace")["Npc_Workspace"].ObsHaki["1"].Clicker.CFrame + Vector3.new(0,0,0),1000)

        elseif npc == "Black Leg" then
            moveto(game:GetService("Workspace")["Npc_Workspace"].Geppo["Black Leg"].Clicker.CFrame + Vector3.new(0,0,0),1000)


        elseif npc == "Flashstep 1" then
            moveto(game:GetService("Workspace")["Npc_Workspace"].FlashStep["1"].Clicker.CFrame + Vector3.new(0,0,0),1000)

        elseif npc == "Flashstep 2" then
            moveto(game:GetService("Workspace")["Npc_Workspace"].FlashStep["2"].Clicker.CFrame + Vector3.new(0,0,0),1000)

        elseif npc == "Pipe" then
            moveto(game:GetService("Workspace")["Npc_Workspace"]["Sword Sellers"].Pipe.Clicker.CFrame + Vector3.new(0,0,0),1000)

        elseif npc == "Katana" then
            moveto(game:GetService("Workspace")["Npc_Workspace"]["Sword Sellers"].Katana.Clicker.CFrame + Vector3.new(0,0,0),1000)

        elseif npc == "Soul Cane" then
            moveto(game:GetService("Workspace")["Npc_Workspace"]["Sword Sellers"]["Soul Cane"].Clicker.CFrame + Vector3.new(0,0,0),1000)
            
        end
	end,
})
Tab:CreateButton({
	Name = "Teleport to Fruit",
	Callback = function()
        moveto(getFRUIT().Handle.CFrame + Vector3.new(0,0,0),250)
        for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                if game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Position) <= 50 then
                    if v:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
            end
        end
	end,
})

    Tab = Window:CreateTab("Settings")

    WEAP = Tab:CreateDropdown({
	Name = "Select Weapon",
	Options = BACK,
	CurrentOption = "Weapon List",
	Flag = "Dropdown4", 
	Callback = function(Value)
        getgenv().weapon = Value
	end,
})


Tab:CreateToggle({
	Name = "Auto Equip",
	CurrentValue = false,
	Flag = "Toggle7", 
	Callback = function(Value)
        aaa = Value
        while aaa do task.wait()
            pcall(function()
                if Plr.Backpack:FindFirstChild(weapon) and Plr.Character:FindFirstChild(weapon) == nil then
                    local tool = Plr.Backpack:FindFirstChild(weapon)
                    Plr.Character.Humanoid:EquipTool(tool)      
                    task.wait(5)   
                end
            end)
        end
	end,
})
Tab:CreateButton({
	Name = "Refresh Weapons",
	Callback = function()
        table.clear(BACK)
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA "Tool" then
                if not table.find(BACK, tostring(v)) then
                    table.insert(BACK, tostring(v))
                    WEAP:Refresh(BACK, "Weapon List")
                end
            end
        end
	end,
})

    Tab:CreateDropdown({
	Name = "Select Stat",
	Options = {"Combat",
    "Defense",
    "Sword",
    "Fruit"},
	CurrentOption = "Stat List",
	Flag = "Dropdown6", 
	Callback = function(Value)
        getgenv().stat = Value
	end,
})


Tab:CreateToggle({
	Name = "Auto Stat",
	CurrentValue = false,
	Flag = "Toggle5", 
	Callback = function(Value)
        aaaaaaa = Value
        while aaaaaaa do task.wait()
            local args = {
                [1] = stat,
                [2] = 1
            }

            game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer(unpack(args))
        end
	end,
})
Tab:CreateToggle({
	Name = "Auto Buso",
	CurrentValue = false,
	Flag = "Toggle11", 
	Callback = function(Value)
        f = Value
        while f do task.wait()
            pcall(function()
            for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name and v.BusoEnabled.Value == false then
                    game:GetService("Players").LocalPlayer.Character.Buso_Server.Comunication:FireServer()
                end
                end
            end)
        end
	end,
})

Tab:CreateToggle({
	Name = "Devil Fruit Notifier",
	CurrentValue = false,
	Flag = "Toggle4", 
	Callback = function(Value)
        b = Value
        while b do task.wait()
            for i, v in next, game:GetService("Workspace"):GetChildren() do
                    if v:IsA("Tool") then
                        Rayfield:Notify({
                            Title = "Devil Fruit Found",
                            Content = v.Name .. "has been found",
                            Duration = 6.5,
                            Image = 4483362458,
                            Actions = { -- Notification Buttons
                                Ignore = {
                                    Name = "Okay!",
                                    Callback = function()
                                        print("The user tapped Okay!")
                                    end
                                },
                            },
                        })
                        task.wait(20)
                end
            end
        end
	end,
})
local Tab = Window:CreateTab("Local Player")
local Slider = Tab:CreateSlider({
	Name = "WalkSpeed",
	Range = {0, 500},
	Increment = 10,
	Suffix = "WalkSpeed",
	CurrentValue = 30,
	Flag = "Slider1", 
	Callback = function(Value)
        getgenv().speed = Value
	end,
})

Tab:CreateToggle({
	Name = "Toggle",
	CurrentValue = false,
	Flag = "Toggle17", 
	Callback = function(Value)
        c = Value
        while c do
            task.wait()
            game.Players.LocalPlayer.Character["Sprint_Client"].WalkSpeed.Value = speed
        end
	end,
})
Tab:CreateToggle({
	Name = "Inf Jump",
	CurrentValue = false,
	Flag = "Toggle18", 
	Callback = function(Value)
        game:GetService("UserInputService").JumpRequest:connect(function()
            if Value then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
         end)
	end,
})
Tab:CreateButton({
	Name = "Inf Sky Walk",
	Callback = function()
		game.Players.LocalPlayer.PlayerData.Buffs.SkyWalkBuff.Value = "inf"
	end,
})

for i, v in next, game:GetService("Workspace")["Npc_Workspace"].BoatSellers:GetChildren() do
    if v:IsA("Model")  then
ESP:AddObjectListener(v.Parent, {
    Name = v.Name,
    CustomName = v.Name,
    Color = Color3.fromRGB(221,160,221),
    IsEnabled = "Area"
})

end
end
for i, v in next, game:GetService("Workspace").Logic.Flags:GetChildren() do
    if v:IsA("Model")  then
ESP:AddObjectListener(v.Parent, {
    Name = v.Name,
    CustomName = v.Name,
    Color = Color3.fromRGB(0,160,0),
    IsEnabled = "Flag"
})
end
end
for i, v in next, game:GetService("Workspace"):GetDescendants() do
    if v.Parent:IsA("Tool") and v.Name == "Handle" and v.Parent:FindFirstChild("Activate") then
ESP:AddObjectListener(v.Parent, {
    Name = v.Name,
    CustomName = v.Parent.Name,
    Color = Color3.fromRGB(255,255,0),
    IsEnabled = "Fruit"
})

end
end
local Tab = Window:CreateTab("ESP")
Tab:CreateToggle({
	Name = "Toggle ESP",
	CurrentValue = false,
	Flag = "Toggle10", 
	Callback = function(state)
        ESP:Toggle(state)
	end,
})
     Tab:CreateToggle({
	Name = "Toggle Boxes",
	CurrentValue = false,
	Flag = "Toggle12", 
	Callback = function(state)
        ESP.Boxes = state
	end,
})
Tab:CreateToggle({
	Name = "Toggle Players",
	CurrentValue = false,
	Flag = "Toggle13", 
	Callback = function(state)
        ESP.Players = state
	end,
})
Tab:CreateToggle({
	Name = "Toggle Islands",
	CurrentValue = false,
	Flag = "Toggle14", 
	Callback = function(state)
        ESP.Area = state
	end,
})
Tab:CreateToggle({
	Name = "Toggle Flags",
	CurrentValue = false,
	Flag = "Toggle15", 
	Callback = function(state)
        ESP.Flag = state
	end,
})

Tab:CreateToggle({
	Name = "Toggle Fruit",
	CurrentValue = false,
	Flag = "Toggle16", 
	Callback = function(state)
        ESP.Fruit = state
	end,
})

Rayfield:LoadConfiguration()
elseif game.PlaceId == 11040063484 then
    local TweenService = game:GetService("TweenService")
local noclipE = false
local antifall = false

local function noclip()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
    end
end

local function moveto(obj, speed)
    local info =
        TweenInfo.new(
        ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / speed,
        Enum.EasingStyle.Linear
    )
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})

    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        antifall.Velocity = Vector3.new(0, 0, 0)
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end

    tween.Completed:Connect(
        function()
            antifall:Destroy()
            noclipE:Disconnect()
        end
    )
end

local MOB = {}

for i, v in pairs(game:GetService("Workspace").Live.NPCs.Client:GetChildren()) do
    if v:IsA "Model" then
		if not table.find(MOB, tostring(v.HumanoidRootPart.NPCTag.NameLabel.Text)) then
            table.insert(MOB, tostring(v.HumanoidRootPart.NPCTag.NameLabel.Text))
        end
    end
end
local function getClosest()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace").Live.NPCs.Client:GetChildren() do
        if v:IsA("Model") then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
getgenv().SecureMode = true

local Window = Rayfield:CreateWindow({
	Name = "Voxle Hub",
	LoadingTitle = "Voxle Hub",
	LoadingSubtitle = "by Voxle",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, 
		FileName = "Voxle Hub 3"
	},
        Discord = {
        	Enabled = true,
        	Invite = "RSsC4ATvkj", 
        	RememberJoins = true
        },

})

local Tab = Window:CreateTab("Main")

local Section = Tab:CreateSection("Farming")

 	Tab:CreateToggle({
	Name = "Kill Aura",
	CurrentValue = false,
	Flag = "Toggle3", 
	Callback = function(Value)
		a = Value
		while a do task.wait()
            pcall(function()
			local args = {
				[1] = getClosest().Name
			}

			game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            game:GetService("Workspace").Live.Pickups.Currency.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end)
		end
	end,
})

local drop = Tab:CreateDropdown({
	Name = "Select Mob",
	Options = MOB,
	CurrentOption = "Mob List",
	Flag = "Dropdown1", 
	Callback = function(Value)
        getgenv().mob = Value
	end,
})
local function getClosestMOB()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace").Live.NPCs.Client:GetChildren() do
        if v:IsA("Model") and v.HumanoidRootPart.NPCTag.NameLabel.Text == mob then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end

Tab:CreateToggle({
	Name = "Farm Mob",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
        aa = Value
        while aa do task.wait()
            pcall(function()
                moveto(getClosestMOB().HumanoidRootPart.CFrame + Vector3.new(5,0,0),200)
            end)
        end
	end,
})

Tab:CreateButton({
	Name = "Refresh mobs",
	Callback = function()
        table.clear(MOB)
		for i, v in pairs(game:GetService("Workspace").Live.NPCs.Client:GetChildren()) do
            if v:IsA "Model" then
                if not table.find(MOB, tostring(v.HumanoidRootPart.NPCTag.NameLabel.Text)) then
                    table.insert(MOB, tostring(v.HumanoidRootPart.NPCTag.NameLabel.Text))
                    drop:Refresh(MOB, "Mob List")
                end
            end
        end
	end,
})

Tab:CreateToggle({
	Name = "Farm Nearest Mob",
	CurrentValue = false,
	Flag = "Toggle2", 
	Callback = function(Value)
        aaaaa = Value
        while aaaaa do task.wait()
            pcall(function()
                moveto(getClosest().HumanoidRootPart.CFrame + Vector3.new(5,0,0),200)
            end)
        end
	end,
})

local Tab = Window:CreateTab("Misc")

Tab:CreateButton({
	Name = "Claim Rewards",
	Callback = function()
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Free Ticket 1"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Free Ticket 2"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Free Ticket 3"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Free Ticket 4"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Free Ticket 5"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Free Ticket 6"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Chest 1"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Chest 2"))
        game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer(("Chest 3"))


	end,
})

Tab:CreateDropdown({
	Name = "Select Zone",
	Options = 
    {"Dark Forest",
    "Skull Cove",
    "Demon Hill",
    "Polar Tundra",
    "Aether City",
    "Underworld",
    "Ancient Sands",
    "Enchanted Woods",
    "Mystic Mines"},
	CurrentOption = "Zone List",
	Flag = "Dropdown2", 
	Callback = function(Value)
        getgenv().zone = Value
	end,
})

Tab:CreateButton({
	Name = "Teleport",
	Callback = function()
        if zone == "Dark Forest" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(326.855927, 149.584839, -0.997089803, 0.669812739, -3.11749773e-08, 0.742530048, 4.49429436e-08, 1, 1.443201e-09, -0.742530048, 3.24048131e-08, 0.669812739)
        elseif zone == "Skull Cove" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2234, 149, -574)
        elseif zone == "Demon Hill" then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3948, 149, -383)
        elseif zone == "Polar Tundra" then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5965, 149, -538)
        elseif zone == "Aether City" then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8953, 608, -502)
        elseif zone == "Underworld" then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(13588, 154, 86)
        elseif zone == "Ancient Sands" then 

        elseif zone == "Enchanted Woods" then 
            
        elseif zone == "Mystic Mines" then 

        end
	end,
})

Rayfield:LoadConfiguration()
elseif game.PlaceId == 10700669209 then
    lp = game.Players.LocalPlayer
    local Object = {}
    
    for i, v in pairs(game:GetService("Workspace").Objects:GetChildren()) do
        if v:IsA "Model" then
            if not table.find(Object, tostring(v)) then
            table.insert(Object, tostring(v))
            end
        end
    end
    
    local function getClosest()
        local dist, thing = math.huge
        for i, v in next, game:GetService("Workspace").Objects:GetChildren() do
            if v:IsA("Model")  then
                local mag =
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.BOTTOM.Position).magnitude
                if mag < dist then
                    dist = mag
                    thing = v
                end
            end
        end
        return thing
    end
    
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
    getgenv().SecureMode = true
    
    local Window = Rayfield:CreateWindow({
        Name = "Voxle Hub",
        LoadingTitle = "Voxle Hub",
        LoadingSubtitle = "by Voxle",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil, 
            FileName = "Voxle Hub 4"
        },
            Discord = {
                Enabled = true,
                Invite = "RSsC4ATvkj", 
                RememberJoins = true
            },
    
    })
    
    local Tab = Window:CreateTab("Main")
    
    local Section = Tab:CreateSection("Farming")
    
        Tab:CreateToggle({
        Name = "Auto Attack Nearest",
        CurrentValue = false,
        Flag = "Toggle1", 
        Callback = function(Value)
            a = Value
            while a do task.wait()
                local args = {
                    [1] = "Attack",
                    [2] = getClosest()
                }
                
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end,
    })
    
        Tab:CreateDropdown({
        Name = "Select Object",
        Options = Object,
        CurrentOption = "Select Object",
        Flag = "Dropdown1", 
        Callback = function(Value)
            getgenv().object = Value
        end,
    })
    local function getSelected()
        local dist, thing = math.huge
        for i, v in next, game:GetService("Workspace").Objects:GetChildren() do
            if v:IsA("Model") and v.Name == object then
                local mag =
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.BOTTOM.Position).magnitude
                if mag < dist then
                    dist = mag
                    thing = v
                end
            end
        end
        return thing
    end
    Tab:CreateToggle({
        Name = "Auto Attack Selected",
        CurrentValue = false,
        Flag = "Toggle2", 
        Callback = function(Value)
            b = Value
            while b do task.wait()
                local args = {
                    [1] = "Attack",
                    [2] = getSelected()
                }
                
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end,
    })
    Tab:CreateToggle({
        Name = "Auto Mob",
        CurrentValue = false,
        Flag = "Toggle3", 
        Callback = function(Value)
            d = Value
            while d do
            task.wait()
            pcall(function()
                    lp.Character.HumanoidRootPart.CFrame = getSelected().BOTTOM.CFrame
            end)
            end
        end,
    })
    
    Tab:CreateButton({
        Name = "Teleport Home",
        Callback = function()
            for i, v in next, game:GetService("Workspace"):GetChildren() do
                if v:IsA("Model") and v:FindFirstChild("PLAYERNAME") and v.PLAYERNAME.SurfaceGui.TextLabel.Text == game.Players.LocalPlayer.Name then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.ZONE.CFrame
                end
            end
        end,
    })
    local Tab = Window:CreateTab("Local Player")
    local Slider = Tab:CreateSlider({
        Name = "WalkSpeed",
        Range = {0, 500},
        Increment = 10,
        Suffix = "WalkSpeed",
        CurrentValue = 30,
        Flag = "Slider1", 
        Callback = function(Value)
            getgenv().speed = Value
        end,
    })
    
    Tab:CreateToggle({
        Name = "Toggle",
        CurrentValue = false,
        Flag = "Toggle17", 
        Callback = function(Value)
            c = Value
            while c do
            task.wait()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
            end
        end,
    })
    Tab:CreateToggle({
        Name = "Inf Jump",
        CurrentValue = false,
        Flag = "Toggle18", 
        Callback = function(Value)
            game:GetService("UserInputService").JumpRequest:connect(function()
                if Value then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
             end)
        end,
    })
    
    Rayfield:LoadConfiguration()
elseif game.PlaceId == 10446125875 then
    local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteMan420/bub/main/chub"))()
    ESP.Players = false
    ESP.Boxes = false
    local Eggs = {}

    for i, v in pairs(game:GetService("Workspace").Maps.Eggs:GetChildren()) do
        if v:IsA "Model" then
            table.insert(Eggs, tostring(v))
        end
    end
    local Locale = {}
    
    for i, v in pairs(game:GetService("Workspace").TeleportLocations:GetChildren()) do
        if v:IsA "Part" then
            table.insert(Locale, tostring(v))
        end
    end
    local function getClosest()
        for i, x in next, game:GetService("Workspace"):GetChildren() do
            if x:IsA("Folder") and x:FindFirstChild("Bomu") or x:FindFirstChild("Bari") or x:FindFirstChild("Snow") or x:FindFirstChild("Pika") or x:FindFirstChild("Buddha") or x:FindFirstChild("Zushi") or x:FindFirstChild("Magu") or x:FindFirstChild("Goro") or x:FindFirstChild("Tori") or x:FindFirstChild("Mochi") or x:FindFirstChild("Venom") or x:FindFirstChild("Soul") or x:FindFirstChild("Ito")  then
        local dist, thing = math.huge
        for i, v in next, game:GetService("Workspace")[x.Name]:GetDescendants() do
            if v:IsA("MeshPart") then
                local mag =
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
                if mag < dist then
                    dist = mag
                    thing = v
                end
            end
                end
        return thing
            end
        end
    end
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
    getgenv().SecureMode = true
    
    local Window = Rayfield:CreateWindow({
        Name = "Voxle Hub",
        LoadingTitle = "Voxle Hub",
        LoadingSubtitle = "by Voxle",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil, 
            FileName = "Voxle Hub 5"
        },
            Discord = {
                Enabled = true,
                Invite = "RSsC4ATvkj", 
                RememberJoins = true
            },
    
    })
    
    local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
    
    local Section = Tab:CreateSection("Farming")
    Tab:CreateToggle({
        Name = "Auto Attack",
        CurrentValue = false,
        Flag = "Toggle1", 
        Callback = function(Value)
            b = Value
            while b do task.wait()
                game:GetService("ReplicatedStorage").Remotes.Attack:FireServer()
            end
        end,
    })
    Tab:CreateToggle({
        Name = "Auto Fruit Skills",
        CurrentValue = false,
        Flag = "Toggle2", 
        Callback = function(Value)
            c = Value
            while c do task.wait()
                game:GetService("ReplicatedStorage").Remotes.Validate:FireServer(("One"))
                game:GetService("ReplicatedStorage").Remotes.Validate:FireServer(("Two"))
                game:GetService("ReplicatedStorage").Remotes.Validate:FireServer(("Three"))
            end
        end,
    })
    
        Tab:CreateDropdown({
        Name = "Eggs",
        Options = Eggs,
        CurrentOption = "Select Egg",
        Flag = "Dropdown1", 
        Callback = function(Value)
            getgenv().egg = Value
        end,
    })
    Tab:CreateToggle({
        Name = "Auto Single Egg",
        CurrentValue = false,
        Flag = "Toggle4", 
        Callback = function(Value)
            d = Value
            while d do task.wait()
                local args = {
                    [1] = egg,
                    [2] = "HatchBtn"
                }
                
                game:GetService("ReplicatedStorage").Remotes.Egg:FireServer(unpack(args))
            end
        end,
    })
    Tab:CreateToggle({
        Name = "Auto Triple Egg",
        CurrentValue = false,
        Flag = "Toggle5", 
        Callback = function(Value)
            d = Value
            while d do task.wait()
                local args = {
                    [1] = egg,
                    [2] = "TripleBtn"
                }
                
                game:GetService("ReplicatedStorage").Remotes.Egg:FireServer(unpack(args))
            end
        end,
    })
    local Section = Tab:CreateSection("If you pick up fruits too fast it will kick/ban you")
    Tab:CreateToggle({
        Name = "Auto Fruit Tp",
        CurrentValue = false,
        Flag = "Toggle20", 
        Callback = function(Value)
            zzz = Value
            while zzz do task.wait()
                pcall(function()
                for i, v in pairs(workspace:GetDescendants()) do
                    if v.ClassName == "ProximityPrompt" then
                    v.HoldDuration = 0
                    end
                    end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosest().CFrame
                end)
            end
        end,
    })
    Tab:CreateToggle({
        Name = "Auto Grab Fruit",
        CurrentValue = false,
        Flag = "Toggle20", 
        Callback = function(Value)
            zz = Value
            while zz do task.wait()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.E,false,game)
                task.wait(2)
            end
        end,
    })


    local Tab = Window:CreateTab("Teleport")
    Tab:CreateDropdown({
        Name = "Zones",
        Options = Locale,
        CurrentOption = "Select Zone",
        Flag = "Dropdown2", 
        Callback = function(Value)
            getgenv().zone = Value
        end,
    })
    Tab:CreateButton({
        Name = "Teleport",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").TeleportLocations[zone].CFrame
        end,
    })
    local Tab = Window:CreateTab("Local Player")
    Tab:CreateButton({
        Name = "Some Free Gamepasses",
        Callback = function()
            for i, v in pairs(game.Players.LocalPlayer.PassBools:GetChildren()) do
                if v.ClassName == "BoolValue" then
                    v.Value = true
                end
            end
        end,
    })
    Tab:CreateButton({
        Name = "Print Fruit Spawns (F9)",
        Callback = function()
            for i, x in next, game:GetService("Workspace"):GetChildren() do
                if x:IsA("Folder") and x:FindFirstChild("Bomu") then
            for i, v in next, game:GetService("Workspace")[x.Name]:GetChildren() do
                if v:IsA("Model") then
            print(v.Name)
                end
            end
                end
            end
        end,
    })
    Tab:CreateButton({
        Name = "Clean F9",
        Callback = function()
            print(("\n"):rep(20))
        end,
    })
    local Slider = Tab:CreateSlider({
        Name = "WalkSpeed",
        Range = {0, 500},
        Increment = 10,
        Suffix = "WalkSpeed",
        CurrentValue = 30,
        Flag = "Slider1", 
        Callback = function(Value)
            getgenv().speed = Value
        end,
    })
    
    Tab:CreateToggle({
        Name = "Toggle",
        CurrentValue = false,
        Flag = "Toggle17", 
        Callback = function(Value)
            c = Value
            while c do
            task.wait()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
            end
        end,
    })
    game.Players.LocalPlayer.PlayerScripts.Controllers.ClientAntiCheat:Destroy()
    Rayfield:LoadConfiguration()

elseif game.PlaceId == 4934471106 then

    Plr = game.Players.LocalPlayer
    
    local TweenService = game:GetService("TweenService")
    local noclipE = false
    local antifall = false
    
    local function noclip()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
    
    local function moveto(obj, speed)
        local info =
            TweenInfo.new(
            ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / speed,
            Enum.EasingStyle.Linear
        )
        local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})
    
        if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
            antifall.Velocity = Vector3.new(0, 0, 0)
            noclipE = game:GetService("RunService").Stepped:Connect(noclip)
            tween:Play()
        end
    
        tween.Completed:Connect(
            function()
                antifall:Destroy()
                noclipE:Disconnect()
            end
        )
    end
    
    local MOB = {}
    
    for i, v in pairs(game:GetService("Workspace").Living:GetChildren()) do
        if v:FindFirstChild("NPC") then
            if not table.find(MOB, tostring(v)) then
                table.insert(MOB, tostring(v))
            end
        end
    end
    local QUEST = {}
    
    for i, v in pairs(game:GetService("ReplicatedStorage").Package.Quests:GetChildren()) do
        if v:IsA("Folder") then
            if not table.find(QUEST, tostring(v)) then
                table.insert(QUEST, tostring(v))
            end
        end
    end
    
    
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
    getgenv().SecureMode = true
    
    local Window = Rayfield:CreateWindow({
        Name = "Voxle Hub V9jg4gFXzg",
        LoadingTitle = "Voxle Hub",
        LoadingSubtitle = "by Voxle",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil, 
            FileName = "Voxle Hub 6"
        },
            Discord = {
                Enabled = true,
                Invite = "V9jg4gFXzg", 
                RememberJoins = true
            },
    
    })
    
    local Tab = Window:CreateTab("Main")
    
    local Section = Tab:CreateSection("Farming")
    
    
        Tab:CreateDropdown({
        Name = "Select Mob",
        Options = MOB,
        CurrentOption = "Mob List",
        Flag = "Dropdown1", 
        Callback = function(Value)
            getgenv().mob = Value
        end,
    })
    local function getClosest()
        local dist, thing = math.huge
        for i, v in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if v:IsA("Model") and v.Name == mob and v.Humanoid.Health > 0 then
                local mag =
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                if mag < dist then
                    dist = mag
                    thing = v
                end
            end
        end
        return thing
    end
    
    Tab:CreateToggle({
        Name = "Auto Mob",
        CurrentValue = false,
        Flag = "Toggle1", 
        Callback = function(Value)
            a = Value
            while a do task.wait()
                pcall(function()
                    moveto(getClosest().HumanoidRootPart.CFrame + Vector3.new(0,0,0),100)
    
                end)
            end
        end,
    })
    Tab:CreateDropdown({
        Name = "Select Quest",
        Options = QUEST,
        CurrentOption = "Quest List",
        Flag = "Dropdown2", 
        Callback = function(Value)
            getgenv().quest = Value
        end,
    })
    Tab:CreateToggle({
        Name = "Auto Quest",
        CurrentValue = false,
        Flag = "Toggle2", 
        Callback = function(Value)
            b = Value
            while b do task.wait()
                if game.Players.LocalPlayer.PlayerGui.HUD.Frames.Quest.Visible ==  false then
                    game.Players.LocalPlayer.PlayerGui.HUD.Frames.Chat.Options.Visible = true
                    game:GetService("ReplicatedStorage").Package.Events.GetQuest:InvokeServer((quest))
                    game.Players.LocalPlayer.PlayerGui.HUD.Frames.Quest.Visible =  true
                end
            end
        end,
    })
    
    
    Tab:CreateToggle({
        Name = "Auto Attack",
        CurrentValue = false,
        Flag = "Toggle3", 
        Callback = function(Value)
            c = Value
                while c do task.wait()
                    pcall(function()
                    local args = {
                        [1] = 1,
                        [2] = getClosest().HumanoidRootPart.CFrame
                    }
    
                    game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(unpack(args))
                    local args = {
                        [1] = 2,
                        [2] = getClosest().HumanoidRootPart.CFrame
                    }
    
                    game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(unpack(args))
                    local args = {
                        [1] = 3,
                        [2] = getClosest().HumanoidRootPart.CFrame
                    }
    
                    game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(unpack(args))
                    local args = {
                        [1] = 4,
                        [2] = getClosest().HumanoidRootPart.CFrame
                    }
    
                    game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(unpack(args))
                    local args = {
                        [1] = 5,
                        [2] = getClosest().HumanoidRootPart.CFrame
                    }
    
                    game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(unpack(args))
                end)
            end
        end,
    })
    
    Tab:CreateToggle({
        Name = "Auto Skills",
        CurrentValue = false,
        Flag = "Toggle4", 
        Callback = function(Value)
            xx = Value
            while xx do task.wait()
                pcall(function()
                local args = {
                    [1] = "1",
                    [2] = "Down",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "1",
                    [2] = "Up",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "2",
                    [2] = "Down",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "2",
                    [2] = "Up",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "3",
                    [2] = "Down",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "3",
                    [2] = "Up",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "4",
                    [2] = "Down",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "4",
                    [2] = "Up",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "5",
                    [2] = "Down",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
                local args = {
                    [1] = "5",
                    [2] = "Up",
                    [3] = {
                        ["MouseHit"] = getClosest().HumanoidRootPart.CFrame,
                        ["Mobile"] = false
                    }
                }
    
                game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(args))
            end)
            end
        end,
    })
        
elseif game.PlaceId == 11542692507 then
    local Enemies = {}

for i, v in pairs(game:GetService("Workspace")["_ENEMIES"]:GetDescendants()) do
    if v:IsA "Model" and v.Parent.Parent.Name == "_ENEMIES" then
		if not table.find(Enemies, tostring(v)) then
			table.insert(Enemies, tostring(v))
		end
    end
end
local function getClosest()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace")["_ENEMIES"]:GetDescendants() do
      if  v.Name == "HumanoidRootPart" then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end
local Plr = game.Players.LocalPlayer
local vu = game:GetService("VirtualUser")
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
getgenv().SecureMode = true

local Window = Rayfield:CreateWindow({
	Name = "Voxle Hub V9jg4gFXzg",
	LoadingTitle = "Voxle Hub",
	LoadingSubtitle = "by Voxle",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, 
		FileName = "Voxle Hub Soul"
	},
        Discord = {
        	Enabled = true,
        	Invite = "V9jg4gFXzg", 
        	RememberJoins = true
        },

})

local Tab = Window:CreateTab("Main")

local Section = Tab:CreateSection("Farming")


Tab:CreateToggle({
	Name = "Auto Attack",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		a = Value
            while a do task.wait()
				local args = {
				[1] = {
					[1] = "Hit",
					[2] = getClosest().Parent
				}
			}

			game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
		end
	end,
})
local Dropdown = Tab:CreateDropdown({
	Name = "Enemies",
	Options = Enemies,
	CurrentOption = "Enemy List",
	Flag = "Dropdown1", 
	Callback = function(Value)
		getgenv().enemy = Value
	end,
})
local function getClosestMob()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace")["_ENEMIES"]:GetDescendants() do
      if  v.Name == "HumanoidRootPart" and v.Parent.Name == enemy then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end
Tab:CreateToggle({
	Name = "Auto Mob",
	CurrentValue = false,
	Flag = "Toggle2", 
	Callback = function(Value)
		b = Value
            while b do task.wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMob().CFrame
		end
	end,
})
Rayfield:LoadConfiguration()
end
