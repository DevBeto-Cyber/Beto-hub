local RunService = game:GetService("RunService")
local players = game:GetService("Players")
local plr = players.LocalPlayer
local AntiFlingFunction = nil

AntiFlingFunction = RunService.Stepped:Connect(function()
    for i, CoPlayer in pairs(players:GetChildren()) do
        if CoPlayer ~= plr and CoPlayer.Character then
            for i,part in pairs(CoPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") or part:IsA("Part") or part.Name == "HumanoidRootPart" then
                    part.CanCollide = false
                    part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
                    part.Velocity = Vector3.new(0,0,0)
                    part.RotVelocity = Vector3.new(0,0,0)
                end
            end
        end
    end
end)

repeat task.wait() until _G.AntiFlingToggled == false
AntiFlingFunction:Disconnect()
