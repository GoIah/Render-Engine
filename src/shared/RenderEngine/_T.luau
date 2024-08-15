export type RendererImpl = {
	__index: RendererImpl,
	Init: (Resolution: Vector2, EditableImage: EditableImage) -> renderer,

	EditableImage: EditableImage,
	Resolution: Vector2,

	RenderSphere: (self:RendererImpl) -> (),
    
	Draw: (self:RendererImpl) -> (),
	DrawScreen: (self:RendererImpl, Color: Color3) -> (),
    DrawSingleColor: (self:RendererImpl, Color: Color3) -> (),
	DrawScreenFromGradiant: (self:RendererImpl, Gradiant: ColorSequence, angle: number) -> (),
}

export type renderer = typeof(setmetatable({} :: {}, {} :: RendererImpl))

return {}
