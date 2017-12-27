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


    message:AddClick(CreateRoomPanel.MaskBtn,this.OnMaskBtnClick)

end
function CreateRoomCtrl.OnMaskBtnClick()
    this.Hide()
end