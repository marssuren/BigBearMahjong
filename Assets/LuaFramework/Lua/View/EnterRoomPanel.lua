EnterRoomPanel={}
local this=EnterRoomPanel

local gameObject
local transform



function EnterRoomPanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end


function EnterRoomPanel.InitPanel()
    this.MaskBtn=transform:Find("MaskBtn").gameObject                   --获取遮罩

    this.NumberBtns=transform:Find("NumberTable/NumberBtns")            --获取数字按键父物体
    this.RoomNumberText=transform:Find("RoomNumber/RoomNumberText")     --获取房间号文本
    this.ClearAllBtn=transform:Find("NumberTable/ClearAllBtn").gameObject   --获取"重输"按钮
    this.DeleteBtn=transform:Find("NumberTable/DeleteBtn").gameObject   --获取"删除"按钮

end



















