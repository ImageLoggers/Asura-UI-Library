-- Asura UI Library - Advanced Features Example
local AsuraUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/Asura-UI-Library/main/src/Asura-UI-Library.lua"))()

local UI = AsuraUI:Create()
local Window = UI:CreateWindow("Advanced Features", "Showcasing All Elements")

local AdvancedTab = UI:CreateTab(Window, "Advanced", "🚀")

-- Dynamic UI Updates
UI:CreateSection(AdvancedTab, "Dynamic Controls")

local Counter = 0
local CounterLabel = UI:CreateButton(AdvancedTab, "Counter: 0", function()
    Counter = Counter + 1
    -- Note: You'd need to extend the library to update button text dynamically
    UI:Notify("Counter", "Count: " .. Counter, 2)
end)

-- Multiple Sliders
UI:CreateSection(AdvancedTab, "Multiple Sliders")

local JumpPowerSlider = UI:CreateSlider(AdvancedTab, "Jump Power", 50, 200, 50, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

local FOVSlider = UI:CreateSlider(AdvancedTab, "Camera FOV", 70, 120, 70, function(value)
    game.Workspace.CurrentCamera.FieldOfView = value
end)

-- Complex Dropdown
UI:CreateSection(AdvancedTab, "Game Features")

local GameModes = {"Normal", "Creative", "Hardcore", "Peaceful"}
UI:CreateDropdown(AdvancedTab, "Game Mode", GameModes, "Normal", function(mode)
    UI:Notify("Game Mode", "Changed to " .. mode .. " mode", 3)
end)

-- Color Picker with Presets
UI:CreateSection(AdvancedTab, "Customization")

UI:CreateColorPicker(AdvancedTab, "UI Accent Color", Color3.fromRGB(255, 105, 180), function(color)
    -- Note: You'd need to extend the library to apply color dynamically
    UI:Notify("Color Applied", "New accent color set!", 2)
end)

-- Keybind System
UI:CreateSection(AdvancedTab, "Keybinds")

UI:CreateKeybind(AdvancedTab, "Toggle Fly", Enum.KeyCode.F, function()
    UI:Notify("Fly Mode", "Toggled fly mode", 2)
    -- Add your fly functionality here
end)

UI:CreateKeybind(AdvancedTab, "Speed Boost", Enum.KeyCode.LeftShift, function()
    UI:Notify("Speed Boost", "Activated speed boost", 2)
    -- Add your speed boost functionality here
end)

-- Notifications Demo
UI:CreateSection(AdvancedTab, "Notifications")

UI:CreateButton(AdvancedTab, "Show Success", function()
    UI:Notify("SUCCESS", "Operation completed successfully! 🎉", 4)
end)

UI:CreateButton(AdvancedTab, "Show Warning", function()
    UI:Notify("WARNING", "This action cannot be undone! ⚠️", 4)
end)

UI:CreateButton(AdvancedTab, "Show Error", function()
    UI:Notify("ERROR", "Something went wrong! ❌", 4)
end)

-- Mobile Features
if UI.IsMobile then
    UI:CreateSection(AdvancedTab, "Mobile Controls")
    
    UI:CreateMobileButton("⚡", function()
        UI:Notify("Mobile", "Boost activated!", 2)
    end)
    
    UI:CreateMobileButton("🛡️", function()
        UI:Notify("Mobile", "Shield toggled!", 2)
    end)
end

UI:Notify("Advanced Demo", "All advanced features loaded! 🚀", 4)
