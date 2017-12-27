RuleCtrl={}
local this=RuleCtrl

local gameObject
local transform
local message
local panel



function RuleCtrl.New()
    return this
end
function RuleCtrl.Awake()
        panelMgr:CreatePanel('Rule',this.OnCreate)
end

function RuleCtrl.Show()            --显示面板
    if gameObject==nil then
        this.Awake();
    else
        panelMgr:SetPanelActive(PanelNames.RulePanel,true,this.OnEnable)
    end
end

function RuleCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.RulePanel,false)
    end
end

function RuleCtrl.OnEnable()
    
end


function RuleCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    local panel=gameObject:GetComponent('UIPanel')

    message=gameObject:GetComponent("LuaBehaviour")

    --绑定按钮点击事件
    message:AddClick(RulePanel.MaskBtn,this.OnMaskBtnClick)
end

function RuleCtrl.OnMaskBtnClick()              --Mask点击事件
    this.Hide()
end
function RuleCtrl.ChangeShow(_isShow)           --改变显示
    print(nil==this.panel)
    gameObject:SetActive(_isShow)
end




