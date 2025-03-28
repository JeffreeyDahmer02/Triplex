--[[

        Triplex™
        @ev6k
        Version 1.0.0
        Source CODE!! WOW
        BEAR YOUR EYES FOR THIS
        UNREADABLE AHH CODING
         GPT HELPED BHHHHAHGS

]]

local GunTP = {
    Enabled = false,
    Anchor = false,
    Offset = {0, -1, 0}
}

local guh = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local dick = os.date("%Y-%m-%d")
local RunService = game:GetService("RunService")

local speed = 5
local distance = 5
local height = 5
local angle = 0
local Teleport2Ppl = true
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local camtarg = nil
local TargBindEnabled = false
local fovRadius = 100
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local role = "Nigger"
if localPlayer.Name == "DHTeleport" or "DaHoodDemolisher" then
    role = "Developer Nigga | @Pete"
elseif localPlayer.Name == "DHTeleport2" or "xxHannahGlitchxx" then
    role = "Taco"
end

local HitBox = {
    Settings = {
        Size = 5,
        Transparency = 1,
        Color = Color3.fromRGB(255, 0, 0),
        Material = Enum.Material.Neon
    },
    Outline = {
        Color = Color3.fromRGB(0, 0, 0),
        Width = 0.08
    }
}

--// add highlight and bg dick shit visuals gyat

local Gradient = {
    Settings = {
        Enabled = false,
        StrokeColor = Color3.fromRGB(255, 255, 255),
        StrokeWidth = 1,
        AutoRescale = false,
        Color = {Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)}
    }
}

local TargetAimbot = {
    Enabled = true,
    Keybind = Enum.KeyCode.Q,
    Autoselect = false,
    Prediction = 0.145,
    RealPrediction = 0.145,
    Resolver = false,
    ResolverType = "Recalculate",
    JumpOffset = 0.06,
    RealJumpOffset = 0.09,
    HitParts = {"HumanoidRootPart"},
    RealHitPart = "HumanoidRootPart",
    KoCheck = false,
    LookAt = false,
    CSync = {
        Enabled = false,
        Type = "Orbit",
        Distance = 10,
        Height = 2,
        Speed = 10,
        RandomAmount = 10,
        Color = Color3.fromRGB(255, 255, 255),
        Saved = nil,
        Visualize = false
    },
    ViewAt = false,
    Tracer = false,
    Highlight = true,
    HighlightColor1 = Color3.fromRGB(255, 255, 255),
    HighlightColor2 = Color3.fromRGB(255, 255, 255),
    Stats = false,
    UseFov = false,
    HitEffect = false,
    HitEffectType = "Coom", --  {{ Nova, Crescent Slash, Coom, Cosmic Explosion, Slash, Atomic Slash, Aura Burst }}
    HitEffectColor = Color3.fromRGB(188, 74, 21),
    HitSounds = false,
    HitSound = "Bameware",
    HitChams = false,
    HitChamsMaterial = Enum.Material.Neon,
    HitChamsDuration = 2,
    HitChamsColor = Color3.fromRGB(188, 74, 21),
    HitChamColorEnabled = false,
    HitChamsTransparency = 0,
    HitChamsAcc = false,
    SkeleColor = Color3.fromRGB(155, 0, 155)
}

local Utility = {}
local ScreenGui = Instance.new("ScreenGui")
local GradientFOV = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

GradientFOV.Name = "GradientFOV"
GradientFOV.Parent = ScreenGui
GradientFOV.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GradientFOV.BackgroundTransparency = 0.450
GradientFOV.BorderColor3 = Color3.fromRGB(0, 0, 0)
GradientFOV.BorderSizePixel = 0
GradientFOV.Visible = Gradient.Settings.Enabled
GradientFOV.Size = UDim2.new(0.1, 0, 0.1, 0)
local aspectRatio = Instance.new("UIAspectRatioConstraint")
aspectRatio.Parent = GradientFOV
aspectRatio.AspectRatio = 1 -- Always keep it square
GradientFOV.AnchorPoint = Vector2.new(0.5, 0.5)

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = GradientFOV

UIStroke.Parent = GradientFOV
UIStroke.Color = Gradient.Settings.StrokeColor
UIStroke.Thickness = Gradient.Settings.StrokeWidth

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function FindPlayer(Query)
    Query = Query:lower()
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            if
                string.find(Player.Name:lower(), Query, 1, true) or
                    string.find(Player.DisplayName:lower(), Query, 1, true)
             then
                return Player
            end
        end
    end
    return nil
end

local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local chatservice = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
local virtualinput = game:GetService("VirtualInputManager")
local savedposition

local function findplayer(query)
    query = query:lower()
    for _, player in pairs(players:GetPlayers()) do
        if player ~= localplayer then
            if
                string.find(player.Name:lower(), query, 1, true) or
                    string.find(player.DisplayName:lower(), query, 1, true)
             then
                return player
            end
        end
    end
    return nil
end

local function executebring(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        if not savedposition then
            savedposition = localplayer.Character.HumanoidRootPart.CFrame -- Default save if not set
        end

        localplayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        virtualinput:SendMouseButtonEvent(0, 0, 0, true, game, 1) -- Hold left mouse button

        while target.Character and target.Character:FindFirstChild("Humanoid") and target.Character.Humanoid.Health > 5 do
            task.wait()
        end

        virtualinput:SendMouseButtonEvent(0, 0, 0, false, game, 1) -- Release left mouse button
        localplayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
        task.wait(4)
        virtualinput:SendKeyEvent(true, "G", false, game)
        task.wait(0.1)
        virtualinput:SendKeyEvent(false, "G", false, game)
        task.wait(1)

        if savedposition then
            localplayer.Character.HumanoidRootPart.CFrame = savedposition -- Teleport back to the manually saved position
        end
    end
end

if chatservice then
    chatservice.OnMessageDoneFiltering.OnClientEvent:Connect(
        function(message)
            if message.FromSpeaker == localplayer.Name then
                local msg = message.Message:lower()

                if msg == "$yo" then
                    if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
                        savedposition = localplayer.Character.HumanoidRootPart.CFrame
                    end
                elseif msg:sub(1, 8) == "$gbring " then
                    local query = msg:sub(9)
                    local target = findplayer(query)
                    if target then
                        executebring(target)
                    end
                end
            end
        end
    )
end

local UIS = game:GetService("UserInputService")

local function updateSize()
    if Gradient.Settings.AutoRescale then
        local screenSize = UIS:GetMouseLocation() -- Gets screen size
        local minSize = math.min(screenSize.X, screenSize.Y) * 0.25 -- 25% of the smallest dimension
        GradientFOV.Size = UDim2.new(0, minSize, 0, minSize)
    end
end

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0) -- Fully rounded
corner.Parent = GradientFOV

UIGradient.Color =
    ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(189, 172, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(189, 172, 255))
}
UIGradient.Parent = GradientFOV

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function UpdateFOVPosition()
    local MousePos = game.Players.LocalPlayer:GetMouse()
    local TargetPosition = UDim2.new(0, MousePos.X, 0, MousePos.Y)
    local TweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local Tween = TweenService:Create(GradientFOV, TweenInfo, {Position = TargetPosition})
    Tween:Play()
end

game:GetService("RunService").RenderStepped:Connect(
    function()
        UpdateFOVPosition()
    end
)

function Utility.Toggle()
    GradientFOV.Visible = not GradientFOV.Visible
end

local function NFTGScript()
    local Script = Instance.new("LocalScript", GradientFOV)

    local UIGradient = Script.Parent:FindFirstChild("UIGradient")
    if UIGradient then
        UIGradient.Color = ColorSequence.new(Gradient.Settings.Color[1], Gradient.Settings.Color[2])
    end
end

coroutine.wrap(NFTGScript)()

local Aura = {
    Locals = {
        Enabled = false,
        Type = "Juju"
    }
}

local Players = game:GetService("Players")

local HitEffectModule = {
    Locals = {
        HitEffect = {
            Type = {}
        }
    }
}

local Attachment = Instance.new("Attachment")
HitEffectModule.Locals.HitEffect.Type["Skibidi RedRizz"] = Attachment

local MainColor = Color3.fromRGB(255, 255, 253)

