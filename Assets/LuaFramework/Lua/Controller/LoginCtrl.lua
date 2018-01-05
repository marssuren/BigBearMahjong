LoginCtrl={}
local this=LoginCtrl

local gameObject
local transform
local message

local isTest=true


function LoginCtrl.New()
    return this
end

function LoginCtrl.Awake()
    panelMgr:CreatePanel(PanelNames.LoginPanel,this.OnCreate)
end
function LoginCtrl.Show()
    if nil==gameObject then
        this.Awake()			--无则加载
    else
        panelMgr:SetPanelActive(PanelNames.LoginPanel,true,this.OnEnable)	--有则显示
    end
end
function LoginCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.LoginPanel,false)
    end
end
function LoginCtrl.OnEnable()			--页面激活

end



function LoginCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    panel=gameObject:GetComponent('UIPanel')
    message=gameObject:GetComponent('LuaBehaviour')

    --绑定按钮点击事件
    message:AddClick(LoginPanel.LocalLoginBtn,this.OnLocalLoginBtnClick)
    message:AddClick(LoginPanel.WeChatLoginBtn,this.OnWeChatLoginBtnClick)
    message:AddToggleValueListener(LoginPanel.AgreementToggle,this.OnAgreementToggleValueChanged)
end
function LoginCtrl.OnLocalLoginBtnClick()       --"本地登录"按钮点击事件
    print("todo:LocalLoginBtnClick!")

    if isTest then
        this:Hide()
        local tHallCtrl=CtrlManager.GetCtrl(CtrlNames.Hall)
        tHallCtrl:Show()
    end


end
function LoginCtrl.OnWeChatLoginBtnClick()       --"微信登录"按钮点击事件
    print("todo:WeChatLoginBtnClick!")
end
function LoginCtrl.OnAgreementToggleValueChanged(_value)      --用户许可协议Toggle值变化事件
    if _value==true then

    end
end








