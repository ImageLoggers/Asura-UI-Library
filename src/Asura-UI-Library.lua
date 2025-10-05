-- Asura UI Library v2.0
-- A modern, feature-rich UI library for Roblox
-- Created by ImageLoggers
-- GitHub: https://github.com/ImageLoggers/Asura-UI-Library

local AsuraUI = {}
AsuraUI.__index = AsuraUI

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TextService = game:GetService("TextService")

-- Themes
local Themes = {
    Dark = {
        Background = Color3.fromRGB(25, 25, 35),
        Primary = Color3.fromRGB(138, 43, 226),
        Secondary = Color3.fromRGB(50, 50, 60),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(150, 150, 150),
        Accent = Color3.fromRGB(88, 133, 255)
    },
    Light = {
        Background = Color3.fromRGB(245, 245, 250),
        Primary = Color3.fromRGB(100, 65, 165),
        Secondary = Color3.fromRGB(220, 220, 230),
        Text = Color3.fromRGB(30, 30, 40),
        TextSecondary = Color3.fromRGB(100, 100, 120),
        Accent = Color3.fromRGB(65, 105, 225)
    },
    White = {
        Background = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(80, 80, 80),
        Secondary = Color3.fromRGB(240, 240, 240),
        Text = Color3.fromRGB(30, 30, 30),
        TextSecondary = Color3.fromRGB(100, 100, 100),
        Accent = Color3.fromRGB(0, 122, 255)
    },
    Sakura = {
        Background = Color3.fromRGB(255, 230, 240),
        Primary = Color3.fromRGB(255, 105, 180),
        Secondary = Color3.fromRGB(255, 182, 193),
        Text = Color3.fromRGB(80, 40, 60),
        TextSecondary = Color3.fromRGB(150, 100, 120),
        Accent = Color3.fromRGB(255, 20, 147)
    }
}

-- Key System Configuration
local KeySystem = {
    Enabled = false,
    Key = "ASURA123", -- Default key
    WhitelistedUsers = {}, -- Add usernames here for whitelist
    HWIDCheck = false, -- Enable HWID checking
    WebhookURL = "" -- Discord webhook for logging
}

function AsuraUI:Create(options)
    local self = setmetatable({}, AsuraUI)
    
    -- Key System Check
    if options and options.KeySystem then
        if not self:ValidateKey(options.KeySystem.Key or KeySystem.Key) then
            self:ShowKeyPrompt()
            return nil
        end
    end
    
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "AsuraUI_" .. HttpService:GenerateGUID(false):sub(1, 8)
    self.ScreenGui.ResetOnSpawn = false
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    if syn and syn.protect_gui then
        syn.protect_gui(self.ScreenGui)
        self.ScreenGui.Parent = game:GetService("CoreGui")
    else
        self.ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    
    self.CurrentTheme = Themes.Dark
    self.Windows = {}
    self.Elements = {}
    self.Settings = {}
    self.Notifications = {}
    self.Keybinds = {}
    self.Config = {}
    
    -- Mobile support detection
    self.IsMobile = UserInputService.TouchEnabled
    self.TouchGui = nil
    
    -- Load saved settings and config
    self:LoadSettings()
    self:LoadConfig()
    
    -- Add to global instances for keybind handling
    getgenv().AsuraUIInstances = getgenv().AsuraUIInstances or {}
    table.insert(getgenv().AsuraUIInstances, self)
    
    return self
end

-- Key System Functions
function AsuraUI:ValidateKey(inputKey)
    if not KeySystem.Enabled then
        return true
    end
    
    -- Check whitelisted users
    local playerName = Players.LocalPlayer.Name
    if table.find(KeySystem.WhitelistedUsers, playerName) then
        return true
    end
    
    -- Check key
    if inputKey == KeySystem.Key then
        -- Log successful key usage
        self:LogKeyUsage(playerName, "VALID")
        return true
    end
    
    self:LogKeyUsage(playerName, "INVALID")
    return false
end

function AsuraUI:ShowKeyPrompt()
    local KeyPrompt = Instance.new("ScreenGui")
    KeyPrompt.Name = "AsuraUI_KeyPrompt"
    KeyPrompt.Parent = game:GetService("CoreGui")
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = KeyPrompt
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Asura UI - Key Required"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame
    
    local InputBox = Instance.new("TextBox")
    InputBox.Size = UDim2.new(0.8, 0, 0, 40)
    InputBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    InputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputBox.PlaceholderText = "Enter key..."
    InputBox.Text = ""
    InputBox.TextSize = 14
    InputBox.Font = Enum.Font.Gotham
    InputBox.Parent = MainFrame
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = InputBox
    
    local SubmitButton = Instance.new("TextButton")
    SubmitButton.Size = UDim2.new(0.8, 0, 0, 40)
    SubmitButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    SubmitButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    SubmitButton.Text = "Submit Key"
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.TextSize = 14
    SubmitButton.Font = Enum.Font.GothamBold
    SubmitButton.Parent = MainFrame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = SubmitButton
    
    local Message = Instance.new("TextLabel")
    Message.Size = UDim2.new(1, 0, 0, 20)
    Message.Position = UDim2.new(0, 0, 0.85, 0)
    Message.BackgroundTransparency = 1
    Message.Text = "Contact developer for access key"
    Message.TextColor3 = Color3.fromRGB(150, 150, 150)
    Message.TextSize = 12
    Message.Font = Enum.Font.Gotham
    Message.Parent = MainFrame
    
    SubmitButton.MouseButton1Click:Connect(function()
        if self:ValidateKey(InputBox.Text) then
            KeyPrompt:Destroy()
            -- Restart UI creation
            getgenv().AsuraUIRestart = true
        else
            Message.Text = "Invalid key! Try again."
            Message.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
    end)
end

