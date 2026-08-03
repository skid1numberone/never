local Window = {}
Window.__index = Window

function Window.new(settings)
    settings = settings or {}

    local self = setmetatable({}, Window)

    self.Title = settings.Title or "Window"
    self.Groups = {}
    self.Tabs = {}

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UILibrary"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Size = UDim2.new(0, 600, 0, 400)
    Main.Position = UDim2.new(0.5, -300, 0.5, -200)
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Main.BorderSizePixel = 0
    Main.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Main

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 160, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = Main

    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 8)
    SidebarCorner.Parent = Sidebar

    local SidebarList = Instance.new("UIListLayout")
    SidebarList.Padding = UDim.new(0, 4)
    SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
    SidebarList.Parent = Sidebar

    local Content = Instance.new("Frame")
    Content.Name = "Content"
    Content.Size = UDim2.new(1, -160, 1, 0)
    Content.Position = UDim2.new(0, 160, 0, 0)
    Content.BackgroundTransparency = 1
    Content.Parent = Main

    self.Main = Main
    self.Sidebar = Sidebar
    self.Content = Content

    return self
end

function Window:CreateGroup(name)
    local GroupLabel = Instance.new("TextLabel")
    GroupLabel.Text = name
    GroupLabel.Size = UDim2.new(1, -10, 0, 20)
    GroupLabel.BackgroundTransparency = 1
    GroupLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    GroupLabel.Font = Enum.Font.Gotham
    GroupLabel.TextSize = 12
    GroupLabel.TextXAlignment = Enum.TextXAlignment.Left
    GroupLabel.Parent = self.Sidebar

    local group = {
        Name = name,
        Tabs = {}
    }
    table.insert(self.Groups, group)
    return group
end

function Window:CreateTab(group, name)
    local TabButton = Instance.new("TextButton")
    TabButton.Text = name
    TabButton.Size = UDim2.new(1, -10, 0, 30)
    TabButton.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    TabButton.Parent = self.Sidebar

    local tab = {
        Name = name,
        Button = TabButton
    }
    table.insert(group.Tabs, tab)
    table.insert(self.Tabs, tab)
    return tab
end

return Window
