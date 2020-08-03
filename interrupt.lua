local interruptFrame = CreateFrame("Frame", nil, UIParent);
interruptFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
local function interruptEvent(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, eventType, _, sourceGUID, sourceName,
        sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, _,
        spellID, spellName, _, extraskillID, extraSkillName = CombatLogGetCurrentEventInfo()
        if eventType == "SPELL_INTERRUPT" and sourceName == UnitName("player") then
            SendChatMessage("interrupt >> "..destName..GetSpellLink(extraskillID), "SAY")
            SendChatMessage("interrupt >> "..destName..GetSpellLink(extraskillID), "YELL")
        end
    end
end
interruptFrame:SetScript("OnEvent", interruptEvent);