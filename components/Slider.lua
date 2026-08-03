local Slider = {}

function Slider.new(parent, settings)
    settings = settings or {}
    local min = settings.Min or 0
    local max = settings.Max or 100
    local value = settings.Default or min

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, -10, 0, 40)
    Holder.BackgroundTransparency = 1
    Holder.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = (settings.Text or "Slider") .. ": " .. tostring(value)
    Label.Size = UDim2.new(1, 0, 0, 16)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Holder

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, 0, 0, 6)
    Bar.Position = UDim2.new(0, 0, 0, 24)
    Bar.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    Bar.Parent = Holder

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = Bar

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(130, 60, 220)
    Fill.Parent = Bar

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = Fill

    local dragging = false

    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    Bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relative = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            value = math.floor(min + (max - min) * relative)
            Fill.Size = UDim2.new(relative, 0, 1, 0)
            Label.Text = (settings.Text or "Slider") .. ": " .. tostring(value)
            if settings.Callback then
                settings.Callback(value)
            end
        end
    end)

    return Holder
end

return Slider
