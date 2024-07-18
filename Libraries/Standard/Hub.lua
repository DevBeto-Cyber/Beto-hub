local message = Instance.new("Message", workspace)
		 message.Text = "Script Loading..."
		 wait(1)
		 message:Destroy()
		 local VirtualInputManager = game:GetService("VirtualInputManager")
		 VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9.Value, false, game)
local Update = loadstring(game:HttpGet"https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Libraries/Standard/Teste.txt")()

  print("Library Executada")


---------------------------------------------------                --//Tabs\\--

local Library = Update:Window("    Beto","16329392936",Enum.KeyCode.RightControl);

local H = Library:AddTab("Home","16308336145")
local Main = Library:AddTab("Character","16293827543")
local T = Library:AddTab("Target","16293860067")
local A = Library:AddTab("Animations","16294131291")
local E = Library:AddTab("Esp","16294207372")
local Misc = Library:AddTab("Misc","16294223840")
---------------------------------------------------              --//Variaveis\\--
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local plr = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local Light = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
---------------------------------------------------                 --//Functions\\--

function copySpawnCoordinatesToClipboard(speaker)
    local spawnpos = speaker.Character:WaitForChild("HumanoidRootPart").CFrame.Position
    local coordinatesString = 'Spawn point coordinates: ' .. tostring(spawnpos)
    setclipboard(coordinatesString)
end

local function RandomChar()
	local length = math.random(1,5)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function GetPing()
	return (game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())/1000
end

local function GetPlayer(UserDisplay)
	if UserDisplay ~= "" then
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name:lower():match(UserDisplay) or v.DisplayName:lower():match(UserDisplay) then
                return v
            end
        end
		return nil
	else
		return nil
    end
end

local function GetCharacter(Player)
	if Player.Character then
		return Player.Character
	end
end

local function GetRoot(Player)
	if GetCharacter(Player):FindFirstChild("HumanoidRootPart") then
		return GetCharacter(Player).HumanoidRootPart
	end
end

local function TeleportTO(posX,posY,posZ,player,method)
	pcall(function()
		if method == "safe" then
			task.spawn(function()
				for i = 1,30 do
					task.wait()
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
					if player == "pos" then
						GetRoot(plr).CFrame = CFrame.new(posX,posY,posZ)
					else
						GetRoot(plr).CFrame = CFrame.new(GetRoot(player).Position)+Vector3.new(0,2,0)
					end
				end
			end)
		else
			GetRoot(plr).Velocity = Vector3.new(0,0,0)
			if player == "pos" then
				GetRoot(plr).CFrame = CFrame.new(posX,posY,posZ)
			else
				GetRoot(plr).CFrame = CFrame.new(GetRoot(player).Position)+Vector3.new(0,2,0)
			end
		end
	end)
end
local function PredictionTP(player,method)
	local root = GetRoot(player)
	local pos = root.Position
	local vel = root.Velocity
	GetRoot(plr).CFrame = CFrame.new((pos.X)+(vel.X)*(GetPing()*3.5),(pos.Y)+(vel.Y)*(GetPing()*2),(pos.Z)+(vel.Z)*(GetPing()*3.5))
	if method == "safe" then
		task.wait()
		GetRoot(plr).CFrame = CFrame.new(pos)
		task.wait()
		GetRoot(plr).CFrame = CFrame.new((pos.X)+(vel.X)*(GetPing()*3.5),(pos.Y)+(vel.Y)*(GetPing()*2),(pos.Z)+(vel.Z)*(GetPing()*3.5))
	end
end

local function ToggleRagdoll(bool)
	pcall(function()
		plr.Character["Falling down"].Disabled = bool
		plr.Character["Swimming"].Disabled = bool
		plr.Character["StartRagdoll"].Disabled = bool
		plr.Character["Pushed"].Disabled = bool
		plr.Character["RagdollMe"].Disabled = bool
	end)
end

function ToggleVoidProtection(bool)
	if bool then
		game.Workspace.FallenPartsDestroyHeight = 0/0
	else
		game.Workspace.FallenPartsDestroyHeight = -500
	end
end

function Tfling()
    task.spawn(function()
        local RVelocity = nil
        while TflingActive do
            pcall(function()
                RVelocity = GetRoot(plr).Velocity 
                GetRoot(plr).Velocity = Vector3.new(math.random(-150, 150), -25000, math.random(-150, 150))
                RunService.RenderStepped:wait()
                GetRoot(plr).Velocity = RVelocity
            end)
            RunService.Heartbeat:wait()
        end
    end)
end

spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.AutoClick or Fastattack then
                 pcall(function()
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
                end)
            end
        end)
       end)

---------------------------------------------------                 --//Home\\--
H:AddLabel("Home")
H:AddLine()
local Time = H:AddLabel("Executor Time");
local RunTime = H:AddLabel("Run Time");
local StartTime = tick();

spawn(function()
    getgenv().Time = true;
    while true do
        wait(.1)
        UpdateTime()
    end
end);

