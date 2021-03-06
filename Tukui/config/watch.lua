--[[
		This file is for adding of deleting a spellID for a specific encounter on Grid layout
		or enemy cooldown in Arena displayed on screen.
		
		The best way to add or delete spell is to go at www.wowhead.com, search for a spell :
		Example : Incinerate Flesh from Lord Jaraxxus -> http://www.wowhead.com/?spell=67049
		Take the number ID at the end of the URL, and add it to the list
		
		That's it, That's all! 
		
		Tukz
]]-- 

--------------------------------------------------------------------------------------------
-- Spells that should be shown with an icon in the middle of the screen when not buffed.
--------------------------------------------------------------------------------------------

TukuiDB.remindbuffs = {
	PRIEST = {
		588, -- inner fire
		73413, -- inner will
	},
	HUNTER = {
		13165, -- hawk
		5118, -- cheetah
		13159, -- pack
		20043, -- wild
		82661, -- fox
	},
	MAGE = {
		7302, -- frost armor
		6117, -- mage armor
		30482, -- molten armor
	},
	WARLOCK = {
		28176, -- fel armor
		687, -- demon armor
	},
	SHAMAN = {
		52127, -- water shield
		324, -- lightning shield
		974, -- earth shield
	},
	WARRIOR = {
		469, -- commanding Shout
		6673, -- battle Shout
	},
	DEATHKNIGHT = {
		57330, -- horn of Winter
		31634, -- strength of earth totem
		6673, -- battle Shout
		93435, -- roar of courage (hunter pet)
	},
}

--------------------------------------------------------------------------------------------
-- the interrupt spellIDs to track on screen in arena.
--------------------------------------------------------------------------------------------

if TukuiCF["pvp"].interrupt == true then
	TukuiDB.interrupt = {
		[1766] = 10, -- kick
		[6552] = 10, -- pummel
		[2139] = 24, -- counterspell
		[19647] = 24, -- spell lock
		[34322] = 27, -- fear priest
		[47476] = 120, -- strangulate
		[47528] = 10, -- mindfreeze
		[57994] = 6, -- wind shear
		[72] = 12, -- shield bash
		[15487] = 45, -- silence priest
		[34490] = 20, -- silencing shot
		[85285] = 10, -- rebuke
		[80964] = 10, -- feral skull bash (cat)
		[80965] = 10, -- feral skull bash (bear)
	}
end

--------------------------------------------------------------------------------------------
-- New Aurawatch by Foof
--------------------------------------------------------------------------------------------

if TukuiCF["unitframes"].raidunitdebuffwatch == true then
	-- Classbuffs { spell ID, position [, {r,g,b,a}][, anyUnit] }
	-- For oUF_AuraWatch
	do
		TukuiDB.buffids = {
			PRIEST = {
				{6788, "TOPLEFT", {1, 0, 0}, true}, -- Weakened Soul
				{33076, "TOPRIGHT", {0.2, 0.7, 0.2}}, -- Prayer of Mending
				{139, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, -- Renew
				{17, "BOTTOMRIGHT", {0.81, 0.85, 0.1}, true}, -- Power Word: Shield
			},
			DRUID = {
				{774, "TOPLEFT", {0.8, 0.4, 0.8}}, -- Rejuvenation
				{8936, "TOPRIGHT", {0.2, 0.8, 0.2}}, -- Regrowth
				{33763, "BOTTOMLEFT", {0.4, 0.8, 0.2}}, -- Lifebloom
				{48438, "BOTTOMRIGHT", {0.8, 0.4, 0}}, -- Wild Growth
			},
			PALADIN = {
				{53563, "TOPLEFT", {0.7, 0.3, 0.7}}, -- Beacon of Light
			},
			SHAMAN = {
				{61295, "TOPLEFT", {0.7, 0.3, 0.7}}, -- Riptide 
				{51945, "TOPRIGHT", {0.2, 0.7, 0.2}}, -- Earthliving
				{16177, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, -- Ancestral Fortitude
				{974, "BOTTOMRIGHT", {0.7, 0.4, 0}, true}, -- Earth Shield
			},
			ALL = {
				{14253, "RIGHT", {0, 1, 0}}, -- Abolish Poison
				{23333, "LEFT", {1, 0, 0}}, -- Warsong flag xD
			},
		}
	end
	-- Raid debuffs (now using it with oUF_RaidDebuff instead of oUF_Aurawatch)
	do
		local _, ns = ...
		local ORD = ns.oUF_RaidDebuffs or oUF_RaidDebuffs

		if not ORD then return end
		
		ORD.ShowDispelableDebuff = true
		ORD.FilterDispellableDebuff = true
		ORD.MatchBySpellName = false

		TukuiDB.debuffids = {
			-- Other debuff
			67479, -- Impale
			
			--CATA DEBUFFS
		--Baradin Hold
			95173, -- Consuming Darkness
			
		--Blackwing Descent
			--Magmaw
			91911, -- Constricting Chains
			94679, -- Parasitic Infection
			94617, -- Mangle
			
			--Omintron Defense System
			79835, --Poison Soaked Shell	
			91433, --Lightning Conductor
			91521, --Incineration Security Measure
			
			--Maloriak
			77699, -- Flash Freeze
			77760, -- Biting Chill
			
			--Atramedes
			92423, -- Searing Flame
			92485, -- Roaring Flame
			92407, -- Sonic Breath
			
			--Chimaeron
			82881, -- Break
			89084, -- Low Health
			
			--Nefarian
			
		--The Bastion of Twilight
			--Valiona & Theralion
			92878, -- Blackout
			86840, -- Devouring Flames
			95639, -- Engulfing Magic
			
			--Halfus Wyrmbreaker
			39171, -- Malevolent Strikes
			
			--Twilight Ascendant Council
			92511, -- Hydro Lance
			82762, -- Waterlogged
			92505, -- Frozen
			92518, -- Flame Torrent
			83099, -- Lightning Rod
			92075, -- Gravity Core
			92488, -- Gravity Crush
			
			--Cho'gall
			86028, -- Cho's Blast
			86029, -- Gall's Blast
			
		--Throne of the Four Winds
			--Conclave of Wind
				--Nezir <Lord of the North Wind>
				93131, --Ice Patch
				--Anshal <Lord of the West Wind>
				86206, --Soothing Breeze
				93122, --Toxic Spores
				--Rohash <Lord of the East Wind>
				93058, --Slicing Gale 
			--Al'Akir
			93260, -- Ice Storm
			93295, -- Lightning Rod
		}
		
		ORD:RegisterDebuffs(TukuiDB.debuffids)
	end
end
