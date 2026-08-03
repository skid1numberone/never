local Lucide = require(script.Parent.Lucide)

local Icons = {}

function Icons:Get(name, size)
    local ok, asset = pcall(function()
        return Lucide.GetAsset(name, size or 48)
    end)

    if ok and asset then
        return asset.Url, asset.ImageRectOffset, asset.ImageRectSize
    end

    return nil
end

return Icons
