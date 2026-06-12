-- ====================================================================
-- FOX SCRIPT V1 | MM2 ULTRA-PREMIUM ORANGE HUB (FULL VERSION)
-- UNTRUNCATED, UNMINIFIED, FULL MECHANICS & NO SIMPLIFICATION
-- ====================================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local workspace = game:GetService("Workspace")
local camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- دالة فحص دقيقة لجلب أدوار اللاعبين الحالية بدون أخطاء
local function getPlayerRole(targetPlayer)
    if not targetPlayer then return "Innocent" end
    local char = targetPlayer.Character
    local bp = targetPlayer:FindFirstChild("Backpack")
    
    if (char and char:FindFirstChild("Knife")) or (bp and bp:FindFirstChild("Knife")) then
        return "Murderer"
    elseif (char and char:FindFirstChild("Gun")) or (bp and bp:FindFirstChild("Gun")) then
        return "Sheriff"
    end
    
    if targetPlayer:FindFirstChild("PlayerData") and targetPlayer.PlayerData:FindFirstChild("Role") then
        local roleValue = targetPlayer.PlayerData.Role.Value
        if roleValue == "Murderer" or roleValue == "Murder" then return "Murderer" end
        if roleValue == "Sheriff" then return "Sheriff" end
    end
    
    return "Innocent"
end

-- ========== الواجهة الحاضنة الرئيسية ==========
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FoxScriptV1_FullPremiumHub"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- ========== زر المود منيو الدائري الطافي (FoxModMenuCircle) ==========
local modMenuCircle = Instance.new("ImageButton")
modMenuCircle.Name = "FoxModMenuCircle"
modMenuCircle.Size = UDim2.new(0, 65, 0, 65)
modMenuCircle.Position = UDim2.new(0.05, 0, 0.4, 0)
modMenuCircle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
modMenuCircle.Image = "rbxassetid://13210457635" 
modMenuCircle.ScaleType = Enum.ScaleType.Crop
modMenuCircle.BorderSizePixel = 0
modMenuCircle.Visible = false 
modMenuCircle.Parent = screenGui

local modCircleCorner = Instance.new("UICorner")
modCircleCorner.CornerRadius = UDim.new(1, 0)
modCircleCorner.Parent = modMenuCircle

local modCircleStroke = Instance.new("UIStroke")
modCircleStroke.Thickness = 2.5
modCircleStroke.Color = Color3.fromRGB(255, 100, 0)
modCircleStroke.Parent = modMenuCircle

-- ========== القائمة الرئيسية (FOX Script V1) باللون البرتقالي الكامل ==========
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 500)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(255, 100, 0)
uiStroke.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 42)
topBar.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(0.6, 0, 1, 0)
hubTitle.Position = UDim2.new(0, 15, 0, 0)
hubTitle.Text = "FOX Script V1"
hubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
hubTitle.BackgroundTransparency = 1
hubTitle.Font = Enum.Font.GothamBold
hubTitle.TextSize = 15
hubTitle.TextXAlignment = Enum.TextXAlignment.Left
hubTitle.Parent = topBar

local topBarLine = Instance.new("Frame")
topBarLine.Size = UDim2.new(1, 0, 0, 2)
topBarLine.Position = UDim2.new(0, 0, 1, -2)
topBarLine.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
topBarLine.BorderSizePixel = 0
topBarLine.Parent = topBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 32)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
closeBtn.Parent = topBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 35, 0, 32)
minimizeBtn.Position = UDim2.new(1, -85, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 16
minimizeBtn.Parent = topBar

local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -24, 1, -55)
contentFrame.Position = UDim2.new(0, 12, 0, 50)
contentFrame.BackgroundTransparency = 1
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 850) -- مساحة كاملة تستوعب كافة الخصائص
contentFrame.ScrollBarThickness = 4
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
contentFrame.Parent = mainFrame

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 6)
contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
contentLayout.Parent = contentFrame

-- ========== زر ديسكورد الدائري المتحرك المتواجد جهة اليمين ==========
local discordFloatingBtn = Instance.new("ImageButton")
discordFloatingBtn.Name = "DiscordRightButton"
discordFloatingBtn.Size = UDim2.new(0, 50, 0, 50)
discordFloatingBtn.Position = UDim2.new(1, 15, 0.5, -25) 
discordFloatingBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordFloatingBtn.Image = "rbxassetid://15654394011" 
discordFloatingBtn.BorderSizePixel = 0
discordFloatingBtn.Parent = mainFrame

local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(1, 0)
discordCorner.Parent = discordFloatingBtn

