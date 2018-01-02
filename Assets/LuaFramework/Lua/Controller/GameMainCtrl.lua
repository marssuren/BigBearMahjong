GameMainCtrl={}
local this=GameMainCtrl

local gameObject;
local transform;
local message;


function GameMainCtrl.New( )
    return this
end
function GameMainCtrl.Awake( ... )
    panelMgr:CreatePanel('GameMain',this.OnCreate)
end
function GameMainCtrl.OnCreate( _gameObject )
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")

    --绑定按钮点击事件
    message:AddClick(GameMainPanel.MicphoneBtn,this.OnMicphoneBtnClick)
    message:AddClick(GameMainPanel.MessageBtn,this.OnMessageBtnClick)

end
function GameMainCtrl.Show()
	if nil==gameObject then
		this.Awake()			--无则加载
	else
		panelMgr:SetPanelActive(PanelNames.GameMainPanel,true,this.OnEnable)	--有则显示
	end

end

function GameMainCtrl.Hide()
	if nil~=gameObject then
		panelMgr:SetPanelActive(PanelNames.GameMainPanel,false)
	end
end

function GameMainCtrl.OnEnable()			--页面激活

end

function OnMicphoneBtnClick( ... )          --Micphone按钮点击事件
    print("todo:MicphoneBtnClick！")
end
function OnMessageBtnClick( ... )           --MessageBtn按钮点击事件
    print("todo:MessageBtnClick！")
end

















