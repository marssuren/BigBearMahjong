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
    this.MixedMahjongToggle=transform:Find("MixedMahjong/MixedMahjongToggle").gameObject  --获取花麻将Toggle
    this.MixedMahjongArea=transform:Find("MixedMahjong/MixedMahjongArea").gameObject      --获取花麻将选择区域

    this.HundredMatchMahjongToggle=transform:Find("HundredMatchMahjong/HundredMatchMahjongToggle").gameObject
    --获取百搭麻将Toggle
    this.HundredMatchMahjongArea=transform:Find("HundredMatchMahjong/HundredMatchMahjongArea").gameObject
    --获取百搭麻将选择区域

    this.CreateRoomBtn=transform:Find("CreateRoomBtn").gameObject   --获取"创建"按钮

end






