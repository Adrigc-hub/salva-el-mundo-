-- Nombre del archivo: main.lua

-- Importamos los módulos (Asumiendo que están en la misma carpeta)
local BuildingSystem = require(script.Parent.BuildingSystem)
local CombatSystem = require(script.Parent.CombatSystem)
local SkillBuilder = require(script.Parent.SkillBuilder)

print("--- INICIANDO SIMULACIÓN DEL JUEGO FUSIÓN ---")

-- 1. Configuramos el personaje con el Skill Builder expandido
local miBuild = SkillBuilder.new()
miBuild:EquipSkill(1, "Hollow Purple (JJS Gojo)")
miBuild:EquipSkill(2, "Dismantle (JJS Sukuna)")
miBuild:EquipSkill(3, "Consecutive Punches (TSB Saitama)")
miBuild:SelectModifiers("Energía Maldita Fluida (+10% velocidad de combos)", "Arquitecto Veloz (Edición instantánea)")
miBuild:PrintCurrentBuild()

-- 2. Iniciamos el combate
local pelea = CombatSystem.new("MiPersonaje")
pelea:PerformM1() -- Primer golpe
pelea:PerformM1() -- Segundo golpe
pelea:UseSkill(miBuild.Hotbar[1], 7) -- Activa la habilidad del Slot 1 (Hollow Purple)

-- 3. Entramos en modo construcción/edición de estructuras
local constructor = BuildingSystem.new("MiPersonaje")
local paredFalsa = { Name = "Pared de Metal (Nivel 3)" }

constructor:StartEditing(paredFalsa)
constructor:ToggleGridPiece(2, 2) -- Quita el centro de la cuadrícula para hacer una ventana
constructor:ConfirmEdit()
