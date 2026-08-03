local Section = {}

function Section.new(parent, settings)
    settings = settings or {}

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, 0, 0, 30)
    Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Holder.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Holder

    local Label = Instance.new("TextLabel")
    Label.Text = settings.Text or "Section"
    Label.Size = UDim2.new(1, -10, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Holder

    local ItemList = Instance.new("Frame")
    ItemList.Name = "Items"
    ItemList.Size = UDim2.new(1, 0, 0, 0)
    ItemList.Position = UDim2.new(0, 0, 0, 30)
    ItemList.BackgroundTransparency = 1
    ItemList.AutomaticSize = Enum.AutomaticSize.Y
    ItemList.Parent = Holder

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Padding = UDim.new(0, 6)
    ListLayout.Parent = ItemList

    return ItemList
end

return Section