function AsuraUI:LogKeyUsage(username, status)
    if KeySystem.WebhookURL ~= "" and syn then
        local data = {
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "Asura UI Key Usage",
                ["color"] = status == "VALID" and 65280 or 16711680,
                ["fields"] = {
                    {
                        ["name"] = "Username",
                        ["value"] = username,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Game",
                        ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                        ["inline"] = false
                    }
                },
                ["footer"] = {
                    ["text"] = "Asura UI Security"
                }
            }}
        }
        
        local jsonData = HttpService:JSONEncode(data)
        syn.request({
            Url = KeySystem.WebhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonData
        })
    end
end

-- Window Creation
function AsuraUI:CreateWindow(title, subtitle, size, position)
    local Window = {}
    
    -- Adjust size for mobile
    if self.IsMobile then
        size = size or UDim2.new(0.9, 0, 0.8, 0)
        position = position or UDim2.new(0.05, 0, 0.1, 0)
    else
        size = size or UDim2.new(0, 500, 0, 400)
        position = position or UDim2.new(0.5, -250, 0.5, -200)
    end
    
    Window.MainFrame = Instance.new("Frame")
    Window.MainFrame.Size = size
    Window.MainFrame.Position = position
    Window.MainFrame.BackgroundColor3 = self.CurrentTheme.Background
    Window.MainFrame.BackgroundTransparency = 0.1
    Window.MainFrame.BorderSizePixel = 0
    Window.MainFrame.ClipsDescendants = true
    Window.MainFrame.Parent = self.ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Window.MainFrame
    
    -- Title Bar
    Window.TitleBar = Instance.new("Frame")
    Window.TitleBar.Size = UDim2.new(1, 0, 0, 40)
    Window.TitleBar.BackgroundColor3 = self.CurrentTheme.Secondary
    Window.TitleBar.BorderSizePixel = 0
    Window.TitleBar.Parent = Window.MainFrame
    
    local TitleBarCorner = Instance.new("UICorner")
    TitleBarCorner.CornerRadius = UDim.new(0, 12)
    TitleBarCorner.Parent = Window.TitleBar
    
    -- Title Text
    Window.Title = Instance.new("TextLabel")
    Window.Title.Size = UDim2.new(1, -100, 1, 0)
    Window.Title.Position = UDim2.new(0, 15, 0, 0)
    Window.Title.BackgroundTransparency = 1
    Window.Title.Text = title or "Asura UI"
    Window.Title.TextColor3 = self.CurrentTheme.Text
    Window.Title.TextSize = 16
    Window.Title.Font = Enum.Font.GothamBold
    Window.Title.TextXAlignment = Enum.TextXAlignment.Left
    Window.Title.Parent = Window.TitleBar
    
    -- Subtitle
    Window.Subtitle = Instance.new("TextLabel")
    Window.Subtitle.Size = UDim2.new(1, -100, 0, 20)
    Window.Subtitle.Position = UDim2.new(0, 15, 0, 20)
    Window.Subtitle.BackgroundTransparency = 1
    Window.Subtitle.Text = subtitle or "Powered by Asura UI Library"
    Window.Subtitle.TextColor3 = self.CurrentTheme.TextSecondary
    Window.Subtitle.TextSize = 12
    Window.Subtitle.Font = Enum.Font.Gotham
    Window.Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Window.Subtitle.Parent = Window.TitleBar
    
    -- Close Button
    Window.CloseButton = Instance.new("TextButton")
    Window.CloseButton.Size = UDim2.new(0, 30, 0, 30)
    Window.CloseButton.Position = UDim2.new(1, -40, 0, 5)
    Window.CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    Window.CloseButton.Text = "×"
    Window.CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Window.CloseButton.TextSize = 20
    Window.CloseButton.Font = Enum.Font.GothamBold
    Window.CloseButton.BorderSizePixel = 0
    Window.CloseButton.Parent = Window.TitleBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = Window.CloseButton
    
    -- Content Area
    Window.Content = Instance.new("Frame")
    Window.Content.Size = UDim2.new(1, -20, 1, -60)
    Window.Content.Position = UDim2.new(0, 10, 0, 50)
    Window.Content.BackgroundTransparency = 1
    Window.Content.Parent = Window.MainFrame
    
    -- Tab Container
    Window.TabContainer = Instance.new("Frame")
    Window.TabContainer.Size = UDim2.new(0, 120, 1, 0)
    Window.TabContainer.BackgroundTransparency = 1
    Window.TabContainer.Parent = Window.Content
    
    -- Tab Content Container
    Window.TabContent = Instance.new("ScrollingFrame")
    Window.TabContent.Size = UDim2.new(1, -130, 1, 0)
    Window.TabContent.Position = UDim2.new(0, 130, 0, 0)
    Window.TabContent.BackgroundTransparency = 1
    Window.TabContent.ScrollBarThickness = 4
    Window.TabContent.ScrollBarImageColor3 = self.CurrentTheme.Primary
    Window.TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    Window.TabContent.Parent = Window.Content
    
    Window.Tabs = {}
    Window.CurrentTab = nil
    
    -- Close button functionality
    Window.CloseButton.MouseButton1Click:Connect(function()
        Window.MainFrame:Destroy()
        for i, win in pairs(self.Windows) do
            if win == Window then
                table.remove(self.Windows, i)
                break
            end
        end
    end)
    
    -- Drag functionality
    local dragging, dragInput, dragStart, startPos
    local function updateInput(input)
        local delta = input.Position - dragStart
        Window.MainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
    
    Window.TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or (self.IsMobile and input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true
            dragStart = input.Position
            startPos = Window.MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    Window.TitleBar.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or (self.IsMobile and input.UserInputType == Enum.UserInputType.Touch)) then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)
    
    table.insert(self.Windows, Window)
    return Window
end

