-- Trade Control UI | Roblox Studio
-- Put this LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local me = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "TradeControl"
gui.ResetOnSpawn = false
gui.Parent = me:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(330, 350)
frame.Position = UDim2.new(0.5, -165, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local function makeButton(text, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 40)
    b.Position = UDim2.fromOffset(10, y)
    b.BackgroundColor3 = Color3.fromRGB(45, 49, 65)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    b.Text = text
    b.Parent = frame
    Instance.new("UICorner", b)
    return b
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "TRADE CONTROL"
title.TextColor3 = Color3.fromRGB(70, 190, 255)
title.TextScaled = true
title.Parent = frame

local target = Instance.new("TextBox")
target.Size = UDim2.new(1, -20, 0, 40)
target.Position = UDim2.fromOffset(10, 45)
target.PlaceholderText = "Target username"
target.Text = ""
target.TextScaled = true
target.Parent = frame

local autoReady = false
local autoAccept = false
local frozen = false

local readyBtn = makeButton("Auto Ready: OFF", 95)
local acceptBtn = makeButton("Auto Accept: OFF", 145)
local freezeBtn = makeButton("Freeze Trade: OFF", 195)
local status = makeButton("Status: Idle", 245)

readyBtn.MouseButton1Click:Connect(function()
    autoReady = not autoReady
    readyBtn.Text = "Auto Ready: " .. (autoReady and "ON" or "OFF")
end)

acceptBtn.MouseButton1Click:Connect(function()
    autoAccept = not autoAccept
    acceptBtn.Text = "Auto Accept: " .. (autoAccept and "ON" or "OFF")
end)

freezeBtn.MouseButton1Click:Connect(function()
    frozen = not frozen
    freezeBtn.Text = "Freeze Trade: " .. (frozen and "ON" or "OFF")
end)

status.MouseButton1Click:Connect(function()
    local found

    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower() == target.Text:lower() then
            found = p
            break
        end
    end

    status.Text = found
        and ("Selected: " .. found.Name)
        or "Player not found"
end)
