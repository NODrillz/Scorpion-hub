--[[
    Grow a Garden - Seed Pack Luck Forcer
    Este script crea una interfaz para "simular" que una semilla específica salió de un Seed Pack.
    Colócalo como LocalScript en StarterPlayerScripts.
--]]

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/Orion.lua"))()
local Players = game:GetService("Players")

local selectedPack = "Ninguno"
local desiredSeed = "Ninguna"

local Window = OrionLib:MakeWindow({
    Name = "🌱 SEED PACK LUCK",
    HidePremium = false,
    SaveConfig = false
})

local Tab = Window:MakeTab({
    Name = "Simulador",
    Icon = "rbxassetid://6031265974",
    PremiumOnly = false
})

Tab:AddParagraph("🎮 Forzar Semilla", "Escribe el nombre del pack y la semilla que quieres recibir.")

-- 📦 Entrada manual para el seed pack
Tab:AddTextbox({
    Name = "Nombre del Seed Pack",
    Default = "",
    TextDisappear = false,
    Callback = function(text)
        selectedPack = text
    end
})

-- 🌸 Entrada manual para la semilla deseada
Tab:AddTextbox({
    Name = "Nombre de la Semilla",
    Default = "",
    TextDisappear = false,
    Callback = function(text)
        desiredSeed = text
    end
})

-- 🧪 Botón para forzar semilla
Tab:AddButton({
    Name = "🎁 Simular Semilla Recibida",
    Callback = function()
        if selectedPack == "" or desiredSeed == "" then
            OrionLib:MakeNotification({
                Name = "⚠️ Error",
                Content = "Debes escribir ambos nombres.",
                Image = "rbxassetid://7733658504",
                Time = 4
            })
            return
        end

        local message = "Obtuviste '" .. desiredSeed .. "' desde el pack '" .. selectedPack .. "'"

        OrionLib:MakeNotification({
            Name = "🌟 Semilla Recibida",
            Content = message,
            Image = "rbxassetid://6023426915",
            Time = 5
        })

        print("[Simulado] " .. message)
    end
})

OrionLib:Init()
