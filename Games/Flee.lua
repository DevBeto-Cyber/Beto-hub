local CheckMobile = function()
    if game:GetService("UserInputService").TouchEnabled then
        return true 
    end
end 

IsMobile = CheckMobile()

local windowWidth, windowHeight

if not IsMobile then 
    windowWidth, windowHeight = 600, 460  
else
    local ScreenGui1 = Instance.new("ScreenGui")
    local ImageButton1 = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")
    
    ScreenGui1.Name = "ImageButton"
    ScreenGui1.Parent = game.CoreGui
    ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    ImageButton1.Parent = ScreenGui1
    ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton1.BorderSizePixel = 0
    ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton1.Size = UDim2.new(0, 50, 0, 50)
    ImageButton1.Draggable = true
    ImageButton1.Image = "rbxassetid://16329392936"
    ImageButton1.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl",false,game)
    end)
    UICorner.Parent = ImageButton1
    
    local Namfon = Instance.new("Part",workspace)
    Namfon.Size = Vector3.new(30,5,30)
    Namfon.Name = "DeeKub"
    Namfon.Transparency = 1
    Namfon.CanCollide = true
    Namfon.Anchored = true
end


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local GuiService = game:GetService("GuiService")

local screenResolution = GuiService:GetScreenResolution()
local screenWidth = screenResolution.X
local screenHeight = screenResolution.Y
local windowWidth = screenWidth * 0.7
local windowHeight = screenHeight * 0.8

local Window = Fluent:CreateWindow({
    Title = "Flee The Facility",
    SubTitle = "by Beto",
    TabWidth = 160,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({
      Title = "Main",
      Icon = "book"
      }),
    Players = Window:AddTab({
      Title = "Players",
      Icon = "users"
    }),
    Esp = Window:AddTab({
      Title = "Esp",
      Icon = "eye"
    }),
    Misc = Window:AddTab({
      Title = "Misc",
      Icon = "align-justify"
    })
}

--_______________//variáveis\\____________________--
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local plr = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local Light = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
--________________//functions\\___________________--
local function RandomChar()
	local length = math.random(1,5)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function ToggleVoidProtection(bool)
	if bool then
		game.Workspace.FallenPartsDestroyHeight = 0/0
	else
		game.Workspace.FallenPartsDestroyHeight = -500
	end
end

local function Hop()
             local PlaceID = game.PlaceId
             local AllIDs = {}
             local foundAnything = ""
             local actualHour = os.date("!*t").hour
             local Deleted = false
             function TPReturner()
                 local Site;
                 if foundAnything == "" then
                     Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                 else
                     Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                 end
                 local ID = ""
                 if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                     foundAnything = Site.nextPageCursor
                 end
                 local num = 0;
                 for i,v in pairs(Site.data) do
                     local Possible = true
                     ID = tostring(v.id)
                     if tonumber(v.maxPlayers) > tonumber(v.playing) then
                         for _,Existing in pairs(AllIDs) do
                             if num ~= 0 then
                                 if ID == tostring(Existing) then
                                     Possible = false
                                 end
                             else
                                 if tonumber(actualHour) ~= tonumber(Existing) then
                                     local delFile = pcall(function()
                                         AllIDs = {}
                                         table.insert(AllIDs, actualHour)
                                     end)
                                 end
                             end
                             num = num + 1
                         end
                         if Possible == true then
                             table.insert(AllIDs, ID)
                             wait()
                             pcall(function()
                                 wait()
                                 game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                             end)
                             wait(4)
                         end
                     end
                 end
             end
             function Teleport() 
                 while wait() do
                     pcall(function()
                         TPReturner()
                         if foundAnything ~= "" then
                             TPReturner()
                         end
                     end)
                 end
             end
             Teleport()
end

local workspace = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera

--// Settings:
local on = true -- Inicialmente desativado
local Box_Color = Color3.fromRGB(0, 255, 50)
local Box_Thickness = 1.4
local Box_Transparency = 1 -- 1 Visível, 0 Não visível
local Tracers = true
local Tracer_Color = Color3.fromRGB(0, 255, 50)
local Tracer_Thickness = 1.4
local Tracer_Transparency = 1 -- 1 Visível, 0 Não visível
local Autothickness = false -- Faz a tela menos carregada
local Team_Check = true
local red = Color3.fromRGB(227, 52, 52)
local green = Color3.fromRGB(88, 217, 24)

-- Função para alternar o estado do ESP
function toggleESP()
    on = not on
    if not on then
        for _, player in ipairs(game.Players:GetPlayers()) do
            local character = player.Character
            if character then
                for _, obj in pairs(character:GetChildren()) do
                    if obj:IsA("Drawing") then
                        obj.Visible = false
                    end
                end
            end
        end
    end
end

local function getBeast()
		local listplayers = game.Players:GetChildren()
		for _, player in ipairs(listplayers) do
			local character = player.Character
			if character ~= nil and character:FindFirstChild("BeastPowers") then
				return player
			end
		end
	end

local function NewLine()
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(1, 1)
    line.Color = Box_Color
    line.Thickness = Box_Thickness
    line.Transparency = Box_Transparency
    return line
end

--// Main Function:
for _, v in pairs(game.Players:GetPlayers()) do
    --// Lines for 3D box (12)
    local lines = {
        line1 = NewLine(),
        line2 = NewLine(),
        line3 = NewLine(),
        line4 = NewLine(),
        line5 = NewLine(),
        line6 = NewLine(),
        line7 = NewLine(),
        line8 = NewLine(),
        line9 = NewLine(),
        line10 = NewLine(),
        line11 = NewLine(),
        line12 = NewLine(),
        Tracer = NewLine()
    }

    lines.Tracer.Color = Tracer_Color
    lines.Tracer.Thickness = Tracer_Thickness
    lines.Tracer.Transparency = Tracer_Transparency

    --// Updates ESP (lines) in render loop
    local function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if on and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Name ~= player.Name and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") then
                local pos, vis = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if vis then
                    local Scale = v.Character.Head.Size.Y / 2
                    local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                    local Top1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                    local Top2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                    local Top3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                    local Top4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --// Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//S ides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                    --// Tracer:
                    if Tracers then
                        local trace = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)
                        lines.Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                        lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                    end

                    --// Teamcheck:
                    if Team_Check then
                        local beastPlayer = getBeast()
                        if v == beastPlayer then
                            for _, x in pairs(lines) do
                                x.Color = red
                            end
                        else
                            for _, x in pairs(lines) do
                                x.Color = green
                            end
                        end
                    end

                    --// Autothickness:
                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1 / distance * 100, 0.1, 4) --0.1 é a espessura mínima, 4 é a máxima
                        for _, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else
                        for _, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end

                    for _, x in pairs(lines) do
                        if x ~= lines.Tracer then
                            x.Visible = true
                        end
                    end
                    if Tracers then
                        lines.Tracer.Visible = true
                    end
                else
                    for _, x in pairs(lines) do
                        x.Visible = false
                    end
                end
            else
                for _, x in pairs(lines) do
                    x.Visible = false
                end
                if not game.Players:FindFirstChild(v.Name) then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end

