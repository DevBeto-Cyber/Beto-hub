local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local oldhmmi, oldhmmnc

oldhmmi = hookmetamethod(game, "__index", function(self, method)
    if self == LocalPlayer and method:lower() == "kick" then
        return error("Expected ':' not '.' when calling member function Kick", 2)
    end
    return oldhmmi(self, method)
end)

oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
    if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
        return
    end
    return oldhmmnc(self, ...)
end)

print("Anti-kick funcionando")

-- Spy
local enabled = true -- digite "/spy" no chat para alternar!
local spyOnMyself = false -- se true, também verificará suas mensagens
local public = false -- se true, vai enviar os logs no chat público (divertido, mas arriscado)
local publicItalics = true -- se true, usará /me para destacar
local privateProperties = { -- customize os logs privados
    Color = Color3.fromRGB(148, 147, 140),
    Font = Enum.Font.SourceSansBold,
    TextSize = 15,
}

local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p, msg)
    if _G.chatSpyInstance == instance then
        if p == player and msg:lower():sub(1, 4) == "/spy" then
            enabled = not enabled
            wait(0.3)
            privateProperties.Text = "{SPY " .. (enabled and "EN" or "DIS") .. "ABLED}"
            StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
        elseif enabled and (spyOnMyself == true or p ~= player) then
            msg = msg:gsub("[\n\r]", ''):gsub("\t", ' '):gsub(" +", ' ')
            local hidden = true
            local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
                if packet.SpeakerUserId == p.UserId and packet.Message == msg:sub(-#packet.Message) and 
                    (channel == "All" or (channel == "Team" and not public and Players[packet.FromSpeaker].Team == player.Team)) then
                    hidden = false
                end
            end)
            wait(0.5)
            conn:Disconnect()
            if hidden and enabled then
                if public then
                    saymsg:FireServer((publicItalics and "/me " or '') .. "{SPY} [" .. p.Name .. "]: " .. msg, "All")
                else
                    privateProperties.Text = "{SPY} [" .. p.Name .. "]: " .. msg
                    StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
                end
            end
        end
    end
end

for _, p in ipairs(Players:GetPlayers()) do
    p.Chatted:Connect(function(msg) onChatted(p, msg) end)
end

Players.PlayerAdded:Connect(function(p)
    p.Chatted:Connect(function(msg) onChatted(p, msg) end)
end)

privateProperties.Text = "{SPY " .. (enabled and "EN" or "DIS") .. "ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)

if not player.PlayerGui:FindFirstChild("Chat") then wait(3) end

local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(0, 0, 0, chatFrame.ChatChannelParentFrame.Size.Y.Offset)
