CombatStatus = {}
 
CombatStatus.name = "CombatStatus"
 
function CombatStatus:Initialize()
  self.inCombat = IsUnitInCombat("player")
 
  EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_COMBAT_STATE, self.OnPlayerCombatState)
end

function CombatStatus.OnPlayerCombatState(event, inCombat)
  if inCombat ~= CombatStatus.inCombat then
    CombatStatus.inCombat = inCombat
 
    if inCombat then
      d("You are in combat...")
    else
      d("Exited combat!")
    end
 
  end
end
 
function CombatStatus.OnAddOnLoaded(event, addonName)
  if addonName == CombatStatus.name then
    CombatStatus:Initialize()
  end
end
 
EVENT_MANAGER:RegisterForEvent(CombatStatus.name, EVENT_ADD_ON_LOADED, CombatStatus.OnAddOnLoaded)