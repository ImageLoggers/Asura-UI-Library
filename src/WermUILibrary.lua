--[[

Werm UI Interface Suite
Modified from Rayfield

]]

local Release = "Beta 8"
local NotificationDuration = 6.5
local WermUIFolder = "WermUI"
local ConfigurationFolder = WermUIFolder.."/Configurations"
local ConfigurationExtension = ".rfld"

local WermUILibrary = {
	Flags = {},
	Theme = {
		Default = {
			TextFont = Enum.Font.Gotham,
			TextColor = Color3.fromRGB(240, 240, 240),
			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),
			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(85, 85, 85),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
			SliderBackground = Color3.fromRGB(43, 105, 159),
			SliderProgress = Color3.fromRGB(43, 105, 159),
			SliderStroke = Color3.fromRGB(48, 119, 177),
			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(0, 146, 214),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
			ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Light = {
			TextFont = Enum.Font.Gotham,
			TextColor = Color3.fromRGB(50, 50, 50),
			Background = Color3.fromRGB(255, 255, 255),
			Topbar = Color3.fromRGB(217, 217, 217),
			Shadow = Color3.fromRGB(223, 223, 223),
			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
			TabBackground = Color3.fromRGB(220, 220, 220),
			TabStroke = Color3.fromRGB(112, 112, 112),
			TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
			ElementBackground = Color3.fromRGB(198, 198, 198),
			ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
			SecondaryElementBackground = Color3.fromRGB(136, 136, 136),
			ElementStroke = Color3.fromRGB(180, 199, 97),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
			SliderBackground = Color3.fromRGB(31, 159, 71),
			SliderProgress = Color3.fromRGB(31, 159, 71),
			SliderStroke = Color3.fromRGB(42, 216, 94),
			ToggleBackground = Color3.fromRGB(170, 203, 60),
			ToggleEnabled = Color3.fromRGB(32, 214, 29),
			ToggleDisabled = Color3.fromRGB(100, 22, 23),
			ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
			ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),
			InputBackground = Color3.fromRGB(31, 159, 71),
			InputStroke = Color3.fromRGB(19, 65, 31),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Black = {
			TextFont = Enum.Font.Gotham,
			TextColor = Color3.fromRGB(240, 240, 240),
			Background = Color3.fromRGB(10, 10, 10),
			Topbar = Color3.fromRGB(20, 20, 20),
			Shadow = Color3.fromRGB(5, 5, 5),
			NotificationBackground = Color3.fromRGB(15, 15, 15),
			NotificationActionsBackground = Color3.fromRGB(40, 40, 40),
			TabBackground = Color3.fromRGB(50, 50, 50),
			TabStroke = Color3.fromRGB(60, 60, 60),
			TabBackgroundSelected = Color3.fromRGB(100, 100, 100),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(240, 240, 240),
			ElementBackground = Color3.fromRGB(25, 25, 25),
			ElementBackgroundHover = Color3.fromRGB(35, 35, 35),
			SecondaryElementBackground = Color3.fromRGB(15, 15, 15),
			ElementStroke = Color3.fromRGB(45, 45, 45),
			SecondaryElementStroke = Color3.fromRGB(35, 35, 35),
			SliderBackground = Color3.fromRGB(30, 30, 30),
			SliderProgress = Color3.fromRGB(80, 80, 80),
			SliderStroke = Color3.fromRGB(50, 50, 50),
			ToggleBackground = Color3.fromRGB(20, 20, 20),
			ToggleEnabled = Color3.fromRGB(80, 80, 80),
			ToggleDisabled = Color3.fromRGB(40, 40, 40),
			ToggleEnabledStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledStroke = Color3.fromRGB(60, 60, 60),
			ToggleEnabledOuterStroke = Color3.fromRGB(70, 70, 70),
			ToggleDisabledOuterStroke = Color3.fromRGB(30, 30, 30),
			InputBackground = Color3.fromRGB(20, 20, 20),
			InputStroke = Color3.fromRGB(50, 50, 50),
			PlaceholderColor = Color3.fromRGB(150, 150, 150)
		},
		White = {
			TextFont = Enum.Font.Gotham,
			TextColor = Color3.fromRGB(30, 30, 30),
			Background = Color3.fromRGB(245, 245, 245),
			Topbar = Color3.fromRGB(235, 235, 235),
			Shadow = Color3.fromRGB(220, 220, 220),
			NotificationBackground = Color3.fromRGB(250, 250, 250),
			NotificationActionsBackground = Color3.fromRGB(220, 220, 220),
			TabBackground = Color3.fromRGB(200, 200, 200),
			TabStroke = Color3.fromRGB(180, 180, 180),
			TabBackgroundSelected = Color3.fromRGB(150, 150, 150),
			TabTextColor = Color3.fromRGB(30, 30, 30),
			SelectedTabTextColor = Color3.fromRGB(245, 245, 245),
			ElementBackground = Color3.fromRGB(255, 255, 255),
			ElementBackgroundHover = Color3.fromRGB(240, 240, 240),
			SecondaryElementBackground = Color3.fromRGB(230, 230, 230),
			ElementStroke = Color3.fromRGB(210, 210, 210),
			SecondaryElementStroke = Color3.fromRGB(200, 200, 200),
			SliderBackground = Color3.fromRGB(220, 220, 220),
			SliderProgress = Color3.fromRGB(150, 150, 150),
			SliderStroke = Color3.fromRGB(180, 180, 180),
			ToggleBackground = Color3.fromRGB(230, 230, 230),
			ToggleEnabled = Color3.fromRGB(100, 100, 100),
			ToggleDisabled = Color3.fromRGB(180, 180, 180),
			ToggleEnabledStroke = Color3.fromRGB(80, 80, 80),
			ToggleDisabledStroke = Color3.fromRGB(200, 200, 200),
			ToggleEnabledOuterStroke = Color3.fromRGB(120, 120, 120),
			ToggleDisabledOuterStroke = Color3.fromRGB(160, 160, 160),
			InputBackground = Color3.fromRGB(255, 255, 255),
			InputStroke = Color3.fromRGB(200, 200, 200),
			PlaceholderColor = Color3.fromRGB(120, 120, 120)
		},
		Purple = {
			TextFont = Enum.Font.Gotham,
			TextColor = Color3.fromRGB(240, 240, 240),
			Background = Color3.fromRGB(30, 20, 40),
			Topbar = Color3.fromRGB(40, 25, 55),
			Shadow = Color3.fromRGB(25, 15, 35),
			NotificationBackground = Color3.fromRGB(25, 15, 35),
			NotificationActionsBackground = Color3.fromRGB(70, 50, 90),
			TabBackground = Color3.fromRGB(60, 40, 80),
			TabStroke = Color3.fromRGB(70, 50, 90),
			TabBackgroundSelected = Color3.fromRGB(120, 80, 160),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(240, 240, 240),
			ElementBackground = Color3.fromRGB(40, 25, 55),
			ElementBackgroundHover = Color3.fromRGB(50, 35, 70),
			SecondaryElementBackground = Color3.fromRGB(35, 20, 45),
			ElementStroke = Color3.fromRGB(65, 45, 85),
			SecondaryElementStroke = Color3.fromRGB(55, 35, 75),
			SliderBackground = Color3.fromRGB(50, 30, 70),
			SliderProgress = Color3.fromRGB(120, 80, 160),
			SliderStroke = Color3.fromRGB(70, 50, 100),
			ToggleBackground = Color3.fromRGB(35, 20, 50),
			ToggleEnabled = Color3.fromRGB(120, 80, 160),
			ToggleDisabled = Color3.fromRGB(70, 50, 90),
			ToggleEnabledStroke = Color3.fromRGB(140, 100, 180),
			ToggleDisabledStroke = Color3.fromRGB(90, 70, 110),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 60, 140),
			ToggleDisabledOuterStroke = Color3.fromRGB(60, 40, 80),
			InputBackground = Color3.fromRGB(35, 20, 50),
			InputStroke = Color3.fromRGB(70, 50, 90),
			PlaceholderColor = Color3.fromRGB(160, 140, 180)
		},
		Red = {
			TextFont = Enum.Font.Gotham,
			TextColor = Color3.fromRGB(240, 240, 240),
			Background = Color3.fromRGB(40, 20, 20),
			Topbar = Color3.fromRGB(55, 25, 25),
			Shadow = Color3.fromRGB(35, 15, 15),
			NotificationBackground = Color3.fromRGB(35, 15, 15),
			NotificationActionsBackground = Color3.fromRGB(90, 50, 50),
			TabBackground = Color3.fromRGB(80, 40, 40),
			TabStroke = Color3.fromRGB(90, 50, 50),
			TabBackgroundSelected = Color3.fromRGB(160, 80, 80),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(240, 240, 240),
			ElementBackground = Color3.fromRGB(55, 25, 25),
			ElementBackgroundHover = Color3.fromRGB(70, 35, 35),
			SecondaryElementBackground = Color3.fromRGB(45, 20, 20),
			ElementStroke = Color3.fromRGB(85, 45, 45),
			SecondaryElementStroke = Color3.fromRGB(75, 35, 35),
			SliderBackground = Color3.fromRGB(70, 30, 30),
			SliderProgress = Color3.fromRGB(160, 80, 80),
			SliderStroke = Color3.fromRGB(100, 50, 50),
			ToggleBackground = Color3.fromRGB(50, 20, 20),
			ToggleEnabled = Color3.fromRGB(160, 80, 80),
			ToggleDisabled = Color3.fromRGB(90, 50, 50),
			ToggleEnabledStroke = Color3.fromRGB(180, 100, 100),
			ToggleDisabledStroke = Color3.fromRGB(110, 70, 70),
			ToggleEnabledOuterStroke = Color3.fromRGB(140, 60, 60),
			ToggleDisabledOuterStroke = Color3.fromRGB(80, 40, 40),
			InputBackground = Color3.fromRGB(50, 20, 20),
			InputStroke = Color3.fromRGB(90, 50, 50),
			PlaceholderColor = Color3.fromRGB(180, 140, 140)
		},
		Yellow = {
			TextFont = Enum.Font.Gotham,
			TextColor = Color3.fromRGB(30, 30, 30),
			Background = Color3.fromRGB(40, 40, 20),
			Topbar = Color3.fromRGB(55, 55, 25),
			Shadow = Color3.fromRGB(35, 35, 15),
			NotificationBackground = Color3.fromRGB(35, 35, 15),
			NotificationActionsBackground = Color3.fromRGB(90, 90, 50),
			TabBackground = Color3.fromRGB(80, 80, 40),
			TabStroke = Color3.fromRGB(90, 90, 50),
			TabBackgroundSelected = Color3.fromRGB(160, 160, 80),
			TabTextColor = Color3.fromRGB(30, 30, 30),
			SelectedTabTextColor = Color3.fromRGB(30, 30, 30),
			ElementBackground = Color3.fromRGB(55, 55, 25),
			ElementBackgroundHover = Color3.fromRGB(70, 70, 35),
			SecondaryElementBackground = Color3.fromRGB(45, 45, 20),
			ElementStroke = Color3.fromRGB(85, 85, 45),
			SecondaryElementStroke = Color3.fromRGB(75, 75, 35),
			SliderBackground = Color3.fromRGB(70, 70, 30),
			SliderProgress = Color3.fromRGB(160, 160, 80),
			SliderStroke = Color3.fromRGB(100, 100, 50),
			ToggleBackground = Color3.fromRGB(50, 50, 20),
			ToggleEnabled = Color3.fromRGB(160, 160, 80),
			ToggleDisabled = Color3.fromRGB(90, 90, 50),
			ToggleEnabledStroke = Color3.fromRGB(180, 180, 100),
			ToggleDisabledStroke = Color3.fromRGB(110, 110, 70),
			ToggleEnabledOuterStroke = Color3.fromRGB(140, 140, 60),
			ToggleDisabledOuterStroke = Color3.fromRGB(80, 80, 40),
			InputBackground = Color3.fromRGB(50, 50, 20),
			InputStroke = Color3.fromRGB(90, 90, 50),
			PlaceholderColor = Color3.fromRGB(130, 130, 80)
		}
	}
}