-- Tab Creation
function AsuraUI:CreateTab(window, name, icon)
    local Tab = {}
    
    -- Tab Button
    Tab.Button = Instance.new("TextButton")
    Tab.Button.Size = UDim2.new(1, -10, 0, 35)
    Tab.Button.Position = UDim2.new(0, 5, 0, #window.Tabs * 40)
    Tab.Button.BackgroundColor3 = self.CurrentTheme.Secondary
    Tab.Button.Text = ""
    Tab.Button.BorderSizePixel = 0
    Tab.Button.AutoButtonColor = false
    Tab.Button.Parent = window.TabContainer
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = Tab.Button
    
    -- Tab Icon
    Tab.Icon = Instance.new("TextLabel")
    Tab.Icon.Size = UDim2.new(0, 25, 1, 0)
    Tab.Icon.Position = UDim2.new(0, 8, 0, 0)
    Tab.Icon.BackgroundTransparency = 1
    Tab.Icon.Text = icon or "📄"
    Tab.Icon.TextColor3 = self.CurrentTheme.TextSecondary
    Tab.Icon.TextSize = 14
    Tab.Icon.Font = Enum.Font.Gotham
    Tab.Icon.Parent = Tab.Button
    
    -- Tab Label
    Tab.Label = Instance.new("TextLabel")
    Tab.Label.Size = UDim2.new(1, -35, 1, 0)
    Tab.Label.Position = UDim2.new(0, 30, 0, 0)
    Tab.Label.BackgroundTransparency = 1
    Tab.Label.Text = name
    Tab.Label.TextColor3 = self.CurrentTheme.TextSecondary
    Tab.Label.TextSize = 12
    Tab.Label.Font = Enum.Font.Gotham
    Tab.Label.TextXAlignment = Enum.TextXAlignment.Left
    Tab.Label.Parent = Tab.Button
    
    -- Tab Content
    Tab.Content = Instance.new("ScrollingFrame")
    Tab.Content.Size = UDim2.new(1, 0, 1, 0)
    Tab.Content.BackgroundTransparency = 1
    Tab.Content.ScrollBarThickness = 4
    Tab.Content.ScrollBarImageColor3 = self.CurrentTheme.Primary
    Tab.Content.CanvasSize = UDim2.new(0, 0, 0, 0)
    Tab.Content.Visible = false
    Tab.Content.Parent = window.TabContent
    
    Tab.YOffset = 0
    Tab.Elements = {}
    
    -- Tab Selection
    Tab.Button.MouseButton1Click:Connect(function()
        for _, tab in pairs(window.Tabs) do
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Secondary}):Play()
            TweenService:Create(tab.Icon, TweenInfo.new(0.2), {TextColor3 = self.CurrentTheme.TextSecondary}):Play()
            TweenService:Create(tab.Label, TweenInfo.new(0.2), {TextColor3 = self.CurrentTheme.TextSecondary}):Play()
            tab.Content.Visible = false
        end
        
        TweenService:Create(Tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Primary}):Play()
        TweenService:Create(Tab.Icon, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TweenService:Create(Tab.Label, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        Tab.Content.Visible = true
        
        window.CurrentTab = Tab
    end)
    
    table.insert(window.Tabs, Tab)
    
    -- Select first tab
    if #window.Tabs == 1 then
        Tab.Button.MouseButton1Click:Fire()
    end
    
    return Tab
end

-- Section Creation
function AsuraUI:CreateSection(tab, name)
    local Section = Instance.new("Frame")
    Section.Size = UDim2.new(1, 0, 0, 30)
    Section.Position = UDim2.new(0, 0, 0, tab.YOffset)
    Section.BackgroundTransparency = 1
    Section.Parent = tab.Content
    
    local SectionLabel = Instance.new("TextLabel")
    SectionLabel.Size = UDim2.new(1, -10, 1, 0)
    SectionLabel.Position = UDim2.new(0, 10, 0, 0)
    SectionLabel.BackgroundTransparency = 1
    SectionLabel.Text = "── " .. name .. " ──"
    SectionLabel.TextColor3 = self.CurrentTheme.Primary
    SectionLabel.TextSize = 12
    SectionLabel.Font = Enum.Font.GothamBold
    SectionLabel.TextXAlignment = Enum.TextXAlignment.Center
    SectionLabel.Parent = Section
    
    tab.YOffset = tab.YOffset + 35
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.YOffset)
    
    return Section
end

-- ===== TOGGLE =====
function AsuraUI:CreateToggle(tab, name, default, callback, saveKey)
    local Toggle = Instance.new("Frame")
    Toggle.Size = UDim2.new(1, 0, 0, 40)
    Toggle.Position = UDim2.new(0, 0, 0, tab.YOffset)
    Toggle.BackgroundColor3 = self.CurrentTheme.Secondary
    Toggle.BackgroundTransparency = 0.1
    Toggle.BorderSizePixel = 0
    Toggle.Parent = tab.Content
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = Toggle
    
    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Text = name
    ToggleLabel.TextColor3 = self.CurrentTheme.Text
    ToggleLabel.TextSize = 13
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = Toggle
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 50, 0, 25)
    ToggleButton.Position = UDim2.new(1, -60, 0.5, -12.5)
    ToggleButton.BackgroundColor3 = default and self.CurrentTheme.Primary or self.CurrentTheme.Secondary
    ToggleButton.Text = ""
    ToggleButton.BorderSizePixel = 0
    ToggleButton.AutoButtonColor = false
    ToggleButton.Parent = Toggle
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    ButtonCorner.Parent = ToggleButton
    
    local ToggleCircle = Instance.new("Frame")
    ToggleCircle.Size = UDim2.new(0, 19, 0, 19)
    ToggleCircle.Position = default and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleCircle.BorderSizePixel = 0
    ToggleCircle.Parent = ToggleButton
    
    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = ToggleCircle
    
    local state = default or false
    
    -- Load saved state
    if saveKey and self.Settings[saveKey] ~= nil then
        state = self.Settings[saveKey]
        ToggleButton.BackgroundColor3 = state and self.CurrentTheme.Primary or self.CurrentTheme.Secondary
        ToggleCircle.Position = state and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
    end
    
    local function updateState(newState)
        state = newState
        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
            BackgroundColor3 = state and self.CurrentTheme.Primary or self.CurrentTheme.Secondary
        }):Play()
        
        TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {
            Position = state and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
        }):Play()
        
        if saveKey then
            self.Settings[saveKey] = state
            self:SaveSettings()
        end
        
        if callback then
            callback(state)
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        updateState(not state)
    end)
    
    tab.YOffset = tab.YOffset + 45
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.YOffset)
    
    local toggleObj = {
        SetState = function(newState)
            updateState(newState)
        end,
        GetState = function()
            return state
        end
    }
    
    table.insert(tab.Elements, toggleObj)
    return toggleObj
