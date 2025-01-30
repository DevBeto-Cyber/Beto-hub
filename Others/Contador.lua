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
