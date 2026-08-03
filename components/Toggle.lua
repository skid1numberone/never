local Toggle = {}

function Toggle.new(parent, settings)
    settings = settings or {}
    local state = settings.Default or false

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, -10, 0, 32)
    Holder.BackgroundTransparency = 1
    Holder.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = settings.Text or "Toggle"
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Holder

    local Switch = Instance.new("TextButton")
    Switch.Text = ""
    Switch.Size = UDim2.new(0, 40, 0, 20)
    Switch.Position = UDim2.new(1, -40, 0.5, -10)
    Switch.BackgroundColor3 = state and Color3.fromRGB(130, 60, 220) or Color3.fromRGB(50, 50, 55)
    Switch.Parent = Holder

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(1, 0)
    Corner.Parent = Switch

    Switch.MouseButton1Click:Connect(function()
        state = not state
        Switch.BackgroundColor3 = state and Color3.fromRGB(130, 60, 220) or Color3.fromRGB(50, 50, 55)
        if settings.Callback then
            settings.Callback(state)
        end
    end)

    return Holder
end

return Toggle