end

-- ===== SLIDER =====
function AsuraUI:CreateSlider(tab, name, min, max, default, callback, saveKey)
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(1, 0, 0, 60)
    Slider.Position = UDim2.new(0, 0, 0, tab.YOffset)
    Slider.BackgroundColor3 = self.CurrentTheme.Secondary
    Slider.BackgroundTransparency = 0.1
    Slider.BorderSizePixel = 0
    Slider.Parent = tab.Content
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 8)
    SliderCorner.Parent = Slider
    
    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Size = UDim2.new(0.7, 0, 0, 25)
    SliderLabel.Position = UDim2.new(0, 10, 0, 8)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Text = name
    SliderLabel.TextColor3 = self.CurrentTheme.Text
    SliderLabel.TextSize = 13
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderLabel.Parent = Slider
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.3, -10, 0, 25)
    ValueLabel.Position = UDim2.new(0.7, 0, 0, 8)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = self.CurrentTheme.Primary
    ValueLabel.TextSize = 13
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Slider
    
    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(1, -20, 0, 6)
    SliderBar.Position = UDim2.new(0, 10, 1, -25)
    SliderBar.BackgroundColor3 = self.CurrentTheme.Background
    SliderBar.BorderSizePixel = 0
    SliderBar.Parent = Slider
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = SliderBar
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = self.CurrentTheme.Primary
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderBar
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = SliderFill
    
    local currentValue = default
    
    -- Load saved value
    if saveKey and self.Settings[saveKey] ~= nil then
        currentValue = math.clamp(self.Settings[saveKey], min, max)
        local pos = (currentValue - min) / (max - min)
        SliderFill.Size = UDim2.new(pos, 0, 1, 0)
        ValueLabel.Text = tostring(currentValue)
    end
    
    local dragging = false
    
    local function updateValue(input)
        local absoluteSize = SliderBar.AbsoluteSize.X
        local absolutePosition = SliderBar.AbsolutePosition.X
        local pos = math.clamp((input.Position.X - absolutePosition) / absoluteSize, 0, 1)
        currentValue = math.floor(min + (max - min) * pos)
        
        TweenService:Create(SliderFill, TweenInfo.new(0.1), {Size = UDim2.new(pos, 0, 1, 0)}):Play()
        ValueLabel.Text = tostring(currentValue)
        
        if saveKey then
            self.Settings[saveKey] = currentValue
            self:SaveSettings()
        end
        
        if callback then
            callback(currentValue)
        end
    end
    
    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or (self.IsMobile and input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true
            updateValue(input)
        end
    end)
    
    SliderBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or (self.IsMobile and input.UserInputType == Enum.UserInputType.Touch) then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or (self.IsMobile and input.UserInputType == Enum.UserInputType.Touch)) then
            updateValue(input)
        end
    end)
    
    tab.YOffset = tab.YOffset + 65
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.YOffset)
    
    local sliderObj = {
        SetValue = function(value)
            currentValue = math.clamp(value, min, max)
            local pos = (currentValue - min) / (max - min)
            SliderFill.Size = UDim2.new(pos, 0, 1, 0)
            ValueLabel.Text = tostring(currentValue)
        end,
        GetValue = function()
            return currentValue
        end
    }
    
    table.insert(tab.Elements, sliderObj)
    return sliderObj
end

