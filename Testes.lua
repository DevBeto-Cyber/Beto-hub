local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local AntiFlingFunction = nil

AntiFlingFunction = RunService.Stepped:Connect(function()
    for _, Player in pairs(Players:GetPlayers()) do
        task.spawn(function()
            if Player ~= LocalPlayer and Player.Character then
                for _, Part in pairs(Player.Character:GetChildren()) do
                    if Part:IsA("BasePart") or Part:IsA("Part") or Part.Name == "HumanoidRootPart" then
                        Part.CanCollide = false
                        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                        Part.Velocity = Vector3.new(0, 0, 0)
                        Part.RotVelocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    end
end)

repeat task.wait() until _G.AntiFlingToggled == false
AntiFlingFunction:Disconnect()
