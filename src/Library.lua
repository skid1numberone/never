local Window = require(script.Parent.Window)

local Library = {}
Library.Windows = {}

function Library:CreateWindow(settings)
    local window = Window.new(settings)
    table.insert(Library.Windows, window)
    return window
end

return Library