local HealingWave1 = Instance.new("ParticleEmitter")
HealingWave1.Name = "Healing Wave 1"
HealingWave1.Lifetime = NumberRange.new(1.5, 1.5)
HealingWave1.SpreadAngle = Vector2.new(10, -10)
HealingWave1.LockedToPart = true
HealingWave1.Transparency =
    NumberSequence.new(
    {
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.1702454, 0.7, 0.014881),
        NumberSequenceKeypoint.new(0.2254601, 0.03125, 0.03125),
        NumberSequenceKeypoint.new(0.2852761, 0),
        NumberSequenceKeypoint.new(0.702454, 0),
        NumberSequenceKeypoint.new(0.8374233, 0.9125, 0.0601461),
        NumberSequenceKeypoint.new(1, 1)
    }
)
HealingWave1.LightEmission = 0.4
HealingWave1.Color = ColorSequence.new(Color3.fromRGB(234, 8, 255))
HealingWave1.VelocitySpread = 10
HealingWave1.Speed = NumberRange.new(3, 6)
HealingWave1.Brightness = 10
HealingWave1.Size =
    NumberSequence.new(
    {
        NumberSequenceKeypoint.new(0, 3.0624998, 1.8805969),
        NumberSequenceKeypoint.new(0.6420546, 1.9999999, 1.7619393),
        NumberSequenceKeypoint.new(1, 0.7499999, 0.7499999)
    }
)
HealingWave1.Rate = 20
HealingWave1.Texture = "rbxassetid://8047533775"
HealingWave1.RotSpeed = NumberRange.new(200, 400)
HealingWave1.Rotation = NumberRange.new(-180, 180)
HealingWave1.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
HealingWave1.Parent = Attachment

local HealingWave2 = Instance.new("ParticleEmitter")
HealingWave2.Name = "Healing Wave 2"
HealingWave2.Lifetime = NumberRange.new(1.5, 1.5)
HealingWave2.SpreadAngle = Vector2.new(10, -10)
HealingWave2.LockedToPart = true
HealingWave2.Transparency =
    NumberSequence.new(
    {
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.2254601, 0.03125, 0.03125),
        NumberSequenceKeypoint.new(0.6288344, 0.25625, 0.0593491),
        NumberSequenceKeypoint.new(0.8374233, 0.9125, 0.0601461),
        NumberSequenceKeypoint.new(1, 1)
    }
)
HealingWave2.LightEmission = 1
HealingWave2.Color = ColorSequence.new(Color3.fromRGB(238, 3, 255))
HealingWave2.VelocitySpread = 10
HealingWave2.Speed = NumberRange.new(3, 5)
HealingWave2.Brightness = 10
HealingWave2.Size =
    NumberSequence.new(
    {
        NumberSequenceKeypoint.new(0, 3.125),
        NumberSequenceKeypoint.new(0.4165329, 1.3749999, 1.3749999),
        NumberSequenceKeypoint.new(1, 0.9375, 0.9375)
    }
)
HealingWave2.Rate = 20
HealingWave2.Texture = "rbxassetid://8047796070"
HealingWave2.RotSpeed = NumberRange.new(100, 300)
HealingWave2.Rotation = NumberRange.new(-180, 180)
HealingWave2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
HealingWave2.Parent = Attachment

local Sparks = Instance.new("ParticleEmitter")
Sparks.Name = "Sparks"
Sparks.Lifetime = NumberRange.new(0.5, 2)
Sparks.SpreadAngle = Vector2.new(180, -180)
Sparks.LightEmission = 1
Sparks.Color = ColorSequence.new(Color3.fromRGB(255, 21, 255))
Sparks.Drag = 3
Sparks.VelocitySpread = 180
Sparks.Speed = NumberRange.new(5, 15)
Sparks.Brightness = 10
Sparks.Size =
    NumberSequence.new(
    {
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.14687, 0.4374999, 0.1875001),
        NumberSequenceKeypoint.new(1, 0)
    }
)
Sparks.Acceleration = Vector3.new(0, 3, 0)
Sparks.ZOffset = -1
Sparks.Rate = 40
Sparks.Texture = "rbxassetid://8611887361"
Sparks.RotSpeed = NumberRange.new(-30, 30)
Sparks.Orientation = Enum.ParticleOrientation.VelocityParallel
Sparks.Parent = Attachment

local StarSparks = Instance.new("ParticleEmitter")
StarSparks.Name = "Star Sparks"
StarSparks.Lifetime = NumberRange.new(1.5, 1.5)
StarSparks.SpreadAngle = Vector2.new(180, -180)
StarSparks.LightEmission = 1
StarSparks.Color = ColorSequence.new(Color3.fromRGB(226, 60, 255))
StarSparks.Drag = 3
StarSparks.VelocitySpread = 180
StarSparks.Speed = NumberRange.new(5, 10)
StarSparks.Brightness = 10
StarSparks.Size =
    NumberSequence.new(
    {
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1492777, 0.6874996, 0.6874996),
        NumberSequenceKeypoint.new(1, 0)
    }
)
StarSparks.Acceleration = Vector3.new(0, 3, 0)
StarSparks.ZOffset = 2
StarSparks.Texture = "rbxassetid://8611887703"
StarSparks.RotSpeed = NumberRange.new(-30, 30)
StarSparks.Rotation = NumberRange.new(-30, 30)
StarSparks.Parent = Attachment

local function spawnjuju()
    local player = Players.LocalPlayer

    Attachment.Parent = player.Character.LowerTorso

    StarSparks.Enabled = true
    Sparks.Enabled = true
    HealingWave1.Enabled = true
    HealingWave2.Enabled = true
end

local function disablejuju()
    local player = Players.LocalPlayer

    Attachment.Parent = nil

    StarSparks.Enabled = false
    Sparks.Enabled = false
    HealingWave1.Enabled = false
    HealingWave2.Enabled = false
end
-- nah
if Aura.Locals.Enabled == true and Aura.Locals.Type == "Juju" then
    spawnjuju()
else
    disablejuju()
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInput = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera
local ChatService = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local VirtualInput = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local AutoResett = false
local BlockInputs = false -- Flag to disable inputs

local function AutoReset()
    if AutoResett then
        while true do
            local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            local Humanoid = Character:FindFirstChild("Humanoid")

            if not HumanoidRootPart or not Humanoid then
                repeat
                    task.wait()
                until Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Humanoid")
                HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                Humanoid = Character:FindFirstChild("Humanoid")
            end

            local LastHealth = Humanoid.Health

            while task.wait(0.1) do
                if Humanoid.Health < LastHealth - 1 then
                    BlockInputs = true -- Block inputs before executing auto-reset

                    -- Teleport far off the map
                    if HumanoidRootPart then
                        HumanoidRootPart.CFrame = CFrame.new(99999, 99999, 99999)
                    end

                    task.wait(0.3) -- Wait before resetting

                    VirtualInput:SendKeyEvent(true, "Escape", false, game) -- Press ESC
                    task.wait(0.05)
                    VirtualInput:SendKeyEvent(false, "Escape", false, game)

                    task.wait(0.05)
                    VirtualInput:SendKeyEvent(true, "R", false, game) -- Press R
                    task.wait(0.05)
                    VirtualInput:SendKeyEvent(false, "R", false, game)

                    task.wait(0.05)
                    VirtualInput:SendKeyEvent(true, "Return", false, game) -- Press Enter
                    task.wait(0.01)
                    VirtualInput:SendKeyEvent(false, "Return", false, game)

                    -- Wait for the player to respawn
                    repeat
                        task.wait()
                    until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

                    BlockInputs = false -- Re-enable inputs after respawn
                    break
                end
                LastHealth = Humanoid.Health
            end
        end
    end
end

-- Restart auto-reset when the player respawns
LocalPlayer.CharacterAdded:Connect(
    function()
        task.spawn(AutoReset) -- Restart the function on respawn
    end
)

-- Block all inputs except the ones needed for auto-reset
UserInputService.InputBegan:Connect(
    function(input, gameProcessed)
        if BlockInputs and not gameProcessed and AutoResett then
            local allowedKeys = {
                Enum.KeyCode.Escape,
                Enum.KeyCode.R,
                Enum.KeyCode.Return
            }
            -- If the key pressed is NOT in the allowed list, block it
            if not table.find(allowedKeys, input.KeyCode) then
                return true -- Block input
            end
        end
    end
)

task.spawn(AutoReset)
-- Start the auto-reset loop

