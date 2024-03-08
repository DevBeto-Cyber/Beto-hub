-------------------------------------------------------
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
  game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
  game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton1

do local GUI = game.CoreGui:FindFirstChild("SOMEXHUB");if GUI then GUI:Destroy();end;if _G.Color == nil then
    _G.Color = Color3.fromRGB(108, 26, 255)
   end 
end

do
    local NamfonHub = workspace:FindFirstChild("DeeKub")
    if NamfonHub then
        NamfonHub:Destroy()
    end
end

local Namfon = Instance.new("Part",workspace)
Namfon.Size = Vector3.new(30,5,30)
Namfon.Name = "DeeKub"
Namfon.Transparency = 1
Namfon.CanCollide = true
Namfon.Anchored = true

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        local Tween = TweenService:Create(object, TweenInfo.new(0.15), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local Update = {}

function Update:Window(text,logo,keybind)
    local uihide = false
    local abc = false
    local logo = logo or 0
    local currentpage = ""
    local keybind = keybind or Enum.KeyCode.RightControl
    local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
    
    local SOMEXHUB = Instance.new("ScreenGui")
    SOMEXHUB.Name = "SOMEXHUB"
    SOMEXHUB.Parent = game.CoreGui
    SOMEXHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = SOMEXHUB
    Main.ClipsDescendants = true
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    
    Main:TweenSize(UDim2.new(0, 656, 0, 350),"Out","Quad",0.4,true)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Main

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Top.Size = UDim2.new(0, 656, 0, 27)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Top
    
    local Name = Instance.new("TextLabel")
    Name.Name = "Name"
    Name.Parent = Top
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.Position = UDim2.new(0.0609756112, -25, 0, 0)
    Name.Size = UDim2.new(0, 61, 0, 27)
    Name.Font = Enum.Font.GothamSemibold
    Name.Text = text
    Name.TextColor3 = Color3.fromRGB(225, 225, 225)
    Name.TextSize = 20.000

    local Hub = Instance.new("TextLabel")
    Hub.Name = "Hub"
    Hub.Parent = Top
    Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hub.BackgroundTransparency = 1.000
    Hub.Position = UDim2.new(0, 85, 0, 0)
    Hub.Size = UDim2.new(0, 81, 0, 27)
    Hub.Font = Enum.Font.GothamSemibold
    Hub.Text = "HUB"
    Hub.TextColor3 = Color3.fromRGB(108, 26, 255)   
    Hub.TextSize = 20.000
    Hub.TextXAlignment = Enum.TextXAlignment.Left

    local MapName = Instance.new("TextLabel")
    MapName.Name = "MapName"
    MapName.Parent = Top
    MapName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MapName.BackgroundTransparency = 1.000
    MapName.Position = UDim2.new(0, 85, 0, 0)
    MapName.Size = UDim2.new(0, 81, 0, 27)
    MapName.Font = Enum.Font.GothamSemibold
    MapName.Text = "         | Universal Script"
    MapName.TextColor3 = Color3.fromRGB(225, 225, 225)   
    MapName.TextSize = 20.000
    MapName.TextXAlignment = Enum.TextXAlignment.Left

    local Hubb = Instance.new("TextLabel")
    Hubb.Name = "Hubb"
    Hubb.Parent = Top
    Hubb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hubb.BackgroundTransparency = 1.000
    Hubb.Position = UDim2.new(0, 480, 0, 0)
    Hubb.Size = UDim2.new(0, 81, 0, 27)
    Hubb.Font = Enum.Font.GothamSemibold
    Hubb.Text = "hm"
    Hubb.TextColor3 = Color3.fromRGB(255, 255, 255)
    Hubb.TextSize = 17.000
    Hubb.TextXAlignment = Enum.TextXAlignment.Left

    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Tab.BackgroundTransparency = 1.000
    Tab.Position = UDim2.new(0, 5, 0, 30)
    Tab.Size = UDim2.new(0, 150, 0, 350)

local LogoHub = Instance.new("ImageLabel")
    LogoHub.Name = "LogoHub"
    LogoHub.Parent = Top
    LogoHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LogoHub.BackgroundTransparency = 1.000
    LogoHub.Position = UDim2.new(0, 5, 0, 1)
    LogoHub.Size = UDim2.new(0, 26, 0, 26)
    LogoHub.Image = "rbxassetid://16329392936"

    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.Size = UDim2.new(0, 150, 0, 365)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0

    local PLL = Instance.new("UIListLayout")
    PLL.Name = "PLL"
    PLL.Parent = ScrollTab
    PLL.SortOrder = Enum.SortOrder.LayoutOrder
    PLL.Padding = UDim.new(0, 15)

    local PPD = Instance.new("UIPadding")
    PPD.Name = "PPD"
    PPD.Parent = ScrollTab
    PPD.PaddingLeft = UDim.new(0, 10)
    PPD.PaddingTop = UDim.new(0, 10)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Page.Position = UDim2.new(0.245426834, 0, 0.075000003, 0)
    Page.Size = UDim2.new(0, 490, 0, 365)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Page

    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Parent = Page
    MainPage.ClipsDescendants = true
    MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainPage.BackgroundTransparency = 1.000
    MainPage.Size = UDim2.new(0, 490, 0, 365)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = MainPage

    local PageList = Instance.new("Folder")
    PageList.Name = "PageList"
    PageList.Parent = MainPage

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageList
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.FillDirection = Enum.FillDirection.Vertical
    UIPageLayout.Padding = UDim.new(0, 15)
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false
    
    MakeDraggable(Top,Main)

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode[yoo] then
            if uihide == false then
                uihide = true
                Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
            else
                uihide = false
                Main:TweenSize(UDim2.new(0, 656, 0, 350),"Out","Quad",0.4,true)
            end
        end
    end)
    
    local uitab = {}
    
    function uitab:AddTab(text,image)
        local Image = image
        
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = ScrollTab
        TabButton.Name = text.."Server"
        TabButton.Text = text
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.BackgroundTransparency = 0.150
        TabButton.Size = UDim2.new(0, 130, 0, 23)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 15.000
        TabButton.TextTransparency = 0.500

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = TabButton

            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = TabButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, 5, 0, 5)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://"..tostring(Image)
            
        local MainFramePage = Instance.new("ScrollingFrame")
        MainFramePage.Name = text.."_Page"
        MainFramePage.Parent = PageList
        MainFramePage.Active = true
        MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFramePage.BackgroundTransparency = 1.000
        MainFramePage.BorderSizePixel = 0
        MainFramePage.Size = UDim2.new(0, 490, 0, 365)
        MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainFramePage.ScrollBarThickness = 0
        
        local UIPadding = Instance.new("UIPadding")
        local UIListLayout = Instance.new("UIListLayout")
        
        UIPadding.Parent = MainFramePage
        UIPadding.PaddingLeft = UDim.new(0, 10)
        UIPadding.PaddingTop = UDim.new(0, 10)

        UIListLayout.Padding = UDim.new(0,15)
        UIListLayout.Parent = MainFramePage
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        
        TabButton.MouseButton1Click:Connect(function()
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            for i,v in next, PageList:GetChildren() do
                currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
                if v.Name == currentpage then
                    UIPageLayout:JumpTo(v)
                end
            end
        end)

        if abc == false then
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            UIPageLayout:JumpToIndex(1)
            abc = true
        end
        
        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
                ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
            end)
        end)
        
        local main = {}
        function main:AddButton(text,callback)
            local Button = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local TextBtn = Instance.new("TextButton")
            local UICorner_2 = Instance.new("UICorner")
            local Black = Instance.new("Frame")
            local IMGTOG = Instance.new("ImageLabel")
            local UICorner_3 = Instance.new("UICorner")
            
            Button.Name = "Button"
            Button.Parent = MainFramePage
            Button.BackgroundColor3 = _G.Color
            Button.Size = UDim2.new(0, 470, 0, 31)
            
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Button
            
            TextBtn.Name = "TextBtn"
            TextBtn.Parent = Button
            TextBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TextBtn.Position = UDim2.new(0, 1, 0, 1)
            TextBtn.Size = UDim2.new(0, 468, 0, 29)
            TextBtn.AutoButtonColor = false
            TextBtn.Font = Enum.Font.GothamSemibold
            TextBtn.Text = text
            TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextBtn.TextSize = 15.000
            
            UICorner_2.CornerRadius = UDim.new(0, 5)
            UICorner_2.Parent = TextBtn
            
            Black.Name = "Black"
            Black.Parent = Button
            Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Black.BackgroundTransparency = 1.000
            Black.BorderSizePixel = 0
            Black.Position = UDim2.new(0, 1, 0, 1)
            Black.Size = UDim2.new(0, 468, 0, 29)
            
            UICorner_3.CornerRadius = UDim.new(0, 5)
            UICorner_3.Parent = Black

            TextBtn.MouseEnter:Connect(function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.7}
                ):Play()
            end)
            TextBtn.MouseLeave:Connect(function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
            end)
            TextBtn.MouseButton1Click:Connect(function()
                TextBtn.TextSize = 0
                TweenService:Create(
                    TextBtn,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextSize = 15}
                ):Play()
                callback()
            end)
        end
        function main:AddToggle(text,config,callback)
            config = config or false
            local toggled = config
            local Toggle = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Button = Instance.new("TextButton")
            local UICorner_2 = Instance.new("UICorner")
            local Label = Instance.new("TextLabel")
            local ToggleImage = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local Circle = Instance.new("Frame")
            local IMGTOG = Instance.new("ImageLabel")
            local UICorner_4 = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = MainFramePage
            Toggle.BackgroundColor3 = _G.Color
            Toggle.Size = UDim2.new(0, 470, 0, 31)

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Toggle

            Button.Name = "Button"
            Button.Parent = Toggle
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.Position = UDim2.new(0, 1, 0, 1)
            Button.Size = UDim2.new(0, 468, 0, 29)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.SourceSans
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(0, 0, 0)
            Button.TextSize = 11.000

            UICorner_2.CornerRadius = UDim.new(0, 5)
            UICorner_2.Parent = Button

            Label.Name = "Label"
            Label.Parent = Toggle
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Position = UDim2.new(0, 1, 0, 1)
            Label.Size = UDim2.new(0, 468, 0, 29)
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(225, 225, 225)
            Label.TextSize = 15.000

            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = Toggle
            ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            ToggleImage.Position = UDim2.new(0, 415, 0, 5)
            ToggleImage.Size = UDim2.new(0, 45, 0, 20)

            UICorner_3.CornerRadius = UDim.new(0, 10)
            UICorner_3.Parent = ToggleImage

