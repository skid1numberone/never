local Button = {}

function Button.new(parent, settings)
    settings = settings or {}

    local Btn = Instance.new("TextButton")
    Btn.Text = settings.Text or "Button"
    Btn.Size = UDim2.new(1, -10, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14
    Btn.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        if settings.Callback then
            settings.Callback()
        end
    end)

    return Btn
end

return Button
