local Types = require(script._T)
local Library = require(script.Lib)

local Renderer: Types.RendererImpl = {}:: Types.RendererImpl
Renderer.__index = Renderer

function Renderer.Init(Resolution: Vector2, EditableImage: EditableImage)
	local self = {}

    local FullResolution = Library.convertToRatio(Resolution, 120)

    EditableImage.Size = FullResolution

    self.EditableImage = EditableImage
	self.Resolution = FullResolution

	return setmetatable(self, Renderer)
end

function Renderer:Draw()

end

function Renderer:DrawSingleColor( Color: Color3 )
    local Image = {}
    
    for Y = 1, self.Resolution.Y do
        for X = 1, self.Resolution.X do
            table.insert(Image, Color.R)
            table.insert(Image, Color.B)
            table.insert(Image, Color.G)
            table.insert(Image, 1)
        end
    end

    self.EditableImage:WritePixels(Vector2.zero, self.Resolution, Image)
end

function Renderer:DrawScreen( Color: Color3 )
    
end

function Renderer:DrawScreenFromGradiant( Gradiant: ColorSequence )
    local Image = {}
    local Color;

    for Y = 1, self.Resolution.Y do
        Color = Library.evalColorSequence(Gradiant, Y/self.Resolution.X)
        for X = 1, self.Resolution.X do
            
            table.insert(Image, Color.R)
            table.insert(Image, Color.B)
            table.insert(Image, Color.G)
            table.insert(Image, 1)
        end
    end

    self.EditableImage:WritePixels(Vector2.zero, self.Resolution, Image)
end

return Renderer
