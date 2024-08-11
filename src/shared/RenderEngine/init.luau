local Renderer = {}
Renderer.__index = Renderer

function Renderer:Init(Resolution: Vector2, EditableImage: EditableImage)
	local self = {}

    self.EditableImage = EditableImage
	self.Resolution = Resolution

	return setmetatable(self, Renderer)
end

return Renderer
