require "Class"
PlayerDto={}                --玩家信息类
function PlayerDto:new(_o)
    _o = _o  or {}
    setmetatable(_o,self)
    self.__index=self
    return _o
end

local Id;
local Name;
IsReady=false;              --是否准备