local tggc = Instance.new("TextLabel")
    tggc.Name = "tggc"
    tggc.Parent = Toggle
    tggc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tggc.BackgroundTransparency = 1.000
    tggc.Position = UDim2.new(0, 40, 0, 3)
    tggc.Size = UDim2.new(0, 81, 0, 27)
    tggc.Font = Enum.Font.GothamSemibold
    tggc.Text = ""
    tggc.TextColor3 = _G.Color
    tggc.TextSize = 26.000
    tggc.TextXAlignment = Enum.TextXAlignment.Left

local LogoToggle = Instance.new("ImageLabel")
    LogoToggle.Name = "LogoToggle"
    LogoToggle.Parent = Toggle
    LogoToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LogoToggle.BackgroundTransparency = 1.000
    LogoToggle.Position = UDim2.new(0, 7, 0, 2)
    LogoToggle.Size = UDim2.new(0, 26, 0, 26)
    LogoToggle.Image = "http://www.roblox.com/asset/?id="..tostring(16329392936)

            Circle.Name = "Circle"
            Circle.Parent = ToggleImage
            Circle.BackgroundColor3 = Color3.fromRGB(227, 60, 60)
            Circle.Position = UDim2.new(0, 2, 0, 2)
            Circle.Size = UDim2.new(0, 16, 0, 16)

            UICorner_4.CornerRadius = UDim.new(0, 10)
            UICorner_4.Parent = Circle

            Button.MouseButton1Click:Connect(function()
                if toggled == false then
                    toggled = true
                    Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.2,true)
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = _G.Color}
                    ):Play()
                else
                    toggled = false
                    Circle:TweenPosition(UDim2.new(0,2,0,2),"Out","Sine",0.2
