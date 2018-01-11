RoomHandler={}
local this=RoomHandler


function RoomHandler:Process(_subCode,_value)
    print(_value)
    print(_subCode)
    if _subCode==SubCode.CreateRoom_ServerRes then
        print("CreateRoomResGet!!!")
        this:OnCreateRoomRes(_value)
    end
    if _subCode==SubCode.EnterRoom_SuccessServerRes then
        print("EnterRoomSuccessResGet!!!")
        this:OnEnterRoomSuccessRes(_value)
    end
    if _subCode==SubCode.EnterRoom_FailServerRes then
        print("EnterRoomFailResGet!!!")
        this:OnEnterRoomFailRes(_value)
    end
    if _subCode==SubCode.ExitRoom_ServerRes then
        print("ExitRoomResGet!!!")
        this:OnExitRoomRes(_value)
    end
end


function RoomHandler:OnCreateRoomRes(_value)       --处理创建房间的服务器响应
    local tRoomId=_value
    networkMgr:SendSocketMessage(OpCode.Room,SubCode.EnterRoom_ClientReq,tRoomId)

end
function RoomHandler:OnEnterRoomSuccessRes(_value)         --处理进入房间成功的服务器响应
    GameModel:GetMatchRoomDto().RoomId=_value
    GameManager:EnterRoom()
end
function RoomHandler:OnEnterRoomFailRes(_value)             --处理进入房间失败的服务器响应
    print(_value)
end
function RoomHandler:OnExitRoomRes(_value)          --处理退出房间的服务器响应
    GameModel:GetMatchRoomDto():RefreshData()
    GameModel:CancelReady()
    local tGameMainCtrl=CtrlManager.GetCtrl(CtrlNames.GameMain)
    tGameMainCtrl:RefreshUIInfo()
    tGameMainCtrl:Hide()
end