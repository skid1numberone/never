local Dropdown = {}

function Dropdown.new(parent, settings)
    settings = settings or {}
    local options = settings.Options or {}
    local selected = settings.Default or options[1] or "None"
    local open = false

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, -10, 0, 32)
    Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Holder.ClipsDescendants = true
    Holder.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Holder

    local MainButton = Instance.new("TextButton")
    MainButton.Text = selected
    MainButton.Size = UDim2.new(1, 0, 0, 32)
    MainButton.BackgroundTransparency = 1
    MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainButton.Font = Enum.Font.Gotham
    MainButton.TextSize = 14
    MainButton.Parent = Holder

    local List = Instance.new("Frame")
    List.Size = UDim2.new(1, 0, 0, #options * 28)
    List.Position = UDim2.new(0, 0, 0, 32)
    List.BackgroundTransparency = 1
    List.Parent = Holder

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Parent = List

    for _, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Text = option
