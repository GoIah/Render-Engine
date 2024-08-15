local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Shared = ReplicatedStorage.Shared

local RenderEngine = require(Shared.RenderEngine);

local Renderer = StarterGui:WaitForChild("Renderer") :: ScreenGui
Renderer.Parent = LocalPlayer.PlayerGui

local Screen = Renderer:WaitForChild("screen") :: ImageLabel
local EditableImage = Instance.new("EditableImage", Screen)
task.wait(1)
local ScreenResolution = Renderer.AbsoluteSize

local Renderer = RenderEngine.Init(ScreenResolution, EditableImage)

Renderer:DrawSingleColor(Color3.fromRGB(207, 109, 109))
task.wait(1)

while task.wait(0.2) do
    Renderer:DrawScreenFromGradiant(ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(91, 187, 232)),
        ColorSequenceKeypoint.new(0.85, Color3.fromRGB(91, 232, 164)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 116, 40))
    }))
end