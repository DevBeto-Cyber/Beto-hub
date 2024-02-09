local player = game.Players.LocalPlayer

local allowedNames = {
    "Roberto35365",
    "Fehlipeh_user",
    "Korusaki_gg",
    "KanekiGameplay0102",
    "pestecan1bal",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
} -- Adicione os nomes permitidos aqui
local isWhitelisted = false

for _, allowedName in pairs(allowedNames) do
    if player.Name == allowedName then
        isWhitelisted = true
        break -- Se encontrou um nome permitido, sai do loop
    end
end

if isWhitelisted then
    print("Whitelisted")
else
    player:Kick("Saia daqui seboso")
end

local Window = Fluent:CreateWindow({
    Title = "Beto Hub",
    SubTitle = "Universal Script // by Beto",
    TabWidth = 160,
    Size = UDim2.new(0, windowWidth, 0, windowHeight),
    Acrylic = false,                       -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Home = Window:AddTab({
        Title = "Home",
        Icon = "home"
    }),
    Character = Window:AddTab({
        Title = "Character",
        Icon = "user"
    }),
    Target = Window:AddTab({
      Title = "Target",
      Icon = ""
    }),
    Animations = Window:AddTab({
        Title = "Animations",
        Icon = "clapperboard"
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
--Home
  Tabs.Home:AddParagraph({
       Title = "Universal Script",
       Content = "Bem-Vindo(a) ao Universal Script! \n Use com sabedoria!"
       })
--Character
  Tabs.Character:AddButton({
       Title = "Anti-Fling",
       Description = "Escreva ;d no chat para desativar e ;a para ativar novamente",
       Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Antii-Fling/main/Script"))()
       end
       })
  Tabs.Character:AddButton({
    Title = "Shiftlock",
    Description = "",
    Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Unknownproootest/Permanent-Shift-Lock-Beta/alt/PermShiftlockV2-alt'))()
      end
  })   
  Tabs.Character:AddButton({
     Title = "Fly",
     Description = "",
     Callback = function()
       loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-I-Fly-gui-V3-I-6627"))()
       end
})
Tabs.Character:AddButton({
  Title = "Fps Unlock",
  Description = "",
  Callback = function()
    setfpscap(9999999)
    end
})
Tabs.Character:AddButton({
     Title = "Fling all",
     Description = "",
     Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/Kbc2cP4m"))()
       end
  })

--Animations
  local plr = game.Players.LocalPlayer
Tabs.Animations:AddButton({
             Title = "Free Emotes",
             Description = "Doesn't work on Delta/Não funciona no Delta",
             Callback = function()
               loadstring(game:HttpGet("https://scriptblox.com/raw/Brookhaven-RP-all-emotes-6849"))()
    end
        })
Tabs.Animations:AddButton({
    Title = "idle",
    Description = "by Beto",
    Callback = function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4417979645"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
})
        Tabs.Animations:AddButton({
    Title = "Vampire",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Hero",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "ZombieClassic",
    Description = "",
    Callback = function()
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
}) 
        Tabs.Animations:AddButton({
    Title = "Mage",
    Description = "",
    Callback = function()
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
})  
        Tabs.Animations:AddButton({
    Title = "Ghost",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Elder",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Levitation",
    Description = "",
    Callback = function()
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
})  
        Tabs.Animations:AddButton({
    Title = "Astronaut",
    Description = "",
    Callback = function()
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
})  
        Tabs.Animations:AddButton({
    Title = "Ninja",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Werewolf",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Cartoon",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Pirate",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Sneaky",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Toy",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Knight",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Confident",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Popstar",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Princess",
    Description = "",
    Callback = function()
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
})
        Tabs.Animations:AddButton({
    Title = "Cowboy",
    Description = "",
    Callback = function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
})
        Tabs.Animations:AddButton({
    Title = "Patrol",
    Description = "",
    Callback = function()
        local Animate = plr.Character:WaitForChild("Animate")

        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
        	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
        	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
        	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
        	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1150944216"
        	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
        	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"

        plr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Climbing)
    end
})
        Tabs.Animations:AddButton({
             Title = "Zombie Fe",
             Description = "",
             Callback = function()
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
})
 --Esp
 Tabs.Esp:AddButton({

        Title = "Esp Box Head",

        Description = "All Players",

        Callback = function()
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
end
 })
    
    Tabs.Esp:AddButton({

        Title = "Esp Box",

        Description = "All Players",

        Callback = function()

          loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Beto-hub/main/EspBox.lua"))()

        end

    })
 --Misc
  Tabs.Misc:AddButton({
       Title = "InfYield",
       Description = "",
       Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Yield/main/main.lua"))()
        end
        })
  
  Tabs.Misc:AddButton({
       Title = "Chat spy",
       Description = "Only works in normal chat/Só funciona no chat normal",
       Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Universal-Script/main/Chat_spy.lua"))()
         end
  })
Tabs.Misc:AddButton({
    Title = "Re-Enter",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mM7JBG5h", true))() 
    end
})
--interface
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Misc)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Beto Hub",
    Content = "The script has been loaded.",
    Duration = 5
})
