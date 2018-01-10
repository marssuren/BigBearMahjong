AccountHandler={}
local this=AccountHandler

function AccountHandler.Process(_subCode,_value)
    if _subCode==MyProtocal.CreateRoom_ServerRes then
        
    end
end


function AccountHandler.OnCreateRoomRes()       --创建房间的Response
    print(_value)
    GameModel:GetMatchRoomDto().RoomId=_value
    print(GameModel:GetMatchRoomDto().RoomId)
end