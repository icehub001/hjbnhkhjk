if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
	repeat
		wait()
	until game:IsLoaded()
	if _G.Team == "Pirate" then
		for L_45_forvar0, L_46_forvar1 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
			L_46_forvar1.Function()
		end
	elseif _G.Team == "Marine" then
		for L_47_forvar0, L_48_forvar1 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
			L_48_forvar1.Function()
		end
	else
		for L_49_forvar0, L_50_forvar1 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
			L_50_forvar1.Function()
		end
	end
	wait(1)
	local L_2_ = {
		AutoFarm = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/13213213131/Bacon/main/Can%20u%20here%20me")()
	local L_3_ = lib:CreateWindow("peerapat khamwong hub", Vector2.new(492, 598), Enum.KeyCode.RightControl)
	local L_4_ = L_3_:CreateTab("AutoFarm")
	local L_5_ = L_3_:CreateTab("BuyItems")
	local L_6_ = L_3_:CreateTab("Misc")
	local L_7_ = L_3_:CreateTab("Teleports")
	local L_8_ = L_3_:CreateTab("Player")
	local L_9_ = L_3_:CreateTab("Settings")
	local L_10_ = L_8_:CreateSector("ESP", "right")
	local L_11_ = L_8_:CreateSector("Universal", "left")
	local L_12_ = L_4_:CreateSector("AutoFarm", "left")
	local L_13_ = L_4_:CreateSector("Misc", "right")
	local L_14_ = L_5_:CreateSector("Buy Item", "left")
	local L_15_ = L_6_:CreateSector("Devil Fruits", "left")
	local L_16_ = L_6_:CreateSector("Select Specfic Mob", "right")
	local L_17_ = L_6_:CreateSector("Auto Raid", "left")
	local L_18_ = L_6_:CreateSector("Auto Stats", "right")
	local L_19_ = L_7_:CreateSector("Teleports", "left")
	local L_20_ = L_9_:CreateSector("Settings", "Left")
	local L_21_ = game:GetService("UserInputService")
	local L_22_ = game:GetService("TweenService")
	local L_23_ = game:GetService("RunService")
	local L_24_ = game:GetService("Players").LocalPlayer
	local L_25_ = L_24_:GetMouse()
	local L_26_ = game:GetService("HttpService")
	local L_27_ = game.PlaceId
	local L_28_ = {}
	local L_29_ = ""
	local L_30_ = os.date("!*t").hour
	local L_31_ = false
	local L_32_ = pcall(function()
		L_28_ = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
	end)
	if not L_32_ then
		table.insert(L_28_, L_30_)
		writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(L_28_))
	end
	function TPReturner()
		local L_51_;
		if L_29_ == "" then
			L_51_ = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. L_27_ .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			L_51_ = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. L_27_ .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. L_29_))
		end
		local L_52_ = ""
		if L_51_.nextPageCursor and L_51_.nextPageCursor ~= "null" and L_51_.nextPageCursor ~= nil then
			L_29_ = L_51_.nextPageCursor
		end
		local L_53_ = 0;
		for L_54_forvar0, L_55_forvar1 in pairs(L_51_.data) do
			local L_56_ = true
			L_52_ = tostring(L_55_forvar1.id)
			if tonumber(L_55_forvar1.maxPlayers) > tonumber(L_55_forvar1.playing) then
				for L_57_forvar0, L_58_forvar1 in pairs(L_28_) do
					if L_53_ ~= 0 then
						if L_52_ == tostring(L_58_forvar1) then
							L_56_ = false
						end
					else
						if tonumber(L_30_) ~= tonumber(L_58_forvar1) then
							local L_59_ = pcall(function()
                            --delfile("NotSameServers.json")
								L_28_ = {}
								table.insert(L_28_, L_30_)
							end)
						end
					end
					L_53_ = L_53_ + 1
				end
				if L_56_ == true then
					table.insert(L_28_, L_52_)
					wait()
					pcall(function()
                    --writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(L_27_, L_52_, game.Players.LocalPlayer)
					end)
				end
			end
		end
	end
	function Teleport()
		while wait() do
			pcall(function()
				TPReturner()
				if L_29_ ~= "" then
					TPReturner()
				end
			end)
		end
	end
	function HopLowerServer()
		local L_60_, L_61_, L_62_, L_63_ = math.huge, "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
		if not _G.FailedServerID then
			_G.FailedServerID = {}
		end
		local function L_64_func()
			L_63_ = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(L_61_))
			for L_65_forvar0, L_66_forvar1 in pairs(L_63_.data) do
				pcall(function()
					if type(L_66_forvar1) == "table" and L_66_forvar1.id and L_66_forvar1.playing and tonumber(L_60_) > tonumber(L_66_forvar1.playing) and not table.find(_G.FailedServerID, L_66_forvar1.id) then
						L_60_ = L_66_forvar1.playing
						L_62_ = L_66_forvar1.id
					end
				end)
			end
		end
		function getservers()
			pcall(L_64_func)
			for L_67_forvar0, L_68_forvar1 in pairs(L_63_) do
				if L_67_forvar0 == "nextPageCursor" then
					if L_61_:find"&cursor=" then
						local L_69_ = L_61_:find"&cursor="
						local L_70_ = L_61_:sub(L_69_)
						L_61_ = L_61_:gsub(L_70_, "")
					end
					L_61_ = L_61_ .. "&cursor=" .. L_68_forvar1
					pcall(getservers)
				end
			end
		end
		pcall(getservers)
		if L_62_ == game.JobId or L_60_ == #game:GetService"Players":GetChildren() - 1 then
		end
		table.insert(_G.FailedServerID, L_62_)
		game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId, L_62_)
	end
	Wapon = {}
	for L_71_forvar0, L_72_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if L_72_forvar1:IsA("Tool") then
			table.insert(Wapon , L_72_forvar1.Name)
		end
	end
	for L_73_forvar0, L_74_forvar1 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if L_74_forvar1:IsA("Tool") then
			table.insert(Wapon, L_74_forvar1.Name)
		end
	end
	local L_33_ = {}
	for L_75_forvar0, L_76_forvar1 in pairs(game.ReplicatedStorage:GetChildren()) do
		if string.find(L_76_forvar1.Name, "Boss") then
			if L_76_forvar1.Name == "Ice Admiral [Lv. 700] [Boss]" then
			elseif L_76_forvar1.Name == "rip_indra [Lv. 1500] [Boss]" then
			else
				table.insert(L_33_, L_76_forvar1.Name)
			end
		end
	end
	for L_77_forvar0, L_78_forvar1 in pairs(game.workspace.Enemies:GetChildren()) do
		if string.find(L_78_forvar1.Name, "Boss") then
			if L_78_forvar1.Name == "Ice Admiral [Lv. 700] [Boss]" then
			elseif L_78_forvar1.Name == "rip_indra [Lv. 1500] [Boss]" then
			else
				table.insert(L_33_, L_78_forvar1.Name)
			end
		end
	end
	spawn(function()
		pcall(function()
			while wait() do
				if _G.LightMode then
					if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight") then
						local L_79_ = Instance.new("PointLight")
						L_79_.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
						L_79_.Range = 16
						L_79_.Color = Color3.fromRGB(255, 167, 31)
					end
				end
			end
		end)
	end)
	function BeautifulMode()
		_G.LightMode = true
		if game:GetService("Lighting"):FindFirstChild("BloomEffect") then
			game:GetService("Lighting"):FindFirstChild("BloomEffect"):Destroy()
		end
		if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect") then
			game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect"):Destroy()
		end
		if game:GetService("Lighting"):FindFirstChild("DepthOfFieldEffect") then
			game:GetService("Lighting"):FindFirstChild("DepthOfFieldEffect"):Destroy()
		end
		if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect") then
			game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect"):Destroy()
		end
		if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect2") then
			game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect2"):Destroy()
		end
		if game:GetService("Lighting"):FindFirstChild("SunRaysEffect") then
			game:GetService("Lighting"):FindFirstChild("SunRaysEffect"):Destroy()
		end
		local L_80_ = game.Lighting
		L_80_.Ambient = Color3.fromRGB(31, 31, 31)
		L_80_.Brightness = 0.7
		L_80_.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
		L_80_.ColorShift_Top = Color3.fromRGB(255, 102, 31)
		L_80_.EnvironmentDiffuseScale = 0.205
		L_80_.EnvironmentSpecularScale = 0.522
		L_80_.GlobalShadows = true
		L_80_.OutdoorAmbient = Color3.fromRGB(67, 67, 67)
		L_80_.ShadowSoftness = 0.5
		L_80_.GeographicLatitude = -15.525
		L_80_.ExposureCompensation = 0.75
		local L_81_ = Instance.new("BloomEffect", L_80_)
		L_81_.Name = "BloomEffect"
		L_81_.Enabled = true
		L_81_.Intensity = 0.04
		L_81_.Size = 1900
		L_81_.Threshold = 0.915
		local L_82_ = Instance.new("ColorCorrectionEffect", L_80_)
		L_82_.Name = "ColorCorrectionEffect"
		L_82_.Brightness = 0.176
		L_82_.Contrast = 0.39
		L_82_.Enabled = true
		L_82_.Saturation = 0.2
		L_82_.TintColor = Color3.fromRGB(255, 227, 128)
		local L_83_ = Instance.new("DepthOfFieldEffect", L_80_)
		L_83_.Name = "DepthOfFieldEffect"
		L_83_.Enabled = true
		L_83_.FarIntensity = 0.077
		L_83_.FocusDistance = 21.54
		L_83_.InFocusRadius = 20.77
		L_83_.NearIntensity = 0.277
		local L_84_ = Instance.new("ColorCorrectionEffect", L_80_)
		L_84_.Name = "ColorCorrectionEffect"
		L_84_.Brightness = 0.3
		L_84_.Contrast = -0.07
		L_84_.Saturation = 0
		L_84_.Enabled = true
		L_84_.TintColor = Color3.fromRGB(255, 247, 239)
		local L_85_ = Instance.new("ColorCorrectionEffect", L_80_)
		L_85_.Name = "ColorCorrectionEffect2"
		L_85_.Brightness = 0.1
		L_85_.Contrast = 0.45
		L_85_.Saturation = -0.1
		L_85_.Enabled = true
		L_85_.TintColor = Color3.fromRGB(167, 167, 167)
		local L_86_ = Instance.new("SunRaysEffect", L_80_)
		L_86_.Name = "SunRaysEffect"
		L_86_.Enabled = true
		L_86_.Intensity = 0.01
		L_86_.Spread = 0.146
	end
	PlayerName = {}
	for L_87_forvar0, L_88_forvar1 in pairs(game:GetService("Players"):GetChildren()) do
		table.insert(PlayerName , L_88_forvar1.Name)
	end
	Old_World = false
	New_World = false
	Three_World = false
	local L_34_ = game.PlaceId
	if L_34_ == 2753915549 then
		Old_World = true
	elseif L_34_ == 4442272183 then
		New_World = true
	elseif L_34_ == 7449423635 then
		Three_World = true
	end
	L_12_:AddToggle("Auto Farm Level", _G.AutoFarmLevel, function(L_89_arg0)
		_G.AutoFarm = L_89_arg0
		if _G.AutoFarm and SelectToolWeapon == "" then
			print("ee")
		else
			Auto_Farm = L_89_arg0
			SelectMonster = ""
			if L_89_arg0 == false then
				wait(1)
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end
	end)
	L_12_:AddToggle("Auto SetSpawnPoint", false, function(L_90_arg0)
		AutoSetSpawn = L_90_arg0
	end)
	L_12_:AddDropdown("Select Weapon", Wapon, "Select Weapon", false, function(L_91_arg0)
		SelectToolWeapon = L_91_arg0
		SelectToolWeaponOld = L_91_arg0
	end)
	if New_World then
		L_12_:AddToggle("Auto Factory", false, function(L_92_arg0)
			Factory = L_92_arg0
			if L_92_arg0 == false then
				wait()
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
	end
	if _G.Auto_Elite_Hop then
		_G.AutoElite = true
	end
	if Three_World then
		L_12_:AddToggle("Auto Elite Hunter", _G.AutoElite, function(L_93_arg0)
			EliteHunter = L_93_arg0
			if L_93_arg0 == false then
				wait()
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
		L_12_:AddToggle("Auto Enma/Yama", _G.AutoYama, function(L_94_arg0)
			AutoYama = L_94_arg0
		end)
		L_12_:AddToggle("Auto Rainbow Haki", false, function(L_95_arg0)
			AutoRainbow = L_95_arg0
			if L_95_arg0 == false then
				wait()
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
	end
	if Old_World then
		L_12_:AddToggle("Auto New World", _G.AutoNewworld, function(L_96_arg0)
			Auto_Newworld = L_96_arg0
			if L_96_arg0 == false then
				wait()
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
	end
	if New_World then
		L_12_:AddToggle("Auto Third Sea", _G.AutoThirdSea, function(L_97_arg0)
			ReadyThirdSea = L_97_arg0
			TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			if ReadyThirdSea and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 then
				DiscordLib:Notification("Auto Third Sea", "u must have\n Finish Bartilo Quest", "Ok")
			elseif ReadyThirdSea and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") ~= 0 then
				DiscordLib:Notification("Auto Third Sea", "u must have to Killed Don Swan First", "Ok")
			elseif ReadyThirdSea and SelectToolWeapon == "" then
				DiscordLib:Notification("Auto Third Sea", "Select Weapon First", "Ok")
			else
				AutoThird = L_97_arg0
			end
		end)
	end
	L_12_:AddToggle("Auto Superhuman", _G.AutoSuperhuman, function(L_98_arg0)
		Superhuman = L_98_arg0
	end)
	L_12_:AddToggle("Auto Fully Superhuman", _G.FullyAutoSuperhuman, function(L_99_arg0)
		AutoFullySuperhuman = L_99_arg0
	end)
	L_12_:AddToggle("Auto Electric Claw", false, function(L_100_arg0)
		AutoElectricClaw = L_100_arg0
		if AutoElectricClaw then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
		end
	end)
	spawn(function()
		while wait(.1) do
			if AutoElectricClaw then
				if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
				end
				if (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399) or (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value <= 399) then
					SelectToolWeapon = "Electro"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") then
					SelectToolWeapon = "Electric Claw"
				end
				if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400) then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw") == "..." and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == 4 then
						TP(CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375))
					elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 4 then
						Auto_Farm = false
						if (CFrame.new(-10369.7725, 331.654175, -10130.3047, 0.879783928, -1.15147909e-08, 0.475373745, -1.70712194e-10, 1, 2.45385472e-08, -0.475373745, -2.16697718e-08, 0.879783928).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
						else
							TP(CFrame.new(-10369.7725, 331.654175, -10130.3047, 0.879783928, -1.15147909e-08, 0.475373745, -1.70712194e-10, 1, 2.45385472e-08, -0.475373745, -2.16697718e-08, 0.879783928))
						end
					elseif _G.AutoFarm then
						Auto_Farm = true
					end
				end
			end
		end
	end)
	L_12_:AddToggle("Auto Accessories", _G.AutoAccessory, function(L_101_arg0)
		AutoAccessories = L_101_arg0
	end)
	if not Old_World then
		print("balles")
	end
	if _G.AutoLegendary_Hop then
		_G.Auto_Legendary_Sword = true
	elseif _G.Auto_Legendary_Sword then
		_G.Auto_Legendary_Sword = true
	else
		_G.Auto_Legendary_Sword = false
	end
	if _G.AutoEnchancement_Hop then
		_G.AutoEnchancement = true
	elseif _G.AutoEnchancement then
		_G.AutoEnchancement = true
	else
		_G.AutoEnchancement = false
	end
	if New_World then
		L_12_:AddToggle("Auto Buy Legendary Sword", _G.Auto_Legendary_Sword, function(L_102_arg0)
			LegebdarySword = L_102_arg0
		end)
	end
	if not Old_World then
		L_12_:AddToggle("Auto Buy Enchancement", _G.AutoEnchancement, function(L_103_arg0)
			Enchancement = L_103_arg0
		end)
	end
	L_12_:AddLabel("Mastery Farm")
	L_12_:AddToggle("Auto Farm Mastery Devil", false, function(L_104_arg0)
		AutoFarmMasteryFruit = L_104_arg0
		if AutoFarmMasteryFruit and WeaponMastery == "" then
			DiscordLib:Notification("Auto Farm Mastery", "SelectWeapon First", "Okay")
		else
			FarmMasteryFruit = L_104_arg0
			if L_104_arg0 == false then
				wait()
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end
	end)
	L_12_:AddToggle("Auto Farm Mastery Gun", false, function(L_105_arg0)
		AutoarmMasteryGun = L_105_arg0
		if AutoarmMasteryGun and WeaponMastery == "" then
			DiscordLib:Notification("Auto Farm Mastery", "SelectWeapon First", "Okay")
		else
			FarmMasteryGun = L_105_arg0
			if L_105_arg0 == false then
				wait()
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end
	end)
	L_12_:AddSlider("Health %", 1, 1, 100, 1, function(L_106_arg0)
		HealthPersen = L_106_arg0
	end)
	L_12_:AddToggle("Auto Farm Mastery Magnet", false, function(L_107_arg0)
		MasteryMagnet = L_107_arg0
	end)
	L_12_:AddDropdown("Select Weapon", Wapon, "Weapon", false, function(L_108_arg0)
		WeaponMastery = L_108_arg0
	end)
	L_12_:AddLabel("Boss Farm")
	L_12_:AddToggle("Auto Farm Boss", false, function(L_109_arg0)
		AutoFarmBoss = L_109_arg0
		if L_109_arg0 == false then
			wait()
			TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
		end
	end)
	L_12_:AddToggle("Auto Farm Boss Quest", true, function(L_110_arg0)
		BossQuest = L_110_arg0
	end)
	L_12_:AddDropdown("Select Boss", L_33_, "Boss", false, function(L_111_arg0)
		SelectBoss = L_111_arg0
	end)
	L_12_:AddDropdown("Select Weapon", Wapon, "Weapon", false, function(L_112_arg0)
		SelectWeaponBoss = L_112_arg0
	end)
	L_12_:AddButton("Buy Reroll race", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 3)
	end)
	L_12_:AddButton("Buy Refund Stats", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 2)
	end)
	L_12_:AddButton("Buy Random Surprise", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
	end)
	L_12_:AddToggle("Auto Buy Random Surprise", false, function(L_113_arg0)
		AutoBuySurprise = L_113_arg0
	end)
	L_12_:AddToggle("Auto Buy EXP x2 [ Bone ]", false, function(L_114_arg0)
		AutoBuyEXPBone = L_114_arg0
	end)
	if Three_World == true then
		L_12_:AddToggle("Auto Try Luck [gravestone]", false, function(L_115_arg0)
			TryLuck = L_115_arg0
		end)
		L_12_:AddToggle("Auto Pray [gravestone]", false, function(L_116_arg0)
			Pray = L_116_arg0
		end)
		L_12_:AddToggle("Auto Farm Bone", false, function(L_117_arg0)
			Auto_Bone = L_117_arg0
			if L_117_arg0 == false then
				wait(1)
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
	end
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoBuyEXPBone then
					if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.Text, "2x") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if AutoBuySurprise then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if TryLuck then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 1)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if Pray then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
			end
		end
	end)
	L_12_:AddDropdown("Select Weapon", Wapon, "Weapon", false, function(L_118_arg0)
		EventWeapon = L_118_arg0
	end)
	L_12_:AddLabel("Observation Haki Farm")
	Sec = 40
	L_12_:AddSlider("Time", 1, 1, 600, 1, Sec, function(L_119_arg0)
		Sec = L_119_arg0
	end)
	if _G.AutoFarm_Ken then
		AutoFarmKen = true
	else
		AutoFarmKen = false
	end
	L_12_:AddToggle("Auto Farm Observation Haki", AutoFarmKen, function(L_120_arg0)
		AutoFarmObservation = L_120_arg0
		TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
		if AutoFarmObservation then
			game:GetService("VirtualUser"):CaptureController()
			game:GetService("VirtualUser"):SetKeyDown('0x65')
			wait(2)
			game:GetService("VirtualUser"):SetKeyUp('0x65')
		end
	end)
	function TP(L_121_arg0)
		Distance = (L_121_arg0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if Distance < 250 then
			Speed = 600
		elseif Distance < 500 then
			Speed = 400
		elseif Distance < 1000 then
			Speed = 350
		elseif Distance >= 1000 then
			Speed = 200
		end
		game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
            {
			CFrame = L_121_arg0
		}
        ):Play()
	end
	spawn(function()
		while wait() do
			pcall(function()
				CheckLevel()
				for L_122_forvar0, L_123_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if Auto_Farm and MagnetActive and Magnet then
						if L_123_forvar1.Name == Ms and L_123_forvar1:FindFirstChild("Humanoid") and L_123_forvar1.Humanoid.Health > 0 then
							if L_123_forvar1.Name == "Factory Staff [Lv. 800]" then
								if (L_123_forvar1.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
									L_123_forvar1.Head.CanCollide = false
									L_123_forvar1.HumanoidRootPart.CanCollide = false
									L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									L_123_forvar1.HumanoidRootPart.CFrame = PosMon
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								end
							elseif L_123_forvar1.Name == Ms then
								if (L_123_forvar1.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 400 then
									L_123_forvar1.Head.CanCollide = false
									L_123_forvar1.HumanoidRootPart.CanCollide = false
									L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									L_123_forvar1.HumanoidRootPart.CFrame = PosMon
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								end
							end
						end
					elseif FarmMasteryFruit and MasteryBFMagnetActive and MasteryMagnet then
						if L_123_forvar1.Name == "Monkey [Lv. 14]" then
							if (L_123_forvar1.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 then
								L_123_forvar1.Head.CanCollide = false
								L_123_forvar1.HumanoidRootPart.CanCollide = false
								L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								L_123_forvar1.HumanoidRootPart.CFrame = PosMonMasteryFruit
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						elseif L_123_forvar1.Name == "Factory Staff [Lv. 800]" then
							if (L_123_forvar1.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 then
								L_123_forvar1.Head.CanCollide = false
								L_123_forvar1.HumanoidRootPart.CanCollide = false
								L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								L_123_forvar1.HumanoidRootPart.CFrame = PosMonMasteryFruit
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						elseif L_123_forvar1.Name == Ms then
							if (L_123_forvar1.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 400 then
								L_123_forvar1.Head.CanCollide = false
								L_123_forvar1.HumanoidRootPart.CanCollide = false
								L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								L_123_forvar1.HumanoidRootPart.CFrame = PosMonMasteryFruit
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end
					elseif FarmMasteryGun and MasteryGunMagnetActive and MasteryMagnet then
						if L_123_forvar1.Name == "Monkey [Lv. 14]" then
							if (L_123_forvar1.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 then
								L_123_forvar1.Head.CanCollide = false
								L_123_forvar1.HumanoidRootPart.CanCollide = false
								L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								L_123_forvar1.HumanoidRootPart.CFrame = PosMonMasteryGun
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						elseif L_123_forvar1.Name == "Factory Staff [Lv. 800]" then
							if (L_123_forvar1.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 then
								L_123_forvar1.Head.CanCollide = false
								L_123_forvar1.HumanoidRootPart.CanCollide = false
								L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								L_123_forvar1.HumanoidRootPart.CFrame = PosMonMasteryGun
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						elseif L_123_forvar1.Name == Ms then
							if (L_123_forvar1.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 400 then
								L_123_forvar1.Head.CanCollide = false
								L_123_forvar1.HumanoidRootPart.CanCollide = false
								L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								L_123_forvar1.HumanoidRootPart.CFrame = PosMonMasteryGun
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end
					elseif AutoBartilo and MagnetBatilo and Magnet then
						if L_123_forvar1.Name == "Swan Pirate [Lv. 775]" and L_123_forvar1:FindFirstChild("Humanoid") and L_123_forvar1.Humanoid.Health > 0 then
							L_123_forvar1.Head.CanCollide = false
							L_123_forvar1.HumanoidRootPart.CanCollide = false
							L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							L_123_forvar1.HumanoidRootPart.CFrame = PosMonBartilo
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					elseif AutoRengoku and RengokuMagnet and Magnet then
						if (L_123_forvar1.Name == "Snow Lurker [Lv. 1375]" or L_123_forvar1.Name == "Arctic Warrior [Lv. 1350]") and (L_123_forvar1.HumanoidRootPart.Position - PosMonRengoku.Position).Magnitude <= 350 then
							L_123_forvar1.Head.CanCollide = false
							L_123_forvar1.HumanoidRootPart.CanCollide = false
							L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							L_123_forvar1.HumanoidRootPart.CFrame = PosMonRengoku
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					elseif Auto_Bone and BoneMagnet and Magnet then
						if (L_123_forvar1.Name == "Reborn Skeleton [Lv. 1975]" or L_123_forvar1.Name == "Living Zombie [Lv. 2000]" or L_123_forvar1.Name == "Demonic Soul [Lv. 2025]" or L_123_forvar1.Name == "Posessed Mummy [Lv. 2050]") and (L_123_forvar1.HumanoidRootPart.Position - MainMonBone.Position).Magnitude <= 300 then
							L_123_forvar1.Head.CanCollide = false
							L_123_forvar1.HumanoidRootPart.CanCollide = false
							L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							L_123_forvar1.HumanoidRootPart.CFrame = MainMonBone
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					elseif AutoEcto and EctoplasMagnet and Magnet then
						if string.find(L_123_forvar1.Name, "Ship") and (L_123_forvar1.HumanoidRootPart.Position - PosMonEctoplas.Position).Magnitude <= 300 then
							L_123_forvar1.Head.CanCollide = false
							L_123_forvar1.HumanoidRootPart.CanCollide = false
							L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							L_123_forvar1.HumanoidRootPart.CFrame = PosMonEctoplas
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					elseif AutoEvoRace and EvoMagnet and Magnet then
						if L_123_forvar1.Name == "Zombie [Lv. 950]" and (L_123_forvar1.HumanoidRootPart.Position - PosMonZombie.Position).Magnitude <= 300 then
							L_123_forvar1.Head.CanCollide = false
							L_123_forvar1.HumanoidRootPart.CanCollide = false
							L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							L_123_forvar1.HumanoidRootPart.CFrame = PosMonZombie
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					elseif AutoCitizen and CitizenMagnet and Magnet then
						if L_123_forvar1.Name == "Forest Pirate [Lv. 1825]" and (L_123_forvar1.HumanoidRootPart.Position - PosMonCitizen.Position).Magnitude <= 300 then
							L_123_forvar1.Head.CanCollide = false
							L_123_forvar1.HumanoidRootPart.CanCollide = false
							L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							L_123_forvar1.HumanoidRootPart.CFrame = PosMonZombie
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					elseif AutoFarmSelectMonster and AutoFarmSelectMonsterMagnet and Magnet then
						if L_123_forvar1.Name == Ms and (L_123_forvar1.HumanoidRootPart.Position - PosMonSelectMonster.Position).Magnitude <= 400 then
							L_123_forvar1.Head.CanCollide = false
							L_123_forvar1.HumanoidRootPart.CanCollide = false
							L_123_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							L_123_forvar1.HumanoidRootPart.CFrame = PosMonSelectMonster
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					end
				end
			end)
		end
	end)
	function CheckLevel()
		local L_124_ = game:GetService("Players").LocalPlayer.Data.Level.Value
		if Old_World then
			if L_124_ == 1 or L_124_ <= 9 or SelectMonster == "Bandit [Lv. 5]" then -- Bandit
				Ms = "Bandit [Lv. 5]"
				NameQuest = "BanditQuest1"
				QuestLv = 1
				NameMon = "Bandit"
				CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
				CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
			elseif L_124_ == 10 or L_124_ <= 14 or SelectMonster == "Monkey [Lv. 14]" then -- Monkey
				Ms = "Monkey [Lv. 14]"
				NameQuest = "JungleQuest"
				QuestLv = 1
				NameMon = "Monkey"
				CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
				CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
			elseif L_124_ == 15 or L_124_ <= 29 or SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
				Ms = "Gorilla [Lv. 20]"
				NameQuest = "JungleQuest"
				QuestLv = 2
				NameMon = "Gorilla"
				CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
				CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
			elseif L_124_ == 30 or L_124_ <= 39 or SelectMonster == "Pirate [Lv. 35]" then -- Pirate
				Ms = "Pirate [Lv. 35]"
				NameQuest = "BuggyQuest1"
				QuestLv = 1
				NameMon = "Pirate"
				CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
				CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
			elseif L_124_ == 40 or L_124_ <= 59 or SelectMonster == "Brute [Lv. 45]" then -- Brute
				Ms = "Brute [Lv. 45]"
				NameQuest = "BuggyQuest1"
				QuestLv = 2
				NameMon = "Brute"
				CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
				CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
			elseif L_124_ == 60 or L_124_ <= 74 or SelectMonster == "Desert Bandit [Lv. 60]" then -- Desert Bandit
				Ms = "Desert Bandit [Lv. 60]"
				NameQuest = "DesertQuest"
				QuestLv = 1
				NameMon = "Desert Bandit"
				CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
				CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
			elseif L_124_ == 75 or L_124_ <= 89 or SelectMonster == "Desert Officer [Lv. 70]" then -- Desert Officer
				Ms = "Desert Officer [Lv. 70]"
				NameQuest = "DesertQuest"
				QuestLv = 2
				NameMon = "Desert Officer"
				CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
				CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
			elseif L_124_ == 90 or L_124_ <= 99 or SelectMonster == "Snow Bandit [Lv. 90]" then -- Snow Bandit
				Ms = "Snow Bandit [Lv. 90]"
				NameQuest = "SnowQuest"
				QuestLv = 1
				NameMon = "Snow Bandit"
				CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
				CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
			elseif L_124_ == 100 or L_124_ <= 119 or SelectMonster == "Snowman [Lv. 100]" then -- Snowman
				Ms = "Snowman [Lv. 100]"
				NameQuest = "SnowQuest"
				QuestLv = 2
				NameMon = "Snowman"
				CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
				CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
			elseif L_124_ == 120 or L_124_ <= 149 or SelectMonster == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
				Ms = "Chief Petty Officer [Lv. 120]"
				NameQuest = "MarineQuest2"
				QuestLv = 1
				NameMon = "Chief Petty Officer"
				CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
				CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
			elseif L_124_ == 150 or L_124_ <= 174 or SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
				Ms = "Sky Bandit [Lv. 150]"
				NameQuest = "SkyQuest"
				QuestLv = 1
				NameMon = "Sky Bandit"
				CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
				CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
			elseif L_124_ == 175 or L_124_ <= 224 or SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
				Ms = "Dark Master [Lv. 175]"
				NameQuest = "SkyQuest"
				QuestLv = 2
				NameMon = "Dark Master"
				CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
				CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
			elseif L_124_ == 225 or L_124_ <= 274 or SelectMonster == "Toga Warrior [Lv. 225]" then -- Toga Warrior
				Ms = "Toga Warrior [Lv. 225]"
				NameQuest = "ColosseumQuest"
				QuestLv = 1
				NameMon = "Toga Warrior"
				CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
				CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
			elseif L_124_ == 275 or L_124_ <= 299 or SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
				Ms = "Gladiator [Lv. 275]"
				NameQuest = "ColosseumQuest"
				QuestLv = 2
				NameMon = "Gladiator"
				CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
				CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
			elseif L_124_ == 300 or L_124_ <= 329 or SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
				Ms = "Military Soldier [Lv. 300]"
				NameQuest = "MagmaQuest"
				QuestLv = 1
				NameMon = "Military Soldier"
				CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
				CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
			elseif L_124_ == 330 or L_124_ <= 374 or SelectMonster == "Military Spy [Lv. 330]" then -- Military Spy
				Ms = "Military Spy [Lv. 330]"
				NameQuest = "MagmaQuest"
				QuestLv = 2
				NameMon = "Military Spy"
				CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
				CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
			elseif L_124_ == 375 or L_124_ <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior
				Ms = "Fishman Warrior [Lv. 375]"
				NameQuest = "FishmanQuest"
				QuestLv = 1
				NameMon = "Fishman Warrior"
				CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
				CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				end
			elseif L_124_ == 400 or L_124_ <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
				Ms = "Fishman Commando [Lv. 400]"
				NameQuest = "FishmanQuest"
				QuestLv = 2
				NameMon = "Fishman Commando"
				CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
				CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				end
			elseif L_124_ == 450 or L_124_ <= 474 or SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
				Ms = "God's Guard [Lv. 450]"
				NameQuest = "SkyExp1Quest"
				QuestLv = 1
				NameMon = "God's Guard"
				CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
				CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
				end
			elseif L_124_ == 475 or L_124_ <= 524 or SelectMonster == "Shanda [Lv. 475]" then -- Shanda
				Ms = "Shanda [Lv. 475]"
				NameQuest = "SkyExp1Quest"
				QuestLv = 2
				NameMon = "Shanda"
				CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
				CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
				end
			elseif L_124_ == 525 or L_124_ <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
				Ms = "Royal Squad [Lv. 525]"
				NameQuest = "SkyExp2Quest"
				QuestLv = 1
				NameMon = "Royal Squad"
				CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
				CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
			elseif L_124_ == 550 or L_124_ <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
				Ms = "Royal Soldier [Lv. 550]"
				NameQuest = "SkyExp2Quest"
				QuestLv = 2
				NameMon = "Royal Soldier"
				CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
				CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
			elseif L_124_ == 625 or L_124_ <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
				Ms = "Galley Pirate [Lv. 625]"
				NameQuest = "FountainQuest"
				QuestLv = 1
				NameMon = "Galley Pirate"
				CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
				CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
			elseif L_124_ >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
				Ms = "Galley Captain [Lv. 650]"
				NameQuest = "FountainQuest"
				QuestLv = 2
				NameMon = "Galley Captain"
				CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
				CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
			end
		end
		if New_World then
			if L_124_ == 700 or L_124_ <= 724 or SelectMonster == "Raider [Lv. 700]" then -- Raider
				Ms = "Raider [Lv. 700]"
				NameQuest = "Area1Quest"
				QuestLv = 1
				NameMon = "Raider"
				CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
				CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
			elseif L_124_ == 725 or L_124_ <= 774 or SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
				Ms = "Mercenary [Lv. 725]"
				NameQuest = "Area1Quest"
				QuestLv = 2
				NameMon = "Mercenary"
				CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
				CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
			elseif L_124_ == 775 or L_124_ <= 799 or SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
				Ms = "Swan Pirate [Lv. 775]"
				NameQuest = "Area2Quest"
				QuestLv = 1
				NameMon = "Swan Pirate"
				CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
				CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
			elseif L_124_ == 800 or L_124_ <= 874 or SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff
				Ms = "Factory Staff [Lv. 800]"
				NameQuest = "Area2Quest"
				QuestLv = 2
				NameMon = "Factory Staff"
				CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
				CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
			elseif L_124_ == 875 or L_124_ <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
				Ms = "Marine Lieutenant [Lv. 875]"
				NameQuest = "MarineQuest3"
				QuestLv = 1
				NameMon = "Marine Lieutenant"
				CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
				CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
			elseif L_124_ == 900 or L_124_ <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
				Ms = "Marine Captain [Lv. 900]"
				NameQuest = "MarineQuest3"
				QuestLv = 2
				NameMon = "Marine Captain"
				CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
				CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
			elseif L_124_ == 950 or L_124_ <= 974 or SelectMonster == "Zombie [Lv. 950]" then -- Zombie
				Ms = "Zombie [Lv. 950]"
				NameQuest = "ZombieQuest"
				QuestLv = 1
				NameMon = "Zombie"
				CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
				CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
			elseif L_124_ == 975 or L_124_ <= 999 or SelectMonster == "Vampire [Lv. 975]" then -- Vampire
				Ms = "Vampire [Lv. 975]"
				NameQuest = "ZombieQuest"
				QuestLv = 2
				NameMon = "Vampire"
				CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
				CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
			elseif L_124_ == 1000 or L_124_ <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
				Ms = "Snow Trooper [Lv. 1000]"
				NameQuest = "SnowMountainQuest"
				QuestLv = 1
				NameMon = "Snow Trooper"
				CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
				CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
			elseif L_124_ == 1050 or L_124_ <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
				Ms = "Winter Warrior [Lv. 1050]"
				NameQuest = "SnowMountainQuest"
				QuestLv = 2
				NameMon = "Winter Warrior"
				CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
				CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
			elseif L_124_ == 1100 or L_124_ <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
				Ms = "Lab Subordinate [Lv. 1100]"
				NameQuest = "IceSideQuest"
				QuestLv = 1
				NameMon = "Lab Subordinate"
				CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
				CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
			elseif L_124_ == 1125 or L_124_ <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
				Ms = "Horned Warrior [Lv. 1125]"
				NameQuest = "IceSideQuest"
				QuestLv = 2
				NameMon = "Horned Warrior"
				CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
				CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
			elseif L_124_ == 1175 or L_124_ <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
				Ms = "Magma Ninja [Lv. 1175]"
				NameQuest = "FireSideQuest"
				QuestLv = 1
				NameMon = "Magma Ninja"
				CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
				CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
			elseif L_124_ == 1200 or L_124_ <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
				Ms = "Lava Pirate [Lv. 1200]"
				NameQuest = "FireSideQuest"
				QuestLv = 2
				NameMon = "Lava Pirate"
				CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
				CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
			elseif L_124_ == 1250 or L_124_ <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
				Ms = "Ship Deckhand [Lv. 1250]"
				NameQuest = "ShipQuest1"
				QuestLv = 1
				NameMon = "Ship Deckhand"
				CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
				CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_124_ == 1275 or L_124_ <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
				Ms = "Ship Engineer [Lv. 1275]"
				NameQuest = "ShipQuest1"
				QuestLv = 2
				NameMon = "Ship Engineer"
				CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
				CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_124_ == 1300 or L_124_ <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
				Ms = "Ship Steward [Lv. 1300]"
				NameQuest = "ShipQuest2"
				QuestLv = 1
				NameMon = "Ship Steward"
				CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
				CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_124_ == 1325 or L_124_ <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
				Ms = "Ship Officer [Lv. 1325]"
				NameQuest = "ShipQuest2"
				QuestLv = 2
				NameMon = "Ship Officer"
				CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
				CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_124_ == 1350 or L_124_ <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
				Ms = "Arctic Warrior [Lv. 1350]"
				NameQuest = "FrostQuest"
				QuestLv = 1
				NameMon = "Arctic Warrior"
				CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
				CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
				if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
				end
			elseif L_124_ == 1375 or L_124_ <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
				Ms = "Snow Lurker [Lv. 1375]"
				NameQuest = "FrostQuest"
				QuestLv = 2
				NameMon = "Snow Lurker"
				CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
				CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
			elseif L_124_ == 1425 or L_124_ <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
				Ms = "Sea Soldier [Lv. 1425]"
				NameQuest = "ForgottenQuest"
				QuestLv = 1
				NameMon = "Sea Soldier"
				CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
				CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
			elseif L_124_ >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
				Ms = "Water Fighter [Lv. 1450]"
				NameQuest = "ForgottenQuest"
				QuestLv = 2
				NameMon = "Water Fighter"
				CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
				CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
			end
		end
		if Three_World then
			if L_124_ == 1500 or L_124_ <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
				Ms = "Pirate Millionaire [Lv. 1500]"
				NameQuest = "PiratePortQuest"
				QuestLv = 1
				NameMon = "Pirate Millionaire"
				CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
				CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
			elseif L_124_ == 1525 or L_124_ <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
				Ms = "Pistol Billionaire [Lv. 1525]"
				NameQuest = "PiratePortQuest"
				QuestLv = 2
				NameMon = "Pistol Billionaire"
				CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
				CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
			elseif L_124_ == 1575 or L_124_ <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
				Ms = "Dragon Crew Warrior [Lv. 1575]"
				NameQuest = "AmazonQuest"
				QuestLv = 1
				NameMon = "Dragon Crew Warrior"
				CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
				CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
			elseif L_124_ == 1600 or L_124_ <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
				Ms = "Dragon Crew Archer [Lv. 1600]"
				NameQuest = "AmazonQuest"
				QuestLv = 2
				NameMon = "Dragon Crew Archer"
				CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
				CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
			elseif L_124_ == 1625 or L_124_ <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander
				Ms = "Female Islander [Lv. 1625]"
				NameQuest = "AmazonQuest2"
				QuestLv = 1
				NameMon = "Female Islander"
				CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
				CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
			elseif L_124_ == 1650 or L_124_ <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander
				Ms = "Giant Islander [Lv. 1650]"
				NameQuest = "AmazonQuest2"
				QuestLv = 2
				NameMon = "Giant Islander"
				CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
				CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
			elseif L_124_ == 1700 or L_124_ <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
				Ms = "Marine Commodore [Lv. 1700]"
				NameQuest = "MarineTreeIsland"
				QuestLv = 1
				NameMon = "Marine Commodore"
				CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
				CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
			elseif L_124_ == 1725 or L_124_ <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
				Ms = "Marine Rear Admiral [Lv. 1725]"
				NameQuest = "MarineTreeIsland"
				QuestLv = 2
				NameMon = "Marine Rear Admiral"
				CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
				CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
			elseif L_124_ == 1775 or L_124_ <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
				Ms = "Fishman Raider [Lv. 1775]"
				NameQuest = "DeepForestIsland3"
				QuestLv = 1
				NameMon = "Fishman Raider"
				CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
				CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
			elseif L_124_ == 1800 or L_124_ <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
				Ms = "Fishman Captain [Lv. 1800]"
				NameQuest = "DeepForestIsland3"
				QuestLv = 2
				NameMon = "Fishman Captain"
				CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
				CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
			elseif L_124_ == 1825 or L_124_ <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
				Ms = "Forest Pirate [Lv. 1825]"
				NameQuest = "DeepForestIsland"
				QuestLv = 1
				NameMon = "Forest Pirate"
				CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
				CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
			elseif L_124_ == 1850 or L_124_ <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
				Ms = "Mythological Pirate [Lv. 1850]"
				NameQuest = "DeepForestIsland"
				QuestLv = 2
				NameMon = "Mythological Pirate"
				CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
				CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
			elseif L_124_ == 1900 or L_124_ <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
				Ms = "Jungle Pirate [Lv. 1900]"
				NameQuest = "DeepForestIsland2"
				QuestLv = 1
				NameMon = "Jungle Pirate"
				CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
				CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
			elseif L_124_ == 1925 or L_124_ <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
				Ms = "Musketeer Pirate [Lv. 1925]"
				NameQuest = "DeepForestIsland2"
				QuestLv = 2
				NameMon = "Musketeer Pirate"
				CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
				CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
			elseif L_124_ == 1975 or L_124_ <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
				Ms = "Reborn Skeleton [Lv. 1975]"
				NameQuest = "HauntedQuest1"
				QuestLv = 1
				NameMon = "Reborn Skeleton"
				CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
				CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
			elseif L_124_ == 2000 or L_124_ <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
				Ms = "Living Zombie [Lv. 2000]"
				NameQuest = "HauntedQuest1"
				QuestLv = 2
				NameMon = "Living Zombie"
				CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
				CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
			elseif L_124_ == 2025 or L_124_ <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
				Ms = "Demonic Soul [Lv. 2025]"
				NameQuest = "HauntedQuest2"
				QuestLv = 1
				NameMon = "Demonic Soul"
				CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
				CFrameMon = CFrame.new(-9709.30762, 204.695892, 6044.04688, -0.845798075, -3.4587876e-07, -0.533503294, -4.46235369e-08, 1, -5.77571257e-07, 0.533503294, -4.64701827e-07, -0.845798075)
			elseif L_124_ == 2050 or L_124_ <= 2124 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
				Ms = "Posessed Mummy [Lv. 2050]"
				NameQuest = "HauntedQuest2"
				QuestLv = 2
				NameMon = "Posessed Mummy"
				CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
				CFrameMon = CFrame.new(-9554.11035, 65.6141663, 6041.73584, -0.877069294, 5.33355795e-08, -0.480364174, 2.06420765e-08, 1, 7.33423562e-08, 0.480364174, 5.44105987e-08, -0.877069294)
			elseif L_124_ == 2125 or L_124_ <= 2149  or SelectMonster == "Ice Cream Chef [Lv. 2125]" then
				Ms = "Ice Cream Chef [Lv. 2125]"
				NameQuest = "IceCreamIslandQuest"
				QuestLv = 1
				NameMon = "Ice Cream Chef"
				CFrameQ = CFrame.new(-821.03833, 65.8453293, -10966.5713, 0.761730552, 6.08681887e-08, -0.647893965, 1.27544619e-09, 1, 9.54473123e-08, 0.647893965, -7.35314885e-08, 0.761730552)
				CFrameMon = CFrame.new(-787.857178, 154.602448, -11129.002, -0.849269688, 7.99242095e-09, -0.527959228, 2.16687535e-09, 1, 1.1652717e-08, 0.527959228, 8.75227801e-09, -0.849269688)
			elseif L_124_ == 2149 or L_124_ <= 2200  or SelectMonster == "Ice Cream Commander [Lv. 2150]" then
				Ms = "Ice Cream Commander [Lv. 2150]"
				NameQuest = "IceCreamIslandQuest"
				QuestLv = 2
				NameMon = "Ice Cream Commander"
				CFrameQ = CFrame.new(-821.03833, 65.8453293, -10966.5713, 0.761730552, 6.08681887e-08, -0.647893965, 1.27544619e-09, 1, 9.54473123e-08, 0.647893965, -7.35314885e-08, 0.761730552)
				CFrameMon = CFrame.new(-787.857178, 154.602448, -11129.002, -0.849269688, 7.99242095e-09, -0.527959228, 2.16687535e-09, 1, 1.1652717e-08, 0.527959228, 8.75227801e-09, -0.849269688)
			end
		end
	end
	function TP(L_125_arg0)
		Distance = (L_125_arg0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if Distance < 250 then
			Speed = 600
		elseif Distance < 500 then
			Speed = 400
		elseif Distance < 1000 then
			Speed = 350
		elseif Distance >= 1000 then
			Speed = 200
		end
		game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
            {
			CFrame = L_125_arg0
		}
        ):Play()
	end
	function EquipWeapon(L_126_arg0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild(L_126_arg0) then
			local L_127_ = game.Players.LocalPlayer.Backpack:FindFirstChild(L_126_arg0)
			wait(.4)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(L_127_)
		end
	end
	Type = 1
	spawn(function()
		while wait(.1) do
			if Type == 1 then
				Farm_Mode = CFrame.new(0, 18, 10)
			elseif Type == 2 then
				Farm_Mode = CFrame.new(0, 18, 10)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			Type = 1
			wait(5)
			Type = 2
			wait(5)
		end
	end)
	pcall(function()
		for L_128_forvar0, L_129_forvar1 in pairs(game:GetService("Workspace").Map.Dressrosa.Tavern:GetDescendants()) do
			if L_129_forvar1.ClassName == "Seat" then
				L_129_forvar1:Destroy()
			end
		end
	end)
	spawn(function()
		while wait() do
			if Auto_Farm then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					MagnetActive = false
					CheckLevel()
					TP(CFrameQ)
					if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
						wait(1.1)
						CheckLevel()
						if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
						else
							TP(CFrameQ)
						end
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					pcall(function()
						CheckLevel()
						if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
							for L_130_forvar0, L_131_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_131_forvar1.Name == Ms and L_131_forvar1:FindFirstChild("Humanoid") then
									if L_131_forvar1.Humanoid.Health > 0 then
										repeat
											game:GetService("RunService").Heartbeat:wait()
											if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
												if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
													EquipWeapon(SelectToolWeapon)
													TP(L_131_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
													L_131_forvar1.HumanoidRootPart.CanCollide = false
													L_131_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
													game:GetService("VirtualUser"):CaptureController()
													game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670), workspace.CurrentCamera.CFrame)
													PosMon = L_131_forvar1.HumanoidRootPart.CFrame
													MagnetActive = true
												else
													MagnetActive = false
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
												end
											else
												MagnetActive = false
												CheckLevel()
												TP(CFrameMon)
											end
										until not L_131_forvar1.Parent or L_131_forvar1.Humanoid.Health <= 0 or Auto_Farm == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(L_131_forvar1.Name)
									end
								end
							end
						else
							MagnetActive = false
							CheckLevel()
							TP(CFrameMon)
						end
					end)
				end
			end
		end
	end)
	function Click()
		game:GetService'VirtualUser':CaptureController()
		game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
	end
	if SelectToolWeapon then
	else
		SelectToolWeapon = ""
	end
	spawn(function()
		game:GetService("RunService").Heartbeat:Connect(function()
			if SafeMode or PlayerHunt or KillPlayer or AutoRainbow or AutoCitizen or AutoFarmBoss or FarmAllBoss or Elite or AutoThird or AutoBartilo or AutoRengoku or Auto_Bone or AutoEcto or AutoFarmObservation or Auto_Farm or FarmMasteryGun or FarmMasteryFruit or _G.Auto_indra_Hop or _G.Auto_Dark_Dagger_Hop or _G.AutoDonSwan_Hop or _G.Pole_Hop or Core or noclip or AutoEvoRace or TPChest or NextIsland or RaidSuperhuman or _G.AutoRaid or AutoFarmBoss or SelectFarm or Clip or HolyTorch or AutoFarmSelectMonster or AutoLowRaid then
				if not game:GetService("Workspace"):FindFirstChild("LOL") then
					local L_132_ = Instance.new("Part")
					L_132_.Name = "LOL"
					L_132_.Parent = game.Workspace
					L_132_.Anchored = true
					L_132_.Transparency = 1
					L_132_.Size = Vector3.new(30, -0.5, 30)
				elseif game:GetService("Workspace"):FindFirstChild("LOL") then
					game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
				end
			else
				if game:GetService("Workspace"):FindFirstChild("LOL") then
					game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
				end
			end
		end)
	end)
	spawn(function()
		game:GetService("RunService").Stepped:Connect(function()
			if SafeMode or PlayerHunt or KillPlayer or AutoRainbow or AutoCitizen or AutoFarmBoss or FarmAllBoss or Elite or AutoThird or AutoBartilo or AutoRengoku or Auto_Bone or AutoEcto or AutoFarmObservation or Auto_Farm or FarmMasteryGun or FarmMasteryFruit or _G.Auto_indra_Hop or _G.Auto_Dark_Dagger_Hop or _G.AutoDonSwan_Hop or _G.Pole_Hop or Core or noclip or AutoEvoRace or TPChest or NextIsland or RaidSuperhuman or _G.AutoRaid or AutoFarmBoss or SelectFarm or Clip or HolyTorch or AutoFarmSelectMonster or AutoLowRaid then
				for L_133_forvar0, L_134_forvar1 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if L_134_forvar1:IsA("BasePart") then
						L_134_forvar1.CanCollide = false
					end
				end
			end
		end)
	end)
	if SelectWeaponBoss then
	else
		SelectWeaponBoss = ""
	end
	WeaponMastery = ""
	function AutoHaki()
		if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
			local L_135_ = {
				[1] = "Buso"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_135_))
		end
	end
	spawn(function()
		while wait() do
			if AutoYama then
				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
					repeat
						wait(.1)
						fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
					until game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") or not AutoYama
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if LevelLockClose then
				if game:GetService("Players").LocalPlayer.Data.Level >= LevelLock then
					game:Shutdown()
				elseif game:GetService("Players").LocalPlayer.Data.Level >= LevelLockKick then
					game.Players.LocalPlayer:kick("You Level :" .. LevelLock)
				end
			end
		end
	end)
	Core = false
	spawn(function()
		while wait() do
			if Factory then
				if game.Workspace.Enemies:FindFirstChild("Core") then
					Core = true
					Auto_Farm = false
					for L_136_forvar0, L_137_forvar1 in pairs(game.Workspace.Enemies:GetChildren()) do
						if Core and L_137_forvar1.Name == "Core" and L_137_forvar1.Humanoid.Health > 0 then
							repeat
								game:GetService("RunService").Heartbeat:wait()
								TP(CFrame.new(402.404296875, 182.53373718262, -414.73394775391))
								EquipWeapon(SelectToolWeapon)
								require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
								game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
							until not Core or L_137_forvar1.Humanoid.Health <= 0  or Factory == false
						end
					end
				elseif game.ReplicatedStorage:FindFirstChild("Core") then
					Core = true
					Auto_Farm = false
					TP(CFrame.new(402.404296875, 182.53373718262, -414.73394775391))
				elseif _G.AutoFarm and SelectToolWeapon ~= "" then
					Auto_Farm = true
					Core = false
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if Auto_Newworld then
				local L_138_ = game.Players.LocalPlayer.Data.Level.Value
				if L_138_ >= 700 and Old_World then
					Auto_Farm = false
					if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
						TP2(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563))
						wait(.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
						EquipWeapon("Key")
						TP2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
						wait(3)
					elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
						if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
							for L_139_forvar0, L_140_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_140_forvar1.Name == "Ice Admiral [Lv. 700] [Boss]" and L_140_forvar1.Humanoid.Health > 0 then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										pcall(function()
											EquipWeapon(SelectToolWeapon)
											TP(L_140_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 25, 25))
											L_140_forvar1.HumanoidRootPart.CanCollide = false
											L_140_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											L_140_forvar1.HumanoidRootPart.Transparency = .8
											game:GetService("VirtualUser"):CaptureController()
											game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 870), workspace.CurrentCamera.CFrame)
										end)
									until L_140_forvar1.Humanoid.Health <= 0 or not L_140_forvar1.Parent
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
								end
							end
						else
							TP2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
						end
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
					end
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if AutoBartilo then
				if game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
					if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
							for L_141_forvar0, L_142_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_142_forvar1.Name == "Swan Pirate [Lv. 775]" then
									pcall(function()
										repeat
											wait(.1)
											EquipWeapon(MiscFarmWeapon)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											TP(L_142_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
											require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
											PosMonBartilo = L_142_forvar1.HumanoidRootPart.CFrame
											MagnetBatilo = true
										until not L_142_forvar1.Parent or L_142_forvar1.Humanoid.Health <= 0 or AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
										MagnetBatilo = false
									end)
								end
							end
						else
							MagnetBatilo = false
							TP(CFrame.new(1057.92761, 137.614319, 1242.08069))
						end
					else
						TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
						if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
						end
					end
				elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
					if QuestBartilo == nil then
						TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
					end
					if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
						QuestBartilo = 1
					end
					if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
						for L_143_forvar0, L_144_forvar1 in pairs(game.Workspace.Enemies:GetChildren()) do
							if L_144_forvar1.Name == "Jeremy [Lv. 850] [Boss]" then
								repeat
									wait(.1)
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
									EquipWeapon(MiscFarmWeapon)
									TP(L_144_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 15, 6))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until not L_144_forvar1.Parent or L_144_forvar1.Humanoid.Health <= 0 or AutoBartilo == false
							end
						end
					else
						if QuestBartilo == 1 then
							TP(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))
						end
					end
				elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
					TP2(game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.CFrame)
					wait(1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.CFrame
					wait(1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.CFrame
					wait(1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.CFrame
					wait(1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.CFrame
					wait(1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.CFrame
					wait(1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.CFrame
					wait(1)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.CFrame
					wait(1)
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoRengoku then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
						EquipWeapon("Hidden Key")
						TP2(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
					elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
						for L_145_forvar0, L_146_forvar1 in pairs(game.Workspace.Enemies:GetChildren()) do
							if (L_146_forvar1.Name == "Snow Lurker [Lv. 1375]" or L_146_forvar1.Name == "Arctic Warrior [Lv. 1350]") and L_146_forvar1.Humanoid.Health > 0 then
								repeat
									game:GetService("RunService").Heartbeat:wait()
									EquipWeapon(MiscFarmWeapon)
									PosMonRengoku = L_146_forvar1.HumanoidRootPart.CFrame
									require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
									TP(L_146_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									RengokuMagnet = true
								until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or AutoRengoku == false or not L_146_forvar1.Parent or L_146_forvar1.Humanoid.Health <= 0
								RengokuMagnet = false
							end
						end
					else
						RengokuMagnet = false
						TP(CFrame.new(5525.7045898438, 262.90060424805, -6755.1186523438))
					end
				end
			end
		end)
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoEcto then
					if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
						for L_147_forvar0, L_148_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if string.find(L_148_forvar1.Name, "Ship") then
								repeat
									game:GetService("RunService").Heartbeat:wait()
									EquipWeapon(MiscFarmWeapon)
									if string.find(L_148_forvar1.Name, "Ship") then
										TP(L_148_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 15, 15))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										PosMonEctoplas = L_148_forvar1.HumanoidRootPart.CFrame
										EctoplasMagnet = true
									else
										EctoplasMagnet = false
										TP(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
									end
								until AutoEcto == false or not L_148_forvar1.Parent or L_148_forvar1.Humanoid.Health <= 0
							end
						end
					else
						EctoplasMagnet = false
						local L_149_ = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
						if L_149_ > 20000 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
						end
						TP(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			pcall(function()
				if Auto_Bone then
					if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
						for L_150_forvar0, L_151_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if L_151_forvar1.Name == "Reborn Skeleton [Lv. 1975]" or L_151_forvar1.Name == "Living Zombie [Lv. 2000]" or L_151_forvar1.Name == "Demonic Soul [Lv. 2025]" or L_151_forvar1.Name == "Posessed Mummy [Lv. 2050]" then
								if L_151_forvar1:WaitForChild("Humanoid").Health > 0 then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(EventWeapon)
										TP(L_151_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
										L_151_forvar1.HumanoidRootPart.CanCollide = false
										L_151_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670), workspace.CurrentCamera.CFrame)
										MainMonBone = L_151_forvar1.HumanoidRootPart.CFrame
										BoneMagnet = true
									until Auto_Bone == false or not L_151_forvar1.Parent or L_151_forvar1.Humanoid.Health <= 0
								end
							end
						end
					else
						BoneMagnet = false
						TP(CFrame.new(-9501.64453, 582.052612, 6034.20117))
					end
				end
			end)
		end
	end)
	spawn(function()
		pcall(function()
			while wait() do
				if AutoThird then
					if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and New_World then
						Auto_Farm = false
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
							TP2(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
							if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
							end
							wait(2)
							if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
								for L_152_forvar0, L_153_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if L_153_forvar1.Name == "rip_indra [Lv. 1500] [Boss]" then
										repeat
											game:GetService("RunService").Heartbeat:wait()
											pcall(function()
												EquipWeapon(SelectToolWeapon)
												TP(L_153_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 25, 25))
												require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												FoundIndra = true
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end)
										until AutoThird == false or L_153_forvar1.Humanoid.Health <= 0 or not L_153_forvar1.Parent
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
								TP(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
							end
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if AutoEvoRace then
				if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
						TP(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
						if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
						end
					elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
						pcall(function()
							if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
								TP(game.Workspace.Flower1.CFrame)
							elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
								TP(game.Workspace.Flower2.CFrame)
							elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Zombie [Lv. 950]") then
									for L_154_forvar0, L_155_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if L_155_forvar1.Name == "Zombie [Lv. 950]" then
											repeat
												game:GetService("RunService").Heartbeat:wait()
												EquipWeapon(MiscFarmWeapon)
												TP(L_155_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
												L_155_forvar1.HumanoidRootPart.CanCollide = false
												L_155_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
												PosMonZombie = L_155_forvar1.HumanoidRootPart.CFrame
												EvoMagnet = true
											until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not L_155_forvar1.Parent or L_155_forvar1.Humanoid.Health <= 0 or AutoEvoRace == false
											EvoMagnet = false
										end
									end
								else
									EvoMagnet = false
									TP(CFrame.new(-5854.39014, 145.093857, -686.942017, 0.379233211, -1.41975844e-08, -0.925301135, -3.77265719e-10, 1, -1.5498367e-08, 0.925301135, 6.2265797e-09, 0.379233211))
								end
							end
						end)
					elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
					end
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoFarmSelectMonster then
					if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
						CheckLevel()
						if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
						else
							TP(CFrameQ)
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
						CheckLevel()
						pcall(function()
							if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
								for L_156_forvar0, L_157_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if L_157_forvar1.Name == Ms and L_157_forvar1:FindFirstChild("Humanoid") then
										if L_157_forvar1.Humanoid.Health > 0 then
											repeat
												game:GetService("RunService").Heartbeat:wait()
												if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
													EquipWeapon(MiscFarmWeapon)
													TP(L_157_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
													L_157_forvar1.HumanoidRootPart.CanCollide = false
													L_157_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
													game:GetService("VirtualUser"):CaptureController()
													game:GetService("VirtualUser"):CaptureController()
													game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
													PosMonSelectMonster = L_157_forvar1.HumanoidRootPart.CFrame
													AutoFarmSelectMonsterMagnet = true
												else
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
												end
											until not AutoFarmSelectMonster or not L_157_forvar1.Parent or L_157_forvar1.Humanoid.Health <= 0 or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
										end
									end
								end
							else
								CheckLevel()
								AutoFarmSelectMonster = false
								TP(CFrameMon)
							end
						end)
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if _G.Auto_Dark_Dagger_Hop then
				if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Dagger") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Dagger") then
					game:Shutdown()
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if _G.Auto_indra_Hop or _G.Auto_Dark_Dagger_Hop then
				if game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
					TP(CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625))
					for L_158_forvar0, L_159_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
							if L_159_forvar1.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
								if L_159_forvar1.Humanoid.Health > 0 then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = L_159_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 16, 7)
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until L_159_forvar1.Humanoid.Health <= 0 or not L_159_forvar1.Parent
								end
							end
						else
							TP(CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625))
						end
					end
				end
				if (_G.Auto_Dark_Dagger_Hop or _G.Auto_indra_Hop) and Three_World and not game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false then
						Teleport()
                        --SafeMode = true
						TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10000, 0))
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == true then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							local L_160_ = math.random(1, 1000)
							local L_161_ = math.random(1, 1000)
							local L_162_ = game.Players.LocalPlayer.Character
							TP(CFrame.new(L_160_, L_162_.HumanoidRootPart.CFrame.Y, L_161_))
						until game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false
						Teleport()
					end
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if _G.AutoDonSwan_Hop then
				if game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
					TP(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
					for L_163_forvar0, L_164_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
							if L_164_forvar1.Name == "Don Swan [Lv. 1000] [Boss]" then
								if L_164_forvar1.Humanoid.Health > 0 then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = L_164_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 16, 7)
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until L_164_forvar1.Humanoid.Health <= 0 or not L_164_forvar1.Parent
								end
							end
						else
							TP(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
						end
					end
				end
				if _G.AutoDonSwan_Hop and New_World and not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") and game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false then
						Teleport()
                        --SafeMode = true
						TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10000, 0))
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == true then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							local L_165_ = math.random(1, 1000)
							local L_166_ = math.random(1, 1000)
							local L_167_ = game.Players.LocalPlayer.Character
							TP(CFrame.new(L_165_, L_167_.HumanoidRootPart.CFrame.Y, L_166_))
						until game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false
						Teleport()
					end
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if _G.Pole_Hop then
				if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
					TP(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
					for L_168_forvar0, L_169_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
							if L_169_forvar1.Name == "Thunder God [Lv. 575] [Boss]" then
								if L_169_forvar1.Humanoid.Health > 0 then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = L_169_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 16, 7)
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until L_169_forvar1.Humanoid.Health <= 0 or not L_169_forvar1.Parent
								end
							end
						else
							TP(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
						end
					end
				end
				if _G.Pole_Hop and Old_World and not game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false then
						Teleport()
                        --SafeMode = true
						TP(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10000, 0))
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == true then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							local L_170_ = math.random(1, 1000)
							local L_171_ = math.random(1, 1000)
							local L_172_ = game.Players.LocalPlayer.Character
							TP(CFrame.new(L_170_, L_172_.HumanoidRootPart.CFrame.Y, L_171_))
						until game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false
						Teleport()
					end
				end
			end
		end
	end)
    
    --if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") then
	spawn(function()
		pcall(function()
			while wait() do
				if EliteHunter then
					local L_173_ = string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")
					local L_174_ = game:GetService("ReplicatedStorage");
					local L_175_ = game:GetService("Workspace").Enemies
					if L_174_:FindFirstChild("Diablo [Lv. 1750]") or L_175_:FindFirstChild("Diablo [Lv. 1750]") or L_174_:FindFirstChild("Urban [Lv. 1750]") or L_175_:FindFirstChild("Urban [Lv. 1750]") or L_174_:FindFirstChild("Deandre [Lv. 1750]") or L_175_:FindFirstChild("Deadre [Lv. 1750]") then
						Elite = true
						Auto_Farm = false
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							TP(CFrame.new(-5418.392578125, 313.74130249023, -2824.9157714844))
							if (Vector3.new(-5418.392578125, 313.74130249023, -2824.9157714844) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
							if game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestReward.Title.Text == "Reward:\n$15,000\n60,000,000 Exp." then
								for L_176_forvar0, L_177_forvar1 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
									if Elite and L_177_forvar1.Name == "Diablo [Lv. 1750]" or L_177_forvar1.Name == "Urban [Lv. 1750]" or L_177_forvar1.Name == "Deandre [Lv. 1750]" then
										repeat
											game:GetService("RunService").Heartbeat:wait()
											if L_173_ then
												EquipWeapon(SelectToolWeapon)
												TP(L_177_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 10, 4))
												require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											else
												TP(CFrame.new(-5418.392578125, 313.74130249023, -2824.9157714844))
												if (Vector3.new(-5418.392578125, 313.74130249023, -2824.9157714844) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
													wait(1.5)
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
												end
											end
										until not Elite or L_177_forvar1.Humanoid.Health <= 0 or not L_177_forvar1.Parent or not EliteHunter or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
									end
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonHunter")
							end
						end
					else
						Elite = false
					end
					if _G.AutoFarm and Elite == false then
						Auto_Farm = true
					end
					if _G.Auto_Elite_Hop and Three_World and Elite == false then
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false then
							Teleport()
                            --SafeMode = true
							TP(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10000, 0))
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == true then
							repeat
								game:GetService("RunService").Heartbeat:wait()
								local L_178_ = math.random(1, 1000)
								local L_179_ = math.random(1, 1000)
								local L_180_ = game.Players.LocalPlayer.Character
								TP(CFrame.new(L_178_, L_180_.HumanoidRootPart.CFrame.Y, L_179_))
							until game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false
							Teleport()
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if AutoCitizen then
				if game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
					if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
							for L_181_forvar0, L_182_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_182_forvar1.Name == "Forest Pirate [Lv. 1825]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										pcall(function()
											EquipWeapon(MiscFarmWeapon)
											TP(L_182_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
											L_182_forvar1.HumanoidRootPart.CanCollide = false
											L_182_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											PosMonCitizen = L_182_forvar1.HumanoidRootPart.CFrame
											CitizenMagnet = true
										end)
									until AutoCitizen == false or not L_182_forvar1.Parent or L_182_forvar1.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
									CitizenMagnet = false
								end
							end
						else
							CitizenMagnet = false
							TP(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
						end
					else
						TP(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
						if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
							wait(1.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
						end
					end
				elseif game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
					if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
							for L_183_forvar0, L_184_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_184_forvar1.Name == "Captain Elephant [Lv. 1875] [Boss]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										pcall(function()
											EquipWeapon(MiscFarmWeapon)
											TP(L_184_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
											L_184_forvar1.HumanoidRootPart.CanCollide = false
											L_184_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											game:GetService("VirtualUser"):CaptureController()
											game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
										end)
									until AutoCitizen == false or L_184_forvar1.Humanoid.Health <= 0 or not L_184_forvar1.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
								end
							end
						else
							TP(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
						end
					else
						TP(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
						if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
							wait(1.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
						end
					end
				elseif game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
					TP(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if AutoObservationv2 then
				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start") == 0 then
					local L_185_ = {
						[1] = "KenTalk2",
						[2] = "Buy"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_185_))
				else
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") then
						local L_186_ = {
							[1] = "KenTalk2",
							[2] = "Start"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_186_))
					else
						for L_187_forvar0, L_188_forvar1 in pairs(game:GetService("Workspace").AppleSpawner:GetChildren()) do
							if L_188_forvar1.Name == "Apple" then
								L_188_forvar1.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
							end
						end
						for L_189_forvar0, L_190_forvar1 in pairs(game:GetService("Workspace").BananaSpawner:GetChildren()) do
							if L_190_forvar1.Name == "Banana" then
								L_190_forvar1.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
							end
						end
						for L_191_forvar0, L_192_forvar1 in pairs(game:GetService("Workspace").PineappleSpawner:GetChildren()) do
							if L_192_forvar1.Name == "Pineapple" then
								L_192_forvar1.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
							end
						end
						if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Apple") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple")) and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pineapple") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple")) and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Banana") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana")) then
							local L_193_ = {
								[1] = "CitizenQuestProgress",
								[2] = "Citizen"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_193_))
						end
					end
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoRainbow then
					if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						TP(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
						if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
							wait(1.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
						end
					elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
							for L_194_forvar0, L_195_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_195_forvar1.Name == "Stone [Lv. 1550] [Boss]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										TP(L_195_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 10))
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
									until AutoRainbow == false or L_195_forvar1.Humanoid.Health <= 0 or not L_195_forvar1.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
								end
							end
						else
							TP(CFrame.new(-871.478455, 92.3782501, 6637.01514, -0.648528099, -2.65940674e-08, 0.761190772, -2.16472333e-08, 1, 1.64941927e-08, -0.761190772, -5.78073056e-09, -0.648528099))
						end
					elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
							for L_196_forvar0, L_197_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_197_forvar1.Name == "Island Empress [Lv. 1675] [Boss]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										TP(L_197_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 10))
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
									until AutoRainbow == false or L_197_forvar1.Humanoid.Health <= 0 or not L_197_forvar1.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
								end
							end
						else
							TP(CFrame.new(5541.21338, 668.239258, 198.150391, -0.00426674541, 5.33843725e-09, -0.99999088, 3.50221967e-08, 1, 5.18905363e-09, 0.99999088, -3.49997364e-08, -0.00426674541))
						end
					elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
							for L_198_forvar0, L_199_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_199_forvar1.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										TP(L_199_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 10))
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
									until AutoRainbow == false or L_199_forvar1.Humanoid.Health <= 0 or not L_199_forvar1.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
								end
							end
						else
							TP(CFrame.new(2832.35449, 432.43573, -7122.49121, 0.734633088, -8.93899994e-08, -0.678464592, 6.01928107e-09, 1, -1.25235772e-07, 0.678464592, 8.79184725e-08, 0.734633088))
						end
					elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
							for L_200_forvar0, L_201_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_201_forvar1.Name == "Captain Elephant [Lv. 1875] [Boss]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										TP(L_201_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 10))
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
									until AutoRainbow == false or L_201_forvar1.Humanoid.Health <= 0 or not L_201_forvar1.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
								end
							end
						else
							TP(CFrame.new(-13315.5381, 433.261169, -8078.44971, 0.998839259, 7.84328549e-08, -0.0481674224, -8.16301977e-08, 1, -6.44126743e-08, 0.0481674224, 6.82698271e-08, 0.998839259))
						end
					elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
							for L_202_forvar0, L_203_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_203_forvar1.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeapon)
										TP(L_203_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 10))
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
									until AutoRainbow == false or L_203_forvar1.Humanoid.Health <= 0 or not L_203_forvar1.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
								end
							end
						else
							TP(CFrame.new(5314.58203, 22.536438, -125.942276, 1, 6.26807051e-09, 6.631647e-16, -6.26807051e-09, 1, 9.95202925e-08, -3.93644864e-17, -9.95202925e-08, 1))
						end
					else
						TP(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
						if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
							wait(1.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if FarmMasteryFruit then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					MasteryBFMagnetActive = false
					CheckLevel()
					TP(CFrameQ)
					if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					CheckLevel()
					if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
						pcall(function()
							for L_204_forvar0, L_205_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_205_forvar1.Name == Ms then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
											HealthMin = L_205_forvar1.Humanoid.MaxHealth * HealthPersen / 100
											if L_205_forvar1.Humanoid.Health <= HealthMin then
												EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
												L_205_forvar1.Head.CanCollide = false
												L_205_forvar1.HumanoidRootPart.CanCollide = false
												L_205_forvar1.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
												TP(L_205_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
												USEBF = true
											else
												USEBF = false
												EquipWeapon(WeaponMastery)
												TP(L_205_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670), workspace.CurrentCamera.CFrame)
												L_205_forvar1.Head.CanCollide = false
												L_205_forvar1.HumanoidRootPart.CanCollide = false
												L_205_forvar1.HumanoidRootPart.Size = Vector3.new(40, 40, 40)
											end
											MasteryBFMagnetActive = true
											PosMonMasteryFruit = L_205_forvar1.HumanoidRootPart.CFrame
										else
											MasteryBFMagnetActive = false
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
										end
									until L_205_forvar1.Humanoid.Health <= 0 or FarmMasteryFruit == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
									USEBF = false
								end
							end
						end)
					else
						MasteryBFMagnetActive = false
						TP(CFrameMon)
					end
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if FarmMasteryGun then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					MasteryGunMagnetActive = false
					CheckLevel()
					TP(CFrameQ)
					if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					CheckLevel()
					if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
						pcall(function()
							for L_206_forvar0, L_207_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_207_forvar1.Name == Ms then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
											HealthMin = L_207_forvar1.Humanoid.MaxHealth * HealthPersen / 100
											if L_207_forvar1.Humanoid.Health <= HealthMin then
												EquipWeapon(SelectToolWeaponGun)
												TP(L_207_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
												local L_208_ = {
													[1] = L_207_forvar1.HumanoidRootPart.Position,
													[2] = L_207_forvar1.HumanoidRootPart
												}
												game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(L_208_))
											else
												EquipWeapon(WeaponMastery)
												require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
												TP(L_207_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											end
											MasteryGunMagnetActive = true
											PosMonMasteryGun = L_207_forvar1.HumanoidRootPart.CFrame
										else
											MasteryGunMagnetActive = false
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
										end
									until L_207_forvar1.Humanoid.Health <= 0 or FarmMasteryGun == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
									MasteryGunMagnetActive = false
								end
							end
						end)
					else
						TP(CFrameMon)
					end
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait() do
				if AutoBuyChiplawraid then
					if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
					end
				end
			end
		end)
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoLowRaid then
					if not game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
							fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
						end
					end
					if game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
							for L_209_forvar0, L_210_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_210_forvar1.Name == "Order [Lv. 1250] [Raid Boss]" then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectToolWeaponLaw)
										TP(L_210_forvar1.HumanoidRootPart.CFrame * CFrame.new(0, 50, 25))
										L_210_forvar1.HumanoidRootPart.CanCollide = false
										L_210_forvar1.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										RawFastAttack = true
									until not L_210_forvar1.Parent or L_210_forvar1.Humanoid.Health <= 0 or AutoLowRaid == false
									RawFastAttack = false
								end
							end
						elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
							RawFastAttack = false
							TP(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait() do
			if LegebdarySword then
				local L_211_ = {
					[1] = "LegendarySwordDealer",
					[2] = "1"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_211_))
				local L_212_ = {
					[1] = "LegendarySwordDealer",
					[2] = "2"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_212_))
				local L_213_ = {
					[1] = "LegendarySwordDealer",
					[2] = "3"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_213_))
				if _G.AutoLegendary_Hop and New_World then
					wait(10)
					Teleport()
				end
			end
		end
	end)
	spawn(function()
		while wait() do
			if Enchancement then
				local L_214_ = {
					[1] = "ColorsDealer",
					[2] = "2"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_214_))
				if _G.AutoEnchancement_Hop and not Old_World then
					wait(10)
					Teleport()
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoAccessories or _G.AutoAccessory then
					CheckAccessory = game:GetService("Players").LocalPlayer.Character
					if CheckAccessory:FindFirstChild("BlackCape") or CheckAccessory:FindFirstChild("SwordsmanHat") or CheckAccessory:FindFirstChild("PinkCoat") or CheckAccessory:FindFirstChild("TomoeRing") or CheckAccessory:FindFirstChild("MarineCape") or CheckAccessory:FindFirstChild("PirateCape") or CheckAccessory:FindFirstChild("CoolShades") or CheckAccessory:FindFirstChild("UsoapHat") or CheckAccessory:FindFirstChild("MarineCap") or CheckAccessory:FindFirstChild("BlackSpikeyCoat") or CheckAccessory:FindFirstChild("Choppa") or CheckAccessory:FindFirstChild("SaboTopHat") or CheckAccessory:FindFirstChild("WarriorHelmet") or CheckAccessory:FindFirstChild("DarkCoat") or CheckAccessory:FindFirstChild("SwanGlasses") or CheckAccessory:FindFirstChild("ZebraCap") or CheckAccessory:FindFirstChild("GhoulMask") or CheckAccessory:FindFirstChild("BlueSpikeyCoat") or CheckAccessory:FindFirstChild("RedSpikeyCoat") or CheckAccessory:FindFirstChild("SantaHat") or CheckAccessory:FindFirstChild("ElfHat") or CheckAccessory:FindFirstChild("ValkyrieHelm") or CheckAccessory:FindFirstChild("Bandanna(Black)") or CheckAccessory:FindFirstChild("Bandanna(Green)") or CheckAccessory:FindFirstChild("Bandanna(Red)") or CheckAccessory:FindFirstChild("Huntercape(Black)") or CheckAccessory:FindFirstChild("Huntercape(Green)") or CheckAccessory:FindFirstChild("Huntercape(Red)") or CheckAccessory:FindFirstChild("PrettyHelmet") or CheckAccessory:FindFirstChild("JawShield") or CheckAccessory:FindFirstChild("MusketeerHat") or CheckAccessory:FindFirstChild("Pilothelmet") then
					else
						EquipWeapon(SelectTooAccessories)
						wait(1)
						game:GetService("Players").LocalPlayer.Character[SelectTooAccessories].RemoteFunction:InvokeServer()
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			for L_215_forvar0, L_216_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if L_216_forvar1:IsA("Tool") then
					if L_216_forvar1.ToolTip == "Wear" then
						SelectTooAccessories = L_216_forvar1.Name
					end
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if Superhuman or AutoFullySuperhuman then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
						local L_217_ = {
							[1] = "BuyBlackLeg"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_217_))
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
							SelectToolWeapon = "Combat"
							SelectToolWeaponOld = "Combat"
						end
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") then
							SelectToolWeapon = "Black Leg"
							SelectToolWeaponOld = "Black Leg"
						end
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
							SelectToolWeapon = "Electro"
							SelectToolWeaponOld = "Electro"
						end
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") then
							SelectToolWeapon = "Fishman Karate"
							SelectToolWeaponOld = "Fishman Karate"
						end
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") then
							SelectToolWeapon = "Dragon Claw"
							SelectToolWeaponOld = "Dragon Claw"
						end
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Superhuman") then
							SelectToolWeapon = "Superhuman"
							SelectToolWeaponOld = "Superhuman"
						end
						if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300) then
							local L_218_ = {
								[1] = "BuyElectro"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_218_))
						end
						if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300) then
							local L_219_ = {
								[1] = "BuyFishmanKarate"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_219_))
						end
						if (game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300) then
							if AutoFullySuperhuman then
								if game.Players.LocalPlayer.Data.Level.Value >= 1100 then
									if game.Players.LocalPlayer.Data.Fragments.Value <= 1499 then
										RaidSuperhuman = true
										_G.SelectRaid = "Flame"
										Auto_Farm = false
									elseif game.Players.LocalPlayer.Data.Fragments.Value >= 1500 then
										RaidSuperhuman = false
										if _G.AutoFarm and RaidSuperhuman == false then
											Auto_Farm = true
										end
										local L_220_ = {
											[1] = "BlackbeardReward",
											[2] = "DragonClaw",
											[3] = "1"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_220_))
										local L_221_ = {
											[1] = "BlackbeardReward",
											[2] = "DragonClaw",
											[3] = "2"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_221_))
									end
								end
							elseif not AutoFullySuperhuman then
								local L_222_ = {
									[1] = "BlackbeardReward",
									[2] = "DragonClaw",
									[3] = "1"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_222_))
								local L_223_ = {
									[1] = "BlackbeardReward",
									[2] = "DragonClaw",
									[3] = "2"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_223_))
							end
						end
						if (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300) then
							local L_224_ = {
								[1] = "BuySuperhuman"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_224_))
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if DeathStep then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
					local L_225_ = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_225_))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
					local L_226_ = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_226_))
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
					SelectToolWeapon = "Black Leg"
				end
			end
		end
	end)
	function CheckBossQuest()
		if Old_World then
			if SelectBoss == "The Gorilla King [Lv. 25] [Boss]" then
				BossMon = "The Gorilla King [Lv. 25] [Boss]"
				NameQuestBoss = "JungleQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$2,000\n7,000 Exp."
				CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
				CFrameBoss = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
			elseif SelectBoss == "Bobby [Lv. 55] [Boss]" then
				BossMon = "Bobby [Lv. 55] [Boss]"
				NameQuestBoss = "BuggyQuest1"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$8,000\n35,000 Exp."
				CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
				CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
			elseif SelectBoss == "The Saw [Lv. 100] [Boss]" then
				BossMon = "The Saw [Lv. 100] [Boss]"
				CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
			elseif SelectBoss == "Yeti [Lv. 110] [Boss]" then
				BossMon = "Yeti [Lv. 110] [Boss]"
				NameQuestBoss = "SnowQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$10,000\n180,000 Exp."
				CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
				CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
			elseif SelectBoss == "Mob Leader [Lv. 120] [Boss]" then
				BossMon = "Mob Leader [Lv. 120] [Boss]"
				CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
			elseif SelectBoss == "Vice Admiral [Lv. 130] [Boss]" then
				BossMon = "Vice Admiral [Lv. 130] [Boss]"
				NameQuestBoss = "MarineQuest2"
				QuestLvBoss = 2
				RewardBoss = "Reward:\n$10,000\n180,000 Exp."
				CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
				CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
			elseif SelectBoss == "Warden [Lv. 175] [Boss]" then
				BossMon = "Warden [Lv. 175] [Boss]"
				NameQuestBoss = "ImpelQuest"
				QuestLvBoss = 1
				RewardBoss = "Reward:\n$6,000\n600,000 Exp."
				CFrameQBoss = CFrame.new(4853.283203125, 5.6783537864685, 745.13970947266)
				CFrameBoss = CFrame.new(5020.9438476563, 88.67887878418, 756.89392089844)
			elseif SelectBoss == "Saber Expert [Lv. 200] [Boss]" then
				BossMon = "Saber Expert [Lv. 200] [Boss]"
				CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
			elseif SelectBoss == "Chief Warden [Lv. 200] [Boss]" then
				BossMon = "Chief Warden [Lv. 200] [Boss]"
				NameQuestBoss = "ImpelQuest"
				QuestLvBoss = 2
				RewardBoss = "Reward:\n$10,000\n700,000 Exp."
				CFrameQBoss = CFrame.new(4853.283203125, 5.6783537864685, 745.13970947266)
				CFrameBoss = CFrame.new(5020.9438476563, 88.67887878418, 756.89392089844)
			elseif SelectBoss == "Flamingo [Lv. 225] [Boss]" then
				BossMon = "Flamingo [Lv. 225] [Boss]"
				NameQuestBoss = "ImpelQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n1,300,000 Exp."
				CFrameQBoss = CFrame.new(4853.283203125, 5.6783537864685, 745.13970947266)
				CFrameBoss = CFrame.new(5020.9438476563, 88.67887878418, 756.89392089844)
			elseif SelectBoss == "Magma Admiral [Lv. 350] [Boss]" then
				BossMon = "Magma Admiral [Lv. 350] [Boss]"
				NameQuestBoss = "MagmaQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
				CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
				CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
			elseif SelectBoss == "Fishman Lord [Lv. 425] [Boss]" then
				BossMon = "Fishman Lord [Lv. 425] [Boss]"
				NameQuestBoss = "FishmanQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
				CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
				CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
			elseif SelectBoss == "Wysper [Lv. 500] [Boss]" then
				BossMon = "Wysper [Lv. 500] [Boss]"
				NameQuestBoss = "SkyExp1Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
				CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
				CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
			elseif SelectBoss == "Thunder God [Lv. 575] [Boss]" then
				BossMon = "Thunder God [Lv. 575] [Boss]"
				NameQuestBoss = "SkyExp2Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
				CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
				CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
			elseif SelectBoss == "Cyborg [Lv. 675] [Boss]" then
				BossMon = "Cyborg [Lv. 675] [Boss]"
				NameQuestBoss = "FountainQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
				CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
				CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
			elseif SelectBoss == "Greybeard [Lv. 750] [Raid Boss]" then
				BossMon = "Greybeard [Lv. 750] [Raid Boss]"
				CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
			end
		end
		if New_World then
			if SelectBoss == "Diamond [Lv. 750] [Boss]" then
				BossMon = "Diamond [Lv. 750] [Boss]"
				NameQuestBoss = "Area1Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
				CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
				CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
			elseif SelectBoss == "Jeremy [Lv. 850] [Boss]" then
				BossMon = "Jeremy [Lv. 850] [Boss]"
				NameQuestBoss = "Area2Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
				CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
				CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
			elseif SelectBoss == "Fajita [Lv. 925] [Boss]" then
				BossMon = "Fajita [Lv. 925] [Boss]"
				NameQuestBoss = "MarineQuest3"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
				CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
				CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
			elseif SelectBoss == "Don Swan [Lv. 1000] [Boss]" then
				BossMon = "Don Swan [Lv. 1000] [Boss]"
				CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
			elseif SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
				BossMon = "Smoke Admiral [Lv. 1150] [Boss]"
				NameQuestBoss = "IceSideQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
				CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
				CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
			elseif SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
				BossMon = "Awakened Ice Admiral [Lv. 1400] [Boss]"
				NameQuestBoss = "FrostQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
				CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
				CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
			elseif SelectBoss == "Tide Keeper [Lv. 1475] [Boss]" then
				BossMon = "Tide Keeper [Lv. 1475] [Boss]"
				NameQuestBoss = "ForgottenQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
				CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
				CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
			elseif SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
				BossMon = "Darkbeard [Lv. 1000] [Raid Boss]"
				CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
			elseif SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
				BossMon = "Cursed Captain [Lv. 1325] [Raid Boss]"
				CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
			elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
				BossMon = "Order [Lv. 1250] [Raid Boss]"
				CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
			end
		end
		if Three_World then
			if SelectBoss == "Stone [Lv. 1550] [Boss]" then
				BossMon = "Stone [Lv. 1550] [Boss]"
				NameQuestBoss = "PiratePortQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
				CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
				CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
			elseif SelectBoss == "Island Empress [Lv. 1675] [Boss]" then
				BossMon = "Island Empress [Lv. 1675] [Boss]"
				NameQuestBoss = "AmazonQuest2"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
				CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
				CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
			elseif SelectBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
				BossMon = "Kilo Admiral [Lv. 1750] [Boss]"
				NameQuestBoss = "MarineTreeIsland"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
				CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
				CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
			elseif SelectBoss == "Captain Elephant [Lv. 1875] [Boss]" then
				BossMon = "Captain Elephant [Lv. 1875] [Boss]"
				NameQuestBoss = "DeepForestIsland"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
				CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
				CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
			elseif SelectBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
				BossMon = "Beautiful Pirate [Lv. 1950] [Boss]"
				NameQuestBoss = "DeepForestIsland2"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
				CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
				CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
			elseif SelectBoss == "Longma [Lv. 2000] [Boss]" then
				BossMon = "Longma [Lv. 2000] [Boss]"
				CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
			elseif SelectBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" then
				BossMon = "Soul Reaper [Lv. 2100] [Raid Boss]"
				CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
			elseif SelectBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
				BossMon = "rip_indra True Form [Lv. 5000] [Raid Boss]"
				CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
			end
		end
	end
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoFarmBoss then
					CheckBossQuest()
					if SelectBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" or SelectBoss == "Longma [Lv. 2000] [Boss]" or SelectBoss == "Don Swan [Lv. 1000] [Boss]" or SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or SelectBoss == "Order [Lv. 1250] [Raid Boss]" or SelectBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
						if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
							for L_227_forvar0, L_228_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if L_228_forvar1.Name == BossMon then
									repeat
										game:GetService("RunService").Heartbeat:wait()
										EquipWeapon(SelectWeaponBoss)
										TP(L_228_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
										L_228_forvar1.HumanoidRootPart.CanCollide = false
										L_228_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
									until AutoFarmBoss == false or not L_228_forvar1.Parent or L_228_forvar1.Humanoid.Health <= 0
								end
							end
						else
							TP(CFrameBoss)
						end
					else
						if BossQuest then
							if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
								TP(CFrameQBoss)
								if (CFrameQBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
									wait(1.1)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
								end
							elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
								if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
									for L_229_forvar0, L_230_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if L_230_forvar1.Name == BossMon then
											repeat
												game:GetService("RunService").Heartbeat:wait()
												if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestReward.Title.Text, RewardBoss) then
													EquipWeapon(SelectWeaponBoss)
													TP(L_230_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
													L_230_forvar1.HumanoidRootPart.CanCollide = false
													L_230_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
													game:GetService("VirtualUser"):CaptureController()
													game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
												else
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
												end
											until AutoFarmBoss == false or not L_230_forvar1.Parent or L_230_forvar1.Humanoid.Health <= 0
										end
									end
								else
									TP(CFrameBoss)
								end
							end
						else
							if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
								for L_231_forvar0, L_232_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if L_232_forvar1.Name == BossMon then
										repeat
											game:GetService("RunService").Heartbeat:wait()
											EquipWeapon(SelectWeaponBoss)
											TP(L_232_forvar1.HumanoidRootPart.CFrame * Farm_Mode)
											L_232_forvar1.HumanoidRootPart.CanCollide = false
											L_232_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											game:GetService("VirtualUser"):CaptureController()
											game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
										until AutoFarmBoss == false or not L_232_forvar1.Parent or L_232_forvar1.Humanoid.Health <= 0
									end
								end
							else
								TP(CFrameBoss)
							end
						end
					end
				end
			end
		end)
	end)
	local L_35_ = game:GetService("Players").LocalPlayer
	local L_36_ = L_35_:GetMouse()
	L_36_.Button1Down:connect(function()
		if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
			return
		end
		if not L_36_.Target then
			return
		end
		if CTRL then
			L_35_.Character:MoveTo(L_36_.Hit.p)
		end
	end)
	if _G.AutoFarm_Ken and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
		wait()
		game:GetService('VirtualUser'):CaptureController()
		game:GetService('VirtualUser'):SetKeyDown('0x65')
		wait(2)
		game:GetService('VirtualUser'):SetKeyUp('0x65')
	end
	spawn(function()
		while wait() do
			pcall(function()
				if AutoFarmObservation then
					if New_World then
						if game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
							if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat
									wait(.1)
									TP(game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]").HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
								until AutoFarmObservation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
								if _G.AutoFarm_Ken and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
									game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
								end
							else
								repeat
									wait(.1)
									TP(game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]").HumanoidRootPart.CFrame * CFrame.new(0, 25, 10))
								until AutoFarmObservation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							TP(CFrame.new(5567.3129882813, 262.92590332031, -6780.9545898438))
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
						end
					elseif Old_World then
						if game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
							if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat
									wait(.1)
									TP(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
								until AutoFarmObservation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
								if _G.AutoFarm_Ken and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
									game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
								end
							else
								repeat
									wait(.1)
									TP(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(0, 25, 10))
								until AutoFarmObservation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							TP(CFrame.new(5533.29785, 88.1079102, 4852.3916))
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
						end
					elseif Three_World then
						if game.Workspace.Enemies:FindFirstChild("Marine Commodore [Lv. 1700]") then
							if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat
									wait(.1)
									TP(game.Workspace.Enemies:FindFirstChild("Marine Commodore [Lv. 1700]").HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
								until AutoFarmObservation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
								if _G.AutoFarm_Ken and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
									game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
								end
							else
								repeat
									wait(.1)
									TP(game.Workspace.Enemies:FindFirstChild("Marine Commodore [Lv. 1700]").HumanoidRootPart.CFrame * CFrame.new(0, 25, 10))
								until AutoFarmObservation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							TP(CFrame.new(2445.59204, 273.184479, -7087.646))
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
						end
					end
				end
			end)
		end
	end)
	spawn(function()
		while wait() do
			wait(Sec)
			pcall(function()
				if AutoFarmObservation and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
					game:GetService('VirtualUser'):CaptureController()
					game:GetService('VirtualUser'):SetKeyDown('0x65')
					wait(2)
					game:GetService('VirtualUser'):SetKeyUp('0x65')
				end
			end)
		end
	end)
	spawn(function()
		while wait() do
			if AutoObservation then
				if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
					wait(1)
					game:GetService('VirtualUser'):CaptureController()
					game:GetService('VirtualUser'):SetKeyDown('0x65')
					wait(2)
					game:GetService('VirtualUser'):SetKeyUp('0x65')
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if Auto_Haki then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				end
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if Mad then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", SelectPoint)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if Gan then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", SelectPoint)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if Dap then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", SelectPoint)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if Pun then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", SelectPoint)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if DevilFruit then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", SelectPoint)
			end
		end
	end)
	spawn(function()
		while wait(.1) do
			if _G.AutoStat then
				for L_233_forvar0, L_234_forvar1 in pairs(_G.AutoStat) do
					if L_234_forvar1 == "Melee" and game.Players.LocalPlayer.Data.Stats.Melee.Level.Value ~= 2200 then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
						until game.Players.LocalPlayer.Data.Stats.Melee.Level.Value == 2200
					elseif L_234_forvar1 == "Defense" and game.Players.LocalPlayer.Data.Stats.Defense.Level.Value ~= 2200 then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
						until game.Players.LocalPlayer.Data.Stats.Defense.Level.Value == 2200
					elseif L_234_forvar1 == "Sword" and game.Players.LocalPlayer.Data.Stats.Sword.Level.Value ~= 2200 then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", 1)
						until game.Players.LocalPlayer.Data.Stats.Sword.Level.Value == 2200
					elseif L_234_forvar1 == "Gun" and game.Players.LocalPlayer.Data.Stats.Gun.Level.Value ~= 2200 then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", 1)
						until game.Players.LocalPlayer.Data.Stats.Gun.Level.Value == 2200
					elseif L_234_forvar1 == "DevilFruit" and game.Players.LocalPlayer.Data.Stats["Demon Fruit"].Level.Value ~= 2200 then
						repeat
							game:GetService("RunService").Heartbeat:wait()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 1)
						until game.Players.LocalPlayer.Data.Stats.Gun.Level.Value == 2200
					end
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait() do
				if _G.Redeem and game.Players.LocalPlayer.Data.Level.Value >= 850 then
					function UseCode(L_235_arg0)
						game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(L_235_arg0)
					end
					UseCode("UPD16")
					UseCode("2BILLION")
					UseCode("UPD15")
					UseCode("FUDD10")
					UseCode("BIGNEWS")
					UseCode("THEGREATACE")
					UseCode("SUB2GAMERROBOT_EXP1")
					UseCode("StrawHatMaine")
					UseCode("Sub2OfficialNoobie")
					UseCode("SUB2NOOBMASTER123")
					UseCode("Sub2Daigrock")
					UseCode("Axiore")
					UseCode("TantaiGaming")
					UseCode("STRAWHATMAINE")
				end
			end
		end)
	end)
	if _G.BoostFPS then
		local L_236_ = true
		local L_237_ = game
		local L_238_ = L_237_.Workspace
		local L_239_ = L_237_.Lighting
		local L_240_ = L_238_.Terrain
		L_240_.WaterWaveSize = 0
		L_240_.WaterWaveSpeed = 0
		L_240_.WaterReflectance = 0
		L_240_.WaterTransparency = 0
		L_239_.GlobalShadows = false
		L_239_.FogEnd = 387420489
		L_239_.Brightness = 0
		settings().Rendering.QualityLevel = "Level01"
		for L_241_forvar0, L_242_forvar1 in pairs(L_237_:GetDescendants()) do
			if L_242_forvar1:IsA("Part") or L_242_forvar1:IsA("Union") or L_242_forvar1:IsA("CornerWedgePart") or L_242_forvar1:IsA("TrussPart") then
				L_242_forvar1.Material = "Plastic"
				L_242_forvar1.Reflectance = 0
			elseif L_242_forvar1:IsA("Decal") or L_242_forvar1:IsA("Texture") and L_236_ then
				L_242_forvar1.Transparency = 1
			elseif L_242_forvar1:IsA("ParticleEmitter") or L_242_forvar1:IsA("Trail") then
				L_242_forvar1.Lifetime = NumberRange.new(0)
			elseif L_242_forvar1:IsA("Explosion") then
				L_242_forvar1.BlastPressure = 1
				L_242_forvar1.BlastRadius = 1
			elseif L_242_forvar1:IsA("Fire") or L_242_forvar1:IsA("SpotLight") or L_242_forvar1:IsA("Smoke") or L_242_forvar1:IsA("Sparkles") then
				L_242_forvar1.Enabled = false
			elseif L_242_forvar1:IsA("MeshPart") then
				L_242_forvar1.Material = "Plastic"
				L_242_forvar1.Reflectance = 0
				L_242_forvar1.TextureID = 10385902758728957
			end
		end
		for L_243_forvar0, L_244_forvar1 in pairs(L_239_:GetChildren()) do
			if L_244_forvar1:IsA("BlurEffect") or L_244_forvar1:IsA("SunRaysEffect") or L_244_forvar1:IsA("ColorCorrectionEffect") or L_244_forvar1:IsA("BloomEffect") or L_244_forvar1:IsA("DepthOfFieldEffect") then
				L_244_forvar1.Enabled = false
			end
		end
	end
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoSetSpawn and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if USEBF then
				pcall(function()
					CheckLevel()
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
						if SkillZ and game.Players.LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
							local L_245_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_245_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
							wait(.3)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
						end
						if SkillX then
							local L_246_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_246_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
						end
						if SkillC then
							local L_247_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_247_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
						end
						if SkillV then
							local L_248_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_248_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
						end
					elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
						if SkillZ then
							local L_249_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_249_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
						end
						if SkillX then
							local L_250_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_250_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
						end
						if SkillC then
							local L_251_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_251_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
						end
						if SkillV then
							local L_252_ = {
								[1] = PosMonMasteryFruit.Position
							}
							game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_252_))
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
						end
					end
				end)
			end
		end
	end)
	spawn(function()
		pcall(function()
			game:GetService("RunService").RenderStepped:Connect(function()
				if USEBF and PosMonMasteryFruit ~= nil then
					local L_253_ = {
						[1] = PosMonMasteryFruit.Position
					}
					game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(L_253_))
				end
			end)
		end)
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if PressHomeStopTween then
					if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Home) then
						TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
					end
				end
			end
		end)
	end)
	spawn(function()
		pcall(function()
			while wait() do
				for L_254_forvar0, L_255_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if L_255_forvar1:IsA("Tool") then
						if L_255_forvar1:FindFirstChild("RemoteFunctionShoot") then
							SelectToolWeaponGun = L_255_forvar1.Name
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				for L_256_forvar0, L_257_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if L_257_forvar1:IsA("Tool") then
						if L_257_forvar1.ToolTip == "Melee" then
							SelectToolWeaponMelee = L_257_forvar1.Name
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if _G.AutoRaid or NextIsland then
					workspace.Gravity = 0
				else
					workspace.Gravity = 196
				end
			end
		end)
	end)
	local L_37_ = game:GetService'Players'.LocalPlayer
	local L_38_ = L_37_.Character.Energy.Value
	function infinitestam()
		L_37_.Character.Energy.Changed:connect(function()
			if InfinitsEnergy then
				L_37_.Character.Energy.Value = L_38_
			end
		end)
	end
	spawn(function()
		while wait(.1) do
			if InfinitsEnergy then
				wait(0.3)
				L_38_ = L_37_.Character.Energy.Value
				infinitestam()
			end
		end
	end)
	nododgecool = false
	function NoDodgeCool()
		if nododgecool then
			for L_258_forvar0, L_259_forvar1 in next, getgc() do
				if game.Players.LocalPlayer.Character.Dodge then
					if typeof(L_259_forvar1) == "function" and getfenv(L_259_forvar1).script == game.Players.LocalPlayer.Character.Dodge then
						for L_260_forvar0, L_261_forvar1 in next, getupvalues(L_259_forvar1) do
							if tostring(L_261_forvar1) == "0.4" then
								repeat
									wait(.1)
									setupvalue(L_259_forvar1, L_260_forvar0, 0)
								until not nododgecool
							end
						end
					end
				end
			end
		end
	end
	function KillPlayerfunc()
		if KillPlayer and Aimbot then
			EquipWeapon(SelectToolWeaponGun)
			if HideHit then
				game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Transparency = 1
			else
				game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Transparency = 0.8
			end
			game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CanCollide = false
			game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
			TP(game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
			game:GetService("VirtualUser"):CaptureController()
			game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
			if SkillZ then
				local L_262_ = {
					[1] = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteEvent:FireServer(unpack(L_262_))
				local L_263_ = {
					[1] = "Z",
					[2] = Vector3.new(0, 0, 0)
				}
				game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunction:InvokeServer(unpack(L_263_))
			end
			if SkillX  then
				local L_264_ = {
					[1] = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteEvent:FireServer(unpack(L_264_))
				local L_265_ = {
					[1] = "X",
					[2] = Vector3.new(0, 0, 0)
				}
				game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunction:InvokeServer(unpack(L_265_))
			end
		elseif KillPlayer then
			EquipWeapon(SelectKillWeapon)
			if HideHit then
				game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Transparency = 1
			else
				game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Transparency = .8
			end
			game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CanCollide = false
			game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
			TP(game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0, 13, 7))
			game:GetService("VirtualUser"):CaptureController()
			game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
			if SkillZ then
				local L_266_ = {
					[1] = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_266_))
				local L_267_ = {
					[1] = "Z",
					[2] = Vector3.new(0, 0, 0)
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteFunction:InvokeServer(unpack(L_267_))
			end
			if SkillX  then
				local L_268_ = {
					[1] = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_268_))
				local L_269_ = {
					[1] = "X",
					[2] = Vector3.new(0, 0, 0)
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteFunction:InvokeServer(unpack(L_269_))
			end
			if SkillV then
				local L_270_ = {
					[1] = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_270_))
				local L_271_ = {
					[1] = "V",
					[2] = Vector3.new(0, 0, 0)
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteFunction:InvokeServer(unpack(L_271_))
			end
		end
	end
	spawn(function()
		pcall(function()
			while wait() do
				if SafeMode then
					local L_272_ = math.random(1, 100)
					local L_273_ = math.random(1, 100)
					TP(CFrame.new(L_272_, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, L_273_))
				end
			end
		end)
	end)
	local L_39_ = game:GetService('Players').LocalPlayer
	local L_40_ = L_39_:GetMouse()
	L_40_.Button1Down:Connect(function()
		if AimbotRange and game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) then
			for L_274_forvar0, L_275_forvar1 in pairs(game:GetService("Players"):GetChildren()) do
				if L_275_forvar1.Character:FindFirstChild("HumanoidRootPart") and L_275_forvar1.Character:FindFirstChild("Humanoid") then
					if (L_275_forvar1.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3 <= RangeAimGun then
						if L_275_forvar1.Name == game.Players.LocalPlayer.Name then
						else
							local L_276_ = {
								[1] = L_275_forvar1.Character.HumanoidRootPart.Position,
								[2] = L_275_forvar1.Character.HumanoidRootPart
							}
							game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(L_276_))
						end
					end
				end
			end
		end
	end)
	local L_41_ = game:GetService('Players').LocalPlayer
	local L_42_ = L_41_:GetMouse()
	L_42_.Button1Down:Connect(function()
		if Aimbot and game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) then
			local L_277_ = {
				[1] = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position,
				[2] = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart
			}
			game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(L_277_))
		end
	end)
	spawn(function()
		pcall(function()
			while game:GetService("RunService").Heartbeat:wait() do
				if KillPlayer then
					KillPlayerfunc()
				end
			end
		end)
	end)
	L_13_:AddButton("Hop Lower Server", function()
		HopLowerServer()
	end)
	L_13_:AddButton("Server Hop", function()
		DiscordLib:Notification("Hop Server", "Wait For Teleport", "Ok")
		Teleport()
	end)
	L_13_:AddButton("Rejoin Server", function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").localPlayer)
	end)
	L_13_:AddButton("Join Pirates Team", function()
		local L_278_ = {
			[1] = "SetTeam",
			[2] = "Pirates"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_278_))
		local L_279_ = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_279_))
	end)
	L_13_:AddButton("Join Marines Team", function()
		local L_280_ = {
			[1] = "SetTeam",
			[2] = "Marines"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_280_))
		local L_281_ = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_281_))
	end)
	L_13_:AddButton("Devil Shop", function()
		local L_282_ = {
			[1] = "GetFruits"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_282_))
		game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
	end)
	L_13_:AddButton("Inventory", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
		game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
	end)
	L_13_:AddButton("Fruit Inventory", function()
		local L_283_ = {
			[1] = "getInventoryFruits"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
		game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
	end)
	L_13_:AddButton("Color Haki", function()
		game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
	end)
	L_13_:AddButton("Title Name", function()
		local L_284_ = {
			[1] = "getTitles"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_284_))
		game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
	end)
	if New_World then
		L_13_:AddButton("TP to Flower", function()
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower1") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower1") then
				TP(game:GetService("Workspace").Flower1.CFrame)
			end
			wait(1)
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower2") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower2") then
				TP(game:GetService("Workspace").Flower2.CFrame)
			end
		end)
	end
	L_13_:AddToggle("No Dodge Cooldown", false, function(L_285_arg0)
		nododgecool = L_285_arg0
		NoDodgeCool()
	end)
	L_13_:AddToggle("Inf Energy", false, function(L_286_arg0)
		InfinitsEnergy = L_286_arg0
		L_38_ = L_37_.Character.Energy.Value
	end)
	L_13_:AddToggle("Inf Ability", false, function(L_287_arg0)
		InfAbility = L_287_arg0
	end)
	spawn(function()
		while wait() do
			if InfAbility then
				InfAb()
			end
		end
	end)
	function InfAb()
		if InfAbility then
			if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
				local L_288_ = Instance.new("ParticleEmitter")
				L_288_.Acceleration = Vector3.new(0, 0, 0)
				L_288_.Archivable = true
				L_288_.Drag = 20
				L_288_.EmissionDirection = Enum.NormalId.Top
				L_288_.Enabled = true
				L_288_.Lifetime = NumberRange.new(0.2, 0.2)
				L_288_.LightInfluence = 0
				L_288_.LockedToPart = true
				L_288_.Name = "Agility"
				L_288_.Rate = 500
				local L_289_ = {
					NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
					NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
				}
				L_288_.Size = NumberSequence.new(L_289_)
				L_288_.RotSpeed = NumberRange.new(999, 9999)
				L_288_.Rotation = NumberRange.new(0, 0)
				L_288_.Speed = NumberRange.new(30, 30)
				L_288_.SpreadAngle = Vector2.new(360, 360)
				L_288_.Texture = "rbxassetid://243098098"
				L_288_.VelocityInheritance = 0
				L_288_.ZOffset = 2
				L_288_.Transparency = NumberSequence.new(0)
				L_288_.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255), Color3.fromRGB(0, 255, 255))
				L_288_.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
			end
		else
			if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
				game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
			end
		end
	end
	L_13_:AddToggle("Auto Click", false, function(L_290_arg0)
		AutoClick = L_290_arg0
	end)
	L_13_:AddToggle("Walk on Water", false, function(L_291_arg0)
		_G.Water = L_291_arg0
	end)
	spawn(function()
		pcall(function()
			while game:GetService("RunService").Heartbeat:wait() do
				if _G.Water then
					if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
						if not game:GetService("Workspace"):FindFirstChild("Water") then
							local L_292_ = Instance.new("Part", game.Workspace)
							L_292_.Name = "Water"
							L_292_.Size = Vector3.new(10, 0.5, 10)
							L_292_.Transparency = 0.8
							L_292_.Anchored = true
							game:GetService("Workspace").Water.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game:GetService("Workspace").Camera["Water;"].CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
						else
							game:GetService("Workspace").Water.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game:GetService("Workspace").Camera["Water;"].CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
						end
					elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y >= 1 and game:GetService("Workspace"):FindFirstChild("Water") then
						game:GetService("Workspace"):FindFirstChild("Water"):Destroy()
					end
				else
					if game:GetService("Workspace"):FindFirstChild("Water") then
						game:GetService("Workspace"):FindFirstChild("Water"):Destroy()
					end
				end
			end
		end)
	end)
	game:GetService("RunService").Heartbeat:Connect(function()
		if AutoClick then
			game:GetService'VirtualUser':Button1Down(Vector2.new(0.9, 0.9))
			game:GetService'VirtualUser':Button1Up(Vector2.new(0.9, 0.9))
		end
	end)
	if Three_World then
		L_13_:AddButton("Auto Torch", function()
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Holy Torch") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Holy Torch") then
				DiscordLib:Notification("Auto Holy Torch", "You not Have Holy Torch", "Okay")
			else
				HolyTorch = true
				EquipWeapon("Holy Torch")
				TP2(CFrame.new(-10753.7842, 412.229553, -9364.7959, 0.999571264, 1.15988023e-07, 0.0292795487, -1.15145767e-07, 1, -3.0452199e-08, -0.0292795487, 2.70677276e-08, 0.999571264))
				wait(1)
				TP2(CFrame.new(-11673.8115, 331.748993, -9473.27246, 0.82297951, -1.03370638e-07, -0.568071067, 7.03514687e-08, 1, -8.00477693e-08, 0.568071067, 2.59130388e-08, 0.82297951))
				wait(1)
				TP2(CFrame.new(-12134.1895, 519.47522, -10653.8457, 0.828167021, 4.15180885e-08, -0.560481429, -3.68933151e-08, 1, 1.95622238e-08, 0.560481429, 4.47723014e-09, 0.828167021))
				wait(1)
				TP2(CFrame.new(-13336.9902, 485.547852, -6983.84131, 0.834512472, 8.29770741e-08, -0.550989032, -5.3400484e-08, 1, 6.97177356e-08, 0.550989032, -2.87572384e-08, 0.834512472))
				wait(1)
				TP2(CFrame.new(-13486.5088, 332.403931, -7925.40527, -0.974250019, 5.647113e-08, 0.225470319, 3.76493894e-08, 1, -8.7777444e-08, -0.225470319, -7.70283606e-08, -0.974250019))
				HolyTorch = false
			end
		end)
	end
	L_13_:AddButton("Beautiful Mode", function()
		BeautifulMode()
	end)
	L_13_:AddToggle("Body Light", false, function(L_293_arg0)
		_G.LightMode = L_293_arg0
	end)
	if _G.BeautifulMode then
		BeautifulMode()
	end
	MiscFarmWeapon = ""
	if Old_World then
		tableMon = {
			"Bandit [Lv. 5]",
			"Monkey [Lv. 14]",
			"Gorilla [Lv. 20]",
			"Pirate [Lv. 35]",
			"Brute [Lv. 45]",
			"Desert Bandit [Lv. 60]",
			"Desert Officer [Lv. 70]",
			"Snow Bandit [Lv. 90]",
			"Snowman [Lv. 100]",
			"Chief Petty Officer [Lv. 120]",
			"Sky Bandit [Lv. 150]",
			"Dark Master [Lv. 175]",
			"Toga Warrior [Lv. 225]",
			"Gladiator [Lv. 275]",
			"Military Soldier [Lv. 300]",
			"Military Spy [Lv. 330]",
			"Fishman Warrior [Lv. 375]",
			"Fishman Commando [Lv. 400]",
			"God's Guard [Lv. 450]",
			"Shanda [Lv. 475]",
			"Royal Squad [Lv. 525]",
			"Royal Soldier [Lv. 550]",
			"Galley Pirate [Lv. 625]",
			"Galley Captain [Lv. 650]"
		}
	elseif New_World then
		tableMon = {
			"Raider [Lv. 700]",
			"Mercenary [Lv. 725]",
			"Swan Pirate [Lv. 775]",
			"Factory Staff [Lv. 800]",
			"Marine Lieutenant [Lv. 875]",
			"Marine Captain [Lv. 900]",
			"Zombie [Lv. 950]",
			"Vampire [Lv. 975]",
			"Snow Trooper [Lv. 1000]",
			"Winter Warrior [Lv. 1050]",
			"Lab Subordinate [Lv. 1100]",
			"Horned Warrior [Lv. 1125]",
			"Magma Ninja [Lv. 1175]",
			"Lava Pirate [Lv. 1200]",
			"Ship Deckhand [Lv. 1250]",
			"Ship Engineer [Lv. 1275]",
			"Ship Steward [Lv. 1300]",
			"Ship Officer [Lv. 1325]",
			"Arctic Warrior [Lv. 1350]",
			"Snow Lurker [Lv. 1375]",
			"Sea Soldier [Lv. 1425]",
			"Water Fighter [Lv. 1450]"
		}
	elseif Three_World then
		tableMon = {
			"Pirate Millionaire [Lv. 1500]",
			"Dragon Crew Warrior [Lv. 1575]",
			"Dragon Crew Archer [Lv. 1600]",
			"Female Islander [Lv. 1625]",
			"Giant Islander [Lv. 1650]",
			"Marine Commodore [Lv. 1700]",
			"Marine Rear Admiral [Lv. 1725]",
			"Fishman Raider [Lv. 1775]",
			"Fishman Captain [Lv. 1800]",
			"Forest Pirate [Lv. 1825]",
			"Mythological Pirate [Lv. 1850]",
			"Jungle Pirate [Lv. 1900]",
			"Musketeer Pirate [Lv. 1925]",
			"Reborn Skeleton [Lv. 1975]",
			"Living Zombie [Lv. 2000]",
			"Demonic Soul [Lv. 2025]",
			"Posessed Mummy [Lv. 2050]",
			"Ice Cream Chef [Lv. 2125]",
			"Ice Cream Commander [Lv. 2150]"
		}
	end
	L_16_:AddDropdown("Select Monster", tableMon, "Monster", false, function(L_294_arg0)
		SelectMonster = L_294_arg0
	end)
	L_16_:AddToggle("Auto Farm Select Monster", false, function(L_295_arg0)
		AutoFarmSelectMonster = L_295_arg0
		if L_295_arg0 == false then
			wait(1)
			TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
		end
	end)
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
	if New_World then
		L_16_:AddLabel("Auto Quest")
		L_16_:AddToggle("Auto Quest Bartilo", false, function(L_296_arg0)
			CheckBarto = L_296_arg0
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Warrior Helmet") then
				Success = true
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Warrior Helmet") then
				Success = true
			end
			if Success and CheckBarto == true then
				DiscordLib:Notification("Auto Quest Bartilo", "Successfully", "Ok")
			elseif CheckBarto == true and MiscFarmWeapon == "" then
				DiscordLib:Notification("Auto Quest Bartilo", "SelectWeapon First", "Okay")
			elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 and CheckBarto == true then
				DiscordLib:Notification("Auto Quest Bartilo", "Successfully", "Ok")
			else
				AutoBartilo = L_296_arg0
				if L_296_arg0 == false then
					wait(1)
					TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
				end
			end
		end)
		L_16_:AddToggle("Auto Evo Race", false, function(L_297_arg0)
			CheckEvo = L_297_arg0
			if not game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 and CheckEvo then
				DiscordLib:Notification("Auto Evo Race", "You Have To Success Bartilo Quest", "Okay")
			elseif CheckEvo == true and MiscFarmWeapon == "" then
				DiscordLib:Notification("Auto Evo Race", "SelectWeapon First", "Okay")
			elseif game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") and CheckEvo then
				DiscordLib:Notification("Auto Evo Race", "Successfully", "Ok")
			else
				AutoEvoRace = L_297_arg0
				if L_297_arg0 == false then
					wait(1)
					TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
				end
			end
		end)
		L_16_:AddToggle("Auto Rengoku", false, function(L_298_arg0)
			AutoRengoku = L_298_arg0
			if L_298_arg0 == false then
				wait(1)
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
		L_16_:AddToggle("Auto Ectoplasm", false, function(L_299_arg0)
			AutoEcto = L_299_arg0
			if L_299_arg0 == false then
				wait(1)
				TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
	end
	if Three_World then
		L_16_:AddToggle("Auto Citizen Quest", false, function(L_300_arg0)
			CheckCitizen = L_300_arg0
			TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Musketeer Hat") then
				CTCH = true
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Musketeer Hat") then
				CTCH = true
			end
			if CTCH and CheckCitizen then
				DiscordLib:Notification("Auto Quest Citizen", "Successfully", "Ok")
			elseif CheckCitizen and MiscFarmWeapon == "" then
				DiscordLib:Notification("Auto Quest Citizen", "SelectWeapon First", "Okay")
			elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3 and CheckCitizen then
				DiscordLib:Notification("Auto Quest Citizen", "Successfully", "Ok")
			else
				AutoCitizen = L_300_arg0
				if L_300_arg0 == false then
					wait(1)
					TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
				end
			end
		end)
	end
	L_16_:AddDropdown("Select Weapon", Wapon, "Weapon", false, function(L_301_arg0)
		MiscFarmWeapon = L_301_arg0
	end)
	L_14_:AddLabel("Abilities")
	L_14_:AddButton("Skyjump", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
	end)
	L_14_:AddButton("Buso Haki", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
	end)
	L_14_:AddButton("Soru", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
	end)
	L_14_:AddButton("Ken Haki", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
	end)
	L_14_:AddButton("Refund Stat [2500 F]", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
	end)
	L_14_:AddButton("Reroll Race [3000 F]", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
	end)
	L_14_:AddLabel("Fighting Style")
	L_14_:AddButton("Black Leg", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
	end)
	L_14_:AddButton("Electro", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
	end)
	L_14_:AddButton("Fishman Karate", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
	end)
	L_14_:AddButton("Dragon Claw", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
	end)
	L_14_:AddButton("Superhuman", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
	end)
	L_14_:AddButton("Death Step", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
	end)
	L_14_:AddButton("Sharkman Karate", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
	end)
	L_14_:AddButton("Electric Claw", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
	end)
	L_14_:AddButton("Dragon Talon", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
	end)
	L_14_:AddLabel("Sword")
	L_14_:AddButton("Katana", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
	end)
	L_14_:AddButton("Cutlass", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
	end)
	L_14_:AddButton("Duel Katana", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
	end)
	L_14_:AddButton("Iron Mace", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
	end)
	L_14_:AddButton("Pipe", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
	end)
	L_14_:AddButton("Triple Katana", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
	end)
	L_14_:AddButton("Dual-Headed Blade", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
	end)
	L_14_:AddButton("Bisento", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
	end)
	L_14_:AddButton("Soul Cane", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
	end)
	L_14_:AddLabel("Gun")
	L_14_:AddButton("Slingshot", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
	end)
	L_14_:AddButton("Musket", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
	end)
	L_14_:AddButton("Flintlock", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
	end)
	L_14_:AddButton("Refined Flintlock", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
	end)
	L_14_:AddButton("Cannon", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
	end)
	L_14_:AddButton("Kabucha", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
	end)
	L_14_:AddLabel("Accessory")
	L_14_:AddButton("Black Cape", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
	end)
	L_14_:AddButton("Toemo Ring", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
	end)
	L_14_:AddButton("Swordsman Hat", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
	end)
	L_15_:AddToggle("Auto Store Fruit", false, function(L_302_arg0)
		AutoStoreFruit = L_302_arg0
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoStoreFruit then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Kilo-Kilo")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bird-Bird: Falcon")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Revive-Dark")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Door-Door")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Human-Human: Buddha")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "String-String")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bird-Bird: Phoenix")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Paw-Paw")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control")
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon")
					end
				end
			end
		end)
	end)
	L_15_:AddToggle("Bring Fruit ", _G.BringFruit, function(L_303_arg0)
		BringFruit = L_303_arg0
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if BringFruit then
					for L_304_forvar0, L_305_forvar1 in pairs(game:GetService("Workspace"):GetChildren()) do
						if string.find(L_305_forvar1.Name, "Fruit") then
							if L_305_forvar1:IsA("Tool") then
								L_305_forvar1.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
								wait(.2)
								firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_305_forvar1.Handle, 0)
							end
						end
					end
				end
			end
		end)
	end)
	L_15_:AddToggle("Auto Drop Fruit", false, function(L_306_arg0)
		Drop = L_306_arg0
	end)
	spawn(function()
		while wait() do
			if Drop then
				pcall(function()
					for L_307_forvar0, L_308_forvar1 in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						if string.find(L_308_forvar1.Name, "Fruit") then
							EquipWeapon(L_308_forvar1.Name)
							SelectFruit = L_308_forvar1.Name
							wait(.1)
							if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
								game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
							end
							EquipWeapon(L_308_forvar1.Name)
							game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
						end
					end
					for L_309_forvar0, L_310_forvar1 in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
						if string.find(L_310_forvar1.Name, "Fruit") then
							EquipWeapon(L_310_forvar1.Name)
							SelectFruit = L_310_forvar1.Name
							wait(.1)
							if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
								game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
							end
							EquipWeapon(L_310_forvar1.Name)
							game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
						end
					end
				end)
			end
		end
	end)
	L_15_:AddButton("Buy Random Devil Fruit", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
	end)
	L_15_:AddToggle("Auto Buy Random Fruit", false, function(L_311_arg0)
		DevilAutoBuy = L_311_arg0
	end)
	spawn(function()
		while wait(.1) do
			if DevilAutoBuy then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
			end
		end
	end)
	if New_World then
		L_17_:AddButton("Teleport To Lab", function()
			TP2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
		end)
	elseif Three_World then
		L_17_:AddButton("Teleport To RaidLab", function()
			TP2(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
		end)
	end
	L_17_:AddToggle("Kill Aura", false, function(L_312_arg0)
		Killaura = L_312_arg0
	end)
	L_17_:AddToggle("Auto Awakenr", false, function(L_313_arg0)
		AutoAwakener = L_313_arg0
	end)
	L_17_:AddToggle("Auto Next Island", false, function(L_314_arg0)
		NextIsland = L_314_arg0
	end)
	L_17_:AddToggle("Auto Raid", false, function(L_315_arg0)
		_G.AutoRaid = L_315_arg0
	end)
	L_17_:AddDropdown("Select Raid", {
		"Flame",
		"Ice",
		"Quake",
		"Light",
		"Dark",
		"String",
		"Rumble",
		"Magma",
		"Human: Buddha",
		"Sand"
	}, "Raid", false, function(L_316_arg0)
		_G.SelectRaid = L_316_arg0
	end)
	L_17_:AddToggle("Auto Buy Microchip", false, function(L_317_arg0)
		AutoBuychip = L_317_arg0
	end)
	spawn(function()
		pcall(function()
			while wait() do
				if AutoBuychip then
					if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectRaid)
						end
					end
				end
			end
		end)
	end)
	spawn(function()
		while wait(.1) do
			if _G.AutoRaid or RaidSuperhuman then
				pcall(function()
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
						if AutoFullySuperhuman then
							if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
								for L_318_forvar0, L_319_forvar1 in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
									if not string.find(L_319_forvar1.Name, "Fruit") then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
									end
								end
							end
						end
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectRaid)
						end
						if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
							game:GetService("StarterGui"):SetCore("SendNotification",
                                {
								Title = "Auto Raid",
								Text = "Have Some People in Raid",
								Icon = "",
								Duration = 4
							}
                            )
							wait(4)
						end
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
							if New_World then
								fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
							elseif Three_World then
								fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							end
						end
					end
				end)
			end
		end
	end)
	spawn(function()
		pcall(function()
			while wait(.1) do
				if AutoAwakener then
					local L_320_ = {
						[1] = "Awakener",
						[2] = "Check"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_320_))
					local L_321_ = {
						[1] = "Awakener",
						[2] = "Awaken"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(L_321_))
				end
			end
		end)
	end)
	spawn(function()
		while wait() do
			if Killaura or _G.AutoRaid or RaidSuperhuman then
				for L_322_forvar0, L_323_forvar1 in pairs(game.Workspace.Enemies:GetDescendants()) do
					if L_323_forvar1:FindFirstChild("Humanoid") and L_323_forvar1:FindFirstChild("HumanoidRootPart") and L_323_forvar1.Humanoid.Health > 0 then
						pcall(function()
							repeat
								wait(.1)
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								L_323_forvar1.Humanoid.Health = 0
								L_323_forvar1.HumanoidRootPart.CanCollide = false
								L_323_forvar1.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
								L_323_forvar1.HumanoidRootPart.Transparency = 0.8
							until not Killaura or not _G.AutoRaid or not RaidSuperhuman or not L_323_forvar1.Parent or L_323_forvar1.Humanoid.Health <= 0
						end)
					end
				end
			end
		end
	end)
	spawn(function()
		pcall(function()
			while game:GetService("RunService").Heartbeat:wait() do
				if NextIsland or RaidSuperhuman or _G.AutoRaid then
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
						if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
							TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame * CFrame.new(0, 80, 0))
						elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
							TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame * CFrame.new(0, 80, 0))
						elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
							TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame * CFrame.new(0, 80, 0))
						elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
							TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame * CFrame.new(0, 80, 0))
						elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
							TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame * CFrame.new(0, 80, 0))
						end
					elseif New_World then
						TP(CFrame.new(-6438.73535, 250.645355, -4501.50684))
					elseif Three_World then
						TP(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
					end
				end
			end
		end)
	end)
	L_17_:AddToggle("Auto Law Raid", false, function(L_324_arg0)
		AutoLowRaid = L_324_arg0
	end)
	L_17_:AddToggle("Auto Buy Chip Law Raid", false, function(L_325_arg0)
		AutoBuyChiplawraid = L_325_arg0
	end)
	L_17_:AddDropdown("Select Weapon", Wapon, "Weapon", false, function(L_326_arg0)
		SelectToolWeaponLaw = L_326_arg0
	end)
	L_18_:AddToggle("Melee", _G.Melee, function(L_327_arg0)
		Mad = L_327_arg0
	end)
	L_18_:AddToggle("Defense", _G.Defense, function(L_328_arg0)
		Gan = L_328_arg0
	end)
	L_18_:AddToggle("Sword", _G.Sword, function(L_329_arg0)
		Dap = L_329_arg0
	end)
	L_18_:AddToggle("Gun", _G.Gun, function(L_330_arg0)
		Pun = L_330_arg0
	end)
	L_18_:AddToggle("Devil Fruit", _G.DevilFruit, function(L_331_arg0)
		DevilFruit = L_331_arg0
	end)
	SelectPoint = 1
	L_18_:AddSlider("Point", 1, 1, 300, 1, function(L_332_arg0)
		SelectPoint = L_332_arg0
	end)
	function TP2(L_333_arg0)
		Distance = (L_333_arg0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if Distance < 1000 then
			Speed = 400
		elseif Distance >= 1000 then
			Speed = 250
		end
		game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
            {
			CFrame = L_333_arg0
		}
        ):Play()
		Clip = true
		wait(Distance / Speed)
		Clip = false
	end
	L_19_:AddButton("Stop Tween", function()
		TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
	end)
	if Old_World then
		L_19_:AddButton("Teleport To Second Sea", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
		end)
		L_19_:AddButton("Teleport To Third Sea", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
		end)
		L_19_:AddButton("Wild Mill", function()
			TP2(CFrame.new(1042.1501464844, 16.299360275269, 1444.3442382813))
		end)
		L_19_:AddButton("Marine 1st", function()
			TP2(CFrame.new(-2599.6655273438, 6.9146227836609, 2062.2216796875))
		end)
		L_19_:AddButton("Marine 2sd", function()
			TP2(CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188))
		end)
		L_19_:AddButton("Midle Town", function()
			TP2(CFrame.new(-655.97088623047, 7.878026008606, 1573.7612304688))
		end)
		L_19_:AddButton("Jungle", function()
			TP2(CFrame.new(-1499.9877929688, 22.877912521362, 353.87060546875))
		end)
		L_19_:AddButton("Pirate Village", function()
			TP2(CFrame.new(-1163.3889160156, 44.777843475342, 3842.8276367188))
		end)
		L_19_:AddButton("Desert", function()
			TP2(CFrame.new(954.02056884766, 6.6275520324707, 4262.611328125))
		end)
		L_19_:AddButton("Frozen Village", function()
			TP2(CFrame.new(1144.5270996094, 7.3292083740234, -1164.7322998047))
		end)
		L_19_:AddButton("Colosseum", function()
			TP2(CFrame.new(-1667.5869140625, 39.385631561279, -3135.5817871094))
		end)
		L_19_:AddButton("Prison", function()
			TP2(CFrame.new(4857.6982421875, 5.6780304908752, 732.75750732422))
		end)
		L_19_:AddButton("Mob Leader", function()
			TP2(CFrame.new(-2841.9604492188, 7.3560485839844, 5318.1040039063))
		end)
		L_19_:AddButton("Magma Village", function()
			TP2(CFrame.new(-5328.8740234375, 8.6164798736572, 8427.3994140625))
		end)
		L_19_:AddButton("UnderWater Gate", function()
			TP2(CFrame.new(3893.953125, 5.3989524841309, -1893.4851074219))
		end)
		L_19_:AddButton("UnderWater City", function()
			TP2(CFrame.new(61191.12109375, 18.497436523438, 1561.8873291016))
		end)
		L_19_:AddButton("Fountain City", function()
			TP2(CFrame.new(5244.7133789063, 38.526943206787, 4073.4987792969))
		end)
		L_19_:AddButton("Sky 1st", function()
			TP2(CFrame.new(-4878.0415039063, 717.71246337891, -2637.7294921875))
		end)
		L_19_:AddButton("Sky 2sd", function()
			TP2(CFrame.new(-7899.6157226563, 5545.6030273438, -422.21798706055))
		end)
		L_19_:AddButton("Sky 3th", function()
			TP2(CFrame.new(-7868.5288085938, 5638.205078125, -1482.5548095703))
		end)
	elseif New_World then
		L_19_:AddButton("Teleport To First Sea", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
		end)
		L_19_:AddButton("Teleport To Third Sea", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
		end)
		L_19_:AddButton("Dock", function()
			TP2(CFrame.new(-12.519311904907, 19.302536010742, 2827.853515625))
		end)
		L_19_:AddButton("Mansion", function()
			TP2(CFrame.new(-390.34829711914, 321.89730834961, 869.00506591797))
		end)
		L_19_:AddButton("Kingdom Of Rose", function()
			TP2(CFrame.new(-388.29895019531, 138.35575866699, 1132.1662597656))
		end)
		L_19_:AddButton("Cafe", function()
			TP2(CFrame.new(-379.70889282227, 73.0458984375, 304.84692382813))
		end)
		L_19_:AddButton("Sunflower Field", function()
			TP2(CFrame.new(-1576.7171630859, 198.61849975586, 13.725157737732))
		end)
		L_19_:AddButton("Jeramy Mountain", function()
			TP2(CFrame.new(1986.3519287109, 448.95678710938, 796.70239257813))
		end)
		L_19_:AddButton("Colossuem", function()
			TP2(CFrame.new(-1871.8974609375, 45.820514678955, 1359.6843261719))
		end)
		L_19_:AddButton("Factory", function()
			TP2(CFrame.new(349.53750610352, 74.446998596191, -355.62420654297))
		end)
		L_19_:AddButton("The Bridge", function()
			TP2(CFrame.new(-1860.6354980469, 88.384948730469, -1859.1593017578))
		end)
		L_19_:AddButton("Green Bit", function()
			TP2(CFrame.new(-2202.3706054688, 73.097663879395, -2819.2687988281))
		end)
		L_19_:AddButton("Graveyard", function()
			TP2(CFrame.new(-5617.5927734375, 492.22183227539, -778.3017578125))
		end)
		L_19_:AddButton("Dark Area", function()
			TP2(CFrame.new(3464.7700195313, 13.375151634216, -3368.90234375))
		end)
		L_19_:AddButton("Snow Mountain", function()
			TP2(CFrame.new(561.23834228516, 401.44781494141, -5297.14453125))
		end)
		L_19_:AddButton("Hot Island", function()
			TP2(CFrame.new(-5505.9633789063, 15.977565765381, -5366.6123046875))
		end)
		L_19_:AddButton("Cold Island", function()
			TP2(CFrame.new(-5924.716796875, 15.977565765381, -4996.427734375))
		end)
		L_19_:AddButton("Ice Castle", function()
			TP2(CFrame.new(6111.7109375, 294.41259765625, -6716.4829101563))
		end)
		L_19_:AddButton("Usopp's Island", function()
			TP2(CFrame.new(4760.4985351563, 8.3444719314575, 2849.2426757813))
		end)
		L_19_:AddButton("inscription Island", function()
			TP2(CFrame.new(-5099.01171875, 98.241539001465, 2424.4035644531))
		end)
		L_19_:AddButton("Forgotten Island", function()
			TP2(CFrame.new(-3051.9514160156, 238.87203979492, -10250.807617188))
		end)
		L_19_:AddButton("Ghost Ship", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
		end)
		L_19_:AddButton("Mini Sky", function()
			TP2(CFrame.new(-262.11901855469, 49325.69140625, -35272.49609375))
		end)
	elseif Three_World then
		L_19_:AddButton("Teleport to First Sea", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
		end)
		L_19_:AddButton("Teleport to Second Sea", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
		end)
		L_19_:AddButton("Port Town", function()
			TP2(CFrame.new(-275.21615600586, 43.755737304688, 5451.0659179688))
		end)
		L_19_:AddButton("Hydra Island", function()
			TP2(CFrame.new(5541.2685546875, 668.30456542969, 195.48069763184))
		end)
		L_19_:AddButton("Gaint Tree", function()
			TP2(CFrame.new(2276.0859375, 25.87850189209, -6493.03125))
		end)
		L_19_:AddButton("Zou Island", function()
			TP2(CFrame.new(-10034.40234375, 331.78845214844, -8319.6923828125))
		end)
		L_19_:AddButton("PineApple Village", function()
			TP2(CFrame.new(-11172.950195313, 331.8049621582, -10151.033203125))
		end)
		L_19_:AddButton("Mansion", function()
			TP2(CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375))
		end)
		L_19_:AddButton("Castle on the Sea", function()
			TP2(CFrame.new(-5498.0458984375, 313.79473876953, -2860.6022949219))
		end)
		L_19_:AddButton("Graveyard Island", function()
			TP2(CFrame.new(-9515.07324, 142.130615, 5537.58398))
		end)
		L_19_:AddButton("Raid Lab", function()
			TP2(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
		end)
		L_19_:AddButton("Mini Sky", function()
			TP2(CFrame.new(-263.66668701172, 49325.49609375, -35260))
		end)
		L_19_:AddButton("Candy Island", function()
			TP2(CFrame.new(-787.857178, 154.602448, -11129.002, -0.849269688, 7.99242095e-09, -0.527959228, 2.16687535e-09, 1, 1.1652717e-08, 0.527959228, 8.75227801e-09, -0.849269688))
		end)
	end
	local L_43_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_43_:Toggle(true)
	L_43_.Tracers = false
	L_43_.Names = false
	L_43_.Boxes = false
	L_10_:AddToggle("Boxes", false, function(L_334_arg0)
		L_43_.Boxes = L_334_arg0
	end)
	L_10_:AddToggle("Nametags", false, function(L_335_arg0)
		L_43_.Names = L_335_arg0
	end)
	L_10_:AddToggle("Tracers", false, function(L_336_arg0)
		L_43_.Tracers = L_336_arg0
	end)
	SelectKillWeapon = ""
	Player = ""
	L_11_:AddDropdown("Selected Player", PlayerName, "", false, function(L_337_arg0)
		SelectedKillPlayer = L_337_arg0
	end)
	L_11_:AddToggle("Spectate Player", false, function(L_338_arg0)
		Spectate = L_338_arg0
		repeat
			game:GetService("RunService").Heartbeat:wait()
			game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(SelectedKillPlayer).Character.Humanoid
		until Spectate == false
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	end)
	L_11_:AddToggle("Safe Mode", false, function(L_339_arg0)
		SafeMode = L_339_arg0
		TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
	end)
	L_11_:AddDropdown("Select Weapon", Wapon, "", false, function(L_340_arg0)
		SelectKillWeapon = L_340_arg0
	end)
	L_11_:AddToggle("Kill Player", false, function(L_341_arg0)
		KillPlayer = L_341_arg0
		TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
	end)
	L_11_:AddToggle("Aimbot Gun", false, function(L_342_arg0)
		Aimbot = L_342_arg0
	end)
	L_11_:AddToggle("Aimbot Skill Nearest", false, function(L_343_arg0)
		AimSkillNearest = L_343_arg0
	end)
	spawn(function()
		while wait(.1) do
			pcall(function()
				local L_344_ = math.huge
				for L_345_forvar0, L_346_forvar1 in pairs(game:GetService("Players"):GetPlayers()) do
					if L_346_forvar1.Name ~= game.Players.LocalPlayer.Name then
						local L_347_ = L_346_forvar1:DistanceFromCharacter(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						if L_347_ < L_344_ then
							L_344_ = L_347_
							TargetPlayerAim = L_346_forvar1.Name
						end
					end
				end
			end)
		end
	end)
	spawn(function()
		pcall(function()
			game:GetService("RunService").RenderStepped:connect(function()
				if AimSkillNearest and TargetPlayerAim ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
					local L_348_ = {
						[1] = game:GetService("Players"):FindFirstChild(TargetPlayerAim).Character.HumanoidRootPart.Position
					}
					game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(L_348_))
				end
			end)
		end)
	end)
	L_11_:AddKeybind("Fly", Enum.KeyCode.R, function(L_349_arg0)
		print(L_349_arg0)
	end, function()
		if flying == false then
			local L_350_ = game.Players.LocalPlayer
			local L_351_ = L_350_:GetMouse()
			localplayer = L_350_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_352_ = Instance.new("Part")
			L_352_.Name = "Core"
			L_352_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_352_.Parent = workspace
				local L_359_ = Instance.new("Weld", L_352_)
				L_359_.Part0 = L_352_
				L_359_.Part1 = localplayer.Character.LowerTorso
				L_359_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_353_ = workspace.Core
			flying = true
			local L_354_ = 10
			local L_355_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_356_
			local L_357_
			local function L_358_func()
				local L_360_ = Instance.new("BodyPosition", L_353_)
				local L_361_ = Instance.new("BodyGyro", L_353_)
				L_360_.Name = "EPIXPOS"
				L_360_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_360_.position = L_353_.Position
				L_361_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_361_.cframe = L_353_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_362_ = L_361_.cframe - L_361_.cframe.p + L_360_.position
					if not L_355_.w and not L_355_.s and not L_355_.a and not L_355_.d then
						L_354_ = 5
					end
					if L_355_.w then
						L_362_ = L_362_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_354_
						L_354_ = L_354_ + 0
					end
					if L_355_.s then
						L_362_ = L_362_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_354_
						L_354_ = L_354_ + 0
					end
					if L_355_.d then
						L_362_ = L_362_ * CFrame.new(L_354_, 0, 0)
						L_354_ = L_354_ + 0
					end
					if L_355_.a then
						L_362_ = L_362_ * CFrame.new(-L_354_, 0, 0)
						L_354_ = L_354_ + 0
					end
					if L_354_ > 10 then
						L_354_ = 5
					end
					L_360_.position = L_362_.p
					if L_355_.w then
						L_361_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_354_ * 0), 0, 0)
					elseif L_355_.s then
						L_361_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_354_ * 0), 0, 0)
					else
						L_361_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_361_ then
					L_361_:Destroy()
				end
				if L_360_ then
					L_360_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_354_ = 10
			end
			L_356_ = L_351_.KeyDown:connect(function(L_363_arg0)
				if not L_353_ or not L_353_.Parent then
					flying = true
					L_356_:disconnect()
					L_357_:disconnect()
					return
				end
				if L_363_arg0 == "w" then
					L_355_.w = true
				elseif L_363_arg0 == "s" then
					L_355_.s = true
				elseif L_363_arg0 == "a" then
					L_355_.a = true
				elseif L_363_arg0 == "d" then
					L_355_.d = true
				end
			end)
			L_357_ = L_351_.KeyUp:connect(function(L_364_arg0)
				if L_364_arg0 == "w" then
					L_355_.w = false
				elseif L_364_arg0 == "s" then
					L_355_.s = false
				elseif L_364_arg0 == "a" then
					L_355_.a = false
				elseif L_364_arg0 == "d" then
					L_355_.d = false
				end
			end)
			L_358_func()
		else
			flying = false
		end
	end)
	L_11_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_11_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_20_:AddToggle("Press Home Button Stop Tween", true, function(L_365_arg0)
		PressHomeStopTween = L_365_arg0
	end)
	if _G.FastAttack == false then
		_G.FastAttack = false
	else
		_G.FastAttack = true
	end
	L_20_:AddToggle("Auto Haki", true, function(L_366_arg0)
		Auto_Haki = L_366_arg0
	end)
	L_20_:AddToggle("Auto Observation Haki", false, function(L_367_arg0)
		AutoObservation = L_367_arg0
	end)
	L_20_:AddLabel("Auto Farm Setting")
	if _G.LevelMax then
	else
		_G.LevelMax = 2200
	end
	L_20_:AddSlider("Level Lock", 1, 1, 2200, 1, function(L_368_arg0)
		LevelLock = L_368_arg0
	end)
	L_20_:AddToggle("LevelLock Kick", false, function(L_369_arg0)
		LevelLockKick = L_369_arg0
	end)
	L_20_:AddToggle("LevelLock CloseGame", _G.LevelLock, function(L_370_arg0)
		LevelLockClose = L_370_arg0
	end)
	L_20_:AddToggle("BringMob/Magnet", true, function(L_371_arg0)
		Magnet = L_371_arg0
	end)
	L_20_:AddLabel("Auto Farm Mastery Setting")
	L_20_:AddToggle("Skill Z", true, function(L_372_arg0)
		SkillZ = L_372_arg0
	end)
	L_20_:AddToggle("Skill X", true, function(L_373_arg0)
		SkillX = L_373_arg0
	end)
	L_20_:AddToggle("Skill C", true, function(L_374_arg0)
		SkillC = L_374_arg0
	end)
	L_20_:AddToggle("Skill V", true, function(L_375_arg0)
		SkillV = L_375_arg0
	end)
	local L_44_ = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		L_44_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		L_44_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
end
local L_1_ = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	L_1_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	wait(1)
	L_1_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)


setfpscap(1000)
if game.PlaceId == 142823291 then
	local L_376_ = game.Players.LocalPlayer
	local L_377_ = game.Players.LocalPlayer
	local L_378_ = game:GetService("UserInputService")
	local L_379_ = {}
	function GodModeFunc()
		if L_377_.Character then
			if L_377_.Character:FindFirstChild("Humanoid") then
				for L_390_forvar0, L_391_forvar1 in pairs(L_377_.Character.Humanoid:GetAccessories()) do
					table.insert(L_379_, L_391_forvar1:Clone())
				end
				L_377_.Character.Humanoid.Name = "1"
			end
			local L_388_ = L_377_.Character["1"]:Clone()
			L_388_.Parent = L_377_.Character
			L_388_.Name = "Humanoid";
			wait(0.1)
			L_377_.Character["1"]:Destroy()
			workspace.CurrentCamera.CameraSubject = L_377_.Character.Humanoid
			for L_392_forvar0, L_393_forvar1 in pairs(L_379_) do
				L_377_.Character.Humanoid:AddAccessory(L_393_forvar1)
			end
			L_377_.Character.Animate.Disabled = true
			wait(0.1)
			L_377_.Character.Animate.Disabled = false
		--Tag:
			local L_389_ = Instance.new("BoolValue", L_377_.Character)
			L_389_.Name = "GodMode"
			L_389_.Value = true
			spawn(function()
				local L_394_ = false
				local L_395_ = false
				L_377_.Character.Humanoid.Died:connect(function()
					L_395_ = true
				end)
				L_378_.InputBegan:connect(function(L_396_arg0, L_397_arg1)
					if  not L_397_arg1 and not L_395_ then
						L_394_ = false
						spawn(function()
							repeat
								game:GetService("RunService").RenderStepped:Wait()
							until not L_394_ or L_395_
						end)
					else
						repeat
							game:GetService("RunService").RenderStepped:Wait()
						until not L_394_
					end
				end)
				L_378_.InputEnded:connect(function(L_398_arg0, L_399_arg1)
					if  not L_399_arg1 and not L_395_ then
						L_394_ = false
					end
				end)
			end)
		end
	end
	mm2 = {
		Coin = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_380_ = lib:CreateWindow("Murder Mystery 2 ", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_381_ = L_380_:CreateTab("Main")
	local L_382_ = L_381_:CreateSector("Player", "left")
	local L_383_ = L_381_:CreateSector("AutoFarm", "right")
	local L_384_ = L_381_:CreateSector("Emotes", "left")
	local L_385_ = L_381_:CreateSector("Teleports", "right")
	local L_386_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_386_:Toggle(true)
	L_386_.Tracers = false
	L_386_.Names = false
	L_386_.Boxes = false
	function people(L_400_arg0)
		if game:GetService("Players")[L_400_arg0.Name].Backpack:FindFirstChild("Knife") or game.Workspace[L_400_arg0.Name]:FindFirstChild("Knife") then
			return  Murder.Name
		end
		if game:GetService("Players")[L_400_arg0.Name].Backpack:FindFirstChild("Gun") or game:GetService("Players")[L_400_arg0.Name].Backpack:FindFirstChild("Revolver") or game.Workspace[L_400_arg0.Name]:FindFirstChild("Revolver") or game.Workspace[L_400_arg0.Name]:FindFirstChild("Gun") then
			return CowBoy.Name
		end
		return Color3.fromRGB(0, 255, 0)
	end
	L_386_.Overrides.GetColor = function(L_401_arg0)
		if game:GetService("Players")[L_401_arg0.Name].Backpack:FindFirstChild("Knife") or game.Workspace[L_401_arg0.Name]:FindFirstChild("Knife") then
			return Color3.fromRGB(255, 0, 0)
		end -- yes i use it deal with it i like this method
		if game:GetService("Players")[L_401_arg0.Name].Backpack:FindFirstChild("Gun") or game:GetService("Players")[L_401_arg0.Name].Backpack:FindFirstChild("Revolver") or game.Workspace[L_401_arg0.Name]:FindFirstChild("Revolver") or game.Workspace[L_401_arg0.Name]:FindFirstChild("Gun") then
			return Color3.fromRGB(0, 0, 255)
		end
	end
	L_382_:AddToggle("Boxes", false, function(L_402_arg0)
		L_386_.Boxes = L_402_arg0
	end)
	L_382_:AddToggle("Nametags", false, function(L_403_arg0)
		L_386_.Names = L_403_arg0
	end)
	L_382_:AddToggle("Tracers", false, function(L_404_arg0)
		L_386_.Tracers = L_404_arg0
	end)
	L_382_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_405_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_405_arg0
	end)
	L_382_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_406_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_406_arg0
	end)
	L_382_:AddKeybind("Fly", Enum.KeyCode.F, function(L_407_arg0)
		print(L_407_arg0)
	end, function()
		if flying == false then
			local L_408_ = game.Players.LocalPlayer
			local L_409_ = L_408_:GetMouse()
			localplayer = L_408_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_410_ = Instance.new("Part")
			L_410_.Name = "Core"
			L_410_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_410_.Parent = workspace
				local L_417_ = Instance.new("Weld", L_410_)
				L_417_.Part0 = L_410_
				L_417_.Part1 = localplayer.Character.LowerTorso
				L_417_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_411_ = workspace.Core
			flying = true
			local L_412_ = 10
			local L_413_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_414_
			local L_415_
			local function L_416_func()
				local L_418_ = Instance.new("BodyPosition", L_411_)
				local L_419_ = Instance.new("BodyGyro", L_411_)
				L_418_.Name = "EPIXPOS"
				L_418_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_418_.position = L_411_.Position
				L_419_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_419_.cframe = L_411_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_420_ = L_419_.cframe - L_419_.cframe.p + L_418_.position
					if not L_413_.w and not L_413_.s and not L_413_.a and not L_413_.d then
						L_412_ = 5
					end
					if L_413_.w then
						L_420_ = L_420_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_412_
						L_412_ = L_412_ + 0
					end
					if L_413_.s then
						L_420_ = L_420_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_412_
						L_412_ = L_412_ + 0
					end
					if L_413_.d then
						L_420_ = L_420_ * CFrame.new(L_412_, 0, 0)
						L_412_ = L_412_ + 0
					end
					if L_413_.a then
						L_420_ = L_420_ * CFrame.new(-L_412_, 0, 0)
						L_412_ = L_412_ + 0
					end
					if L_412_ > 10 then
						L_412_ = 5
					end
					L_418_.position = L_420_.p
					if L_413_.w then
						L_419_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_412_ * 0), 0, 0)
					elseif L_413_.s then
						L_419_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_412_ * 0), 0, 0)
					else
						L_419_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_419_ then
					L_419_:Destroy()
				end
				if L_418_ then
					L_418_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_412_ = 10
			end
			L_414_ = L_409_.KeyDown:connect(function(L_421_arg0)
				if not L_411_ or not L_411_.Parent then
					flying = true
					L_414_:disconnect()
					L_415_:disconnect()
					return
				end
				if L_421_arg0 == "w" then
					L_413_.w = true
				elseif L_421_arg0 == "s" then
					L_413_.s = true
				elseif L_421_arg0 == "a" then
					L_413_.a = true
				elseif L_421_arg0 == "d" then
					L_413_.d = true
				end
			end)
			L_415_ = L_409_.KeyUp:connect(function(L_422_arg0)
				if L_422_arg0 == "w" then
					L_413_.w = false
				elseif L_422_arg0 == "s" then
					L_413_.s = false
				elseif L_422_arg0 == "a" then
					L_413_.a = false
				elseif L_422_arg0 == "d" then
					L_413_.d = false
				end
			end)
			L_416_func()
		else
			flying = false
		end
	end)
	L_382_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_382_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	function tween_teleport(L_423_arg0)
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		Move = game:GetService("TweenService"):Create(L_376_.Character.HumanoidRootPart, TweenInfo.new(((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_423_arg0.p).Magnitude / 70), Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			CFrame = L_423_arg0
		})
		Move:Play()
		Move.Completed:wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
	end
	function FindMap()
		for L_424_forvar0, L_425_forvar1 in pairs(workspace:GetChildren()) do
			if L_425_forvar1:FindFirstChild("CoinContainer") then
				return L_425_forvar1.CoinContainer
			elseif L_425_forvar1:FindFirstChild("Map") then
				if pcall(function()
					local L_426_ = L_425_forvar1.Map.CoinContainer
				end) then
					return L_425_forvar1.Map.CoinContainer
				end
			end
		end
		return false
	end
	function Coin_Farm()
		while mm2["Coin"] == true do
			local L_427_ = FindMap()
			if L_427_ then
				local L_428_ = false
				pcall(function()
					if game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game:findFirstChild("EarnedXP") and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game:findFirstChild("EarnedXP").Visible == true then
						L_428_ = true
					end
				end)
				if L_428_ then
					pcall(function()
						local L_429_ = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_427_['Coin_Server'].Coin.Position).Magnitude
						local L_430_ = L_427_['Coin_Server']
						for L_431_forvar0, L_432_forvar1 in pairs(L_427_:GetChildren()) do
							if L_432_forvar1.Name == 'Coin_Server' then
								if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_432_forvar1.Coin.Position).Magnitude < L_429_ then
									L_429_ = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_432_forvar1.Coin.Position).Magnitude;
									L_430_ = L_432_forvar1;
								end
							end
						end
						tween_teleport(CFrame.new(L_430_.Coin.CFrame.p))
						spawn(function()
							wait(5)
							L_430_.Name = 'False_Coin'
						end)
						repeat
							wait()
						until (L_430_.Name ~= 'Coin_Server')
						wait(1)
					end)
				end
			end
			wait()
		end
	end
	L_383_:AddToggle("CoinFarm", false, function(L_433_arg0)
		if L_433_arg0 == true then
			mm2["Coin"] = true
			spawn(Coin_Farm)
		elseif L_433_arg0 == false then
			mm2["Coin"] = false
		end
	end)
	L_383_:AddToggle("GodMode", false, function(L_434_arg0)
		getgenv().GodMode = L_434_arg0
		spawn(function()
			while GodMode do
				wait()
				pcall(function()
					if  mm2["Coin"] == true  and L_377_.PlayerGui.MainGUI.Game.CashBag.Visible and not L_377_.PlayerGui.MainGUI.Game.CashBag.Full.Visible and L_377_.Character and L_377_.Character:FindFirstChild("HumanoidRootPart") then
						if getgenv().GodMode and not L_377_.Character:FindFirstChild("GodMode") then
							GodModeFunc()
						end
					end
				end)
			end
		end)
	end)
	L_383_:AddToggle("Tp Coin Bag Full", false, function(L_435_arg0)
		getgenv().Tp = L_435_arg0
		spawn(function()
			while Tp do
				wait()
				pcall(function()
					if  getgenv().Tp and L_377_.PlayerGui.MainGUI.Game.CashBag.Full.Visible then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-95.3000259, 135.550064, 21.8999672, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					end
				end)
			end
		end)
	end)
	L_383_:AddToggle("Auto Grab Gun", false, function(L_436_arg0)
		getgenv().GrabGun = L_436_arg0
		spawn(function()
			while wait (1) do
				pcall(function()
					if getgenv().GrabGun then
						local L_437_ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X
						local L_438_ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
						local L_439_ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
						if workspace:FindFirstChild("GunDrop") ~= nil then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("GunDrop").CFrame
							wait(0.3)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(L_437_, L_438_, L_439_)
						end
					end
				end)
			end
		end)
	end)
	L_383_:AddToggle("KillAlll", false, function(L_440_arg0)
		getgenv().KillAll = L_440_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if getgenv().KillAll then
				elseif game.Players.LocalPlayer.Backpack["Knife"] then
					for L_442_forvar0, L_443_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if L_443_forvar1.name == "Knife" then
							L_443_forvar1.Parent = game.Players.LocalPlayer.Character
						end
					end
					for L_444_forvar0 , L_445_forvar1 in pairs(game.Players:GetPlayers()) do
						L_445_forvar1.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					end
					local L_441_ = {
						[1] = "Slash"
					}
					game:GetService("Players").LocalPlayer.Character.Knife.Stab:FireServer(unpack(L_441_))
				end
			end)
		end
	end)
	L_384_:AddButton("Floss", function()
		game:GetService("ReplicatedStorage").PlayEmote:Fire("floss")
	end)
	L_384_:AddButton("Zen", function()
		game:GetService("ReplicatedStorage").PlayEmote:Fire("zen")
	end)
	L_384_:AddButton("Sit", function()
		game:GetService("ReplicatedStorage").PlayEmote:Fire("sit")
	end)
	L_384_:AddButton("Dab", function()
		game:GetService("ReplicatedStorage").PlayEmote:Fire("dab")
	end)

	L_385_:AddButton("Lobby", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-95.3000259, 135.550064, 21.8999672, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	end)

	L_385_:AddButton("To Sheriff", function()
		local L_446_ = game:GetService("Players")
		for L_447_forvar0, L_448_forvar1 in pairs(L_446_:GetPlayers()) do
			local L_449_ = L_448_forvar1.Backpack:GetChildren()
			for L_450_forvar0, L_451_forvar1 in pairs(L_449_) do
				if L_451_forvar1.Name == "Gun" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[L_451_forvar1.Parent.Parent.Name].Character.HumanoidRootPart.CFrame
				end
			end
		end
	end)

	L_385_:AddButton("To Murderer", function()
		local L_452_ = game:GetService("Players")
		for L_453_forvar0, L_454_forvar1 in pairs(L_452_:GetPlayers()) do
			local L_455_ = L_454_forvar1.Backpack:GetChildren()
			for L_456_forvar0, L_457_forvar1 in pairs(L_455_) do
				if L_457_forvar1.Name == "Knife" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[L_457_forvar1.Parent.Parent.Name].Character.HumanoidRootPart.CFrame
				end
			end
		end
	end)
	local L_387_ = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		L_387_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		L_387_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
end
if game.PlaceId == 189707 then
	local L_458_ = {
		AutoFarmForever = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_459_ = lib:CreateWindow("Bacon hub | Natural Disaster Surivial", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_460_ = L_459_:CreateTab("Main")
	local L_461_ = L_459_:CreateTab("Misc")
	local L_462_ = L_461_:CreateSector("ESP", "right")
	local L_463_ = L_461_:CreateSector("Universals", "left")
	local L_464_ = L_460_:CreateSector("AutoFarm", "left")
	local L_465_ = L_460_:CreateSector("Teleports", "right")
	local L_466_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_466_:Toggle(true)
	L_466_.Tracers = false
	L_466_.Names = false
	L_466_.Boxes = false
	L_462_:AddToggle("Boxes", false, function(L_468_arg0)
		L_466_.Boxes = L_468_arg0
	end)
	L_462_:AddToggle("Nametags", false, function(L_469_arg0)
		L_466_.Names = L_469_arg0
	end)
	L_462_:AddToggle("Tracers", false, function(L_470_arg0)
		L_466_.Tracers = L_470_arg0
	end)
	L_463_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_471_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_471_arg0
	end)
	L_463_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_472_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_472_arg0
	end)
	L_463_:AddKeybind("No Clip", Enum.KeyCode.R, function(L_473_arg0)
		print(L_473_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_463_:AddKeybind("Fly", Enum.KeyCode.F, function(L_474_arg0)
		print(L_474_arg0)
	end, function()
		if flying == false then
			local L_475_ = game.Players.LocalPlayer
			local L_476_ = L_475_:GetMouse()
			localplayer = L_475_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_477_ = Instance.new("Part")
			L_477_.Name = "Core"
			L_477_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_477_.Parent = workspace
				local L_484_ = Instance.new("Weld", L_477_)
				L_484_.Part0 = L_477_
				L_484_.Part1 = localplayer.Character.LowerTorso
				L_484_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_478_ = workspace.Core
			flying = true
			local L_479_ = 10
			local L_480_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_481_
			local L_482_
			local function L_483_func()
				local L_485_ = Instance.new("BodyPosition", L_478_)
				local L_486_ = Instance.new("BodyGyro", L_478_)
				L_485_.Name = "EPIXPOS"
				L_485_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_485_.position = L_478_.Position
				L_486_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_486_.cframe = L_478_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_487_ = L_486_.cframe - L_486_.cframe.p + L_485_.position
					if not L_480_.w and not L_480_.s and not L_480_.a and not L_480_.d then
						L_479_ = 5
					end
					if L_480_.w then
						L_487_ = L_487_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_479_
						L_479_ = L_479_ + 0
					end
					if L_480_.s then
						L_487_ = L_487_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_479_
						L_479_ = L_479_ + 0
					end
					if L_480_.d then
						L_487_ = L_487_ * CFrame.new(L_479_, 0, 0)
						L_479_ = L_479_ + 0
					end
					if L_480_.a then
						L_487_ = L_487_ * CFrame.new(-L_479_, 0, 0)
						L_479_ = L_479_ + 0
					end
					if L_479_ > 10 then
						L_479_ = 5
					end
					L_485_.position = L_487_.p
					if L_480_.w then
						L_486_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_479_ * 0), 0, 0)
					elseif L_480_.s then
						L_486_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_479_ * 0), 0, 0)
					else
						L_486_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_486_ then
					L_486_:Destroy()
				end
				if L_485_ then
					L_485_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_479_ = 10
			end
			L_481_ = L_476_.KeyDown:connect(function(L_488_arg0)
				if not L_478_ or not L_478_.Parent then
					flying = true
					L_481_:disconnect()
					L_482_:disconnect()
					return
				end
				if L_488_arg0 == "w" then
					L_480_.w = true
				elseif L_488_arg0 == "s" then
					L_480_.s = true
				elseif L_488_arg0 == "a" then
					L_480_.a = true
				elseif L_488_arg0 == "d" then
					L_480_.d = true
				end
			end)
			L_482_ = L_476_.KeyUp:connect(function(L_489_arg0)
				if L_489_arg0 == "w" then
					L_480_.w = false
				elseif L_489_arg0 == "s" then
					L_480_.s = false
				elseif L_489_arg0 == "a" then
					L_480_.a = false
				elseif L_489_arg0 == "d" then
					L_480_.d = false
				end
			end)
			L_483_func()
		else
			flying = false
		end
	end)
	L_463_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_463_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_464_:AddToggle("AutoFarm Forever", false, function(L_490_arg0)
		L_458_.AutoFarmForever = L_490_arg0
	end)
	spawn(function()
		while wait (0.4) do
			pcall(function()
				if L_458_.AutoFarmForever == true then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-241.711945, 179.598007, 299.103973)
				end
			end)
		end
	end)
	L_464_:AddButton("AutoChat Next Diaster", function()
		local L_491_ = game:GetService("Players").LocalPlayer.Character
		local L_492_ = L_491_:FindFirstChild("SurvivalTag")
		if L_492_ then
			local L_494_ = {
				[1] = "WARNING! The Disaster is: " .. L_492_.Value,
				[2] = "All"
			}
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(L_494_))
		end
		local function L_493_func(L_495_arg0)
			L_495_arg0.ChildAdded:connect(
               function(L_496_arg0)
				if L_496_arg0.Name == "SurvivalTag" then
					local L_497_ = {
						[1] = "WARNING! The Disaster is: " .. L_496_arg0.Value,
						[2] = "All"
					}
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(L_497_))
				end
			end
           )
		end
		L_493_func(L_491_)
		game:GetService("Players").LocalPlayer.CharacterAdded:connect(
           function(L_498_arg0)
			L_493_func(L_498_arg0)
		end)
	end)
	L_464_:AddButton("No Fall Damage", function()
		spawn(function()
			while wait () do
				game.Players.LocalPlayer.Character.FallDamageScript:Destroy()
			end
		end)
	end)
	L_464_:AddButton("Enable Vote Gui", function()
		votemenu = game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage
		votemenu.Visible = true
	end)
	L_464_:AddButton("Disable Vote Gui", function()
		votemenu = game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage
		votemenu.Visible = false
	end)
	L_465_:AddButton("Lobby", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-241.711945, 179.598007, 299.103973)
	end)
	L_465_:AddButton("Main Map", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-132.340561, 47.3980064, 1.86407304)
	end)
	L_465_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
	local L_467_ = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		L_467_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		L_467_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
end
if game.PlaceId == 566399244 or game.PlaceId == 2569625809 then
	local L_499_ = {
		AutoFarm = false,
		AutoShard = false,
		AutoDiamonds = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_500_ = lib:CreateWindow("Bacon Hub | Elemental BattleGrounds", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_501_ = L_500_:CreateTab("Auto Farm")
	local L_502_ = L_500_:CreateTab('Misc')
	local L_503_ = L_501_:CreateSector("Main Functions", "left")
	local L_504_ = L_502_:CreateSector("Universal", "left")
	local L_505_ = {}
	local L_506_ = game:GetService("Players")
	local L_507_ = L_506_.LocalPlayer
	firsttime = true
	L_504_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_510_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_510_arg0
	end)
	L_504_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_511_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_511_arg0
	end)
	L_504_:AddKeybind("No Clip", Enum.KeyCode.R, function(L_512_arg0)
		print(L_512_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_504_:AddKeybind("Fly", Enum.KeyCode.F, function(L_513_arg0)
		print(L_513_arg0)
	end, function()
		if flying == false then
			local L_514_ = game.Players.LocalPlayer
			local L_515_ = L_514_:GetMouse()
			localplayer = L_514_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_516_ = Instance.new("Part")
			L_516_.Name = "Core"
			L_516_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_516_.Parent = workspace
				local L_523_ = Instance.new("Weld", L_516_)
				L_523_.Part0 = L_516_
				L_523_.Part1 = localplayer.Character.LowerTorso
				L_523_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_517_ = workspace.Core
			flying = true
			local L_518_ = 10
			local L_519_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_520_
			local L_521_
			local function L_522_func()
				local L_524_ = Instance.new("BodyPosition", L_517_)
				local L_525_ = Instance.new("BodyGyro", L_517_)
				L_524_.Name = "EPIXPOS"
				L_524_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_524_.position = L_517_.Position
				L_525_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_525_.cframe = L_517_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_526_ = L_525_.cframe - L_525_.cframe.p + L_524_.position
					if not L_519_.w and not L_519_.s and not L_519_.a and not L_519_.d then
						L_518_ = 5
					end
					if L_519_.w then
						L_526_ = L_526_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_518_
						L_518_ = L_518_ + 0
					end
					if L_519_.s then
						L_526_ = L_526_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_518_
						L_518_ = L_518_ + 0
					end
					if L_519_.d then
						L_526_ = L_526_ * CFrame.new(L_518_, 0, 0)
						L_518_ = L_518_ + 0
					end
					if L_519_.a then
						L_526_ = L_526_ * CFrame.new(-L_518_, 0, 0)
						L_518_ = L_518_ + 0
					end
					if L_518_ > 10 then
						L_518_ = 5
					end
					L_524_.position = L_526_.p
					if L_519_.w then
						L_525_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_518_ * 0), 0, 0)
					elseif L_519_.s then
						L_525_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_518_ * 0), 0, 0)
					else
						L_525_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_525_ then
					L_525_:Destroy()
				end
				if L_524_ then
					L_524_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_518_ = 10
			end
			L_520_ = L_515_.KeyDown:connect(function(L_527_arg0)
				if not L_517_ or not L_517_.Parent then
					flying = true
					L_520_:disconnect()
					L_521_:disconnect()
					return
				end
				if L_527_arg0 == "w" then
					L_519_.w = true
				elseif L_527_arg0 == "s" then
					L_519_.s = true
				elseif L_527_arg0 == "a" then
					L_519_.a = true
				elseif L_527_arg0 == "d" then
					L_519_.d = true
				end
			end)
			L_521_ = L_515_.KeyUp:connect(function(L_528_arg0)
				if L_528_arg0 == "w" then
					L_519_.w = false
				elseif L_528_arg0 == "s" then
					L_519_.s = false
				elseif L_528_arg0 == "a" then
					L_519_.a = false
				elseif L_528_arg0 == "d" then
					L_519_.d = false
				end
			end)
			L_522_func()
		else
			flying = false
		end
	end)
	L_504_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_504_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_503_:AddToggle("AutoFarm", false, function(L_529_arg0)
		L_499_.AutoFarm = L_529_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_499_.AutoFarm == true then
					game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
				end
			end)
		end
	end)
	wait(1)
	local L_508_ = 3000
	function tp(...)
		local L_530_ = game.Players.LocalPlayer
		local L_531_ = {
			...
		}
		if typeof(L_531_[1]) == "number" and L_531_[2] and L_531_[3] then
			L_531_ = Vector3.new(L_531_[1], L_531_[2], L_531_[3])
		elseif typeof(L_531_[1]) == "Vector3" then
			L_531_ = L_531_[1]
		elseif typeof(L_531_[1]) == "CFrame" then
			L_531_ = L_531_[1].Position
		end
		local L_532_ = (L_530_.Character.HumanoidRootPart.Position - L_531_).Magnitude
		game:GetService("TweenService"):Create(
       L_530_.Character.HumanoidRootPart,
       TweenInfo.new(L_532_ / L_508_, Enum.EasingStyle.Linear),
       {
			CFrame = CFrame.new(L_531_)
		}
   ):Play()
	end
	tp(-638.353638, -58.3049469, 757.653931, -0.709312856, -2.77422252e-11, 0.704893827, 6.66586893e-15, 1, 3.93633112e-11, -0.704893827, 2.79256011e-11, -0.709312856)
	wait(0.3)
	local L_509_ = Instance.new("Part")
	L_509_.Parent = workspace
	L_509_.Size = Vector3.new(80, 1, 80)
	L_509_.Anchored = true
	L_509_.Name = "Baseplate"
	L_509_.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, -2, 0)
	wait(1.5)
	spawn(function()
		while wait () do
			pcall(function()
				if L_499_.AutoFarm == true then
					game:GetService("ReplicatedStorage").Remotes.DoClientMagic:FireServer("Fire", "Consecutive Fire Bullets")
					game:GetService("ReplicatedStorage").Remotes.DoMagic:InvokeServer("Fire", "Consecutive Fire Bullets")
					game:GetService("ReplicatedStorage").Remotes.DoClientMagic:FireServer("Fire", "Great Fire Blast")
					game:GetService("ReplicatedStorage").Remotes.DoMagic:InvokeServer("Fire", "Great Fire Blast")
				end
			end)
		end
	end)
	spawn(function()
		while wait (5) do
			pcall(function()
				if L_499_.AutoFarm == true then
					local L_533_ = 3000
					function tp(...)
						local L_534_ = game.Players.LocalPlayer
						local L_535_ = {
							...
						}
						if typeof(L_535_[1]) == "number" and L_535_[2] and L_535_[3] then
							L_535_ = Vector3.new(L_535_[1], L_535_[2], L_535_[3])
						elseif typeof(L_535_[1]) == "Vector3" then
							L_535_ = L_535_[1]
						elseif typeof(L_535_[1]) == "CFrame" then
							L_535_ = L_535_[1].Position
						end
						local L_536_ = (L_534_.Character.HumanoidRootPart.Position - L_535_).Magnitude
						game:GetService("TweenService"):Create(
       L_534_.Character.HumanoidRootPart,
       TweenInfo.new(L_536_ / L_533_, Enum.EasingStyle.Linear),
       {
							CFrame = CFrame.new(L_535_)
						}
   ):Play()
					end
					tp(-638.353638, -58.3049469, 757.653931, -0.709312856, -2.77422252e-11, 0.704893827, 6.66586893e-15, 1, 3.93633112e-11, -0.704893827, 2.79256011e-11, -0.709312856)
				end
			end)
		end
	end)
	L_503_:AddToggle("AutoShard", false, function(L_537_arg0)
		L_499_.AutoShard = L_537_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_499_.AutoShard == true then
					game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace")[".Ignore"][".ServerEffects"]:WaitForChild("Shard").CFrame
				end
			end)
		end
	end)
	L_503_:AddToggle("AutoDiamonds", false, function(L_538_arg0)
		L_499_.AutoDiamonds = L_538_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_499_.AutoDiamonds == true then
					game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace")[".Ignore"][".ServerEffects"]:WaitForChild("Diamond").CFrame
				end
			end)
		end
	end)
	L_503_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
end 
if game.PlaceId == 137885680 or game.PlaceId == 4301323950 then
	local L_539_ = {
		AutoFarm = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_540_ = lib:CreateWindow("Bacon hub | Zombie Rush", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_541_ = L_540_:CreateTab("Main")
	local L_542_ = L_541_:CreateSector("AutoFarming", "left")
	local L_543_ = L_541_:CreateSector("ESP", "right")
	local L_544_ = L_541_:CreateSector("Universal", "left")
	local L_545_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_545_:Toggle(true)
	L_545_.Tracers = false
	L_545_.Names = false
	L_545_.Boxes = false
	L_543_:AddToggle("Boxes", false, function(L_546_arg0)
		L_545_.Boxes = L_546_arg0
	end)
	L_543_:AddToggle("Nametags", false, function(L_547_arg0)
		L_545_.Names = L_547_arg0
	end)
	L_543_:AddToggle("Tracers", false, function(L_548_arg0)
		L_545_.Tracers = L_548_arg0
	end)
	L_544_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_549_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_549_arg0
	end)
	L_544_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_550_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_550_arg0
	end)
	L_544_:AddKeybind("No Clip", Enum.KeyCode.R, function(L_551_arg0)
		print(L_551_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_544_:AddKeybind("Fly", Enum.KeyCode.F, function(L_552_arg0)
		print(L_552_arg0)
	end, function()
		if flying == false then
			local L_553_ = game.Players.LocalPlayer
			local L_554_ = L_553_:GetMouse()
			localplayer = L_553_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_555_ = Instance.new("Part")
			L_555_.Name = "Core"
			L_555_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_555_.Parent = workspace
				local L_562_ = Instance.new("Weld", L_555_)
				L_562_.Part0 = L_555_
				L_562_.Part1 = localplayer.Character.LowerTorso
				L_562_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_556_ = workspace.Core
			flying = true
			local L_557_ = 10
			local L_558_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_559_
			local L_560_
			local function L_561_func()
				local L_563_ = Instance.new("BodyPosition", L_556_)
				local L_564_ = Instance.new("BodyGyro", L_556_)
				L_563_.Name = "EPIXPOS"
				L_563_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_563_.position = L_556_.Position
				L_564_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_564_.cframe = L_556_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_565_ = L_564_.cframe - L_564_.cframe.p + L_563_.position
					if not L_558_.w and not L_558_.s and not L_558_.a and not L_558_.d then
						L_557_ = 5
					end
					if L_558_.w then
						L_565_ = L_565_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_557_
						L_557_ = L_557_ + 0
					end
					if L_558_.s then
						L_565_ = L_565_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_557_
						L_557_ = L_557_ + 0
					end
					if L_558_.d then
						L_565_ = L_565_ * CFrame.new(L_557_, 0, 0)
						L_557_ = L_557_ + 0
					end
					if L_558_.a then
						L_565_ = L_565_ * CFrame.new(-L_557_, 0, 0)
						L_557_ = L_557_ + 0
					end
					if L_557_ > 10 then
						L_557_ = 5
					end
					L_563_.position = L_565_.p
					if L_558_.w then
						L_564_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_557_ * 0), 0, 0)
					elseif L_558_.s then
						L_564_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_557_ * 0), 0, 0)
					else
						L_564_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_564_ then
					L_564_:Destroy()
				end
				if L_563_ then
					L_563_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_557_ = 10
			end
			L_559_ = L_554_.KeyDown:connect(function(L_566_arg0)
				if not L_556_ or not L_556_.Parent then
					flying = true
					L_559_:disconnect()
					L_560_:disconnect()
					return
				end
				if L_566_arg0 == "w" then
					L_558_.w = true
				elseif L_566_arg0 == "s" then
					L_558_.s = true
				elseif L_566_arg0 == "a" then
					L_558_.a = true
				elseif L_566_arg0 == "d" then
					L_558_.d = true
				end
			end)
			L_560_ = L_554_.KeyUp:connect(function(L_567_arg0)
				if L_567_arg0 == "w" then
					L_558_.w = false
				elseif L_567_arg0 == "s" then
					L_558_.s = false
				elseif L_567_arg0 == "a" then
					L_558_.a = false
				elseif L_567_arg0 == "d" then
					L_558_.d = false
				end
			end)
			L_561_func()
		else
			flying = false
		end
	end)
	L_544_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_544_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_542_:AddToggle("AutoFarm", false, function(L_568_arg0)
		L_539_.AutoFarm = L_568_arg0
	end)
	game:GetService("RunService").Stepped:connect(function()
		if L_539_.AutoFarm == true then
			game.workspace.Gravity = 0
		end
	end)
	L_542_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
	spawn(function()
		while wait (1) do
			pcall(function()
				if L_539_.AutoFarm == true then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-153.47319, 52.5, -4828.72021, -0.998862445, 4.47831461e-08, 0.0476949513, 4.73453277e-08, 1, 5.25903197e-08, -0.0476949513, 5.47886252e-08, -0.998862445)
				end
			end)
		end
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_539_.AutoFarm == true then
					for L_569_forvar0, L_570_forvar1 in pairs(workspace["Zombie Storage"]:GetChildren()) do
						wait()
						if L_570_forvar1:FindFirstChild("Head") then
							local L_571_ = {
								[1] = {
									["LaserProperties"] = {
										[1] = {
											[1] = "Neon",
											[2] = BrickColor.new(1003),
											[3] = Vector3.new(0, 0, 0),
											[4] = CFrame.new(Vector3.new(121, 200, 4869), Vector3.new(0, 0, -1)),
											[5] = Vector3.new(150.73249816895, 24.428089141846, 114.7022857666),
											[6] = 9000000000,
											[7] = true,
											[8] = Vector3.new(0, 0, 0)
										}
									},
									["RealTool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"),
									["Tool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"),
									["HumanoidTables"] = {
										[1] = {
											["HeadHits"] = 10,
											["THumanoid"] = L_570_forvar1.Humanoid,
											["BodyHits"] = 0
										}
									}
								}
							}
							game:GetService("ReplicatedStorage").Remotes.WeaponEvent:FireServer(unpack(L_571_))
							for L_572_forvar0, L_573_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if L_573_forvar1.ClassName == "Tool" and L_573_forvar1:FindFirstChild("GunController") then
									L_573_forvar1.Parent = game.Players.LocalPlayer.Character
								end
							end
						end
					end
				end
			end)
		end
	end)
end 




if game.PlaceId == 920587237 then
	for L_588_forvar0, L_589_forvar1 in pairs(debug.getupvalue(require(game:service'ReplicatedStorage'.Fsys).load("RouterClient").init, 4)) do
		L_589_forvar1.Name = L_588_forvar0
	end
	local L_574_ = {
		BabyAutoFarm = false,
		AutoPayCheck = false,
		HealOthers = false,
		InstantTradeBadge = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_575_ = lib:CreateWindow("Bacon hub | Adopt Me!", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_576_ = L_575_:CreateTab("Auto Farm")
	local L_577_ = L_575_:CreateTab("Teleports")
	local L_578_ = L_575_:CreateTab('Misc')
	local L_579_ = L_576_:CreateSector("Main Functions", "left")
	local L_580_ = L_576_:CreateSector("Buy Eggs", "right")
	local L_581_ = L_577_:CreateSector("Misc", "left")
	local L_582_ = L_577_:CreateSector("Teleport", "right")
	local L_583_ = L_578_:CreateSector("Universal", "left")
	local L_584_ = {}
	local L_585_ = game:GetService("Players")
	local L_586_ = L_585_.LocalPlayer
	firsttime = true
	L_583_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_590_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_590_arg0
	end)
	L_583_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_591_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_591_arg0
	end)
	L_583_:AddKeybind("No Clip", Enum.KeyCode.R, function(L_592_arg0)
		print(L_592_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_583_:AddKeybind("Fly", Enum.KeyCode.F, function(L_593_arg0)
		print(L_593_arg0)
	end, function()
		if flying == false then
			local L_594_ = game.Players.LocalPlayer
			local L_595_ = L_594_:GetMouse()
			localplayer = L_594_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_596_ = Instance.new("Part")
			L_596_.Name = "Core"
			L_596_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_596_.Parent = workspace
				local L_603_ = Instance.new("Weld", L_596_)
				L_603_.Part0 = L_596_
				L_603_.Part1 = localplayer.Character.LowerTorso
				L_603_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_597_ = workspace.Core
			flying = true
			local L_598_ = 10
			local L_599_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_600_
			local L_601_
			local function L_602_func()
				local L_604_ = Instance.new("BodyPosition", L_597_)
				local L_605_ = Instance.new("BodyGyro", L_597_)
				L_604_.Name = "EPIXPOS"
				L_604_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_604_.position = L_597_.Position
				L_605_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_605_.cframe = L_597_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_606_ = L_605_.cframe - L_605_.cframe.p + L_604_.position
					if not L_599_.w and not L_599_.s and not L_599_.a and not L_599_.d then
						L_598_ = 5
					end
					if L_599_.w then
						L_606_ = L_606_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_598_
						L_598_ = L_598_ + 0
					end
					if L_599_.s then
						L_606_ = L_606_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_598_
						L_598_ = L_598_ + 0
					end
					if L_599_.d then
						L_606_ = L_606_ * CFrame.new(L_598_, 0, 0)
						L_598_ = L_598_ + 0
					end
					if L_599_.a then
						L_606_ = L_606_ * CFrame.new(-L_598_, 0, 0)
						L_598_ = L_598_ + 0
					end
					if L_598_ > 10 then
						L_598_ = 5
					end
					L_604_.position = L_606_.p
					if L_599_.w then
						L_605_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_598_ * 0), 0, 0)
					elseif L_599_.s then
						L_605_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_598_ * 0), 0, 0)
					else
						L_605_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_605_ then
					L_605_:Destroy()
				end
				if L_604_ then
					L_604_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_598_ = 10
			end
			L_600_ = L_595_.KeyDown:connect(function(L_607_arg0)
				if not L_597_ or not L_597_.Parent then
					flying = true
					L_600_:disconnect()
					L_601_:disconnect()
					return
				end
				if L_607_arg0 == "w" then
					L_599_.w = true
				elseif L_607_arg0 == "s" then
					L_599_.s = true
				elseif L_607_arg0 == "a" then
					L_599_.a = true
				elseif L_607_arg0 == "d" then
					L_599_.d = true
				end
			end)
			L_601_ = L_595_.KeyUp:connect(function(L_608_arg0)
				if L_608_arg0 == "w" then
					L_599_.w = false
				elseif L_608_arg0 == "s" then
					L_599_.s = false
				elseif L_608_arg0 == "a" then
					L_599_.a = false
				elseif L_608_arg0 == "d" then
					L_599_.d = false
				end
			end)
			L_602_func()
		else
			flying = false
		end
	end)
	L_583_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_583_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_579_:AddLabel("Must Be Baby")
	L_579_:AddToggle("BabyAutoFarm", false, function(L_609_arg0)
		L_574_.BabyAutoFarm = L_609_arg0
	end)
	spawn(function()
		while wait (0.3) do
			pcall(function()
				if L_574_.BabyAutoFarm == true then
					local L_610_ = {
						[1] = "sleepy",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_610_))
					local L_611_ = {
						[1] = "dirty",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_611_))
					local L_612_ = {
						[1] = "thirsty",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_612_))
					local L_613_ = {
						[1] = "bored",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_613_))
					local L_614_ = {
						[1] = "camping",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_614_))
					local L_615_ = {
						[1] = "hungry",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_615_))
					local L_616_ = {
						[1] = "sick",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_616_))
					local L_617_ = {
						[1] = "school",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_617_))
					local L_618_ = {
						[1] = "hot_spring",
						[2] = 1
					}
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/AddAdditive"):FireServer(unpack(L_618_))
				end
			end)
		end
	end)
	L_579_:AddToggle("AutoPayCheck", false, function(L_619_arg0)
		L_574_.AutoPayCheck = L_619_arg0
	end)
	spawn(function()
		while wait (3) do
			pcall(function()
				if L_574_.AutoPayCheck == true then
					game:GetService("ReplicatedStorage").API:FindFirstChild("PayAPI/CashOut"):InvokeServer()
				end
			end)
		end
	end)
	L_579_:AddToggle("HealOthers", false, function(L_620_arg0)
		L_574_.HealOthers = L_620_arg0
	end)
	spawn(function()
		while wait (3) do
			pcall(function()
				if L_574_.HealOthers == true then
					game:GetService("ReplicatedStorage").API:FindFirstChild("MonitorAPI/HealWithDoctor"):FireServer()
				end
			end)
		end
	end)
	L_579_:AddButton("Become Baby", function()
		local L_621_ = {
			[1] = "Babies",
			[2] = true
		}
		game:GetService("ReplicatedStorage").API["TeamAPI/ChooseTeam"]:InvokeServer(unpack(L_621_))
	end)
	L_579_:AddButton("Free PopCorn", function()
		local L_622_ = {
			[1] = "food",
			[2] = "popcorn_vip",
			[3] = {}
		}
		game:GetService("ReplicatedStorage").API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer(unpack(L_622_))
	end)
	L_579_:AddButton("Free MilkShake", function()
		local L_623_ = {
			[1] = "food",
			[2] = "chocolate_milk_vip",
			[3] = {}
		}
		game:GetService("ReplicatedStorage").API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer(unpack(L_623_))
	end)
	L_580_:AddButton("Buy Mythic Egg", function()
		local L_624_ = {
			[1] = "pets",
			[2] = "Mythic_egg",
			[3] = {}
		}
		game:GetService("ReplicatedStorage").API["ShopAPI/BuyItem"]:InvokeServer(unpack(L_624_))
	end)
	L_580_:AddButton("Buy Cracked Egg", function()
		local L_625_ = {
			[1] = "pets",
			[2] = "cracked_egg",
			[3] = {}
		}
		game:GetService("ReplicatedStorage").API["ShopAPI/BuyItem"]:InvokeServer(unpack(L_625_))
	end)
	L_580_:AddButton("Buy Normal Egg", function()
		local L_626_ = {
			[1] = "pets",
			[2] = "regular_pet_egg",
			[3] = {}
		}
		game:GetService("ReplicatedStorage").API["ShopAPI/BuyItem"]:InvokeServer(unpack(L_626_))
	end)
	L_580_:AddButton("Buy Royal Egg", function()
		local L_627_ = {
			[1] = "pets",
			[2] = "royal_egg",
			[3] = {}
		}
		game:GetService("ReplicatedStorage").API["ShopAPI/BuyItem"]:InvokeServer(unpack(L_627_))
	end)
	L_581_:AddButton("Get Badges", function()
		local L_628_ = {
			[1] = "miniworld"
		}
		game:GetService("ReplicatedStorage").API["MinigameAPI/FinishObby"]:FireServer(unpack(L_628_))
		wait(0.5)
		local L_629_ = {
			[1] = "coastal_climb"
		}
		game:GetService("ReplicatedStorage").API["MinigameAPI/FinishObby"]:FireServer(unpack(L_629_))
		wait(0.5)
		local L_630_ = {
			[1] = "shipwreck_bay"
		}
		game:GetService("ReplicatedStorage").API["MinigameAPI/FinishObby"]:FireServer(unpack(L_630_))
		wait(0.5)
		local L_631_ = {
			[1] = "ancient_ruins"
		}
		game:GetService("ReplicatedStorage").API["MinigameAPI/FinishObby"]:FireServer(unpack(L_631_))
		wait(0.5)
		local L_632_ = {
			[1] = "lonelypeak"
		}
		game:GetService("ReplicatedStorage").API["MinigameAPI/FinishObby"]:FireServer(unpack(L_632_))
		wait(0.5)
		local L_633_ = {
			[1] = "pyramid"
		}
		game:GetService("ReplicatedStorage").API["MinigameAPI/FinishObby"]:FireServer(unpack(L_633_))
		wait(0.5)
		local L_634_ = {
			[1] = "tinyisles"
		}
		game:GetService("ReplicatedStorage").API["MinigameAPI/FinishObby"]:FireServer(unpack(L_634_))
	end)
	L_581_:AddToggle("InstantTradeBadge", false, function(L_635_arg0)
		L_574_.InstantTradeBadge = L_635_arg0
	end)
	spawn(function()
		while wait(0.5) do
			pcall(function()
				if L_574_.InstantTradeBadge == true then
					local L_636_ = {
						[1] = "has_talked_to_trade_quest_npc",
						[2] = true
					}
					game:GetService("ReplicatedStorage").API["SettingsAPI/SetBooleanFlag"]:FireServer(unpack(L_636_))
					local L_637_ = {
						[1] = "TradeLicenseZone"
					}
					game:GetService("ReplicatedStorage").API["LocationAPI/SetLocation"]:FireServer(unpack(L_636_))
					game:GetService("ReplicatedStorage").API["TradeAPI/BeginQuiz"]:FireServer()
					local L_638_ = {
						[1] = "not safe"
					}
					game:GetService("ReplicatedStorage").API["TradeAPI/AnswerQuizQuestion"]:FireServer(unpack(L_638_))
					local L_639_ = {
						[1] = "safe"
					}
					game:GetService("ReplicatedStorage").API["TradeAPI/AnswerQuizQuestion"]:FireServer(unpack(L_639_))
					local L_640_ = {
						[1] = "not safe"
					}
					game:GetService("ReplicatedStorage").API["TradeAPI/AnswerQuizQuestion"]:FireServer(unpack(L_640_))
					game:GetService("ReplicatedStorage").API["TradeAPI/EndQuiz"]:FireServer()
				end
			end)
		end
	end)
	L_581_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
	local L_587_ = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		L_587_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		L_587_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
	firsttime = false
end

if game.PlaceId == 2788229376 then
                --Da Hood
	local L_641_ = {
		MoneyAutoFarm = false,
		HospitalFarm = false,
		AutoStomp = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/2dgeneralspam1/garfield-hub/main/dependences/final-ui-lib")()
	local L_642_ = lib:CreateWindow("Bacon hub | Da Hood", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_643_ = L_642_:CreateTab("Main")
	local L_644_ = L_642_:CreateTab("AutoBuy")
	local L_645_ = L_642_:CreateTab('Misc')
	local L_646_ = L_643_:CreateSector("AutoFarm", "left")
	local L_647_ = L_645_:CreateSector("Universal", "left")
	local L_648_ = L_643_:CreateSector("Combat", "left")
	local L_649_ = L_645_:CreateSector("ESP", "right")
	local L_650_ = L_644_:CreateSector("Buy Shop Items", "left")
	local L_651_ = L_644_:CreateSector("Buy Guns", "right")
	local L_652_ = L_644_:CreateSector("Buy Ammo", "left")
	local L_653_ = {}
	local L_654_ = game:GetService("Players")
	local L_655_ = L_654_.LocalPlayer
	local L_656_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_656_:Toggle(true)
	L_656_.Tracers = false
	L_656_.Names = false
	L_656_.Boxes = false
	firsttime = true
	L_647_:AddKeybind("No Clip", Enum.KeyCode.U, function(L_661_arg0)
		print(L_661_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_647_:AddKeybind("Fly", Enum.KeyCode.Y, function(L_662_arg0)
		print(L_662_arg0)
	end, function()
		if flying == false then
			local L_663_ = game.Players.LocalPlayer
			local L_664_ = L_663_:GetMouse()
			localplayer = L_663_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_665_ = Instance.new("Part")
			L_665_.Name = "Core"
			L_665_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_665_.Parent = workspace
				local L_672_ = Instance.new("Weld", L_665_)
				L_672_.Part0 = L_665_
				L_672_.Part1 = localplayer.Character.LowerTorso
				L_672_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_666_ = workspace.Core
			flying = true
			local L_667_ = 10
			local L_668_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_669_
			local L_670_
			local function L_671_func()
				local L_673_ = Instance.new("BodyPosition", L_666_)
				local L_674_ = Instance.new("BodyGyro", L_666_)
				L_673_.Name = "EPIXPOS"
				L_673_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_673_.position = L_666_.Position
				L_674_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_674_.cframe = L_666_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_675_ = L_674_.cframe - L_674_.cframe.p + L_673_.position
					if not L_668_.w and not L_668_.s and not L_668_.a and not L_668_.d then
						L_667_ = 5
					end
					if L_668_.w then
						L_675_ = L_675_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_667_
						L_667_ = L_667_ + 0
					end
					if L_668_.s then
						L_675_ = L_675_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_667_
						L_667_ = L_667_ + 0
					end
					if L_668_.d then
						L_675_ = L_675_ * CFrame.new(L_667_, 0, 0)
						L_667_ = L_667_ + 0
					end
					if L_668_.a then
						L_675_ = L_675_ * CFrame.new(-L_667_, 0, 0)
						L_667_ = L_667_ + 0
					end
					if L_667_ > 10 then
						L_667_ = 5
					end
					L_673_.position = L_675_.p
					if L_668_.w then
						L_674_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_667_ * 0), 0, 0)
					elseif L_668_.s then
						L_674_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_667_ * 0), 0, 0)
					else
						L_674_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_674_ then
					L_674_:Destroy()
				end
				if L_673_ then
					L_673_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_667_ = 10
			end
			L_669_ = L_664_.KeyDown:connect(function(L_676_arg0)
				if not L_666_ or not L_666_.Parent then
					flying = true
					L_669_:disconnect()
					L_670_:disconnect()
					return
				end
				if L_676_arg0 == "w" then
					L_668_.w = true
				elseif L_676_arg0 == "s" then
					L_668_.s = true
				elseif L_676_arg0 == "a" then
					L_668_.a = true
				elseif L_676_arg0 == "d" then
					L_668_.d = true
				end
			end)
			L_670_ = L_664_.KeyUp:connect(function(L_677_arg0)
				if L_677_arg0 == "w" then
					L_668_.w = false
				elseif L_677_arg0 == "s" then
					L_668_.s = false
				elseif L_677_arg0 == "a" then
					L_668_.a = false
				elseif L_677_arg0 == "d" then
					L_668_.d = false
				end
			end)
			L_671_func()
		else
			flying = false
		end
	end)
	L_647_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_647_:AddButton("ServerHop", function()
		local L_678_, L_679_ = game:GetService("HttpService"), game:GetService("TeleportService")
		local L_680_ = L_678_:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
		for L_681_forvar0, L_682_forvar1 in pairs(L_680_.data) do
			if L_682_forvar1.playing ~= L_682_forvar1.maxPlayers then
				L_679_:TeleportToPlaceInstance(game.PlaceId, L_682_forvar1.id)
			end
		end
	end)
	L_647_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_646_:AddToggle("MoneyAutoFarm", false, function(L_683_arg0)
		L_641_.MoneyAutoFarm = L_683_arg0
	end)
	local L_657_ = getrawmetatable(game)
	setreadonly(L_657_, false)
	local L_658_ = L_657_.__namecall
	L_657_.__namecall =
    newcclosure(
    function(L_684_arg0, ...)
		local L_685_ = {
			...
		}
		if not checkcaller() and getnamecallmethod() == "FireServer" and tostring(L_684_arg0) == "MainEvent" then
			if tostring(getcallingscript()) ~= "Framework" then
				return
			end
		end
		if not checkcaller() and getnamecallmethod() == "Kick" then
			return
		end
		return L_658_(L_684_arg0, unpack(L_685_))
	end
)
	local L_659_ = game:GetService("Players").LocalPlayer
	function gettarget()
		local L_686_ = L_659_.Character or L_659_.CharacterAdded:wait()
		local L_687_ = L_686_:WaitForChild("HumanoidRootPart")
		local L_688_ = math.huge
		local L_689_
		for L_690_forvar0, L_691_forvar1 in pairs(game:GetService("Workspace").Cashiers:GetChildren()) do
			if L_691_forvar1:FindFirstChild("Head") and L_691_forvar1:FindFirstChild("Humanoid") and L_691_forvar1.Humanoid.Health > 0 then
				local L_692_ = (L_687_.Position - L_691_forvar1.Head.Position).magnitude
				if L_692_ < L_688_ then
					L_689_ = L_691_forvar1
					L_688_ = L_692_
				end
			end
		end
		return L_689_
	end
	for L_693_forvar0, L_694_forvar1 in pairs(workspace:GetDescendants()) do
		if L_694_forvar1:IsA("Seat") then
			L_694_forvar1:Destroy()
		end
	end
	spawn(function()
		while wait () do
			pcall(function()
				if L_641_.MoneyAutoFarm == true then
					wait()
					local L_695_ = gettarget()
					repeat
						wait()
						pcall(
            function()
							local L_696_ = L_659_.Character or L_659_.CharacterAdded:wait()
							local L_697_ = L_696_:WaitForChild("HumanoidRootPart")
							local L_698_ = L_659_.Backpack:FindFirstChild("Combat") or L_696_:FindFirstChild("Combat")
							if not L_698_ then
								L_696_:FindFirstChild("Humanoid").Health = 0
								return
							end
							L_697_.CFrame = L_695_.Head.CFrame * CFrame.new(0, -2.5, 3)
							L_698_.Parent = L_696_
							L_698_:Activate()
						end
        )
					until not L_695_ or L_695_.Humanoid.Health < 0
					for L_699_forvar0, L_700_forvar1 in pairs(game:GetService("Workspace").Ignored.Drop:GetDescendants()) do
						if L_700_forvar1:IsA("ClickDetector") and L_700_forvar1.Parent and L_700_forvar1.Parent.Name:find("Money") then
							local L_701_ = L_659_.Character or L_659_.CharacterAdded:wait()
							local L_702_ = L_701_:WaitForChild("HumanoidRootPart")
							if (L_700_forvar1.Parent.Position - L_702_.Position).magnitude <= 18 then
								repeat
									wait()
									fireclickdetector(L_700_forvar1)
								until not L_700_forvar1 or not L_700_forvar1.Parent.Parent
							end
						end
					end
					wait(1)
				end
			end)
		end
	end)
	L_646_:AddToggle("HospitalFarm", false, function(L_703_arg0)
		L_641_.HospitalFarm = L_703_arg0
	end)
	game:getService("RunService"):BindToRenderStep(
    "",
    0,
    function()
		if not game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid") then
			return
		end
		while wait() do
			if L_641_.HospitalFarm == true then
				game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
			end
		end
	end
)
	spawn(function()
		while wait(1) do
			if L_641_.HospitalFarm == true then
				pcall(
            function()
					for L_705_forvar0, L_706_forvar1 in pairs(game:GetService("Workspace").Ignored.HospitalJob:GetChildren()) do
						if L_706_forvar1:IsA("Model") then
							_G.patient = L_706_forvar1.Name
							game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                            game.Workspace.Ignored.HospitalJob[L_706_forvar1.Name].HumanoidRootPart.CFrame *
                            CFrame.new(Vector3.new(0, -6.5, 0), Vector3.new(0, 100, 0))
						end
					end
					for L_707_forvar0, L_708_forvar1 in pairs(game.Workspace.Ignored.HospitalJob:GetChildren()) do
						if L_708_forvar1.Name == "Can I get the Red bottle" then
							local L_709_ = game.Workspace.Ignored.HospitalJob.Red.ClickDetector
							fireclickdetector(L_709_)
						elseif L_708_forvar1.Name == "Can I get the Blue bottle" then
							local L_710_ = game.Workspace.Ignored.HospitalJob.Blue.ClickDetector
							fireclickdetector(L_710_)
						elseif L_708_forvar1.Name == "Can I get the Green bottle" then
							local L_711_ = game.Workspace.Ignored.HospitalJob.Green.ClickDetector
							fireclickdetector(L_711_)
						end
					end
					local L_704_ = game:GetService("Workspace").Ignored.HospitalJob[_G.patient].ClickDetector
					fireclickdetector(L_704_)
				end)
			end
		end
	end)
	L_648_:AddToggle("AutoStomp", false, function(L_712_arg0)
		L_641_.AutoStomp = L_712_arg0
	end)
	spawn(function()
		while wait (0.2) do
			pcall(function()
				if L_641_.AutoStomp == true then
					local L_713_ = {
						[1] = "Stomp"
					}
					game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(L_713_))
				end
			end)
		end
	end)
	L_648_:AddLabel("Rexecute When You Respawn")
	L_648_:AddButton("Fists Reach", function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/BaconLords/shit-with-sugar/main/Da%20Hood%20Reach'), true))()
	end)
	L_648_:AddButton("Infinite Stamina", function()
		local L_714_ = game:GetService"Players";
		local L_715_ = L_714_.LocalPlayer
		function InfiniteStamina()
			local L_716_ = L_715_.Character:WaitForChild"BodyEffects";
			local L_717_, L_718_, L_719_ = L_716_:WaitForChild"Defense", L_716_:WaitForChild"Movement", L_716_:WaitForChild"Reload"
			while wait() do
				L_719_.Value = false
				L_717_.Value = 387420489
				for L_720_forvar0, L_721_forvar1 in next, L_718_:GetChildren() do
					if L_721_forvar1 then
						L_721_forvar1:Destroy()
					end
				end
			end
		end
		InfiniteStamina()
	end)
	L_648_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
	L_649_:AddToggle("Boxes", false, function(L_722_arg0)
		L_656_.Boxes = L_722_arg0
	end)
	L_649_:AddToggle("Nametags", false, function(L_723_arg0)
		L_656_.Names = L_723_arg0
	end)
	L_649_:AddToggle("Tracers", false, function(L_724_arg0)
		L_656_.Tracers = L_724_arg0
	end)
	L_650_:AddButton("Buy Ninja Mask", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Ninja Mask] - $60"].Head.CFrame
		wait(0.3)
		for L_725_forvar0, L_726_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[Ninja Mask] - $60"]:GetDescendants()) do
			if L_726_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_726_forvar1)
			end
		end
	end)
	L_650_:AddButton("Buy Surgeon Mask", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].Head.CFrame
		wait(0.3)
		for L_727_forvar0, L_728_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $25"]:GetDescendants()) do
			if L_728_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_728_forvar1)
			end
		end
	end)
	L_650_:AddButton("Buy PepperSpray", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[PepperSpray] - $150"].Head.CFrame
		wait(0.3)
		for L_729_forvar0, L_730_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[PepperSpray] - $150"]:GetDescendants()) do
			if L_730_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_730_forvar1)
			end
		end
	end)
	L_650_:AddButton("Buy LockPicker", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[LockPicker] - $100"].Head.CFrame
		wait(0.3)
		for L_731_forvar0, L_732_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[LockPicker] - $100"]:GetDescendants()) do
			if L_732_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_732_forvar1)
			end
		end
	end)
	L_650_:AddButton("Buy PaintBall Mask", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[PaintBall Mask] - $60"].Head.CFrame
		wait(0.3)
		for L_733_forvar0, L_734_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[PaintBall Mask] - $60"]:GetDescendants()) do
			if L_734_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_734_forvar1)
			end
		end
	end)
	L_650_:AddButton("Buy Hockey Mask", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hockey Mask] - $60"].Head.CFrame
		wait(0.3)
		for L_735_forvar0, L_736_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[Hockey Mask] - $60"]:GetDescendants()) do
			if L_736_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_736_forvar1)
			end
		end
	end)
	L_651_:AddButton("Buy Glock", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Glock] - $500"].Head.CFrame
		wait(0.3)
		for L_737_forvar0, L_738_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[Glock] - $500"]:GetDescendants()) do
			if L_738_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_738_forvar1)
			end
		end
	end)
	L_651_:AddButton("Buy Silencer", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Silencer] - $550"].Head.CFrame
		wait(0.3)
		for L_739_forvar0, L_740_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[Silencer] - $550"]:GetDescendants()) do
			if L_740_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_740_forvar1)
			end
		end
	end)
	L_651_:AddButton("Buy TacticalShotgun", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[TacticalShotgun] - $1750"].Head.CFrame
		wait(0.3)
		for L_741_forvar0, L_742_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[TacticalShotgun] - $1750"]:GetDescendants()) do
			if L_742_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_742_forvar1)
			end
		end
	end)
	L_651_:AddButton("Buy SilencerAR", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[SilencerAR] - $1250"].Head.CFrame
		wait(0.3)
		for L_743_forvar0, L_744_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[SilencerAR] - $1250"]:GetDescendants()) do
			if L_744_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_744_forvar1)
			end
		end
	end)
	L_651_:AddButton("Buy P90", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[P90] - $1000"].Head.CFrame
		wait(0.3)
		for L_745_forvar0, L_746_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["[P90] - $1000"]:GetDescendants()) do
			if L_746_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_746_forvar1)
			end
		end
	end)
	L_652_:AddButton("Glock Ammo", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"].Head.CFrame
		wait(0.3)
		for L_747_forvar0, L_748_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["25 [Glock Ammo] - $60"]:GetDescendants()) do
			if L_748_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_748_forvar1)
			end
		end
	end)
	L_652_:AddButton("Silencer Ammo", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"].Head.CFrame
		wait(0.3)
		for L_749_forvar0, L_750_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["25 [Silencer Ammo] - $50"]:GetDescendants()) do
			if L_750_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_750_forvar1)
			end
		end
	end)
	L_652_:AddButton("SilencerAR Ammo", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["120 [SilencerAR Ammo] - $75"].Head.CFrame
		wait(0.3)
		for L_751_forvar0, L_752_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["120 [SilencerAR Ammo] - $75"]:GetDescendants()) do
			if L_752_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_752_forvar1)
			end
		end
	end)
	L_652_:AddButton("TacticalShotgun Ammo", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["20 [TacticalShotgun Ammo] - $60"].Head.CFrame
		wait(0.3)
		for L_753_forvar0, L_754_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["20 [TacticalShotgun Ammo] - $60"]:GetDescendants()) do
			if L_754_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_754_forvar1)
			end
		end
	end)
	L_652_:AddButton("P90 Ammo", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["120 [P90 Ammo] - $60"].Head.CFrame
		wait(0.3)
		for L_755_forvar0, L_756_forvar1 in pairs(game:GetService("Workspace").Ignored.Shop["120 [P90 Ammo] - $60"]:GetDescendants()) do
			if L_756_forvar1:IsA("ClickDetector") then
				fireclickdetector(L_756_forvar1)
			end
		end
	end)
	local L_660_ = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		L_660_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		L_660_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
	print("Bypassed Anti Cheat")
	firsttime = false
end
if game.PlaceId == 3956818381 then
	local L_757_ = {
		AutoEquipSword = false,
		AutoSwing = false,
		AutoSell = false,
		AutoHoops = false,
		AutoBuySwords = false,
		AutoBuyBelts = false,
		AutoRanks = false,
		AutoSkills = false,
		AutoShuriken = false,
		AutoChi = false,
		AutoCoin = false,
		FarmRobotBoss = false,
		FarmEthernalBoss = false,
		FarmAncientMagmaBoss = false,
		FastSheriken = false,
		Invisible = false,
		AutoEvolve = false,
		AutoEternalize = false,
		AutoImortalize = false,
		AutoLegend = false,
		AutoElementalize = false,
		SellBasics = false,
		SellAdvanced = false,
		SellRares = false,
		SellEpics = false,
		SellUniques = false,
		SellOmegas = false,
		SellInfinitys = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_758_ = lib:CreateWindow("Bacon hub | ⚡ Ninja Legends", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_759_ = L_758_:CreateTab("AutoFarm")
	local L_760_ = L_758_:CreateTab("AutoBuy")
	local L_761_ = L_758_:CreateTab("Pet Stuff")
	local L_762_ = L_758_:CreateTab("Teleport")
	local L_763_ = L_758_:CreateTab("Misc")
	local L_764_ = L_759_:CreateSector("Main Functions", "left")
	local L_765_ = L_759_:CreateSector("BossFarms", "right")
	local L_766_ = L_759_:CreateSector("AutoChi/Coin", "left")
	local L_767_ = L_760_:CreateSector("Purchaseable Items", "left")
	local L_768_ = L_760_:CreateSector("Get Elements", "right")
	local L_769_ = L_761_:CreateSector("Auto Buy Pets", "left")
	local L_770_ = L_761_:CreateSector("Auto Evolve", "right")
	local L_771_ = L_761_:CreateSector("Auto Sell Pets", "left")
	local L_772_ = L_763_:CreateSector("Misc", "right")
	local L_773_ = L_762_:CreateSector("Training Areas", "left")
	local L_774_ = L_762_:CreateSector("Alters", "left")
	local L_775_ = L_762_:CreateSector("Islands", "right")
	local L_776_ = L_763_:CreateSector("Universal", "left")
	local L_777_ = {}
	local L_778_ = game:GetService("Players")
	local L_779_ = L_778_.LocalPlayer
	L_776_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_781_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_781_arg0
	end)
	L_776_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_782_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_782_arg0
	end)
	L_776_:AddKeybind("No Clip", Enum.KeyCode.R, function(L_783_arg0)
		print(L_783_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_776_:AddKeybind("Fly", Enum.KeyCode.F, function(L_784_arg0)
		print(L_784_arg0)
	end, function()
		if flying == false then
			local L_785_ = game.Players.LocalPlayer
			local L_786_ = L_785_:GetMouse()
			localplayer = L_785_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_787_ = Instance.new("Part")
			L_787_.Name = "Core"
			L_787_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_787_.Parent = workspace
				local L_794_ = Instance.new("Weld", L_787_)
				L_794_.Part0 = L_787_
				L_794_.Part1 = localplayer.Character.LowerTorso
				L_794_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_788_ = workspace.Core
			flying = true
			local L_789_ = 10
			local L_790_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_791_
			local L_792_
			local function L_793_func()
				local L_795_ = Instance.new("BodyPosition", L_788_)
				local L_796_ = Instance.new("BodyGyro", L_788_)
				L_795_.Name = "EPIXPOS"
				L_795_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_795_.position = L_788_.Position
				L_796_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_796_.cframe = L_788_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_797_ = L_796_.cframe - L_796_.cframe.p + L_795_.position
					if not L_790_.w and not L_790_.s and not L_790_.a and not L_790_.d then
						L_789_ = 5
					end
					if L_790_.w then
						L_797_ = L_797_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_789_
						L_789_ = L_789_ + 0
					end
					if L_790_.s then
						L_797_ = L_797_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_789_
						L_789_ = L_789_ + 0
					end
					if L_790_.d then
						L_797_ = L_797_ * CFrame.new(L_789_, 0, 0)
						L_789_ = L_789_ + 0
					end
					if L_790_.a then
						L_797_ = L_797_ * CFrame.new(-L_789_, 0, 0)
						L_789_ = L_789_ + 0
					end
					if L_789_ > 10 then
						L_789_ = 5
					end
					L_795_.position = L_797_.p
					if L_790_.w then
						L_796_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_789_ * 0), 0, 0)
					elseif L_790_.s then
						L_796_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_789_ * 0), 0, 0)
					else
						L_796_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_796_ then
					L_796_:Destroy()
				end
				if L_795_ then
					L_795_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_789_ = 10
			end
			L_791_ = L_786_.KeyDown:connect(function(L_798_arg0)
				if not L_788_ or not L_788_.Parent then
					flying = true
					L_791_:disconnect()
					L_792_:disconnect()
					return
				end
				if L_798_arg0 == "w" then
					L_790_.w = true
				elseif L_798_arg0 == "s" then
					L_790_.s = true
				elseif L_798_arg0 == "a" then
					L_790_.a = true
				elseif L_798_arg0 == "d" then
					L_790_.d = true
				end
			end)
			L_792_ = L_786_.KeyUp:connect(function(L_799_arg0)
				if L_799_arg0 == "w" then
					L_790_.w = false
				elseif L_799_arg0 == "s" then
					L_790_.s = false
				elseif L_799_arg0 == "a" then
					L_790_.a = false
				elseif L_799_arg0 == "d" then
					L_790_.d = false
				end
			end)
			L_793_func()
		else
			flying = false
		end
	end)
	L_776_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_776_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_776_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
	L_764_:AddLabel("Must Equip Sword")
	Gods = true
	L_764_:AddToggle("AutoEquipSword", false, function(L_800_arg0)
		L_757_.AutoEquipSword = L_800_arg0
	end)
	spawn(function()
		while wait (2) do
			pcall(function()
				if L_757_.AutoEquipSword == true then
					for L_801_forvar0, L_802_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if L_802_forvar1.ClassName == "Tool" and L_802_forvar1:FindFirstChild("attackKatanaScript") then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(L_802_forvar1)
						end
					end
				end
			end)
		end
	end)
	firsttime = true
	L_764_:AddToggle('AutoSwing', false, function(L_803_arg0)
		L_757_.AutoSwing = L_803_arg0
	end)
	spawn(function()
		while wait (0.1) do
			pcall(function()
				if L_757_.AutoSwing == true then
					local L_804_ = {
						[1] = "swingKatana"
					}
					game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(L_804_))
				end
			end)
		end
	end)
	firstime = true
	L_764_:AddToggle("AutoSell", false, function(L_805_arg0)
		L_757_.AutoSell = L_805_arg0
	end)
	spawn(function()
		while wait (0.8) do
			pcall(function()
				if L_757_.AutoSell == true then
					for L_806_forvar0, L_807_forvar1 in pairs(game:GetService("Workspace").sellAreaCircles.sellAreaCircle16:GetDescendants()) do
						if L_807_forvar1:IsA("TouchTransmitter") then
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_807_forvar1.Parent, 0)
							wait()
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_807_forvar1.Parent, 1)
						end
					end
				end
			end)
		end
	end)
	sup = true
	L_767_:AddToggle("AutoBuySwords", false, function(L_808_arg0)
		L_757_.AutoBuySwords = L_808_arg0
	end)
	spawn(function()
		while wait (1) do
			pcall(function()
				if L_757_.AutoBuySwords == true then
					wait(0.6)
					local L_809_ = "buyAllSwords"
					local L_810_ = {
						"Ground",
						"Astral Island",
						"Space Island",
						"Tundra Island",
						"Eternal Island",
						"Sandstorm",
						"Thunderstorm Island",
						"Ancient Inferno Island",
						"Midnight Shadow Island",
						"Mythical Souls Island",
						"Winter Wonder Island",
						"Golden Master Island",
						"Dragon Legend Island",
						"Cybernetic Legends Island",
						"Skystorm Ultraus Island",
						"Chaos Legends Island",
						"Soul Fusion Island",
						"Dark Elements Island",
						"Inner Peace Island"
					}
					for L_811_forvar0 = 1, #L_810_ do
						game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(L_809_, L_810_[L_811_forvar0])
					end
				end
			end)
		end
	end)
	hey = true
	L_767_:AddToggle("AutoBuyBelts", false, function(L_812_arg0)
		L_757_.AutoBuyBelts = L_812_arg0
	end)
	spawn(function()
		while wait (1) do
			pcall(function()
				if L_757_.AutoBuyBelts == true then
					wait(0.5)
					local L_813_ = "buyAllBelts"
					local L_814_ = {
						"Ground",
						"Astral Island",
						"Space Island",
						"Tundra Island",
						"Eternal Island",
						"Sandstorm",
						"Thunderstorm Island",
						"Ancient Inferno Island",
						"Midnight Shadow Island",
						"Mythical Souls Island",
						"Winter Wonder Island",
						"Golden Master Island",
						"Dragon Legend Island",
						"Cybernetic Legends Island",
						"Skystorm Ultraus Island",
						"Chaos Legends Island",
						"Soul Fusion Island",
						"Dark Elements Island",
						"Inner Peace Island"
					}
					for L_815_forvar0 = 1, #L_814_ do
						game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(L_813_, L_814_[L_815_forvar0])
					end
				end
			end)
		end
	end)
	yourmom = true
	L_767_:AddToggle("AutoRanks", false, function(L_816_arg0)
		L_757_.AutoRanks = L_816_arg0
	end)
	spawn(function()
		while wait (1) do
			pcall(function()
				if L_757_.AutoRanks == true then
					wait(1.1)
					local L_817_ = "buyRank"
					local L_818_ = {
						"Rookie",
						"Grasshopper",
						"Apprentice",
						"Samurai",
						"Assassin",
						"Shadow",
						"Ninja",
						"Master Ninja",
						"Sensei",
						"Master Sensei",
						"Ninja Legend",
						"Master Of Shadows",
						"Immortal Assassin",
						"Eternity Hunter",
						"Shadow Legend",
						"Dragon Warrior",
						"Dragon Master",
						"Chaos Sensei",
						"Chaos Legend",
						"Master Of Elements"
    ,
						"Elemental Legend",
						"Ancient Battle Master",
						"Ancient Battle Legend",
						"Legendary Shadow Duelist",
						"Master Legend Assassin",
						"Mythic Shadowmaster",
						"Legendary Shadowmaster",
						"Awakened Scythemaster",
						"Awakened Scythe Legend",
						"Master Legend Zephyr",
						"Golden Sun Shuriken Master",
						"Golden Sun Shuriken Legend",
						"Dark Sun Samurai Legend",
						"Dragon Evolution Form I",
						"Dragon Evolution Form II",
						"Dragon Evolution Form III",
						"Dragon Evolution Form IV",
						"Dragon Evolution Form V",
						"Cybernetic Electro Master",
						"Cybernetic Electro Legend",
						"Shadow Chaos Assassin",
						"Shadow Chaos Legend",
						"Infinity Sensei",
						"Infinity Legend",
						"Aether Genesis Master Ninja",
						"Master Legend Sensei Hunter",
						"Skystorm Series Samurai Legend",
						"Master Elemental Hero",
						"Eclipse Series Soul Master",
						"Starstrike Master Sensei",
						"Evolved Series Master Ninja",
						"Dark Elements Guardian",
						"Elite Series Master Legend",
						"Infinity Shadows Master",
						"Lightning Storm Sensei",
						"Dark Elements Blademaster",
						"Rising Shadow Eternal Ninja",
						"Skyblade Ninja Master",
						"Shadow Storm Sensei",
					}
					for L_819_forvar0 = 1, #L_818_ do
						game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(L_817_, L_818_[L_819_forvar0])
					end
				end
			end)
		end
	end)
	Allah = true
	L_767_:AddToggle("AutoSkills", false, function(L_820_arg0)
		L_757_.AutoSkills = L_820_arg0
	end)
	spawn(function()
		while wait (1) do
			pcall(function()
				if L_757_.AutoSkills == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						local L_821_ = "buyAllSkills"
						local L_822_ = {
							"Ground",
							"Astral Island",
							"Space Island",
							"Tundra Island",
							"Eternal Island",
							"Sandstorm",
							"Thunderstorm Island",
							"Ancient Inferno Island",
							"Midnight Shadow Island",
							"Mythical Souls Island",
							"Winter Wonder Island",
							"Golden Master Island",
							"Dragon Legend Island",
							"Cybernetic Legends Island",
							"Skystorm Ultraus Island",
							"Chaos Legends Island",
							"Soul Fusion Island",
							"Dark Elements Island",
							"Inner Peace Island"
						}
						for L_823_forvar0 = 1, #L_822_ do
							game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(L_821_, L_822_[L_823_forvar0])
						end
					end
				end
			end)
		end
	end)
	Allahme = true
	L_767_:AddToggle("AutoShuriken", false, function(L_824_arg0)
		L_757_.AutoShuriken = L_824_arg0
	end)
	spawn(function()
		while wait(0.5) do
			pcall(function()
				if L_757_.AutoShuriken ==  true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						local L_825_ = "buyAllShurikens"
						local L_826_ = {
							"Ground",
							"Astral Island",
							"Space Island",
							"Tundra Island",
							"Eternal Island",
							"Sandstorm",
							"Thunderstorm Island",
							"Ancient Inferno Island",
							"Midnight Shadow Island",
							"Mythical Souls Island",
							"Winter Wonder Island",
							"Golden Master Island",
							"Dragon Legend Island",
							"Cybernetic Legends Island",
							"Skystorm Ultraus Island",
							"Chaos Legends Island",
							"Soul Fusion Island",
							"Dark Elements Island",
							"Inner Peace Island"
						}
						for L_827_forvar0 = 1, #L_826_ do
							game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(L_825_, L_826_[L_827_forvar0])
						end
					end
				end
			end)
		end
	end)
	pro = true
	L_766_:AddToggle("AutoChi", false, function(L_828_arg0)
		L_757_.AutoChi = L_828_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_757_.AutoChi == true then
					for L_829_forvar0, L_830_forvar1 in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
						if L_830_forvar1.Name == "Blue Chi Crate" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(L_830_forvar1.Position)
							wait(.17)
						end
					end
				end
			end)
		end
	end)
	daddye = true
	L_766_:AddToggle("AutoCoin", false, function(L_831_arg0)
		L_757_.AutoCoin = L_831_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_757_.AutoCoin == true then
					for L_832_forvar0, L_833_forvar1 in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
						if L_833_forvar1.Name == "Pink Coin" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(L_833_forvar1.Position)
							wait(.17)
						end
					end
				end
			end)
		end
	end)
	dance = true
	L_765_:AddToggle("FarmRobotBoss", false, function(L_834_arg0)
		L_757_.FarmRobotBoss = L_834_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_757_.FarmRobotBoss == true then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.bossFolder.RobotBoss.HumanoidRootPart.CFrame
					local L_835_ = {
						[1] = "swingKatana"
					}
					game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(L_835_))
				end
			end)
		end
	end)
	mum = true
	L_765_:AddToggle("FarmEthernalBoss", false, function(L_836_arg0)
		L_757_.FarmEthernalBoss = L_836_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_757_.FarmEthernalBoss == true then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.bossFolder.EternalBoss.HumanoidRootPart.CFrame
					local L_837_ = {
						[1] = "swingKatana"
					}
					game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(L_837_))
				end
			end)
		end
	end)
	wow = true
	L_765_:AddToggle("FarmAncientMagmaBoss", false, function(L_838_arg0)
		L_757_.FarmAncientMagmaBoss = L_838_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_757_.FarmAncientMagmaBoss == true then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.bossFolder.AncientMagmaBoss.HumanoidRootPart.CFrame
					local L_839_ = {
						[1] = "swingKatana"
					}
					game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(L_839_))
				end
			end)
		end
	end)
	nuts = true
	L_772_:AddToggle("Invisible", false, function(L_840_arg0)
		L_757_.Invisible = L_840_arg0
	end)
	spawn(function()
		while wait (1.2) do
			pcall(function()
				if L_757_.Invisible == true then
					local L_841_ = {
						[1] = "goInvisible"
					}
					game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(L_841_))
				end
			end)
		end
	end)
	Jesus = true
	L_772_:AddToggle("FastSheriken", false, function(L_842_arg0)
		L_757_.FastSheriken = L_842_arg0
	end)
	spawn(function()
		while wait(.001) do
			pcall(function()
				if L_757_.FastSheriken == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						local L_843_ = game.Players.LocalPlayer
						local L_844_ = L_843_:GetMouse()
						local L_845_ = 1000
						for L_846_forvar0, L_847_forvar1 in pairs(game.Workspace.shurikensFolder:GetChildren()) do
							if L_847_forvar1.Name == "Handle" then
								if L_847_forvar1:FindFirstChild("BodyVelocity") then
									local L_848_ = L_847_forvar1:FindFirstChildOfClass("BodyVelocity")
									L_848_.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									L_848_.Velocity = L_844_.Hit.lookVector * L_845_
								end
							end
						end
					end
				end
			end)
		end
	end)
	L_768_:AddButton("Get All Elements", function()
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Masterful Wrath")
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Frost")
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Electral Chaos")
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Lightning")
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Inferno")
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Shadow Charge")
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Shadowfire")
		game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Eternity Storm")
	end)
	L_772_:AddButton("Unlock All Islands", function()
		for L_849_forvar0, L_850_forvar1 in pairs(game:GetService("Workspace").islandUnlockParts:GetDescendants()) do
			if L_850_forvar1:IsA("TouchTransmitter") then
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_850_forvar1.Parent, 0) --0 is touch
				wait()
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_850_forvar1.Parent, 1) -- 1 is untouch
			end
		end
	end)
	L_772_:AddButton("Collect Chests", function()
		local L_851_ = {
			"Magma Chest",
			"Enchanted Chest",
			"Golden Chest",
			"Mythical Chest",
			"Legends Chest",
			"Daily Chest",
			"Eternal Chest",
			"Sahara Chest",
			"Thunder Chest",
			"Ancient Chest",
			"Midnight Shadow Chest",
			"Wonder Chest",
			"Golden Zen Chest",
			"Ultra Ninjitsu Chest",
			"Skystorm Masters Chest",
			"Chaos Legends Chest",
			"Soul Fusion Chest",
		}
		for L_852_forvar0 = 1, #L_851_ do
			wait(1)
			game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(L_851_[L_852_forvar0])
		end
	end)
	Dang = true
	L_770_:AddToggle("AutoEvolve", false, function(L_853_arg0)
		L_757_.AutoEvolve = L_853_arg0
	end)
	spawn(function()
		while wait(3) do
			pcall(function()
				if L_757_.AutoEvolve == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_854_forvar0, L_855_forvar1 in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
							for L_856_forvar0, L_857_forvar1 in pairs(L_855_forvar1:GetChildren()) do
								local L_858_ = "evolvePet"
								local L_859_ = L_857_forvar1.Name
								game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(L_858_, L_859_)
							end
						end
					end
				end
			end)
		end
	end)
	Fuck = true
	L_770_:AddToggle("AutoEteranlize", false, function(L_860_arg0)
		L_757_.AutoEternalize = L_860_arg0
	end)
	spawn(function()
		while wait(3) do
			pcall(function()
				if L_757_.AutoEternalize == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_861_forvar0, L_862_forvar1 in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
							for L_863_forvar0, L_864_forvar1 in pairs(L_862_forvar1:GetChildren()) do
								local L_865_ = "eternalizePet"
								local L_866_ = L_864_forvar1.Name
								game:GetService("ReplicatedStorage").rEvents.petEternalizeEvent:FireServer(L_865_, L_866_)
							end
						end
					end
				end
			end)
		end
	end)
	FuckU = true
	L_770_:AddToggle("AutoImortalize", false, function (L_867_arg0)
		L_757_.AutoImortalize = L_867_arg0
	end)
	spawn(function()
		while wait(3) do
			pcall(function()
				if L_757_.AutoImortalize == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_868_forvar0, L_869_forvar1 in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
							for L_870_forvar0, L_871_forvar1 in pairs(L_869_forvar1:GetChildren()) do
								local L_872_ = "immortalizePet"
								local L_873_ = L_871_forvar1.Name
								game:GetService("ReplicatedStorage").rEvents.petImmortalizeEvent:FireServer(L_872_, L_873_)
							end
						end
					end
				end
			end)
		end
	end)
	Ass = true
	L_770_:AddToggle("AutoLegend", false, function(L_874_arg0)
		L_757_.AutoLegend = L_874_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.AutoLegend == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_875_forvar0, L_876_forvar1 in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
							for L_877_forvar0, L_878_forvar1 in pairs(L_876_forvar1:GetChildren()) do
								local L_879_ = "legendizePet"
								local L_880_ = L_878_forvar1.Name
								game:GetService("ReplicatedStorage").rEvents.petLegendEvent:FireServer(L_879_, L_880_)
							end
						end
					end
				end
			end)
		end
	end)
	butt = true
	L_770_:AddToggle("AutoElementalize", false, function(L_881_arg0)
		L_757_.AutoElementalize = L_881_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.AutoElementalize == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_882_forvar0, L_883_forvar1 in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
							for L_884_forvar0, L_885_forvar1 in pairs(L_883_forvar1:GetChildren()) do
								local L_886_ = "elementalizePet"
								local L_887_ = L_885_forvar1.Name
								game:GetService("ReplicatedStorage").rEvents.petLegendEvent:FireServer(L_886_, L_887_)
							end
						end
					end
				end
			end)
		end
	end)
	L_769_:AddDropdown('Select Location', {
		"Blue Crystal";
		" Enchanted Crystal";
		"Astral Crystal";
		"Golden Crystal";
		"Inferno Crystal";
		"Space Crystal";
		"Eternal Crystal";
		"Thunder Crystal";
		"Secret Blades Crystal",
	}, "Crystal", false, function(L_888_arg0)
		local L_889_ = {
			[1] = "openCrystal",
			[2] = L_888_arg0
		}
		game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(L_889_))
	end)
	big = true
	L_771_:AddToggle("SellBasics", false, function(L_890_arg0)
		L_757_.SellBasics = L_890_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.SellBasics == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_891_forvar0, L_892_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Basic:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_892_forvar1)
						end
					end
				end
			end)
		end
	end)
	bigd = true
	L_771_:AddToggle("SellAdvanced", false, function(L_893_arg0)
		L_757_.SellAdvanced = L_893_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.SellAdvanced == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_894_forvar0, L_895_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Advanced:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_895_forvar1)
						end
					end
				end
			end)
		end
	end)
	bigg = true
	L_771_:AddToggle("SellRares", false, function(L_896_arg0)
		L_757_.SellRares = L_896_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.SellRares == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_897_forvar0, L_898_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Rare:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_898_forvar1)
						end
					end
				end
			end)
		end
	end)
	bige = true
	L_771_:AddToggle("SellEpics", false, function(L_899_arg0)
		L_757_.SellEpics = L_899_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.SellEpics == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_900_forvar0, L_901_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Epic:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_901_forvar1)
						end
					end
				end
			end)
		end
	end)
	bong = true
	L_771_:AddToggle("SellUniques", false, function(L_902_arg0)
		L_757_.SellEpics = L_902_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.SellUniques == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_903_forvar0, L_904_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Unique:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_904_forvar1)
						end
					end
				end
			end)
		end
	end)
	weed = true
	L_771_:AddToggle("SellOmegas", false, function(L_905_arg0)
		L_757_.SellEpics = L_905_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.Omegas == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_906_forvar0, L_907_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Omega:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_907_forvar1)
						end
					end
				end
			end)
		end
	end)
	coc = true
	L_771_:AddToggle("SellElites", false, function(L_908_arg0)
		L_757_.SellElites = L_908_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.SellElites == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_909_forvar0, L_910_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Elite:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_910_forvar1)
						end
					end
				end
			end)
		end
	end)
	coca = true
	L_771_:AddToggle("SellInfinitys", false, function(L_911_arg0)
		L_757_.SellInfinitys = L_911_arg0
	end)
	spawn(function()
		while wait(1) do
			pcall(function()
				if L_757_.SellInfinitys == true then
					if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
						for L_912_forvar0, L_913_forvar1 in pairs(game.Players.LocalPlayer.petsFolder.Infinity:GetChildren()) do
							game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", L_913_forvar1)
						end
					end
				end
			end)
		end
	end)
	L_773_:AddLabel("Training Areas")
	L_773_:AddButton("Mythical Waters", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(344, 8824, 125)
	end)
	L_773_:AddButton("Lava Pit", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-128, 12952, 274)
	end)
	L_773_:AddButton("Toronado", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(320, 16872, -17)
	end)
	L_773_:AddButton("Sword Of Legends", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1831, 38, -140)
	end)
	L_773_:AddButton("Sword Of Ancient", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(613, 38, 2411)
	end)
	L_773_:AddButton("Elemental Toronado", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(323, 30383, -10)
	end)
	L_773_:AddButton("Fallen Infinity Blade", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1859, 38, -6788)
	end)
	L_773_:AddButton("Zen Masters Blade", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5019, 38, 1614)
	end)
	L_774_:AddLabel("Teleport To Alters")
	L_774_:AddButton("Infinity Stats Dojo", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4109.91553, 122.94751, -5908.6845)
	end)
	L_774_:AddButton("Altar Of Elements", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(732.294434, 122.947517, -5908.3461)
	end)
	L_774_:AddButton("Pet Cloning Altar", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4520.91943, 122.947517, 1401.6312)
	end)
	L_774_:AddButton("King Of The Hill", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(227.120529, 89.8075867, -285.06219)
	end)
	L_774_:AddLabel("Teleport to a Player")
	L_774_:AddTextbox("Player Name", "Player Name", function(L_914_arg0)
		function L_777_.GetPlayer(L_917_arg0)
			local L_918_;
			local L_919_ = L_778_:GetPlayers()
			for L_920_forvar0 = 1, #L_919_ do
				if string.lower(string.sub(L_919_[L_920_forvar0].Name, 1, string.len(L_917_arg0))) == string.lower(L_917_arg0) then
					L_918_ = L_919_[L_920_forvar0]
					break
				end
			end
			return L_918_
		end
		local L_915_ = game.Players.LocalPlayer.Character
		local L_916_ = L_777_.GetPlayer(L_914_arg0)
		wait(0.1)
		if L_916_ ~= nil and L_779_.Character:FindFirstChild("HumanoidRootPart") and game.Players:FindFirstChild(L_916_.Name) and game.Players:FindFirstChild(L_916_.Name).Character:FindFirstChild("HumanoidRootPart") then
			L_915_.HumanoidRootPart.CFrame = CFrame.new(game.Players:FindFirstChild(L_916_.Name).Character:FindFirstChild("HumanoidRootPart").Position)
		end
	end)
	L_775_:AddLabel("Islands")
	L_775_:AddButton("Soul Fusion Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(193, 79746, 18)
	end)
	L_775_:AddButton("Chaos Legends Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119, 74442, 52)
	end)
	L_775_:AddButton("Skystorm Ultraus Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(197, 70270, 8)
	end)
	L_775_:AddButton("Cybernetic Legends Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226, 66669, 15)
	end)
	L_775_:AddButton("Thunder Storm Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108, 24069, 84)
	end)
	L_775_:AddButton("Eternal Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139, 13680, 74)
	end)
	L_775_:AddButton("Ancient Inferno Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171, 28255, 39)
	end)
	L_775_:AddButton("Sand Storm Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135, 17686, 61)
	end)
	L_775_:AddButton("Tundra Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(189, 9284, 31)
	end)
	L_775_:AddButton("Space Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(186, 5656, 76)
	end)
	L_775_:AddButton("Mythical Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(165, 4047, 51)
	end)
	L_775_:AddButton("Astral Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(233, 2013, 331)
	end)
	L_775_:AddButton("Midnight Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(180, 33206, 28)
	end)
	L_775_:AddButton("Golden Master Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(166, 52607, 34)
	end)
	L_775_:AddButton("Dragon Legend Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188, 59594, 24)
	end)
	L_775_:AddButton("Winter Wonder Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183, 46010, 36)
	end)
	L_775_:AddButton("Mythical Souls Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-128, 39439, 173)
	end)
	L_775_:AddButton("Enchanted Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80, 766, -188)
	end)
	L_775_:AddButton("Inner Peace Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.202896, 87050.8438, 66.417511, 0.870402813, 1.82041191e-08, 0.492340267, 2.57000714e-08, 1, -8.24095352e-08, -0.492340267, 8.43826768e-08, 0.870402813)
	end)
	L_775_:AddButton("Dark Elements Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.101013, 83198.7578, 65.9104843, 0.953749359, -9.02977746e-08, 0.300603032, 7.0098622e-08, 1, 7.79807863e-08, -0.300603032, -5.33022657e-08, 0.953749359)
	end)
	local L_780_ = game:GetService("VirtualUser")---------------------ANTI AFK
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		L_780_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		L_780_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
	firstime = false
	firsttime = false
	first = false
	sup = false
	hey = false
	yourmum = false
	pro = false
	nuts = false
	dance = false
	mum = false
	wow = false
	Allah = false
	Allahme = false
	Jesus = false
	Dang = false
	Fuck = false
	FuckU = false
	Ass = false
	butt = false
	big = false
	bigd = false
	bige = false
	bong = false
	weed = false
	coc = false
	coca = false
	Gods = false
	daddye = false
end 
if game.PlaceId == 155615604 then
	local L_921_ = {
		KillAura = false,
		ArrestAura = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_922_ = lib:CreateWindow("Bacon hub | Prison Life", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_923_ = L_922_:CreateTab('Main')
	local L_924_ = L_922_:CreateTab("Teleports")
	local L_925_ = L_922_:CreateTab("Misc")
	local L_926_ = L_925_:CreateSector("Universal", "left")
	local L_927_ = L_923_:CreateSector("Combats", "left")
	local L_928_ = L_923_:CreateSector("Guns", "right")
	local L_929_ = L_925_:CreateSector("Other", "right")
	local L_930_ = L_924_:CreateSector("Teleports", "left")
	local L_931_ = L_925_:CreateSector("Team Change", "right ")
	local L_932_ = {}
	local L_933_ = game:GetService("Players")
	local L_934_ = L_933_.LocalPlayer
	noclip = false
	firsttime = true
	L_926_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_935_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_935_arg0
	end)
	L_926_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_936_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_936_arg0
	end)
	L_926_:AddKeybind("No Clip", Enum.KeyCode.R, function(L_937_arg0)
		print(L_937_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_926_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_926_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_926_:AddLabel("Teleport to a Player")
	L_926_:AddTextbox("Player Name", "Player Name", function(L_938_arg0)
		function L_932_.GetPlayer(L_941_arg0)
			local L_942_;
			local L_943_ = L_933_:GetPlayers()
			for L_944_forvar0 = 1, #L_943_ do
				if string.lower(string.sub(L_943_[L_944_forvar0].Name, 1, string.len(L_941_arg0))) == string.lower(L_941_arg0) then
					L_942_ = L_943_[L_944_forvar0]
					break
				end
			end
			return L_942_
		end
		local L_939_ = game.Players.LocalPlayer.Character
		local L_940_ = L_932_.GetPlayer(L_938_arg0)
		wait(0.1)
		if L_940_ ~= nil and L_934_.Character:FindFirstChild("HumanoidRootPart") and game.Players:FindFirstChild(L_940_.Name) and game.Players:FindFirstChild(L_940_.Name).Character:FindFirstChild("HumanoidRootPart") then
			L_939_.HumanoidRootPart.CFrame = CFrame.new(game.Players:FindFirstChild(L_940_.Name).Character:FindFirstChild("HumanoidRootPart").Position)
		end
	end)
	L_927_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
	L_927_:AddButton("Aimbot", function()
		local L_945_ = game.Players
		local L_946_ = L_945_.LocalPlayer
		local L_947_ = L_945_.GetPlayers
		local L_948_ = workspace.CurrentCamera
		local L_949_ = L_948_.WorldToScreenPoint
		local L_950_ = game.FindFirstChild
		local L_951_ = Vector2.new
		local L_952_ = L_946_.GetMouse(L_946_)
		local function L_953_func()
			local L_956_, L_957_ = math.huge
			for L_958_forvar0, L_959_forvar1 in pairs(L_947_(L_945_)) do
				if L_959_forvar1 ~= L_946_ and L_959_forvar1.Team ~= L_946_.Team and L_959_forvar1.Character then
					local L_960_ = L_950_(L_959_forvar1.Character, "Head")
					if L_960_ then
						local L_961_, L_962_ = L_949_(L_948_, L_960_.Position)
						if L_962_ then
							local L_963_ = (L_951_(L_961_.X, L_961_.Y) - L_951_(L_952_.X, L_952_.Y)).Magnitude
							if L_963_ < L_956_ then
								L_956_ = L_963_
								L_957_ = L_959_forvar1.Character
							end
						end
					end
				end
			end
			return L_957_
		end
		local L_954_ = getrawmetatable(game)
		local L_955_ = L_954_.__namecall
		setreadonly(L_954_, false)
		L_954_.__namecall = newcclosure(function(L_964_arg0, ...)
			local L_965_ = getnamecallmethod()
			if L_965_ == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
				local L_966_ = L_953_func()
				if L_966_ then
					return L_966_.Head, L_966_.Head.Position
				end
			end
			return L_955_(L_964_arg0, ...)
		end)
		setreadonly(L_954_, true)
	end)
	L_927_:AddToggle("InstantRespawn", false, function(L_967_arg0)
		L_921_.InstantRespawn = L_967_arg0
	end)
	spawn(function()
		while task.wait() do
			pcall(function()
				if L_921_.InstantRespawn == true then
					if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
						local L_968_ = "Broyoubadd"
						local L_969_ = game:GetService("Workspace").Remote.loadchar
						L_969_:InvokeServer(L_968_)
					end
				end
			end)
		end
	end)
	L_927_:AddToggle("KillAura", false, function(L_970_arg0)
		L_921_.KillAura = L_970_arg0
	end)
	spawn(function()
		while wait(0.02) do
			pcall(function()
				if L_921_.KillAura == true then
					for L_971_forvar0, L_972_forvar1 in pairs(game.Players:GetChildren()) do
						if L_972_forvar1 ~= game.Players.LocalPlayer then
							local L_973_ = game:GetService("ReplicatedStorage").meleeEvent
							L_973_:FireServer(
                                L_972_forvar1
                            )
						end
					end
				end
			end)
		end
	end)
	L_927_:AddToggle("ArrestAura", false, function(L_974_arg0)
		L_921_.ArrestAura = L_974_arg0
	end)
	spawn(function()
		while wait() do
			pcall(function()
				if L_921_.ArrestAura == true then
					for L_975_forvar0, L_976_forvar1 in pairs(game.Players:GetChildren()) do
						if L_976_forvar1 ~= Player then
							local L_977_ = workspace.Remote.arrest
							L_977_:InvokeServer(
                                    L_976_forvar1.Character.HumanoidRootPart
                                )
						end
					end
				end
			end)
		end
	end)
	L_927_:AddButton("Arrest Criminals", function()
		local L_978_ = game.Players.LocalPlayer
		local L_979_ = L_978_.Character.HumanoidRootPart.CFrame
		for L_980_forvar0, L_981_forvar1 in pairs(game.Teams.Criminals:GetPlayers()) do
			if L_981_forvar1.Name ~= L_978_.Name then
				local L_982_ = 10
				repeat
					wait(0.5)
					L_982_ = L_982_ - 1
					game.Workspace.Remote.arrest:InvokeServer(L_981_forvar1.Character.HumanoidRootPart)
					L_978_.Character.HumanoidRootPart.CFrame = L_981_forvar1.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
				until L_982_ == 0
			end
		end
		L_978_.Character.HumanoidRootPart.CFrame = L_979_
	end)
	L_927_:AddToggle("KillAll", false, function(L_983_arg0)
		L_921_.KillAll = L_983_arg0
	end)
	spawn(function()
		while task.wait(0.3) do
			pcall(function()
				if L_921_.KillAll == true then
					local L_984_ = game.Players.LocalPlayer
					local L_985_ = L_984_.Character.HumanoidRootPart.CFrame
					for L_986_forvar0, L_987_forvar1 in pairs(game.Players:GetPlayers()) do
						if L_987_forvar1.Name ~= L_984_.Name then
							local L_988_ = 6
							repeat
								wait(0.3)
								L_988_ = L_988_ - 1
								for L_989_forvar0, L_990_forvar1 in pairs(game.Players:GetChildren()) do
									if L_990_forvar1 ~= game.Players.LocalPlayer then
										local L_991_ = game:GetService("ReplicatedStorage").meleeEvent
										L_991_:FireServer(
                                L_990_forvar1
                            )
									end
								end
								L_984_.Character.HumanoidRootPart.CFrame = L_987_forvar1.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
							until L_988_ == 0 or game.Players[L_987_forvar1.Name].Character.Humanoid.Health == 0
						end
					end
					L_984_.Character.HumanoidRootPart.CFrame = L_985_
				end
			end)
		end
	end)
	L_928_:AddButton("Get Shotgun", function()
		local L_992_ = {
			[1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870").ITEMPICKUP
		}
		workspace.Remote.ItemHandler:InvokeServer(unpack(L_992_))
	end)
	L_928_:AddButton("Get AK47", function()
		local L_993_ = workspace.Remote.ItemHandler
		L_993_:InvokeServer(
                workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP
            )
	end)
	L_928_:AddButton("Get Hammer", function()
		game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
	end)
	L_928_:AddButton("Get Knife", function()
		game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single["Crude Knife"].ITEMPICKUP)
	end)
	L_928_:AddButton("Get M9", function()
		game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
	end)
	L_929_:AddButton("Destroy All Doors", function()
		game:GetService("Workspace").Doors:Destroy()
	end)
	L_929_:AddButton("Escape", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(497.262573, 198.039948, 2212.94336)
	end)
	L_930_:AddButton("Tp To Car", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").CarContainer.Sedan.Body.Seat.Position)
	end)
	L_930_:AddButton("TP to Criminal Base", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	end)
	L_930_:AddButton("TP to CourtYard", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(798.999756, 95.1383057, 2540.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	end)
	L_930_:AddButton('TP to Cafeteria', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(875.049805, 96.9333496, 2271.5498, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	end)
	L_930_:AddButton('TP to Prison', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(590.699524, 98.0399399, 2269.83911)
	end)
	L_930_:AddButton('TP to Sewers', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.092468, 78.6991119, 2437.32397)
	end)
	L_930_:AddButton('TP to Prison Cells', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.500366, 99.9899902, 2458.89307)
	end)
	L_930_:AddButton('TP to Prison Roof', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(820.341248, 118.990005, 2378.33838)
	end)
	L_930_:AddButton('TP to Police Base', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(835.926208, 99.9900055, 2267.71191)
	end)
	L_930_:AddButton('TP to Gate Button', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(504.488312, 102.039917, 2242.48389)
	end)
	L_930_:AddButton('TP to Neutral Spawn', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(879.38031, 27.7899876, 2349.28955)
	end)
	L_931_:AddButton("Become Guard", function()
		game.workspace.Remote.TeamEvent:FireServer("Bright blue")
	end)
	L_931_:AddButton("Become Inmate", function()
		game.workspace.Remote.TeamEvent:FireServer("Bright orange")
	end)
	L_931_:AddButton("Become Neutral", function()
		Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
	end)
	L_931_:AddButton("Become Criminal", function()
		local L_994_ = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		wait(0.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(L_994_)
	end)
	firsttime = false
end  

if game.PlaceId == 318978013 then
	local L_995_ = {
		AutoGoal = false,
		AutoBringBall = false,
		BreakBall = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_996_ = lib:CreateWindow("Bacon Hub | Kick Off", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_997_ = L_996_:CreateTab("Universal")
	local L_998_ = L_996_:CreateTab("AutoFarm")
	local L_999_ = L_997_:CreateSector("ESP", "right")
	local L_1000_ = L_997_:CreateSector("Universal", "left")
	local L_1001_ = L_998_:CreateSector("Main", "left")
	local L_1002_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_1002_:Toggle(true)
	L_1002_.Tracers = false
	L_1002_.Names = false
	L_1002_.Boxes = false
	L_999_:AddToggle("Boxes", false, function(L_1004_arg0)
		L_1002_.Boxes = L_1004_arg0
	end)
	L_999_:AddToggle("Nametags", false, function(L_1005_arg0)
		L_1002_.Names = L_1005_arg0
	end)
	L_999_:AddToggle("Tracers", false, function(L_1006_arg0)
		L_1002_.Tracers = L_1006_arg0
	end)
	L_1000_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_1007_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_1007_arg0
	end)
	L_1000_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_1008_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_1008_arg0
	end)
	L_1000_:AddKeybind("No Clip", Enum.KeyCode.R, function(L_1009_arg0)
		print(L_1009_arg0)
	end, function()
		if noclip == false then
			noclip = false
			game:GetService('RunService').Stepped:connect(function()
				if noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end)
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		else
			noclip = false
		end
	end)
	L_1000_:AddKeybind("Fly", Enum.KeyCode.F, function(L_1010_arg0)
		print(L_1010_arg0)
	end, function()
		if flying == false then
			local L_1011_ = game.Players.LocalPlayer
			local L_1012_ = L_1011_:GetMouse()
			localplayer = L_1011_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_1013_ = Instance.new("Part")
			L_1013_.Name = "Core"
			L_1013_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_1013_.Parent = workspace
				local L_1020_ = Instance.new("Weld", L_1013_)
				L_1020_.Part0 = L_1013_
				L_1020_.Part1 = localplayer.Character.LowerTorso
				L_1020_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_1014_ = workspace.Core
			flying = true
			local L_1015_ = 10
			local L_1016_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_1017_
			local L_1018_
			local function L_1019_func()
				local L_1021_ = Instance.new("BodyPosition", L_1014_)
				local L_1022_ = Instance.new("BodyGyro", L_1014_)
				L_1021_.Name = "EPIXPOS"
				L_1021_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_1021_.position = L_1014_.Position
				L_1022_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_1022_.cframe = L_1014_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_1023_ = L_1022_.cframe - L_1022_.cframe.p + L_1021_.position
					if not L_1016_.w and not L_1016_.s and not L_1016_.a and not L_1016_.d then
						L_1015_ = 5
					end
					if L_1016_.w then
						L_1023_ = L_1023_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_1015_
						L_1015_ = L_1015_ + 0
					end
					if L_1016_.s then
						L_1023_ = L_1023_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_1015_
						L_1015_ = L_1015_ + 0
					end
					if L_1016_.d then
						L_1023_ = L_1023_ * CFrame.new(L_1015_, 0, 0)
						L_1015_ = L_1015_ + 0
					end
					if L_1016_.a then
						L_1023_ = L_1023_ * CFrame.new(-L_1015_, 0, 0)
						L_1015_ = L_1015_ + 0
					end
					if L_1015_ > 10 then
						L_1015_ = 5
					end
					L_1021_.position = L_1023_.p
					if L_1016_.w then
						L_1022_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_1015_ * 0), 0, 0)
					elseif L_1016_.s then
						L_1022_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_1015_ * 0), 0, 0)
					else
						L_1022_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_1022_ then
					L_1022_:Destroy()
				end
				if L_1021_ then
					L_1021_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_1015_ = 10
			end
			L_1017_ = L_1012_.KeyDown:connect(function(L_1024_arg0)
				if not L_1014_ or not L_1014_.Parent then
					flying = true
					L_1017_:disconnect()
					L_1018_:disconnect()
					return
				end
				if L_1024_arg0 == "w" then
					L_1016_.w = true
				elseif L_1024_arg0 == "s" then
					L_1016_.s = true
				elseif L_1024_arg0 == "a" then
					L_1016_.a = true
				elseif L_1024_arg0 == "d" then
					L_1016_.d = true
				end
			end)
			L_1018_ = L_1012_.KeyUp:connect(function(L_1025_arg0)
				if L_1025_arg0 == "w" then
					L_1016_.w = false
				elseif L_1025_arg0 == "s" then
					L_1016_.s = false
				elseif L_1025_arg0 == "a" then
					L_1016_.a = false
				elseif L_1025_arg0 == "d" then
					L_1016_.d = false
				end
			end)
			L_1019_func()
		else
			flying = false
		end
	end)
	L_1000_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_1000_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_1001_:AddToggle("AutoGoal", false, function(L_1026_arg0)
		L_995_.AutoGoal = L_1026_arg0
	end)
	local L_1003_ = game:GetService('VirtualUser')
	L_1003_:CaptureController()
	spawn(function()
		while task.wait() do
			pcall(function()
				if L_995_.AutoGoal == true then
					if game.Players.LocalPlayer.Team.Name == "Brazil" then
						L_1003_:SetKeyDown('0x77')
						wait(0.001)
						L_1003_:SetKeyUp('0x77')
						wait(0.001)
						L_1003_:SetKeyDown('0x73')
						wait(0.001)
						L_1003_:SetKeyUp('0x73')
						for L_1027_forvar0, L_1028_forvar1 in pairs(game:GetService("Workspace").MapHolder:GetDescendants()) do
							if L_1028_forvar1:IsA("Part") and L_1028_forvar1.Name == "BlueGoal" then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = L_1028_forvar1.CFrame
							end
						end
						for L_1029_forvar0, L_1030_forvar1 in pairs(game.Workspace.SoccerBall:GetChildren()) do
							if L_1030_forvar1:IsA("TouchTransmitter") then
								firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_1030_forvar1.Parent, 0)
								wait(0.1)
								firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_1030_forvar1.Parent, 1)
							end
						end
					end
					if game.Players.LocalPlayer.Team.Name == "USA" then
						L_1003_:SetKeyDown('0x77')
						wait(0.001)
						L_1003_:SetKeyUp('0x77')
						wait(0.001)
						L_1003_:SetKeyDown('0x73')
						wait(0.001)
						L_1003_:SetKeyUp('0x73')
						for L_1031_forvar0, L_1032_forvar1 in pairs(game:GetService("Workspace").MapHolder:GetDescendants()) do
							if L_1032_forvar1:IsA("Part") and L_1032_forvar1.Name == "RedGoal" then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = L_1032_forvar1.CFrame
							end
						end
						for L_1033_forvar0, L_1034_forvar1 in pairs(game.Workspace.SoccerBall:GetChildren()) do
							if L_1034_forvar1:IsA("TouchTransmitter") then
								firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_1034_forvar1.Parent, 0)
								wait(0.1)
								firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_1034_forvar1.Parent, 1)
							end
						end
					end
				end
			end)
		end
	end)
	L_1001_:AddToggle("AutoBringBall", false, function(L_1035_arg0)
		L_995_.AutoBringBall = L_1035_arg0
	end)
	spawn(function()
		while task.wait() do
			pcall(function()
				if L_995_.AutoBringBall == true then
					for L_1036_forvar0, L_1037_forvar1 in pairs(game.Workspace.SoccerBall:GetChildren()) do
						if L_1037_forvar1:IsA("TouchTransmitter") then
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_1037_forvar1.Parent, 0)
							wait(0.1)
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, L_1037_forvar1.Parent, 1)
						end
					end
				end
			end)
		end
	end)
	L_1001_:AddToggle("BreakBall", false, function(L_1038_arg0)
		L_995_.BreakBall = L_1038_arg0
	end)
	spawn(function()
		while task.wait(0.4) do
			pcall(function()
				if L_995_.BreakBall == true then 
    -- Script generated by SimpleSpy - credits to exx#9394
					local L_1039_ = {
						[1] = "Kick",
						[2] = "Trickshot",
						[3] = workspace.SoccerBall,
						[4] = 22.629504394531,
						[5] = Vector3.new(45.103404998779, 82.799995422363, -54.574016571045),
						[6] = Vector3.new(149.20053100586, -74.250137329102, -421.7565612793),
						[7] = Vector3.new(181.78007507324, -107.2501373291, -461.1770324707)
					}
					game:GetService("ReplicatedStorage").MasterKey:FireServer(unpack(L_1039_))
				end
			end)
		end
	end)
end

if game.PlaceId == 2534724415 then
	local L_1040_ = {
		AutoFarmPayChecks = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_1041_ = lib:CreateWindow("Bacon Hub | ER:LC", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_1042_ = L_1041_:CreateTab("Universal")
	local L_1043_ = L_1041_:CreateTab("AutoFarm")
	local L_1044_ = L_1042_:CreateSector("ESP", "right")
	local L_1045_ = L_1042_:CreateSector("Universal", "left")
	local L_1046_ = L_1043_:CreateSector("Main", "left")
	local L_1047_ = L_1043_:CreateSector("Teleports", "right")
	local L_1048_ = L_1043_:CreateSector("Combat", "left")
	local L_1049_ = L_1043_:CreateSector("Buy Weapons", "left")
	game.StarterGui:SetCore(
    "SendNotification",
    {
		Title = "Credits for help",
		Text = "Bussines Man "
	}
)
	PlayerName = {}
	for L_1051_forvar0, L_1052_forvar1 in pairs(game:GetService("Players"):GetChildren()) do
		if L_1052_forvar1.Team.Name == "Sheriff" or L_1052_forvar1.Team.Name == "Police" then
			table.insert(PlayerName , L_1052_forvar1.Name)
		end
	end
	function TweenTo(L_1053_arg0)
		local L_1054_ = {
			[1] = workspace[game.Players.LocalPlayer.Name].Head
		}
		game:GetService("ReplicatedStorage").FE.VehicleExit:FireServer(unpack(L_1054_))
		game.Players.LocalPlayer.Character:MoveTo(L_1053_arg0)
	end
	local L_1050_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_1050_:Toggle(true)
	L_1050_.Tracers = false
	L_1050_.Names = false
	L_1050_.Boxes = false
	L_1044_:AddToggle("Boxes", false, function(L_1055_arg0)
		L_1050_.Boxes = L_1055_arg0
	end)
	L_1044_:AddToggle("Nametags", false, function(L_1056_arg0)
		L_1050_.Names = L_1056_arg0
	end)
	L_1044_:AddToggle("Tracers", false, function(L_1057_arg0)
		L_1050_.Tracers = L_1057_arg0
	end)
	L_1045_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_1045_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_1046_:AddToggle("AutoFarmPayChecks", false, function(L_1058_arg0)
		L_1040_.AutoFarmPayChecks = L_1058_arg0
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1040_.AutoFarmPayChecks == true then
					local L_1059_ = {
						[1] = BrickColor.new(102),
						[2] = "1231"
					}
					game:GetService("ReplicatedStorage").FE.TeamChange:FireServer(unpack(L_1059_))
					TweenTo(Vector3.new(5, 30, 5), 3.2)
					wait(0.6)
					TweenTo(Vector3.new(100, 30, 5), 3.2)
					wait(0.6)
					TweenTo(Vector3.new(250, 30, 20), 3.2)
					wait(0.6)
					TweenTo(Vector3.new(700, 30, 70), 3.2)
					wait(0.8)
					TweenTo(Vector3.new(1000, 30, 50), 3.2)
					wait(0.7)
					TweenTo(Vector3.new(-434, 27, 100), 3.2)
					wait(0.8)
				end
			end)
		end
	end)
	L_1047_:AddButton("To Tool Shop", function()
		TweenTo(Vector3.new(-434.349396, 23.7480431, -714.446899, -0.797502756, -2.84444539e-08, -0.603315294, -5.15843404e-08, 1, 2.10407389e-08, 0.603315294, 4.79016684e-08, -0.797502756), 4)
	end)
	L_1047_:AddButton("ATM 1 ", function()
		TweenTo(Vector3.new(812.426208, 4.00052261, 377.247864, -0.943853259, 0.330364853, 0, 0.330364853, 0.943853319, 0, 0, 0, -1), 6)
	end)
	L_1047_:AddButton("ATM 2 ", function()
		TweenTo(Vector3.new(999.859802, 4.00046158, -21.785614, -4.8160553e-05, 8.1807375e-06, 1, 0.330366194, 0.943852842, 8.1807375e-06, -0.943852901, 0.330366194, -4.8160553e-05), 6)
	end)
	L_1047_:AddButton("ATM 3 ", function()
		TweenTo(Vector3.new(-368.652863, 26.7002048, 152.446075, 0, -1, 0, -1, 0, 0, 0, 0, -1), 6)
	end)
	L_1047_:AddButton("ATM 4", function()
		TweenTo(Vector3.new(-1018.9718, 26.833231, 447.773254, 0.00190246105, 8.46982002e-05, 0.999998212, -0.999996364, -0.00190234184, 0.00190258026, 0.00190258026, -0.999998212, 8.10623169e-05), 6)
	end)
	L_1047_:AddButton("Police Station", function()
		TweenTo(Vector3.new(703.846375, 17.5796318, -90.1037598, -0.994518042, 4.51932874e-06, -0.104565002, -4.51932874e-06, 1, 8.6203625e-05, 0.104565002, 8.6203625e-05, -0.994518042), 6)
	end)
	L_1047_:AddButton("Sheriff Station", function()
		TweenTo(Vector3.new(-780.035645, 23.1856575, -769.959229, 0.819155693, 0, 0.573571265, 0, 1, 0, -0.573571265, 0, 0.819155693), 6)
	end)
	L_1047_:AddButton("Car Spawn", function()
		TweenTo(Vector3.new(1077.88977, 0.85005188, 166.373444, 1, 0, 0, 0, 1, 0, 0, 0, 1), 6)
	end)
	L_1047_:AddButton("Fire Station", function()
		TweenTo(Vector3.new(-1046.17786, 20.8771553, 34.9316864, -0.104543328, 0, 0.994520426, 0, 1, 0, -0.994520426, 0, -0.104543328), 6)
	end)
	L_1047_:AddButton("Hospital", function()
		TweenTo(Vector3.new(-207.100037, 100, -464.049805, 1, 0, 0, 0, 1, 0, 0, 0, 1), 6)
	end)
	L_1047_:AddButton("Gun Shop", function()
		TweenTo(Vector3.new(-1220.60681, 25.5379372, -186.548431, 1, 0, 0, 0, 1, 0, 0, 0, 1), 3.2)
	end)
	L_1047_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
	L_1048_:AddLabel("Get Gun In Inv ")
	L_1048_:AddLabel("execute inf ammo")
	L_1048_:AddLabel("Equip gun then unequip gun ")
	L_1048_:AddLabel("then press E")
	L_1048_:AddLabel("Then unequip/requip gun done")
	L_1048_:AddButton("Infinite Ammo", function()
		function shared.GetGun() -- don't want upvalue error again wasted 4 hours fixing it 😐
			local L_1062_ = 'error'
			local L_1063_ = game:GetService("Players").LocalPlayer
			local L_1064_ = L_1063_.Backpack
			for L_1065_forvar0, L_1066_forvar1 in pairs(L_1064_:GetChildren()) do
				if (L_1066_forvar1:FindFirstChild("Core") ~= nil) then -- for some reason leaving out ' ~= nil' gave me errors
					if (L_1066_forvar1['Core']:FindFirstChild("Combat") ~= nil) then
						L_1062_ = L_1066_forvar1.Name
					end
				end
			end
			return L_1062_
		end
		local L_1060_ = getrawmetatable(game)
		setreadonly(L_1060_, false)
		local L_1061_ = L_1060_.__namecall
		L_1060_.__namecall = function(L_1067_arg0, ...)
			local L_1068_ = {
				...
			}
			local L_1069_ = getnamecallmethod()
			if tostring(L_1067_arg0) == "UpdateGunData" and tostring(L_1069_) == "FireServer" then
				L_1068_[1] = shared.GetGun()
				L_1068_[2] = 999999
				L_1068_[3] = 999999
				return L_1067_arg0.FireServer(L_1067_arg0, unpack(L_1068_))
			end
			return L_1061_(L_1067_arg0, ...)
		end
	end)
	_G.stopKilling = false
	_G.okyoustop = false
	function TpTo(L_1070_arg0)
		local L_1071_ = {
			[1] = workspace[game.Players.LocalPlayer.Name].Head
		}
		game:GetService("ReplicatedStorage").FE.VehicleExit:FireServer(unpack(L_1071_))
		game.Players.LocalPlayer.Character:MoveTo(L_1070_arg0)
	end
	function TpToCFrame(L_1072_arg0)
		local L_1073_ = {
			[1] = workspace[game.Players.LocalPlayer.Name].Head
		}
		game:GetService("ReplicatedStorage").FE.VehicleExit:FireServer(unpack(L_1073_))
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = L_1072_arg0
	end
	function FindCar()
		return game.ReplicatedStorage['VehicleOwners'][game.Players.LocalPlayer.Name].Value
	end
	function TpToCar()
		if (FindCar() ~= nil) then
			game:GetService("ReplicatedStorage").FE.VehicleExit:FireServer(unpack({
				[1] = FindCar().DriverSeat
			}))
		end
	end
	function GetLocation()
		local L_1074_ = game.Players.LocalPlayer.Character
		local L_1075_ = L_1074_.HumanoidRootPart.Position
		setclipboard(tostring(L_1075_))
	end
	function Swing()
		game:GetService("VirtualUser"):ClickButton1(Vector2.new(0.4, 0.4))
	end
	function TpBehind(L_1076_arg0)
		_G.okyoustop = false
		coroutine.resume(coroutine.create(function()
			repeat
				local L_1077_ = game.Players[L_1076_arg0].Character.HumanoidRootPart
				TpToCFrame(L_1077_.CFrame + L_1077_.CFrame.LookVector * -1.5)
				wait()
			until _G.okyoustop == true
		end))
		wait(1.05)
		_G.okyoustop = true
	end
	function SafeSpot()
		TpTo(Vector3.new(-68.44271087646484, 83.25736236572266, -433.7838439941406))
	end
	function Kill(L_1078_arg0)
		if (game.Players.LocalPlayer.Backpack:FindFirstChild"Knife") then
			game.Players.LocalPlayer.Backpack:FindFirstChild"Knife".Parent = game.Players.LocalPlayer.Character
		end
		repeat
			SafeSpot()
			TpBehind(L_1078_arg0)
			wait(.04)
			Swing()
			wait(0.6)
			SafeSpot()
			wait(0.5)
		until game.Players[L_1078_arg0].Character:FindFirstChildOfClass"Humanoid".Sit == true or IsDriving(game.ReplicatedStorage['VehicleOwners'][L_1078_arg0].Value) or game.Players[L_1078_arg0].Character:FindFirstChild("HumanoidRootPart").Anchored == true or game.Players[L_1078_arg0].Character:FindFirstChildOfClass("Humanoid").Health == 0
	end
	function IsDriving(L_1079_arg0)
		if (L_1079_arg0.DriverSeat:FindFirstChild("Rev")) then
			return true
		else
			return false
		end
	end
	function StopKilling()
		_G.stopKilling = true
		wait(3)
		_G.stopKilling = false
	end
	L_1048_:AddButton("Get Tools", function()
		local function L_1080_func() -- Check tools function
			local L_1081_ = {
				[1] = workspace[game.Players.LocalPlayer.Name].Head
			}
			game:GetService("ReplicatedStorage").FE.VehicleExit:FireServer(unpack(L_1081_))
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-431.529846, 25.4500179, -706.822632, -0.866007447, 0, -0.500031412, 0, 1, 0, 0.500031412, 0, -0.866007447))
			wait(0.2)
			if not game.Players.LocalPlayer.Backpack:FindFirstChild"Lockpick" then
				local L_1082_ = {
					[1] = "Lockpick"
				}
				game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer(unpack(L_1082_))
			end
			if not  game.Players.LocalPlayer.Backpack:FindFirstChild"Drill" then
				wait(0.2)
				local L_1083_ = {
					[1] = "Drill"
				}
				game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer(unpack(L_1083_))
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild"RFID Disruptor" then
				local L_1084_ = {
					[1] = "RFID Disruptor"
				}
				game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer(unpack(L_1084_))
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild"Knife" then
				local L_1085_ = {
					[1] = "Knife"
				}
				game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer(unpack(L_1085_))
			end
		end
		if  game.Players.LocalPlayer.Backpack:FindFirstChild"Drill" and  game.Players.LocalPlayer.Backpack:FindFirstChild"RFID Disruptor" and game.Players.LocalPlayer.Backpack:FindFirstChild"Lockpick" and game.Players.LocalPlayer.Backpack:FindFirstChild"Knife" then
			print("Already got tools")
		else
			L_1080_func()
		end
	end)
	L_1048_:AddDropdown("Kill Player (Knife)", PlayerName, "", false, function(L_1086_arg0)
		Kill(L_1086_arg0)
	end)
	L_1049_:AddButton("Buy AK47", function()
    -- Script generated by SimpleSpy - credits to exx#9394
		local L_1087_ = {
			[1] = "AK47"
		}
		game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer(unpack(L_1087_))
		TweenTo(Vector3.new(-1221.71472, 24.7248363, -192.380905, -0.0357225761, -1.59595626e-08, -0.999361753, -1.00776205e-07, 1, -1.23674706e-08, 0.999361753, 1.00270086e-07, -0.0357225761))
	end)
	L_1049_:AddButton("Buy M14", function()
    -- Script generated by SimpleSpy - credits to exx#9394
		local L_1088_ = {
			[1] = "M14"
		}
		game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer(unpack(L_1088_))
		TweenTo(Vector3.new(-1221.71472, 24.7248363, -192.380905, -0.0357225761, -1.59595626e-08, -0.999361753, -1.00776205e-07, 1, -1.23674706e-08, 0.999361753, 1.00270086e-07, -0.0357225761))
	end)
	L_1049_:AddButton("Buy Beretta M9", function()
    -- Script generated by SimpleSpy - credits to exx#9394
		local L_1089_ = {
			[1] = "Beretta M9"
		}
		game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer(unpack(L_1089_))
		TweenTo(Vector3.new(-1221.71472, 24.7248363, -192.380905, -0.0357225761, -1.59595626e-08, -0.999361753, -1.00776205e-07, 1, -1.23674706e-08, 0.999361753, 1.00270086e-07, -0.0357225761))
	end)
end
if game.PlaceId == 1224212277 then
	local L_1090_ = {
		AutoRob = false,
		AutoXp =  false,
		RainBowCar =  false,
		KillAura = false,
		KillAllGun =  false,
		AutoArrest = false,
		KillAll = false,
		playername = ""
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_1091_ = lib:CreateWindow("Mad City", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_1092_ = L_1091_:CreateTab("Universal")
	local L_1093_ = L_1091_:CreateTab("Main")
	local L_1094_ = L_1091_:CreateTab("Teleports")
	local L_1095_ = L_1092_:CreateSector("ESP", "right")
	local L_1096_ = L_1092_:CreateSector("Universal", "left")
	local L_1097_ = L_1093_:CreateSector("AutoFarm", "left")
	local L_1098_ = L_1093_:CreateSector("Vehicle", "right")
	local L_1099_ = L_1093_:CreateSector("Combat", "right")
	local L_1100_ = L_1093_:CreateSector("Change Team", "left")
	local L_1101_ = L_1093_:CreateSector("Trolling", "left")
	local L_1102_ = L_1093_:CreateSector("One Time Rob", "right")
	local L_1103_ = L_1094_:CreateSector("Teleport", "left")
	local L_1104_ = {}
	local L_1105_ = game:GetService("Players")
	local L_1106_ = L_1105_.LocalPlayer
	flying = false
	local L_1107_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_1107_:Toggle(true)
	L_1107_.Tracers = false
	L_1107_.Names = false
	L_1107_.Boxes = false
	L_1095_:AddToggle("Boxes", false, function(L_1108_arg0)
		L_1107_.Boxes = L_1108_arg0
	end)
	L_1095_:AddToggle("Nametags", false, function(L_1109_arg0)
		L_1107_.Names = L_1109_arg0
	end)
	L_1095_:AddToggle("Tracers", false, function(L_1110_arg0)
		L_1107_.Tracers = L_1110_arg0
	end)
	L_1096_:AddSlider("Walkspeed", 16, 16, 300, 1, function(L_1111_arg0)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = L_1111_arg0
	end)
	L_1096_:AddSlider("Jumppower", 50, 50, 500, 1, function(L_1112_arg0)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = L_1112_arg0
	end)
	L_1096_:AddKeybind("Fly", Enum.KeyCode.F, function(L_1113_arg0)
		print(L_1113_arg0)
	end, function()
		if flying == false then
			local L_1114_ = game.Players.LocalPlayer
			local L_1115_ = L_1114_:GetMouse()
			localplayer = L_1114_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_1116_ = Instance.new("Part")
			L_1116_.Name = "Core"
			L_1116_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(function()
				L_1116_.Parent = workspace
				local L_1123_ = Instance.new("Weld", L_1116_)
				L_1123_.Part0 = L_1116_
				L_1123_.Part1 = localplayer.Character.LowerTorso
				L_1123_.C0 = CFrame.new(0, 0, 0)
			end)
			workspace:WaitForChild("Core")
			local L_1117_ = workspace.Core
			flying = true
			local L_1118_ = 16
			local L_1119_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}
			local L_1120_
			local L_1121_
			local function L_1122_func()
				local L_1124_ = Instance.new("BodyPosition", L_1117_)
				local L_1125_ = Instance.new("BodyGyro", L_1117_)
				L_1124_.Name = "EPIXPOS"
				L_1124_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_1124_.position = L_1117_.Position
				L_1125_.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				L_1125_.cframe = L_1117_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_1126_ = L_1125_.cframe - L_1125_.cframe.p + L_1124_.position
					if not L_1119_.w and not L_1119_.s and not L_1119_.a and not L_1119_.d then
						L_1118_ = 5
					end
					if L_1119_.w then
						L_1126_ = L_1126_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_1118_
						L_1118_ = L_1118_ + 0
					end
					if L_1119_.s then
						L_1126_ = L_1126_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_1118_
						L_1118_ = L_1118_ + 0
					end
					if L_1119_.d then
						L_1126_ = L_1126_ * CFrame.new(L_1118_, 0, 0)
						L_1118_ = L_1118_ + 0
					end
					if L_1119_.a then
						L_1126_ = L_1126_ * CFrame.new(-L_1118_, 0, 0)
						L_1118_ = L_1118_ + 0
					end
					if L_1118_ > 10 then
						L_1118_ = 5
					end
					L_1124_.position = L_1126_.p
					if L_1119_.w then
						L_1125_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_1118_ * 0), 0, 0)
					elseif L_1119_.s then
						L_1125_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_1118_ * 0), 0, 0)
					else
						L_1125_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_1125_ then
					L_1125_:Destroy()
				end
				if L_1124_ then
					L_1124_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_1118_ = 10
			end
			L_1120_ = L_1115_.KeyDown:connect(function(L_1127_arg0)
				if not L_1117_ or not L_1117_.Parent then
					flying = true
					L_1120_:disconnect()
					L_1121_:disconnect()
					return
				end
				if L_1127_arg0 == "w" then
					L_1119_.w = true
				elseif L_1127_arg0 == "s" then
					L_1119_.s = true
				elseif L_1127_arg0 == "a" then
					L_1119_.a = true
				elseif L_1127_arg0 == "d" then
					L_1119_.d = true
				end
			end)
			L_1121_ = L_1115_.KeyUp:connect(function(L_1128_arg0)
				if L_1128_arg0 == "w" then
					L_1119_.w = false
				elseif L_1128_arg0 == "s" then
					L_1119_.s = false
				elseif L_1128_arg0 == "a" then
					L_1119_.a = false
				elseif L_1128_arg0 == "d" then
					L_1119_.d = false
				end
			end)
			L_1122_func()
		else
			flying = false
		end
	end)
	L_1096_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_1096_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
	L_1096_:AddButton("ServerHop", function()
		local L_1129_, L_1130_ = game:GetService("HttpService"), game:GetService("TeleportService")
		local L_1131_ = L_1129_:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
		for L_1132_forvar0, L_1133_forvar1 in pairs(L_1131_.data) do
			if L_1133_forvar1.playing ~= L_1133_forvar1.maxPlayers then
				L_1130_:TeleportToPlaceInstance(game.PlaceId, L_1133_forvar1.id)
			end
		end
	end)
	L_1097_:AddLabel("Must Use AutRob Not hesit")
	L_1097_:AddLabel("When AutoArrest Off Reset")
	L_1097_:AddLabel("After Using AutoArrest")
	L_1097_:AddButton("Bypass Tp(AutoRob)", function()
		local L_1134_ = game.Players.LocalPlayer.Character.HumanoidRootPart
		L_1134_.Parent = nil
		L_1134_.Parent = game.Players.LocalPlayer.Character
	end)
	L_1097_:AddToggle("AutoRob", false, function(L_1135_arg0)
		L_1090_.AutoRob = L_1135_arg0
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1090_.AutoRob ==  true then
					game.Players.LocalPlayer:ClearCharacterAppearance()
					if game.Players.LocalPlayer.Character:findFirstChild("NameTag") then
						game.Players.LocalPlayer.Character.NameTag:Destroy()
						for L_1136_forvar0, L_1137_forvar1 in pairs(game:GetService("Workspace").ObjectSelection:GetDescendants()) do
							if L_1137_forvar1:IsA("Part") and L_1137_forvar1.Name == "SmashCash" then
								L_1137_forvar1.SmashCash.Event:FireServer()
								wait()
							elseif L_1137_forvar1:IsA("MeshPart") and L_1137_forvar1.Name == "Cash" then
								L_1137_forvar1.Cash.Event:FireServer()
								wait()
							elseif L_1137_forvar1:IsA("Part") and L_1137_forvar1.Name == "StealTV" then
								L_1137_forvar1.StealTV.Event:FireServer()
								wait()
							elseif L_1137_forvar1:IsA("Part") and L_1137_forvar1.Name == "ATM" then
								L_1137_forvar1.ATM.Event:FireServer()
							end
						end
						workspace.ObjectSelection.DiamondBox.Nope.SmashCash.Event:FireServer()
						wait()
						workspace.ObjectSelection.Luggage.Nope.SmashCash.Event:FireServer()
						wait()
						workspace.ObjectSelection.CashRegister.Nope.SmashCash.Event:FireServer()
						wait()
						workspace.ObjectSelection.Laptop.Nope.Steal.Event:FireServer()
						wait()
						workspace.ObjectSelection.Phone.Nope.Steal.Event:FireServer()
						game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("DataFetch")
						game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("DataFetch")
						for L_1138_forvar0 = 1, 5 do
							wait(0.1)
							game.workspace.Heists.JewelryStore.EssentialParts.JewelryBoxes.JewelryManager.Event:FireServer(L_1138_forvar0)
						end
					end
				end
			end)
		end
	end)
	spawn(function()
		while task.wait(0.01) do
			pcall(function()
				if L_1090_.AutoRob ==  true then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2104.79102, 26.7301254, 421.229431)
				end
			end)
		end
	end)
	L_1097_:AddToggle("AutoXp", false, function(L_1139_arg0)
		L_1090_.AutoXp = L_1139_arg0
	end)
	spawn(function()
		while task.wait() do
			pcall(function()
				if L_1090_.AutoXp == true then
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
				end
			end)
		end
	end)
	spawn(function()
		while task.wait() do
			pcall(function()
				if L_1090_.AutoXp == true then
					for L_1140_forvar0, L_1141_forvar1 in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						if L_1141_forvar1.Name == "Handcuffs" then
							L_1141_forvar1.Parent = game:GetService("Players").LocalPlayer.Character
						end
					end
					for L_1142_forvar0 = 1, 3 do
						game:GetService("ReplicatedStorage").Event:FireServer("Eject", game.Players.LocalPlayer)
					end
				end
			end)
		end
	end)
	L_1097_:AddToggle("AutoArrest", false, function(L_1143_arg0)
		L_1090_.AutoArrest = L_1143_arg0
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1090_.AutoArrest ==  true then
					game.Players.LocalPlayer:ClearCharacterAppearance()
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
					if game.Players.LocalPlayer.Character:findFirstChild("NameTag") then
						game.Players.LocalPlayer.Character.NameTag:Destroy()
					end
				end
			end)
		end
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1090_.AutoArrest ==  true then
					for L_1144_forvar0, L_1145_forvar1 in pairs(game.Players:GetPlayers()) do
						if L_1145_forvar1.Name == game.Players.LocalPlayer.Name then
						else
							local L_1146_ = {
								[1] = "VR",
								[2] = game:GetService("Players")[L_1145_forvar1.Name].Character.Head
							}
							game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1146_))
						end
					end
				end
			end)
		end
	end)
	spawn(function()
		while task.wait (0.1) do
			pcall(function()
				if L_1090_.AutoArrest == true then
					local L_1147_ = game.Players.LocalPlayer
					local L_1148_ = L_1147_.Character.HumanoidRootPart.CFrame
					for L_1149_forvar0, L_1150_forvar1 in pairs(game.Teams.Criminals:GetPlayers()) do
						if L_1150_forvar1.Name ~= L_1147_.Name then
							local L_1151_ = 3
							repeat
								wait(0.5)
								L_1151_ = L_1151_ - 1
								local L_1152_ = CFrame.new(L_1150_forvar1.Character.HumanoidRootPart.position)
								local L_1153_ = 7
								local L_1154_ =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(L_1153_), {
									CFrame = L_1152_
								})
								L_1154_:Play()
								L_1154_.Completed:Wait(E)
							until L_1151_ == 0
						end
					end
				end
			end)
		end
	end)
	spawn(function()
		while task.wait (0.1) do
			pcall(function()
				if L_1090_.AutoArrest == true then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Pistol-S"])
				end
			end)
		end
	end)
	L_1098_:AddSlider("Car Height", 3, 1, 30, 1, function(L_1155_arg0)
		local L_1156_ = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		L_1156_.Height = L_1155_arg0
	end)
	L_1098_:AddSlider("Car Speed", 16, 1, 600, 1, function(L_1157_arg0)
		local L_1158_ = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		L_1158_.MaxSpeed = L_1157_arg0
	end)
	L_1098_:AddSlider("Car Break", 16, 1, 200, 1, function(L_1159_arg0)
		local L_1160_ = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		L_1160_.BrakeForce = L_1159_arg0
	end)
	L_1098_:AddToggle("RainBowCar", false, function(L_1161_arg0)
		L_1090_.RainBowCar = L_1161_arg0
	end)
	spawn(function()
		while task.wait(0.01) do
			pcall(function()
				if L_1090_.RainBowCar == true then
					local L_1162_ = {
						[1] = "EquipItem",
						[2] = "S12"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1162_))
    -- Script generated by SimpleSpy - credits to exx#9394
					wait(0.1)
					local L_1163_ = {
						[1] = "EquipItem",
						[2] = "S13"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1163_))
    -- Script generated by SimpleSpy - credits to exx#9394
					wait(0.1)
					local L_1164_ = {
						[1] = "EquipItem",
						[2] = "S14"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1164_))
    -- Script generated by SimpleSpy - credits to exx#9394
					wait(0.1)
					local L_1165_ = {
						[1] = "EquipItem",
						[2] = "S15"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1165_))
					wait(0.1)
					local L_1166_ = {
						[1] = "EquipItem",
						[2] = "S16"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1166_))
					wait(0.1)
					local L_1167_ = {
						[1] = "EquipItem",
						[2] = "S17"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1167_))
					wait(0.1)
					local L_1168_ = {
						[1] = "BuyItem",
						[2] = "S12"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1168_))
    -- Script generated by SimpleSpy - credits to exx#9394
					local L_1169_ = {
						[1] = "BuyItem",
						[2] = "S13"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1169_))
    -- Script generated by SimpleSpy - credits to exx#9394
					local L_1170_ = {
						[1] = "BuyItem",
						[2] = "S16"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1170_))
					local L_1171_ = {
						[1] = "BuyItem",
						[2] = "S17"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1171_))
					local L_1172_ = {
						[1] = "BuyItem",
						[2] = "S14"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1172_))
    -- Script generated by SimpleSpy - credits to exx#9394
					local L_1173_ = {
						[1] = "BuyItem",
						[2] = "S15"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1173_))-- Script generated by SimpleSpy - credits to exx#9394
					local L_1174_ = {
						[1] = "BuyItem",
						[2] = "S16"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1174_))
					local L_1175_ = {
						[1] = "EquipItem",
						[2] = "WC3"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1175_))
					local L_1176_ = {
						[1] = "EquipItem",
						[2] = "WC4"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1176_))
					local L_1177_ = {
						[1] = "EquipItem",
						[2] = "WC5"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1177_))
					local L_1178_ = {
						[1] = "EquipItem",
						[2] = "WC6"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1178_))
					local L_1179_ = {
						[1] = "EquipItem",
						[2] = "WC7"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1179_))
					local L_1180_ = {
						[1] = "EquipItem",
						[2] = "WC8"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1180_))
					local L_1181_ = {
						[1] = "EquipItem",
						[2] = "WC9"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1181_))
					local L_1182_ = {
						[1] = "BuyItem",
						[2] = "WC3"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1182_))
					local L_1183_ = {
						[1] = "BuyItem",
						[2] = "WC4"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1183_))
					local L_1184_ = {
						[1] = "BuyItem",
						[2] = "WC5"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1184_))
					local L_1185_ = {
						[1] = "BuyItem",
						[2] = "WC6"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1185_))
					local L_1186_ = {
						[1] = "BuyItem",
						[2] = "WC7"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1186_))
					local L_1187_ = {
						[1] = "BuyItem",
						[2] = "WC8"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1187_))
					local L_1188_ = {
						[1] = "BuyItem",
						[2] = "WC9"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1188_))
					local L_1189_ = {
						[1] = "BuyItem",
						[2] = "WC10"
					}
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(L_1189_))
				end
			end)
		end
	end)
	L_1099_:AddLabel("Dont Use Bypass Tp With")
	L_1099_:AddLabel("Kill All/Aura Will Glitch")
	L_1099_:AddLabel("You need gun for Kill All")
	L_1099_:AddToggle("KillAll", false, function(L_1190_arg0)
		L_1090_.KillAll = L_1190_arg0
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_1090_.KillAll == true then
					for L_1191_forvar0, L_1192_forvar1 in next, game.Players:GetPlayers() do
						if (L_1192_forvar1 ~= game.Players.LocalPlayer and L_1192_forvar1.Character and L_1192_forvar1.Character:FindFirstChild("HumanoidRootPart")) then
							local L_1193_ = {
								[1] = "BM",
								[2] = L_1192_forvar1.Character.HumanoidRootPart.Position
							}
							game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1193_))
							game:GetService("Workspace").ObjectSelection.Buzzard.DriveSeat.Disabled = false
						end
					end
				end
			end)
		end
	end)
	spawn(function()
		while wait () do
			pcall(function()
				if L_1090_.KillAll == true then
					local L_1194_ = 1750
					function tp(...)
						local L_1195_ = game.Players.LocalPlayer
						local L_1196_ = {
							...
						}
						if typeof(L_1196_[1]) == "number" and L_1196_[2] and L_1196_[3] then
							L_1196_ = Vector3.new(L_1196_[1], L_1196_[2], L_1196_[3])
						elseif typeof(L_1196_[1]) == "Vector3" then
							L_1196_ = L_1196_[1]
						elseif typeof(L_1196_[1]) == "CFrame" then
							L_1196_ = L_1196_[1].Position
						end
						local L_1197_ = (L_1195_.Character.HumanoidRootPart.Position - L_1196_).Magnitude
						game:GetService("TweenService"):Create(
   L_1195_.Character.HumanoidRootPart,
   TweenInfo.new(L_1197_ / L_1194_, Enum.EasingStyle.Quad),
   {
							CFrame = CFrame.new(L_1196_)
						}
):Play()
					end
					tp(-2414.25757, 26.986187, -1341.31177, -0.999656737, 2.06214263e-08, -0.0262002125, 1.99478887e-08, 1, 2.59687223e-08, 0.0262002125, 2.5437167e-08, -0.999656737)
					wait(2)
					tp(game.Workspace.ObjectSelection.Buzzard.DriveSeat.CFrame)
				end
			end)
		end
	end)
	L_1099_:AddToggle("KillAllGun", false, function(L_1198_arg0)
		L_1090_.KillAllGun = L_1198_arg0
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1090_.KillAllGun == true then
					for L_1199_forvar0, L_1200_forvar1 in pairs(game.Players:GetPlayers()) do
						if L_1200_forvar1.Name == game.Players.LocalPlayer.Name then
						else
							local L_1201_ = {
								[1] = "VR",
								[2] = game:GetService("Players")[L_1200_forvar1.Name].Character.Head
							}
							game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1201_))
						end
					end
				end
			end)
		end
	end)
	L_1099_:AddToggle("KillAura", false, function(L_1202_arg0)
		L_1090_.KillAura = L_1202_arg0
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1090_.KillAura == true then
					for L_1203_forvar0, L_1204_forvar1 in pairs(game.Players:GetPlayers()) do
						if L_1204_forvar1.Name == game.Players.LocalPlayer.Name then
						else
							local L_1205_ = {
								[1] = "Punch",
								[2] = game:GetService("Players")[L_1204_forvar1.Name].Character.Humanoid
							}
							game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1205_))
-- Script generated by SimpleSpy - credits to exx#9394
							local L_1206_ = {
								[1] = "PlaySound",
								[2] = 649585965,
								[3] = game:GetService("Players")[L_1204_forvar1.Name].Character.HumanoidRootPart
							}
							game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1206_))
						end
					end
				end
			end)
		end
	end)
	L_1100_:AddButton("Switch to Heroes", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Heroes")
	end)
	L_1100_:AddButton("Switch to Prisoner", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Prisoners")
	end)
	L_1100_:AddButton("Switch To Police", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
	end)
	L_1101_:AddButton("Destroy Lasers", function()
		for L_1207_forvar0, L_1208_forvar1 in pairs(workspace:GetDescendants()) do
			if L_1208_forvar1:IsA "Part" and L_1208_forvar1.Material == Enum.Material.Neon then
				L_1208_forvar1:Destroy()
			end
		end
	end)
	L_1101_:AddButton("Get Guns", function()
		game:GetService("Workspace").ObjectSelection.Pistol.Pistol.Pistol.Event:FireServer()
		game:GetService("Workspace").ObjectSelection.Shotgun.Shotgun.Shotgun.Event:FireServer()
		game:GetService("Workspace").ObjectSelection.Grenade.Grenade.Grenade.Event:FireServer()
		game:GetService("Workspace").ObjectSelection.Machete.Machete.Machete.Event:FireServer()
		game:GetService("Workspace").ObjectSelection.AK47.AK47.AK47.Event:FireServer()
	end)
	L_1101_:AddButton("Give All Glider", function()
		for L_1209_forvar0, L_1210_forvar1 in pairs(game.Players:GetChildren()) do
			local L_1211_ = {
				[1] = "Glider",
				[2] = L_1210_forvar1.Character.Parachute.Handle,
				[3] = -math.huge
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1211_))
		end
	end)
	L_1101_:AddButton("Remove Gilder", function()
		for L_1212_forvar0, L_1213_forvar1 in pairs(game.Players:GetChildren()) do
			local L_1214_ = {
				[1] = "Glider",
				[2] = L_1213_forvar1.Character.Parachute.Handle,
				[3] = math.huge
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1214_))
		end
	end)
	L_1101_:AddButton("Give KeyCard", function()
		for L_1215_forvar0 = 1, 30 do
			for L_1216_forvar0, L_1217_forvar1 in pairs(game.Players:GetChildren()) do
				local L_1218_ = {
					[1] = "Pickpocket",
					[2] = L_1217_forvar1
				}
				game:GetService("ReplicatedStorage").Event:FireServer(unpack(L_1218_))
			end
		end
	end)
	L_1101_:AddLabel("Teleport to a Player")
	L_1101_:AddTextbox("Player Name", "Player Name", function(L_1219_arg0)
		local L_1220_ = 1400
		function tp(...)
			local L_1223_ = game.Players.LocalPlayer
			local L_1224_ = {
				...
			}
			if typeof(L_1224_[1]) == "number" and L_1224_[2] and L_1224_[3] then
				L_1224_ = Vector3.new(L_1224_[1], L_1224_[2], L_1224_[3])
			elseif typeof(L_1224_[1]) == "Vector3" then
				L_1224_ = L_1224_[1]
			elseif typeof(L_1224_[1]) == "CFrame" then
				L_1224_ = L_1224_[1].Position
			end
			local L_1225_ = (L_1223_.Character.HumanoidRootPart.Position - L_1224_).Magnitude
			game:GetService("TweenService"):Create(
   L_1223_.Character.HumanoidRootPart,
   TweenInfo.new(L_1225_ / L_1220_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1224_)
			}
):Play()
		end
		function L_1104_.GetPlayer(L_1226_arg0)
			local L_1227_;
			local L_1228_ = L_1105_:GetPlayers()
			for L_1229_forvar0 = 1, #L_1228_ do
				if string.lower(string.sub(L_1228_[L_1229_forvar0].Name, 1, string.len(L_1226_arg0))) == string.lower(L_1226_arg0) then
					L_1227_ = L_1228_[L_1229_forvar0]
					break
				end
			end
			return L_1227_
		end
		local L_1221_ = game.Players.LocalPlayer.Character
		local L_1222_ = L_1104_.GetPlayer(L_1219_arg0)
		wait(0.1)
		if L_1222_ ~= nil and L_1106_.Character:FindFirstChild("HumanoidRootPart") and game.Players:FindFirstChild(L_1222_.Name) and game.Players:FindFirstChild(L_1222_.Name).Character:FindFirstChild("HumanoidRootPart") then
			tp(game.Players[L_1222_.Name].Character.HumanoidRootPart.CFrame)
		end
	end)
	L_1102_:AddButton("Rob Bank", function()
		if game.ReplicatedStorage.HeistStatus.Bank.Locked.Value == true then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Wait",
				Text = "Wait for Bank Open",
				Duration = 15,
			})
		else
			local function L_1230_func()
				local L_1231_ = 1400
				function tp(...)
					local L_1232_ = game.Players.LocalPlayer
					local L_1233_ = {
						...
					}
					if typeof(L_1233_[1]) == "number" and L_1233_[2] and L_1233_[3] then
						L_1233_ = Vector3.new(L_1233_[1], L_1233_[2], L_1233_[3])
					elseif typeof(L_1233_[1]) == "Vector3" then
						L_1233_ = L_1233_[1]
					elseif typeof(L_1233_[1]) == "CFrame" then
						L_1233_ = L_1233_[1].Position
					end
					local L_1234_ = (L_1232_.Character.HumanoidRootPart.Position - L_1233_).Magnitude
					game:GetService("TweenService"):Create(
   L_1232_.Character.HumanoidRootPart,
   TweenInfo.new(L_1234_ / L_1231_, Enum.EasingStyle.Quad),
   {
						CFrame = CFrame.new(L_1233_)
					}
):Play()
				end
				tp(653, 52, 477)
				wait(3)
				tp(660, 52, 487)
				wait(1)
				tp(732, 52, 540)
				wait(1)
				tp(678, 52, 599)
				wait(1)
				tp(710, 54, 639)
				wait(1)
				tp(722, 60, 636)
				wait(1)
				tp(744, 71, 627)
				wait(1)
				tp(657, 110, 617)
				wait(1)
				tp(705, 110, 544)
				wait(10)
				tp(724, 110, 534)
				wait(40)
				tp(653, 52, 477)
				wait(1)
				tp(758, 77, 622)
				wait(2)
				tp(2075, 26, 397) -- criminal base
			end
			L_1230_func()
		end
	end)
	L_1102_:AddButton("Rob Plane", function()
		if game.Workspace.CargoPlane.Plane == nil then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Wait",
				Text = "Wait For Plane",
				Duration = 15,
			})
		else
			local L_1235_ = 1400
			function tp(...)
				local L_1236_ = game.Players.LocalPlayer
				local L_1237_ = {
					...
				}
				if typeof(L_1237_[1]) == "number" and L_1237_[2] and L_1237_[3] then
					L_1237_ = Vector3.new(L_1237_[1], L_1237_[2], L_1237_[3])
				elseif typeof(L_1237_[1]) == "Vector3" then
					L_1237_ = L_1237_[1]
				elseif typeof(L_1237_[1]) == "CFrame" then
					L_1237_ = L_1237_[1].Position
				end
				local L_1238_ = (L_1236_.Character.HumanoidRootPart.Position - L_1237_).Magnitude
				game:GetService("TweenService"):Create(
   L_1236_.Character.HumanoidRootPart,
   TweenInfo.new(L_1238_ / L_1235_, Enum.EasingStyle.Quad),
   {
					CFrame = CFrame.new(L_1237_)
				}
):Play()
			end
			tp(game.Workspace.CargoPlane.Plane.Tele1.Position)
			wait(1)
			tp(game.Workspace.CargoPlane.Plane.Tele1.Position)
			for L_1239_forvar0, L_1240_forvar1 in pairs(workspace.ObjectSelection:GetChildren()) do
				if L_1240_forvar1.Name == "PlaneCrate" then
					local L_1241_ = L_1240_forvar1:FindFirstChildOfClass("Part")
					local L_1242_ = L_1240_forvar1.PlaneCrate.Position
					for L_1243_forvar0 = 0, 2 do
						wait(.1)
						game.Players.LocalPlayer.Character.HumanoidRootPart.Position = L_1242_
					end
					wait(0.3)
					L_1240_forvar1.PlaneCrate.PlaneCrate.Event:FireServer()
					repeat
						wait()
					until game.Players.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text == "4"
					wait(2)
					wait(2)
				end
			end
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(232, 51061, 598)
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(227, 51074, 695)
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(236, 51091, 536)
			wait(1)
			for L_1244_forvar0, L_1245_forvar1 in pairs(workspace.ObjectSelection:GetChildren()) do
				if L_1245_forvar1.Name == "HackKeypad" then
					local L_1246_ = L_1245_forvar1:FindFirstChildOfClass("Part")
					if L_1246_.Name ~= "Nope" then
						local L_1247_ = L_1245_forvar1.HackKeypad.Position
						for L_1248_forvar0 = 1, 2 do
							wait(.1)
							game.Players.LocalPlayer.Character.HumanoidRootPart.Position = L_1247_
						end
						wait(0.3)
						L_1245_forvar1.HackKeypad.HackKeypad.Event:FireServer()
						wait(2)
					end
				end
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(232.338531, 51095.75, 513.972473, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			wait(1)
			workspace.ObjectSelection.PlaneButton.PlaneButton.PlaneButton.Event:FireServer()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(231.832428, 51067.2266, 489.710938, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			wait(2)
			tp(2062, 26, 429)
			wait(2)
			tp(2101, 27, 426)
		end
	end)
	L_1102_:AddButton("Rob Pyramid", function()
		if game.ReplicatedStorage.HeistStatus.Pyramid.Locked.Value == true then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Wait",
				Text = "Wait For Pyramid To Open",
				Duration = 10,
			})
		else
			local L_1249_ = 1400
			function tp(...)
				local L_1250_ = game.Players.LocalPlayer
				local L_1251_ = {
					...
				}
				if typeof(L_1251_[1]) == "number" and L_1251_[2] and L_1251_[3] then
					L_1251_ = Vector3.new(L_1251_[1], L_1251_[2], L_1251_[3])
				elseif typeof(L_1251_[1]) == "Vector3" then
					L_1251_ = L_1251_[1]
				elseif typeof(L_1251_[1]) == "CFrame" then
					L_1251_ = L_1251_[1].Position
				end
				local L_1252_ = (L_1250_.Character.HumanoidRootPart.Position - L_1251_).Magnitude
				game:GetService("TweenService"):Create(
   L_1250_.Character.HumanoidRootPart,
   TweenInfo.new(L_1252_ / L_1249_, Enum.EasingStyle.Quad),
   {
					CFrame = CFrame.new(L_1251_)
				}
):Play()
			end
			tp(-1047.58899, 18.2789993, -479.790009, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			wait(3)
			tp(1233, 51046, 428)
			wait(1)
			tp(1234, 51054, 444)
			wait(.50)
			tp(1209, 51053, 500)
			wait(1)
			tp(1180, 51059, 455)
			wait(1)
			tp(995, 51077, 499)
			wait(1)
			tp(997, 51073, 547)
			for L_1253_forvar0, L_1254_forvar1 in pairs(workspace.ObjectSelection:GetChildren()) do
				if L_1254_forvar1.Name == "TreasurePyramid" then
					local L_1255_ = L_1254_forvar1:FindFirstChildOfClass("Part")
					local L_1256_ = L_1254_forvar1.TreasurePyramid.Position
					for L_1257_forvar0 = 1, math.random(3, 10) do
						wait(.1)
						game.Players.LocalPlayer.Character.HumanoidRootPart.Position = L_1256_
					end
					wait(0.3)
					L_1254_forvar1.TreasurePyramid.TreasurePyramid.Event:FireServer()
				end
			end
		end
		tp(-1053, 18, -508)
		wait(2)
		tp(-84, 27, 794)
		wait(1)
		tp(1230, 51052, 438)
		wait(2)
		tp(1231.14185, 51051.2344, 381.096191, -1, 0, 0, 0, 1, 0, 0, 0, -1)
		wait(2)
		tp(-1012, 21, -519)
		wait(5)
		tp(1997, 26, 420)
		wait(2)
		tp(2065, 26, 428)
		wait(2)
		tp(2086, 27, 435)
		wait(1)
		tp(2059, 26, 433)
		wait(1)
		tp(2059, 26, 433)
		wait(1)
		tp(2059, 26, 433)
	end)
	L_1102_:AddButton("Rob Ship", function()
		if game.Workspace.Ship.Boat.Vault == nil then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Wait",
				Text = "Wait For Ship",
				Duration = 10,
			})
		else
			local L_1258_ = 1400
			function tp(...)
				local L_1259_ = game.Players.LocalPlayer
				local L_1260_ = {
					...
				}
				if typeof(L_1260_[1]) == "number" and L_1260_[2] and L_1260_[3] then
					L_1260_ = Vector3.new(L_1260_[1], L_1260_[2], L_1260_[3])
				elseif typeof(L_1260_[1]) == "Vector3" then
					L_1260_ = L_1260_[1]
				elseif typeof(L_1260_[1]) == "CFrame" then
					L_1260_ = L_1260_[1].Position
				end
				local L_1261_ = (L_1259_.Character.HumanoidRootPart.Position - L_1260_).Magnitude
				game:GetService("TweenService"):Create(
   L_1259_.Character.HumanoidRootPart,
   TweenInfo.new(L_1261_ / L_1258_, Enum.EasingStyle.Quad),
   {
					CFrame = CFrame.new(L_1260_)
				}
):Play()
			end
			tp(2471, 42, 267)
			wait(2)
			tp(2488, 51, 205)
			wait(2)
			tp(2502, 67, 256)
			wait(1)
			tp(2510, 81, 326)
			wait(10)
			tp(2510, 82, 340)
			wait(1)
			tp(2517, 81, 333)
			wait(25)
			tp(2327, 26, 298)
			wait(2)
			tp(1976, 26, 345)
			wait(2)
			tp(2065, 27, 427)
			wait(2)
			tp(2076, 26, 427)
		end
	end)
	L_1103_:AddButton("Prison", function()
		local L_1262_ = 1400
		function tp(...)
			local L_1263_ = game.Players.LocalPlayer
			local L_1264_ = {
				...
			}
			if typeof(L_1264_[1]) == "number" and L_1264_[2] and L_1264_[3] then
				L_1264_ = Vector3.new(L_1264_[1], L_1264_[2], L_1264_[3])
			elseif typeof(L_1264_[1]) == "Vector3" then
				L_1264_ = L_1264_[1]
			elseif typeof(L_1264_[1]) == "CFrame" then
				L_1264_ = L_1264_[1].Position
			end
			local L_1265_ = (L_1263_.Character.HumanoidRootPart.Position - L_1264_).Magnitude
			game:GetService("TweenService"):Create(
   L_1263_.Character.HumanoidRootPart,
   TweenInfo.new(L_1265_ / L_1262_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1264_)
			}
):Play()
		end
		tp(-945, 119, -2979)
	end)
	L_1103_:AddButton("Gun Shop", function()
		local L_1266_ = 1400
		function tp(...)
			local L_1267_ = game.Players.LocalPlayer
			local L_1268_ = {
				...
			}
			if typeof(L_1268_[1]) == "number" and L_1268_[2] and L_1268_[3] then
				L_1268_ = Vector3.new(L_1268_[1], L_1268_[2], L_1268_[3])
			elseif typeof(L_1268_[1]) == "Vector3" then
				L_1268_ = L_1268_[1]
			elseif typeof(L_1268_[1]) == "CFrame" then
				L_1268_ = L_1268_[1].Position
			end
			local L_1269_ = (L_1267_.Character.HumanoidRootPart.Position - L_1268_).Magnitude
			game:GetService("TweenService"):Create(
   L_1267_.Character.HumanoidRootPart,
   TweenInfo.new(L_1269_ / L_1266_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1268_)
			}
):Play()
		end
		tp(-1658, 43, 707)
	end)
	L_1103_:AddButton("Criminal Base", function()
		local L_1270_ = 1400
		function tp(...)
			local L_1271_ = game.Players.LocalPlayer
			local L_1272_ = {
				...
			}
			if typeof(L_1272_[1]) == "number" and L_1272_[2] and L_1272_[3] then
				L_1272_ = Vector3.new(L_1272_[1], L_1272_[2], L_1272_[3])
			elseif typeof(L_1272_[1]) == "Vector3" then
				L_1272_ = L_1272_[1]
			elseif typeof(L_1272_[1]) == "CFrame" then
				L_1272_ = L_1272_[1].Position
			end
			local L_1273_ = (L_1271_.Character.HumanoidRootPart.Position - L_1272_).Magnitude
			game:GetService("TweenService"):Create(
   L_1271_.Character.HumanoidRootPart,
   TweenInfo.new(L_1273_ / L_1270_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1272_)
			}
):Play()
		end
		tp(2101, 27, 426)
	end)
	L_1103_:AddButton("Ship", function()
		local L_1274_ = 1400
		function tp(...)
			local L_1275_ = game.Players.LocalPlayer
			local L_1276_ = {
				...
			}
			if typeof(L_1276_[1]) == "number" and L_1276_[2] and L_1276_[3] then
				L_1276_ = Vector3.new(L_1276_[1], L_1276_[2], L_1276_[3])
			elseif typeof(L_1276_[1]) == "Vector3" then
				L_1276_ = L_1276_[1]
			elseif typeof(L_1276_[1]) == "CFrame" then
				L_1276_ = L_1276_[1].Position
			end
			local L_1277_ = (L_1275_.Character.HumanoidRootPart.Position - L_1276_).Magnitude
			game:GetService("TweenService"):Create(
   L_1275_.Character.HumanoidRootPart,
   TweenInfo.new(L_1277_ / L_1274_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1276_)
			}
):Play()
		end
		tp(2517, 81, 335)
	end)
	L_1103_:AddButton("Airport", function()
		local L_1278_ = 1400
		function tp(...)
			local L_1279_ = game.Players.LocalPlayer
			local L_1280_ = {
				...
			}
			if typeof(L_1280_[1]) == "number" and L_1280_[2] and L_1280_[3] then
				L_1280_ = Vector3.new(L_1280_[1], L_1280_[2], L_1280_[3])
			elseif typeof(L_1280_[1]) == "Vector3" then
				L_1280_ = L_1280_[1]
			elseif typeof(L_1280_[1]) == "CFrame" then
				L_1280_ = L_1280_[1].Position
			end
			local L_1281_ = (L_1279_.Character.HumanoidRootPart.Position - L_1280_).Magnitude
			game:GetService("TweenService"):Create(
   L_1279_.Character.HumanoidRootPart,
   TweenInfo.new(L_1281_ / L_1278_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1280_)
			}
):Play()
		end
		tp(-2146, 28, -1421)
	end)
	L_1103_:AddButton("Jewelry Store", function()
		local L_1282_ = 1400
		function tp(...)
			local L_1283_ = game.Players.LocalPlayer
			local L_1284_ = {
				...
			}
			if typeof(L_1284_[1]) == "number" and L_1284_[2] and L_1284_[3] then
				L_1284_ = Vector3.new(L_1284_[1], L_1284_[2], L_1284_[3])
			elseif typeof(L_1284_[1]) == "Vector3" then
				L_1284_ = L_1284_[1]
			elseif typeof(L_1284_[1]) == "CFrame" then
				L_1284_ = L_1284_[1].Position
			end
			local L_1285_ = (L_1283_.Character.HumanoidRootPart.Position - L_1284_).Magnitude
			game:GetService("TweenService"):Create(
   L_1283_.Character.HumanoidRootPart,
   TweenInfo.new(L_1285_ / L_1282_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1284_)
			}
):Play()
		end
		tp(-109, 96, 746)
	end)
	L_1103_:AddButton("Club", function()
		local L_1286_ = 1400
		function tp(...)
			local L_1287_ = game.Players.LocalPlayer
			local L_1288_ = {
				...
			}
			if typeof(L_1288_[1]) == "number" and L_1288_[2] and L_1288_[3] then
				L_1288_ = Vector3.new(L_1288_[1], L_1288_[2], L_1288_[3])
			elseif typeof(L_1288_[1]) == "Vector3" then
				L_1288_ = L_1288_[1]
			elseif typeof(L_1288_[1]) == "CFrame" then
				L_1288_ = L_1288_[1].Position
			end
			local L_1289_ = (L_1287_.Character.HumanoidRootPart.Position - L_1288_).Magnitude
			game:GetService("TweenService"):Create(
   L_1287_.Character.HumanoidRootPart,
   TweenInfo.new(L_1289_ / L_1286_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1288_)
			}
):Play()
		end
		tp(1093, 54, 169)
	end)
	L_1103_:AddButton("Bank", function()
		local L_1290_ = 1400
		function tp(...)
			local L_1291_ = game.Players.LocalPlayer
			local L_1292_ = {
				...
			}
			if typeof(L_1292_[1]) == "number" and L_1292_[2] and L_1292_[3] then
				L_1292_ = Vector3.new(L_1292_[1], L_1292_[2], L_1292_[3])
			elseif typeof(L_1292_[1]) == "Vector3" then
				L_1292_ = L_1292_[1]
			elseif typeof(L_1292_[1]) == "CFrame" then
				L_1292_ = L_1292_[1].Position
			end
			local L_1293_ = (L_1291_.Character.HumanoidRootPart.Position - L_1292_).Magnitude
			game:GetService("TweenService"):Create(
   L_1291_.Character.HumanoidRootPart,
   TweenInfo.new(L_1293_ / L_1290_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1292_)
			}
):Play()
		end
		tp(637, 51, 465)
	end)
	L_1103_:AddButton("Pyramid", function()
		local L_1294_ = 1400
		function tp(...)
			local L_1295_ = game.Players.LocalPlayer
			local L_1296_ = {
				...
			}
			if typeof(L_1296_[1]) == "number" and L_1296_[2] and L_1296_[3] then
				L_1296_ = Vector3.new(L_1296_[1], L_1296_[2], L_1296_[3])
			elseif typeof(L_1296_[1]) == "Vector3" then
				L_1296_ = L_1296_[1]
			elseif typeof(L_1296_[1]) == "CFrame" then
				L_1296_ = L_1296_[1].Position
			end
			local L_1297_ = (L_1295_.Character.HumanoidRootPart.Position - L_1296_).Magnitude
			game:GetService("TweenService"):Create(
   L_1295_.Character.HumanoidRootPart,
   TweenInfo.new(L_1297_ / L_1294_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1296_)
			}
):Play()
		end
		tp(-1046, 18, -499)
	end)
	L_1103_:AddButton("Casino", function()
		local L_1298_ = 1400
		function tp(...)
			local L_1299_ = game.Players.LocalPlayer
			local L_1300_ = {
				...
			}
			if typeof(L_1300_[1]) == "number" and L_1300_[2] and L_1300_[3] then
				L_1300_ = Vector3.new(L_1300_[1], L_1300_[2], L_1300_[3])
			elseif typeof(L_1300_[1]) == "Vector3" then
				L_1300_ = L_1300_[1]
			elseif typeof(L_1300_[1]) == "CFrame" then
				L_1300_ = L_1300_[1].Position
			end
			local L_1301_ = (L_1299_.Character.HumanoidRootPart.Position - L_1300_).Magnitude
			game:GetService("TweenService"):Create(
   L_1299_.Character.HumanoidRootPart,
   TweenInfo.new(L_1301_ / L_1298_, Enum.EasingStyle.Quad),
   {
				CFrame = CFrame.new(L_1300_)
			}
):Play()
		end
		tp(1697, 38, 739)
	end)
	L_1103_:AddButton("Train", function()
		if game.Workspace.Train ~= nil then
			local L_1302_ = 1400
			function tp(...)
				local L_1303_ = game.Players.LocalPlayer
				local L_1304_ = {
					...
				}
				if typeof(L_1304_[1]) == "number" and L_1304_[2] and L_1304_[3] then
					L_1304_ = Vector3.new(L_1304_[1], L_1304_[2], L_1304_[3])
				elseif typeof(L_1304_[1]) == "Vector3" then
					L_1304_ = L_1304_[1]
				elseif typeof(L_1304_[1]) == "CFrame" then
					L_1304_ = L_1304_[1].Position
				end
				local L_1305_ = (L_1303_.Character.HumanoidRootPart.Position - L_1304_).Magnitude
				game:GetService("TweenService"):Create(
   L_1303_.Character.HumanoidRootPart,
   TweenInfo.new(L_1305_ / L_1302_, Enum.EasingStyle.Quad),
   {
					CFrame = CFrame.new(L_1304_)
				}
):Play()
			end
			tp(game.Workspace.Train.Mid1.Yeet.Position)
		end
	end)
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		local L_1306_ = game:GetService("VirtualUser")
		L_1306_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		L_1306_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
end 

if game.PlaceId == 621129760 then
	local L_1307_ = {
		AutoFarm = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_1308_ = lib:CreateWindow("Bacon hub | KAT", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_1309_ = L_1308_:CreateTab("Main")
	local L_1310_ = L_1309_:CreateSector("ESP", "left")
	local L_1311_ = L_1309_:CreateSector("Silent Aim", "right")
	local L_1312_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_1312_:Toggle(true)
	L_1312_.Tracers = false
	L_1312_.Names = false
	L_1312_.Boxes = false
	L_1310_:AddToggle("Boxes", false, function(L_1313_arg0)
		L_1312_.Boxes = L_1313_arg0
	end)
	L_1310_:AddToggle("Nametags", false, function(L_1314_arg0)
		L_1312_.Names = L_1314_arg0
	end)
	L_1310_:AddToggle("Tracers", false, function(L_1315_arg0)
		L_1312_.Tracers = L_1315_arg0
	end)
	L_1311_:AddButton("Slient Aim", function()
		local L_1316_ = game:GetService("Players").LocalPlayer
		local L_1317_ = game:GetService("Workspace").CurrentCamera
		local L_1318_ = L_1316_:GetMouse()
		local function L_1319_func(L_1323_arg0, L_1324_arg1)
			local L_1325_ = nil
			local L_1326_ = math.huge
			for L_1327_forvar0, L_1328_forvar1 in pairs(game:GetService("Players"):GetPlayers()) do
				if L_1328_forvar1 ~= L_1316_ and L_1328_forvar1.Character and L_1328_forvar1.Character:FindFirstChild("Humanoid") and L_1328_forvar1.Character.Humanoid.Health ~= 0 and L_1328_forvar1.Character:FindFirstChild("HumanoidRootPart") and L_1328_forvar1.Character:FindFirstChild("Torso") then
					local L_1329_ = L_1317_:WorldToViewportPoint(L_1328_forvar1.Character.HumanoidRootPart.Position)
					local L_1330_ = (Vector2.new(L_1329_.X, L_1329_.Y) - Vector2.new(L_1323_arg0, L_1324_arg1)).magnitude
					if L_1330_ < L_1326_ then
						L_1325_ = L_1328_forvar1
						L_1326_ = L_1330_
					end
				end
			end
			return L_1325_
		end
		local L_1320_ = getrawmetatable(game)
		local L_1321_ = L_1320_.__index
		if setreadonly then
			setreadonly(L_1320_, false)
		else
			make_writeable(L_1320_, true)
		end
		local L_1322_ = newcclosure or function(L_1331_arg0)
			return L_1331_arg0
		end
		L_1320_.__index = L_1322_(function(L_1332_arg0, L_1333_arg1)
			if not checkcaller() and L_1332_arg0 == L_1318_ and tostring(L_1333_arg1) == "X" and string.find(getfenv(2).script.Name, "Client") and L_1319_func() then
				local L_1334_ = L_1319_func(L_1321_(L_1332_arg0, L_1333_arg1), L_1321_(L_1332_arg0, "Y")).Character.Head
				local L_1335_ = L_1317_:WorldToScreenPoint(L_1334_.Position)
				return L_1335_.X
			end
			if not checkcaller() and L_1332_arg0 == L_1318_ and tostring(L_1333_arg1) == "Y" and string.find(getfenv(2).script.Name, "Client") and L_1319_func() then
				local L_1336_ = L_1319_func(L_1321_(L_1332_arg0, "X"), L_1321_(L_1332_arg0, L_1333_arg1)).Character.Head
				local L_1337_ = L_1317_:WorldToScreenPoint(L_1336_.Position)
				return L_1337_.Y
			end
			if L_1332_arg0 == L_1318_ and tostring(L_1333_arg1) == "Hit" and string.find(getfenv(2).script.Name, "Client") and L_1319_func() then
				return L_1319_func(L_1318_.X, L_1318_.Y).Character.Head.CFrame
			end
			return L_1321_(L_1332_arg0, L_1333_arg1)
		end)
		if setreadonly then
			setreadonly(L_1320_, true)
		else
			make_writeable(L_1320_, false)
		end
	end)
	L_1311_:AddToggle("AutoFarm", false, function(L_1338_arg0)
		L_1307_.AutoFarm = L_1338_arg0
	end)
	spawn(function()
		while wait() do
			pcall(function()
				if L_1307_.AutoFarm == true then
					for L_1339_forvar0, L_1340_forvar1 in pairs(game.Players:GetChildren()) do
						L_1340_forvar1.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
					end
				end
			end)
		end
	end)
	spawn(function()
		while wait() do
			pcall(function()
				if L_1307_.AutoFarm == true then
					for L_1341_forvar0, L_1342_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if L_1342_forvar1.name == "Knife" then
							L_1342_forvar1.Parent = game.Players.LocalPlayer.Character
						end
					end
					game:GetService'VirtualUser':Button1Down(Vector2.new(0.9, 0.9))
					game:GetService'VirtualUser':Button1Up(Vector2.new(0.9, 0.9))
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(4001, 1003, 144))
				end
			end)
		end
	end)
	L_1311_:AddButton("Join Discord", function()
		setclipboard("https://discord.gg/4KVsXpGjHn")
	end)
end 

if game.PlaceId == 286090429 then
	local L_1343_ = {
		KillAura = false,
		KillAll = false
	}
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_1344_ = lib:CreateWindow("Bacon Hub| Arsenal", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_1345_ = L_1344_:CreateTab("Universal")
	local L_1346_ = L_1344_:CreateTab("Combat")
	local L_1347_ = L_1345_:CreateSector("ESP", "right")
	local L_1348_ = L_1345_:CreateSector("Universal", "left")
	local L_1349_ = L_1346_:CreateSector("Silent Aim", "left")
	local L_1350_ = game:GetService("Players")
	local L_1351_ = L_1350_.LocalPlayer
	local L_1352_ = L_1351_:GetMouse()
	local L_1353_ = workspace.CurrentCamera
	local L_1354_ = game:GetService("Debris")
	local L_1355_ = game:GetService("UserInputService")
	local L_1356_ = false
	local L_1357_ = game:GetService("RunService")
	getfenv().lock = _G.AimPartDogeBox
	_G.aimbotEnabled = false
	_G.isFovCircle = false
	local L_1358_ = tonumber(tick());
	fov = 350;
	function createcircle()
		local L_1363_ = Drawing.new('Circle');
		L_1363_.Transparency = 1;
		L_1363_.Thickness = 1.5;
		L_1363_.Visible = false;
		L_1363_.Color = Color3.fromRGB(0, 255, 149);
		L_1363_.Filled = false;
		L_1363_.Radius = fov;
		return L_1363_;
	end;
	local L_1359_ = createcircle();
	spawn(function()
		L_1357_:BindToRenderStep("FovCircle", 1, function()
			L_1359_.Position = Vector2.new(L_1352_.X, L_1352_.Y)
		end);
	end);
	coroutine.resume(coroutine.create(function()
		game:GetService("RunService").RenderStepped:connect(function()
			if _G.isFovCircle then
				L_1359_.Visible = true
			else
				L_1359_.Visible = false
			end
		end)
	end))
	function isFfa()
		local L_1364_ = #L_1350_:GetChildren();
		local L_1365_ = 0;
		for L_1366_forvar0 , L_1367_forvar1 in pairs(L_1350_:GetChildren()) do
			if L_1367_forvar1.Team == L_1351_.Team then
				L_1365_ = L_1365_ + 1;
			end;
		end;
		return L_1364_ == L_1365_;
	end;
	function getnearest()
		local L_1368_ = math.huge
		local L_1369_ = nil
		local L_1370_ = nil
		local L_1371_ = isFfa();
		for L_1372_forvar0, L_1373_forvar1 in next, L_1350_:GetChildren() do
			if L_1371_ == false and L_1373_forvar1.Team ~= L_1351_.Team or L_1371_ == true then
				if L_1373_forvar1.Character and  L_1373_forvar1.Character:FindFirstChild("HumanoidRootPart") and L_1373_forvar1.Character:FindFirstChild("Humanoid") and L_1373_forvar1.Character.Humanoid.Health > 0 then
					local L_1374_, L_1375_ = L_1353_:WorldToScreenPoint(L_1373_forvar1.Character["HumanoidRootPart"].Position)
					if L_1375_ then
						local L_1376_ = Ray.new(
					L_1353_.CFrame.p,
					(L_1373_forvar1.Character["Head"].Position - L_1353_.CFrame.p).unit * 500
					)
						local L_1377_ = {
							L_1351_.Character,
						}
						local L_1378_, L_1379_, L_1380_ = workspace:FindPartOnRayWithIgnoreList(L_1376_, L_1377_)
						if L_1378_ and L_1378_:FindFirstAncestorOfClass("Model") and L_1350_:FindFirstChild(L_1378_:FindFirstAncestorOfClass("Model").Name) then
							local L_1381_ = (Vector2.new(L_1352_.X, L_1352_.Y) - Vector2.new(L_1374_.X, L_1374_.Y)).magnitude
							if L_1381_ < L_1368_ and L_1381_ <= fov then
								L_1369_ = L_1373_forvar1
								L_1368_ = L_1381_
							end
						end
					end
				end
			end
		end
		return L_1369_
	end
	local L_1360_ = getrawmetatable(game)
	setreadonly(L_1360_, false)
	local L_1361_ = L_1360_.__namecall
	L_1360_.__namecall = newcclosure(function(...)
		local L_1382_ = getnamecallmethod()
		local L_1383_ = {
			...
		}
		if string.find(L_1382_, 'Ray') then
			if L_1356_ then
				if L_1383_[1].Name ~= "Workspace" then
					print(L_1383_[1])
				end;
				L_1383_[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (L_1356_.Position + Vector3.new(0, (workspace.CurrentCamera.CFrame.Position - L_1356_.Position).Magnitude / 500, 0) - workspace.CurrentCamera.CFrame.Position).unit * 5000)
			end
		end
		return L_1361_(unpack(L_1383_))
	end)
	L_1357_:BindToRenderStep("SilentAim", 1, function()
		if _G.aimbotEnabled then
			if L_1355_:IsMouseButtonPressed(0) and L_1350_.LocalPlayer.Character and L_1350_.LocalPlayer.Character:FindFirstChild("Humanoid") and L_1350_.LocalPlayer.Character.Humanoid.Health > 0 then
				local L_1384_ = getnearest()
				if L_1384_ and L_1384_.Character and L_1384_.Character:FindFirstChild("Humanoid") and L_1384_.Character.Humanoid.Health > 0 then
					local L_1385_, L_1386_ = L_1353_:WorldToScreenPoint(L_1384_.Character["Head"].Position)
					local L_1387_ = (Vector2.new(L_1352_.X, L_1352_.Y) - Vector2.new(L_1385_.X, L_1385_.Y)).magnitude
					local L_1388_, L_1389_ = L_1353_:WorldToScreenPoint(L_1384_.Character["HumanoidRootPart"].Position)
					local L_1390_ = (Vector2.new(L_1352_.X, L_1352_.Y) - Vector2.new(L_1388_.X, L_1388_.Y)).magnitude
					if L_1387_ <= L_1390_ then
						magnitude = L_1387_
					else
						magnitude = L_1390_;
					end;
					if getfenv().lock == "Head" then
						L_1356_ = workspace[L_1384_.Name]["Head"]
					else
						if getfenv().lock == "Random" then
							if magnitude == L_1390_ then
								L_1356_ = workspace[L_1384_.Name]["HumanoidRootPart"];
							else
								L_1356_ = workspace[L_1384_.Name]["Head"]
							end;
						else
							L_1356_ = workspace[L_1384_.Name]["HumanoidRootPart"];
						end;
					end;
				else
					L_1356_ = nil
				end
			end
		end
	end)
	coroutine.resume(coroutine.create(function()
		_G.WallbangLO = false
		local L_1391_ = getrawmetatable(game)
		local L_1392_ = L_1391_.__namecall
		setreadonly(L_1391_, false)
		L_1391_.__namecall = newcclosure(function(L_1393_arg0, ...)
			local L_1394_ = getnamecallmethod()
			local L_1395_ = {
				...
			}
			if L_1394_ == 'FindPartOnRayWithIgnoreList' and _G.WallbangLO then
				table.insert(L_1395_[2], game.GetService(game, 'Workspace').Map)
				return L_1392_(L_1393_arg0, unpack(L_1395_))
			end
			return L_1392_(L_1393_arg0, ...)
		end)
	end))
	local L_1362_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Why-are-we-here-to-suffer/main/Esp"))()
	L_1362_:Toggle(true)
	L_1362_.Tracers = false
	L_1362_.Names = false
	L_1362_.Boxes = false
	L_1347_:AddToggle("Boxes", false, function(L_1396_arg0)
		L_1362_.Boxes = L_1396_arg0
	end)
	L_1347_:AddToggle("Nametags", false, function(L_1397_arg0)
		L_1362_.Names = L_1397_arg0
	end)
	L_1347_:AddToggle("Tracers", false, function(L_1398_arg0)
		L_1362_.Tracers = L_1398_arg0
	end)
	L_1349_:AddToggle("Silent Aim", false, function(L_1399_arg0)
		_G.aimbotEnabled = L_1399_arg0
	end)
	L_1349_:AddToggle("Fov Circle", false, function(L_1400_arg0)
		_G.isFovCircle = L_1400_arg0
	end)
	L_1349_:AddToggle("Wallbang", false, function(L_1401_arg0)
		_G.wallbangLO = L_1401_arg0
	end)
	L_1349_:AddToggle("KillAura", false, function(L_1402_arg0)
		L_1343_.KillAura = L_1402_arg0
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1343_.KillAura == true then
					for L_1403_forvar0, L_1404_forvar1 in pairs(game.Players:GetPlayers()) do
						if L_1404_forvar1.Name == game.Players.LocalPlayer.Name then
						else
							local L_1405_ = 80
							local L_1406_ = workspace[L_1404_forvar1.Name].Hitbox
							game:GetService("ReplicatedStorage").Events.FallDamage:FireServer(L_1405_, L_1406_)
						end
					end
				end
			end)
		end
	end)
	L_1349_:AddToggle("AutoFarm", false, function(L_1407_arg0)
		L_1343_.KillAll = L_1407_arg0
	end)
	spawn(function()
		while task.wait(0.1) do
			pcall(function()
				if L_1343_.KillAll == true then
					local L_1408_ = {
						[1] = "TBC"
					}
					game:GetService("ReplicatedStorage").Events.JoinTeam:FireServer(unpack(L_1408_))
					function getClosest()
						local L_1409_ = 210
						local L_1410_ = nil
						for L_1411_forvar0, L_1412_forvar1 in pairs(game.Players:GetChildren()) do
							if L_1412_forvar1 ~= game.Players.LocalPlayer and L_1412_forvar1.Team ~= game.Players.LocalPlayer.Team then
								local L_1413_ = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_1412_forvar1.Character.HumanoidRootPart.Position).magnitude
								if L_1413_ < L_1409_ then
									L_1409_ = L_1413_
									L_1410_ = L_1412_forvar1
								end
							end
						end
						return L_1410_
					end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosest().Character.HumanoidRootPart.CFrame * CFrame.new(0, 4, 8)
					for L_1414_forvar0, L_1415_forvar1 in pairs(game.Players:GetPlayers()) do
						if L_1415_forvar1.Name == game.Players.LocalPlayer.Name then
						else
							wait()
							local L_1416_ = 60
							local L_1417_ = workspace[L_1415_forvar1.Name].Hitbox
							game:GetService("ReplicatedStorage").Events.FallDamage:FireServer(L_1416_, L_1417_)
						end
					end
				end
			end)
		end
	end)
	L_1348_:AddButton("Reset", function()
		game.Players.LocalPlayer.Character["Humanoid"]:Destroy()
	end)
	L_1348_:AddButton("Rejoin", function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService"Players".LocalPlayer)
	end)
end 

if game.PlaceId == 301549746 then
	lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BaconLords/Random-Shit/main/andadiawd")()
	local L_1418_ = lib:CreateWindow("Bacon hub | Counter Blox", Vector2.new(492, 598), Enum.KeyCode.RightShift)
	local L_1419_ = L_1418_:CreateTab("Main")
	local L_1420_ = L_1419_:CreateSector("Misc", "left")
	L_1420_:AddButton("Inf Money", function()
		val = true
		if val == true then
			game.Players.LocalPlayer.Cash.Value = 16000
			CashHook = game.Players.LocalPlayer.Cash:GetPropertyChangedSignal("Value"):connect(function()
				game.Players.LocalPlayer.Cash.Value = 16000
			end)
		elseif val == false and CashHook then
			CashHook:Disconnect()
		end
	end)
	L_1420_:AddButton("Kill All", function()
		local function L_1421_func(L_1422_arg0)
			if L_1422_arg0 and L_1422_arg0.Character and L_1422_arg0.Character.FindFirstChild(L_1422_arg0.Character, "Humanoid") and L_1422_arg0.Character.Humanoid.Health > 0 then
				return true
			end
			return false
		end
		pcall(function()
			for L_1423_forvar0, L_1424_forvar1 in pairs(game.Players:GetChildren()) do
				if L_1424_forvar1 ~= game.Players.LocalPlayer and L_1421_func(L_1424_forvar1) and L_1421_func(game.Players.LocalPlayer) and L_1424_forvar1.Team ~= game.Players.LocalPlayer.Team then
					local L_1425_ = {
						[1] = L_1424_forvar1.Character.Head,
						[2] = L_1424_forvar1.Character.Head.Position,
						[3] = "Banana",
						[4] = 100,
						[5] = game.Players.LocalPlayer.Character.Gun,
						[8] = 100,
						[9] = false,
						[10] = false,
						[11] = Vector3.new(),
						[12] = 100,
						[13] = Vector3.new()
					}
					game.ReplicatedStorage.Events.HitPart:FireServer(unpack(L_1425_))
				end
			end
		end)
	end)
	L_1420_:AddButton("Godmode", function()
		pcall(function()
			game.ReplicatedStorage.Events.FallDamage:FireServer(0 / 0)
			game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				game.Players.LocalPlayer.Character.Humanoid.Health = 100
			end)
		end)
	end)
	L_1420_:AddButton("No Recoil", function()
		local L_1426_ = getsenv(game.Players.LocalPlayer.PlayerGui:WaitForChild("Client"))
		val = true
		if val == true then
			game:GetService("RunService"):BindToRenderStep("NoRecoil", 100, function()
				L_1426_.resetaccuracy()
				L_1426_.RecoilX = 0
				L_1426_.RecoilY = 0
			end)
		elseif val == false then
			game:GetService("RunService"):UnbindFromRenderStep("NoRecoil")
		end
	end)
	L_1420_:AddButton("Inf Stamina", function()
		val = true
		if val == true then
			game:GetService("RunService"):BindToRenderStep("Stamina", 100, function()
				if cbClient.crouchcooldown ~= 0 then
					cbClient.crouchcooldown = 0
				end
			end)
		elseif val == false then
			game:GetService("RunService"):UnbindFromRenderStep("Stamina")
		end
	end)
	L_1420_:AddButton("Plant C4", function()
		LocalPlayer = game.Players.LocalPlayer
		local function L_1427_func(L_1429_arg0)
			if L_1429_arg0 and L_1429_arg0.Character and L_1429_arg0.Character.FindFirstChild(L_1429_arg0.Character, "Humanoid") and L_1429_arg0.Character.Humanoid.Health > 0 then
				return true
			end
			return false
		end
		local function L_1428_func()
			if (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.SpawnPoints.C4Plant.Position).magnitude > (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.SpawnPoints.C4Plant2.Position).magnitude then
				return "A"
			else
				return "B"
			end
		end
		pcall(function()
			if L_1427_func(LocalPlayer) and workspace.Map.Gamemode.Value == "defusal" and workspace.Status.Preparation.Value == false and not planting then
				planting = true
				local L_1430_ = LocalPlayer.Character.HumanoidRootPart.CFrame
				workspace.CurrentCamera.CameraType = "Fixed"
				LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.SpawnPoints.C4Plant.CFrame
				wait(0.2)
				game.ReplicatedStorage.Events.PlantC4:FireServer((L_1430_ + Vector3.new(0, -2.75, 0)) * CFrame.Angles(math.rad(90), 0, math.rad(180)), L_1428_func())
				wait(0.2)
				LocalPlayer.Character.HumanoidRootPart.CFrame = L_1430_
				LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				game.Workspace.CurrentCamera.CameraType = "Custom"
				planting = false
			end
		end)
	end)
	L_1420_:AddButton("Inf Jump", function()
		val = true
		if val == true then
			JumpHook = game:GetService("UserInputService").JumpRequest:connect(function()
				game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end)
		elseif val == false and JumpHook then
			JumpHook:Disconnect()
		end
	end)
	L_1420_:AddButton("Defuse C4", function()
		LocalPlayer = game.Players.LocalPlayer
		local function L_1431_func(L_1433_arg0)
			if L_1433_arg0 and L_1433_arg0.Character and L_1433_arg0.Character.FindFirstChild(L_1433_arg0.Character, "Humanoid") and L_1433_arg0.Character.Humanoid.Health > 0 then
				return true
			end
			return false
		end
		local function L_1432_func()
			if (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.SpawnPoints.C4Plant.Position).magnitude > (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.SpawnPoints.C4Plant2.Position).magnitude then
				return "A"
			else
				return "B"
			end
		end
		pcall(function()
			if L_1431_func(LocalPlayer) and workspace.Map.Gamemode.Value == "defusal" and not defusing and workspace:FindFirstChild("C4") then
				defusing = true
				LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				local L_1434_ = LocalPlayer.Character.HumanoidRootPart.CFrame
				workspace.CurrentCamera.CameraType = "Fixed"
				LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.C4.Handle.CFrame + Vector3.new(0, 2, 0)
				LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				wait(0.1)
				LocalPlayer.Backpack.PressDefuse:FireServer(workspace.C4)
				LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				wait(0.25)
				if L_1431_func(LocalPlayer) and workspace:FindFirstChild("C4") and workspace.C4:FindFirstChild("Defusing") and workspace.C4.Defusing.Value == LocalPlayer then
					LocalPlayer.Backpack.Defuse:FireServer(workspace.C4)
				end
				LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				wait(0.2)
				LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				LocalPlayer.Character.HumanoidRootPart.CFrame = L_1434_
				LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				game.Workspace.CurrentCamera.CameraType = "Custom"
				defusing = false
			end
		end)
	end)
end 

sector2:AddToggle("DiamondFarm", false, function(L_1435_arg0)
	getgenv().DiamondFarm = L_1435_arg0
	for L_1436_forvar0, L_1437_forvar1 in pairs(game.Workspace:GetDescendants()) do
		if L_1437_forvar1.Name == "Seat" or L_1437_forvar1.Name == "zebra couch seat" or L_1437_forvar1.Name == "VehicleSeat" then
			L_1437_forvar1:Destroy()
		end
	end
	spawn(function()
		while task.wait(1) do
			if getgenv().DiamondFarm == false then
				game.Workspace.Gravity = 196
			end
		end
	end)
	spawn(function()
		while DiamondFarm do
			wait(0.3)
			pcall(function()
				for L_1438_forvar0, L_1439_forvar1 in pairs(game:GetService("Workspace").CollectibleDiamonds:GetChildren()) do
					if L_1439_forvar1:IsA("Part") and L_1439_forvar1.Transparency == 0 then
						tp(L_1439_forvar1.CFrame)
						game.Workspace.Gravity = 0
					end
				end
			end)
		end
	end)
end)

sector2:AddSlider("TweenSpeed", 1, 1, 350, 1, function(L_1440_arg0)
	getgenv().TweenSpeed = L_1440_arg0
	local L_1441_ = TweenSpeed
	function tp(...)
		local L_1442_ = game.Players.LocalPlayer
		local L_1443_ = {
			...
		}
		if typeof(L_1443_[1]) == "number" and L_1443_[2] and L_1443_[3] then
			L_1443_ = Vector3.new(L_1443_[1], L_1443_[2], L_1443_[3])
		elseif typeof(L_1443_[1]) == "Vector3" then
			L_1443_ = L_1443_[1]
		elseif typeof(L_1443_[1]) == "CFrame" then
			L_1443_ = L_1443_[1].Position
		end
		local L_1444_ = (L_1442_.Character.HumanoidRootPart.Position - L_1443_).Magnitude
		game:GetService("TweenService"):Create(
   L_1442_.Character.HumanoidRootPart,
   TweenInfo.new(L_1444_ / L_1441_, Enum.EasingStyle.Quad),
   {
			CFrame = CFrame.new(L_1443_)
		}
):Play()
	end
end)