local CoreGui, StarterGui, SoundService, HttpService =
    cloneref(game:GetService("CoreGui")),
    cloneref(game:GetService("StarterGui")),
    cloneref(game:GetService("SoundService")),
    cloneref(game:GetService("HttpService"))
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = cloneref(Workspace.CurrentCamera)

local repo

if game:GetService("UserInputService").TouchEnabled or game:GetService("UserInputService").GamepadEnabled then
    repo = "https://raw.githubusercontent.com/LionTheGreatRealFrFr/MobileLinoriaLib/main/"
else
    repo = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/"
end
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Window = Library:CreateWindow({Title = "Triplex |FREE", Center = true, AutoShow = true})

local AimbotTab = Window:AddTab("Aiming")
local Aimbot = AimbotTab:AddLeftGroupbox("Aimbot")

local predictionX = 1
local predictionY = 1
local smoothness = 5
local easingStyle = "Linear"
local easingDirection = "InOut"
local wallCheck = true
local teamCheck = true

Aimbot:AddToggle(
    "Enabled",
    {
        Text = "Enabled",
        Default = false,
        Callback = function(a)
            CamLock = a
        end
    }
)
Aimbot:AddToggle(
    "Hitbox",
    {
        Text = "HitBox Expander",
        Default = false,
        Callback = function(a)
            HitBoz = a
        end
    }
)
Aimbot:AddToggle(
    "Sync",
    {
        Text = "Sync",
        Default = false,
        Callback = function(a)
            sync = a
        end
    }
)
Aimbot:AddToggle(
    "TeamCheck",
    {
        Text = "Team Check",
        Default = true,
        Callback = function(a)
            teamCheck = a
        end
    }
)
Aimbot:AddToggle(
    "WallCheck",
    {
        Text = "Wall Check",
        Default = true,
        Callback = function(a)
            wallCheck = a
        end
    }
)
Aimbot:AddDropdown(
    "HitPart",
    {
        Values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
        Default = "None",
        Multi = false,
        Callback = function(a)
            GyatPart = a
        end
    }
)
Aimbot:AddSlider("Distance", {Text = "Distance", Min = 100, Max = 2000, Default = 100, Rounding = 1})
Aimbot:AddDropdown(
    "EasingStyle",
    {
        Values = {"Linear", "Exponential", "Elastic", "Bounce"},
        Default = 1,
        Multi = false,
        Callback = function(a)
            easingStyle = a
        end
    }
)
Aimbot:AddDropdown(
    "EasingDirection",
    {
        Values = {"In", "Out", "InOut"},
        Default = 1,
        Multi = false,
        Callback = function(a)
            easingDirection = a
        end
    }
)

local wlkillaura = {}
local LocalPlayer = game:GetService("Players").LocalPlayer

local KillWuraAura = AimbotTab:AddLeftGroupbox("Kill-Aura")
KillWuraAura:AddToggle(
    "Sync",
    {
        Text = "Only Target [Kill Aura]",
        Default = false,
        Callback = function(a)
            syncka = a
        end
    }
)
KillWuraAura:AddToggle(
    "KillAura",
    {
        Text = "Kill Aura",
        Default = false,
        Callback = function(state)
            KillAura = state
            if KillAura then
                game:GetService("RunService"):BindToRenderStep(
                    "Killaura",
                    100,
                    function()
                        if syncka and camtarg and camtarg.Character then
                            -- only targ
                            local character = camtarg.Character
                            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                            local bodyEffects = character:FindFirstChild("BodyEffects")

                            if humanoidRootPart and bodyEffects then
                                local ko = bodyEffects:FindFirstChild("K.O")
                                if ko and not ko.Value then
                                    local localCharacter = game.Players.LocalPlayer.Character
                                    if localCharacter then
                                        local localHumanoidRootPart = localCharacter:FindFirstChild("HumanoidRootPart")
                                        if
                                            localHumanoidRootPart and
                                                (humanoidRootPart.Position - localHumanoidRootPart.Position).Magnitude <=
                                                    100
                                         then
                                            local head = character:FindFirstChild("Head")
                                            if head then
                                                local tool = localCharacter:FindFirstChildOfClass("Tool")
                                                if tool and tool:FindFirstChild("Handle") then
                                                    local targetPart = head
                                                    local targetVelocity = targetPart.Velocity
                                                    local predictedPosition = targetPart.Position + targetVelocity * 0.2

                                                    game:GetService("ReplicatedStorage").MainEvent:FireServer(
                                                        "ShootGun",
                                                        tool.Handle,
                                                        localHumanoidRootPart.Position - Vector3.new(0, 10, 0),
                                                        predictedPosition - Vector3.new(0, 25, 0),
                                                        targetPart,
                                                        (predictedPosition - localHumanoidRootPart.Position).unit
                                                    )
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        elseif not syncka then
                            -- // kill em all
                            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                                if player ~= game.Players.LocalPlayer and player.Character then
                                    local character = player.Character
                                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                                    local bodyEffects = character:FindFirstChild("BodyEffects")

                                    if humanoidRootPart and bodyEffects then
                                        local ko = bodyEffects:FindFirstChild("K.O")
                                        if ko and not ko.Value then
                                            local localCharacter = game.Players.LocalPlayer.Character
                                            if localCharacter then
                                                local localHumanoidRootPart =
                                                    localCharacter:FindFirstChild("HumanoidRootPart")
                                                if
                                                    localHumanoidRootPart and
                                                        (humanoidRootPart.Position - localHumanoidRootPart.Position).Magnitude <=
                                                            100
                                                 then
                                                    local head = character:FindFirstChild("Head")
                                                    if head then
                                                        local tool = localCharacter:FindFirstChildOfClass("Tool")
                                                        if tool and tool:FindFirstChild("Handle") then
                                                            local targetPart = head
                                                            local targetVelocity = targetPart.Velocity
                                                            local predictedPosition =
                                                                targetPart.Position + targetVelocity * 0.2

                                                            game:GetService("ReplicatedStorage").MainEvent:FireServer(
                                                                "ShootGun",
                                                                tool.Handle,
                                                                localHumanoidRootPart.Position - Vector3.new(0, 10, 0),
                                                                predictedPosition - Vector3.new(0, 25, 0),
                                                                targetPart,
                                                                (predictedPosition - localHumanoidRootPart.Position).unit
                                                            )
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                )
            else
                game:GetService("RunService"):UnbindFromRenderStep("Killaura")
            end
        end
    }
)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local isforcehit = false
local tstspmo = false
local function ResEvrythng()
    if isforcehit then
        character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        tstspmo = false
        task.wait(2)
        tstspmo = true
    end
end

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local function findNearestPlayer()
    local screenCenter =
        Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    local nearestPlayer = nil
    local nearestDistance = math.huge

    --
    local inputMethodIsTouchOrGamepad = UserInputService.TouchEnabled or UserInputService.GamepadEnabled

    --
    local targetPosition = screenCenter

    if not inputMethodIsTouchOrGamepad then
        --
        local mouse = localPlayer:GetMouse()
        targetPosition = Vector2.new(mouse.X, mouse.Y)
    end

    --
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local targetPart = player.Character:FindFirstChild("Head")
            if targetPart then
                local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(targetPart.Position)
                if onScreen then
                    local distance = (targetPosition - Vector2.new(screenPos.X, screenPos.Y)).magnitude
                    if distance < nearestDistance then
                        nearestDistance = distance
                        nearestPlayer = player
                    end
                end
            end
        end
    end

    return nearestPlayer
end

local function shoot(targetPart)
    local currentPosition = humanoidRootPart.Position
    local shootDirection = humanoidRootPart.CFrame.LookVector
    local shootPosition = currentPosition + shootDirection * 10
    local normal = shootDirection.unit
    local offset = normal * 0.5

    local args = {
        [1] = "Shoot",
        [2] = {
            [1] = {
                [1] = {
                    ["Instance"] = targetPart,
                    ["Normal"] = normal,
                    ["Position"] = currentPosition
                }
            },
            [2] = {
                [1] = {
                    ["thePart"] = targetPart,
                    ["theOffset"] = CFrame.new(offset)
                }
            },
            [3] = shootPosition,
            [4] = currentPosition,
            [5] = os.clock()
        }
    }
    ReplicatedStorage.MainEvent:FireServer(unpack(args))
end

local function triggerShoot()
    local nearestPlayer = camtarg
    if nearestPlayer then
        local targetPart = nearestPlayer.Character:FindFirstChild("Head")
        if targetPart then
            shoot(targetPart)
        end
    end
