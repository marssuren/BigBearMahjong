MatchHandler={}
local this=MatchHandler




function MatchHandler:Process(_subCode,_value)
    print(_value)
    print(_subCode)
    local tRes=JsonDecode(_value)
    if _subCode==SubCode.EnterMatch_ServerRes then
        this:OnMatchServerRes(_value)
    end
    if _subCode==SubCode.OnEnterMatchServerBro then
        this:OnEnterMatchServerBro(_value)
    end
    if _subCode==SubCode.OnLeaveServerBro then
        this:OnLeaveServerBro(_value)
    end
    if _subCode==SubCode.OnReadyServerBro then
        this:OnReadyServerBro(tRes["uid"])
    end
    if _subCode==SubCode.OnStartServerBro then
        this:OnStartServerBro(_value)
    end
end
function MatchHandler:OnEnterMatchServerRes(_value)     --处理
    
end
function MatchHandler:OnEnterMatchServerBro(_value)     --处理有玩家准备广播
    local tPlayerId=JsonDecode(_value)["uid"]
    MatchRoomDto.Leave(tPlayerId)
end
function MatchHandler:OnLeaveServerBro(_value)          --处理有玩家离开广播

end
function MatchHandler:OnReadyServerBro(_playerId)      --处理有玩家准备广播
    MatchRoomDto:Ready(_playerId)
end
function MatchHandler:OnStartServerBro(_value)          --处理开始战斗广播
    --todo:玩家准备开始游戏
end