-- ===== DROPDOWN =====
function AsuraUI:CreateDropdown(tab, name, options, default, callback, saveKey)
    local Dropdown = Instance.new("Frame")
    Dropdown.Size = UDim2.new(1, 0, 0, 40)
    Dropdown.Position = UDim2.new(0, 0, 0, tab.YOffset)
    Dropdown.BackgroundColor3 = self.CurrentTheme.Secondary
    Dropdown.BackgroundTransparency = 0.1
    Dropdown.BorderSizePixel = 0
    Dropdown.ClipsDescendants = true
    Dropdown.Parent = tab.Content
    
    local DropdownCorner = Instance.new("UICorner")
    DropdownCorner.CornerRadius = UDim.new(0, 8)
    DropdownCorner.Parent = Dropdown
    
    local DropdownLabel = Instance.new("TextLabel")
    DropdownLabel.Size = UDim2.new(0.5, 0, 1, 0)
    DropdownLabel.Position = UDim2.new(0, 10, 0, 0)
    DropdownLabel.BackgroundTransparency = 1
    DropdownLabel.Text = name
    DropdownLabel.TextColor3 = self.CurrentTheme.Text
    DropdownLabel.TextSize = 13
    DropdownLabel.Font = Enum.Font.Gotham
    DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
    DropdownLabel.Parent = Dropdown
    
    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Size = UDim2.new(0.4, -10, 0, 25)
    DropdownButton.Position = UDim2.new(0.6, 0, 0.5, -12.5)
    DropdownButton.BackgroundColor3 = self.CurrentTheme.Background
    DropdownButton.Text = default or options[1]
    DropdownButton.TextColor3 = self.CurrentTheme.Text
    DropdownButton.TextSize = 12
    DropdownButton.Font = Enum.Font.Gotham
    DropdownButton.BorderSizePixel = 0
    DropdownButton.AutoButtonColor = false
    DropdownButton.Parent = Dropdown
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = DropdownButton
    
    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 20, 1, 0)
    Arrow.Position = UDim2.new(1, -20, 0, 0)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "▼"
    Arrow.TextColor3 = self.CurrentTheme.TextSecondary
    Arrow.TextSize = 10
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Parent = DropdownButton
    
    local OptionsList = Instance.new("ScrollingFrame")
    OptionsList.Size = UDim2.new(0.4, 0, 0, math.min(#options * 30, 150))
    OptionsList.Position = UDim2.new(0.6, 0, 1, 5)
    OptionsList.BackgroundColor3 = self.CurrentTheme.Background
    OptionsList.BorderSizePixel = 0
    OptionsList.ScrollBarThickness = 4
    OptionsList.ScrollBarImageColor3 = self.CurrentTheme.Primary
    OptionsList.CanvasSize = UDim2.new(0, 0, 0, #options * 30)
    OptionsList.Visible = false
    OptionsList.ZIndex = 5
    OptionsList.Parent = Dropdown
    
    local ListCorner = Instance.new("UICorner")
    ListCorner.CornerRadius = UDim.new(0, 6)
    ListCorner.Parent = OptionsList
    
    local currentValue = default or options[1]
    
    -- Load saved value
    if saveKey and self.Settings[saveKey] ~= nil then
        currentValue = self.Settings[saveKey]
        DropdownButton.Text = currentValue
    end
    
    for i, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Size = UDim2.new(1, -10, 0, 25)
        OptionButton.Position = UDim2.new(0, 5, 0, (i - 1) * 30)
        OptionButton.BackgroundColor3 = self.CurrentTheme.Secondary
        OptionButton.Text = option
        OptionButton.TextColor3 = self.CurrentTheme.Text
        OptionButton.TextSize = 11
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.BorderSizePixel = 0
        OptionButton.AutoButtonColor = false
        OptionButton.ZIndex = 6
        OptionButton.Parent = OptionsList
        
        local OptCorner = Instance.new("UICorner")
        OptCorner.CornerRadius = UDim.new(0, 4)
        OptCorner.Parent = OptionButton
        
        OptionButton.MouseButton1Click:Connect(function()
            currentValue = option
            DropdownButton.Text = option
            OptionsList.Visible = false
            Arrow.Text = "▼"
            
            if saveKey then
                self.Settings[saveKey] = currentValue
                self:SaveSettings()
            end
            
            if callback then
                callback(option)
            end
        end)
        
        OptionButton.MouseEnter:Connect(function()
            TweenService:Create(OptionButton, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Primary}):Play()
        end)
        
        OptionButton.MouseLeave:Connect(function()
            TweenService:Create(OptionButton, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Secondary}):Play()
        end)
    end
    
    DropdownButton.MouseButton1Click:Connect(function()
        OptionsList.Visible = not OptionsList.Visible
        Arrow.Text = OptionsList.Visible and "▲" or "▼"
    end)
    
    -- Close dropdown when clicking outside
    local function closeDropdown()
        OptionsList.Visible = false
        Arrow.Text = "▼"
    end
    
    UserInputService.InputBegan:Connect(function(input)
        if OptionsList.Visible and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePos = input.Position
            local absolutePos = OptionsList.AbsolutePosition
            local absoluteSize = OptionsList.AbsoluteSize
            
            if mousePos.X < absolutePos.X or mousePos.X > absolutePos.X + absoluteSize.X or
               mousePos.Y < absolutePos.Y or mousePos.Y > absolutePos.Y + absoluteSize.Y then
                closeDropdown()
            end
        end
    end)
    
    tab.YOffset = tab.YOffset + 45
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.YOffset)
    
    local dropdownObj = {
        SetValue = function(value)
            if table.find(options, value) then
                currentValue = value
                DropdownButton.Text = value
            end
        end,
        GetValue = function()
            return currentValue
        end
    }
    
    table.insert(tab.Elements, dropdownObj)
    return dropdownObj
end

