local Notification = {}

function Notification.new(settings)
    settings = settings or {}

    local ScreenGui = game:GetService("CoreGui"):FindFirstChild("UILibrary")
    if not ScreenGui then return end

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(0, 250, 0, 60)
    Holder.Position = UDim2.new(1, -270, 1, -80)
    Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Holder.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Holder

    local Title = Instance.new("TextLabel")
    Title.Text = settings.Title or "Notification"
    Title.Size = UDim2.new(1, -10, 0, 20)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Holder

    local Message = Instance.new("TextLabel")
    Message.Text = settings.Text or ""
    Message.Size = UDim2.new(1, -10, 0, 30)
    Message.Position = UDim2.new(0, 10, 0, 25)
    Message.BackgroundTransparency = 1
    Message.TextColor3 = Color3.fromRGB(180, 180, 180)
    Message.Font = Enum.Font.Gotham
    Message.TextSize = 12
    Message.TextXAlignment = Enum.TextXAlignment.Left
    Message.TextWrapped = true
    Message.Parent = Holder

    task.delay(settings.Duration or 3, function()
        Holder:Destroy()
    end)

    return Holder
end

return Notification
