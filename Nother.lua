local typeof = typeof
local hookfunc = hookfunction
local getmt = getrawmetatable or debug.getmetatable
local gsub = string.gsub
local match = string.match
local rnd = math.random
local cache = setmetatable({}, {__mode = "k"})
local possibleMemoryChars = {
    "a", "b", "c", "d", "e", "f", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
}


local setidentity = setidentity or setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or (syn and syn.set_thread_identity)
local getidentity = getidentity or getthreadidentity or get_thread_identity or getthreadcontext or get_thread_context or (syn and syn.get_thread_identity)
local securecall = syn and syn.secure_call or newcclosure(function(func, env, ...)
    return coroutine.wrap(function(...)
        local id = getidentity()
        setidentity(2)
        setfenv(0, getsenv(env))
        setfenv(1, getsenv(env))
        local res = {func(...)}
        setidentity(id)
        return table.unpack(res)
    end)(...)
end)

local _tostring; _tostring = hookfunc(tostring, newcclosure(function(data)
    if checkcaller() then -- return normal if its exploit call
        return _tostring(data)
    end

    local callingScript = getcallingscript()
    local res = securecall(_tostring, callingScript, data)
    local type = typeof(data)

    if type == "table" or type == "userdata" or type == "function" or type == "thread" then
        if type == "table" or type == "userdata" then
            local mt = getmt(data)
            if mt and rawget(mt, "__tostring") then
                return res
            end
        end

        --32bit res E.G > table: 0x000000008b9b661b
        --64bit res E.G > table: 0x7a3241c3abbb4de8
        if match(res, "x00000000") then
            if cache[data] then
                return cache[data]
            end

            -- 32 bit string
            res = gsub(res, "x00000000", function()
                -- Generate fake string
                local finalStr = ""

                for i = 1, 8 do
                    finalStr = finalStr .. possibleMemoryChars[rnd(#possibleMemoryChars)]
                end
               
                return "x" .. finalStr
            end)

            cache[data] = res
        end
    end

    return res
end))

local newversion
task.spawn(function()
    newversion = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://clientsettings.roblox.com/v2/client-version/WindowsPlayer")).version
end)

local getVersionMiddleware = Instance.new("BindableFunction")
getVersionMiddleware.OnInvoke = function()
    if (not newversion) then
        repeat task.wait() until newversion
    end
    return newversion
end

hookfunction(Version, newcclosure(function()
    return getVersionMiddleware:Invoke()
end))

hookfunction(version, newcclosure(function()
    return getVersionMiddleware:Invoke()
end))

-- Spy
enabled = true --chat "/spy" to toggle!
spyOnMyself = false --if true will check your messages too
public = false --if true will chat the logs publicly (fun, risky)
publicItalics = true --if true will use /me to stand out
privateProperties = { --customize private logs
	Color = Color3.fromRGB(148,147,140); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 15;
}


local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabled = not enabled
			wait(.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(.5)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
if not player.PlayerGui:FindFirstChild("Chat") then wait(3) end
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
