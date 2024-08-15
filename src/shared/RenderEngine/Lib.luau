local library = {}

function library.Lerp(a, b, c, t)
    return a + (b - c) * t
end

function library.evalColorSequence(sequence: ColorSequence, time: number)
    if time == 0 then
        return sequence.Keypoints[1].Value
    elseif time == 1 then
        return sequence.Keypoints[#sequence.Keypoints].Value
    end

    for i = 1, #sequence.Keypoints - 1 do
        local thisKeypoint = sequence.Keypoints[i]
        local nextKeypoint = sequence.Keypoints[i + 1]
        if time >= thisKeypoint.Time and time < nextKeypoint.Time then
            
            local alpha = (time - thisKeypoint.Time) / (nextKeypoint.Time - thisKeypoint.Time)
            
            return Color3.new(
                (nextKeypoint.Value.R - thisKeypoint.Value.R) * alpha + thisKeypoint.Value.R,
                (nextKeypoint.Value.G - thisKeypoint.Value.G) * alpha + thisKeypoint.Value.G,
                (nextKeypoint.Value.B - thisKeypoint.Value.B) * alpha + thisKeypoint.Value.B
            )
        end
    end
end

function library.convertToRatio(inputVector: Vector2, maxClampValue: number)
    local ClampedSize = Vector2.zero
    
    if inputVector.X > maxClampValue then
        ClampedSize = Vector2.new(maxClampValue, (inputVector.Y/inputVector.X)*maxClampValue)
    end

    return ClampedSize
end

return library