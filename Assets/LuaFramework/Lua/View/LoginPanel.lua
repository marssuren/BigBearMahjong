LoginPanel={}
local this=LoginPanel

local gameObject
local transform
function LoginPanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end
function LoginPanel.InitPanel()
    this.LocalLoginBtn=transform:FindChild("LocalLoginBtn").gameObject           --获取"本地登录"按钮
    this.WeChatLoginBtn=transform:FindChild("WeChatLoginBtn").gameObject         --获取"微信登录"按钮
    this.AgreementToggle=transform:FindChild("AgreementToggle").gameObject       --获取用户协议Toggle
end



