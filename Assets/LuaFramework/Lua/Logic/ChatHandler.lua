ChatHandler={}
local this=ChatHandler

function ChatHandler:Process(_subCode,_value)
    if _subCode==SubCode.Chat_ServerRes then

        local tPlayerId=JsonDecode(_value)["userid"]
        local tChatType=JsonDecode(_value)["chatType"]
    end
end