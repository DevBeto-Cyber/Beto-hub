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
    _G.Color = Color3.fromRGB(0, 247, 255)
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
                    Circle:TweenPosition(UDim2.new(0,2,0,2),"Out","Sine",0.2,true)
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(227, 60, 110)}
                    ):Play()
                end
                pcall(callback,toggled)
            end)

            if config == true then
                toggled = true
                Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.4,true)
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundColor3 = _G.Color}
                ):Play()
                pcall(callback,toggled)
            end
        end
        function main:AddDropdown(text,option,callback)
            local isdropping = false
            local Dropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local DropTitle = Instance.new("TextLabel")
            local DropScroll = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local DropButton = Instance.new("TextButton")
            local DropImage = Instance.new("ImageLabel")
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = MainFramePage
            Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Dropdown.ClipsDescendants = true
            Dropdown.Size = UDim2.new(0, 470, 0, 31)
            
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Dropdown
            
            DropTitle.Name = "DropTitle"
            DropTitle.Parent = Dropdown
            DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropTitle.BackgroundTransparency = 1.000
            DropTitle.Size = UDim2.new(0, 470, 0, 31)
            DropTitle.Font = Enum.Font.GothamSemibold
            DropTitle.Text = text.. " : "
            DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            DropTitle.TextSize = 15.000
            
            DropScroll.Name = "DropScroll"
            DropScroll.Parent = DropTitle
            DropScroll.Active = true
            DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropScroll.BackgroundTransparency = 1.000
            DropScroll.BorderSizePixel = 0
            DropScroll.Position = UDim2.new(0, 0, 0, 31)
            DropScroll.Size = UDim2.new(0, 470, 0, 100)
            DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropScroll.ScrollBarThickness = 3
            
            UIListLayout.Parent = DropScroll
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 5)
            
            UIPadding.Parent = DropScroll
            UIPadding.PaddingLeft = UDim.new(0, 5)
            UIPadding.PaddingTop = UDim.new(0, 5)
            
            DropImage.Name = "DropImage"
            DropImage.Parent = Dropdown
            DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropImage.BackgroundTransparency = 1.000
            DropImage.Position = UDim2.new(0, 435, 0, 6)
            DropImage.Rotation = 180.000
            DropImage.Size = UDim2.new(0, 20, 0, 20)
            DropImage.Image = "rbxassetid://10162644180"
            
            DropButton.Name = "DropButton"
            DropButton.Parent = Dropdown
            DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropButton.BackgroundTransparency = 1.000
            DropButton.Size = UDim2.new(0, 470, 0, 31)
            DropButton.Font = Enum.Font.SourceSans
            DropButton.Text = ""
            DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropButton.TextSize = 14.000

            for i,v in next,option do
                local Item = Instance.new("TextButton")

                Item.Name = "Item"
                Item.Parent = DropScroll
                Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Item.BackgroundTransparency = 1.000
                Item.Size = UDim2.new(0, 460, 0, 26)
                Item.Font = Enum.Font.GothamSemibold
                Item.Text = tostring(v)
                Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                Item.TextSize = 13.000
                Item.TextTransparency = 0.500

                Item.MouseEnter:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end)

                Item.MouseLeave:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end)

                Item.MouseButton1Click:Connect(function()
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                    callback(Item.Text)
                    DropTitle.Text = text.." : "..Item.Text
                end)
            end

            DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

            DropButton.MouseButton1Click:Connect(function()
                if isdropping == false then
                    isdropping = true
                    Dropdown:TweenSize(UDim2.new(0,470,0,131),"Out","Quad",0.3,true)
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                else
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                end
            end)

            local dropfunc = {}
            function dropfunc:Add(t)
                local Item = Instance.new("TextButton")
                Item.Name = "Item"
                Item.Parent = DropScroll
                Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Item.BackgroundTransparency = 1.000
                Item.Size = UDim2.new(0, 470, 0, 26)
                Item.Font = Enum.Font.GothamSemibold
                Item.Text = tostring(t)
                Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                Item.TextSize = 13.000
                Item.TextTransparency = 0.500

                Item.MouseEnter:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end)

                Item.MouseLeave:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end)

                Item.MouseButton1Click:Connect(function()
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                    callback(Item.Text)
                    DropTitle.Text = text.." : "..Item.Text
                end)
            end
            function dropfunc:Clear()
                DropTitle.Text = tostring(text).." : "
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {Rotation = 180}
                ):Play()
                for i,v in next, DropScroll:GetChildren() do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end
            end
            return dropfunc
        end

        function main:AddSlider(text,min,max,set,callback)
            local Slider = Instance.new("Frame")
            local slidercorner = Instance.new("UICorner")
            local sliderr = Instance.new("Frame")
            local sliderrcorner = Instance.new("UICorner")
            local SliderLabel = Instance.new("TextLabel")
            local HAHA = Instance.new("Frame")
            local AHEHE = Instance.new("TextButton")
            local bar = Instance.new("Frame")
            local bar1 = Instance.new("Frame")
            local bar1corner = Instance.new("UICorner")
            local barcorner = Instance.new("UICorner")
            local circlebar = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local slidervalue = Instance.new("Frame")
            local valuecorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")
            local UICorner_2 = Instance.new("UICorner")

            Slider.Name = "Slider"
            Slider.Parent = MainFramePage
            Slider.BackgroundColor3 = _G.Color
            Slider.BackgroundTransparency = 0
            Slider.Size = UDim2.new(0, 470, 0, 51)

            slidercorner.CornerRadius = UDim.new(0, 5)
            slidercorner.Name = "slidercorner"
            slidercorner.Parent = Slider

            sliderr.Name = "sliderr"
            sliderr.Parent = Slider
            sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            sliderr.Position = UDim2.new(0, 1, 0, 1)
            sliderr.Size = UDim2.new(0, 468, 0, 49)

            sliderrcorner.CornerRadius = UDim.new(0, 5)
            sliderrcorner.Name = "sliderrcorner"
            sliderrcorner.Parent = sliderr

            SliderLabel.Name = "SliderLabel"
            SliderLabel.Parent = sliderr
            SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.BackgroundTransparency = 1.000
            SliderLabel.Position = UDim2.new(0, 15, 0, 0)
            SliderLabel.Size = UDim2.new(0, 180, 0, 26)
            SliderLabel.Font = Enum.Font.GothamSemibold
            SliderLabel.Text = text
            SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderLabel.TextSize = 16.000
            SliderLabel.TextTransparency = 0
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

            HAHA.Name = "HAHA"
            HAHA.Parent = sliderr
            HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HAHA.BackgroundTransparency = 1.000
            HAHA.Size = UDim2.new(0, 468, 0, 29)

            AHEHE.Name = "AHEHE"
            AHEHE.Parent = sliderr
            AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            AHEHE.BackgroundTransparency = 1.000
            AHEHE.Position = UDim2.new(0, 10, 0, 35)
            AHEHE.Size = UDim2.new(0, 448, 0, 5)
            AHEHE.Font = Enum.Font.SourceSans
            AHEHE.Text = ""
            AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
            AHEHE.TextSize = 14.000

            bar.Name = "bar"
            bar.Parent = AHEHE
            bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bar.Size = UDim2.new(0, 448, 0, 5)

            bar1.Name = "bar1"
            bar1.Parent = bar
            bar1.BackgroundColor3 = _G.Color
            bar1.BackgroundTransparency = 0
            bar1.Size = UDim2.new(set/max, 0, 0, 5)

            bar1corner.CornerRadius = UDim.new(0, 5)
            bar1corner.Name = "bar1corner"
            bar1corner.Parent = bar1

            barcorner.CornerRadius = UDim.new(0, 5)
            barcorner.Name = "barcorner"
            barcorner.Parent = bar

            circlebar.Name = "circlebar"
            circlebar.Parent = bar1
            circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            circlebar.Position = UDim2.new(1, -2, 0, -3)
            circlebar.Size = UDim2.new(0, 10, 0, 10)

            UICorner.CornerRadius = UDim.new(0, 100)
            UICorner.Parent = circlebar

            slidervalue.Name = "slidervalue"
            slidervalue.Parent = sliderr
            slidervalue.BackgroundColor3 = _G.Color
            slidervalue.BackgroundTransparency = 0
            slidervalue.Position = UDim2.new(0, 395, 0, 5)
            slidervalue.Size = UDim2.new(0, 65, 0, 18)

            valuecorner.CornerRadius = UDim.new(0, 5)
            valuecorner.Name = "valuecorner"
            valuecorner.Parent = slidervalue

            TextBox.Parent = slidervalue
            TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TextBox.Position = UDim2.new(0, 1, 0, 1)
            TextBox.Size = UDim2.new(0, 63, 0, 16)
            TextBox.Font = Enum.Font.GothamSemibold
            TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextBox.TextSize = 9.000
            TextBox.Text = set
            TextBox.TextTransparency = 0

            UICorner_2.CornerRadius = UDim.new(0, 5)
            UICorner_2.Parent = TextBox

            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")

            if Value == nil then
                Value = set
                pcall(function()
                    callback(Value)
                end)
            end
            
            AHEHE.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
                pcall(function()
                    callback(Value)
                end)
                bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
                circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
                moveconnection = mouse.Move:Connect(function()
                    TextBox.Text = Value
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
                    pcall(function()
                        callback(Value)
                    end)
                    bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
                    circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
                        circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
                    TextBox.Text = Value
                end
            end)

            TextBox.FocusLost:Connect(function()
                if tonumber(TextBox.Text) > max then
                    TextBox.Text  = max
                end
                bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
                circlebar.Position = UDim2.new(1, -2, 0, -3)
                TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
                pcall(callback, TextBox.Text)
            end)
        end

        function main:AddTextbox(text,disappear,callback)
            local Textbox = Instance.new("Frame")
            local TextboxCorner = Instance.new("UICorner")
            local Textboxx = Instance.new("Frame")
            local TextboxxCorner = Instance.new("UICorner")
            local TextboxLabel = Instance.new("TextLabel")
            local txtbtn = Instance.new("TextButton")
            local RealTextbox = Instance.new("TextBox")
            local UICorner = Instance.new("UICorner")

            Textbox.Name = "Textbox"
            Textbox.Parent = MainFramePage
            Textbox.BackgroundColor3 = _G.Color
            Textbox.BackgroundTransparency = 0
            Textbox.Size = UDim2.new(0, 470, 0, 31)

            TextboxCorner.CornerRadius = UDim.new(0, 5)
            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox

            Textboxx.Name = "Textboxx"
            Textboxx.Parent = Textbox
            Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Textboxx.Position = UDim2.new(0, 1, 0, 1)
            Textboxx.Size = UDim2.new(0, 468, 0, 29)

            TextboxxCorner.CornerRadius = UDim.new(0, 5)
            TextboxxCorner.Name = "TextboxxCorner"
            TextboxxCorner.Parent = Textboxx

            TextboxLabel.Name = "TextboxLabel"
            TextboxLabel.Parent = Textbox
            TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxLabel.BackgroundTransparency = 1.000
            TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
            TextboxLabel.Text = text
            TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
            TextboxLabel.Font = Enum.Font.GothamSemibold
            TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextboxLabel.TextSize = 16.000
            TextboxLabel.TextTransparency = 0
            TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

            txtbtn.Name = "txtbtn"
            txtbtn.Parent = Textbox
            txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            txtbtn.BackgroundTransparency = 1.000
            txtbtn.Position = UDim2.new(0, 1, 0, 1)
            txtbtn.Size = UDim2.new(0, 468, 0, 29)
            txtbtn.Font = Enum.Font.SourceSans
            txtbtn.Text = ""
            txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            txtbtn.TextSize = 14.000

            RealTextbox.Name = "RealTextbox"
            RealTextbox.Parent = Textbox
            RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            RealTextbox.BackgroundTransparency = 0
            RealTextbox.Position = UDim2.new(0, 360, 0, 4)
            RealTextbox.Size = UDim2.new(0, 100, 0, 24)
            RealTextbox.Font = Enum.Font.GothamSemibold
            RealTextbox.Text = ""
            RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
            RealTextbox.TextSize = 11.000
            RealTextbox.TextTransparency = 0

            RealTextbox.FocusLost:Connect(function()
                callback(RealTextbox.Text)
                if disappear then
                    RealTextbox.Text = ""
                end
            end)

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = RealTextbox
        end
        function main:AddLabel(text)
            local Label = Instance.new("TextLabel")
            local PaddingLabel = Instance.new("UIPadding")
            local labelfunc = {}
    
            Label.Name = "Label"
            Label.Parent = MainFramePage
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Size = UDim2.new(0, 470, 0, 20)
            Label.Font = Enum.Font.GothamSemibold
            Label.TextColor3 = Color3.fromRGB(225, 225, 225)
            Label.TextSize = 16.000
            Label.Text = text
            Label.TextXAlignment = Enum.TextXAlignment.Left

            PaddingLabel.PaddingLeft = UDim.new(0,15)
            PaddingLabel.Parent = Label
            PaddingLabel.Name = "PaddingLabel"
    
            function labelfunc:Set(newtext)
                Label.Text = newtext
            end
            return labelfunc
        end

        function main:AddSeperator(text)
            local Seperator = Instance.new("Frame")
            local Sep1 = Instance.new("Frame")
            local Sep2 = Instance.new("TextLabel")
            local Sep3 = Instance.new("Frame")
            
            Seperator.Name = "Seperator"
            Seperator.Parent = MainFramePage
            Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Seperator.BackgroundTransparency = 1.000
            Seperator.Size = UDim2.new(0, 470, 0, 20)
            
            Sep1.Name = "Sep1"
            Sep1.Parent = Seperator
            Sep1.BackgroundColor3 = _G.Color
            Sep1.BorderSizePixel = 0
            Sep1.Position = UDim2.new(0, 0, 0, 10)
            Sep1.Size = UDim2.new(0, 80, 0, 1)
            
            Sep2.Name = "Sep2"
            Sep2.Parent = Seperator
            Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sep2.BackgroundTransparency = 1.000
            Sep2.Position = UDim2.new(0, 185, 0, 0)
            Sep2.Size = UDim2.new(0, 100, 0, 20)
            Sep2.Font = Enum.Font.GothamSemibold
            Sep2.Text = text
            Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Sep2.TextSize = 14.000
            
            Sep3.Name = "Sep3"
            Sep3.Parent = Seperator
            Sep3.BackgroundColor3 = _G.Color
            Sep3.BorderSizePixel = 0
            Sep3.Position = UDim2.new(0, 390, 0, 10)
            Sep3.Size = UDim2.new(0, 80, 0, 1)
        end

        function main:AddLine()
            local Linee = Instance.new("Frame")
            local Line = Instance.new("Frame")
            
            Linee.Name = "Linee"
            Linee.Parent = MainFramePage
            Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Linee.BackgroundTransparency = 1.000
            Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
            Linee.Size = UDim2.new(0, 470, 0, 20)
            
            Line.Name = "Line"
            Line.Parent = Linee
            Line.BackgroundColor3 = _G.Color
            Line.BorderSizePixel = 0
            Line.Position = UDim2.new(0, 0, 0, 10)
            Line.Size = UDim2.new(0, 470, 0, 1)
        end
        return main
    end
    return uitab