end

local spammts = false
local isSpamming = false

local function triggerauto()
    if isSpamming then
        return
    end
    isSpamming = true

    task.spawn(
        function()
            while spammts do
                triggerShoot()
                task.wait(0.1)
            end
            isSpamming = false
        end
    )
end

UserInputService.InputBegan:Connect(
    function(input, gameProcessedEvent)
        if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.X then
            spammts = not spammts
            if spammts and isforcehit then
                triggerauto()
            end
        end
    end
)

local peepo = {
    Button = Instance.new("TextButton"),
    ScreenGui = Instance.new("ScreenGui"),
    UiSh = Instance.new("UICorner"),
    UIStroke = Instance.new("UIStroke"),
    stk = Instance.new("UIStroke")
}

peepo.ScreenGui.Name = "Sigmaballs"
peepo.ScreenGui.Parent = game:GetService("CoreGui")
peepo.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
peepo.ScreenGui.ResetOnSpawn = true

peepo.Button.Name = "LockButton"
peepo.Button.Parent = peepo.ScreenGui
peepo.Button.Active = true
peepo.Button.Draggable = true
peepo.Button.BackgroundColor3 = Color3.fromRGB(28, 28, 48)
peepo.Button.BackgroundTransparency = 0
peepo.Button.BorderSizePixel = 0
peepo.Button.Size = UDim2.new(0, 125, 0, 50)
peepo.Button.Position = UDim2.new(0.5, -50, 0.5, -25)
peepo.Button.Font = Enum.Font.ArialBold
peepo.Button.Text = "Shoot ForceHit: <font color='rgb(255, 0, 0)'>On</font>"
peepo.Button.TextColor3 = Color3.fromRGB(255, 255, 255)
peepo.Button.TextSize = 15
peepo.Button.RichText = true
peepo.Button.TextStrokeTransparency = 0.5
peepo.Button.Visible = false

peepo.UiSh.CornerRadius = UDim.new(0, 8)
peepo.UiSh.Parent = peepo.Button

peepo.UIStroke.Parent = peepo.Button
peepo.UIStroke.Thickness = 2
peepo.UIStroke.Color = Color3.fromRGB(16, 16, 32)

peepo.stk.Parent = peepo.Button
peepo.stk.Thickness = 3
peepo.stk.Color = Color3.fromRGB(16, 16, 32)
peepo.stk.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local UserInputService = game:GetService("UserInputService")

local Dragging = false
local DragInput, DragStart, StartPos

local function OnInputBegan(Input)
    if Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = Input.Position
        StartPos = peepo.Button.Position
        Input.Changed:Connect(
            function()
                if Input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end
        )
    end
end

local function OnInputChanged(Input)
    if Dragging and Input.UserInputType == Enum.UserInputType.Touch then
        local Delta = Input.Position - DragStart
        peepo.Button.Position =
            UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end

peepo.Button.InputBegan:Connect(OnInputBegan)
peepo.Button.InputChanged:Connect(OnInputChanged)

peepo.Button.MouseButton1Click:Connect(
    function()
        spammts = not spammts
        if spammts and isforcehit then
            triggerauto()
            print("gyat")
        end
    end
)

localPlayer.CharacterAdded:Connect(ResEvrythng)

game:GetService("RunService").RenderStepped:Connect(
    function()
        if UserInputService.TouchEnabled and isforcehit then
            peepo.Button.Visible = true
        else
            peepo.Button.Visible = false
        end
    end
)

ResEvrythng()

local sounds = {
    BlackPencil = "https://github.com/Shatapmatehabibi/Hitsounds/raw/main/bananapencil.mp3.mp3",
    UWU = "https://github.com/CongoOhioDog/SoundS/blob/main/Uwu.mp3?raw=true",
    Plooh = "https://github.com/CongoOhioDog/SoundS/blob/main/plooh.mp3?raw=true",
    Hrntai = "https://github.com/CongoOhioDog/SoundS/blob/main/Hrntai.wav?raw=true",
    Henta01 = "https://github.com/CongoOhioDog/SoundS/blob/main/henta01.wav?raw=true",
    Bruh = "https://github.com/CongoOhioDog/SoundS/blob/main/psalms%20bruh%20sample.mp3?raw=true",
    BoneBreakage = "https://github.com/CongoOhioDog/SoundS/blob/main/psalms%20bone%20breakage.mp3?raw=true",
    Fein = "https://github.com/CongoOhioDog/SoundS/blob/main/psalms%20highly%20defined%20fein.mp3?raw=true",
    Unicorn = "https://github.com/CongoOhioDog/SoundS/blob/main/shiny%20unicorn%20for%20dh%20_%20psalms.mp3?raw=true",
    Kitty = "https://github.com/CongoOhioDog/SoundS/blob/main/Kitty.mp3?raw=true",
    Bird = "rbxassetid://97374545835588",
    BirthdayCake = "rbxassetid://117470756431100",
    KenCarson = "rbxassetid://119329118720534",
    Bameware = "rbxassetid://3124331820",
    Bell = "rbxassetid://6534947240",
    Bubble = "rbxassetid://6534947588",
    Pick = "rbxassetid://1347140027",
    Pop = "rbxassetid://198598793",
    Rust = "rbxassetid://1255040462",
    Sans = "rbxassetid://3188795283",
    Fart = "rbxassetid://130833677",
    Big = "rbxassetid://5332005053",
    Vine = "rbxassetid://5332680810",
    Skeet = "rbxassetid://5633695679",
    Neverlose = "rbxassetid://6534948092",
    Fatality = "rbxassetid://6534947869",
    Bonk = "rbxassetid://5766898159",
    Minecraft = "rbxassetid://4018616850"
}

-- Function to play the hit sound
local function PlayHitSound()
    if TargetAimbot and TargetAimbot.HitSounds and TargetAimbot.HitSound then
        local sound = Instance.new("Sound")
        sound.SoundId = sounds[TargetAimbot.HitSound] or "rbxassetid://" .. TargetAimbot.HitSound
        sound.Volume = 1
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        sound.Ended:Connect(
            function()
                sound:Destroy()
            end
        )
    end
end

local targetHealth = nil

local function UpdateTargetHealth()
    local nearestPlayer = camtarg
    if nearestPlayer and nearestPlayer.Character then
        local humanoid = nearestPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            if targetHealth == nil then
                targetHealth = humanoid.Health
            end

            local currentHealth = humanoid.Health
            if currentHealth < targetHealth then
                PlayHitSound()
            end
            targetHealth = currentHealth
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(UpdateTargetHealth)

localPlayer.CharacterAdded:Connect(ResEvrythng)
ResEvrythng()

KillWuraAura:AddToggle(
    "GUNTP",
    {
        Text = "Gun TP [COPIES]",
        Default = false,
        Callback = function(a)
            GunTP.Enabled = a
        end
    }
)
KillWuraAura:AddToggle(
    "Strafe",
    {
        Text = "Strafe",
        Default = false,
        Callback = function(a)
            TargetStrafeEnabled = a
        end
    }
)
KillWuraAura:AddToggle(
    "ForceHit",
    {
        Text = "ForceHit V2 [HC]",
        Default = false,
        Callback = function(a)
            isforcehit = a
        end
    }
)
KillWuraAura:AddToggle(
    "Soundshi",
    {
        Text = "HitSound",
        Default = false,
        Callback = function(a)
            TargetAimbot.HitSounds = a
        end
    }
)

local soundNames = {}
for name, _ in pairs(sounds) do
    table.insert(soundNames, name)
end

local Dropdown =
    KillWuraAura:AddDropdown(
    "HitSound",
    {
        Title = "Select HitSound",
        Values = soundNames,
        Multi = false,
        Default = "KenCarson",
        Callback = function(Value)
            TargetAimbot.HitSound = Value
        end
    }
)

local Prediction = AimbotTab:AddLeftGroupbox("Prediction")
Prediction:AddToggle("Resolver", {Text = "Resolver", Default = false})
Prediction:AddSlider(
    "AimPredictionX",
    {
        Text = "Aim Prediction X",
        Min = 0,
        Max = 1,
        Default = 0.1271,
        Rounding = 1,
        Callback = function(gg)
            predictionX = gg
        end
    }
)
Prediction:AddSlider(
    "AimPredictionY",
    {
        Text = "Aim Prediction Y",
        Min = 0,
        Max = 1,
        Default = 0.1271,
        Rounding = 1,
        Callback = function(gg)
            predictionY = gg
        end
    }
)

