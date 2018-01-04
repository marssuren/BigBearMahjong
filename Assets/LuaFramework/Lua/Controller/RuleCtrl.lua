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
    message:AddClick(RulePanel.CloseBtn,this.OnCloseBtnClick)
    message:AddToggleValueListener(RulePanel.ChangShuMahjongToggle,this.OnChangShuMahjongToggleValueChanged)
    message:AddToggleValueListener(RulePanel.HongZhongMahjongToggle,this.OnHongZhongMahjongToggleValueChanged)
end

function RuleCtrl.OnMaskBtnClick()              --Mask点击事件
    this.Hide()
end
function RuleCtrl.OnCloseBtnClick()             --关闭按钮点击事件
    this.Hide()
end
function RuleCtrl.OnChangShuMahjongToggleValueChanged(_value)     --"常熟麻将"值变化触发事件
    RulePanel.ChangShuMahjongRuleContent:SetActive(_value)

end
function RuleCtrl.OnHongZhongMahjongToggleValueChanged(_value)    --"红中麻将"值变化触发事件
    RulePanel.HongZhongMahjongRuleContent:SetActive(_value)
end