-- Services
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Interface Management
local WermUI = Instance.new("ScreenGui")
WermUI.Name = "WermUI"
WermUI.Enabled = false

-- Create main structure
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 500, 0, 475)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Main

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(50, 50, 50)
UIStroke.Thickness = 1
UIStroke.Parent = Main

-- Create shadow (using a proper method)
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(20, 20, 20)
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.Parent = Main

-- Topbar
local Topbar = Instance.new("Frame")
Topbar.Name = "Topbar"
Topbar.Size = UDim2.new(1, 0, 0, 45)
Topbar.Position = UDim2.new(0, 0, 0, 0)
Topbar.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Topbar.BorderSizePixel = 0

local TopbarCorner = Instance.new("UICorner")
TopbarCorner.CornerRadius = UDim.new(0, 8)
TopbarCorner.Parent = Topbar

local TopbarStroke = Instance.new("UIStroke")
TopbarStroke.Color = Color3.fromRGB(50, 50, 50)
TopbarStroke.Thickness = 1
TopbarStroke.Parent = Topbar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Werm UI"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.Font = Enum.Font.GothamSemibold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Topbar

local Divider = Instance.new("Frame")
Divider.Name = "Divider"
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.Position = UDim2.new(0, 0, 1, 0)
Divider.AnchorPoint = Vector2.new(0, 1)
Divider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Divider.BorderSizePixel = 0
Divider.Parent = Topbar

