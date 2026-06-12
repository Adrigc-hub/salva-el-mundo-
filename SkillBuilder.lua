-- Nombre del archivo: SkillBuilder.lua
local SkillBuilder = {}
SkillBuilder.__index = SkillBuilder

function SkillBuilder.new()
    local self = setmetatable({}, SkillBuilder)
    -- Slots del 1 al 4 tradicionales de TSB
    self.Hotbar = {
        [1] = nil,
        [2] = nil,
        [3] = nil,
        [4] = nil
    }
    -- "Más cosas": Espacios para añadir pasivas o ventajas de Fortnite Salvar al Mundo
    self.EquippedPassive = "Ninguna"
    self.BuildingBuff = "Ninguno"
    return self
end

-- Equipa una habilidad de TSB/JJS en un slot de la barra
function SkillBuilder:EquipSkill(slot, skillName)
    if slot >= 1 and slot <= 4 then
        self.Hotbar[slot] = skillName
        print("Habilidad '" .. skillName .. "' asignada al Slot " .. slot)
    else
        print("Slot inválido. Elige del 1 al 4.")
    end
end

-- Asigna una ventaja pasiva (Mejora el combate de JJS o la edición de STW)
function SkillBuilder:SelectModifiers(passiveName, buildingBuffName)
    self.EquippedPassive = passiveName
    self.BuildingBuff = buildingBuffName
    print("Modificadores guardados con éxito.")
end

-- Muestra en consola cómo quedó configurado tu personaje
function SkillBuilder:PrintCurrentBuild()
    print("\n=== TU SKILL BUILDER ===")
    for i = 1, 4 do
        print("Slot " .. i .. ": " .. (self.Hotbar[i] or "Vacío"))
    end
    print("Pasiva de Combate: " .. self.EquippedPassive)
    print("Mejora de Construcción: " .. self.BuildingBuff)
    print("========================\n")
end

return SkillBuilder