local discordStroke = Instance.new("UIStroke")
discordStroke.Thickness = 2
discordStroke.Color = Color3.fromRGB(255, 255, 255)
discordStroke.Parent = discordFloatingBtn

task.spawn(function()
    while task.wait(1) do
        if discordFloatingBtn and discordFloatingBtn.Parent then
            local t1 = TweenService:Create(discordFloatingBtn, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 54, 0, 54)})
            local t2 = TweenService:Create(discordFloatingBtn, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 50, 0, 50)})
            t1:Play() t1.Completed:Wait()
            t2:Play()
        end
    end
end)

discordFloatingBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/ENyJCy6j4n")
    end
end)

-- ========== نافذة الكشف (Sub-Panel Source) البرتقالية الأصلية ==========
local subPanelFrame = Instance.new("Frame")
subPanelFrame.Size = UDim2.new(0, 210, 0, 210)
subPanelFrame.Position = UDim2.new(0, 20, 0.15, 0)
subPanelFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
subPanelFrame.BackgroundTransparency = 0.15
subPanelFrame.BorderSizePixel = 0
subPanelFrame.Parent = screenGui

local subStroke = Instance.new("UIStroke")
subStroke.Thickness = 1.5
subStroke.Color = Color3.fromRGB(255, 100, 0)
subStroke.Parent = subPanelFrame

local subTopBar = Instance.new("Frame")
subTopBar.Size = UDim2.new(1, 0, 0, 30)
subTopBar.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
subTopBar.BorderSizePixel = 0
subTopBar.Parent = subPanelFrame

local subTitle = Instance.new("TextLabel")
subTitle.Size = UDim2.new(1, 0, 1, 0)
subTitle.Position = UDim2.new(0, 10, 0, 0)
subTitle.Text = "ESP CONTROLLER SOURCE"
subTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
subTitle.BackgroundTransparency = 1
subTitle.Font = Enum.Font.GothamBold
subTitle.TextSize = 10
subTitle.TextXAlignment = Enum.TextXAlignment.Left
subTitle.Parent = subTopBar

local subBarLine = Instance.new("Frame")
subBarLine.Size = UDim2.new(1, 0, 0, 1.5)
subBarLine.Position = UDim2.new(0, 0, 1, -1.5)
subBarLine.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
subBarLine.BorderSizePixel = 0
subBarLine.Parent = subTopBar

local subContainer = Instance.new("Frame")
subContainer.Size = UDim2.new(1, 0, 1, -30)
subContainer.Position = UDim2.new(0, 0, 0, 30)
subContainer.BackgroundTransparency = 1
subContainer.Parent = subPanelFrame

local subLayout = Instance.new("UIListLayout")
subLayout.Padding = UDim.new(0, 4)
subLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
subLayout.VerticalAlignment = Enum.VerticalAlignment.Center
subLayout.Parent = subContainer

-- ========== نافذة الايمبوت (Aimbot Panel) البرتقالية الأصلية ==========
local aimPanelFrame = Instance.new("Frame")
aimPanelFrame.Size = UDim2.new(0, 210, 0, 150)
aimPanelFrame.Position = UDim2.new(0, 20, 0.55, 0)
aimPanelFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
aimPanelFrame.BackgroundTransparency = 0.15
aimPanelFrame.BorderSizePixel = 0
aimPanelFrame.Parent = screenGui

local aimStroke = Instance.new("UIStroke")
aimStroke.Thickness = 1.5
aimStroke.Color = Color3.fromRGB(255, 100, 0)
aimStroke.Parent = aimPanelFrame

local aimTopBar = Instance.new("Frame")
aimTopBar.Size = UDim2.new(1, 0, 0, 30)
aimTopBar.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
aimTopBar.BorderSizePixel = 0
aimTopBar.Parent = aimPanelFrame

local aimTitle = Instance.new("TextLabel")
aimTitle.Size = UDim2.new(1, 0, 1, 0)
aimTitle.Position = UDim2.new(0, 10, 0, 0)
aimTitle.Text = "AIMBOT CONTROLLER"
aimTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
aimTitle.BackgroundTransparency = 1
aimTitle.Font = Enum.Font.GothamBold
aimTitle.TextSize = 10
aimTitle.TextXAlignment = Enum.TextXAlignment.Left
aimTitle.Parent = aimTopBar

local aimBarLine = Instance.new("Frame")
aimBarLine.Size = UDim2.new(1, 0, 0, 1.5)
aimBarLine.Position = UDim2.new(0, 0, 1, -1.5)
aimBarLine.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
aimBarLine.BorderSizePixel = 0
aimBarLine.Parent = aimTopBar

