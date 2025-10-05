
```markdown
# Werm UI Library

A feature-rich, themable UI library for Roblox scripts, modified from Werm Interface Suite.

## Features

- 🎨 **7 Built-in Themes** (White, Black, Purple, Red, Yellow, Light, Default)
- 🔮 **Semi-transparent UI** - See through the interface
- 📱 **Modern Design** - Clean and professional appearance
- ⚡ **Easy to Use** - Simple and intuitive API
- 🔧 **Fully Customizable** - Extensive theming options
- 💾 **Configuration Saving** - Automatically saves user settings

## Quick Start

```lua
local WermUILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/your-username/Werm-UI-Library/main/src/WermUILibrary.lua"))()

local Window = WermUILibrary:CreateWindow({
    Name = "My Script",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by Developer",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MyConfigs", 
        FileName = "Config"
    }
})

local Tab = Window:CreateTab("Main")
local Toggle = Tab:CreateToggle({
    Name = "My Toggle",
    CurrentValue = false,
    Callback = function(Value)
        print("Toggle:", Value)
    end,
})