-- Topbar buttons
local HideButton = Instance.new("ImageButton")
HideButton.Name = "Hide"
HideButton.Size = UDim2.new(0, 20, 0, 20)
HideButton.Position = UDim2.new(1, -30, 0.5, 0)
HideButton.AnchorPoint = Vector2.new(1, 0.5)
HideButton.BackgroundTransparency = 1
HideButton.Image = "rbxassetid://10734961427"
HideButton.ImageColor3 = Color3.fromRGB(240, 240, 240)
HideButton.Parent = Topbar

local ChangeSizeButton = Instance.new("ImageButton")
ChangeSizeButton.Name = "ChangeSize"
ChangeSizeButton.Size = UDim2.new(0, 20, 0, 20)
ChangeSizeButton.Position = UDim2.new(1, -60, 0.5, 0)
ChangeSizeButton.AnchorPoint = Vector2.new(1, 0.5)
ChangeSizeButton.BackgroundTransparency = 1
ChangeSizeButton.Image = "rbxassetid://10137941941"
ChangeSizeButton.ImageColor3 = Color3.fromRGB(240, 240, 240)
ChangeSizeButton.Parent = Topbar

local ThemeButton = Instance.new("ImageButton")
ThemeButton.Name = "Theme"
ThemeButton.Size = UDim2.new(0, 20, 0, 20)
ThemeButton.Position = UDim2.new(1, -90, 0.5, 0)
ThemeButton.AnchorPoint = Vector2.new(1, 0.5)
ThemeButton.BackgroundTransparency = 1
ThemeButton.Image = "rbxassetid://10734962188"
ThemeButton.ImageColor3 = Color3.fromRGB(240, 240, 240)
ThemeButton.Parent = Topbar

-- Corner repair for topbar
local CornerRepair = Instance.new("Frame")
CornerRepair.Name = "CornerRepair"
CornerRepair.Size = UDim2.new(0, 8, 0, 8)
CornerRepair.Position = UDim2.new(1, 0, 1, 0)
CornerRepair.AnchorPoint = Vector2.new(1, 1)
CornerRepair.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
CornerRepair.BorderSizePixel = 0
CornerRepair.Parent = Topbar

-- Tab list
local TabList = Instance.new("Frame")
TabList.Name = "TabList"
TabList.Size = UDim2.new(0, 150, 0, 400)
TabList.Position = UDim2.new(0, 0, 0, 45)
TabList.BackgroundTransparency = 1
TabList.Parent = Main

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Parent = TabList

-- Elements area
local Elements = Instance.new("Frame")
Elements.Name = "Elements"
Elements.Size = UDim2.new(1, -160, 1, -55)
Elements.Position = UDim2.new(0, 150, 0, 45)
Elements.BackgroundTransparency = 1
Elements.Parent = Main

local ElementsScrolling = Instance.new("ScrollingFrame")
ElementsScrolling.Size = UDim2.new(1, 0, 1, 0)
ElementsScrolling.BackgroundTransparency = 1
ElementsScrolling.BorderSizePixel = 0
ElementsScrolling.ScrollBarThickness = 3
ElementsScrolling.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ElementsScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
ElementsScrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y
ElementsScrolling.Parent = Elements

local ElementsLayout = Instance.new("UIListLayout")
ElementsLayout.Padding = UDim.new(0, 10)
ElementsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ElementsLayout.VerticalAlignment = Enum.VerticalAlignment.Top
ElementsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ElementsLayout.Parent = ElementsScrolling

-- Loading frame
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = Main

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 8)
LoadingCorner.Parent = LoadingFrame

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Name = "Title"
LoadingTitle.Size = UDim2.new(1, 0, 0, 30)
LoadingTitle.Position = UDim2.new(0.5, 0, 0.4, 0)
LoadingTitle.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Text = "Werm UI Interface Suite"
LoadingTitle.TextColor3 = Color3.fromRGB(240, 240, 240)
LoadingTitle.Font = Enum.Font.GothamSemibold
LoadingTitle.TextSize = 24
LoadingTitle.Parent = LoadingFrame