local AimbotFOVCRCL = Drawing.new("Circle")
AimbotFOVCRCL.Thickness = 2
AimbotFOVCRCL.NumSides = 100
AimbotFOVCRCL.Filled = false
AimbotFOVCRCL.Visible = false
AimbotFOVCRCL.Transparency = 1
AimbotFOVCRCL.Color = Color3.fromRGB(255, 0, 0)

local FOV = AimbotTab:AddLeftGroupbox("Aimbot FOV")
FOV:AddToggle(
    "Enabled",
    {
        Text = "Enabled",
        Default = false,
        Callback = function(a)
            AimbotFOVCRCL.Visible = a
        end
    }
)
FOV:AddSlider(
    "Size",
    {
        Text = "Size",
        Min = 100,
        Max = 500,
        Default = 100,
        Rounding = 1,
        Callback = function(a)
            AimbotFOVCRCL.Radius = a
        end
    }
)
FOV:AddDropdown("Style", {Values = {"Filled", "Outline", "Dashed"}, Default = 1, Multi = false})
local FOVColorSIl =
    FOV:AddLabel("Field Of View Color"):AddColorPicker(
    "HighlightColor",
    {
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(a)
            AimbotFOVCRCL.Color = a
        end
    }
)

if game:GetService("UserInputService").TouchEnabled or game:GetService("UserInputService").GamepadEnabled then
    local screenCenter =
        Vector2.new(
        game:GetService("Workspace").CurrentCamera.ViewportSize.X / 2,
        game:GetService("Workspace").CurrentCamera.ViewportSize.Y / 2
    )

    AimbotFOVCRCL.Position = screenCenter - Vector2.new(AimbotFOVCRCL.Radius, AimbotFOVCRCL.Radius)
else
    game:GetService("RunService").RenderStepped:Connect(
        function()
            local MouseLocation = game:GetService("UserInputService"):GetMouseLocation()

            AimbotFOVCRCL.Position = MouseLocation
        end
    )
end

local AChams = false
local Highlight = true
local TargetVisuals = AimbotTab:AddLeftGroupbox("Target Visuals")
TargetVisuals:AddToggle(
    "Highlight",
    {
        Text = "Highlight",
        Default = false,
        Callback = function(a)
            Highlight = a
        end
    }
)
TargetVisuals:AddToggle(
    "BreathingHighlight",
    {
        Text = "Breathing Highlight",
        Default = false,
        Callback = function(a)
            AChams = a
        end
    }
)

local HighlightColor =
    TargetVisuals:AddLabel("Highlight Color"):AddColorPicker(
    "HighlightColor",
    {
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(a)
            TargetAimbot.HighlightColor1 = a
        end
    }
)
TargetVisuals:AddSlider("HighlightTransparency", {Text = "Transparency", Min = 0, Max = 1, Default = 0.5, Rounding = 2})
TargetVisuals:AddSlider("BreathingSpeed", {Text = "Breathing Speed", Min = 1, Max = 10, Default = 5, Rounding = 1})

local SilentFOVCRCL = Drawing.new("Circle")
SilentFOVCRCL.Thickness = 2
SilentFOVCRCL.NumSides = 100
SilentFOVCRCL.Filled = false
SilentFOVCRCL.Transparency = 1
SilentFOVCRCL.Color = Color3.fromRGB(0, 255, 0)

local gyat = {
    "Head",
    "UpperTorso",
    "HumanoidRootPart",
    "LowerTorso",
    "LeftUpperArm",
    "LeftLowerArm",
    "LeftHand",
    "RightUpperArm",
    "RightLowerArm",
    "RightHand",
    "LeftUpperLeg",
    "LeftLowerLeg",
    "LeftFoot",
    "RightUpperLeg",
    "RightLowerLeg",
    "RightFoot"
}

local silent_aim = {
    target_part = "HumanoidRootPart",
    prediction = 0.1271,
    is_nigga = true,
    resolver = false,
    resolvers = "LookVector",
    locktype = "Namecall"
}

local GunTP = {
    Enabled = false,
    Anchor = false,
    Offset = {0, -1, 0}
}

local fov_settings = {
    show_fov = false,
    fill = false,
    size = 90,
    thickness = 1,
    color = Color3.fromRGB(255, 255, 255)
}

local goat_utility = {
    utility = game:GetService("RunService")
}

local main_utility = {}
local Guis = game:GetService("GuiService")

local Vec2 = function(property)
    return Vector2.new(property.X, property.Y + (Guis:GetGuiInset().Y))
end

local fov_circle = Drawing.new("Circle")
fov_circle.Color = fov_settings.color
fov_circle.Visible = fov_settings.show_fov
fov_circle.Filled = fov_settings.fill
fov_circle.Radius = fov_settings.size
fov_circle.Transparency = 0.8
fov_circle.Thickness = fov_settings.thickness

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
fov_circle.Position = Vec2(mouse)

local function find_closest_player()
    local players = game:GetService("Players")
    local closest_player
    local closest_distance = math.huge

    for _, player in ipairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild(silent_aim.target_part) then
            local part = player.Character[silent_aim.target_part]
            local screen_pos, on_screen = camera:WorldToViewportPoint(part.Position)

            if on_screen then
                local distance_to_center = (fov_circle.Position - Vector2.new(screen_pos.X, screen_pos.Y)).Magnitude

                if distance_to_center < closest_distance and distance_to_center <= fov_circle.Radius then
                    closest_player = player
                    closest_distance = distance_to_center
                end
            end
        end
    end
    return closest_player
end

local target = nil
goat_utility.utility.RenderStepped:Connect(
    function()
        if sync then
            target = camtarg
        else
            target = find_closest_player()
        end

        if game:GetService("UserInputService").TouchEnabled or game:GetService("UserInputService").GamepadEnabled then
            local screenCenter =
                Vector2.new(
                game:GetService("Workspace").CurrentCamera.ViewportSize.X / 2,
                game:GetService("Workspace").CurrentCamera.ViewportSize.Y / 2
            )

            fov_circle.Position = screenCenter - Vector2.new(fov_circle.Radius, fov_circle.Radius)
        else
            fov_circle.Position = Vec2(mouse)
        end
    end
)
local Client = game:GetService("Players").LocalPlayer
local boolattp = true
local cframe_to_offset = function(origin, target)
    local actual_origin =
        origin * CFrame.new(GunTP.Offset[1], GunTP.Offset[2], GunTP.Offset[3], 1, 0, 0, 0, 0, 1, 0, -1, 0)
    return actual_origin:ToObjectSpace(target):inverse()
end

local something_tp = function(Tool)
    local old_grip = Tool.Grip
    if target and target.Character then
        Tool.Parent = Client.Backpack
        Client.Character.RightHand.Anchored = false
        Tool.Grip = cframe_to_offset(Client.Character.RightHand.CFrame, target.Character.HumanoidRootPart.CFrame)
        Client.Character.RightHand.Anchored = true
        Tool.Parent = Client.Character
        RunService.RenderStepped:Wait()
        Tool.Parent = Client.Backpack
        Client.Character.RightHand.Anchored = false
        Tool.Grip = old_grip
        Tool.Parent = Client.Character
    end
end

local bullet_teleport = function(Character)
    Character.ChildAdded:Connect(
        function(Child)
            if GunTP.Enabled then
                if Child:IsA("Tool") then
                    local Connection
                    Connection =
                        Child.Activated:Connect(
                        function()
                            something_tp(Child)
                        end
                    )

                    Character.ChildRemoved:Connect(
                        function(RemovedChild)
                            if RemovedChild == Child then
                                Connection:Disconnect()
                            end
                        end
                    )
                end
            end
        end
    )
end

bullet_teleport(Client.Character)

Client.CharacterAdded:Connect(
    function()
        bullet_teleport(Client.Character)
    end
)

local TargHighlight = Instance.new("Highlight")
local AvatarEditorService = game:GetService("AvatarEditorService")
TargHighlight.Parent = CoreGui
TargHighlight.FillColor = TargetAimbot.HighlightColor1
TargHighlight.OutlineColor = TargetAimbot.HighlightColor2
TargHighlight.FillTransparency = 0.5
TargHighlight.OutlineTransparency = 0
TargHighlight.Enabled = false

