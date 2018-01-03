

HallCtrl={}
local this=HallCtrl

local gameObject
local transform
local message
local panel

function HallCtrl.New()
	return this
end

function HallCtrl.Awake()
	panelMgr:CreatePanel('Hall',this.OnCreate)
end

function HallCtrl.OnCreate(_gameObject)
	gameObject=_gameObject
	transform=_gameObject.transform
	panel=gameObject:GetComponent('UIPanel')

	message=gameObject:GetComponent('LuaBehaviour')

	--绑定按钮点击事件
	message:AddClick(HallPanel.CreateRoomBtn,this.OnCreateRoomBtnClick)
	message:AddClick(HallPanel.EnterRoomBtn,this.OnEnterRoomBtnClick)
	message:AddClick(HallPanel.RuleBtn,this.OnRuleBtnClick)
	message:AddClick(HallPanel.SettingBtn,this.OnConfigBtnClick)
	message:AddClick(HallPanel.AddRoomCardBtn,this.OnAddRoomCardBtnClick)
end

function HallCtrl.Show()
	if nil==gameObject then
		this.Awake()			--无则加载
	else
		panelMgr:SetPanelActive(PanelNames.HomePanel,true,this.OnEnable)	--有则显示
	end

end

function HallCtrl.Hide()
	if nil~=gameObject then
		panelMgr:SetPanelActive(PanelNames.HomePanel,false)
	end
end

function HallCtrl.OnEnable()			--页面激活

end

function HallCtrl.OnCreateRoomBtnClick(_gameObject)		--"创建房间"按钮点击事件
	--print("todo:CreateRoomBtnClick!!!")
	local tCreateCtrl=CtrlManager.GetCtrl(CtrlNames.CreateRoom)
	tCreateCtrl:Show()
end

function HallCtrl.OnEnterRoomBtnClick(_gameObject)		--"进入房间"按钮点击事件
	--print("todo:EnterRoomBtnClick!!!")
	local tEnterRoomCtrl=CtrlManager.GetCtrl(CtrlNames.EnterRoom)
	tEnterRoomCtrl:Show()
end

function HallCtrl.OnRuleBtnClick(_gameObject)			--"规则"按钮点击事件
	--print("RuleBtnClick!!!")
	local tRuleCtrl=CtrlManager.GetCtrl(CtrlNames.Rule)
	tRuleCtrl:Show()
end

function HallCtrl.OnConfigBtnClick(_gameObject)			--"设置"按钮点击事件
	--print("ConfigBtnClick!!!")
	local tConfigCtrl=CtrlManager.GetCtrl(CtrlNames.Config)
	tConfigCtrl:Show()
end
function HallCtrl.OnAddRoomCardBtnClick(_gameObject)		--增加房卡按钮点击事件
	--print("AddRoomCardBtnClick!!!")
	local tStoreCtrl = CtrlManager.GetCtrl(CtrlNames.Store)
	tStoreCtrl:Show()
end 





















