MatchRoomDto={}


RoomId=""
PlayerDic={}                      --房间内所有用户的Dic
ReadyPlayerIdList={}              --房间内准备了的用户的Id的List
PlayerIdList={}                   --房间内所有的用户的Id的List
LeftPlayerId=""              --位于当前客户端玩家的左边的玩家的Id
RighPlayertId =""            --位于当前客户端玩家的右边的玩家的Id
OppsitePlayerId =""          --位于当前客户端玩家的对面的玩家的Id


function MatchRoomDto:new(_o)
    _o = _o or {}
    setmetatable(_o, self)
    self.__index = self
    return _o
end

function MatchRoomDto.RefreshData()
    RoomId=""
    LeftPlayerId=""
    RighPlayertId =""
    OppsitePlayerId =""
end

function MatchRoomDto.Add(_newPlayer)               --房间新入玩家

end
function MatchRoomDto.Leave(_playerId)              --房间有玩家离开
    
end
function MatchRoomDto.Ready(_playerId)              --房间有玩家准备
    
end
function MatchRoomDto.ResetPosition(_myPlayerId)    --重置玩家位置
    
end