local aimContainer = Instance.new("Frame")
aimContainer.Size = UDim2.new(1, 0, 1, -30)
aimContainer.Position = UDim2.new(0, 0, 0, 30)
aimContainer.BackgroundTransparency = 1
aimContainer.Parent = aimPanelFrame

local aimLayout = Instance.new("UIListLayout")
aimLayout.Padding = UDim.new(0, 4)
aimLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
aimLayout.VerticalAlignment = Enum.VerticalAlignment.Center
aimLayout.Parent = aimContainer

-- متغيرات التحكم والحالات الأصلية بالكامل
local espBoxActive = false
local espLineActive = false
local espNameActive = false
local espChamsActive = false
local espActive = false

local killAllActive = false
local killMurdererActive = false
local autoFetchGunActive = false
local aimActive = false
local invisibleActive = false
local flyActive = false
local autoFarmCoinsActive = false
local autoWeaponTpActive = false

local currentWalkSpeed = 16
local aimRadius = 150
local flySpeed = 50

local freezeMurdererActive = false
local freezeSheriffActive = false

-- دائرة الـ FOV للايمبوت البرتقالية
local fovCircle = Instance.new("Frame")
fovCircle.Size = UDim2.new(0, aimRadius * 2, 0, aimRadius * 2)
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fovCircle.BackgroundTransparency = 1
fovCircle.Visible = false
fovCircle.Parent = screenGui

local fovCorner = Instance.new("UICorner")
fovCorner.CornerRadius = UDim.new(1, 0)
fovCorner.Parent = fovCircle

local fovStroke = Instance.new("UIStroke")
fovStroke.Color = Color3.fromRGB(255, 100, 0)
fovStroke.Thickness = 1.5
fovStroke.Parent = fovCircle

local function createSubPanelButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.92, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 10
    btn.Parent = subContainer
    
    local act = false
    btn.MouseButton1Click:Connect(function()
        act = not act
        btn.BackgroundColor3 = act and Color3.fromRGB(255, 100, 0) or Color3.fromRGB(16, 16, 16)
        btn.TextColor3 = act and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
        callback(act)
    end)
end

createSubPanelButton("Toggle Boxes ESP", function(state) espBoxActive = state espActive = (espBoxActive or espLineActive or espNameActive) end)
createSubPanelButton("Toggle Lines ESP", function(state) espLineActive = state espActive = (espBoxActive or espLineActive or espNameActive) end)
createSubPanelButton("Toggle Names ESP", function(state) espNameActive = state espActive = (espBoxActive or espLineActive or espNameActive) end)
createSubPanelButton("Toggle White Skin Chams", function(state) espChamsActive = state end)

local function createAimPanelButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.92, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 10
    btn.Parent = aimContainer
    
    local act = false
    btn.MouseButton1Click:Connect(function()
        act = not act
        btn.BackgroundColor3 = act and Color3.fromRGB(255, 100, 0) or Color3.fromRGB(16, 16, 16)
        btn.TextColor3 = act and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
        callback(act)
    end)
end

createAimPanelButton("Toggle Lock Aimbot", function(state) aimActive = state fovCircle.Visible = state end)

-- ========== مقبض التحكم بـ Aimbot FOV ==========
local fovSliderFrame = Instance.new("Frame")
fovSliderFrame.Size = UDim2.new(0, 190, 0, 45)
fovSliderFrame.BackgroundTransparency = 1
fovSliderFrame.Parent = aimContainer

local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(1, 0, 0, 20)
fovLabel.Text = "Aimbot FOV: 150"
fovLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
fovLabel.BackgroundTransparency = 1
fovLabel.Font = Enum.Font.GothamSemibold
fovLabel.TextSize = 9
fovLabel.TextXAlignment = Enum.TextXAlignment.Left
fovLabel.Parent = fovSliderFrame

local fovBg = Instance.new("Frame")
fovBg.Size = UDim2.new(1, 0, 0, 4)
fovBg.Position = UDim2.new(0, 0, 0, 25)
fovBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
fovBg.BorderSizePixel = 0
fovBg.Parent = fovSliderFrame

local fovKnob = Instance.new("Frame")
fovKnob.Size = UDim2.new(0, 12, 0, 12)
fovKnob.Position = UDim2.new(0.15, -6, 0.5, -6)
fovKnob.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
fovKnob.BorderSizePixel = 0
fovKnob.Parent = fovBg

local fovKnobCorner = Instance.new("UICorner")
fovKnobCorner.CornerRadius = UDim.new(1, 0)
fovKnobCorner.Parent = fovKnob

