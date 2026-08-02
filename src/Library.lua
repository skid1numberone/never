local Library = {}

Library.Windows = {}

function Library:CreateWindow(settings)
    settings = settings or {}
    local windowTitle = settings.Title or "Window"
    print("Creating window: " .. windowTitle)
    return windowTitle
end

return Library