function UpdateTime()
    local date = os.date("*t");
    local hour = (date.hour) % 24;
    local ampm = hour < 12 and "AM" or "PM";
    local timezone = string.format("%02i:%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, date.sec, ampm);
    local datetime = string.format("%02d/%02d/%04d %02d:%02d:%02d", date.day, date.month, date.year, date.hour, date.min, date.sec);
    local LocalizationService = game:GetService("LocalizationService");
    local Players = game:GetService("Players");
    local player = Players.LocalPlayer;
    local name = player.Name;
    local result, code = pcall(function()
        return LocalizationService:GetCountryRegionForPlayerAsync(player)
    end);

    local elapsedTime = tick() - StartTime;
    local runTimeSeconds = math.floor(elapsedTime)
    local runTimeMinutes = math.floor(elapsedTime / 60)
    local runTimeHours = math.floor(elapsedTime / 60 / 60)
    local secondsRemaining = runTimeSeconds - (runTimeMinutes * 60)
    local minutesRemaining = runTimeMinutes - (runTimeHours * 60)

    if runTimeHours < 1 then
        if runTimeMinutes < 1 then
            RunTime:Set("Run Time: " .. runTimeSeconds .. " Second(s)")
        else
            RunTime:Set("Run Time: " .. runTimeMinutes .. " Minute(s), " .. secondsRemaining .. " Second(s)")
        end
    else
        RunTime:Set("Run Time: " .. runTimeHours .. " Hour(s), " .. minutesRemaining .. " Minute(s), " .. secondsRemaining .. " Second(s)")
    end

    Time:Set("Executor Time: " .. datetime .. " [ " .. code .. " ]");
end

H:AddLabel("Seja Bem Vindo Ao Beto Hub")
H:AddLabel("Nosso Script Tem Suporte Para Pc e Mobile"
)
--------------------------------------------------
              --//Character\\--
Main:AddLabel("Main")
Main:AddLine()


Main:AddTextbox("Cmdbar","Type here!",function(t)
  command = t
	Players:Chat(command)
	SendNotify("Executed",(""..command),3)
	t.Text = ""
  end)
Main:AddButton("Shiftlock",function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/Shiftlock.lua'))()
end)

Main:AddToggle("Touch", false, function(v)
    TflingActive = v
    if TflingActive then
        local fixpos = GetRoot(plr).Position
        ToggleVoidProtection(true)
        TeleportTO(fixpos.X, fixpos.Y, fixpos.Z, "pos", "safe")
        Tfling()
    else
        ToggleVoidProtection(false)
    
    end
end)

Main:AddButton("Respawn",function()
   local RsP = GetRoot(plr).Position
	plr.Character.Humanoid.Health = 0
	plr.CharacterAdded:wait(); task.wait(GetPing()+0.1)
	TeleportTO(RsP.X,RsP.Y,RsP.Z,"pos","safe")
end)

Main:AddToggle("Auto Click",false,function(value)
_G.AutoClick = value
end)

 Main:AddButton("Explode",function()
  ToggleRagdoll(false)
	task.wait()
	plr.Character.Humanoid:ChangeState(0)
	local bav = Instance.new("BodyAngularVelocity")
	bav.Parent = GetRoot(plr)
	bav.Name = "Spin"
	bav.MaxTorque = Vector3.new(0,math.huge,0)
	bav.AngularVelocity = Vector3.new(0,150,0)
	task.wait(3)
	plr.Character.Humanoid:ChangeState(15)
end)
Main:AddLine()
---------------------------------------------------                --//Target\\--
    T:AddLabel("Target")
    T:AddLine()                                     
    local plyserv = T:AddLabel("Players")
    spawn(function()
        while wait() do
            pcall(function()
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 81 then
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."81".." ".."(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player :".." "..i.." ".."/".." ".."81")
                    else
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."81")
                    end
                end
            end)
        end
    end)
    
    Playerslist = {}
    
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(Playerslist,v.Name)
    end
    
    local SelectedPly = T:AddDropdown("Select Player",Playerslist,function(value)
        _G.SelectPly = value
    end)
    
    T:AddButton("Refresh Player",function()
        Playerslist = {}
        SelectedPly:Clear()
        for i,v in pairs(game:GetService("Players"):GetChildren()) do  
            SelectedPly:Add(v.Name)
        end
    end)
    
    T:AddToggle("Spectate Player",false,function(value)
        SpectatePlys = value
        local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
        local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
        repeat wait(.1)
            game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
        until SpectatePlys == false 
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    end)
   
        T:AddButton("Teleport",function()
      if SelectedPly ~= nil then
		TeleportTO(0,2,0,Players[_G.SelectPly],"safe")
	end
      end)
    
---------------------------------------------------
                --//Animations\\--
A:AddLabel("Animations")
A:AddLine()
A:AddLabel("Aviso: Os emote não funciona no delta.")
A:AddLabel("More animations coming soon.../Mais animações embreve...")