-- ===== COLOR PICKER =====
function AsuraUI:CreateColorPicker(tab, name, default, callback, saveKey)
    local ColorPicker = Instance.new("Frame")
    ColorPicker.Size = UDim2.new(1, 0, 0, 40)
    ColorPicker.Position = UDim2.new(0, 0, 0, tab.YOffset)
    ColorPicker.BackgroundColor3 = self.CurrentTheme.Secondary
    ColorPicker.BackgroundTransparency = 0.1
    ColorPicker.BorderSizePixel = 0
    ColorPicker.Parent = tab.Content
    
    local PickerCorner = Instance.new("UICorner")
    PickerCorner.CornerRadius = UDim.new(0, 8)
    PickerCorner.Parent = ColorPicker
    
    local PickerLabel = Instance.new("TextLabel")
    PickerLabel.Size = UDim2.new(0.7, 0, 1, 0)
    PickerLabel.Position = UDim2.new(0, 10, 0, 0)
    PickerLabel.BackgroundTransparency = 1
    PickerLabel.Text = name
    PickerLabel.TextColor3 = self.CurrentTheme.Text
    PickerLabel.TextSize = 13
    PickerLabel.Font = Enum.Font.Gotham
    PickerLabel.TextXAlignment = Enum.TextXAlignment.Left
    PickerLabel.Parent = ColorPicker
    
    local ColorDisplay = Instance.new("TextButton")
    ColorDisplay.Size = UDim2.new(0, 60, 0, 25)
    ColorDisplay.Position = UDim2.new(1, -70, 0.5, -12.5)
    ColorDisplay.BackgroundColor3 = default or self.CurrentTheme.Primary
    ColorDisplay.Text = ""
    ColorDisplay.BorderSizePixel = 0
    ColorDisplay.AutoButtonColor = false
    ColorDisplay.Parent = ColorPicker
    
    local DisplayCorner = Instance.new("UICorner")
    DisplayCorner.CornerRadius = UDim.new(0, 6)
    DisplayCorner.Parent = ColorDisplay
    
    local DisplayStroke = Instance.new("UIStroke")
    DisplayStroke.Color = self.CurrentTheme.Background
    DisplayStroke.Thickness = 2
    DisplayStroke.Parent = ColorDisplay
    
    local currentColor = default or self.CurrentTheme.Primary
    
    -- Load saved color
    if saveKey and self.Settings[saveKey] then
        local saved = self.Settings[saveKey]
        currentColor = Color3.new(saved.R, saved.G, saved.B)
        ColorDisplay.BackgroundColor3 = currentColor
    end
    
    -- Color picker modal
    local ColorModal
    local function createColorModal()
        if ColorModal then
            ColorModal:Destroy()
        end
        
        ColorModal = Instance.new("Frame")
        ColorModal.Size = UDim2.new(0, 200, 0, 150)
        ColorModal.Position = UDim2.new(0, ColorDisplay.AbsolutePosition.X - 70, 0, ColorDisplay.AbsolutePosition.Y + 30)
        ColorModal.BackgroundColor3 = self.CurrentTheme.Background
        ColorModal.BorderSizePixel = 0
        ColorModal.ZIndex = 10
        ColorModal.Parent = self.ScreenGui
        
        local ModalCorner = Instance.new("UICorner")
        ModalCorner.CornerRadius = UDim.new(0, 8)
        ModalCorner.Parent = ColorModal
        
        local ModalStroke = Instance.new("UIStroke")
        ModalStroke.Color = self.CurrentTheme.Secondary
        ModalStroke.Thickness = 2
        ModalStroke.Parent = ColorModal
        
        -- Preset colors
        local presetColors = {
            Color3.fromRGB(255, 50, 50),    -- Red
            Color3.fromRGB(255, 150, 50),   -- Orange
            Color3.fromRGB(255, 255, 50),   -- Yellow
            Color3.fromRGB(50, 255, 50),    -- Green
            Color3.fromRGB(50, 200, 255),   -- Light Blue
            Color3.fromRGB(50, 50, 255),    -- Blue
            Color3.fromRGB(138, 43, 226),   -- Purple
            Color3.fromRGB(255, 50, 255),   -- Pink
            Color3.fromRGB(255, 255, 255)   -- White
        }
        
        for i, color in ipairs(presetColors) do
            local row = math.floor((i - 1) / 3)
            local col = (i - 1) % 3
            
            local ColorButton = Instance.new("TextButton")
            ColorButton.Size = UDim2.new(0, 40, 0, 40)
            ColorButton.Position = UDim2.new(0, 10 + col * 50, 0, 10 + row * 50)
            ColorButton.BackgroundColor3 = color
            ColorButton.Text = ""
            ColorButton.BorderSizePixel = 0
            ColorButton.ZIndex = 11
            ColorButton.Parent = ColorModal
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Parent = ColorButton
            
            ColorButton.MouseButton1Click:Connect(function()
                currentColor = color
                ColorDisplay.BackgroundColor3 = color
                ColorModal:Destroy()
                ColorModal = nil
                
                if saveKey then
                    self.Settings[saveKey] = {R = color.R, G = color.G, B = color.B}
                    self:SaveSettings()
                end
                
                if callback then
                    callback(color)
                end
            end)
        end
    end
    
    ColorDisplay.MouseButton1Click:Connect(function()
        createColorModal()
    end)
    
    -- Close modal when clicking outside
    UserInputService.InputBegan:Connect(function(input)
        if ColorModal and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePos = input.Position
            local absolutePos = ColorModal.AbsolutePosition
            local absoluteSize = ColorModal.AbsoluteSize
            
            if mousePos.X < absolutePos.X or mousePos.X > absolutePos.X + absoluteSize.X or
               mousePos.Y < absolutePos.Y or mousePos.Y > absolutePos.Y + absoluteSize.Y then
                ColorModal:Destroy()
                ColorModal = nil
            end
        end
    end)
    
    tab.YOffset = tab.YOffset + 45
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.YOffset)
    
    local colorObj = {
        SetColor = function(color)
            currentColor = color
            ColorDisplay.BackgroundColor3 = color
        end,
        GetColor = function()
            return currentColor
        end
    }
    
    table.insert(tab.Elements, colorObj)
    return colorObj
end

