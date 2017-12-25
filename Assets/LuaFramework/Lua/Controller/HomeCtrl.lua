HomeCtrl={}
local this=HomeCtrl

local gameObject
local transform
local message

function HomeCtrl.New()
	return this
end

function HomeCtrl.Awake()
	panelMgr:CreatePanel('Home',this.OnCreate)
end

function HomeCtrl.OnCreate(_gameObject)
	gameObject=_gameObject
	transform=_gameObject.transform
	local panel=gameObject:GetComponent('UIPanel')
	
	message=gameObject:GetComponent('LuaBehaviour')

	--绑定按钮点击事件
	message:AddClick(HomePanel.CreateRoomBtn,this.OnCreateRoomBtnClick)
	message:AddClick(HomePanel.EnterRoomBtn,this.OnEnterRoomBtnClick)
	message:AddClick(HomePanel.RuleBtn,this.OnRuleBtnClick)
	message:AddClick(HomePanel.SettingBtn,this.OnSettingBtnClick)
end

function HomeCtrl.OnCreateRoomBtnClick(_gameObject)		--"创建房间"按钮点击事件
	print("CreateRoomBtnClick!!!")
	--this:Close()
end
function HomeCtrl.OnEnterRoomBtnClick(_gameObject)		--"进入房间"按钮点击事件
	print("EnterRoomBtnClick!!!")
end
function HomeCtrl.OnRuleBtnClick(_gameObject)			--"规则"按钮点击事件
	print("RuleBtnClick!!!")
	local tRuleCtrl=CtrlManager.GetCtrl(CtrlNames.Rule)
	if tRuleCtrl.gameObject==nil then
		print("!!!!!")
		tRuleCtrl:Awake()
	end
end
function HomeCtrl.OnSettingBtnClick(_gameObject)		--"设置"按钮点击事件
	print("SettingBtnClick!!!")
end




function HomeCtrl.Close()
	gameObject:SetActive(false)
end


















