AccountHandler={}
local this=AccountHandler




function AccountHandler:Process(_subCode,_value)
    print(_value)
    print(_subCode)
    if _subCode==SubCode.CreateRoom_ServerRes then
        print("Enter")
        this:OnCreateRoomRes(_value)
    end
end


function AccountHandler:OnCreateRoomRes(_value)       --创建房间的Response
    print(_value)
    GameModel:GetMatchRoomDto().RoomId=_value
    print(GameModel:GetMatchRoomDto().RoomId)
    GameManager:EnterRoom()
end