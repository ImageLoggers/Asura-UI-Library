-- Basic usage example for Werm UI Library
local WermUILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/your-username/Werm-UI-Library/main/src/WermUILibrary.lua"))()

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
