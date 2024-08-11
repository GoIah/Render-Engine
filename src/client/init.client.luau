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
local ScreenResolution = Screen.AbsoluteSize
RenderEngine:Init(ScreenResolution, EditableImage)