game.Players.PlayerAdded:Connect(function(newplr)
    --// Lines for 3D box (12)
    local lines = {
        line1 = NewLine(),
        line2 = NewLine(),
        line3 = NewLine(),
        line4 = NewLine(),
        line5 = NewLine(),
        line6 = NewLine(),
        line7 = NewLine(),
        line8 = NewLine(),
        line9 = NewLine(),
        line10 = NewLine(),
        line11 = NewLine(),
        line12 = NewLine(),
        Tracer = NewLine()
    }

    lines.Tracer.Color = Tracer_Color
    lines.Tracer.Thickness = Tracer_Thickness
    lines.Tracer.Transparency = Tracer_Transparency

    local function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if on and newplr.Character and newplr.Character:FindFirstChild("Humanoid") and newplr.Character:FindFirstChild("HumanoidRootPart") and newplr.Name ~= player.Name and newplr.Character.Humanoid.Health > 0 and newplr.Character:FindFirstChild("Head") then
                local pos, vis = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                if vis then
                    local Scale = newplr.Character.Head.Size.Y / 2
                    local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                    local Top1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                    local Top2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                    local Top3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                    local Top4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --// Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//S ides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                    --// Tracer:
                    if Tracers then
                        local trace = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)
                        lines.Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                        lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                    end

                    --// Teamcheck:
                    if Team_Check then
                        local beastPlayer = getBeast()
                        if newplr == beastPlayer then
                            for _, x in pairs(lines) do
                                x.Color = red
                            end
                        else
                            for _, x in pairs(lines) do
                                x.Color = green
                            end
                        end
                    end

                    --// Autothickness:
                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - newplr.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1 / distance * 100, 0.1, 4) --0.1 é a espessura mínima, 4 é a máxima
                        for _, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else
                        for _, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end

                    for _, x in pairs(lines) do
                        if x ~= lines.Tracer then
                            x.Visible = true
                        end
                    end
                    if Tracers then
                        lines.Tracer.Visible = true
                    end
                else
                    for _, x in pairs(lines) do
                        x.Visible = false
                    end
                end
            else
                for _, x in pairs(lines) do
                    x.Visible = false
                end
                if not game.Players:FindFirstChild(newplr.Name) then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end)

