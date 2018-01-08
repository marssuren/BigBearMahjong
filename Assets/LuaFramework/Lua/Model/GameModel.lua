require "Model/PlayerDto"
require "Model/MatchRoomDto"
require "Class"

GameModel={}
local this=GameModel;        --客户端数据的存取类
local MyPlayerDto=nil;

local Dialect;              --方言类型
local MatchRoomDto=MatchRoomDto:new()           --当前匹配进入的房间


function GameModel:GetInstance()
    if nil==self.m_pInstance then
        self.m_pInstance=Class:new(GameModel)
    end
    return self.m_pInstance
end

function GameModel:GetMyPlayerDto()
    print(nil==MyPlayerDto)
    if MyPlayerDto == nil then
        MyPlayerDto=Class:new(PlayerDto)   --客户端用户数据
        print(nil==MyPlayerDto)
    end

    return this.MyPlayerDto
end
--function GameModel.GetPlayerDto(_playerId)      --获取房间内某个玩家的信息
--    return MatchRoomDto.PlayerDic[_playerId]
--end
function GameModel.GetRightPlayerId()
    return MatchRoomDto.RightPlayerId
end
function GameModel.Init( ... )                --初始化相关
    Dialect=DialectType.SuZhouDialect         --默认为苏州方言
end


--PlayerPrefs相关
function GameModel.GetString(_key,_defaultValue)
    return Util.GetString(_key,_defaultValue);
end
function GameModel.SetString(_key,_value)
    Util.SetString(_key,_value);
end