end

print("Script Carregado")


-------------------------------------------------------
--library
local Library = Update:Window("    Beto","16329392936",Enum.KeyCode.RightControl);

local H = Library:AddTab("Home","16308336145")
local Main = Library:AddTab("Main","16293827543")
local T = Library:AddTab("Target","16293860067")
local A = Library:AddTab("Animations","16294131291")
local E = Library:AddTab("Esp","16294207372")
local Misc = Library:AddTab("Misc","16294223840")
-------------------------------------------------------
--variables
local plr = game.Players.LocalPlayer
-------------------------------------------------------
--functions
function copySpawnCoordinatesToClipboard(speaker)
    local spawnpos = speaker.Character:WaitForChild("HumanoidRootPart").CFrame.Position
    local coordinatesString = 'Spawn point coordinates: ' .. tostring(spawnpos)
    
    -- Copie as coordenadas para a área de transferência
    setclipboard(coordinatesString)
end
-------------------------------------------------------
--Home
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
-------------------------------------------------------
--Main
Main:AddLabel("Main")
Main:AddButton("Anti-Fling",function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Beto-hub/main/Anti-fling.lua"))()
end)

Main:AddButton("Shiftlock",function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/Unknownproootest/Permanent-Shift-Lock-Beta/alt/PermShiftlockV2-alt'))()
end)