local fovTrigger = Instance.new("TextButton")
fovTrigger.Size = UDim2.new(1, 0, 4, 0)
fovTrigger.Position = UDim2.new(0, 0, -1.5, 0)
fovTrigger.BackgroundTransparency = 1
fovTrigger.Text = ""
fovTrigger.Parent = fovBg

fovTrigger.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local function updateFov(inp)
            local pct = math.clamp((inp.Position.X - fovBg.AbsolutePosition.X) / fovBg.AbsoluteSize.X, 0, 1)
            fovKnob.Position = UDim2.new(pct, -6, 0.5, -6)
            aimRadius = math.floor(10 + (pct * 790))
            fovLabel.Text = "Aimbot FOV: " .. tostring(aimRadius)
            fovCircle.Size = UDim2.new(0, aimRadius * 2, 0, aimRadius * 2)
        end
        updateFov(input)
        local mv, nd
        mv = UserInputService.InputChanged:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then updateFov(inp) end
        end)
        nd = UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then mv:Disconnect(); nd:Disconnect() end
        end)
    end
end)

local function createUINeonDivider(color)
    local div = Instance.new("Frame")
    div.Size = UDim2.new(0.98, 0, 0, 2)
    div.BackgroundColor3 = color
    div.BorderSizePixel = 0
    div.Parent = contentFrame
end

-- ========== مقبض التحكم بالسرعة (WalkSpeed Slider) ==========
local function createSpeedSlider()
    local speedSliderFrame = Instance.new("Frame")
    speedSliderFrame.Size = UDim2.new(0.98, 0, 0, 60)
    speedSliderFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    speedSliderFrame.BorderSizePixel = 0
    speedSliderFrame.Parent = contentFrame

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Size = UDim2.new(1, -20, 0, 25)
    speedLabel.Position = UDim2.new(0, 12, 0, 4)
    speedLabel.Text = "WalkSpeed: 16"
    speedLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    speedLabel.BackgroundTransparency = 1
    speedLabel.Font = Enum.Font.GothamSemibold
    speedLabel.TextSize = 11
    speedLabel.TextXAlignment = Enum.TextXAlignment.Left
    speedLabel.Parent = speedSliderFrame

    local speedBg = Instance.new("Frame")
    speedBg.Size = UDim2.new(1, -24, 0, 4)
    speedBg.Position = UDim2.new(0, 12, 0, 38)
    speedBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    speedBg.BorderSizePixel = 0
    speedBg.Parent = speedSliderFrame

    local speedKnob = Instance.new("Frame")
    speedKnob.Size = UDim2.new(0, 12, 0, 12)
    speedKnob.Position = UDim2.new(0.05, -6, 0.5, -6)
    speedKnob.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    speedKnob.BorderSizePixel = 0
    speedKnob.Parent = speedBg

    local speedKnobCorner = Instance.new("UICorner")
    speedKnobCorner.CornerRadius = UDim.new(1, 0)
    speedKnobCorner.Parent = speedKnob

    local speedTrigger = Instance.new("TextButton")
    speedTrigger.Size = UDim2.new(1, 0, 4, 0)
    speedTrigger.Position = UDim2.new(0, 0, -1.5, 0)
    speedTrigger.BackgroundTransparency = 1
    speedTrigger.Text = ""
    speedTrigger.Parent = speedBg

    speedTrigger.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local function updateSpd(inp)
                local pct = math.clamp((inp.Position.X - speedBg.AbsolutePosition.X) / speedBg.AbsoluteSize.X, 0, 1)
                speedKnob.Position = UDim2.new(pct, -6, 0.5, -6)
                currentWalkSpeed = math.floor(16 + (pct * 200))
                speedLabel.Text = "WalkSpeed: " .. tostring(currentWalkSpeed)
            end
            updateSpd(input)
            local mv, nd
            mv = UserInputService.InputChanged:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then updateSpd(inp) end
            end)
            nd = UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then mv:Disconnect(); nd:Disconnect() end
            end)
        end
    end)
end

