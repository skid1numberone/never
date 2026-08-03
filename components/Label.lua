local Label = {}

function Label.new(parent, settings)
    settings = settings or {}

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Text = settings.Text or "Label"
    TextLabel.Size = UDim2.new(1, -10, 0, 20)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.TextSize = 14
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = parent

    return TextLabel
end

return Label
