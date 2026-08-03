local Input = {}

function Input.new(parent, settings)
    settings = settings or {}

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, -10, 0, 32)
    Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Holder.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Holder

    local TextBox = Instance.new("TextBox")
    TextBox.Text = settings.Default or ""
    TextBox.PlaceholderText = settings.Placeholder or "Enter text"
    TextBox.Size = UDim2.new(1, -10, 1, 0)
    TextBox.Position = UDim2.new(0, 5, 0, 0)
    TextBox.BackgroundTransparency = 1
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 14
    TextBox.TextXAlignment = Enum.TextXAlignment.Left
    TextBox.ClearTextOnFocus = false
    TextBox.Parent = Holder

    TextBox.FocusLost:Connect(function(enterPressed)
        if settings.Callback then
            settings.Callback(TextBox.Text, enterPressed)
        end
    end)

    return Holder
end

return Input
