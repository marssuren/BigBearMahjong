EnterRoomCtrl={}
local this=EnterRoomCtrl


local gameObject
local transform
local message


local roomNumber=""       --房间号字符串
local roomNumberTextGroup={}    --房间号显示数组





function EnterRoomCtrl.New()
    return this
end


function EnterRoomCtrl.Awake()
    panelMgr:CreatePanel('EnterRoom',this.OnCreate)
end

function EnterRoomCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")

    for i = 1, EnterRoomPanel.RoomNumberText.childCount do
        roomNumberTextGroup[i]=EnterRoomPanel.RoomNumberText:GetChild(i-1).gameObject:GetComponent("UILabel")
        --print(roomNumberTextGroup[i].text)
    end

    --绑定点击事件
    message:AddClick(EnterRoomPanel.MaskBtn,this.OnMaskBtnClick)        --绑定遮罩点击事件
    for i = 1, EnterRoomPanel.NumberBtns.childCount do
        message:AddClick(EnterRoomPanel.NumberBtns:GetChild(i-1).gameObject,this.OnNumbersBtnClick)  --绑定数字按钮点击事件
    end
    message:AddClick(EnterRoomPanel.ClearAllBtn,this.OnClearAllBtnClick)    --绑定"重输"按钮点击事件
    message:AddClick(EnterRoomPanel.DeleteBtn,this.OnDeleteBtnClick)        --绑定"删除"按钮点击事件


end

function EnterRoomCtrl.OnEnable()

end

function EnterRoomCtrl.OnMaskBtnClick()     --遮罩按钮点击事件
    this.Hide()
end
function EnterRoomCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.EnterRoomPanel,false)
    end
end
function EnterRoomCtrl.Show()            --显示面板
    if gameObject==nil then
        this.Awake();
    else
        panelMgr:SetPanelActive(PanelNames.EnterRoomPanel,true,this.OnEnable)
    end
end

function EnterRoomCtrl.OnNumbersBtnClick(_gameObject)      --数字按钮点击事件
    roomNumberTextGroup[#roomNumber+1].text=_gameObject.name
    roomNumber=roomNumber.._gameObject.name
    if #roomNumber==6 then
        this.Enter()
        clearNumber()
    end
end

function EnterRoomCtrl.OnClearAllBtnClick()      --“重输”按钮点击事件
    clearNumber()
end
function EnterRoomCtrl.OnDeleteBtnClick()      --“删除”按钮点击事件
    if #roomNumber==0 then
        return
    else
        roomNumberTextGroup[#roomNumber].text=""
        roomNumber=string.sub(roomNumber,1,-2)
    end
end

function EnterRoomCtrl.Enter()                  --进入房间
    print(roomNumber.."todo:进入房间！！！！")
end
function clearNumber()          --清除roomNumber和显示的文本
    if #roomNumber==0 then
        return
    else
        for i = 1, #roomNumberTextGroup do
            roomNumberTextGroup[i].text=""
        end
        roomNumber=""
    end
end












