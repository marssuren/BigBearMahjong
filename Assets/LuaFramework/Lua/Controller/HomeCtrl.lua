

HomeCtrl={}
local this=HomeCtrl

local gameObject
local transform
local message
local panel

function HomeCtrl.New()
	return this
end

function HomeCtrl.Awake()
	panelMgr:CreatePanel('Home',this.OnCreate)
end

function HomeCtrl.OnCreate(_gameObject)
	gameObject=_gameObject
	transform=_gameObject.transform
	panel=gameObject:GetComponent('UIPanel')

	message=gameObject:GetComponent('LuaBehaviour')

	--绑定按钮点击事件
	message:AddClick(HomePanel.CreateRoomBtn,this.OnCreateRoomBtnClick)
	message:AddClick(HomePanel.EnterRoomBtn,this.OnEnterRoomBtnClick)
	message:AddClick(HomePanel.RuleBtn,this.OnRuleBtnClick)
	message:AddClick(HomePanel.SettingBtn,this.OnConfigBtnClick)
end

function HomeCtrl.Show()
	if nil==gameObject then
		this.Awake()			--无则加载
	else
		panelMgr:SetPanelActive(PanelNames.HomePanel,true,this.OnEnable)	--有则显示
	end

end

function HomeCtrl.Hide()
	if nil~=gameObject then
		panelMgr:SetPanelActive(PanelNames.HomePanel,false)
	end
end

function HomeCtrl.OnEnable()			--页面激活

end



function HomeCtrl.OnCreateRoomBtnClick(_gameObject)		--"创建房间"按钮点击事件
	--print("todo:CreateRoomBtnClick!!!")
	local tCreateCtrl=CtrlManager.GetCtrl(CtrlNames.CreateRoom)
	tCreateCtrl:Show()
end

function HomeCtrl.OnEnterRoomBtnClick(_gameObject)		--"进入房间"按钮点击事件
	print("todo:EnterRoomBtnClick!!!")
end

function HomeCtrl.OnRuleBtnClick(_gameObject)			--"规则"按钮点击事件
	--print("RuleBtnClick!!!")
	local tRuleCtrl=CtrlManager.GetCtrl(CtrlNames.Rule)
	tRuleCtrl:Show()
end

function HomeCtrl.OnConfigBtnClick(_gameObject)			--"设置"按钮点击事件
	--print("ConfigBtnClick!!!")
	local tConfigCtrl=CtrlManager.GetCtrl(CtrlNames.Config)
	tConfigCtrl:Show()
end




















