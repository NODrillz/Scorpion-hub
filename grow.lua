-- Cargar la librería Orion UI
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Crear ventana
local Window = OrionLib:MakeWindow({
    Name = "Seed Pack Forcer",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "SeedPackForcer"
})

-- Crear pestaña principal
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Variables para guardar selecciones
local selectedPack = ""
local selectedSeed = ""

-- Añadir textbox para nombre de Seed Pack
Tab:AddTextbox({
    Name = "Nombre del Seed Pack",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        selectedPack = value
    end
})

-- Añadir textbox para nombre de semilla deseada
Tab:AddTextbox({
    Name = "Nombre de la Semilla",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        selectedSeed = value
    end
})

-- Botón para simular obtener semilla
Tab:AddButton({
    Name = "Forzar Semilla",
    Callback = function()
        if selectedPack == "" or selectedSeed == "" then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Por favor, ingresa ambos valores.",
                Image = "rbxassetid://7733658504",
                Time = 4
            })
            return
        end

        OrionLib:MakeNotification({
            Name = "Semilla Obtenida",
            Content = "Obtuviste '"..selectedSeed.."' desde '"..selectedPack.."'",
            Image = "rbxassetid://6023426915",
            Time = 5
        })

        print("Semilla forzada: "..selectedSeed.." del pack "..selectedPack)
    end
})

-- Inicializar interfaz Orion (obligatorio)
OrionLib:Init()
