local WHISPER_FRAME = CreateFrame("Frame", "whisper", UIParent)
WHISPER_FRAME:RegisterEvent("CHAT_MSG_WHISPER")
WHISPER_FRAME:SetScript("OnEvent", function(self,event,arg1,arg2)
    if arg1 == "tzznb" and arg2 ~= UnitName("player") then
        InviteUnit(arg2)
        SendChatMessage("已收到消息~ 邀请进组中", "WHISPER", "common", UnitName(arg2))
    end
end)