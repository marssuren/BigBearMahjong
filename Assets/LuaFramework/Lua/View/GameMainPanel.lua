GameMainPanel={}
local this=GameMainPanel


local gameObject;
local transform

function GameMainPanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end
function GameMainPanel.InitPanel()
    this.MicphoneBtn=transform:Find("MicphoneBtn").gameObject       --获取麦克风按钮
    this.MessageBtn=transform:Find("MessageBtn").gameObject         --获取消息按钮

end

function GameMainPanel.Start()

end