-- ===== KEYBIND SYSTEM =====
function AsuraUI:CreateKeybind(tab, name, default, callback, saveKey)
    local Keybind = Instance.new("Frame")
    Keybind.Size = UDim2.new(1, 0, 0, 40)
    Keybind.Position = UDim2.new(0, 0, 0, tab.YOffset)
    Keybind.BackgroundColor3 = self.CurrentTheme.Secondary
    Keybind.BackgroundTransparency = 0.1
    Keybind.BorderSizePixel = 0
    Keybind.Parent = tab.Content
    
    local KeybindCorner = Instance.new("UICorner")
    KeybindCorner.CornerRadius = UDim.new(0, 8)
    KeybindCorner.Parent = Keybind
    
    local KeybindLabel = Instance.new("TextLabel")
    KeybindLabel.Size = UDim2.new(0.7, 0, 1, 0)
    KeybindLabel.Position = UDim2.new(0, 10, 0, 0)
    KeybindLabel.BackgroundTransparency = 1
    KeybindLabel.Text = name
    KeybindLabel.TextColor3 = self.CurrentTheme.Text
    KeybindLabel.TextSize = 13
    KeybindLabel.Font = Enum.Font.Gotham
    KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
    KeybindLabel.Parent = Keybind
    
    local KeybindButton = Instance.new("TextButton")
    KeybindButton.Size = UDim2.new(0, 80, 0, 25)
    KeybindButton.Position = UDim2.new(1, -90, 0.5, -12.5)
    KeybindButton.BackgroundColor3 = self.CurrentTheme.Background
    KeybindButton.Text = default.Name or "None"
    KeybindButton.TextColor3 = self.CurrentTheme.Text
    KeybindButton.TextSize = 12
    KeybindButton.Font = Enum.Font.Gotham
    KeybindButton.BorderSizePixel = 0
    KeybindButton.AutoButtonColor = false
    KeybindButton.Parent = Keybind
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = KeybindButton
    
    local currentKey = default or Enum.KeyCode.Unknown
    local binding = false
    
    -- Load saved keybind
    if saveKey and self.Settings[saveKey] then
        currentKey = Enum.KeyCode[self.Settings[saveKey]]
        KeybindButton.Text = currentKey.Name
    end
    
    -- Register keybind
    if currentKey ~= Enum.KeyCode.Unknown then
        self.Keybinds[name] = {
            Key = currentKey,
            Callback = callback
        }
    end
    
    KeybindButton.MouseButton1Click:Connect(function()
        if binding then return end
        
        binding = true
        KeybindButton.Text = "..."
        KeybindButton.BackgroundColor3 = self.CurrentTheme.Primary
    end)
    
    local keyConnection
    keyConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if binding and input.UserInputType == Enum.UserInputType.Keyboard then
            binding = false
            
            currentKey = input.KeyCode
            KeybindButton.Text = currentKey.Name
            KeybindButton.BackgroundColor3 = self.CurrentTheme.Background
            
            -- Update keybind
            self.Keybinds[name] = {
                Key = currentKey,
                Callback = callback
            }
            
            if saveKey then
                self.Settings[saveKey] = currentKey.Name
                self:SaveSettings()
            end
            
            if callback then
                callback(currentKey)
            end
        end
    end)
    
    tab.YOffset = tab.YOffset + 45
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.YOffset)
    
    local keybindObj = {
        SetKey = function(key)
            currentKey = key
            KeybindButton.Text = key.Name
            self.Keybinds[name] = {
                Key = key,
                Callback = callback
            }
        end,
        GetKey = function()
            return currentKey
        end
    }
    
    table.insert(tab.Elements, keybindObj)
    return keybindObj
end

-- ===== BUTTON =====
function AsuraUI:CreateButton(tab, name, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.Position = UDim2.new(0, 0, 0, tab.YOffset)
    Button.BackgroundColor3 = self.CurrentTheme.Primary
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamBold
    Button.BorderSizePixel = 0
    Button.AutoButtonColor = false
    Button.Parent = tab.Content
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = Button
    
    -- Hover effects
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(
                math.min(255, self.CurrentTheme.Primary.R * 255 + 30),
                math.min(255, self.CurrentTheme.Primary.G * 255 + 30),
                math.min(255, self.CurrentTheme.Primary.B * 255 + 30)
            )
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = self.CurrentTheme.Primary
        }):Play()
    end)
    
    Button.MouseButton1Click:Connect(callback)
    
    tab.YOffset = tab.YOffset + 45
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.YOffset)
    
    return Button
end

-- ===== NOTIFICATION SYSTEM =====
function AsuraUI:Notify(title, message, duration)
    duration = duration or 5
    
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(0, 300, 0, 80)
    Notification.Position = UDim2.new(1, 20, 1, -100)
    Notification.BackgroundColor3 = self.CurrentTheme.Background
    Notification.BackgroundTransparency = 0.1
    Notification.BorderSizePixel = 0
    Notification.ZIndex = 100
    Notification.Parent = self.ScreenGui
    
    local NotifyCorner = Instance.new("UICorner")
    NotifyCorner.CornerRadius = UDim.new(0, 8)
    NotifyCorner.Parent = Notification
    
    local NotifyStroke = Instance.new("UIStroke")
    NotifyStroke.Color = self.CurrentTheme.Primary
    NotifyStroke.Thickness = 2
    NotifyStroke.Parent = Notification
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 0, 25)
    TitleLabel.Position = UDim2.new(0, 10, 0, 10)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = self.CurrentTheme.Text
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 101
    TitleLabel.Parent = Notification
    
    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Size = UDim2.new(1, -20, 0, 40)
    MessageLabel.Position = UDim2.new(0, 10, 0, 35)
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Text = message
    MessageLabel.TextColor3 = self.CurrentTheme.TextSecondary
    MessageLabel.TextSize = 12
    MessageLabel.Font = Enum.Font.Gotham
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
    MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
    MessageLabel.ZIndex = 101
    MessageLabel.Parent = Notification
    
    -- Animate in
    TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Position = UDim2.new(1, -320, 1, -100)
    }):Play()
    
    table.insert(self.Notifications, Notification)
    
    -- Auto remove after duration
    delay(duration, function()
        TweenService:Create(Notification, TweenInfo.new(0.3), {
            Position = UDim2.new(1, 20, 1, -100)
        }):Play()
        
        wait(0.3)
        Notification:Destroy()
        
        for i, notif in pairs(self.Notifications) do
            if notif == Notification then
                table.remove(self.Notifications, i)
                break
            end
        end
    end)
    
    return Notification
end

-- ===== SAVING/LOADING SETTINGS =====
function AsuraUI:SaveSettings()
    if writefile then
        local success, err = pcall(function()
            writefile("AsuraUI_Settings.json", HttpService:JSONEncode(self.Settings))
        end)
        
        if not success then
            warn("Failed to save settings:", err)
        end
    end
end

function AsuraUI:LoadSettings()
    if readfile then
        local success, data = pcall(function()
            return readfile("AsuraUI_Settings.json")
        end)
        
        if success and data then
            local success2, decoded = pcall(function()
                return HttpService:JSONDecode(data)
            end)
            
            if success2 and decoded then
                self.Settings = decoded
            end
        end
    end