-- ========== مقبض التحكم بسرعة الطيران (Fly Speed Slider) ==========
local function createFlySpeedSlider()
    local flySliderFrame = Instance.new("Frame")
    flySliderFrame.Size = UDim2.new(0.98, 0, 0, 60)
    flySliderFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    flySliderFrame.BorderSizePixel = 0
    flySliderFrame.Parent = contentFrame

    local flyLabel = Instance.new("TextLabel")
    flyLabel.Size = UDim2.new(1, -20, 0, 25)
    flyLabel.Position = UDim2.new(0, 12, 0, 4)
    flyLabel.Text = "Fly Speed: 50"
    flyLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    flyLabel.BackgroundTransparency = 1
    flyLabel.Font = Enum.Font.GothamSemibold
    flyLabel.TextSize = 11
    flyLabel.TextXAlignment = Enum.TextXAlignment.Left
    flyLabel.Parent = flySliderFrame

    local flyBg = Instance.new("Frame")
    flyBg.Size = UDim2.new(1, -24, 0, 4)
    flyBg.Position = UDim2.new(0, 12, 0, 38)
    flyBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    flyBg.BorderSizePixel = 0
    flyBg.Parent = flySliderFrame

    local flyKnob = Instance.new("Frame")
    flyKnob.Size = UDim2.new(0, 12, 0, 12)
    flyKnob.Position = UDim2.new(0.25, -6, 0.5, -6)
    flyKnob.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    flyKnob.BorderSizePixel = 0
    flyKnob.Parent = flyBg

    local flyKnobCorner = Instance.new("UICorner")
    flyKnobCorner.CornerRadius = UDim.new(1, 0)
    flyKnobCorner.Parent = flyKnob

    local flyTrigger = Instance.new("TextButton")
    flyTrigger.Size = UDim2.new(1, 0, 4, 0)
    flyTrigger.Position = UDim2.new(0, 0, -1.5, 0)
    flyTrigger.BackgroundTransparency = 1
    flyTrigger.Text = ""
    flyTrigger.Parent = flyBg

    flyTrigger.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local function updateFlySpd(inp)
                local pct = math.clamp((inp.Position.X - flyBg.AbsolutePosition.X) / flyBg.AbsoluteSize.X, 0, 1)
                flyKnob.Position = UDim2.new(pct, -6, 0.5, -6)
                flySpeed = math.floor(10 + (pct * 240))
                flyLabel.Text = "Fly Speed: " .. tostring(flySpeed)
            end
            updateFlySpd(input)
            local mv, nd
            mv = UserInputService.InputChanged:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then updateFlySpd(inp) end
            end)
            nd = UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then mv:Disconnect(); nd:Disconnect() end
            end)
        end
    end)
end

-- ========== أنظمة معالجة الـ ESP والكشف التلقائي الكامل ==========
local esps = {}
local chamsObjects = {}

local function clearESP()
    for _, obj in pairs(esps) do
        if obj.Box then obj.Box:Destroy() end
        if obj.Line then obj.Line:Destroy() end
        if obj.NameLabel then obj.NameLabel:Destroy() end
    end
    esps = {}
    for char, highlight in pairs(chamsObjects) do if highlight then highlight:Destroy() end end
    chamsObjects = {}
end

local function applyAdvancedESP()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            if espChamsActive and p.Character:FindFirstChildOfClass("Humanoid") and p.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                if not chamsObjects[p.Character] then
                    local highlight = Instance.new("Highlight")
                    highlight.FillColor = Color3.fromRGB(255, 255, 255)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.2
                    highlight.OutlineTransparency = 0
                    highlight.Parent = p.Character
                    chamsObjects[p.Character] = highlight
                end
            else
                if chamsObjects[p.Character] then chamsObjects[p.Character]:Destroy() chamsObjects[p.Character] = nil end
            end
        end
    end

    if not espActive then
        for _, obj in pairs(esps) do
            if obj.Box then obj.Box.Visible = false end
            if obj.Line then obj.Line.Visible = false end
            if obj.NameLabel then obj.NameLabel.Visible = false end
        end
        return 
    end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChildOfClass("Humanoid") and p.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            local root = p.Character.HumanoidRootPart
            local pos, onScreen = camera:WorldToViewportPoint(root.Position)
            
            local role = getPlayerRole(p)
            local clr = Color3.fromRGB(0, 255, 0)
            if role == "Murderer" then clr = Color3.fromRGB(255, 0, 0)
            elseif role == "Sheriff" then clr = Color3.fromRGB(0, 150, 255) end
            
            if onScreen then
                if not esps[p] then
                    esps[p] = {}
                    local box = Instance.new("Frame") box.BackgroundTransparency = 1 box.BorderSizePixel = 0 box.Parent = screenGui
                    local stroke = Instance.new("UIStroke") stroke.Thickness = 1.5 stroke.Parent = box
                    esps[p].Box = box esps[p].Stroke = stroke
                    
                    local line = Instance.new("Frame") line.BorderSizePixel = 0 line.Parent = screenGui
                    esps[p].Line = line
                    
                    local nameLabel = Instance.new("TextLabel") nameLabel.BackgroundTransparency = 1 nameLabel.Font = Enum.Font.GothamBold nameLabel.TextSize = 11 nameLabel.Parent = screenGui
                    esps[p].NameLabel = nameLabel
                end
                
                local sizeOffset = 2000 / pos.Z
                esps[p].Box.Size = UDim2.new(0, sizeOffset, 0, sizeOffset * 1.4)
                esps[p].Box.Position = UDim2.new(0, pos.X - (sizeOffset/2), 0, pos.Y - (sizeOffset*0.7))
                esps[p].Box.Visible = espBoxActive
                esps[p].Stroke.Color = clr
                
                esps[p].Line.Size = UDim2.new(0, 1.5, 0, camera.ViewportSize.Y - pos.Y)
                esps[p].Line.Position = UDim2.new(0, pos.X, 0, pos.Y)
                esps[p].Line.BackgroundColor3 = clr
                esps[p].Line.Visible = espLineActive
                
                esps[p].NameLabel.Text = p.Name .. " [" .. role .. "]"
                esps[p].NameLabel.TextColor3 = clr
                esps[p].NameLabel.Position = UDim2.new(0, pos.X - 50, 0, pos.Y - (sizeOffset*0.7) - 15)
                esps[p].NameLabel.Size = UDim2.new(0, 100, 0, 15)
                esps[p].NameLabel.Visible = espNameActive
            else
                if esps[p] then esps[p].Box.Visible = false esps[p].Line.Visible = false esps[p].NameLabel.Visible = false end
            end
        else
            if esps[p] then
                if esps[p].Box then esps[p].Box:Destroy() end
                if esps[p].Line then esps[p].Line:Destroy() end
                if esps[p].NameLabel then esps[p].NameLabel:Destroy() end
                esps[p] = nil
            end
        end
    end
