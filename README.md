# YourUILibrary
A modern, feature-rich UI library for Roblox

## Features
- 🎨 Multiple themes (Dark, Light, Sakura)
- 📱 Mobile support
- 💾 Settings saving/loading
- 🔑 Keybind system
- 🔔 Notification system
- 🎛️ Sliders, dropdowns, color pickers
- 🎯 Toggles, buttons, and more!

## Usage

local YourUILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/YourUILibrary/main/src/YourUILibrary.lua"))()

local UI = YourUILibrary:Create()
local Window = UI:CreateWindow("My UI", "Welcome!")
local MainTab = UI:CreateTab(Window, "Main", "🏠")

UI:CreateToggle(MainTab, "Enable Feature", false, function(state)
    print("Toggle:", state)
end, "feature_toggle")