Main:AddButton("Fly",function()
  loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-I-Fly-gui-V3-I-6627"))()
end)
Main:AddButton("tp",function()
local you = game.Players.LocalPlayer.Character.HumanoidRootPart
      		local location = CFrame.new(2087.052734375, -11.650469779968262, -12.764727592468262)
      		
      		you.CFrame = location
        	end    
             )    
-------------------------------------------------------
--Target
T:AddLabel("Target")

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
    T:AddToggle("Teleport",false,function(value)

        _G.TeleportPly = value

        pcall(function()
            if _G.TeleportPly then
                repeat topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) wait() until _G.TeleportPly == false
            end
            StopTween(_G.TeleportPly)
        end)
    end)
    
-------------------------------------------------------
--animations 
A:AddLabel("Animations")
A:AddLabel("Aviso: Os emote não funciona no delta.")
A:AddLabel("More animations coming soon.../Mais animações embreve...")

A:AddButton("All Emotes",function()
  loadstring(game:HttpGet("https://scriptblox.com/raw/Brookhaven-RP-all-emotes-6849"))()
end)
A:AddButton("idle",function()
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
    end)
-------------------------------------------------------
--esp
E:AddButton("Esp Box",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Beto-hub/main/EspBox.lua"))()
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
-------------------------------------------------------
--misc
  Misc:AddLabel("Chat Spy:")
  Misc:AddLabel("Only works in normal chat / Só funciona no chat normal")
  Misc:AddButton("InfYield",function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Yield/main/main.lua"))()
  end
  )
  
  Misc:AddButton("Chat spy",function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/Roberto353656/Beto-hub/main/Chat_spy.lua"))()
  end
  )
  
  Misc:AddButton("Fps unlock",function()
    setfpscap(9999999)
  end
  )
  Misc:AddButton("Re-Enter",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mM7JBG5h", true))() 
  end
  )
  Misc:AddButton("Get Cords", function()
   copySpawnCoordinatesToClipboard(game.Players.LocalPlayer)
   end)
-------------------------------------------------------