local function updateBreatheEffect()
    if AChams then
        local breathe_effect = math.atan(math.sin(tick() * 2)) * 2 / math.pi
        TargHighlight.FillTransparency = 100 * breathe_effect * 0.01
        TargHighlight.OutlineTransparency = 100 * breathe_effect * 0.01
    end
end

RunService.RenderStepped:Connect(
    function()
        if target and target.Character and Highlight then
            local nearestPlayer = findNearestPlayer()
            TargHighlight.FillColor = TargetAimbot.HighlightColor1
            TargHighlight.OutlineColor = TargetAimbot.HighlightColor2
            TargHighlight.Adornee = target.Character and nearestPlayer.Character
            TargHighlight.Enabled = true
            updateBreatheEffect()
        else
            TargHighlight.Adornee = nil
            TargHighlight.Enabled = false
        end
    end
)

if game.PlaceId ~= 2788229376 then
    local LocalPlayer = game.Players.LocalPlayer
    local Argument = "MOUSE"
    local MainEvent = nil
    local Character

    function GetGame()
        local game_support = {
            ["UpdateMousePosI2"] = {
                2788229376,
                7213786345,
                16033173781
            },
            ["MousePos"] = {
                5602055394,
                7951883376
            },
            ["MOUSE"] = {
                125825216602676,
                15186202290,
                18111448661,
                18111451594,
                16560956150,
                18198680772,
                17564718305,
                17564716597
            },
            ["UpdateMousePos"] = {
                17897702920,
                11143225577,
                86382109024302,
                132813051297954,
                17502123056,
                14174018683,
                18177028900,
                18459606288,
                99661247544704,
                17721393836,
                17809101348,
                16859411452,
                18129399112,
                17079102898,
                17061444544,
                17344804827,
                15644861772,
                18710690149,
                85886765515312
            },
            ["MoonUpdateMousePos"] = {
                15166543806
            }
        }
        return game_support
    end

    task.spawn(
        function()
            local game_support = GetGame()
            for Index, Value in pairs(game_support) do
                if table.find(Value, game.PlaceId) then
                    Argument = Index
                    break
                end
            end

            for _, Value in pairs(game.ReplicatedStorage:GetChildren()) do
                if
                    Value.Name == "MainEvent" or Value.Name == "Bullets" or Value.Name == ".gg/untitledhood" or
                        Value.Name == "Remote" or
                        Value.Name == "MAINEVENT"
                 then
                    MainEvent = Value
                    break
                end
            end
        end
    )

    local function CharAdded()
        if Character then
            Character.ChildAdded:Connect(
                function(tool)
                    if tool:IsA("Tool") then
                        tool.Activated:Connect(
                            function()
                                if MainEvent and Argument then
                                    if silent_aim.is_nigga and target ~= nil and target.Character then
                                        local AimPosition =
                                            target.Character[silent_aim.target_part].Position +
                                            (target.Character[silent_aim.target_part].Velocity * silent_aim.prediction)
                                        MainEvent:FireServer(Argument, AimPosition)
                                    end
                                end
                            end
                        )
                    end
                end
            )
        end
    end

    LocalPlayer.CharacterAdded:Connect(
        function(newchar)
            Character = newchar
            CharAdded()
        end
    )

    if LocalPlayer.Character then
        Character = LocalPlayer.Character
        CharAdded()
    end

    --[[
    
    local Old
    Old =
        hookmetamethod(
        game,
        "__index",
        function(self, key)
            if self:IsA("Mouse") and key == "Hit" then
                Targetting = find_closest_player()
                if Targetting ~= nil then
                    return Targetting.Character[silent_aim.target_part].CFrame +
                        (Targetting.Character[silent_aim.target_part].Velocity *
                        silent_aim.prediction)
                end
            end
            return Old(self, key)
        end
    )
    
            ]]
    getgenv().TriggerBotConfig = {
        ["Start"] = {
            ["TriggerBot"] = {
                ["Notification"] = true,
                ["Delay"] = 0.0001,
                ["Blacklisted"] = {"[Knife]"},
                ["Keybind"] = "T"
            }
        }
    }

    local function GetArgument()
        if string.find(identifyexecutor(), "Solara") then
            local placeId = game.PlaceId
            if placeId == 2788229376 or placeId == 7213786345 or placeId == 16033173781 then
                return "UpdateMousePosI2"
            elseif placeId == 9825515356 then
                return "MousePosUpdate"
            else
                return "UpdateMousePos"
            end
        end
    end

    local Script = {
        Config = getgenv().TriggerBotConfig,
        Target = nil,
        MainEvent = nil,
        Argument = GetArgument(),
        Functions = {},
        Connections = {}
    }

    local Players = game:GetService("Players")
    local Camera = workspace.CurrentCamera
    local UserInputService = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local StarterGui = game:GetService("StarterGui")
    local VirtualInputManager = game:GetService("VirtualInputManager")

    local LocalPlayer =
        Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()

    local settings = Script.Config.Start
    local isTriggerActive = false

    Script.Functions.isToolBlacklisted = function(tool)
        for _, toolName in ipairs(Script.Config.Start.TriggerBot.Blacklisted) do
            if tool.Name == toolName then
                return true
            end
        end
        return false
    end

    Script.Functions.sendNotification = function(message)
        StarterGui:SetCore(
            "SendNotification",
            {
                Title = "TriggerBot",
                Text = message,
                Duration = 2
            }
        )
    end

    Script.Functions.isDead = function(player)
        local character = player.Character
        if not character or not character:FindFirstChild("BodyEffects") then
            return false
        end
        local bodyEffects = character.BodyEffects
        local ko = bodyEffects:FindFirstChild("K.O") or bodyEffects:FindFirstChild("KO")
        return ko and ko.Value or false
    end

    Script.Functions.getTarget = function(instance)
        if not instance then
            return false
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character and (instance == player.Character or instance:IsDescendantOf(player.Character)) then
                if not Script.Functions.isDead(player) then
                    return player
                end
            end
        end

        return false
    end

    Script.Functions.onKeyPress = function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if
            input.UserInputType == Enum.UserInputType.Keyboard and
                input.KeyCode == Enum.KeyCode[Script.Config.Start.TriggerBot.Keybind]
         then
            isTriggerActive = not isTriggerActive
            if Script.Config.Start.TriggerBot.Notification then
                Script.Functions.sendNotification("TriggerBot " .. (isTriggerActive and "Enabled" or "Disabled"))
            end
        end
    end

    UserInputService.InputBegan:Connect(Script.Functions.onKeyPress)

    Script.Functions.triggerBot = function()
        local connection
        connection =
            RunService.Heartbeat:Connect(
            function()
                if isTriggerActive then
                    local target = Mouse.Target

                    if target and Script.Functions.getTarget(target) then
                        if LocalPlayer.Character then
                            local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                            if tool and not Script.Functions.isToolBlacklisted(tool) then
                                task.wait(Script.Config.Start.TriggerBot.Delay)
                                tool:Activate()
                            end
                        end
                    end
                end
            end
        )

        Script.Connections.triggerBot = connection
    end

    Script.Functions.triggerBot()

    getgenv().disableTriggerBot = function()
        if Script.Connections.triggerBot then
            Script.Connections.triggerBot:Disconnect()
            Script.Connections.triggerBot = nil
            warn("TriggerBot disabled")
        end
    end
end

local SilentAim = AimbotTab:AddRightGroupbox("Silent Aim")
SilentAim:AddToggle(
    "Enabled",
    {
        Text = "Enabled",
        Default = true,
        Callback = function(a)
            silent_aim.is_nigga = a
        end
    }
)
SilentAim:AddToggle("WallCheck", {Text = "Wall Check", Default = false})
SilentAim:AddDropdown(
    "HitPart",
    {
        Values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
        Default = 1,
        Multi = false,
        Callback = function(a)
            silent_aim.target_part = a
        end
    }
)
SilentAim:AddSlider("Distance", {Text = "Distance", Min = 100, Max = 5000, Default = 100, Rounding = 1})
SilentAim:AddDropdown(
    "EasingStyle",
    {Values = {"Linear", "Exponential", "Elastic", "Bounce"}, Default = 1, Multi = false}
)
SilentAim:AddDropdown("EasingDirection", {Values = {"In", "Out", "InOut"}, Default = 1, Multi = false})

