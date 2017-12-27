CreateRoomPanel={}
local this=CreateRoomPanel

local gameObject
local transform


function CreateRoomPanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end

function CreateRoomPanel.InitPanel()
    this.MaskBtn=transform:Find("MaskBtn").gameObject
end