A:AddButton("All Emotes",function()
  loadstring(game:HttpGet("https://scriptblox.com/raw/Brookhaven-RP-all-emotes-6849"))()
end)
A:AddButton("idle",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=4417978624"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4417979645"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Vampire",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
	      Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
	      Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921269718"
	      Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
	      Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
	      Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
	      Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
         A:AddButton("Cartoon",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
         A:AddButton("Old",function()
                local Animate = plr.Character:WaitForChild("Animate")
        
                Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=17172918855"
        	      Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=17173014241"
        	      Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921244891"
        	      Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921240218"
        	      Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921242013"
        	      Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921229866"
        	      Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921241244"
        
                plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
            end
)
        A:AddButton("Hero",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("ZombieClassic",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Bold",function()
                local Animate = plr.Character:WaitForChild("Animate")
        
                Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=16738333868"
                	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=16738334710"
                	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=16738340646PROP"
                	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=16738337225PROP"
                	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=16738336650PROP"
                	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=16738332169PROP"
                	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=16738333171PROP"
        
                plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
            end
)
        A:AddButton("Mage",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)  
        A:AddButton("Ghost",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Elder",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Levitation",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)  
        A:AddButton("Astronaut",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)  
        A:AddButton("Ninja",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Werewolf",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Pirate",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Sneaky",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
            Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
            Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
            Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
            Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
            Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
            Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Toy",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Knight",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Rthro",function()
                  local Animate = plr.Character:WaitForChild("Animate")
          
                  Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=17172918855"
          	      Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=17173014241"
          	      Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=11600249883"
          	      Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=11600211410"
          	      Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=11600210487"
          	      Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=11600205519"
          	      Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=11600206437"
          
                  plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
              end
)
        A:AddButton("Robot",function()
                  local Animate = plr.Character:WaitForChild("Animate")
          
                  Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921248039"
          	      Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921248831"
          	      Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921255446"
          	      Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921250460"
          	      Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921252123"
          	      Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921247141"
          	      Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921251156"
          
                  plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
              end
)
        A:AddButton("Confident",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Popstar",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Stylist",function()
                  local Animate = plr.Character:WaitForChild("Animate")
          
                  Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921272275"
          	      Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921273958"
          	      Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921283326"
          	      Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921276116"
          	      Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921279832"
          	      Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921271391"
          	      Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921278648"
          
                  plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
              end
)
        A:AddButton("Bullous",function()
                  local Animate = plr.Character:WaitForChild("Animate")
          
                  Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921054344"
          	      Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921055107"
          	      Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10980888364"
          	      Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921057244"
          	      Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921062673"
          	      Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921271391"
          	      Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921278648"
          
                  plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
              end
)
        A:AddButton("Princess",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
)
        A:AddButton("Cowboy",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end)
        A:AddButton("Patrol",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1150944216"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end)
        A:AddButton("Zombie Fe",function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3489174223"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3489173414"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
  end
)
 A:AddLine()
---------------------------------------------------                 --//Esp\\--
E:AddLabel("Esp")
E:AddLine()
E:AddButton("Esp Box",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/EspBox.lua"))()
end)

E:AddButton("Red Circle",function()
  local gui = Instance.new("BillboardGui");
gui.Name = "";
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
local frame = Instance.new("Frame", gui);
frame.BackgroundColor3 = Color3.fromRGB(170, 0, 0);
frame.Size = UDim2.new(1, 0, 1, 0);
frame.BorderSizePixel = 4;
frame.BorderColor3 = Color3.fromRGB(0, 0, 0);
local gi = gui:Clone();
local body = frame:Clone();
body.Parent = gi;
body.BackgroundColor3 = Color3.fromRGB(0, 170, 170);

for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= game:GetService("Players").LocalPlayer.Name and v.Character and v.Character:FindFirstChild("Head") then
        gui:Clone().Parent = v.Character.Head;
    end
end
end)
---------------------------------------------------
                   --//Misc\\--
  Misc:AddLabel("Misc")
  Misc:AddLine()
  Misc:AddLabel("Chat Spy:")
  Misc:AddLabel("Only works in normal chat / Só funciona no chat normal")
  
  Misc:AddButton("Anti-Fling",function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/Anti-fling.lua"))()
  end)
  
  Misc:AddToggle("Void Protection",false,function(bool)
  if bool then
   ToggleVoidProtection(true)
   print("sucess")
	else
		ToggleVoidProtection(false)
		end
  end
  )
  Misc:AddButton("InfYield",function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Yield/main/main.lua"))()
  end
  )
  
  Misc:AddButton("Chat spy",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/Spy.lua"))()
  end
  )
  Misc:AddButton("Translator", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/Translator.lua"))() end
  )
  Misc:AddButton("Fps unlock",function()
    setfpscap(9999999)
  end
  )
  Misc:AddButton("Fly",function()
  loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-I-Fly-gui-V3-I-6627"))()
  end
  )
  Misc:AddButton("Rejoin",function()
    local Rejoin = coroutine.create(function()
    local Success, ErrorMessage = pcall(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)

    if ErrorMessage and not Success then
        warn(ErrorMessage)
    end
    end)
  coroutine.resume(Rejoin)
  end
  )
  Misc:AddButton("HttpSpy",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/HttpSpy.lua"))()
    end)
  Misc:AddButton("Get Cords", function()
   copySpawnCoordinatesToClipboard(game.Players.LocalPlayer)
  end
  )
 Misc:AddLine()
---------------------------------------------------
print("Script Carregado com sucesso")