end

-- ========== الأنظمة القوية والميكانيكيات الشاملة للمود منيو ==========

local function doAutoFarmCoins()
    if not autoFarmCoinsActive or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local map = workspace:FindFirstChild("Normal") or workspace
    for _, o in pairs(map:GetDescendants()) do
        if o:IsA("BasePart") and (o.Name == "Coin_Server" or o.Name == "Coin" or o.Name == "Snowflake" or o.Name == "CandyCorn") then
            player.Character.HumanoidRootPart.CFrame = o.CFrame
            task.wait(0.1)
            break
        end
    end
end

local function doAutoFetchGun()
    if not autoFetchGunActive or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local gun = workspace:FindFirstChild("GunDrop") or workspace:FindFirstChild("DroppedGun")
    if not gun then
        for _, sub in pairs(workspace:GetDescendants()) do
            if sub.Name == "GunDrop" or sub.Name == "DroppedGun" then gun = sub break end
        end
    end
    if gun then
        local targetCFrame = gun:IsA("BasePart") and gun.CFrame or (gun:FindFirstChild("HumanoidRootPart") and gun.HumanoidRootPart.CFrame)
        if targetCFrame then player.Character.HumanoidRootPart.CFrame = targetCFrame end
    end
end

local function doKillMurderer()
    if not killMurdererActive or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local gun = player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun")
    if not gun then return end
    if gun.Parent == player.Backpack then gun.Parent = player.Character end
    
    for _, t in pairs(Players:GetPlayers()) do
        if t ~= player and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
            if getPlayerRole(t) == "Murderer" then
                local h = t.Character:FindFirstChildOfClass("Humanoid")
                if h and h.Health > 0 then
                    player.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                    gun:Activate()
                    task.wait(0.08)
                end
            end
        end
    end
end

-- ميكانيكية الاختفاء الكاملة والأصلية الآمنة عن السيرفر (Server-Side Invisibility)
local originalPosition = nil
local invisibleLoop = nil
local function toggleServerInvisibility()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    if invisibleActive then
        originalPosition = player.Character.HumanoidRootPart.CFrame
        invisibleLoop = RunService.Heartbeat:Connect(function()
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition.X, -300, originalPosition.Z)
            end
        end)
    else
        if invisibleLoop then invisibleLoop:Disconnect() invisibleLoop = nil end
        if originalPosition and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = originalPosition
        end
    end
end

-- نظام التجميد الشامل للقاتل والشريف (Role Freezing System)
local function processRoleFreezing()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local role = getPlayerRole(p)
            if freezeMurdererActive and role == "Murderer" then
                p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                p.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                if p.Character:FindFirstChildOfClass("Humanoid") then
                    p.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                end
            elseif not freezeMurdererActive and role == "Murderer" then
                if p.Character:FindFirstChildOfClass("Humanoid") and p.Character:FindFirstChildOfClass("Humanoid").PlatformStand == true then
                    p.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            end
            
            if freezeSheriffActive and role == "Sheriff" then
                p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                p.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                if p.Character:FindFirstChildOfClass("Humanoid") then
                    p.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                end
            elseif not freezeSheriffActive and role == "Sheriff" then
                if p.Character:FindFirstChildOfClass("Humanoid") and p.Character:FindFirstChildOfClass("Humanoid").PlatformStand == true then
                    p.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            end
        end
    end
