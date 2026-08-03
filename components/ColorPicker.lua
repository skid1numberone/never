local ColorPicker = {}

function ColorPicker.new(parent, settings)
    settings = settings or {}
    local color = settings.Default or Color3.fromRGB(130, 60, 220)
    local open = false

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, -10, 0, 32)
    Holder.BackgroundTransparency = 1
    Holder.ClipsDescendants = true
    Holder.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = settings.Text or "Color"
    Label.Size = UDim2.new(1, -50, 0, 32)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Holder

    local Preview = Instance.new("TextButton")
    Preview.Text = ""
    Preview.Size = UDim2.new(0, 30, 0, 20)
    Preview.Position = UDim2.new(1, -30, 0, 6)
    Preview.BackgroundColor3 = color
    Preview.Parent = Holder

    local PreviewCorner = Instance.new("UICorner")
    PreviewCorner.CornerRadius = UDim.new(0, 6)
    PreviewCorner.Parent = Preview

    local Picker = Instance.new("Frame")
    Picker.Size = UDim2.new(1, 0, 0, 100)
    Picker.Position = UDim2.new(0, 0, 0, 36)
    Picker.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Picker.Visible = false
    Picker.Parent = Holder

    local RSlider = Instance.new("TextBox")
    RSlider.PlaceholderText = "R"
    RSlider.Size = UDim2.new(1, -10, 0, 24)
    RSlider.Position = UDim2.new(0, 5, 0, 5)
    RSlider.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    RSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
    RSlider.Font = Enum.Font.Gotham
    RSlider.TextSize = 12
    RSlider.Parent = Picker

    local GSlider = Instance.new("TextBox")
    GSlider.PlaceholderText = "G"
    GSlider.Size = UDim2.new(1, -10, 0, 24)
    GSlider.Position = UDim2.new(0, 5, 0, 35)
    GSlider.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    GSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
    GSlider.Font = Enum.Font.Gotham
    GSlider.TextSize = 12
    GSlider.Parent = Picker

    local BSlider = Instance.new("TextBox")
    BSlider.PlaceholderText = "B"
    BSlider.Size = UDim2.new(1, -10, 0, 24)
    BSlider.Position = UDim2.new(0, 5, 0, 65)
    BSlider.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    BSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
    BSlider.Font = Enum.Font.Gotham
    BSlider.TextSize = 12
    BSlider.Parent = Picker

    local function updateColor()
        local r = tonumber(RSlider.Text) or 0
        local g = tonumber(GSlider.Text) or 0
        local b = tonumber(BSlider.Text) or 0
        color = Color3.fromRGB(r, g, b)
        Preview.BackgroundColor3 = color
        if settings.Callback then
            settings.Callback(color)
        end
    end

    RSlider.FocusLost:Connect(updateColor)
    GSlider.FocusLost:Connect(updateColor)
    BSlider.FocusLost:Connect(updateColor)

    Preview.MouseButton1Click:Connect(function()
        open = not open
        Picker.Visible = open
        Holder.Size = open and UDim2.new(1, -10, 0, 136) or UDim2.new(1, -10, 0, 32)
    end)

    return Holder
end

return ColorPicker
