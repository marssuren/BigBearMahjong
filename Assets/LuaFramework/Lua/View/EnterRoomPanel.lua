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
    this.MaskBtn=transform:Find("MaskBtn").gameObject

    this.NumberBtns=transform:Find("NumberTable/NumberBtns")
    this.RoomNumberText=transform:Find("RoomNumber/RoomNumberText")
    this.ClearAllBtn=transform:Find("NumberTable/ClearAllBtn").gameObject
    this.DeleteBtn=transform:Find("NumberTable/DeleteBtn").gameObject

end



















