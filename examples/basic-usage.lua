-- Basic usage example for Werm UI Library
local WermUILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImageLoggers/Werm-UI-Library/main/src/WermUILibrary.lua"))()

local Window = WermUILibrary:CreateWindow({
    Name = "Werm UI - Basic Example",
    LoadingTitle = "Werm UI Library",
    LoadingSubtitle = "Basic Example",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "WermUIExamples",
        FileName = "BasicConfig"
    }
})

local MainTab = Window:CreateTab("Main")

local Section1 = MainTab:CreateSection("Basic Elements")

local Toggle = MainTab:CreateToggle({
    Name = "Example Toggle",
    CurrentValue = false,
    Flag = "ExampleToggle",
    Callback = function(Value)
        print("Toggle:", Value)
        WermUILibrary:Notify({
            Title = "Toggle State",
            Content = "Toggle is now: " .. tostring(Value),
            Duration = 2
        })
    end,
})

local Button = MainTab:CreateButton({
    Name = "Test Button", 
    Callback = function()
        WermUILibrary:Notify({
            Title = "Success!",
            Content = "Button was clicked!",
            Duration = 3
        })
    end
})

local Slider = MainTab:CreateSlider({
    Name = "Example Slider",
    Range = {0, 100},
    Increment = 1,
    Suffix = "units",
    CurrentValue = 50,
    Flag = "ExampleSlider", 
    Callback = function(Value)
        print("Slider value:", Value)
    end,
})

local Section2 = MainTab:CreateSection("Input Elements")

local Input = MainTab:CreateInput({
    Name = "Text Input",
    PlaceholderText = "Enter your text here...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        WermUILibrary:Notify({
            Title = "Input Received",
            Content = "You entered: " .. Text,
            Duration = 3
        })
    end,
})

local Keybind = MainTab:CreateKeybind({
    Name = "Example Keybind", 
    CurrentKeybind = "G",
    HoldToInteract = false,
    Flag = "ExampleKeybind",
    Callback = function(Value)
        WermUILibrary:Notify({
            Title = "Keybind Pressed!",
            Content = "You pressed the keybind!",
            Duration = 2
        })
    end,
})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")

SettingsTab:CreateSection("Information")

local Paragraph = SettingsTab:CreateParagraph({
    Title = "About This Example", 
    Content = "This is a basic example showing the most commonly used Werm UI elements. The UI features multiple themes and semi-transparent elements for better visibility."
})

local Label = SettingsTab:CreateLabel("Werm UI Library v1.0.0")

-- Show welcome notification
WermUILibrary:Notify({
    Title = "Basic Example Loaded",
    Content = "Welcome to Werm UI Basic Example!",
    Duration = 5
})
