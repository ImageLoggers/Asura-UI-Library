-- Advanced usage example showing all features
local WermUILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImageLoggers/Werm-UI-Library/main/src/WermUILibrary.lua"))()

local Window = WermUILibrary:CreateWindow({
    Name = "Werm UI - Advanced Example",
    LoadingTitle = "Advanced Features",
    LoadingSubtitle = "Showing all UI elements",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "WermUIAdvanced",
        FileName = "AdvancedConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "abc123",
        RememberJoins = true
    }
})

-- Main Tab with all element types
local MainTab = Window:CreateTab("Main")

MainTab:CreateSection("Text Elements")

local Label = MainTab:CreateLabel("This is a label element")

local Paragraph = MainTab:CreateParagraph({
    Title = "Information Section",
    Content = "This is a paragraph element for displaying longer text content and descriptions. It can contain multiple lines of text and is great for instructions or detailed information."
})

MainTab:CreateSection("Input Elements")

local Input = MainTab:CreateInput({
    Name = "Text Input",
    PlaceholderText = "Enter text here...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        print("Input text:", Text)
    end,
})

local Keybind = MainTab:CreateKeybind({
    Name = "Example Keybind", 
    CurrentKeybind = "G",
    HoldToInteract = false,
    Flag = "ExampleKeybind",
    Callback = function(Value)
        print("Keybind pressed!")
    end,
})

MainTab:CreateSection("Selection Elements")

local Dropdown = MainTab:CreateDropdown({
    Name = "Single Select Dropdown",
    Options = {"Option 1", "Option 2", "Option 3", "Option 4"},
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Flag = "SingleDropdown",
    Callback = function(Option)
        WermUILibrary:Notify({
            Title = "Dropdown Selection",
            Content = "Selected: " .. Option[1],
            Duration = 2
        })
    end,
})

local MultiDropdown = MainTab:CreateDropdown({
    Name = "Multi Select Dropdown", 
    Options = {"Apple", "Banana", "Orange", "Grape", "Strawberry"},
    CurrentOption = {"Apple", "Banana"},
    MultipleOptions = true,
    Flag = "MultiDropdown",
    Callback = function(Options)
        WermUILibrary:Notify({
            Title = "Multiple Selection",
            Content = "Selected: " .. table.concat(Options, ", "),
            Duration = 3
        })
    end,
})

local ColorPicker = MainTab:CreateColorPicker({
    Name = "Color Picker",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "ExampleColor",
    Callback = function(Color)
        print("Selected color:", Color)
    end
})

MainTab:CreateSection("Interactive Elements")

local Toggle1 = MainTab:CreateToggle({
    Name = "Feature Toggle 1",
    CurrentValue = false,
    Flag = "FeatureToggle1",
    Callback = function(Value)
        print("Feature 1:", Value)
    end,
})

local Toggle2 = MainTab:CreateToggle({
    Name = "Feature Toggle 2",
    CurrentValue = true,
    Flag = "FeatureToggle2",
    Callback = function(Value)
        print("Feature 2:", Value)
    end,
})

local Button1 = MainTab:CreateButton({
    Name = "Action Button 1",
    Callback = function()
        WermUILibrary:Notify({
            Title = "Action 1",
            Content = "Button 1 was clicked!",
            Duration = 2
        })
    end,
})

local Button2 = MainTab:CreateButton({
    Name = "Action Button 2",
    Callback = function()
        WermUILibrary:Notify({
            Title = "Action 2",
            Content = "Button 2 was clicked!",
            Duration = 2
        })
    end,
})

local Slider1 = MainTab:CreateSlider({
    Name = "Speed Slider",
    Range = {0, 100},
    Increment = 5,
    Suffix = "km/h",
    CurrentValue = 50,
    Flag = "SpeedSlider",
    Callback = function(Value)
        print("Speed set to:", Value)
    end,
})

local Slider2 = MainTab:CreateSlider({
    Name = "Size Slider",
    Range = {1, 10},
    Increment = 0.1,
    Suffix = "units",
    CurrentValue = 5,
    Flag = "SizeSlider",
    Callback = function(Value)
        print("Size set to:", Value)
    end,
})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")

SettingsTab:CreateSection("UI Information")

local InfoParagraph = SettingsTab:CreateParagraph({
    Title = "About Werm UI", 
    Content = "Werm UI is a modified version of Rayfield with additional themes and transparency features. The UI currently uses the White theme by default and features semi-transparent elements for better visibility."
})

SettingsTab:CreateSection("Configuration")

local ConfigLabel = SettingsTab:CreateLabel("Configuration saving is enabled")
local VersionLabel = SettingsTab:CreateLabel("Version: 1.0.0")

-- Show welcome notification
WermUILibrary:Notify({
    Title = "Advanced Example Loaded",
    Content = "All Werm UI elements are now available!",
    Duration = 5
})
