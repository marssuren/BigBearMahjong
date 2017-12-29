require "Common/define"

CreateRoomCtrl={}
local this=CreateRoomCtrl

local gameObject
local transform
local message



function CreateRoomCtrl.New()
    return this
end

function CreateRoomCtrl.Awake()
    panelMgr:CreatePanel('CreateRoom',this.OnCreate)
end

function CreateRoomCtrl.Show()            --显示面板
    if gameObject==nil then
        this.Awake();
    else
        panelMgr:SetPanelActive(PanelNames.CreateRoomPanel,true,this.OnEnable)
    end
end

function CreateRoomCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.CreateRoomPanel,false)
    end
end

function CreateRoomCtrl.OnEnable()

end

function CreateRoomCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")


    message:AddClick(CreateRoomPanel.MaskBtn,this.OnMaskBtnClick)   --绑定遮罩点击事件
    message:AddToggleValueListener(CreateRoomPanel.MixedMahjongToggle,this.OnMixedMahjongToggleValueChanged)
    --绑定花麻将Toggle监听事件
    message:AddToggleValueListener(CreateRoomPanel.HundredMatchMahjongToggle,this.OnHundredMatchMahjongToggleValueChanged)
    --绑定百搭麻将Toggle监听事件
    message:AddClick(CreateRoomPanel.CreateRoomBtn,this.OnCreateBtnClick)   --绑定"创建"按钮点击事件
end
function CreateRoomCtrl.OnMaskBtnClick()        --遮罩点击事件
    this.Hide()
end

function CreateRoomCtrl.OnMixedMahjongToggleValueChanged(_value)        --花麻将Toggle值变化事件
        CreateRoomPanel.MixedMahjongArea:SetActive(_value)
end
function CreateRoomCtrl.OnHundredMatchMahjongToggleValueChanged(_value) --百搭麻将Toggle值变化事件
        CreateRoomPanel.HundredMatchMahjongArea:SetActive(_value)
end
function CreateRoomCtrl.OnCreateBtnClick()          --"创建"按钮点击事件
    if CreateRoomPanel.MixedMahjongToggle:GetComponent("UIToggle").value then
        print("todo:创建花麻将房间")
    else if CreateRoomPanel.HundredMatchMahjongToggle:GetComponent("UIToggle").value then
        print("todo:创建百搭麻将房间")
        end
    end
end


