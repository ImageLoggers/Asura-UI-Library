-- Advanced usage example showing all features
local WermUILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/your-username/Werm-UI-Library/main/src/WermUILibrary.lua"))()

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
        Invite = "invite-code", -- Replace with actual invite
        RememberJoins = true
    }
})

-- Main Tab with all element types
local MainTab = Window:CreateTab("Main")

MainTab:CreateSection("Text Elements")

local Label = MainTab:CreateLabel("This is a label")

local Paragraph = MainTab:CreateParagraph({
    Title = "Information",
    Content = "This is a paragraph element for displaying longer text content and descriptions."
})

MainTab:CreateSection("Input Elements")

local Input = MainTab:CreateInput({
    Name = "Text Input",
    PlaceholderText = "Enter text here",
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
    Options = {"Option 1", "Option 2", "Option 3"},
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Flag = "SingleDropdown",
    Callback = function(Option)
        print("Selected:", Option[1])
    end,
})

local MultiDropdown = MainTab:CreateDropdown({
    Name = "Multi Select Dropdown", 
    Options = {"Apple", "Banana", "Orange", "Grape"},
    CurrentOption = {"Apple", "Banana"},
    MultipleOptions = true,
    Flag = "MultiDropdown",
    Callback = function(Options)
        print("Selected options:", table.concat(Options, ", "))
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

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")

SettingsTab:CreateSection("UI Settings")

local InfoParagraph = SettingsTab:CreateParagraph({
    Title = "About Werm UI",
    Content = "Werm UI is a modified version of Rayfield with additional themes and transparency features. Default theme is White."
})