local function EspPc()
		     if Pc then
		         for _, obj in ipairs(game.Workspace:GetDescendants()) do
		             if obj.Name == "ComputerTable" and not obj:FindFirstChild("PCHighlight") then
		                 local hili = Instance.new("Highlight", workspace)
		                 esps["PCHighlight"] = hili
		                 hili.Name = "PCHighlight"
		                 hili.OutlineTransparency = 1.000
		                 hili.Adornee = obj
		                 hili.FillColor = obj:FindFirstChild("Screen").Color
		             end
		         end
		     else
		         for _, obj in ipairs(game.Workspace:GetDescendants()) do
		             if obj:FindFirstChild('PCHighlight') then
		                 obj:FindFirstChild('PCHighlight'):Destroy()
		             end
		         end
		     end
		 end
  			      
--main
    Tabs.Main:AddButton({
      Title = "Shiftlock",
      Description = "Script Shiftlock",
      Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zBbLeZmD"))()
        end
    })
--esp
    local P_Toggle = Tabs.Esp:AddToggle("P", {
    Title = "Esp Players and Beast",
    Default = false
})

P_Toggle:OnChanged(function(v)
    if v then
        toggleESP()
    else
        toggleESP()
    end
end)

    local PcT = Tabs.Esp:AddToggle("PcT", {
        Title = "Esp Pc",
        Default = false
    })
    
    local runService = game:GetService("RunService")
    
    PcT:OnChanged(function(Value)
        Pc = Value
    
        -- Se já houver uma thread rodando, finalize-a antes de iniciar uma nova
        if EspPcThread then
            EspPcThread:Disconnect()
        end
    
        -- Inicia ou para a lógica de ESP
        if Pc then
            EspPcThread = runService.RenderStepped:Connect(function()
                EspPc()
            end)
        end
    end)
--misc
    _G.V4 = "foi"
    local AntiF = Tabs.Misc:AddToggle("AntiF", {
        Title = "Anti-Fling",
        Default = false
    })

    AntiF:OnChanged(function(Value)
        AntiF = Value
        
          print(_G.V4)
          
    end)
    
    Tabs.Misc:AddButton({
      Title = "Chat-Spy",
      Description = "chat-spy only works on legacy chat / standard chat",
      Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/Spy.lua"))()
        end
    })
    
    Tabs.Misc:AddButton({
      Title = "Chat Translator",
      Description = "Just like Chat-Spy, it only works in legacy chat",
      Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/Translator.lua"))()
        end
    })
    
    
    local AntiC = Tabs.Misc:AddToggle("AntiC", {
        Title = "Anti-Chat-Spy",
        Default = false
        })

        AntiC:OnChanged(function(Value)
            isActive = Value
                if isActive then
                    spawn(function()
                        while isActive do
                             task.wait()
                              Players:Chat(RandomChar())
                          end
                      end)
                  end
              end)
    
    local Void = Tabs.Misc:AddToggle("Void",{
      Title = "Void Protection",
      Default = false
    })
    
    Void:OnChanged(function(v)
      if v then
         ToggleVoidProtection(true)
      	else
      		ToggleVoidProtection(false)
      		end
    end)
    
    Tabs.Misc:AddButton({
      Title = "Reset",
      Description = "Reset your character",
      Callback = function()
          local player = game.Players.LocalPlayer
          if player and player.Character and player.Character:FindFirstChild("Humanoid") then
              player.Character.Humanoid.Health = 0
          end
      end
  })
    
    Tabs.Misc:AddButton({
      Title = "Infinite Yield",
      Description = "Admin Commands cmdbar",
      Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
      end
    })
  
    Tabs.Misc:AddButton({
      Title = "Fly Gui",
      Description = "",
      Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JosejamesDev/Beto-hub/main/Others/Fly-Gui.lua"))()
        end
    })
  
    Tabs.Misc:AddButton({
      Title = "Rejoin",
      Description = "",
      Callback = function()
          coroutine.wrap(function()
              local success, errorMessage = pcall(function()
                  TeleportService:Teleport(game.PlaceId, LocalPlayer)
              end)
              if not success then
                  warn(errorMessage)
              end
          end)()
      end
  })
  
    Tabs.Misc:AddButton({
      Title = "Server Hop",
      Description = "",
      Callback = function()
        Hop()
        end
    })
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)
    
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    
    InterfaceManager:SetFolder("FluentScriptHub")
    SaveManager:SetFolder("FluentScriptHub/specific-game")
    
    InterfaceManager:BuildInterfaceSection(Tabs.Misc)
    SaveManager:BuildConfigSection(Tabs.Misc)
    
    Window:SelectTab(1)
    
    Fluent:Notify({
        Title = "Fluent",
        Content = "The script has been loaded.",
        Duration = 8
    })
    
    SaveManager:LoadAutoloadConfig()