-- Nombre del archivo: CombatSystem.lua
local CombatSystem = {}
CombatSystem.__index = CombatSystem

function CombatSystem.new(character)
    local self = setmetatable({}, CombatSystem)
    self.Character = character
    self.CurrentCombo = 0
    local LastAttackTime = 0
    self.IsCooldown = false
    self.IsStunned = false
    return self
end

-- Ataque básico (Click Izquierdo / M1) al estilo TSB
function CombatSystem:PerformM1()
    if self.IsCooldown or self.IsStunned then return end
    
    self.CurrentCombo = self.CurrentCombo + 1
    print("M1 Ejecutado: Golpe " .. self.CurrentCombo)
    
    if self.CurrentCombo == 4 then
        print("¡GOLPE FINAL DE COMBO! Aplicando Ragdoll y empuje (Knockback).")
        self.CurrentCombo = 0
        self:ApplyCooldown(2.0) -- Cooldown largo por terminar el combo
    else
        -- Cooldown corto entre golpes normales
        self:ApplyCooldown(0.3)
    end
end

-- Activa habilidades especiales como las de JJS (Gojo, Sukuna, etc.)
function CombatSystem:UseSkill(skillName, cooldown)
    if self.IsCooldown or self.IsStunned then return end
    
    self.IsCooldown = true
    print("🔥 EJECUTANDO HABILIDAD: [" .. skillName .. "] 🔥")
    
    -- Simulación de efectos de la habilidad
    task.wait(0.5)
    print("[" .. skillName .. "] impactó el área. Destruyendo estructuras cercanas...")
    
    -- Espera del cooldown de la habilidad
    task.delay(cooldown, function()
        self.IsCooldown = false
        print("[" .. skillName .. "] ya está disponible de nuevo.")
    end)
end

function CombatSystem:ApplyCooldown(duration)
    self.IsCooldown = true
    task.delay(duration, function()
        self.IsCooldown = false
    end)
end

return CombatSystem
