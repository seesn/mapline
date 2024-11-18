local mapFrame = WorldMapFrame or CreateFrame("Frame", "CharacterDirectionMapFrame", UIParent)

local function DrawLineOnMap()
    local facing = GetPlayerFacing()
    if not facing then return end

    -- Calculate the end coordinates of the line (based on facing direction)
    local length = 100  
    local startX, startY = 0.5, 0.5
    local endX = startX + length * math.cos(facing)
    local endY = startY + length * math.sin(facing)

    if not mapFrame.line then
        mapFrame.line = mapFrame:CreateTexture(nil, "OVERLAY")
        mapFrame.line:SetColorTexture(1, 0, 0, 1)  -- Red
        mapFrame.line:SetSize(2, length)  
    end

    -- Position the line and rotate it according to facing direction
    mapFrame.line:SetPoint("CENTER", mapFrame, "CENTER", 0, 0)
    mapFrame.line:SetRotation(facing)
end

local frame = CreateFrame("Frame")
frame:SetScript("OnUpdate", DrawLineOnMap)