end

local function doAutoWeaponTp()
    if not autoWeaponTpActive or not player.Character then return end
    local hasWeapon = player.Character:FindFirstChild("Knife") or player.Character:FindFirstChild("Gun")
    if not hasWeapon then return end
    
    local myRole = getPlayerRole(player)
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local targetRole = getPlayerRole(target)
            local hum = target.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                if myRole == "Murderer" and (targetRole == "Sheriff" or targetRole == "Innocent") then
                    player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    break
                elseif myRole == "Sheriff" and targetRole == "Murderer" then
                    player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    break
                end
            end
        end
    end
end

local function getClosestPlayer()
    local closest = nil
    local shortestDistance = math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
            if onScreen then
                local mousePos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                if dist < shortestDistance and dist < aimRadius then
                    shortestDistance = dist closest = p.Character.HumanoidRootPart
                end
            end
        end
    end
    return closest
end

-- ميكانيكية الطيران الحر الاحترافية الكاملة (Free Flight Mechanics)
local bodyVelocity, bodyGyro
local function startFlying()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local root = player.Character.HumanoidRootPart
    bodyVelocity = Instance.new("BodyVelocity") bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0) bodyVelocity.Parent = root
    bodyGyro = Instance.new("BodyGyro") bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.CFrame = root.CFrame bodyGyro.Parent = root
    task.spawn(function()
        while flyActive and root and bodyVelocity and bodyGyro do
            local moveDirection = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + camera.CFrame.RightVector end
            bodyVelocity.Velocity = moveDirection * flySpeed bodyGyro.CFrame = camera.CFrame task.wait()
        end
    end)
end
local function stopFlying() if bodyVelocity then bodyVelocity:Destroy() end if bodyGyro then bodyGyro:Destroy() end end

local function doKillAll()
    if not killAllActive or not player.Character then return end
    local knife = player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")
    if not knife then return end
    if knife.Parent == player.Backpack then knife.Parent = player.Character end
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local hum = target.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                knife:Activate() task.wait(0.04)
            end
        end
    end
end

-- ========== دالة بناء الأزرار بنمط ومفاتيح iOS السلسة والأصلية الكاملة ==========
local function createMenuButton(text, arabicText, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.98, 0, 0, 42)
    container.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    container.BorderSizePixel = 0
    container.Parent = contentFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 11.5
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local arabicLabel = Instance.new("TextLabel")
    arabicLabel.Size = UDim2.new(0.35, 0, 1, 0)
    arabicLabel.Position = UDim2.new(0.35, 10, 0, 0)
    arabicLabel.Text = "- " .. arabicText
    arabicLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
    arabicLabel.BackgroundTransparency = 1
    arabicLabel.Font = Enum.Font.GothamMedium
    arabicLabel.TextSize = 11
    arabicLabel.TextXAlignment = Enum.TextXAlignment.Left
    arabicLabel.Parent = container

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(0, 85, 0, 22)
    statusLabel.Position = UDim2.new(1, -165, 0.5, -11)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "[ DISABLED ]"
    statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    statusLabel.Font = Enum.Font.Code
    statusLabel.TextSize = 10
    statusLabel.Parent = container

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 26)
    toggleBtn.Position = UDim2.new(1, -62, 0.5, -13)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = ""
    toggleBtn.Parent = container

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleBtn

    local toggleBall = Instance.new("Frame")
    toggleBall.Size = UDim2.new(0, 22, 0, 22)
    toggleBall.Position = UDim2.new(0, 2, 0.5, -11)
    toggleBall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleBall.BorderSizePixel = 0
    toggleBall.Parent = toggleBtn

    local ballCorner = Instance.new("UICorner")
    ballCorner.CornerRadius = UDim.new(1, 0)
    ballCorner.Parent = toggleBall

    local active = false
    toggleBtn.MouseButton1Click:Connect(function()
        active = not active
        local targetPosition = active and UDim2.new(0, 26, 0.5, -11) or UDim2.new(0, 2, 0.5, -11)
        local targetColor = active and Color3.fromRGB(255, 100, 0) or Color3.fromRGB(40, 40, 40)
        
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(toggleBall, tweenInfo, {Position = targetPosition}):Play()
        TweenService:Create(toggleBtn, tweenInfo, {BackgroundColor3 = targetColor}):Play()
        
        if active then
            statusLabel.Text = "[ ENABLED ]"
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 0)
        else
            statusLabel.Text = "[ DISABLED ]"
            statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
        callback(active)
    end)
    return container