local LoadingSubtitle = Instance.new("TextLabel")
LoadingSubtitle.Name = "Subtitle"
LoadingSubtitle.Size = UDim2.new(1, 0, 0, 20)
LoadingSubtitle.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingSubtitle.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingSubtitle.BackgroundTransparency = 1
LoadingSubtitle.Text = "by Sirius"
LoadingSubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
LoadingSubtitle.Font = Enum.Font.Gotham
LoadingSubtitle.TextSize = 14
LoadingSubtitle.Parent = LoadingFrame

local LoadingVersion = Instance.new("TextLabel")
LoadingVersion.Name = "Version"
LoadingVersion.Size = UDim2.new(1, 0, 0, 16)
LoadingVersion.Position = UDim2.new(0.5, 0, 0.9, 0)
LoadingVersion.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingVersion.BackgroundTransparency = 1
LoadingTitle.Text = Release
LoadingVersion.TextColor3 = Color3.fromRGB(150, 150, 150)
LoadingVersion.Font = Enum.Font.Gotham
LoadingVersion.TextSize = 12
LoadingVersion.Parent = LoadingFrame

-- Notifications
local Notifications = Instance.new("Frame")
Notifications.Name = "Notifications"
Notifications.Size = UDim2.new(1, 0, 1, 0)
Notifications.BackgroundTransparency = 1
Notifications.Parent = WermUI

-- Assemble UI
Topbar.Parent = Main
TabList.Parent = Main
Elements.Parent = Main
LoadingFrame.Parent = Main
Main.Parent = WermUI

-- Parent UI to CoreGui
if gethui then
	WermUI.Parent = gethui()
elseif syn and syn.protect_gui then 
	syn.protect_gui(WermUI)
	WermUI.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
	WermUI.Parent = CoreGui:FindFirstChild("RobloxGui")
else
	WermUI.Parent = CoreGui
end

if gethui then
	for _, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == WermUI.Name and Interface ~= WermUI then
			Interface.Enabled = false
			Interface.Name = "WermUI-Old"
		end
	end
else
	for _, Interface in ipairs(CoreGui:GetChildren()) do
		if Interface.Name == WermUI.Name and Interface ~= WermUI then
			Interface.Enabled = false
			Interface.Name = "WermUI-Old"
		end
	end
end

-- Object Variables
local Camera = workspace.CurrentCamera

-- Variables
local request = (syn and syn.request) or (http and http.request) or http_request
local CFileName = nil
local CEnabled = false
local Minimised = false
local Hidden = false
local Debounce = false

local SelectedTheme = WermUILibrary.Theme.Default

-- Make UI transparent
Main.BackgroundTransparency = 0.2
Topbar.BackgroundTransparency = 0.2
Elements.BackgroundTransparency = 0.2

function ChangeTheme(ThemeName)
	if WermUILibrary.Theme[ThemeName] then
		SelectedTheme = WermUILibrary.Theme[ThemeName]
		
		-- Apply theme to all UI elements
		Main.BackgroundColor3 = SelectedTheme.Background
		Topbar.BackgroundColor3 = SelectedTheme.Topbar
		CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
		Shadow.ImageColor3 = SelectedTheme.Shadow
		
		-- Apply to text elements
		Title.TextColor3 = SelectedTheme.TextColor
		Title.Font = SelectedTheme.TextFont
		LoadingTitle.TextColor3 = SelectedTheme.TextColor
		LoadingTitle.Font = SelectedTheme.TextFont
		LoadingSubtitle.TextColor3 = SelectedTheme.TextColor
		LoadingSubtitle.Font = SelectedTheme.TextFont
		LoadingVersion.TextColor3 = SelectedTheme.TextColor
		LoadingVersion.Font = SelectedTheme.TextFont
		
		-- Apply to buttons
		HideButton.ImageColor3 = SelectedTheme.TextColor
		ChangeSizeButton.ImageColor3 = SelectedTheme.TextColor
		ThemeButton.ImageColor3 = SelectedTheme.TextColor
		
		-- Apply stroke colors
		UIStroke.Color = SelectedTheme.ElementStroke
		TopbarStroke.Color = SelectedTheme.ElementStroke
		
		WermUILibrary:Notify({Title = "Theme Changed", Content = "Theme has been changed to " .. ThemeName})
	end
end

local function AddDraggingFunctionality(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = false
		DragPoint.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
			end
		end)
	end)
end   

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end    

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadConfiguration(Configuration)
	local Data = HttpService:JSONDecode(Configuration)
	for FlagName, FlagValue in next, Data do
		if WermUILibrary.Flags[FlagName] then
			spawn(function() 
				if WermUILibrary.Flags[FlagName].Type == "ColorPicker" then
					WermUILibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
				else
					if WermUILibrary.Flags[FlagName].CurrentValue or WermUILibrary.Flags[FlagName].CurrentKeybind or WermUILibrary.Flags[FlagName].CurrentOption or WermUILibrary.Flags[FlagName].Color ~= FlagValue then 
						WermUILibrary.Flags[FlagName]:Set(FlagValue) 
					end
				end    
			end)
		else
			WermUILibrary:Notify({Title = "Flag Error", Content = "WermUI was unable to find '"..FlagName.. "'' in the current script"})
		end
	end
end

local function SaveConfiguration()
	if not CEnabled then return end
	local Data = {}
	for i,v in pairs(WermUILibrary.Flags) do
		if v.Type == "ColorPicker" then
			Data[i] = PackColor(v.Color)
		else
			Data[i] = v.CurrentValue or v.CurrentKeybind or v.CurrentOption or v.Color
		end
	end	
	if writefile then
		writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
	end
end

-- Simple neon module replacement
local neon = {
	Frames = {}
}

function neon:BindFrame(Frame, Properties)
	if not Frame then return end
	self.Frames[Frame] = Properties or {}
end

function neon:UnbindFrame(Frame)
	if not Frame then return end
	self.Frames[Frame] = nil
end

