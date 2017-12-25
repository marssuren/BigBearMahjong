RuleCtrl={}
local this=RuleCtrl

local gameObject
local transform
local message
function RuleCtrl.New()
    return this
end
function RuleCtrl.Awake()
    if gameObject==nil then
        panelMgr:CreatePanel('Rule',this.OnCreate)
    else
        this.ChangeShow(true)
    end
end

function RuleCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")

    --绑定按钮点击事件
    message:AddClick(RulePanel.MaskBtn,this.OnMaskBtnClick)
end

function RuleCtrl.OnMaskBtnClick()              --Mask点击事件
    gameObject:SetActive(false)
end
function RuleCtrl.ChangeShow(_isShow)           --改变显示
    gameObject:SetActive(_isShow)
end




