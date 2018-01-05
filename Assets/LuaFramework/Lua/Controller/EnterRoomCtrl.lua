EnterRoomCtrl={}
local this=EnterRoomCtrl


local gameObject
local transform
local message


local roomNumber=""       --房间号字符串
local roomNumberImgGroup={}    --房间号显示数组





function EnterRoomCtrl.New()
    return this
end


function EnterRoomCtrl.Awake()
    panelMgr:CreatePanel(PanelNames.EnterRoomPanel,this.OnCreate)
end

function EnterRoomCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")

    for i = 1, EnterRoomPanel.RoomNumberImg.childCount do
        roomNumberImgGroup[i]=EnterRoomPanel.RoomNumberImg:GetChild(i-1).gameObject:GetComponent("UISprite")
        --print(roomNumberTextGroup[i].text)
    end

    --绑定点击事件
    message:AddClick(EnterRoomPanel.MaskBtn,this.OnMaskBtnClick)        --绑定遮罩点击事件
    message:AddClick(EnterRoomPanel.CloseBtn,this.OnCloseBtnClick)       --绑定关闭按钮点击事件

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
function EnterRoomCtrl.OnDisable()
    clearNumber()
end
function EnterRoomCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.EnterRoomPanel,false,this.OnDisable)
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
    roomNumberImgGroup[#roomNumber+1].spriteName="output_".._gameObject.name
    roomNumberImgGroup[#roomNumber+1].gameObject:SetActive(true)
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
    print("DeleteBtnClick")
    if #roomNumber==0 then
        return
    else
        roomNumberImgGroup[#roomNumber].gameObject:SetActive(false)
        roomNumber=string.sub(roomNumber,1,-2)
    end
end
function EnterRoomCtrl.OnCloseBtnClick()        --关闭按钮点击事件
    this.Hide()
end

function EnterRoomCtrl.Enter()                  --进入房间
    print(roomNumber.."todo:进入房间！！！！")
end
function clearNumber()          --清除roomNumber和显示的文本
    if #roomNumber==0 then
        return
    else
        for i = 1, #roomNumberImgGroup do
            roomNumberImgGroup[i].gameObject:SetActive(false)
        end
        roomNumber=""
    end
end












