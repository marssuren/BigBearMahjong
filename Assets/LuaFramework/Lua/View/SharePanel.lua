SharePanel={}
local this=SharePanel

local gameObject
local transform


function SharePanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()

end
function SharePanel.InitPanel()
    this.MaskBtn=transform:Find("MaskBtn").gameObject   --获取遮罩按钮
    this.CloseBtn=transform:Find("CloseBtn").gameObject --获取关闭按钮
    this.WeChatBtn=transform:Find("WeChatBtn").gameObject   --获取微信按钮
    this.WeChatMomentsBtn=transform:Find("WeChatMomentsBtn").gameObject --获取朋友圈按钮
end




