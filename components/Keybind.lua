local Keybind = {}

function Keybind.new(parent, settings)
    settings = settings or {}
    local currentKey = settings.Default or Enum.KeyCode.F
    local listening = false

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, -10, 0, 32)
    Holder.BackgroundTransparency = 1
    Holder.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = settings.Text or "Keybind"
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Holder

    local KeyButton = Instance.new("TextButton")
    KeyButton.Text = currentKey.Name
    KeyButton.Size = UDim2.new(0, 60, 0, 26)
    KeyButton.Position = UDim2.new(1, -60, 0.5, -13)
    KeyButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyButton.Font = Enum.Font.Gotham
    KeyButton.TextSize = 13
    KeyButton.Parent = Holder

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = KeyButton

    KeyButton.MouseButton1Click:Connect(function()
        listening = true
        KeyButton.Text = "..."
    end)

    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
        if listening and input.UserInputType == Enum.UserInputType.Keyboard then
            currentKey = input.KeyCode
            KeyButton.Text = currentKey.Name
            listening = false
            if settings.Callback then
                settings.Callback(currentKey)
            end
        end
    end)

    return Holder
end

return Keybind
