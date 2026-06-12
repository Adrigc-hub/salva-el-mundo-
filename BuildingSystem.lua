-- Nombre del archivo: BuildingSystem.lua
local BuildingSystem = {}
BuildingSystem.__index = BuildingSystem

function BuildingSystem.new(player)
    local self = setmetatable({}, BuildingSystem)
    self.Player = player
    self.CurrentStructure = nil
    self.EditGrid = {} -- Cuadrícula de 3x3 para edición estilo Fortnite
    return self
end

-- Inicia el modo edición en una pared/rampa
function BuildingSystem:StartEditing(structure)
    self.CurrentStructure = structure
    table.clear(self.EditGrid)
    
    -- Inicializa una cuadrícula de 3x3 (todas las piezas activas)
    for row = 1, 3 do
        self.EditGrid[row] = {}
        for col = 1, 3 do
            self.EditGrid[row][col] = true -- true significa "bloque sólido"
        end
    end
    print("Modo edición activado para: " .. structure.Name)
end

-- Simula quitar un cuadrado de la edición (ej. para hacer una puerta o ventana)
function BuildingSystem:ToggleGridPiece(row, col)
    if self.EditGrid[row] and self.EditGrid[row][col] ~= nil then
        self.EditGrid[row][col] = not self.EditGrid[row][col]
        print("Casilla [" .. row .. "][" .. col .. "] cambiada. Sólida: " .. tostring(self.EditGrid[row][col]))
    end
end

-- Aplica los cambios a la estructura en el juego
function BuildingSystem:ConfirmEdit()
    if not self.CurrentStructure then return end
    
    print("Confirmando edición... Modificando geometría de la pared.")
    -- Aquí se aplicarían los cambios visuales transparentando los bloques desactivados (false)
    self.CurrentStructure = nil
end

return BuildingSystem