function WermUILibrary:Notify(NotificationSettings)
	spawn(function()
		local ActionCompleted = true
		
		-- Create notification frame
		local Notification = Instance.new("Frame")
		Notification.Name = "Notification"
		Notification.Size = UDim2.new(0, 295, 0, 91)
		Notification.Position = UDim2.new(0.5, 0, 0.915, 0)
		Notification.AnchorPoint = Vector2.new(0.5, 0.5)
		Notification.BackgroundColor3 = SelectedTheme.NotificationBackground
		Notification.BackgroundTransparency = 1
		Notification.BorderSizePixel = 0
		
		local NotificationCorner = Instance.new("UICorner")
		NotificationCorner.CornerRadius = UDim.new(0, 8)
		NotificationCorner.Parent = Notification
		
		local NotificationStroke = Instance.new("UIStroke")
		NotificationStroke.Color = SelectedTheme.ElementStroke
		NotificationStroke.Thickness = 1
		NotificationStroke.Parent = Notification
		
		-- Icon
		local Icon = Instance.new("ImageLabel")
		Icon.Name = "Icon"
		Icon.Size = UDim2.new(0, 50, 0, 50)
		Icon.Position = UDim2.new(0, 15, 0.5, 0)
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundTransparency = 1
		Icon.Image = "rbxassetid://3944680095"
		Icon.ImageColor3 = SelectedTheme.TextColor
		Icon.ImageTransparency = 1
		Icon.Parent = Notification
		
		-- Title
		local NotifTitle = Instance.new("TextLabel")
		NotifTitle.Name = "Title"
		NotifTitle.Size = UDim2.new(1, -80, 0, 25)
		NotifTitle.Position = UDim2.new(0, 75, 0, 15)
		NotifTitle.BackgroundTransparency = 1
		NotifTitle.Text = NotificationSettings.Title or "Unknown"
		NotifTitle.TextColor3 = SelectedTheme.TextColor
		NotifTitle.Font = SelectedTheme.TextFont
		NotifTitle.TextSize = 16
		NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
		NotifTitle.TextTransparency = 1
		NotifTitle.Parent = Notification
		
		-- Description
		local Description = Instance.new("TextLabel")
		Description.Name = "Description"
		Description.Size = UDim2.new(1, -80, 0, 40)
		Description.Position = UDim2.new(0, 75, 0, 40)
		Description.BackgroundTransparency = 1
		Description.Text = NotificationSettings.Content or "Unknown"
		Description.TextColor3 = SelectedTheme.TextColor
		Description.Font = SelectedTheme.TextFont
		Description.TextSize = 14
		Description.TextXAlignment = Enum.TextXAlignment.Left
		Description.TextYAlignment = Enum.TextYAlignment.Top
		Description.TextWrapped = true
		Description.TextTransparency = 1
		Description.Parent = Notification
		
		Notification.Parent = Notifications
		
		-- Animation
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
		wait(0.3)
		TweenService:Create(Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		TweenService:Create(NotifTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		TweenService:Create(Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
		
		wait(NotificationSettings.Duration or NotificationDuration)
		
		-- Hide animation
		TweenService:Create(Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
		TweenService:Create(NotifTitle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		TweenService:Create(Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		wait(0.9)
		Notification:Destroy()
	end)
end

function Hide()
	Debounce = true
	WermUILibrary:Notify({Title = "Interface Hidden", Content = "The interface has been hidden, you can unhide the interface by tapping K", Duration = 7})
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(Shadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(TopbarStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	
	for _, TopbarButton in ipairs({HideButton, ChangeSizeButton, ThemeButton}) do
		TweenService:Create(TopbarButton, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	end
	
	wait(0.5)
	Main.Visible = false
	Debounce = false
end

function Unhide()
	Debounce = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Visible = true
	TweenService:Create(Shadow, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	
	if Minimised then
		spawn(Maximise)
	end
	
	for _, TopbarButton in ipairs({HideButton, ChangeSizeButton, ThemeButton}) do
		TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	end
	
	wait(0.5)
	Minimised = false
	Debounce = false
end

function Maximise()
	Debounce = true
	ChangeSizeButton.Image = "rbxassetid://10137941941"

	TweenService:Create(TopbarStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Shadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45)}):Play()
	TabList.Visible = true
	
	wait(0.2)
	Elements.Visible = true
	wait(0.5)
	Debounce = false
end

function Minimise()
	Debounce = true
	ChangeSizeButton.Image = "rbxassetid://11036884234"

	TweenService:Create(TopbarStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(Shadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()

	wait(0.3)
	Elements.Visible = false
	TabList.Visible = false
	wait(0.2)
	Debounce = false
end

function WermUILibrary:CreateWindow(Settings)
	local Passthrough = false
	Title.Text = Settings.Name
	Main.Size = UDim2.new(0, 450, 0, 260)
	Main.Visible = true
	Main.BackgroundTransparency = 1
	LoadingTitle.TextTransparency = 1
	LoadingSubtitle.TextTransparency = 1
	Shadow.ImageTransparency = 1
	LoadingVersion.TextTransparency = 1
	LoadingTitle.Text = Settings.LoadingTitle or "Werm UI Interface Suite"
	LoadingSubtitle.Text = Settings.LoadingSubtitle or "by Sirius"
	if Settings.LoadingTitle ~= "Werm UI Interface Suite" then
		LoadingVersion.Text = "Werm UI"
	end
	Topbar.Visible = false
	Elements.Visible = false
	LoadingFrame.Visible = true

	pcall(function()
		if not Settings.ConfigurationSaving then
			Settings.ConfigurationSaving = {}
		end
		if not Settings.ConfigurationSaving.FileName then
			Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
		end
		if Settings.ConfigurationSaving.Enabled == nil then
			Settings.ConfigurationSaving.Enabled = false
		end
		CFileName = Settings.ConfigurationSaving.FileName
		ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
		CEnabled = Settings.ConfigurationSaving.Enabled

		if Settings.ConfigurationSaving.Enabled then
			if makefolder and not isfolder(ConfigurationFolder) then
				makefolder(ConfigurationFolder)
			end	
		end
	end)

	AddDraggingFunctionality(Topbar,Main)

	Notifications.Visible = true
	WermUI.Enabled = true
	
	wait(0.5)
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
	TweenService:Create(Shadow, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.55}):Play()
	wait(0.1)
	TweenService:Create(LoadingTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingSubtitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingVersion, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

	-- Tab
	local FirstTab = false
	local Window = {}
	
	function Window:CreateTab(Name,Image)
		local SDone = false
		
		-- Create tab button
		local TabButton = Instance.new("Frame")
		TabButton.Name = Name
		TabButton.Size = UDim2.new(0.9, 0, 0, 30)
		TabButton.BackgroundColor3 = SelectedTheme.TabBackground
		TabButton.BackgroundTransparency = 1
		TabButton.BorderSizePixel = 0
		
		local TabButtonCorner = Instance.new("UICorner")
		TabButtonCorner.CornerRadius = UDim.new(0, 6)
		TabButtonCorner.Parent = TabButton
		
		local TabButtonStroke = Instance.new("UIStroke")
		TabButtonStroke.Color = SelectedTheme.TabStroke
		TabButtonStroke.Thickness = 1
		TabButtonStroke.Transparency = 1
		TabButtonStroke.Parent = TabButton
		
		local TabButtonTitle = Instance.new("TextLabel")
		TabButtonTitle.Name = "Title"
		TabButtonTitle.Size = UDim2.new(1, 0, 1, 0)
		TabButtonTitle.BackgroundTransparency = 1
		TabButtonTitle.Text = Name
		TabButtonTitle.TextColor3 = SelectedTheme.TabTextColor
		TabButtonTitle.Font = SelectedTheme.TextFont
		TabButtonTitle.TextSize = 14
		TabButtonTitle.TextTransparency = 1
		TabButtonTitle.Parent = TabButton
		
		local TabButtonInteract = Instance.new("TextButton")
		TabButtonInteract.Name = "Interact"
		TabButtonInteract.Size = UDim2.new(1, 0, 1, 0)
		TabButtonInteract.BackgroundTransparency = 1
		TabButtonInteract.Text = ""
		TabButtonInteract.Parent = TabButton
		
		TabButton.Parent = TabList
		
		-- Create tab page
		local TabPage = Instance.new("ScrollingFrame")
		TabPage.Name = Name
		TabPage.Size = UDim2.new(1, 0, 1, 0)
		TabPage.BackgroundTransparency = 1
		TabPage.BorderSizePixel = 0
		TabPage.ScrollBarThickness = 3
		TabPage.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
		TabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
		TabPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
		TabPage.Visible = false
		TabPage.Parent = ElementsScrolling
		
		local TabPageLayout = Instance.new("UIListLayout")
		TabPageLayout.Padding = UDim.new(0, 10)
		TabPageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		TabPageLayout.VerticalAlignment = Enum.VerticalAlignment.Top
		TabPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
		TabPageLayout.Parent = TabPage
		
		if not FirstTab then
			FirstTab = true
			TabPage.Visible = true
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TabButtonTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TabButtonStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
			TabButtonTitle.TextColor3 = SelectedTheme.SelectedTabTextColor
		else
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
			TweenService:Create(TabButtonTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
			TweenService:Create(TabButtonStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
		end
		
		TabButtonInteract.MouseButton1Click:Connect(function()
			if Minimised then return end
			
			-- Hide all other tab pages
			for _, OtherTabPage in ipairs(ElementsScrolling:GetChildren()) do
				if OtherTabPage:IsA("ScrollingFrame") then
					OtherTabPage.Visible = false
				end
			end
			
			-- Show this tab page
			TabPage.Visible = true
			
			-- Update tab button appearances
			for _, OtherTabButton in ipairs(TabList:GetChildren()) do
				if OtherTabButton:IsA("Frame") and OtherTabButton ~= TabButton then
					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackground}):Play()
					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.TabTextColor}):Play()
					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
					TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
			end
			
			-- Highlight this tab button
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TabButtonStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(TabButtonTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
			TweenService:Create(TabButtonTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
		end)

		local Tab = {}

		-- Button element
		function Tab:CreateButton(ButtonSettings)
			local ButtonValue = {}

			local Button = Instance.new("Frame")
			Button.Name = ButtonSettings.Name
			Button.Size = UDim2.new(1, -10, 0, 40)
			Button.BackgroundColor3 = SelectedTheme.ElementBackground
			Button.BackgroundTransparency = 1
			Button.BorderSizePixel = 0
			
			local ButtonCorner = Instance.new("UICorner")
			ButtonCorner.CornerRadius = UDim.new(0, 6)
			ButtonCorner.Parent = Button
			
			local ButtonStroke = Instance.new("UIStroke")
			ButtonStroke.Color = SelectedTheme.ElementStroke
			ButtonStroke.Thickness = 1
			ButtonStroke.Transparency = 1
			ButtonStroke.Parent = Button
			
			local ButtonTitle = Instance.new("TextLabel")
			ButtonTitle.Name = "Title"
			ButtonTitle.Size = UDim2.new(1, 0, 1, 0)
			ButtonTitle.BackgroundTransparency = 1
			ButtonTitle.Text = ButtonSettings.Name
			ButtonTitle.TextColor3 = SelectedTheme.TextColor
			ButtonTitle.Font = SelectedTheme.TextFont
			ButtonTitle.TextSize = 14
			ButtonTitle.TextTransparency = 1
			ButtonTitle.Parent = Button
			
			local ButtonInteract = Instance.new("TextButton")
			ButtonInteract.Name = "Interact"
			ButtonInteract.Size = UDim2.new(1, 0, 1, 0)
			ButtonInteract.BackgroundTransparency = 1
			ButtonInteract.Text = ""
			ButtonInteract.Parent = Button
			
			Button.Parent = TabPage
			
			TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(ButtonStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(ButtonTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			ButtonInteract.MouseButton1Click:Connect(function()
				local Success, Response = pcall(ButtonSettings.Callback)
				if not Success then
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(ButtonStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					ButtonTitle.Text = "Callback Error"
					print("WermUI | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					ButtonTitle.Text = ButtonSettings.Name
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(ButtonStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				else
					SaveConfiguration()
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(ButtonStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					wait(0.2)
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(ButtonStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
			end)

			ButtonInteract.MouseEnter:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			ButtonInteract.MouseLeave:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			function ButtonValue:Set(NewButton)
				ButtonTitle.Text = NewButton
				Button.Name = NewButton
			end

			return ButtonValue
		end

		-- Label element
		function Tab:CreateLabel(LabelText)
			local LabelValue = {}

			local Label = Instance.new("Frame")
			Label.Name = "Label"
			Label.Size = UDim2.new(1, -10, 0, 30)
			Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Label.BackgroundTransparency = 1
			Label.BorderSizePixel = 0
			
			local LabelCorner = Instance.new("UICorner")
			LabelCorner.CornerRadius = UDim.new(0, 6)
			LabelCorner.Parent = Label
			
			local LabelStroke = Instance.new("UIStroke")
			LabelStroke.Color = SelectedTheme.SecondaryElementStroke
			LabelStroke.Thickness = 1
			LabelStroke.Transparency = 1
			LabelStroke.Parent = Label
			
			local LabelTitle = Instance.new("TextLabel")
			LabelTitle.Name = "Title"
			LabelTitle.Size = UDim2.new(1, 0, 1, 0)
			LabelTitle.BackgroundTransparency = 1
			LabelTitle.Text = LabelText
			LabelTitle.TextColor3 = SelectedTheme.TextColor
			LabelTitle.Font = SelectedTheme.TextFont
			LabelTitle.TextSize = 14
			LabelTitle.TextTransparency = 1
			LabelTitle.Parent = Label
			
			Label.Parent = TabPage

			TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(LabelStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(LabelTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			function LabelValue:Set(NewLabel)
				LabelTitle.Text = NewLabel
			end

			return LabelValue
		end

		-- Section element
		function Tab:CreateSection(SectionName)
			local SectionValue = {}

			if SDone then
				local SectionSpace = Instance.new("Frame")
				SectionSpace.Name = "SectionSpacing"
				SectionSpace.Size = UDim2.new(1, -10, 0, 10)
				SectionSpace.BackgroundTransparency = 1
				SectionSpace.BorderSizePixel = 0
				SectionSpace.Parent = TabPage
			end

			local Section = Instance.new("Frame")
			Section.Name = "SectionTitle"
			Section.Size = UDim2.new(1, -10, 0, 25)
			Section.BackgroundTransparency = 1
			Section.BorderSizePixel = 0
			
			local SectionTitle = Instance.new("TextLabel")
			SectionTitle.Name = "Title"
			SectionTitle.Size = UDim2.new(1, 0, 1, 0)
			SectionTitle.BackgroundTransparency = 1
			SectionTitle.Text = SectionName
			SectionTitle.TextColor3 = SelectedTheme.TextColor
			SectionTitle.Font = SelectedTheme.TextFont
			SectionTitle.TextSize = 16
			SectionTitle.TextTransparency = 1
			SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
			SectionTitle.Parent = Section
			
			Section.Parent = TabPage

			SectionTitle.TextTransparency = 1
			TweenService:Create(SectionTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

			function SectionValue:Set(NewSection)
				SectionTitle.Text = NewSection
			end

			SDone = true

			return SectionValue
		end

		-- Toggle element
		function Tab:CreateToggle(ToggleSettings)
			local ToggleValue = {}

			local Toggle = Instance.new("Frame")
			Toggle.Name = ToggleSettings.Name
			Toggle.Size = UDim2.new(1, -10, 0, 40)
			Toggle.BackgroundColor3 = SelectedTheme.ElementBackground
			Toggle.BackgroundTransparency = 1
			Toggle.BorderSizePixel = 0
			
			local ToggleCorner = Instance.new("UICorner")
			ToggleCorner.CornerRadius = UDim.new(0, 6)
			ToggleCorner.Parent = Toggle
			
			local ToggleStroke = Instance.new("UIStroke")
			ToggleStroke.Color = SelectedTheme.ElementStroke
			ToggleStroke.Thickness = 1
			ToggleStroke.Transparency = 1
			ToggleStroke.Parent = Toggle
			
			local ToggleTitle = Instance.new("TextLabel")
			ToggleTitle.Name = "Title"
			ToggleTitle.Size = UDim2.new(0.7, 0, 1, 0)
			ToggleTitle.BackgroundTransparency = 1
			ToggleTitle.Text = ToggleSettings.Name
			ToggleTitle.TextColor3 = SelectedTheme.TextColor
			ToggleTitle.Font = SelectedTheme.TextFont
			ToggleTitle.TextSize = 14
			ToggleTitle.TextTransparency = 1
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
			ToggleTitle.Parent = Toggle
			
			local ToggleSwitch = Instance.new("Frame")
			ToggleSwitch.Name = "Switch"
			ToggleSwitch.Size = UDim2.new(0, 50, 0, 25)
			ToggleSwitch.Position = UDim2.new(1, -10, 0.5, 0)
			ToggleSwitch.AnchorPoint = Vector2.new(1, 0.5)
			ToggleSwitch.BackgroundColor3 = SelectedTheme.ToggleBackground
			ToggleSwitch.BorderSizePixel = 0
			
			local ToggleSwitchCorner = Instance.new("UICorner")
			ToggleSwitchCorner.CornerRadius = UDim.new(1, 0)
			ToggleSwitchCorner.Parent = ToggleSwitch
			
			local ToggleSwitchStroke = Instance.new("UIStroke")
			ToggleSwitchStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
			ToggleSwitchStroke.Thickness = 2
			ToggleSwitchStroke.Parent = ToggleSwitch
			
			local ToggleIndicator = Instance.new("Frame")
			ToggleIndicator.Name = "Indicator"
			ToggleIndicator.Size = UDim2.new(0, 17, 0, 17)
			ToggleIndicator.Position = UDim2.new(1, -40, 0.5, 0)
			ToggleIndicator.AnchorPoint = Vector2.new(1, 0.5)
			ToggleIndicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
			ToggleIndicator.BorderSizePixel = 0
			
			local ToggleIndicatorCorner = Instance.new("UICorner")
			ToggleIndicatorCorner.CornerRadius = UDim.new(1, 0)
			ToggleIndicatorCorner.Parent = ToggleIndicator
			
			local ToggleIndicatorStroke = Instance.new("UIStroke")
			ToggleIndicatorStroke.Color = SelectedTheme.ToggleDisabledStroke
			ToggleIndicatorStroke.Thickness = 1
			ToggleIndicatorStroke.Parent = ToggleIndicator
			
			ToggleIndicator.Parent = ToggleSwitch
			ToggleSwitch.Parent = Toggle
			
			local ToggleInteract = Instance.new("TextButton")
			ToggleInteract.Name = "Interact"
			ToggleInteract.Size = UDim2.new(1, 0, 1, 0)
			ToggleInteract.BackgroundTransparency = 1
			ToggleInteract.Text = ""
			ToggleInteract.Parent = Toggle
			
			Toggle.Parent = TabPage
			
			TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(ToggleStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(ToggleTitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			if ToggleSettings.CurrentValue then
				ToggleIndicator.Position = UDim2.new(1, -20, 0.5, 0)
				ToggleIndicatorStroke.Color = SelectedTheme.ToggleEnabledStroke
				ToggleIndicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
				ToggleSwitchStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
			end

			ToggleInteract.MouseButton1Click:Connect(function()
				if ToggleSettings.CurrentValue then
					ToggleSettings.CurrentValue = false
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(ToggleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
					TweenService:Create(ToggleIndicatorStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
					TweenService:Create(ToggleSwitchStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(ToggleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
				else
					ToggleSettings.CurrentValue = true
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(ToggleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
					TweenService:Create(ToggleIndicatorStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
					TweenService:Create(ToggleSwitchStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(ToggleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()		
				end

				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(ToggleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					ToggleTitle.Text = "Callback Error"
					print("WermUI | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					ToggleTitle.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(ToggleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end

				SaveConfiguration()
			end)

			ToggleInteract.MouseEnter:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			ToggleInteract.MouseLeave:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			function ToggleSettings:Set(NewToggleValue)
				if NewToggleValue then
					ToggleSettings.CurrentValue = true
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
					TweenService:Create(ToggleIndicatorStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
					TweenService:Create(ToggleSwitchStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
				else
					ToggleSettings.CurrentValue = false
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
					TweenService:Create(ToggleIndicatorStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
					TweenService:Create(ToggleIndicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
					TweenService:Create(ToggleSwitchStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
				end
				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					ToggleTitle.Text = "Callback Error"
					wait(0.5)
					ToggleTitle.Text = ToggleSettings.Name
				end
				SaveConfiguration()
			end

			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
					WermUILibrary.Flags[ToggleSettings.Flag] = ToggleSettings
				end
			end

			return ToggleSettings
		end

		return Tab
	end

	Elements.Visible = true

	wait(0.7)
	TweenService:Create(LoadingTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingSubtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingVersion, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	wait(0.2)
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	TweenService:Create(Shadow, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()

	Topbar.BackgroundTransparency = 1
	Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
	Topbar.CornerRepair.BackgroundTransparency = 1
	Title.TextTransparency = 1
	ThemeButton.ImageTransparency = 1
	ChangeSizeButton.ImageTransparency = 1
	HideButton.ImageTransparency = 1

	wait(0.5)
	Topbar.Visible = true
	TweenService:Create(Topbar, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Divider, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 0, 1)}):Play()
	wait(0.1)
	TweenService:Create(Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.1)
	TweenService:Create(ThemeButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.1)
	TweenService:Create(ChangeSizeButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.1)
	TweenService:Create(HideButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.3)

	return Window
end

function WermUILibrary:Destroy()
	WermUI:Destroy()
end

ChangeSizeButton.MouseButton1Click:Connect(function()
	if Debounce then return end
	if Minimised then
		Minimised = false
		Maximise()
	else
		Minimised = true
		Minimise()
	end
end)

HideButton.MouseButton1Click:Connect(function()
	if Debounce then return end
	if Hidden then
		Hidden = false
		Minimised = false
		Unhide()
	else
		Hidden = true
		Hide()
	end
end)

ThemeButton.MouseButton1Click:Connect(function()
	-- Cycle through themes
	local themes = {"Default", "Light", "Dark", "White", "Purple", "Red", "Yellow"}
	local currentIndex = 1
	for i, theme in ipairs(themes) do
		if SelectedTheme == WermUILibrary.Theme[theme] then
			currentIndex = i
			break
		end
	end
	
	local nextIndex = currentIndex % #themes + 1
	ChangeTheme(themes[nextIndex])
end)

UserInputService.InputBegan:Connect(function(input, processed)
	if (input.KeyCode == Enum.KeyCode.K and not processed) then
		if Debounce then return end
		if Hidden then
			Hidden = false
			Unhide()
		else
			Hidden = true
			Hide()
		end
	end
end)

for _, TopbarButton in ipairs({HideButton, ChangeSizeButton, ThemeButton}) do
	TopbarButton.MouseEnter:Connect(function()
		TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
	end)

	TopbarButton.MouseLeave:Connect(function()
		TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	end)

	TopbarButton.MouseButton1Click:Connect(function()
		TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	end)
end

function WermUILibrary:LoadConfiguration()
	if CEnabled then
		pcall(function()
			if readfile and isfile and isfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension) then
				LoadConfiguration(readfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension))
				WermUILibrary:Notify({Title = "Configuration Loaded", Content = "The configuration file for this script has been loaded from a previous session"})
			end
		end)
	end
end

task.delay(3.5, WermUILibrary.LoadConfiguration, WermUILibrary)

return WermUILibrary
