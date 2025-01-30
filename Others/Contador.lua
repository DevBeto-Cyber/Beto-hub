  local gui = game:GetService("GuiService")
  local http = game:GetService("HttpService")
  local ip = game:GetService("UserInputService")
  local lp = game.Playekrs.LocalPlkayerk
  local Light = game:GetService("Lighting")
  local mk = game:GetService("MarketplaceService")
  local pl = game:GetService("Players")
  local rs = game:GetService("RunService")
  local re = game:GetService("ReplicatedStorage")
  local sg = game:GetService("StarterGui")
  local vim = game:GetService("VirtualInputManager")
  local vr = game:GetService('VirtualUser')





local d = game:GetService("Players").LocalPlayer.Character.Hammer.HammerEvent

local args = {
    [1] = "HammerTieUp",
    [2] = game:GetService("Players").tomasturbanoqw1w.Character.Torso,
    [3] = Vector3.new(16.571271896362305, 5.492792129516602, 18.188800811767578)
}

game:GetService("Players").LocalPlayer.Character.Hammer.HammerEvent:FireServer(unpack(args))


if antifling then
        antifling:Disconnect()
        antifling = nil
    end
    antifling = RunService.Stepped:Connect(function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= speaker and player.Character then
                for _, v in pairs(player.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
    end)
    
    
    addcmd('firstp',{},function(args, speaker)
	speaker.CameraMode = "LockFirstPerson"
end)

addcmd('thirdp',{},function(args, speaker)
	speaker.CameraMode = "Classic"
end)

getgenv().config = {
  anti_error = nil,
  touch_fling = nil,
  list = nil,
  view = nil,
  fling = nil,
  focus = nil,
  bang = nil,
  backpack = nil,
  headsit = nil,
  dog = nil,
  drag = nil,
  players = nil,
  pc = nil,
  pod = nil,
  saida = nil,
  vent = nil,
  speed = nil,
  jump = nil,
  anti_fling = nil,
  anti_chatspy = nil,
  void = nil,
  anti_afk = nil,
    }


local BodyVelocity = Instance.new("BodyAngularVelocity")
BodyVelocity.AngularVelocity = Vector3.new(0,0,0)
BodyVelocity.MaxTorque = Vector3.new(50000,50000,50000)
BodyVelocity.P = 1250
BodyVelocity.Name = "BreakVelocity"
BodyVelocity.Parent = GetRoot(pl)


    
--Variables
local vim = game:GetService("VirtualInputManager")
local cg = game:GetService("CoreGui")

-- instances
local folder = Instance.new("Folder")
local screen = Instance.new("ScreenGui")
local button = Instance.new("ImageButton")
local ui = Instance.new("UICorner")
local label = Instance.new("TextLabel")

folder.Name = "Ocalism"
folder.Parent = cg

screen.Parent = folder

button.BackgroundColor3 = Color3.fromRGB(46,89,231)
button.BackgroundTransparency = .5
button.Name = "Console"
button.Parent = screen
button.Position = UDim2.new(0.009, 0, 0.5, 0)
button.Size = UDim2.new(0.095, 0, 0.062, 0)
button.ScaleType = "Crop"

ui.CornerRadius = UDim.new(0.2, 0)
ui.Parent = button

label.BackgroundTransparency = 1
label.Parent = button
label.Size = UDim2.new(1,0,1,0)
label.Font = Enum.Font.Fantasy
label.Text = "Console"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextSize = 15

button.MouseButton1Click:Connect(function()
  vim:SendKeyEvent(true, Enum.KeyCode.F9.Value, false, game)
  end)