local SilentFOV = AimbotTab:AddRightGroupbox("Silent FOV")
SilentFOV:AddToggle(
    "Enabled",
    {
        Text = "Enabled",
        Default = true,
        Callback = function(a)
            SilentFOVCRCL.Visible = a
        end
    }
)
SilentFOV:AddSlider(
    "Size",
    {
        Text = "Size",
        Min = 100,
        Max = 500,
        Default = 100,
        Rounding = 1,
        Callback = function(a)
            SilentFOVCRCL.Radius = a
        end
    }
)
SilentFOV:AddDropdown("Style", {Values = {"Filled", "Outline", "Dashed"}, Default = 1, Multi = false})
local FOVColorSIl =
    SilentFOV:AddLabel("Field Of View Color"):AddColorPicker(
    "HighlightColor",
    {
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(a)
            SilentFOVCRCL.Color = a
        end
    }
)

if game:GetService("UserInputService").TouchEnabled or game:GetService("UserInputService").GamepadEnabled then
    local screenCenter =
        Vector2.new(
        game:GetService("Workspace").CurrentCamera.ViewportSize.X / 2,
        game:GetService("Workspace").CurrentCamera.ViewportSize.Y / 2
    )

    SilentFOVCRCL.Position = screenCenter - Vector2.new(SilentFOVCRCL, SilentFOVCRCL.Radius)
else
    game:GetService("RunService").RenderStepped:Connect(
        function()
            local MouseLocation = game:GetService("UserInputService"):GetMouseLocation()

            SilentFOVCRCL.Position = MouseLocation
        end
    )
end

local Smoothness = AimbotTab:AddRightGroupbox("Smoothness")
Smoothness:AddToggle("Enabled", {Text = "Enabled", Default = false})
local smoothnessss = 0.1
Smoothness:AddSlider(
    "SmoothnessX",
    {
        Text = "Smoothness X",
        Min = 0,
        Max = 1,
        Default = 0.1,
        Rounding = 1,
        Callback = function(gg)
            smoothnessss = gg
        end
    }
)
Smoothness:AddSlider("SmoothnessY", {Text = "Smoothness Y", Min = 0, Max = 1, Default = 0.001, Rounding = 1})
Smoothness:AddInput(
    "GyatPred",
    {
        Text = "Pred",
        Default = "0.1271",
        Callback = function(a)
            silent_aim.prediction = a
        end
    }
)

--> Services <--
local Players = game:GetService("Players")

--> LocalPlayer Variables <--
local player = Players.LocalPlayer
local playerCharacter = player.Character
local playerHumanoidRootPart =
    playerCharacter:FindFirstChild("HumanoidRootPart") or playerCharacter:WaitForChild("HumanoidRootPart")

--> Desync Config <--
getgenv().DesyncConfig = {
    Toggled = false,
    Speed = 0.1,
    Mode = "Walkable",
    AssemblyLinearVelocity = {
        X = 5000,
        Y = 5000,
        Z = 5000
    }
}

--> Function To Handle When LocalPlayer Respawns <--
player.CharacterAdded:Connect(
    function(NewCharacter)
        playerCharacter = NewCharacter
        playerHumanoidRootPart =
            playerCharacter:FindFirstChild("HumanoidRootPart") or playerCharacter:WaitForChild("HumanoidRootPart")
    end
)

--> Desync Function <--
RunService.Heartbeat:Connect(
    function()
        if DesyncConfig.Toggled then
            if DesyncConfig.Mode == "Default" then
                local playerHumanoidRootPartAssemblyLinearVelocity = playerHumanoidRootPart.AssemblyLinearVelocity

                playerHumanoidRootPart.CFrame =
                    playerHumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(DesyncConfig.Speed), 0)
                playerHumanoidRootPart.AssemblyLinearVelocity =
                    Vector3.new(
                    DesyncConfig.AssemblyLinearVelocity.X,
                    DesyncConfig.AssemblyLinearVelocity.Y,
                    DesyncConfig.AssemblyLinearVelocity.Z
                )
                RunService.RenderStepped:Wait()
                playerHumanoidRootPart.AssemblyLinearVelocity = playerHumanoidRootPartAssemblyLinearVelocity
            elseif DesyncConfig.Mode == "Random" then
                local playerHumanoidRootPartAssemblyLinearVelocity = playerHumanoidRootPart.AssemblyLinearVelocity

                playerHumanoidRootPart.CFrame =
                    playerHumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(DesyncConfig.Speed), 0)
                playerHumanoidRootPart.Velocity =
                    Vector3.new(
                    math.random(-DesyncConfig.AssemblyLinearVelocity.X, DesyncConfig.AssemblyLinearVelocity.X),
                    math.random(-DesyncConfig.AssemblyLinearVelocity.Y, DesyncConfig.AssemblyLinearVelocity.Y),
                    math.random(-DesyncConfig.AssemblyLinearVelocity.Z, DesyncConfig.AssemblyLinearVelocity.Z)
                )
                RunService.RenderStepped:Wait()
                playerHumanoidRootPart.AssemblyLinearVelocity = playerHumanoidRootPartAssemblyLinearVelocity
            elseif DesyncConfig.Mode == "Walkable" then
                local playerHumanoidRootPartAssemblyLinearVelocity = playerHumanoidRootPart.AssemblyLinearVelocity
                playerHumanoidRootPart.CFrame = playerHumanoidRootPart.CFrame * CFrame.Angles(0, 0, 0)
                playerHumanoidRootPart.Velocity =
                    Vector3.new(
                    math.random(-DesyncConfig.AssemblyLinearVelocity.X, DesyncConfig.AssemblyLinearVelocity.X),
                    math.random(-DesyncConfig.AssemblyLinearVelocity.Y, DesyncConfig.AssemblyLinearVelocity.Y),
                    math.random(-DesyncConfig.AssemblyLinearVelocity.Z, DesyncConfig.AssemblyLinearVelocity.Z)
                )
                playerHumanoidRootPart.CFrame =
                    playerHumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(DesyncConfig.Speed), 0)
                RunService.RenderStepped:Wait()
                playerHumanoidRootPart.AssemblyLinearVelocity = playerHumanoidRootPartAssemblyLinearVelocity
            end
        end
    end
)

local Miscellaneous = AimbotTab:AddRightGroupbox("Miscellaneous")
Miscellaneous:AddToggle(
    "Auto Reset",
    {
        Text = "Auto Reset",
        Default = false,
        Callback = function(a)
            AutoResett = a
        end
    }
)
Miscellaneous:AddToggle(
    "Auto Reset",
    {
        Text = "Desync",
        Default = false,
        Callback = function(a)
            DesyncConfig.Toggled = a
        end
    }
)
Miscellaneous:AddDropdown(
    "Type",
    {
        Values = {"Walkable", "Random", "Default"},
        Default = 1,
        Multi = false,
        Callback = function(ds)
            DesyncConfig.Mode = ds
        end
    }
)
Miscellaneous:AddDropdown("TeleportationMethod", {Values = {"Instant", "Smooth"}, Default = 1, Multi = false})
Miscellaneous:AddDropdown("Type", {Values = {"Camera", "Mouse"}, Default = 1, Multi = false})

local Tabs = {
    ["UI Settings"] = Window:AddTab("UI Settings")
}
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddButton(
    "Unload",
    function()
        Library:Unload()
    end
)
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "End", NoUI = true, Text = "Menu keybind"})

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"MenuKeybind"})

ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()

local Fly = false
local FlySpeed = 20
local ToggleKey = "F"
local Keys = {W = false, A = false, S = false, D = false}
local UserInput = game:GetService("UserInputService")

local KeyCode = Enum.KeyCode[ToggleKey]
local A = Enum.KeyCode.A
local B = Enum.KeyCode.B
local C = Enum.KeyCode.C
local D = Enum.KeyCode.D
local E = Enum.KeyCode.E
local F = Enum.KeyCode.F
local G = Enum.KeyCode.G
local H = Enum.KeyCode.H
local I = Enum.KeyCode.I
local J = Enum.KeyCode.J
local K = Enum.KeyCode.K
local L = Enum.KeyCode.L
local M = Enum.KeyCode.M
local N = Enum.KeyCode.N
local O = Enum.KeyCode.O
local P = Enum.KeyCode.P
local Q = Enum.KeyCode.Q
local R = Enum.KeyCode.R
local S = Enum.KeyCode.S
local T = Enum.KeyCode.T
local U = Enum.KeyCode.U
local V = Enum.KeyCode.V
local W = Enum.KeyCode.W
local X = Enum.KeyCode.X
local Y = Enum.KeyCode.Y
local Z = Enum.KeyCode.Z

