LocalData={}
local this=LocalData;       --用来保存本地信息

local Dialect;              --方言类型


function LocalData.Init( ... )      --初始化相关
    Dialect=DialectType.SuZhouDialect         --默认为苏州方言
end


--PlayerPrefs相关
function LocalData.GetString(_key,_defaultValue)        
    return Util.GetString(_key,_defaultValue);
end
function LocalData.SetString(_key,_value)
    Util.SetString(_key,_value);
end