end

-- ========== حقن كافة أزرار الميزات الكاملة والأصلية بالقائمة ==========
createMenuButton("Freeze Murderer for All", "تجميد ولاج كامل للقاتل يظهر لكل السيرفر", function(state) freezeMurdererActive = state end)
createMenuButton("Freeze Sheriff for All", "تجميد ولاج كامل للشريف يظهر لكل السيرفر", function(state) freezeSheriffActive = state end)

createUINeonDivider(Color3.fromRGB(255, 100, 0))

createMenuButton("Server-Side Invisibility", "زر الاختفاء الفوري الكلي عن السيرفر آمن", function(state) invisibleActive = state toggleServerInvisibility() end)
createMenuButton("Auto Farm Map Coins", "تجميع كوينز تلقائي فوري وسلس", function(state) autoFarmCoinsActive = state end)
createSpeedSlider()

createUINeonDivider(Color3.fromRGB(255, 255, 255))

createMenuButton("Auto Pickup Dropped Gun", "أخذ سلاح الشريف الميت تلقائياً فوراً", function(state) autoFetchGunActive = state end)
createMenuButton("Auto Shoot Murderer", "قتل وإطلاق نار فوري على القاتل", function(state) killMurdererActive = state end)
createMenuButton("Auto Weapon Teleport", "انتقال تلقائي للهدف عند مسك السلاح", function(state) autoWeaponTpActive = state end)

createUINeonDivider(Color3.fromRGB(255, 100, 0))

createMenuButton("Free Flight Mechanics", "طيران وتحليق حر في الخريطة أزرار", function(state) flyActive = state if flyActive then startFlying() else stopFlying() end end)
createFlySpeedSlider()
createMenuButton("Kill All Map Lobby", "تصفية وإنهاء كل السيرفر فوراً", function(state) killAllActive = state end)

-- ========== نظام التحكم الكامل بالفتح والإغلاق الفوري السلس ==========
local minimized = false

local function toggleMenuVisibility()
    minimized = not minimized
    mainFrame.Visible = not minimized
    subPanelFrame.Visible = not minimized
    aimPanelFrame.Visible = not minimized
    modMenuCircle.Visible = minimized
    if minimized then fovCircle.Visible = false elseif aimActive then fovCircle.Visible = true end
end

minimizeBtn.MouseButton1Click:Connect(toggleMenuVisibility)
modMenuCircle.MouseButton1Click:Connect(toggleMenuVisibility)

closeBtn.MouseButton1Click:Connect(function()
    clearESP()
    screenGui:Destroy()
end)

-- نظام سحب اللوحات الاحترافي الأصلي الكامل المتوافق مع اللمس والماوس
local function makeDraggable(topBarObj, mainFrameObj)
    local dragging, dragInput, dragStart, startPos
    topBarObj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true dragStart = input.Position startPos = mainFrameObj.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    topBarObj.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainFrameObj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(topBar, mainFrame)
makeDraggable(subTopBar, subPanelFrame)
makeDraggable(aimTopBar, aimPanelFrame)

-- نظام سحب خاص بالزر الدائري دون تعارض مع النقرات
local circleDragging = false
local circleDragStart, circleStartPos

modMenuCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        circleDragStart = input.Position
        circleStartPos = modMenuCircle.Position
        circleDragging = false
    end
end)

modMenuCircle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if circleDragStart then
            local delta = input.Position - circleDragStart
            if delta.Magnitude > 7 then
                circleDragging = true
                modMenuCircle.Position = UDim2.new(circleStartPos.X.Scale, circleStartPos.X.Offset + delta.X, circleStartPos.Y.Scale, circleStartPos.Y.Offset + delta.Y)
            end
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        circleDragStart = nil
    end
end)

-- محرك الـ RenderStepped الكامل بدون معالجات مجتزأة لتفادي الـ Lag
RunService.RenderStepped:Connect(function()
    applyAdvancedESP()
    processRoleFreezing()
    
    if killAllActive then doKillAll() end
    if killMurdererActive then doKillMurderer() end
    if autoFetchGunActive then doAutoFetchGun() end
    if autoFarmCoinsActive then doAutoFarmCoins() end
    if autoWeaponTpActive then doAutoWeaponTp() end
    
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = currentWalkSpeed
    end

    if aimActive then
        local target = getClosestPlayer()
        if target then camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position) end
    end
    
    fovCircle.Position = UDim2.new(0, camera.ViewportSize.X / 2, 0, camera.ViewportSize.Y / 2)
end)

print("FOX Script V1 Original Untruncated Version Loaded Successfully!")