local function ToggleFly()
    Fly = not Fly
    if Fly then
        Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
    end
end

local function LoopTs()
    if FlyConnection then
        FlyConnection:Disconnect()
    end
    if StopConnection then
        StopConnection:Disconnect()
    end
    if MovementConnection then
        MovementConnection:Disconnect()
    end

    FlyConnection =
        UserInput.InputBegan:Connect(
        function(Input, GameProcessed)
            if GameProcessed then
                return
            end
            if Input.KeyCode == KeyCode then
                ToggleFly()
            end
            if Input.KeyCode == Enum.KeyCode.W then
                Keys.W = true
            end
            if Input.KeyCode == Enum.KeyCode.A then
                Keys.A = true
            end
            if Input.KeyCode == Enum.KeyCode.S then
                Keys.S = true
            end
            if Input.KeyCode == Enum.KeyCode.D then
                Keys.D = true
            end
        end
    )

    StopConnection =
        UserInput.InputEnded:Connect(
        function(Input)
            if Input.KeyCode == Enum.KeyCode.W then
                Keys.W = false
            end
            if Input.KeyCode == Enum.KeyCode.A then
                Keys.A = false
            end
            if Input.KeyCode == Enum.KeyCode.S then
                Keys.S = false
            end
            if Input.KeyCode == Enum.KeyCode.D then
                Keys.D = false
            end
        end
    )

    MovementConnection =
        RunService.RenderStepped:Connect(
        function()
            if not Fly or not Root then
                return
            end

            local MoveDirection = Vector3.zero
            local CameraCF = workspace.CurrentCamera.CFrame

            if Keys.W then
                MoveDirection = MoveDirection + CameraCF.LookVector
            end
            if Keys.S then
                MoveDirection = MoveDirection - CameraCF.LookVector
            end
            if Keys.A then
                MoveDirection = MoveDirection - CameraCF.RightVector
            end
            if Keys.D then
                MoveDirection = MoveDirection + CameraCF.RightVector
            end

            if MoveDirection.Magnitude > 0 then
                MoveDirection = MoveDirection.Unit * FlySpeed
            end

            Root.Velocity = MoveDirection * 10
            Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end
    )
end

local function OnCharacterAdded(Character)
    Root = Character:WaitForChild("HumanoidRootPart")
    Humanoid = Character:WaitForChild("Humanoid")
    Fly = false
    LoopTs()
end

Player.CharacterAdded:Connect(OnCharacterAdded)

if Player.Character then
    OnCharacterAdded(Player.Character)
end

local function findClosestTarget()
    local userInputService = game:GetService("UserInputService")
    local inputType = userInputService:GetLastInputType()
    local mousePos = Vector2.new(0, 0)

    if inputType == Enum.UserInputType.Touch then
        mousePos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    else
        mousePos = userInputService:GetMouseLocation()
    end

    local closestPlayer, shortestDistance = nil, math.huge

    for _, player in pairs(players:GetPlayers()) do
        if
            player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                player.Character:FindFirstChildOfClass("Humanoid").Health > 0
         then
            local pos, onScreen = camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                if distance < fovRadius and distance < shortestDistance then
                    closestPlayer, shortestDistance = player, distance
                end
            end
        end
    end

    return closestPlayer
end

-- Create UI
local CreateTs = {
    Button = Instance.new("TextButton"),
    ScreenGui = Instance.new("ScreenGui"),
    UiSh = Instance.new("UICorner"),
    UIStroke = Instance.new("UIStroke"),
    stk = Instance.new("UIStroke")
}

CreateTs.ScreenGui.Name = "Sigmaballs"
CreateTs.ScreenGui.Parent = CoreGui
CreateTs.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CreateTs.ScreenGui.ResetOnSpawn = false

CreateTs.Button.Name = "LockButton"
CreateTs.Button.Parent = CreateTs.ScreenGui
CreateTs.Button.Active = true
CreateTs.Button.Draggable = true
CreateTs.Button.BackgroundColor3 = Color3.fromRGB(28, 28, 48)
CreateTs.Button.BackgroundTransparency = 0
CreateTs.Button.BorderSizePixel = 0
CreateTs.Button.Size = UDim2.new(0, 150, 0, 50)
CreateTs.Button.Position = UDim2.new(0.5, -75, 0.5, -25)
CreateTs.Button.Font = Enum.Font.ArialBold
CreateTs.Button.Text = "Lock: <font color='rgb(255, 0, 0)'>OFF</font>"
CreateTs.Button.TextColor3 = Color3.fromRGB(255, 255, 255)
CreateTs.Button.TextSize = 25
CreateTs.Button.RichText = true
CreateTs.Button.TextStrokeTransparency = 0.5

CreateTs.UiSh.CornerRadius = UDim.new(0, 8)
CreateTs.UiSh.Parent = CreateTs.Button

CreateTs.UIStroke.Parent = CreateTs.Button
CreateTs.UIStroke.Thickness = 2
CreateTs.UIStroke.Color = Color3.fromRGB(16, 16, 32)

CreateTs.stk.Parent = CreateTs.Button
CreateTs.stk.Thickness = 3
CreateTs.stk.Color = Color3.fromRGB(16, 16, 32)
CreateTs.stk.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

function ToggleLck()
    local closest = findClosestTarget()

    if TargBindEnabled and camtarg then
        if camtarg and camtarg.Character and camtarg.Character:FindFirstChild("HumanoidRootPart") then
            camtarg.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
        end
        TargBindEnabled = false
        camtarg = nil
        workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid

        CreateTs.Button.Text = "Lock: " .. "<font color='rgb(255, 0, 0)'>OFF</font>"
        Library:Notify("Untargeted", 2)
    else
        if closest then
            TargBindEnabled = true
            camtarg = closest

            CreateTs.Button.Text = "Lock: " .. "<font color='rgb(0, 255, 0)'>ON</font>"

            Library:Notify("Target Locked: " .. tostring(camtarg.DisplayName) .. "", 2)
        else
            Library:Notify("No target found", 2)
        end
    end
end

localPlayer.CharacterAdded:Connect(
    function(character)
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    end
)

RunService.RenderStepped:Connect(
    function(delta)
        if TargetStrafeEnabled and camtarg and camtarg.Character and humanoidRootPart then
            local targetHRP = camtarg.Character:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                angle = angle + speed * delta
                local offset = Vector3.new(math.cos(angle) * distance, height, math.sin(angle) * distance)
                local targetPosition = targetHRP.Position
                humanoidRootPart.CFrame = CFrame.new(targetPosition + offset, targetPosition)
            end
        end
    end
)

UserInputService.InputBegan:Connect(
    function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.C then
            ToggleLck()
        end
    end
)

if Teleport2Ppl then
    LocalPlayer.Chatted:Connect(
        function(Msg)
            if Msg:sub(1, 4) == "$tp " then
                local Query = Msg:sub(5)
                local TargetPlayer = FindPlayer(Query)

                if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local TargetPosition = TargetPlayer.Character.HumanoidRootPart.Position
                    local Character = LocalPlayer.Character

                    if Character and Character:FindFirstChild("HumanoidRootPart") then
                        Character.HumanoidRootPart.CFrame = CFrame.new(TargetPosition + Vector3.new(0, 3, 0))
                    end
                end
            end
        end
    )
end

if game:GetService("UserInputService").TouchEnabled then
    CreateTs.Button.Visible = true
else
    CreateTs.Button.Visible = false
end

CreateTs.Button.MouseButton1Click:Connect(
    function()
        ToggleLck()
    end
)

getgenv().renderConnection =
    game:GetService("RunService").RenderStepped:Connect(
    function()
        if CamLock and TargBindEnabled and camtarg and camtarg.Character then
            local head = camtarg.Character:FindFirstChild("Head")
            if head then
                local targetPos = head.Position
                local currentCFrame = camera.CFrame
                local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)

                -- // smoothnessss ?? \\ --
                camera.CFrame = currentCFrame:Lerp(targetCFrame, smoothnessss)
            end
        end
    end
)
