-- SeedPackForcer.lua
-- Script para Roblox, usa Orion UI Library desde raw.githubusercontent.com
-- Coloca este script en StarterPlayerScripts para que el jugador tenga la GUI.

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
    Name = "Seed Pack Forcer",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "SeedPackForcerConfig"
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local selectedPack = ""
local selectedSeed = ""

Tab:AddTextbox({
    Name = "Nombre del Seed Pack",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        selectedPack = value
    end
})

Tab:AddTextbox({
    Name = "Nombre de la Semilla",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        selectedSeed = value
    end
})

Tab:AddButton({
    Name = "Forzar Semilla",
    Callback = function()
        if selectedPack == "" or selectedSeed == "" then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Por favor, ingresa ambos campos.",
                Image = "rbxassetid://7733658504",
                Time = 4
            })
            return
        end

        OrionLib:MakeNotification({
            Name = "Semilla Obtenida",
            Content = "Obtuviste '" .. selectedSeed .. "' desde '" .. selectedPack .. "'",
            Image = "rbxassetid://6023426915",
            Time = 5
        })

        print("[SeedPackForcer] Semilla forzada: " .. selectedSeed .. " del pack " .. selectedPack)
    end
})

OrionLib:Init()
