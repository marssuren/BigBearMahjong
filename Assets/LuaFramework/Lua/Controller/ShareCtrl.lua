ShareCtrl={}
local this=ShareCtrl

local gameObject
local transform
local message

function ShareCtrl.New()
    return this
end
function ShareCtrl.Awake()
    panelMgr:CreatePanel("Share",this.OnCreate)
end
function ShareCtrl.Show()            --显示面板
    if gameObject==nil then
        this.Awake();
    else
        panelMgr:SetPanelActive(PanelNames.SharePanel,true,this.OnEnable)
    end
end
function ShareCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.SharePanel,false)
    end
end
function RuleCtrl.OnEnable()

end
function ShareCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent('LuaBehaviour')

    --绑定按钮点击事件
    message:AddClick(SharePanel.MaskBtn,this.OnMaskBtnClick)
    message:AddClick(SharePanel.CloseBtn,this.OnCloseBtnClick)
    message:AddClick(SharePanel.WeChatBtn,this.OnWeChatBtnClick)
    message:AddClick(SharePanel.WeChatMomentsBtn,this.OnWeChatMomentsBtnClick)
end


function ShareCtrl.OnMaskBtnClick()     --遮罩按钮点击事件
    this.Hide()
end
function ShareCtrl.OnCloseBtnClick()    --关闭按钮点击事件
    print("CloseBtnClick")
    this.Hide()
end
function ShareCtrl.OnWeChatBtnClick()   --"微信"按钮点击事件
    print("todo:WeChatBtnClick!!!")
end
function ShareCtrl.OnWeChatMomentsBtnClick()  --"朋友圈"按钮点击事件
    print("todo:WeChatMomentsBtnClick!!!")
end