end

function AsuraUI:ClearSettings()
    self.Settings = {}
    self:SaveSettings()
end

-- ===== CONFIG SYSTEM =====
function AsuraUI:SaveConfig(configName)
    if not writefile then return false end
    
    configName = configName or "default"
    local filename = "AsuraUI_Config_" .. configName .. ".json"
    
    local success, err = pcall(function()
        writefile(filename, HttpService:JSONEncode(self.Config))
    end)
    
    if success then
        self:Notify("Config Saved", "Configuration '" .. configName .. "' saved successfully!", 3)
        return true
    else
        self:Notify("Error", "Failed to save config: " .. tostring(err), 5)
        return false
    end
end

function AsuraUI:LoadConfig(configName)
    if not readfile then return false end
    
    configName = configName or "default"
    local filename = "AsuraUI_Config_" .. configName .. ".json"
    
    local success, data = pcall(function()
        return readfile(filename)
    end)
    
    if success and data then
        local success2, decoded = pcall(function()
            return HttpService:JSONDecode(data)
        end)
        
        if success2 and decoded then
            self.Config = decoded
            self:Notify("Config Loaded", "Configuration '" .. configName .. "' loaded successfully!", 3)
            
            -- Apply loaded config to UI elements
            self:ApplyConfig()
            return true
        end
    end
    
    self:Notify("Error", "Failed to load config: " .. configName, 5)
    return false
end

function AsuraUI:ApplyConfig()
    -- Apply config to all UI elements
    for _, window in pairs(self.Windows) do
        for _, tab in pairs(window.Tabs) do
            for _, element in pairs(tab.Elements) do
                -- This would need custom implementation based on your element structure
                -- You can extend this to automatically apply saved values
            end
        end
    end
end

function AsuraUI:DeleteConfig(configName)
    if not delfile then return false end
    
    configName = configName or "default"
    local filename = "AsuraUI_Config_" .. configName .. ".json"
    
    local success, err = pcall(function()
        delfile(filename)
    end)
    
    if success then
        self:Notify("Config Deleted", "Configuration '" .. configName .. "' deleted!", 3)
        return true
    else
        self:Notify("Error", "Failed to delete config: " .. tostring(err), 5)
        return false
    end
end

-- ===== MOBILE SUPPORT =====
function AsuraUI:CreateMobileButton(icon, callback)
    if not self.IsMobile then return end
    
    if not self.TouchGui then
        self.TouchGui = Instance.new("ScreenGui")
        self.TouchGui.Name = "MobileControls"
        self.TouchGui.Parent = self.ScreenGui.Parent
    end
    
    local MobileButton = Instance.new("TextButton")
    MobileButton.Size = UDim2.new(0, 60, 0, 60)
    MobileButton.Position = UDim2.new(0, 20, 0, 20)
    MobileButton.BackgroundColor3 = self.CurrentTheme.Primary
    MobileButton.Text = icon or "📱"
    MobileButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MobileButton.TextSize = 20
    MobileButton.Font = Enum.Font.GothamBold
    MobileButton.BorderSizePixel = 0
    MobileButton.AutoButtonColor = false
    MobileButton.Parent = self.TouchGui
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    ButtonCorner.Parent = MobileButton
    
    MobileButton.MouseButton1Click:Connect(callback)
    
    -- Make button draggable
    local dragging, dragInput, dragStart, startPos
    local function updateInput(input)
        local delta = input.Position - dragStart
        MobileButton.Position = UDim2.new(
            0, startPos.X.Offset + delta.X,
            0, startPos.Y.Offset + delta.Y
        )
    end
    
    MobileButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MobileButton.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    MobileButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)
    
    return MobileButton
end

-- ===== KEYBIND HANDLER =====
function AsuraUI:HandleKeybinds()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.UserInputType == Enum.UserInputType.Keyboard then
            for name, keybind in pairs(self.Keybinds) do
                if input.KeyCode == keybind.Key and keybind.Callback then
                    keybind.Callback()
                end
            end
        end
    end)
end

-- ===== THEME SYSTEM =====
function AsuraUI:SetTheme(themeName)
    if Themes[themeName] then
        self.CurrentTheme = Themes[themeName]
        self:UpdateAllElements()
        self:Notify("Theme Changed", "Applied " .. themeName .. " theme", 2)
    end
end

function AsuraUI:UpdateAllElements()
    for _, window in pairs(self.Windows) do
        window.MainFrame.BackgroundColor3 = self.CurrentTheme.Background
        window.TitleBar.BackgroundColor3 = self.CurrentTheme.Secondary
        window.Title.TextColor3 = self.CurrentTheme.Text
        window.Subtitle.TextColor3 = self.CurrentTheme.TextSecondary
        window.TabContent.ScrollBarImageColor3 = self.CurrentTheme.Primary
        
        for _, tab in pairs(window.Tabs) do
            if tab.Button.BackgroundColor3 == window.CurrentTab.Button.BackgroundColor3 then
                tab.Button.BackgroundColor3 = self.CurrentTheme.Primary
                tab.Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
                tab.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                tab.Button.BackgroundColor3 = self.CurrentTheme.Secondary
                tab.Icon.TextColor3 = self.CurrentTheme.TextSecondary
                tab.Label.TextColor3 = self.CurrentTheme.TextSecondary
            end
        end
    end
end

-- ===== DESTROY =====
function AsuraUI:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
    if self.TouchGui then
        self.TouchGui:Destroy()
    end
end

-- Start keybind handler
RunService.Heartbeat:Connect(function()
    for _, lib in pairs(getgenv().AsuraUIInstances or {}) do
        lib:HandleKeybinds()
    end
end)

-- Auto-restart if key was validated
if getgenv().AsuraUIRestart then
    getgenv().AsuraUIRestart = nil
    -- You can add auto-restart logic here if needed
end

return AsuraUI
