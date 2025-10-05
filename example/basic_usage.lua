-- Asura UI Library - Basic Usage Example
local AsuraUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/Asura-UI-Library/main/src/Asura-UI-Library.lua"))()

-- Create UI instance
local UI = AsuraUI:Create()

-- Create main window
local Window = UI:CreateWindow("Asura UI Demo", "Feature Showcase")

-- Create tabs
local MainTab = UI:CreateTab(Window, "Main", "🏠")
local VisualTab = UI:CreateTab(Window, "Visual", "🎨")
local SettingsTab = UI:CreateTab(Window, "Settings", "⚙️")

-- Main Tab Elements
UI:CreateSection(MainTab, "Basic Controls")

local ToggleExample = UI:CreateToggle(MainTab, "Enable God Mode", false, function(state)
    UI:Notify("God Mode", state and "Enabled" or "Disabled", 3)
end, "godmode_toggle")

local SliderExample = UI:CreateSlider(MainTab, "Walk Speed", 16, 200, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end, "walkspeed_slider")

UI:CreateButton(MainTab, "Print Hello World", function()
    print("Hello from Asura UI!")
    UI:Notify("Button Clicked", "Hello World!", 3)
end)

-- Visual Tab Elements
UI:CreateSection(VisualTab, "Appearance")

local DropdownExample = UI:CreateDropdown(VisualTab, "Theme Selector", {"Dark", "Light", "Sakura"}, "Dark", function(option)
    UI:SetTheme(option)
    UI:Notify("Theme Changed", "Applied " .. option .. " theme", 2)
end, "selected_theme")

local ColorExample = UI:CreateColorPicker(VisualTab, "Primary Color", Color3.fromRGB(138, 43, 226), function(color)
    UI:Notify("Color Picked", "Selected new primary color", 2)
end, "primary_color")

-- Settings Tab Elements
UI:CreateSection(SettingsTab, "Configuration")

UI:CreateKeybind(SettingsTab, "Toggle UI", Enum.KeyCode.RightShift, function(key)
    Window.MainFrame.Visible = not Window.MainFrame.Visible
    UI:Notify("UI Toggled", "Press " .. key.Name .. " to show/hide", 2)
end, "ui_toggle_key")

UI:CreateButton(SettingsTab, "Save Settings", function()
    UI:SaveSettings()
    UI:Notify("Settings", "All settings saved!", 2)
end)

UI:CreateButton(SettingsTab, "Reset Settings", function()
    UI:ClearSettings()
    UI:Notify("Settings", "All settings reset!", 2)
end)

-- Mobile Support (only creates button if on mobile)
UI:CreateMobileButton("📱", function()
    Window.MainFrame.Visible = not Window.MainFrame.Visible
end)

-- Show welcome notification
UI:Notify("Asura UI Loaded", "Welcome to the demo! Check out all the features.", 5)
